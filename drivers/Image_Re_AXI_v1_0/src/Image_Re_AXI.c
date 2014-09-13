

/***************************** Include Files *******************************/
#include "Image_Re_AXI.h"

/************************** Function Definitions ***************************/

s32 ImReInit(ImRe *im,u32 BaseAddress)
{
	im->BaseAddress=BaseAddress;
	im->Cmd=BaseAddress+IMAGE_CMD_OFFSET;
	im->Re_All=BaseAddress+IMAGE_RE_ALL_OFFSET;
	im->Re_Y=BaseAddress+IMAGE_RE_Y_OFFSET;
	im->Re_G=BaseAddress+IMAGE_RE_G_OFFSET;
	im->Re_B=BaseAddress+IMAGE_RE_B_OFFSET;
	return (XST_SUCCESS);
}


void ImReStart(ImRe *im)
{
	ImRe_WriteReg(im->Cmd,0);
	ImRe_WriteReg(im->Cmd,Im_Cmd_Start);
	return;
}

u16 ImReCheck(ImRe *im)
{
	u32 res;
	u16 result[2];
	res=ImRe_ReadReg(im->Re_All);
	memcpy(&result,&res,4);
	if (result[1]==Im_Re_Yes)
	{
		im->ys=result[0]&Im_Y_Mask;
		im->gs=(result[0]&Im_G_Mask)>>1;
		im->bs=(result[0]&Im_B_Mask)>>2;
	}
	else if(result[1]==Im_Re_No)
	{
		im->ys=0;
		im->gs=0;
		im->bs=0;
	}
	return result[1];
}


void ImReWork(ImRe *im)
{
	u16 State;
	u32 res;
	u16 result[2];
	ImReStart(im);
	usleep(1000);
	u32 addr=ImRe_ReadReg(XPAR_IMAGE_RE_AXI_0_S00_AXI_BASEADDR+IMAGE_RE_AXI_S00_AXI_SLV_REG2_OFFSET);
	u32 data=ImRe_ReadReg(XPAR_IMAGE_RE_AXI_0_S00_AXI_BASEADDR+IMAGE_RE_AXI_S00_AXI_SLV_REG3_OFFSET);
	{
		usleep(10000);
		State=ImReCheck(im);
		if (State==Im_Re_Yes)
		{
			if (im->ys==1)
			{
				res=ImRe_ReadReg(im->Re_Y);
				memcpy(&result,&res,4);
				im->yx=result[1];
				im->yy=result[0];
			}
			if (im->gs==1)
			{
				res=ImRe_ReadReg(im->Re_G);
				memcpy(&result,&res,4);
				im->gx=result[1];
				im->gy=result[0];
			}
			if (im->bs==1)
			{
				res=ImRe_ReadReg(im->Re_B);
				memcpy(&result,&res,4);
				im->bx=result[1];
				im->by=result[0];
			}
			return;
		}
		else if(State==Im_Re_No)
		{
			im->yx=0;
			im->yy=0;
			im->gx=0;
			im->gy=0;
			im->bx=0;
			im->by=0;
			return;
		}

	}
}
