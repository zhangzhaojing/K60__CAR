/**
 * --------------����"��������K60�ײ��V3"�Ĺ��̣�LPLD_ServoControl��-----------------
 * @file LPLD_ServoControl.c
 * @version 0.2
 * @date 2013-10-30
 * @brief ����FTMģ���PWM������ܣ�ʵ�ֶ���Ŀ��ơ�
 *
 * ��Ȩ����:�����������µ��Ӽ������޹�˾
 * http://www.lpld.cn
 * mail:support@lpld.cn
 * Ӳ��ƽ̨:  LPLD K60 Card / LPLD K60 Nano
 *
 * �����̻���"��������K60�ײ��V3"������
 * ���п�Դ�������"lib"�ļ����£��û����ظ��ĸ�Ŀ¼�´��룬
 * �����û������豣����"project"�ļ����£��Թ����������ļ�������
 * �ײ��ʹ�÷���������ĵ��� 
 *
 */
#include "common.h"
#include "HW_LPTMR.h"
   
#define CPU_MK60F15

/****************************************
 ˵����
   CPU_MK60DZ10 & CPU_MK60D10
   *��PTC1����������������ź���
   CPU_MK60F12 & CPU_MK60F15
   *��PTD0����������������ź���
    �۲������˶�״̬
   *��������ź�����Χ0.5ms~2.5ms
    ��(-90��~+90��)
 ****************************************/

//��������
void pwm_init(void);
void delay(uint16);
uint32 angle_to_period(int8);
LPTMR_InitTypeDef lptmr_init_param;
//��������

void main (void)
{    

 // app__motor_dev();
 //app__steer_dev();
  app__blind();
  while(1){
  }
}