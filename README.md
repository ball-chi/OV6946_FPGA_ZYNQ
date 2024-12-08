运行环境：Vivado 2020.2
          Vitis 2020.2

使用芯片：Zynq（XC7Z020CLG400）

使用配件：OV6946，OV428


src文件建议创个文件夹统一放置



跑vitis时候出现以下报错可以尝试一下该方法：
 
arm-xilinx-eabi-gcc.exe: error: FPGA_HDK_V1.2/OV428_HDMI_1080P/vitis/FPGA_Test/export/FPGA_Test/sw/FPGA_Test/standalone_ps7_cortexa9_0/bspinclude/include: No such file or directory
 make[1]: *** [src/subdir.mk:26: src/helloworld.o] Error 1
 make: *** [makefile:34: all] Error 2



在工程的include里面找到已经灰色的文件路径，接着找出这几个文件在自己电脑上的文件路径

打开C/C++ Build Setting后选择----directoris---添加对应路径然后就能build project成功
