///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      22/Dec/2017  21:48:09
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\19071_000\Desktop\K60_Car\program\program\app\blind.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWACDA.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\program\program\app\blind.c -D
//        LPLD_K60 -D USE_K60DZ10 -lCN
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\blind.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN motor_controller__config
        EXTERN motor_controller__enable
        EXTERN motor_controller__set_duty
        EXTERN servo__config
        EXTERN servo__set_radius_dir

        PUBLIC app__blind

// C:\Users\19071_000\Desktop\K60_Car\program\program\app\blind.c
//    1 #include "program.h"
//    2 
//    3 #define R 60 //cm
//    4 #define CIRCLE 2*3.1415926535*R //Ô²µÄÖÜ³¤
//    5 #define MIL CIRCLE*0.01*1965*0.9
//    6 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    7 static int dir=0;
dir:
        DS8 4
//    8 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//    9 static servo_t steer={
steer:
        DC32 40039000H
        DC8 1, 9, 0, 0
        DC32 50, 625, 80, 41A80000H, 0C3320000H, 441F4000H, 43260000H
        DC32 441C4000H, 0C3320000H
        DC8 0, 0, 0, 0
//   10   FTM1,FTM_Ch1,PTA9,50,  625, 80, 21, -178,637,166,625,-178//,median,amplitude, paramL, paramK
//   11 };
//   12 

        SECTION `.data`:DATA:REORDER:NOROOT(3)
        DATA
//   13 static motor_controller_t mtrctrl = {
mtrctrl:
        DC8 0, 0, 0, 0
        DC32 10
        DC8 1, 0, 0, 0
        DC32 400FF100H, 134217728, 27
        DC8 2, 0, 0, 0
        DC32 400FF100H, 67108864, 26, 40038000H
        DC8 0, 61, 0, 0
        DC32 30000, 40038000H
        DC8 1, 62, 0, 0
        DC32 30000, 40038000H
        DC8 2, 63, 0, 0
        DC32 30000, 40038000H
        DC8 3, 64, 0, 0
        DC32 30000
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0
//   14     PIT0, 10, 
//   15     {LPTMR_ALT1, PTE, GPIO_Pin27, 27}, {LPTMR_ALT2, PTE, GPIO_Pin26, 26}, 
//   16     {{FTM0, FTM_Ch0, PTC1, 30000},  {FTM0, FTM_Ch1, PTC2, 30000}, 
//   17  {FTM0, FTM_Ch2, PTC3, 30000},{FTM0, FTM_Ch3, PTC4, 30000} /*RR*/   }
//   18 };
//   19 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   20 extern void app__blind(void){
app__blind:
        PUSH     {R7,LR}
//   21   servo__config(&steer);
        LDR.N    R0,??app__blind_0
        BL       servo__config
//   22   motor_controller__config(&mtrctrl);
        LDR.N    R0,??app__blind_0+0x4
        BL       motor_controller__config
//   23   motor_controller__enable();
        BL       motor_controller__enable
//   24   motor_controller__set_duty(LEFT_MOTOR, (int32)(2000.0f));
        MOV      R1,#+2000
        MOVS     R0,#+0
        BL       motor_controller__set_duty
//   25   motor_controller__set_duty(RIGHT_MOTOR, (int32)(-2000.0f));
        LDR.N    R1,??app__blind_0+0x8  ;; 0xfffff830
        MOVS     R0,#+1
        BL       motor_controller__set_duty
//   26   //servo__set_duty(580);
//   27   servo__set_radius_dir(R,dir);
        LDR.N    R0,??app__blind_0+0xC
        LDR      R1,[R0, #+0]
        LDR.N    R0,??app__blind_0+0x10  ;; 0x42700000
        BL       servo__set_radius_dir
        B.N      ??app__blind_1
//   28 
//   29   while(1){
//   30       if(mtrctrl.ecdlft.mileage>MIL){
//   31      if(dir==0)dir=1;else dir=0;
??app__blind_2:
        MOVS     R0,#+0
        LDR.N    R1,??app__blind_0+0xC
        STR      R0,[R1, #+0]
//   32       //servo__set_duty(670);
//   33      servo__set_radius_dir(R,dir);
??app__blind_3:
        LDR.N    R0,??app__blind_0+0xC
        LDR      R1,[R0, #+0]
        LDR.N    R0,??app__blind_0+0x10  ;; 0x42700000
        BL       servo__set_radius_dir
//   34      mtrctrl.ecdlft.mileage=0;
        MOVS     R0,#+0
        LDR.N    R1,??app__blind_0+0x4
        STR      R0,[R1, #+204]
??app__blind_1:
        LDR.N    R0,??app__blind_0+0x4
        LDR      R0,[R0, #+204]
        MOVW     R1,#+6668
        CMP      R0,R1
        BLT.N    ??app__blind_1
        LDR.N    R0,??app__blind_0+0xC
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??app__blind_2
        MOVS     R0,#+1
        LDR.N    R1,??app__blind_0+0xC
        STR      R0,[R1, #+0]
        B.N      ??app__blind_3
        Nop      
        DATA
??app__blind_0:
        DC32     steer
        DC32     mtrctrl
        DC32     0xfffff830
        DC32     dir
        DC32     0x42700000
//   35     }
//   36     
//   37     
//   38   }
//   39   
//   40 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//   4 bytes in section .bss
// 288 bytes in section .data
// 124 bytes in section .text
// 
// 124 bytes of CODE memory
// 292 bytes of DATA memory
//
//Errors: none
//Warnings: none
