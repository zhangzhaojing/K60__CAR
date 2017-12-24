///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      22/Dec/2017  21:48:13
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\servo.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWBD16.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\servo.c -D
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\servo.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_FTM_Init
        EXTERN LPLD_FTM_PWM_ChangeDuty
        EXTERN LPLD_FTM_PWM_Enable
        EXTERN __aeabi_d2f
        EXTERN __aeabi_d2uiz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fsub
        EXTERN __aeabi_memclr4
        EXTERN __aeabi_memcpy4
        EXTERN __aeabi_ui2d
        EXTERN __aeabi_ui2f
        EXTERN atan
        EXTERN tan

        PUBLIC servo__config
        PUBLIC servo__get_duty
        PUBLIC servo__get_radius
        PUBLIC servo__set_duty
        PUBLIC servo__set_radius
        PUBLIC servo__set_radius_dir

// C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\servo.c
//    1 #include "servo.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    3 static servo_t *srv;
srv:
        DS8 4
//    4 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    5 void servo__config(servo_t *srv_usr){
servo__config:
        PUSH     {LR}
        SUB      SP,SP,#+44
//    6    srv=srv_usr;
        LDR.N    R1,??DataTable5
        STR      R0,[R1, #+0]
//    7    FTM_InitTypeDef ftm_init_struct={0};
        ADD      R0,SP,#+12
        MOVS     R1,#+28
        BL       __aeabi_memclr4
//    8    ftm_init_struct.FTM_Ftmx=srv->FTMn;
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+0]
        STR      R0,[SP, #+12]
//    9    ftm_init_struct.FTM_Mode=FTM_MODE_PWM;
        MOVS     R0,#+1
        STRB     R0,[SP, #+16]
//   10    ftm_init_struct.FTM_PwmFreq=srv->freq;
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+8]
        STR      R0,[SP, #+20]
//   11    LPLD_FTM_Init(ftm_init_struct);
        ADD      R1,SP,#+12
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   12    LPLD_FTM_PWM_Enable(srv->FTMn,
//   13                         srv->FTM_Chn,
//   14                         srv->median, //��ʼ��������Ϊ��е��λ
//   15                         srv->PTXn,
//   16                         ALIGN_LEFT //���������
//   17                         );
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R3,[R0, #+5]
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R2,[R0, #+12]
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+4]
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+0]
        BL       LPLD_FTM_PWM_Enable
//   18    srv->duty = srv->median;
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+12]
        LDR.N    R1,??DataTable5
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+44]
//   19 }
        ADD      SP,SP,#+44
        POP      {PC}             ;; return

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0
//   20 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 void servo__set_duty(volatile uint32 duty){
servo__set_duty:
        PUSH     {R0,LR}
//   22     srv->duty=duty;
        LDR      R0,[SP, #+0]
        LDR.N    R1,??DataTable5
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+44]
//   23     LPLD_FTM_PWM_ChangeDuty(srv->FTMn,srv->FTM_Chn,srv->duty);
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R2,[R0, #+44]
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+4]
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+0]
        BL       LPLD_FTM_PWM_ChangeDuty
//   24 }
        POP      {R0,PC}          ;; return
//   25 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   26 void servo__set_radius(float radius){
servo__set_radius:
        PUSH     {R3-R7,LR}
        MOVS     R1,R0
//   27     srv->duty=(servo__radius2duty(srv,radius));
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+20]
        BL       __aeabi_fdiv
        BL       __aeabi_f2d
        BL       atan
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+12]
        BL       __aeabi_ui2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+24]
        BL       __aeabi_f2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2uiz
        LDR.N    R1,??DataTable5
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+44]
//   28     LPLD_FTM_PWM_ChangeDuty(srv->FTMn, srv->FTM_Chn, srv->duty);
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R2,[R0, #+44]
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+4]
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+0]
        BL       LPLD_FTM_PWM_ChangeDuty
//   29 }
        POP      {R0,R4-R7,PC}    ;; return
//   30 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   31 void servo__set_radius_dir(float radius,int dir){
servo__set_radius_dir:
        PUSH     {R3-R7,LR}
        MOVS     R2,R0
//   32   if(dir==0){
        CMP      R1,#+0
        BNE.N    ??servo__set_radius_dir_0
//   33     srv->duty=(servo__radius2duty_left(srv,radius)); //dir=0 left
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+20]
        MOVS     R1,R2
        BL       __aeabi_fdiv
        BL       __aeabi_f2d
        BL       atan
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+28]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+32]
        BL       __aeabi_f2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2uiz
        LDR.N    R1,??DataTable5
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+44]
        B.N      ??servo__set_radius_dir_1
//   34   }
//   35   else srv->duty=(servo__radius2duty_right(srv,radius)); //dir=1 right
??servo__set_radius_dir_0:
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+20]
        MOVS     R1,R2
        BL       __aeabi_fdiv
        BL       __aeabi_f2d
        BL       atan
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+36]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+40]
        BL       __aeabi_f2d
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2uiz
        LDR.N    R1,??DataTable5
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+44]
//   36   LPLD_FTM_PWM_ChangeDuty(srv->FTMn, srv->FTM_Chn, srv->duty);
??servo__set_radius_dir_1:
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R2,[R0, #+44]
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDRB     R1,[R0, #+4]
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+0]
        BL       LPLD_FTM_PWM_ChangeDuty
//   37 }
        POP      {R0,R4-R7,PC}    ;; return
//   38 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   39 uint32 servo__get_duty(){
//   40     return srv->duty;
servo__get_duty:
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+44]
        BX       LR               ;; return
//   41 }
//   42 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 float servo__get_radius(){
servo__get_radius:
        PUSH     {R3-R5,LR}
//   44     return servo__duty2radius(srv,(srv->duty));
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+44]
        BL       __aeabi_ui2f
        MOVS     R4,R0
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+12]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fsub
        LDR.N    R1,??DataTable5
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+24]
        BL       __aeabi_fdiv
        BL       __aeabi_f2d
        BL       tan
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable5
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+20]
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        POP      {R1,R4,R5,PC}    ;; return
//   45 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     srv

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//   4 bytes in section .bss
//  28 bytes in section .rodata
// 510 bytes in section .text
// 
// 510 bytes of CODE  memory
//  28 bytes of CONST memory
//   4 bytes of DATA  memory
//
//Errors: none
//Warnings: 3
