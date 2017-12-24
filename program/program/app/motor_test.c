/**
 * @file app__motor_dev.c
 * @version 0.1
 * @date 2017-6-26
 * @brief 用于测试及开发电机和编码器相关的功能
 * 
 * 左电机正极 - PWM1 - PTC2:FTM0_CH1
 * 左电机负极 - PWM2 - PTC1:FTM0_CH0
 * 右电机正极 - PWM3 - PTC3:FTM0_CH2
 * 右电机负极 - PWM4 - PTC4:FTM0_CH3
 * 左电机编码器 - 编码器2 - PHASEA:PTA19:LPTMR_ALT1 - DIR:PTE27
 * 右电机编码器 - 编码器1 - PHASEA:PTC5:LPTMR_ALT2 - DIR:PTE26
 * 
 * 电机应该使用30KHz左右的频率驱动;
 * 
 * 编码器共用一个 LPTMR 模块，采用定时计数的测速方法。
 * 估算：两米每秒的车，0.25米半径的车轮，1:6的光编齿数比，光编的转速应约为 2[m/s]/0.25[m/rad]*6=48[rad/s]；
 * 若光编的线数为300线，则脉冲计数速率为 48[rad/s]/(2*3.14)[rad/r]*300[线/r]=2400[线/s]=24[线/10毫秒]
 */

#include "program.h"

static motor_controller_t mtrctrl = {
    PIT0, 10, 
    {LPTMR_ALT1, PTE, GPIO_Pin27, 27}, {LPTMR_ALT2, PTE, GPIO_Pin26, 26}, 
    {{FTM0, FTM_Ch0, PTC1, 30000},  {FTM0, FTM_Ch1, PTC2, 30000}, 
 {FTM0, FTM_Ch2, PTC3, 30000},{FTM0, FTM_Ch3, PTC4, 30000} /*RR*/   }
};

static void forward_and_backward(void){	
    const float period/* [sec] */ = 1.0f;
    const float angvel/* angular velocity [rad/sec]*/ = 2.0f * M_PI / period;
    float t/* time [sec]*/;
    
    motor_controller__set_duty(LEFT_MOTOR, (int32)(4000.0f));
    motor_controller__set_duty(RIGHT_MOTOR, (int32)(-4000.0f));
   
    /*
   for (t = 0.0f; t < period; dummy_delay_ms(100), t += 0.01f){
        motor_controller__set_duty(LEFT_MOTOR, (int32)(2000.0f * sin(angvel * t)));
        motor_controller__set_duty(RIGHT_MOTOR, (int32)(2000.0f * sin(angvel * t)));
    }
    */
}

static void print_encoder(void){
	printf("[INFO] ecd_placc_value= {left:%d, right:%d}\n", 
        mtrctrl.ecdlft.signed_value, mtrctrl.ecdrgt.signed_value);
    printf("[INFO] ecd_mileage= {left:%d, right: %d}\n", 
        mtrctrl.ecdlft.mileage, mtrctrl.ecdrgt.mileage);
}

extern void app__motor_dev(void){

	motor_controller__config(&mtrctrl);
    motor_controller__enable();
   
   
        motor_controller__set_duty(LEFT_MOTOR, (int32)(2000.0f));
        motor_controller__set_duty(RIGHT_MOTOR, (int32)(-2000.0f));
       // dummy_delay_ms(1000);
       //  motor_controller__set_duty(LEFT_MOTOR, (int32)(0));
        //motor_controller__set_duty(RIGHT_MOTOR, (int32)(0));   
        
    //while(1){    
    	
    //}
}