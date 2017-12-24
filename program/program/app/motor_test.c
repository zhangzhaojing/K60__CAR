/**
 * @file app__motor_dev.c
 * @version 0.1
 * @date 2017-6-26
 * @brief ���ڲ��Լ���������ͱ�������صĹ���
 * 
 * �������� - PWM1 - PTC2:FTM0_CH1
 * �������� - PWM2 - PTC1:FTM0_CH0
 * �ҵ������ - PWM3 - PTC3:FTM0_CH2
 * �ҵ������ - PWM4 - PTC4:FTM0_CH3
 * ���������� - ������2 - PHASEA:PTA19:LPTMR_ALT1 - DIR:PTE27
 * �ҵ�������� - ������1 - PHASEA:PTC5:LPTMR_ALT2 - DIR:PTE26
 * 
 * ���Ӧ��ʹ��30KHz���ҵ�Ƶ������;
 * 
 * ����������һ�� LPTMR ģ�飬���ö�ʱ�����Ĳ��ٷ�����
 * ���㣺����ÿ��ĳ���0.25�װ뾶�ĳ��֣�1:6�Ĺ������ȣ�����ת��ӦԼΪ 2[m/s]/0.25[m/rad]*6=48[rad/s]��
 * ����������Ϊ300�ߣ��������������Ϊ 48[rad/s]/(2*3.14)[rad/r]*300[��/r]=2400[��/s]=24[��/10����]
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