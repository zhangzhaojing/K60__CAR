#ifndef _P_SERVO_H_
#define _P_SERVO_H_

#include <stdlib.h>
#include "common.h"

typedef struct 
{
  FTM_Type *FTMn;
  FtmChnEnum_Type FTM_Chn;
  PortPinsEnum_Type PTXn;
  uint32 freq;
  uint32 median;
  uint32 amplitude;
  float paramL, paramK;/* duty = atan((L)/(radius))*K +B*/
  float paramB_left,paramK_left;
  float paramB_right,paramK_right;
  volatile uint32 duty;
}servo_t;

void servo__config(servo_t *srv);
void servo__set_duty(volatile uint32 duty);
void servo__set_radius(float radius);
void servo__set_radius_dir(float radius,int dir);//left or right :duty=atan(L/R)*K+B
uint32 servo__get_duty();
float servo__get_radius();

#define servo__radius2duty(srv, rad) ((srv)->median + atan((srv)->paramL / (float)(rad))*(srv)->paramK)
#define servo__duty2radius(srv, duty) ((srv)->paramL / tan(((float)(duty) - (float)((srv)->median))/(float)((srv)->paramK)))

#define servo__radius2duty_left(srv, rad) ((srv)->paramB_left + atan((srv)->paramL / (float)(rad))*(srv)->paramK_left)
#define servo__radius2duty_right(srv, rad) ((srv)->paramB_right + atan((srv)->paramL / (float)(rad))*(srv)->paramK_right)

#endif