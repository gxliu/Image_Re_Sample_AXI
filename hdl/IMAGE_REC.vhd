--先判断颜�?
--将最大x/y，最小x/y放入集合
--判断xmax-xmin和ymax-ymin是否在范围内


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_unsigned.all;

entity IMAGE_REC is
generic
	(
	    constant data_delay:integer:=2;
		constant row_max:integer:=240;
		constant col_max:integer:=180;
		constant row_max_bit:integer:=8;
		constant col_max_bit:integer:=8;
		constant addr_width:integer:=16;
		
		constant y_r_max:integer:=255;
		constant y_g_max:integer:=255;
		constant y_b_max:integer:=50;
		constant y_r_min:integer:=230;
		constant y_g_min:integer:=230;
		constant y_b_min:integer:=0;
		
		constant g_r_max:integer:=50;
		constant g_g_max:integer:=255;
		constant g_b_max:integer:=50;
		constant g_r_min:integer:=0;
		constant g_g_min:integer:=230;
		constant g_b_min:integer:=0;
		
		constant b_r_max:integer:=50;
		constant b_g_max:integer:=50;
		constant b_b_max:integer:=255;
		constant b_r_min:integer:=0;
		constant b_g_min:integer:=0;
		constant b_b_min:integer:=230;
		
		constant diff_max:integer:=50;
		constant diff_min:integer:=30;
		
		constant RE_YES:std_logic_vector(15 downto 0):=x"0001";
		constant RE_NO:std_logic_vector(15 downto 0):=x"0002";
		constant RE_WAIT:std_logic_vector(15 downto 0):=x"0003"
		
	);
port
	(
		inclk:in std_logic;
		start:in std_logic:='0';
		--from row_max and col_max--
		addr:out std_logic_vector(addr_width-1 downto 0);
		rgb24:in std_logic_vector(23 downto 0);
		--result is for 32bits axi-bus--
		--high 16bits->yes/no;low 3bits->y/g/b->yes/no--
		re_all:out std_logic_vector(31 downto 0):=x"00000000";
		--for yellow ball's center x(high 16bits)/y(low 16bits)--
		re_yellow:out std_logic_vector(31 downto 0):=x"00000000";
		--for green ball's center x(high 16bits)/y(low 16bits)--
		re_green:out std_logic_vector(31 downto 0):=x"00000000";
		--for blue ball's center x(high 16bits)/y(low 16bits)--
		re_blue:out std_logic_vector(31 downto 0):=x"00000000";
		fin:out std_logic:='0';
		
		--rwo and col now--
		--col--
		HCNT:out std_logic_vector(col_max_bit-1 downto 0);
        --row--
        VCNT:out std_logic_vector(row_max_bit-1 downto 0)
	);
end entity;

architecture im of IMAGE_REC is

type max_min is array(1 downto 0) of integer; 

signal start_last,re_allow,res_allow:std_logic:='0';
signal r,g,b:std_logic_vector(7 downto 0);
signal addr_s:std_logic_vector(addr_width-1 downto 0);

signal y_c,g_c,b_c:max_min:=(0,col_max);
signal y_r,g_r,b_r:max_min:=(0,row_max);
signal y_fin,g_fin,b_fin:std_logic:='0';
signal y_in,g_in,b_in:std_logic:='0';

signal con_re:integer range 0 to data_delay+1:=0;
signal con_row:integer range 0 to row_max-1:=0;
signal con_col:integer range 0 to col_max-1:=0;

begin

VCNT<=conv_std_logic_vector(con_row,row_max_bit);
HCNT<=conv_std_logic_vector(con_col,col_max_bit);
	
addr<=addr_s;
r<=rgb24(23 downto 16);
g<=rgb24(15 downto 8);
b<=rgb24(7 downto 0);	

State:process(inclk)

begin
	
	if rising_edge(inclk) then
		
		start_last<=start;
		if start='1' and start_last='0' then
			re_all(31 downto 16)<=RE_WAIT;
			re_all(15 downto 0)<=x"0000";
			con_row<=0;
			con_col<=0;
			con_re<=0;
			re_allow<='1';
			res_allow<='0';
			fin<='0';
			addr_s<=conv_std_logic_vector(0,addr_width);
		else
			
			case res_allow is
				when '1'=>
					if (y_fin='1' and g_fin='1' and b_fin='1') then
						if (y_in='0' and g_in='0' and b_in='0') then
							re_all(31 downto 16)<=RE_NO;
						else
							if y_in='1' then
								re_all(31 downto 16)<=RE_YES;
								re_all(2)<='1';
							else
								null;
							end if;
							if g_in='1' then
								re_all(31 downto 16)<=RE_YES;
								re_all(1)<='1';
							else
								null;
							end if;
							if b_in='1' then
								re_all(31 downto 16)<=RE_YES;
								re_all(0)<='1';
							else
								null;
							end if;
						end if;
						fin<='1';
						res_allow<='0';
					else
						null;
					end if;
				when others=>
					null;
			end case;
			
			case re_allow is
				when '1'=>
					case con_re is
						when data_delay+1=>
							con_re<=0;
							addr_s<=addr_s+1;
							if con_col=col_max-1 then
								con_col<=0;
								if con_row=row_max-1 then
									con_row<=0;
									re_allow<='0';
									res_allow<='1';
								else
									con_row<=con_row+1;
								end if;
							else
								con_col<=con_col+1;
							end if;
						
						when others=>
							con_re<=con_re+1;
					end case;
				when others=>
					null;
			end case;
						
		end if;
	end if;
end process;


Yellow:process(inclk)

begin
	
	if rising_edge(inclk) then
	
		if start='1' and start_last='0' then
			y_c<=(0,col_max);
			y_r<=(0,row_max);
			y_fin<='0';
			y_in<='0';
		
		else
		
			case re_allow is
				when '1'=>
					case con_re is
						when data_delay=>
							if (r>=y_r_min and r<=y_r_max) and (g>=y_g_min and g<=y_g_max) and (b>=y_b_min and b<=y_b_max) then
								if con_col>y_r(1) then
									y_c(1)<=con_col;
								else
									y_c(1)<=y_c(1);
								end if;
								
								if con_col<y_c(0) then
									y_c(0)<=con_col;
								else
									y_c(0)<=y_c(0);
								end if;
							else
								y_c<=y_c;
							end if;
						when data_delay+1=>
							if (r>=y_r_min and r<=y_r_max) and (g>=y_r_min and g<=y_g_max) and (b>=y_b_min and b<=y_b_max) then
								if con_row>y_r(1) then
									y_r(1)<=con_row;
								else
									y_r(1)<=y_r(1);
								end if;
								
								if con_row<y_r(0) then
									y_r(0)<=con_row;
								else
									y_r(0)<=y_r(0);
								end if;
							else
								y_r<=y_r;
							end if;
						when others=>
							y_c<=y_c;
							y_r<=y_r;
					end case;
				when others=>
					y_c<=y_c;
					y_r<=y_r;	
			end case;
			
			case res_allow is
				when '1'=>
					case y_fin is
						when '0'=>
							if (y_c(1)-y_c(0)>diff_min) and (y_c(1)-y_c(0)<diff_max) and (y_c(1)-y_c(0)>diff_min) and (y_c(1)-y_c(0)<diff_max) then
								y_in<='1';
								re_yellow(14 downto 0)<=conv_std_logic_vector(y_c(1)+y_c(0),16)(15 downto 1);
								re_yellow(31)<='0';
								re_yellow(30 downto 16)<=conv_std_logic_vector(y_r(1)+y_r(0),16)(15 downto 1);
								re_yellow(15)<='0';
							else
								y_in<='0';
								re_yellow<=x"00000000";
							end if;
							y_fin<='1';
						when others=>
							
							y_in<=y_in;
							y_fin<=y_fin;
					end case;
				when others=>
					
					y_in<=y_in;
					y_fin<=y_fin;
			end case;
			
		end if;
	end if;
end process;

Green:process(inclk)

begin
	
	if rising_edge(inclk) then
	
		if start='1' and start_last='0' then
			g_c<=(0,col_max);
			g_r<=(0,row_max);
			g_fin<='0';
			g_in<='0';
		else
			
			case re_allow is
				when '1'=>
									
					case con_re is
						when data_delay=>
							if (r>=g_r_min and r<=g_r_max) and (g>=g_g_min and g<=g_g_max) and (b>=g_b_min and b<=g_b_max) then
								if con_col>g_c(1) then
									g_c(1)<=con_col;
								else
									g_c(1)<=g_c(1);
								end if;
								
								if con_col<g_c(0) then
									g_c(0)<=con_col;
								else
									g_c(0)<=g_c(0);
								end if;
							else
								g_c<=g_c;
							end if;
						when data_delay+1=>
							if (r>=g_r_min and r<=g_r_max) and (g>=g_g_min and g<=g_g_max) and (b>=g_b_min and b<=g_b_max) then
								if con_row>g_r(1) then
									g_r(1)<=con_row;
								else
									g_r(1)<=g_r(1);
								end if;
								
								if con_row<g_r(0) then
									g_r(0)<=con_row;
								else
									g_r(0)<=g_r(0);
								end if;
							else
								g_r<=g_r;
							end if;
						when others=>
							g_c<=g_c;
							g_r<=g_r;
					end case;
				when others=>
					g_c<=g_c;
					g_r<=g_r;			
			end case;
			
			case res_allow is
				when '1'=>
					case g_fin is
						when '0'=>
							if (g_c(1)-g_c(0)>diff_min) and (g_c(1)-g_c(0)<diff_max) and (g_c(1)-g_c(0)>diff_min) and (g_c(1)-g_c(0)<diff_max) then
								g_in<='1';
								re_green(14 downto 0)<=conv_std_logic_vector(g_c(1)+g_c(0),16)(15 downto 1);
								re_green(31)<='0';
								re_green(30 downto 16)<=conv_std_logic_vector(g_r(1)+g_r(0),16)(15 downto 1);
								re_green(15)<='0';
							else
								g_in<='0';
								re_green<=x"00000000";
							end if;
							g_fin<='1';
						when others=>
							
							g_in<=g_in;
							g_fin<=g_fin;
					end case;
				when others=>
					
					g_in<=g_in;
					g_fin<=g_fin;
			end case;
		
		end if;
	end if;
end process;

Blue:process(inclk)

begin
	
	if rising_edge(inclk) then
	
		if start='1' and start_last='0' then
			b_c<=(0,col_max);
			b_r<=(0,row_max);
			b_fin<='0';
			b_in<='0';
		else
		
			case re_allow is
				when '1'=>
					
					case con_re is
					
						when data_delay=>
							if (r>=b_r_min and r<=b_r_max) and (g>=b_g_min and g<=b_g_max) and (b>=b_b_min and b<=b_b_max) then
								if con_col>b_r(1) then
									b_c(1)<=con_col;
								else
									b_c(1)<=b_c(1);
								end if;
								
								if con_col<b_c(0) then
									b_c(0)<=con_col;
								else
									b_c(0)<=b_c(0);
								end if;
							else
								b_c<=b_c;
							end if;

						when data_delay+1=>
							if (r>=b_r_min and r<=b_r_max) and (g>=b_g_min and g<=b_g_max) and (b>=b_b_min and b<=b_b_max) then
								if con_row>b_r(1) then
									b_r(1)<=con_row;
								else
									b_r(1)<=b_r(1);
								end if;
								
								if con_row<b_r(0) then
									b_r(0)<=con_row;
								else
									b_r(0)<=b_r(0);
								end if;
							else
								b_r<=b_r;
							end if;
						
						when others=>
							b_c<=b_c;
							b_r<=b_r;
							
					end case;
				
				when others=>
					b_c<=b_c;
					b_r<=b_r;
										
			end case;
			
			case res_allow is
					when '1'=>
						case y_fin is
							when '0'=>
								if (b_c(1)-b_c(0)>diff_min) and (b_c(1)-b_c(0)<diff_max) and (b_c(1)-b_c(0)>diff_min) and (b_c(1)-b_c(0)<diff_max) then
									b_in<='1';
									re_blue(14 downto 0)<=conv_std_logic_vector(b_c(1)+b_c(0),16)(15 downto 1);
									re_blue(31)<='0';
									re_blue(30 downto 16)<=conv_std_logic_vector(b_r(1)+b_r(0),16)(15 downto 1);
									re_blue(15)<='0';
								else
									b_in<='0';
									re_blue<=x"00000000";
								end if;
								b_fin<='1';
							when others=>
								
								b_in<=b_in;
								b_fin<=b_fin;
						end case;
					when others=>
						
						b_in<=b_in;
						b_fin<=b_fin;
				end case;
			end if;
	end if;

end process;
			
		
end im;