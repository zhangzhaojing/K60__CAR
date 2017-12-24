///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      22/Dec/2017  21:48:09
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\19071_000\Desktop\K60_Car\program\program\app\control.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWACD9.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\program\program\app\control.c -D
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN motor_controller__config
        EXTERN motor_controller__enable
        EXTERN servo__config

        PUBLIC control

// C:\Users\19071_000\Desktop\K60_Car\program\program\app\control.c
//    1 #include "program.h"
//    2 
//    3 /****电机与舵机***/

        SECTION `.data`:DATA:REORDER:NOROOT(3)
        DATA
//    4 static motor_controller_t mtrctrl = {    //电机与舵机
mtrctrl:
        DC8 0, 0, 0, 0
        DC32 10
        DC8 1, 0, 0, 0
        DC32 400FF100H, 134217728, 27
        DC8 2, 0, 0, 0
        DC32 400FF100H, 67108864, 26, 40038000H
        DC8 1, 62, 0, 0
        DC32 30000, 40038000H
        DC8 0, 61, 0, 0
        DC32 30000, 40038000H
        DC8 2, 63, 0, 0
        DC32 30000, 40038000H
        DC8 3, 64, 0, 0
        DC32 30000, 3F000000H, 3ECCCCCDH, 3CA3D70AH, 3F4CCCCDH, 3E4CCCCDH, 0H
        DC32 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0
//    5     PIT0, 10,
//    6     {LPTMR_ALT1, PTE, GPIO_Pin27, 27}, {LPTMR_ALT2, PTE, GPIO_Pin26, 26},
//    7     {{FTM0, FTM_Ch1, PTC2, 30000}, {FTM0, FTM_Ch0, PTC1, 30000},
//    8     {FTM0, FTM_Ch2, PTC3, 30000},  {FTM0, FTM_Ch3, PTC4, 30000}},
//    9     {0.5f, 0.4f, 0.02f}, {0.8f, 0.2f, 0.0f},
//   10     0, 0
//   11 };
//   12 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//   13 static servo_t steer = {  //舵机
steer:
        DC32 40039000H
        DC8 0, 8, 0, 0
        DC32 50, 603, 80, 41A00000H, 44EF0000H
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
//   14     FTM1, FTM_Ch0, PTA8, 50, 603, 80, 20, 1912//29.32, 1377
//   15 };
//   16 
//   17 
//   18 static void steer_controller(motor_controller_t *motor_set, float (*points)[2], int len){// 舵机控制
//   19     uint32 steer_set;
//   20     float turn_R,turn_delta;
//   21     int pidx0, pidx1, y_set0, y_set1;
//   22     char str[20];
//   23     int ij = 0;
//   24 
//   25     //printf("len=%d\t", len);
//   26 
//   27 //    /* 偏差法 */
//   28 //
//   29 //    while ( (ij < len) && (points [ij][0] < 470)) ij ++ ; //350--急转
//   30 //
//   31 //
//   32 //   // if(len > 7) pidx0 = 6; else pidx0 = len - 1; // 8
//   33 //    pidx0 = ij;
//   34 //
//   35 //    // points[pidx0][1] += 20.0f;
//   36 //
//   37 //    if(points[pidx0][1] > 10.0f){
//   38 //        y_set0=-98*((points[pidx0][1])*(points[pidx0][1])/10000) - 7.0f; // 120 / 80 --6
//   39 //    }else if(points[pidx0][1] <- 10.0f){
//   40 //        y_set0=96*((points[pidx0][1])*(points[pidx0][1])/10000) + 5.0f;  //120 / 80  --6
//   41 //    }else {
//   42 //        y_set0 = 0;
//   43 //    }
//   44 //    //printf("y0=%d\t",y_set0);
//   45 //
//   46 //
//   47 //
//   48 //    if(y_set0>85) y_set0 = 85;
//   49 //    else if(y_set0<-85) y_set0 = -85;
//   50 //
//   51 //   // sprintf(str, "%d",y_set0);
//   52 //   // OLED_status_bar(str);
//   53 //
//   54 //    y_set0 += steer.median;
//   55 //
//   56 //
//   57 //    //points[len-1][1] += 20.0f;
//   58 
//   59     
//   60     /* 曲率法 */
//   61     if(fabs(points[len-1][1])<10.0f ) y_set1 = steer.median;
//   62     else{
//   63         turn_R = ((points[len-1][1]*points[len-1][1]+points[len-1][0]*points[len-1][0])/2/-points[len-1][1]);
//   64         if(points[len-1][1]<0) {
//   65           y_set1 = servo__radius2duty_left((&steer), turn_R);
//   66         }else{
//   67           y_set1 = servo__radius2duty_right((&steer), turn_R);
//   68         }
//   69     }
//   70     
//   71     servo__set_duty(( y_set0 + y_set1)/2);
//   72 
//   73 }
//   74 
//   75 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   76 extern void control(){
control:
        PUSH     {R7,LR}
//   77     servo__config(&steer);
        LDR.N    R0,??control_0
        BL       servo__config
//   78     motor_controller__config(&mtrctrl);
        LDR.N    R0,??control_0+0x4
        BL       motor_controller__config
//   79     motor_controller__enable();
        BL       motor_controller__enable
//   80   
//   81   
//   82   
//   83 }
        POP      {R0,PC}          ;; return
        DATA
??control_0:
        DC32     steer
        DC32     mtrctrl

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 288 bytes in section .data
//  28 bytes in section .text
// 
//  28 bytes of CODE memory
// 288 bytes of DATA memory
//
//Errors: none
//Warnings: 10
