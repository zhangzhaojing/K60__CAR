/**
 * @file app__steer_dev.c
 * @version 0.1
 * @date 2017-6-26
 * @brief 舵机测试、对中、标定、舵机模块开发用项目
 *
 * 蓝宙主板（V3.0）上关于舵机接口的定义：
 * 舵机1=FTM1_Ch0(PTA8), 舵机2=FTM1_Ch1(TPA9)；
 *
 * BDS 1000M 控制参数：50Hz, 567%% - 687%%, 中位约为 627%%；
 * （%%表示“万分之”，在LPLD的FTM_PWM模块中，满占空比为一万）
 */

#include "program.h"

static servo_t steer={
  FTM1,FTM_Ch1,PTA9,50, 50, 625, 80, 21, -178//,median,amplitude, paramL, paramK
};

/**
 * @brief      按正弦规律来回转动三次，然后停在中位
 *
 * @param      steer   已经配置好FTM通道和引脚的舵机对象
 *
 * @warning    正弦的幅值为 steer->amplitude，已经安装好
 * 的舵机若幅值设置过大，可能造成堵转损坏舵机，因此，
 * 调用此函数前应将 steer->amplitude 的值设置得足够小(<50)。
 */
static void servo__test(){
    servo__set_duty(652);
   //  servo__set_radius(100);
}

extern void app__steer_dev(void)
{
    servo__config(&steer);
    servo__test();
    
    while(1)
    {
      

    }
}