

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
	im->Re_G=BaseAddress+IMAGE_RE_B_OFFSET;
	return (XST_SUCCESS);
}


void ImStart(ImRe *im)
{
	ImRe_WriteReg(im->Cmd,Im_Cmd_Start);
	return;
}

u16 ImCheck(ImRe *im)
{
	u32 res;
	u16 result[2];
	res=ImRe_ReadReg(im->Re_All);
	memcpy(&result,&res,2);
	if (result[1]==Im_Re_Yes)
	{
		im->ys=result[0]&Im_Y_Mask;
		im->gs=(result[0]&Im_Y_Mask)>>1;
		im->bs=(result[0]&Im_Y_Mask)>>2;
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
	ImStart(ImRe *im);
	while(1)
	{
		usleep(10000);
		State=ImCheck(im);
		if (State==Im_Re_Yes)
		{
			if (im->ys==1)
			{
				res=ImRe_ReadReg(im->Re_Y);
				memcpy(&result,&res,2);
				im->yx=result[1];
				im->yy=result[0];
			}
			if (im->gs==1)
			{
				res=ImRe_ReadReg(im->Re_G);
				memcpy(&result,&res,2);
				im->gx=result[1];
				im->gy=result[0];
			}
			if (im->bs==1)
			{
				res=ImRe_ReadReg(im->Re_B);
				memcpy(&result,&res,2);
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