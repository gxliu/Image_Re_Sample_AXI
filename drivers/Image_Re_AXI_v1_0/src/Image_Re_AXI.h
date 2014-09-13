
#ifndef IMAGE_RE_AXI_H
#define IMAGE_RE_AXI_H


/****************** Include Files ********************/
#include "xbasic_types.h"
#include "xil_types.h"
#include "xstatus.h"
#include "xil_io.h"

#define IMAGE_RE_AXI_S00_AXI_SLV_REG0_OFFSET 0
#define IMAGE_RE_AXI_S00_AXI_SLV_REG1_OFFSET 4
#define IMAGE_RE_AXI_S00_AXI_SLV_REG2_OFFSET 8
#define IMAGE_RE_AXI_S00_AXI_SLV_REG3_OFFSET 12
#define IMAGE_RE_AXI_S00_AXI_SLV_REG4_OFFSET 16
#define IMAGE_RE_AXI_S00_AXI_SLV_REG5_OFFSET 20
#define IMAGE_RE_AXI_S00_AXI_SLV_REG6_OFFSET 24
#define IMAGE_RE_AXI_S00_AXI_SLV_REG7_OFFSET 28

#define IMAGE_CMD_OFFSET IMAGE_RE_AXI_S00_AXI_SLV_REG0_OFFSET
#define IMAGE_RE_ALL_OFFSET IMAGE_RE_AXI_S00_AXI_SLV_REG4_OFFSET
#define IMAGE_RE_Y_OFFSET IMAGE_RE_AXI_S00_AXI_SLV_REG5_OFFSET
#define IMAGE_RE_G_OFFSET IMAGE_RE_AXI_S00_AXI_SLV_REG6_OFFSET
#define IMAGE_RE_B_OFFSET IMAGE_RE_AXI_S00_AXI_SLV_REG7_OFFSET

#define Im_Cmd_Start 0x00000001
#define Im_Re_Yes 0x0001
#define Im_Re_No 0x0002
#define Im_Re_Wait 0x0003
#define Im_Y_Mask 0x0001
#define Im_G_Mask 0x0002
#define Im_B_Mask 0x0004

typedef struct 
{
	u32 BaseAddress;
	u32 Cmd;
	u32 Re_All;
	u32 Re_Y;
	u32 Re_G;
	u32 Re_B;
	u8 ys;
	u8 gs;
	u8 bs;
	u16 yx;
	u16 yy;
	u16 gx;
	u16 gy;
	u16 bx;
	u16 by;
}ImRe;

/**************************** Type Definitions *****************************/
/**
 *
 * Write a value to a IMAGE_RE_AXI register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the IMAGE_RE_AXIdevice.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void IMAGE_RE_AXI_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define ImRe_WriteReg(Address, Data) \
  	Xil_Out32(Address , (u32)(Data))


/**
 *
 * Read a value from a IMAGE_RE_AXI register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the IMAGE_RE_AXI device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 IMAGE_RE_AXI_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define ImRe_ReadReg(Address) \
    Xil_In32(Address)

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the IMAGE_RE_AXI instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus IMAGE_RE_AXI_Reg_SelfTest(void * baseaddr_p);

#endif // IMAGE_RE_AXI_H
