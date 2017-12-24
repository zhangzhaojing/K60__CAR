/**
 * @file app__steer_dev.c
 * @version 0.1
 * @date 2017-6-26
 * @brief ������ԡ����С��궨�����ģ�鿪������Ŀ
 *
 * �������壨V3.0���Ϲ��ڶ���ӿڵĶ��壺
 * ���1=FTM1_Ch0(PTA8), ���2=FTM1_Ch1(TPA9)��
 *
 * BDS 1000M ���Ʋ�����50Hz, 567%% - 687%%, ��λԼΪ 627%%��
 * ��%%��ʾ�����֮������LPLD��FTM_PWMģ���У���ռ�ձ�Ϊһ��
 */

#include "program.h"

static servo_t steer={
  FTM1,FTM_Ch1,PTA9,50, 50, 625, 80, 21, -178//,median,amplitude, paramL, paramK
};

/**
 * @brief      �����ҹ�������ת�����Σ�Ȼ��ͣ����λ
 *
 * @param      steer   �Ѿ����ú�FTMͨ�������ŵĶ������
 *
 * @warning    ���ҵķ�ֵΪ steer->amplitude���Ѿ���װ��
 * �Ķ������ֵ���ù��󣬿�����ɶ�ת�𻵶������ˣ�
 * ���ô˺���ǰӦ�� steer->amplitude ��ֵ���õ��㹻С(<50)��
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