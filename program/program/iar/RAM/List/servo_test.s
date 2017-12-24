///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      22/Dec/2017  21:48:13
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\19071_000\Desktop\K60_Car\program\program\app\servo_test.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWBD55.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\program\program\app\servo_test.c
//        -D LPLD_K60 -D USE_K60DZ10 -lCN
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List -lB
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List -o
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\Obj
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "C:\Program Files
//        (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Normal.h" -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\app\ -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\CPU\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\common\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\HW\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\FatFs\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\FatFs\option\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\common\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\driver\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\descriptor\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\USB\class\
//        -I
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\..\..\..\lib\peripheral\
//        -Ol -I "C:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\arm\CMSIS\Include\" -D ARM_MATH_CM4)
//    Locale       =  C
//    List file    =  
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\servo_test.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN servo__config
        EXTERN servo__set_duty

        PUBLIC app__steer_dev

// C:\Users\19071_000\Desktop\K60_Car\program\program\app\servo_test.c
//    1 /**
//    2  * @file app__steer_dev.c
//    3  * @version 0.1
//    4  * @date 2017-6-26
//    5  * @brief 舵机测试、对中、标定、舵机模块开发用项目
//    6  *
//    7  * 蓝宙主板（V3.0）上关于舵机接口的定义：
//    8  * 舵机1=FTM1_Ch0(PTA8), 舵机2=FTM1_Ch1(TPA9)；
//    9  *
//   10  * BDS 1000M 控制参数：50Hz, 567%% - 687%%, 中位约为 627%%；
//   11  * （%%表示“万分之”，在LPLD的FTM_PWM模块中，满占空比为一万）
//   12  */
//   13 
//   14 #include "program.h"
//   15 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//   16 static servo_t steer={
steer:
        DC32 40039000H
        DC8 1, 9, 0, 0
        DC32 50, 50, 625, 42A00000H, 41A80000H, 0C3320000H
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
//   17   FTM1,FTM_Ch1,PTA9,50, 50, 625, 80, 21, -178//,median,amplitude, paramL, paramK
//   18 };
//   19 
//   20 /**
//   21  * @brief      按正弦规律来回转动三次，然后停在中位
//   22  *
//   23  * @param      steer   已经配置好FTM通道和引脚的舵机对象
//   24  *
//   25  * @warning    正弦的幅值为 steer->amplitude，已经安装好
//   26  * 的舵机若幅值设置过大，可能造成堵转损坏舵机，因此，
//   27  * 调用此函数前应将 steer->amplitude 的值设置得足够小(<50)。
//   28  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   29 static void servo__test(){
servo__test:
        PUSH     {R7,LR}
//   30     servo__set_duty(652);
        MOV      R0,#+652
        BL       servo__set_duty
//   31    //  servo__set_radius(100);
//   32 }
        POP      {R0,PC}          ;; return
//   33 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   34 extern void app__steer_dev(void)
//   35 {
app__steer_dev:
        PUSH     {R7,LR}
//   36     servo__config(&steer);
        LDR.N    R0,??DataTable1
        BL       servo__config
//   37     servo__test();
        BL       servo__test
//   38     
//   39     while(1)
??app__steer_dev_0:
        B.N      ??app__steer_dev_0
//   40     {
//   41       
//   42 
//   43     }
//   44 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     steer

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 48 bytes in section .data
// 30 bytes in section .text
// 
// 30 bytes of CODE memory
// 48 bytes of DATA memory
//
//Errors: none
//Warnings: none
