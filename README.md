运行环境：Vivado 2020.2
          Vitis 2020.2

使用芯片：Zynq（XC7Z020CLG400）

使用配件：OV6946，OV428


src文件建议创个文件夹统一放置


![image](https://github.com/user-attachments/assets/a46530b6-6530-449f-b6ac-2771f4dce124)

烧录后在HDMI的屏幕显示的实际效果图，可以进入狭窄的管道清晰看得到里面的细节





**************************************************************************************************************************************
prj上板子过程中遇到的问题记录：

跑vitis时候出现以下报错可以尝试一下该方法：
 
arm-xilinx-eabi-gcc.exe: error: FPGA_HDK_V1.2/OV428_HDMI_1080P/vitis/FPGA_Test/export/FPGA_Test/sw/FPGA_Test/standalone_ps7_cortexa9_0/bspinclude/include: No such file or directory
 make[1]: *** [src/subdir.mk:26: src/helloworld.o] Error 1
 make: *** [makefile:34: all] Error 2

![image](https://github.com/user-attachments/assets/7c92056d-9da6-4ec7-bc44-a4ad627f1a4d)

看看是不是这几个路径变成灰色

在工程的include里面找到已经灰色的文件路径

接着找出这几个文件在自己电脑上的文件路径

![image](https://github.com/user-attachments/assets/372e0e4b-6bc7-4526-9fee-a2e879c83799)

打开C/C++ Build Setting后选择----directoris---添加对应路径然后就能build project成功

![image](https://github.com/user-attachments/assets/2ac3315a-9893-45a7-b3da-ac085dd47c76)


然后重新烧录即可
