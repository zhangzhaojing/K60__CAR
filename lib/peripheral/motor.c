#include "motor.h"
#include <math.h>

static motor_controller_t *mtrctrl;

static uint32 average_num=0;


/*
static void motor_controller__toggle_encoder(void){
    LPTMR0->CSR &= ~(LPTMR_CSR_TEN_MASK); // disable lptmr
    LPTMR0->CSR ^= LPTMR_CSR_TPS(3); // toggle between 0b01 and 0b10
    LPTMR0->CSR |= LPTMR_CSR_TEN_MASK; // enable lptmr
}
*/
static void reckon__update(reckon_t * rec, long long tm, float ds, float r){
    rec->timestamp = tm;
    rec->x += ds * cos(rec->theta);
    rec->y += ds * sin(rec->theta);
    if(r<1e5f) rec->theta -= ds / r;
    //while(rec->theta > M_PI) rec->theta -= 2 * M_PI;
    //while(rec->theta < -M_PI) rec->theta += 2 * M_PI;
}

static void motor_PID_controller (motor_controller_t *motor_set){

    static int32 delta_u_R, delta_u_L;
    static int32 u_R, u_L;
    static int32 Error_L, dError_L, ddError_L;
    static int32 Error_R, dError_R, ddError_R;
    int32 Current_value_R, Current_value_L;
    float pkp_R, pki_R, pkd_R;
    float pkp_L, pki_L, pkd_L;
    float current_value_R, current_value_L;

    if((motor_set->target_L) >= 710){
      current_value_L = ((float)(motor_set->ecdlft.signed_value) + 40.0f ) / 0.06f;
      Current_value_L = (int32)(current_value_L);
      Error_L = motor_set->target_L- Current_value_L;
      pkp_L=motor_set->pid_acc.Kp*Error_L;
      pki_L=motor_set->pid_acc.Ki*dError_L;
      pkd_L=motor_set->pid_acc.Kd*ddError_L;
    }
    else if ((motor_set->target_L) <= -710){
      current_value_L = ((float)(motor_set->ecdlft.signed_value) - 40.0f) / 0.06f;
      Current_value_L = (int32)(current_value_L);
      Error_L = motor_set->target_L- Current_value_L;
      pkp_L=motor_set->pid_acc.Kp*Error_L;
      pki_L=motor_set->pid_acc.Ki*dError_L;
      pkd_L=motor_set->pid_acc.Kd*ddError_L;
    }
    else{
      current_value_L = (float)(motor_set->ecdlft.signed_value)/ 0.07f;
      Current_value_L = (int32)(current_value_L);
      Error_L = motor_set->target_L- Current_value_L;
      pkp_L=motor_set->pid_brake.Kp*Error_L;
      pki_L=motor_set->pid_brake.Ki*dError_L;
      pkd_L=motor_set->pid_brake.Kd*ddError_L;
    }

    if((motor_set->target_R) >= 710){
      current_value_R = ((float)motor_set->ecdrgt.signed_value + 46.0f) / 0.0665f;
      Current_value_R = (int32)(current_value_R);
      Error_R = motor_set->target_R - Current_value_R;
      pkp_R=motor_set->pid_acc.Kp*Error_R;
      pki_R=motor_set->pid_acc.Ki*dError_R;
      pkd_R=motor_set->pid_acc.Kd*ddError_R;
    }
    else if ((motor_set->target_R) <= -710){
      current_value_R = ((float)motor_set->ecdrgt.signed_value - 46.0f) / 0.0665f;
      Current_value_R = (int32)(current_value_R);
      Error_R = motor_set->target_R - Current_value_R;
      pkp_R=motor_set->pid_acc.Kp*Error_R;
      pki_R=motor_set->pid_acc.Ki*dError_R;
      pkd_R=motor_set->pid_acc.Kd*ddError_R;
    }
    else{
      current_value_R = (float)(motor_set->ecdrgt.signed_value) / 0.07f;
      Current_value_R = (int32)(current_value_R);
      Error_R = motor_set->target_R - Current_value_R;
      pkp_R=motor_set->pid_brake.Kp*Error_R;
      pki_R=motor_set->pid_brake.Ki*dError_R;
      pkd_R=motor_set->pid_brake.Kd*ddError_R;
    }

    ddError_L = dError_L;
    ddError_R = dError_R;
    dError_L = Error_L;
    dError_R = Error_R;

    delta_u_L = (int32)(pkp_L - pki_L + pkd_L);
    delta_u_R = (int32)(pkp_R - pki_R + pkd_R);

    u_L += delta_u_L;
    u_R += delta_u_R;

    if( u_L > 3500 ) u_L = 3500;
    else if( u_L <-3500 ) u_L = -3500;

    if( u_R > 3500 ) u_R = 3500;
    else if( u_R <-3500 ) u_R = -3500;

    motor_controller__set_duty(LEFT_MOTOR, u_L);
    motor_controller__set_duty(RIGHT_MOTOR, u_R);

    //printf("%d\t%d\t%d\t%d\t%d\t%d\n", Current_value_R, motor_set->target_R, u_R,Current_value_L, motor_set->target_L, u_L); //打印
}

static void pit_motor_controller(void){
    static uint32 pit_enter_counter;/* 进入此PIT中断次数计数器 */
    static uint16 placc_temp_value[2];
    static uint32 srv_duty;

    // 暂存 LPTMR 累加器的值并切换左右轮 LPTMR 的输入信号
    do{// 需要连续两次相同的读数才能保证读出正确，参见 K60 手册 41.4.5 节
        placc_temp_value[0] = LPLD_LPTMR_GetPulseAcc();
        placc_temp_value[1] = LPLD_LPTMR_GetPulseAcc();
    }while(abs_diff(placc_temp_value[0], placc_temp_value[1])>1);
    //motor_controller__toggle_encoder();
    

    // 更新光编的测量值
    switch(0){
    case 0:
        mtrctrl->ecdlft.placc_value = placc_temp_value[1];// 读取暂存的累加值，代表左轮在一次PIT周期中转过的脉冲数
        mtrctrl->ecdlft.signed_value = (
            (PTxn_I(mtrctrl->ecdcfg_lft.DIR_PTx, mtrctrl->ecdcfg_lft.DIR_GPIO_Pinnum) ?
                (int16)mtrctrl->ecdlft.placc_value :
                -(int16)mtrctrl->ecdlft.placc_value)
            );
        reckon__update(&(mtrctrl->reckon), systick__get(), mtrctrl->ecdlft.signed_value / 5.757f, servo__get_radius());
        break;
    case 1:
        mtrctrl->ecdrgt.placc_value = placc_temp_value[1];// 读取暂存的累加值，代表右轮在一次PIT周期中转过的脉冲数
        mtrctrl->ecdrgt.signed_value = (
            (PTxn_I(mtrctrl->ecdcfg_rgt.DIR_PTx, mtrctrl->ecdcfg_rgt.DIR_GPIO_Pinnum) ?
                -(int16)mtrctrl->ecdrgt.placc_value :
                (int16)mtrctrl->ecdrgt.placc_value)
            );
        reckon__update(&(mtrctrl->reckon), systick__get(), mtrctrl->ecdrgt.signed_value / 5.757f, servo__get_radius());
        break;
    }
    
    
    mtrctrl->ecdlft.mileage += mtrctrl->ecdlft.signed_value;
    mtrctrl->ecdrgt.mileage += mtrctrl->ecdrgt.signed_value;

  //  motor_PID_controller (mtrctrl); // 电机PID控制
    average_num= mtrctrl->ecdlft.mileage;
    pit_enter_counter++;
    
    
    /////////////////////////////////////////////////////////////////////
     LPTMR0->CSR&=(~LPTMR_CSR_TEN_MASK); 
     LPTMR0->CSR |= LPTMR_CSR_TEN_MASK;
    //if(pit_enter_counter>=300){
    //    average_num=mtrctrl->ecdlft.mileage/pit_enter_counter;
        //motor_controller__set_duty(LEFT_MOTOR, (int32)(0));
        //motor_controller__set_duty(RIGHT_MOTOR, (int32)(0));
    //    motor_controller__disable();
    //}
}

void motor_controller__config(motor_controller_t * mtrctrl_usr){
    int8 i;

    mtrctrl = mtrctrl_usr;

    // PIT 周期中断初始化
    memset(&(mtrctrl->_pit_init), 0, sizeof(PIT_InitTypeDef));
    mtrctrl->_pit_init.PIT_Pitx = mtrctrl->pit;
    mtrctrl->_pit_init.PIT_PeriodMs = mtrctrl->period_ms;
    mtrctrl->_pit_init.PIT_Isr = pit_motor_controller;
    LPLD_PIT_Init(mtrctrl->_pit_init);

    // LPTMR 初始化，从左轮先开始
    memset(&(mtrctrl->_lptmr_init), 0, sizeof(LPTMR_InitTypeDef));
    mtrctrl->_lptmr_init.LPTMR_Mode = LPTMR_MODE_PLACC;
    mtrctrl->_lptmr_init.LPTMR_PluseAccInput = mtrctrl->ecdcfg_rgt.LPTMR_ALTn;
    LPLD_LPTMR_Init(mtrctrl->_lptmr_init);
    mtrctrl->_lptmr_init.LPTMR_PluseAccInput = mtrctrl->ecdcfg_lft.LPTMR_ALTn;
    LPLD_LPTMR_Init(mtrctrl->_lptmr_init);

    // GPIO 初始化，用于光编方向判断
    mtrctrl->_ecd_dir_init.GPIO_PTx = mtrctrl->ecdcfg_lft.DIR_PTx;
    mtrctrl->_ecd_dir_init.GPIO_Pins = mtrctrl->ecdcfg_lft.DIR_GPIO_Pinn;
    mtrctrl->_ecd_dir_init.GPIO_Dir = DIR_INPUT;
    mtrctrl->_ecd_dir_init.GPIO_PinControl = INPUT_PULL_UP|IRQC_DIS;
    LPLD_GPIO_Init(mtrctrl->_ecd_dir_init);
    mtrctrl->_ecd_dir_init.GPIO_PTx = mtrctrl->ecdcfg_rgt.DIR_PTx;
    mtrctrl->_ecd_dir_init.GPIO_Pins = mtrctrl->ecdcfg_rgt.DIR_GPIO_Pinn;
    mtrctrl->_ecd_dir_init.GPIO_Dir = DIR_INPUT;
    mtrctrl->_ecd_dir_init.GPIO_PinControl = INPUT_PULL_UP|IRQC_DIS;
    LPLD_GPIO_Init(mtrctrl->_ecd_dir_init);

    // 编码器里程计清零
    mtrctrl->ecdlft.mileage = 0;
    mtrctrl->ecdrgt.mileage = 0;

    // 航位清零
    mtrctrl->reckon.timestamp = 0;
    mtrctrl->reckon.x = 0;
    mtrctrl->reckon.y = 0;
    mtrctrl->reckon.theta = 0;

    // 电机驱动 FTM 初始化
    memset(&(mtrctrl->_mtr_init), 0, sizeof(FTM_InitTypeDef));
    for(i=0; i<MTR_LEN; i++){
        mtrctrl->_mtr_init.FTM_Ftmx = mtrctrl->mtrcfg[i].FTMn;
        mtrctrl->_mtr_init.FTM_Mode = FTM_MODE_PWM; //使能PWM模式
        mtrctrl->_mtr_init.FTM_PwmFreq = mtrctrl->mtrcfg[i].freq;
        LPLD_FTM_Init(mtrctrl->_mtr_init);
        LPLD_FTM_PWM_Enable(mtrctrl->mtrcfg[i].FTMn,
                            mtrctrl->mtrcfg[i].FTM_Chn,
                            0, //初始化电机输出占空比为零
                            mtrctrl->mtrcfg[i].PTXn,
                            ALIGN_LEFT //脉宽左对齐
                            );
    }
}

void motor_controller__set_duty(motor_select_t sel, int32 duty){
    mtr_ch_t chp, ch0;

    switch(sel){
    case LEFT_MOTOR:
        if(duty>=0){
            chp = MTR_LF;
            ch0 = MTR_LR;
        }else{
            chp = MTR_LR;
            ch0 = MTR_LF;
        }
        break;
    case RIGHT_MOTOR:
        if(duty>=0){
            chp = MTR_RF;
            ch0 = MTR_RR;
        }else{
            chp = MTR_RR;
            ch0 = MTR_RF;
        }
        break;
    default:
        ASSERT(0);
    }

    if(duty<0) duty = -duty;

    LPLD_FTM_PWM_ChangeDuty(mtrctrl->mtrcfg[chp].FTMn, mtrctrl->mtrcfg[chp].FTM_Chn, duty);
    LPLD_FTM_PWM_ChangeDuty(mtrctrl->mtrcfg[ch0].FTMn, mtrctrl->mtrcfg[ch0].FTM_Chn, 0);
}

void motor_controller__enable(){
    LPLD_PIT_EnableIrq(mtrctrl->_pit_init);
}

void motor_controller__disable(){
    LPLD_PIT_DisableIrq(mtrctrl->_pit_init);
}