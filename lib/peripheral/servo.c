#include "servo.h"

static servo_t *srv;

void servo__config(servo_t *srv_usr){
   srv=srv_usr;
   FTM_InitTypeDef ftm_init_struct={0};
   ftm_init_struct.FTM_Ftmx=srv->FTMn;
   ftm_init_struct.FTM_Mode=FTM_MODE_PWM;
   ftm_init_struct.FTM_PwmFreq=srv->freq;
   LPLD_FTM_Init(ftm_init_struct);
   LPLD_FTM_PWM_Enable(srv->FTMn,
                        srv->FTM_Chn,
                        srv->median, //初始化舵机打角为机械中位
                        srv->PTXn,
                        ALIGN_LEFT //脉宽左对齐
                        );
   srv->duty = srv->median;
}

void servo__set_duty(volatile uint32 duty){
    srv->duty=duty;
    LPLD_FTM_PWM_ChangeDuty(srv->FTMn,srv->FTM_Chn,srv->duty);
}

void servo__set_radius(float radius){
    srv->duty=(servo__radius2duty(srv,radius));
    LPLD_FTM_PWM_ChangeDuty(srv->FTMn, srv->FTM_Chn, srv->duty);
}

void servo__set_radius_dir(float radius,int dir){
  if(dir==0){
    srv->duty=(servo__radius2duty_left(srv,radius)); //dir=0 left
  }
  else srv->duty=(servo__radius2duty_right(srv,radius)); //dir=1 right
  LPLD_FTM_PWM_ChangeDuty(srv->FTMn, srv->FTM_Chn, srv->duty);
}

uint32 servo__get_duty(){
    return srv->duty;
}

float servo__get_radius(){
    return servo__duty2radius(srv,(srv->duty));
}