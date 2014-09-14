library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Image_Re_AXI_v1_0 is
	generic (
		-- Users to add parameters here
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
		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 5
	);
	port (
		-- Users to add ports here
		inclk:in std_logic;
        --from row_max and col_max--
        addr:out std_logic_vector(addr_width-1 downto 0);
        rgb24:in std_logic_vector(23 downto 0);
        
        --rwo and col now--
        --col--
        HCNT:out std_logic_vector(col_max_bit-1 downto 0);
        --row--
        VCNT:out std_logic_vector(row_max_bit-1 downto 0);
        

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic
	);
end Image_Re_AXI_v1_0;

architecture arch_imp of Image_Re_AXI_v1_0 is

	-- component declaration
	component Image_Re_AXI_v1_0_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 5;
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
        constant diff_min:integer:=30
		);
		port (
		inclk:in std_logic;
        --from row_max and col_max--
        addr:out std_logic_vector(addr_width-1 downto 0);
        rgb24:in std_logic_vector(23 downto 0);
        --rwo and col now--
        --col--
        HCNT:out std_logic_vector(col_max_bit-1 downto 0);
        --row--
        VCNT:out std_logic_vector(row_max_bit-1 downto 0);
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component Image_Re_AXI_v1_0_S00_AXI;

begin

-- Instantiation of Axi Bus Interface S00_AXI
Image_Re_AXI_v1_0_S00_AXI_inst : Image_Re_AXI_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH,
		data_delay=>data_delay,
		row_max=>row_max,
        col_max=>col_max,
        row_max_bit=>row_max_bit,
        col_max_bit=>col_max_bit,
        addr_width=>addr_width,
        
        y_r_max=>y_r_max,
        y_g_max=>y_g_max,
        y_b_max=>y_b_max,
        y_r_min=>y_r_min,
        y_g_min=>y_g_min,
        y_b_min=>y_b_min,
        
        g_r_max=>g_r_max,
        g_g_max=>g_g_max,
        g_b_max=>g_b_max,
        g_r_min=>g_r_min,
        g_g_min=>g_g_min,
        g_b_min=>g_b_min,
        
        b_r_max=>b_r_max,
        b_g_max=>b_g_max,
        b_b_max=>b_b_max,
        b_r_min=>b_r_min,
        b_g_min=>b_g_min,
        b_b_min=>b_b_min,
        
        diff_max=>diff_max,
        diff_min=>diff_min
	)
	port map (
	    inclk=>inclk,
	    addr=>addr,
	    rgb24=>rgb24,
	    HCNT=>HCNT,
       VCNT=>VCNT,
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
