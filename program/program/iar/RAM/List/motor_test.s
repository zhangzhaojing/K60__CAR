///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      22/Dec/2017  21:48:13
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\19071_000\Desktop\K60_Car\program\program\app\motor_test.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWBAFE.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\program\program\app\motor_test.c
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\motor_test.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN motor_controller__config
        EXTERN motor_controller__enable
        EXTERN motor_controller__set_duty

        PUBLIC app__motor_dev

// C:\Users\19071_000\Desktop\K60_Car\program\program\app\motor_test.c
//    1 /**
//    2  * @file app__motor_dev.c
//    3  * @version 0.1
//    4  * @date 2017-6-26
//    5  * @brief 用于测试及开发电机和编码器相关的功能
//    6  * 
//    7  * 左电机正极 - PWM1 - PTC2:FTM0_CH1
//    8  * 左电机负极 - PWM2 - PTC1:FTM0_CH0
//    9  * 右电机正极 - PWM3 - PTC3:FTM0_CH2
//   10  * 右电机负极 - PWM4 - PTC4:FTM0_CH3
//   11  * 左电机编码器 - 编码器2 - PHASEA:PTA19:LPTMR_ALT1 - DIR:PTE27
//   12  * 右电机编码器 - 编码器1 - PHASEA:PTC5:LPTMR_ALT2 - DIR:PTE26
//   13  * 
//   14  * 电机应该使用30KHz左右的频率驱动;
//   15  * 
//   16  * 编码器共用一个 LPTMR 模块，采用定时计数的测速方法。
//   17  * 估算：两米每秒的车，0.25米半径的车轮，1:6的光编齿数比，光编的转速应约为 2[m/s]/0.25[m/rad]*6=48[rad/s]；
//   18  * 若光编的线数为300线，则脉冲计数速率为 48[rad/s]/(2*3.14)[rad/r]*300[线/r]=2400[线/s]=24[线/10毫秒]
//   19  */
//   20 
//   21 #include "program.h"
//   22 

        SECTION `.data`:DATA:REORDER:NOROOT(3)
        DATA
//   23 static motor_controller_t mtrctrl = {
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
//   24     PIT0, 10, 
//   25     {LPTMR_ALT1, PTE, GPIO_Pin27, 27}, {LPTMR_ALT2, PTE, GPIO_Pin26, 26}, 
//   26     {{FTM0, FTM_Ch0, PTC1, 30000},  {FTM0, FTM_Ch1, PTC2, 30000}, 
//   27  {FTM0, FTM_Ch2, PTC3, 30000},{FTM0, FTM_Ch3, PTC4, 30000} /*RR*/   }
//   28 };
//   29 
//   30 static void forward_and_backward(void){	
//   31     const float period/* [sec] */ = 1.0f;
//   32     const float angvel/* angular velocity [rad/sec]*/ = 2.0f * M_PI / period;
//   33     float t/* time [sec]*/;
//   34     
//   35     motor_controller__set_duty(LEFT_MOTOR, (int32)(4000.0f));
//   36     motor_controller__set_duty(RIGHT_MOTOR, (int32)(-4000.0f));
//   37    
//   38     /*
//   39    for (t = 0.0f; t < period; dummy_delay_ms(100), t += 0.01f){
//   40         motor_controller__set_duty(LEFT_MOTOR, (int32)(2000.0f * sin(angvel * t)));
//   41         motor_controller__set_duty(RIGHT_MOTOR, (int32)(2000.0f * sin(angvel * t)));
//   42     }
//   43     */
//   44 }
//   45 
//   46 static void print_encoder(void){
//   47 	printf("[INFO] ecd_placc_value= {left:%d, right:%d}\n", 
//   48         mtrctrl.ecdlft.signed_value, mtrctrl.ecdrgt.signed_value);
//   49     printf("[INFO] ecd_mileage= {left:%d, right: %d}\n", 
//   50         mtrctrl.ecdlft.mileage, mtrctrl.ecdrgt.mileage);
//   51 }
//   52 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   53 extern void app__motor_dev(void){
app__motor_dev:
        PUSH     {R7,LR}
//   54 
//   55 	motor_controller__config(&mtrctrl);
        LDR.N    R0,??app__motor_dev_0
        BL       motor_controller__config
//   56     motor_controller__enable();
        BL       motor_controller__enable
//   57    
//   58    
//   59         motor_controller__set_duty(LEFT_MOTOR, (int32)(2000.0f));
        MOV      R1,#+2000
        MOVS     R0,#+0
        BL       motor_controller__set_duty
//   60         motor_controller__set_duty(RIGHT_MOTOR, (int32)(-2000.0f));
        LDR.N    R1,??app__motor_dev_0+0x4  ;; 0xfffff830
        MOVS     R0,#+1
        BL       motor_controller__set_duty
//   61        // dummy_delay_ms(1000);
//   62        //  motor_controller__set_duty(LEFT_MOTOR, (int32)(0));
//   63         //motor_controller__set_duty(RIGHT_MOTOR, (int32)(0));   
//   64         
//   65     //while(1){    
//   66     	
//   67     //}
//   68 }
        POP      {R0,PC}          ;; return
        DATA
??app__motor_dev_0:
        DC32     mtrctrl
        DC32     0xfffff830

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 240 bytes in section .data
//  40 bytes in section .text
// 
//  40 bytes of CODE memory
// 240 bytes of DATA memory
//
//Errors: none
//Warnings: 4
