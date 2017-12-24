///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      22/Dec/2017  21:48:13
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\motor.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWBA9F.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\motor.c -D
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\motor.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_FTM_Init
        EXTERN LPLD_FTM_PWM_ChangeDuty
        EXTERN LPLD_FTM_PWM_Enable
        EXTERN LPLD_GPIO_Init
        EXTERN LPLD_LPTMR_GetPulseAcc
        EXTERN LPLD_LPTMR_Init
        EXTERN LPLD_PIT_DisableIrq
        EXTERN LPLD_PIT_EnableIrq
        EXTERN LPLD_PIT_Init
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_memcpy4
        EXTERN assert_failed
        EXTERN cos
        EXTERN memset
        EXTERN servo__get_radius
        EXTERN sin
        EXTERN systick__get

        PUBLIC motor_controller__config
        PUBLIC motor_controller__disable
        PUBLIC motor_controller__enable
        PUBLIC motor_controller__set_duty

// C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\motor.c
//    1 #include "motor.h"
//    2 #include <math.h>
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    4 static motor_controller_t *mtrctrl;
mtrctrl:
        DS8 4
//    5 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    6 static uint32 average_num=0;
average_num:
        DS8 4
//    7 
//    8 
//    9 /*
//   10 static void motor_controller__toggle_encoder(void){
//   11     LPTMR0->CSR &= ~(LPTMR_CSR_TEN_MASK); // disable lptmr
//   12     LPTMR0->CSR ^= LPTMR_CSR_TPS(3); // toggle between 0b01 and 0b10
//   13     LPTMR0->CSR |= LPTMR_CSR_TEN_MASK; // enable lptmr
//   14 }
//   15 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   16 static void reckon__update(reckon_t * rec, long long tm, float ds, float r){
reckon__update:
        PUSH     {R4-R8,R10,R11,LR}
        MOVS     R6,R0
        LDR      R7,[SP, #+32]
        LDR      R8,[SP, #+36]
//   17     rec->timestamp = tm;
        STRD     R2,R3,[R6, #+0]
//   18     rec->x += ds * cos(rec->theta);
        LDR      R0,[R6, #+16]
        BL       __aeabi_f2d
        BL       cos
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[R6, #+8]
        BL       __aeabi_f2d
        MOV      R10,R0
        MOV      R11,R1
        MOVS     R0,R7
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOV      R2,R10
        MOV      R3,R11
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        STR      R0,[R6, #+8]
//   19     rec->y += ds * sin(rec->theta);
        LDR      R0,[R6, #+16]
        BL       __aeabi_f2d
        BL       sin
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[R6, #+12]
        BL       __aeabi_f2d
        MOV      R10,R0
        MOV      R11,R1
        MOVS     R0,R7
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOV      R2,R10
        MOV      R3,R11
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        STR      R0,[R6, #+12]
//   20     if(r<1e5f) rec->theta -= ds / r;
        MOV      R0,R8
        LDR.W    R1,??DataTable5  ;; 0x47c35000
        BL       __aeabi_cfcmple
        BCS.N    ??reckon__update_0
        MOVS     R0,R7
        MOV      R1,R8
        BL       __aeabi_fdiv
        MOVS     R1,R0
        LDR      R0,[R6, #+16]
        BL       __aeabi_fsub
        STR      R0,[R6, #+16]
//   21     //while(rec->theta > M_PI) rec->theta -= 2 * M_PI;
//   22     //while(rec->theta < -M_PI) rec->theta += 2 * M_PI;
//   23 }
??reckon__update_0:
        POP      {R4-R8,R10,R11,PC}  ;; return
//   24 
//   25 static void motor_PID_controller (motor_controller_t *motor_set){
//   26 
//   27     static int32 delta_u_R, delta_u_L;
//   28     static int32 u_R, u_L;
//   29     static int32 Error_L, dError_L, ddError_L;
//   30     static int32 Error_R, dError_R, ddError_R;
//   31     int32 Current_value_R, Current_value_L;
//   32     float pkp_R, pki_R, pkd_R;
//   33     float pkp_L, pki_L, pkd_L;
//   34     float current_value_R, current_value_L;
//   35 
//   36     if((motor_set->target_L) >= 710){
//   37       current_value_L = ((float)(motor_set->ecdlft.signed_value) + 40.0f ) / 0.06f;
//   38       Current_value_L = (int32)(current_value_L);
//   39       Error_L = motor_set->target_L- Current_value_L;
//   40       pkp_L=motor_set->pid_acc.Kp*Error_L;
//   41       pki_L=motor_set->pid_acc.Ki*dError_L;
//   42       pkd_L=motor_set->pid_acc.Kd*ddError_L;
//   43     }
//   44     else if ((motor_set->target_L) <= -710){
//   45       current_value_L = ((float)(motor_set->ecdlft.signed_value) - 40.0f) / 0.06f;
//   46       Current_value_L = (int32)(current_value_L);
//   47       Error_L = motor_set->target_L- Current_value_L;
//   48       pkp_L=motor_set->pid_acc.Kp*Error_L;
//   49       pki_L=motor_set->pid_acc.Ki*dError_L;
//   50       pkd_L=motor_set->pid_acc.Kd*ddError_L;
//   51     }
//   52     else{
//   53       current_value_L = (float)(motor_set->ecdlft.signed_value)/ 0.07f;
//   54       Current_value_L = (int32)(current_value_L);
//   55       Error_L = motor_set->target_L- Current_value_L;
//   56       pkp_L=motor_set->pid_brake.Kp*Error_L;
//   57       pki_L=motor_set->pid_brake.Ki*dError_L;
//   58       pkd_L=motor_set->pid_brake.Kd*ddError_L;
//   59     }
//   60 
//   61     if((motor_set->target_R) >= 710){
//   62       current_value_R = ((float)motor_set->ecdrgt.signed_value + 46.0f) / 0.0665f;
//   63       Current_value_R = (int32)(current_value_R);
//   64       Error_R = motor_set->target_R - Current_value_R;
//   65       pkp_R=motor_set->pid_acc.Kp*Error_R;
//   66       pki_R=motor_set->pid_acc.Ki*dError_R;
//   67       pkd_R=motor_set->pid_acc.Kd*ddError_R;
//   68     }
//   69     else if ((motor_set->target_R) <= -710){
//   70       current_value_R = ((float)motor_set->ecdrgt.signed_value - 46.0f) / 0.0665f;
//   71       Current_value_R = (int32)(current_value_R);
//   72       Error_R = motor_set->target_R - Current_value_R;
//   73       pkp_R=motor_set->pid_acc.Kp*Error_R;
//   74       pki_R=motor_set->pid_acc.Ki*dError_R;
//   75       pkd_R=motor_set->pid_acc.Kd*ddError_R;
//   76     }
//   77     else{
//   78       current_value_R = (float)(motor_set->ecdrgt.signed_value) / 0.07f;
//   79       Current_value_R = (int32)(current_value_R);
//   80       Error_R = motor_set->target_R - Current_value_R;
//   81       pkp_R=motor_set->pid_brake.Kp*Error_R;
//   82       pki_R=motor_set->pid_brake.Ki*dError_R;
//   83       pkd_R=motor_set->pid_brake.Kd*ddError_R;
//   84     }
//   85 
//   86     ddError_L = dError_L;
//   87     ddError_R = dError_R;
//   88     dError_L = Error_L;
//   89     dError_R = Error_R;
//   90 
//   91     delta_u_L = (int32)(pkp_L - pki_L + pkd_L);
//   92     delta_u_R = (int32)(pkp_R - pki_R + pkd_R);
//   93 
//   94     u_L += delta_u_L;
//   95     u_R += delta_u_R;
//   96 
//   97     if( u_L > 3500 ) u_L = 3500;
//   98     else if( u_L <-3500 ) u_L = -3500;
//   99 
//  100     if( u_R > 3500 ) u_R = 3500;
//  101     else if( u_R <-3500 ) u_R = -3500;
//  102 
//  103     motor_controller__set_duty(LEFT_MOTOR, u_L);
//  104     motor_controller__set_duty(RIGHT_MOTOR, u_R);
//  105 
//  106     //printf("%d\t%d\t%d\t%d\t%d\t%d\n", Current_value_R, motor_set->target_R, u_R,Current_value_L, motor_set->target_L, u_L); //打印
//  107 }
//  108 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  109 static void pit_motor_controller(void){
pit_motor_controller:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+12
//  110     static uint32 pit_enter_counter;/* 进入此PIT中断次数计数器 */
//  111     static uint16 placc_temp_value[2];
//  112     static uint32 srv_duty;
//  113 
//  114     // 暂存 LPTMR 累加器的值并切换左右轮 LPTMR 的输入信号
//  115     do{// 需要连续两次相同的读数才能保证读出正确，参见 K60 手册 41.4.5 节
//  116         placc_temp_value[0] = LPLD_LPTMR_GetPulseAcc();
??pit_motor_controller_0:
        BL       LPLD_LPTMR_GetPulseAcc
        LDR.W    R1,??DataTable5_1
        STRH     R0,[R1, #+0]
//  117         placc_temp_value[1] = LPLD_LPTMR_GetPulseAcc();
        BL       LPLD_LPTMR_GetPulseAcc
        LDR.W    R1,??DataTable5_1
        STRH     R0,[R1, #+2]
//  118     }while(abs_diff(placc_temp_value[0], placc_temp_value[1])>1);
        LDR.W    R0,??DataTable5_1
        LDRH     R0,[R0, #+0]
        LDR.W    R1,??DataTable5_1
        LDRH     R1,[R1, #+2]
        CMP      R0,R1
        BCC.N    ??pit_motor_controller_1
        LDR.W    R0,??DataTable5_1
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable5_1
        LDRH     R0,[R0, #+2]
        SUBS     R0,R1,R0
        B.N      ??pit_motor_controller_2
??pit_motor_controller_1:
        LDR.W    R0,??DataTable5_1
        LDRH     R1,[R0, #+2]
        LDR.W    R0,??DataTable5_1
        LDRH     R0,[R0, #+0]
        SUBS     R0,R1,R0
??pit_motor_controller_2:
        CMP      R0,#+2
        BGE.N    ??pit_motor_controller_0
//  119     //motor_controller__toggle_encoder();
//  120     
//  121 
//  122     // 更新光编的测量值
//  123     switch(0){
//  124     case 0:
//  125         mtrctrl->ecdlft.placc_value = placc_temp_value[1];// 读取暂存的累加值，代表左轮在一次PIT周期中转过的脉冲数
        LDR.W    R0,??DataTable5_1
        LDRH     R0,[R0, #+2]
        LDR.W    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STRH     R0,[R1, #+200]
//  126         mtrctrl->ecdlft.signed_value = (
//  127             (PTxn_I(mtrctrl->ecdcfg_lft.DIR_PTx, mtrctrl->ecdcfg_lft.DIR_GPIO_Pinnum) ?
//  128                 (int16)mtrctrl->ecdlft.placc_value :
//  129                 -(int16)mtrctrl->ecdlft.placc_value)
//  130             );
        LDR.W    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+12]
        ADDS     R0,R0,#+16
        LDR.W    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+20]
        LSLS     R1,R1,#+2
        ADDS     R1,R1,R0, LSL #+5
        ADDS     R1,R1,#+1107296256
        LDR      R0,[R1, #+0]
        CMP      R0,#+0
        BEQ.N    ??pit_motor_controller_3
        LDR.W    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDRSH    R0,[R0, #+200]
        B.N      ??pit_motor_controller_4
??pit_motor_controller_3:
        LDR.W    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDRSH    R0,[R0, #+200]
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        RSBS     R0,R0,#+0
??pit_motor_controller_4:
        LDR.W    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STRH     R0,[R1, #+202]
//  131         reckon__update(&(mtrctrl->reckon), systick__get(), mtrctrl->ecdlft.signed_value / 5.757f, servo__get_radius());
        BL       servo__get_radius
        MOVS     R6,R0
        LDR.W    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDRSH    R7,[R0, #+202]
        BL       systick__get
        MOVS     R4,R0
        MOVS     R5,R1
        STR      R6,[SP, #+4]
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        MOVS     R0,R7
        BL       __aeabi_i2f
        LDR.W    R1,??DataTable5_3  ;; 0x40b83958
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
        MOVS     R2,R4
        MOVS     R3,R5
        LDR.W    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+216
        BL       reckon__update
//  132         break;
//  133     case 1:
//  134         mtrctrl->ecdrgt.placc_value = placc_temp_value[1];// 读取暂存的累加值，代表右轮在一次PIT周期中转过的脉冲数
//  135         mtrctrl->ecdrgt.signed_value = (
//  136             (PTxn_I(mtrctrl->ecdcfg_rgt.DIR_PTx, mtrctrl->ecdcfg_rgt.DIR_GPIO_Pinnum) ?
//  137                 -(int16)mtrctrl->ecdrgt.placc_value :
//  138                 (int16)mtrctrl->ecdrgt.placc_value)
//  139             );
//  140         reckon__update(&(mtrctrl->reckon), systick__get(), mtrctrl->ecdrgt.signed_value / 5.757f, servo__get_radius());
//  141         break;
//  142     }
//  143     
//  144     
//  145     mtrctrl->ecdlft.mileage += mtrctrl->ecdlft.signed_value;
        LDR.W    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDRSH    R0,[R0, #+202]
        LDR.W    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+204]
        SXTAH    R0,R1,R0
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+204]
//  146     mtrctrl->ecdrgt.mileage += mtrctrl->ecdrgt.signed_value;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDRSH    R0,[R0, #+210]
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        LDR      R1,[R1, #+212]
        SXTAH    R0,R1,R0
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+212]
//  147 
//  148   //  motor_PID_controller (mtrctrl); // 电机PID控制
//  149     average_num= mtrctrl->ecdlft.mileage;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+204]
        LDR.N    R1,??DataTable5_4
        STR      R0,[R1, #+0]
//  150     pit_enter_counter++;
        LDR.N    R0,??DataTable5_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_5
        STR      R0,[R1, #+0]
//  151     
//  152     
//  153     /////////////////////////////////////////////////////////////////////
//  154      LPTMR0->CSR&=(~LPTMR_CSR_TEN_MASK); 
        LDR.N    R0,??DataTable5_6  ;; 0x40040000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable5_6  ;; 0x40040000
        STR      R0,[R1, #+0]
//  155      LPTMR0->CSR |= LPTMR_CSR_TEN_MASK;
        LDR.N    R0,??DataTable5_6  ;; 0x40040000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable5_6  ;; 0x40040000
        STR      R0,[R1, #+0]
//  156     //if(pit_enter_counter>=300){
//  157     //    average_num=mtrctrl->ecdlft.mileage/pit_enter_counter;
//  158         //motor_controller__set_duty(LEFT_MOTOR, (int32)(0));
//  159         //motor_controller__set_duty(RIGHT_MOTOR, (int32)(0));
//  160     //    motor_controller__disable();
//  161     //}
//  162 }
        POP      {R0-R2,R4-R7,PC}  ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
`pit_motor_controller::pit_enter_counter`:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
`pit_motor_controller::placc_temp_value`:
        DS8 4
//  163 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  164 void motor_controller__config(motor_controller_t * mtrctrl_usr){
motor_controller__config:
        PUSH     {R1-R5,LR}
//  165     int8 i;
//  166 
//  167     mtrctrl = mtrctrl_usr;
        LDR.N    R1,??DataTable5_2
        STR      R0,[R1, #+0]
//  168 
//  169     // PIT 周期中断初始化
//  170     memset(&(mtrctrl->_pit_init), 0, sizeof(PIT_InitTypeDef));
        MOVS     R2,#+20
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+120
        BL       memset
//  171     mtrctrl->_pit_init.PIT_Pitx = mtrctrl->pit;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+120]
//  172     mtrctrl->_pit_init.PIT_PeriodMs = mtrctrl->period_ms;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+128]
//  173     mtrctrl->_pit_init.PIT_Isr = pit_motor_controller;
        LDR.N    R0,??DataTable5_7
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+136]
//  174     LPLD_PIT_Init(mtrctrl->_pit_init);
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+120
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_Init
//  175 
//  176     // LPTMR 初始化，从左轮先开始
//  177     memset(&(mtrctrl->_lptmr_init), 0, sizeof(LPTMR_InitTypeDef));
        MOVS     R2,#+12
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+140
        BL       memset
//  178     mtrctrl->_lptmr_init.LPTMR_Mode = LPTMR_MODE_PLACC;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+140]
//  179     mtrctrl->_lptmr_init.LPTMR_PluseAccInput = mtrctrl->ecdcfg_rgt.LPTMR_ALTn;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+24]
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+144]
//  180     LPLD_LPTMR_Init(mtrctrl->_lptmr_init);
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+140
        LDM      R0,{R0-R2}
        BL       LPLD_LPTMR_Init
//  181     mtrctrl->_lptmr_init.LPTMR_PluseAccInput = mtrctrl->ecdcfg_lft.LPTMR_ALTn;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+8]
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+144]
//  182     LPLD_LPTMR_Init(mtrctrl->_lptmr_init);
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+140
        LDM      R0,{R0-R2}
        BL       LPLD_LPTMR_Init
//  183 
//  184     // GPIO 初始化，用于光编方向判断
//  185     mtrctrl->_ecd_dir_init.GPIO_PTx = mtrctrl->ecdcfg_lft.DIR_PTx;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+12]
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+152]
//  186     mtrctrl->_ecd_dir_init.GPIO_Pins = mtrctrl->ecdcfg_lft.DIR_GPIO_Pinn;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+16]
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+156]
//  187     mtrctrl->_ecd_dir_init.GPIO_Dir = DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+164]
//  188     mtrctrl->_ecd_dir_init.GPIO_PinControl = INPUT_PULL_UP|IRQC_DIS;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+160]
//  189     LPLD_GPIO_Init(mtrctrl->_ecd_dir_init);
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+152
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  190     mtrctrl->_ecd_dir_init.GPIO_PTx = mtrctrl->ecdcfg_rgt.DIR_PTx;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+28]
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+152]
//  191     mtrctrl->_ecd_dir_init.GPIO_Pins = mtrctrl->ecdcfg_rgt.DIR_GPIO_Pinn;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        LDR      R0,[R0, #+32]
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+156]
//  192     mtrctrl->_ecd_dir_init.GPIO_Dir = DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+164]
//  193     mtrctrl->_ecd_dir_init.GPIO_PinControl = INPUT_PULL_UP|IRQC_DIS;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+160]
//  194     LPLD_GPIO_Init(mtrctrl->_ecd_dir_init);
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+152
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  195 
//  196     // 编码器里程计清零
//  197     mtrctrl->ecdlft.mileage = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+204]
//  198     mtrctrl->ecdrgt.mileage = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+212]
//  199 
//  200     // 航位清零
//  201     mtrctrl->reckon.timestamp = 0;
        MOVS     R0,#+0
        MOVS     R1,#+0
        LDR.N    R2,??DataTable5_2
        LDR      R2,[R2, #+0]
        STRD     R0,R1,[R2, #+216]
//  202     mtrctrl->reckon.x = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+224]
//  203     mtrctrl->reckon.y = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+228]
//  204     mtrctrl->reckon.theta = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+232]
//  205 
//  206     // 电机驱动 FTM 初始化
//  207     memset(&(mtrctrl->_mtr_init), 0, sizeof(FTM_InitTypeDef));
        MOVS     R2,#+28
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+172
        BL       memset
//  208     for(i=0; i<MTR_LEN; i++){
        MOVS     R4,#+0
        B.N      ??motor_controller__config_0
//  209         mtrctrl->_mtr_init.FTM_Ftmx = mtrctrl->mtrcfg[i].FTMn;
??motor_controller__config_1:
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        SMULBB   R1,R4,R1
        ADD      R0,R0,R1
        LDR      R0,[R0, #+40]
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+172]
//  210         mtrctrl->_mtr_init.FTM_Mode = FTM_MODE_PWM; //使能PWM模式
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STRB     R0,[R1, #+176]
//  211         mtrctrl->_mtr_init.FTM_PwmFreq = mtrctrl->mtrcfg[i].freq;
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        SMULBB   R1,R4,R1
        ADD      R0,R0,R1
        LDR      R0,[R0, #+48]
        LDR.N    R1,??DataTable5_2
        LDR      R1,[R1, #+0]
        STR      R0,[R1, #+180]
//  212         LPLD_FTM_Init(mtrctrl->_mtr_init);
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+172
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//  213         LPLD_FTM_PWM_Enable(mtrctrl->mtrcfg[i].FTMn,
//  214                             mtrctrl->mtrcfg[i].FTM_Chn,
//  215                             0, //初始化电机输出占空比为零
//  216                             mtrctrl->mtrcfg[i].PTXn,
//  217                             ALIGN_LEFT //脉宽左对齐
//  218                             );
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        SMULBB   R1,R4,R1
        ADD      R0,R0,R1
        LDRB     R3,[R0, #+45]
        MOVS     R2,#+0
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        SMULBB   R1,R4,R1
        ADD      R0,R0,R1
        LDRB     R1,[R0, #+44]
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R5,#+12
        SMULBB   R5,R4,R5
        ADD      R0,R0,R5
        LDR      R0,[R0, #+40]
        BL       LPLD_FTM_PWM_Enable
//  219     }
        ADDS     R4,R4,#+1
??motor_controller__config_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??motor_controller__config_1
//  220 }
        POP      {R0-R2,R4,R5,PC}  ;; return
//  221 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  222 void motor_controller__set_duty(motor_select_t sel, int32 duty){
motor_controller__set_duty:
        PUSH     {R4-R6,LR}
        MOVS     R6,R1
//  223     mtr_ch_t chp, ch0;
//  224 
//  225     switch(sel){
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??motor_controller__set_duty_0
        CMP      R0,#+1
        BEQ.N    ??motor_controller__set_duty_1
        B.N      ??motor_controller__set_duty_2
//  226     case LEFT_MOTOR:
//  227         if(duty>=0){
??motor_controller__set_duty_0:
        CMP      R6,#+0
        BMI.N    ??motor_controller__set_duty_3
//  228             chp = MTR_LF;
        MOVS     R5,#+0
//  229             ch0 = MTR_LR;
        MOVS     R4,#+1
        B.N      ??motor_controller__set_duty_4
//  230         }else{
//  231             chp = MTR_LR;
??motor_controller__set_duty_3:
        MOVS     R5,#+1
//  232             ch0 = MTR_LF;
        MOVS     R4,#+0
//  233         }
//  234         break;
??motor_controller__set_duty_4:
        B.N      ??motor_controller__set_duty_5
//  235     case RIGHT_MOTOR:
//  236         if(duty>=0){
??motor_controller__set_duty_1:
        CMP      R6,#+0
        BMI.N    ??motor_controller__set_duty_6
//  237             chp = MTR_RF;
        MOVS     R5,#+2
//  238             ch0 = MTR_RR;
        MOVS     R4,#+3
        B.N      ??motor_controller__set_duty_7
//  239         }else{
//  240             chp = MTR_RR;
??motor_controller__set_duty_6:
        MOVS     R5,#+3
//  241             ch0 = MTR_RF;
        MOVS     R4,#+2
//  242         }
//  243         break;
??motor_controller__set_duty_7:
        B.N      ??motor_controller__set_duty_5
//  244     default:
//  245         ASSERT(0);
??motor_controller__set_duty_2:
        MOVS     R1,#+245
        LDR.N    R0,??DataTable5_8
        BL       assert_failed
//  246     }
//  247 
//  248     if(duty<0) duty = -duty;
??motor_controller__set_duty_5:
        CMP      R6,#+0
        BPL.N    ??motor_controller__set_duty_8
        RSBS     R6,R6,#+0
//  249 
//  250     LPLD_FTM_PWM_ChangeDuty(mtrctrl->mtrcfg[chp].FTMn, mtrctrl->mtrcfg[chp].FTM_Chn, duty);
??motor_controller__set_duty_8:
        MOVS     R2,R6
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+12
        MUL      R1,R1,R5
        ADD      R0,R0,R1
        LDRB     R1,[R0, #+44]
        LDR.N    R0,??DataTable5_2
        LDR      R3,[R0, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,#+12
        MULS     R5,R0,R5
        ADD      R0,R3,R5
        LDR      R0,[R0, #+40]
        BL       LPLD_FTM_PWM_ChangeDuty
//  251     LPLD_FTM_PWM_ChangeDuty(mtrctrl->mtrcfg[ch0].FTMn, mtrctrl->mtrcfg[ch0].FTM_Chn, 0);
        MOVS     R2,#+0
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+12
        MUL      R1,R1,R4
        ADD      R0,R0,R1
        LDRB     R1,[R0, #+44]
        LDR.N    R0,??DataTable5_2
        LDR      R3,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,#+12
        MULS     R4,R0,R4
        ADD      R0,R3,R4
        LDR      R0,[R0, #+40]
        BL       LPLD_FTM_PWM_ChangeDuty
//  252 }
        POP      {R4-R6,PC}       ;; return
//  253 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  254 void motor_controller__enable(){
motor_controller__enable:
        PUSH     {R7,LR}
//  255     LPLD_PIT_EnableIrq(mtrctrl->_pit_init);
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+120
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_EnableIrq
//  256 }
        POP      {R0,PC}          ;; return
//  257 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  258 void motor_controller__disable(){
motor_controller__disable:
        PUSH     {R7,LR}
//  259     LPLD_PIT_DisableIrq(mtrctrl->_pit_init);
        LDR.N    R0,??DataTable5_2
        LDR      R0,[R0, #+0]
        ADDS     R1,R0,#+120
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_DisableIrq
//  260 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x47c35000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     `pit_motor_controller::placc_temp_value`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     mtrctrl

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x40b83958

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     average_num

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     `pit_motor_controller::pit_enter_counter`

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x40040000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     pit_motor_controller

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     ?_0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_0:
        DC8 43H, 3AH, 5CH, 55H, 73H, 65H, 72H, 73H
        DC8 5CH, 31H, 39H, 30H, 37H, 31H, 5FH, 30H
        DC8 30H, 30H, 5CH, 44H, 65H, 73H, 6BH, 74H
        DC8 6FH, 70H, 5CH, 4BH, 36H, 30H, 5FH, 43H
        DC8 61H, 72H, 5CH, 6CH, 69H, 62H, 5CH, 70H
        DC8 65H, 72H, 69H, 70H, 68H, 65H, 72H, 61H
        DC8 6CH, 5CH, 6DH, 6FH, 74H, 6FH, 72H, 2EH
        DC8 63H, 0
        DC8 0, 0

        END
// 
//    16 bytes in section .bss
//    60 bytes in section .rodata
// 1 254 bytes in section .text
// 
// 1 254 bytes of CODE  memory
//    60 bytes of CONST memory
//    16 bytes of DATA  memory
//
//Errors: none
//Warnings: 5
