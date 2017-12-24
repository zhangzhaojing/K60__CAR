///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.10.1.12857/W32 for ARM      23/Dec/2017  21:08:44
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\ov7620.c
//    Command line =  
//        -f C:\Users\19071_~1\AppData\Local\Temp\EWC5A8.tmp
//        (C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\ov7620.c -D
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
//        C:\Users\19071_000\Desktop\K60_Car\program\program\iar\RAM\List\ov7620.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_DMA_EnableIrq
        EXTERN LPLD_DMA_Init
        EXTERN LPLD_GPIO_Init
        EXTERN __aeabi_memclr4
        EXTERN __aeabi_memcpy4

        PUBLIC camera__take_a_photo_please
        PUBLIC ov7620__config

// C:\Users\19071_000\Desktop\K60_Car\lib\peripheral\ov7620.c
//    1 #include "ov7620.h"

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void __NVIC_EnableIRQ(IRQn_Type)
__NVIC_EnableIRQ:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BMI.N    ??__NVIC_EnableIRQ_0
        MOVS     R2,#+1
        ANDS     R1,R0,#0x1F
        LSLS     R2,R2,R1
        LDR.N    R1,??DataTable6  ;; 0xe000e100
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R2,[R1, R0, LSL #+2]
??__NVIC_EnableIRQ_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void __NVIC_DisableIRQ(IRQn_Type)
__NVIC_DisableIRQ:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BMI.N    ??__NVIC_DisableIRQ_0
        MOVS     R2,#+1
        ANDS     R1,R0,#0x1F
        LSLS     R2,R2,R1
        LDR.N    R1,??DataTable6_1  ;; 0xe000e180
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R2,[R1, R0, LSL #+2]
??__NVIC_DisableIRQ_0:
        BX       LR               ;; return
//    2 
//    3 #define H_MAX 100//hangshu
//    4 #define L_MAX 100//lieshu
//    5 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//    6 static boolean acq_flag;
acq_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    7 static uint32 vsync_cnt, href_cnt, rowacq_cnt;
vsync_cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
href_cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
rowacq_cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    8 static uint8 Pix_Data[500];
Pix_Data:
        DS8 500
//    9 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   10 static void vsync_isr(){
//   11     if(LPLD_GPIO_IsPinxExt(PORTD, GPIO_Pin14))
vsync_isr:
        LDR.N    R0,??DataTable6_2  ;; 0x4004c0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+17
        BPL.N    ??vsync_isr_0
//   12   {
//   13     LPLD_DMA_LoadDstAddr(DMA_CH0, Pix_Data);
        LDR.N    R0,??DataTable6_3
        LDR.N    R1,??DataTable6_4  ;; 0x40009010
        STR      R0,[R1, #+0]
//   14     LPLD_DMA_LoadSrcAddr(DMA_CH0, &PTE->PDIR);
        LDR.N    R0,??DataTable6_5  ;; 0x400ff110
        LDR.N    R1,??DataTable6_6  ;; 0x40009000
        STR      R0,[R1, #+0]
//   15     vsync_cnt++;
        LDR.N    R0,??DataTable6_7
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_7
        STR      R0,[R1, #+0]
//   16     href_cnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//   17     rowacq_cnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_9
        STR      R0,[R1, #+0]
//   18     acq_flag=TRUE;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_10
        STRB     R0,[R1, #+0]
//   19   }
//   20 }
??vsync_isr_0:
        BX       LR               ;; return
//   21 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   22 static void href_isr(){
//   23     if(LPLD_GPIO_IsPinxExt(PORTD, GPIO_Pin13))
href_isr:
        LDR.N    R0,??DataTable6_2  ;; 0x4004c0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+18
        BPL.N    ??href_isr_0
//   24   {
//   25     if(acq_flag){
        LDR.N    R0,??DataTable6_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??href_isr_0
//   26     LPLD_DMA_EnableReq(DMA_CH0);
        LDR.N    R0,??DataTable6_11  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable6_11  ;; 0x4000800c
        STR      R0,[R1, #+0]
//   27     href_cnt++;
        LDR.N    R0,??DataTable6_8
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//   28     }
//   29   }
//   30 }
??href_isr_0:
        BX       LR               ;; return
//   31 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 static void row_finish(){
row_finish:
        PUSH     {R7,LR}
//   33   rowacq_cnt++;
        LDR.N    R0,??DataTable6_9
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable6_9
        STR      R0,[R1, #+0]
//   34   if(rowacq_cnt==H_MAX){
        LDR.N    R0,??DataTable6_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+100
        BNE.N    ??row_finish_0
//   35      acq_flag = FALSE;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_10
        STRB     R0,[R1, #+0]
//   36      disable_irq(PORTD_IRQn);
        MOVS     R0,#+90
        BL       __NVIC_DisableIRQ
//   37   }
//   38 }
??row_finish_0:
        POP      {R0,PC}          ;; return
//   39 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   40 void camera__take_a_photo_please(void){
camera__take_a_photo_please:
        PUSH     {R7,LR}
//   41     if(acq_flag == TRUE) return;
        LDR.N    R0,??DataTable6_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??camera__take_a_photo_please_0
//   42     LPLD_GPIO_ClearIntFlag(PORTD);
??camera__take_a_photo_please_1:
        MOVS     R0,#-1
        LDR.N    R1,??DataTable6_2  ;; 0x4004c0a0
        STR      R0,[R1, #+0]
//   43     enable_irq(PORTD_IRQn);
        MOVS     R0,#+90
        BL       __NVIC_EnableIRQ
//   44 }
??camera__take_a_photo_please_0:
        POP      {R0,PC}          ;; return
//   45 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   46 void ov7620__config(){
ov7620__config:
        PUSH     {LR}
        SUB      SP,SP,#+76
//   47     GPIO_InitTypeDef gpio_init={0};
        ADD      R0,SP,#+4
        MOVS     R1,#+20
        BL       __aeabi_memclr4
//   48     DMA_InitTypeDef  dma_init={0};
        ADD      R0,SP,#+28
        MOVS     R1,#+44
        BL       __aeabi_memclr4
//   49     
//   50     // init vsync 
//   51     gpio_init.GPIO_PTx = PTD;
        LDR.N    R0,??DataTable6_12  ;; 0x400ff0c0
        STR      R0,[SP, #+4]
//   52     gpio_init.GPIO_Pins = GPIO_Pin14;
        MOV      R0,#+16384
        STR      R0,[SP, #+8]
//   53     gpio_init.GPIO_Dir = DIR_INPUT; 
        MOVS     R0,#+0
        STRB     R0,[SP, #+16]
//   54     gpio_init.GPIO_Isr = vsync_isr;
        LDR.N    R0,??DataTable6_13
        STR      R0,[SP, #+20]
//   55     gpio_init.GPIO_PinControl = INPUT_PULL_DOWN|IRQC_FA;
        LDR.N    R0,??DataTable6_14  ;; 0xa0002
        STR      R0,[SP, #+12]
//   56     LPLD_GPIO_Init(gpio_init);
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   57     
//   58     // init href
//   59     gpio_init.GPIO_PTx = PTD;
        LDR.N    R0,??DataTable6_12  ;; 0x400ff0c0
        STR      R0,[SP, #+4]
//   60     gpio_init.GPIO_Pins = GPIO_Pin13;
        MOV      R0,#+8192
        STR      R0,[SP, #+8]
//   61     gpio_init.GPIO_Dir = DIR_INPUT; 
        MOVS     R0,#+0
        STRB     R0,[SP, #+16]
//   62     gpio_init.GPIO_Isr = href_isr;
        LDR.N    R0,??DataTable6_15
        STR      R0,[SP, #+20]
//   63     gpio_init.GPIO_PinControl = INPUT_PULL_UP|IRQC_RI;
        LDR.N    R0,??DataTable6_16  ;; 0x90003
        STR      R0,[SP, #+12]
//   64     LPLD_GPIO_Init(gpio_init);    
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   65    ///////////////////////////////////// disable_irq()
//   66     
//   67     // init pclk
//   68     gpio_init.GPIO_PTx = PTD;
        LDR.N    R0,??DataTable6_12  ;; 0x400ff0c0
        STR      R0,[SP, #+4]
//   69     gpio_init.GPIO_Pins = GPIO_Pin12;
        MOV      R0,#+4096
        STR      R0,[SP, #+8]
//   70     gpio_init.GPIO_Dir = DIR_INPUT; 
        MOVS     R0,#+0
        STRB     R0,[SP, #+16]
//   71     gpio_init.GPIO_Isr = NULL;
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
//   72     gpio_init.GPIO_PinControl = INPUT_PULL_UP|IRQC_DMARI;
        LDR.N    R0,??DataTable6_17  ;; 0x10003
        STR      R0,[SP, #+12]
//   73     LPLD_GPIO_Init(gpio_init);  
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   74     
//   75     // init d0-d7
//   76     gpio_init.GPIO_PTx = PTE;      
        LDR.N    R0,??DataTable6_18  ;; 0x400ff100
        STR      R0,[SP, #+4]
//   77     gpio_init.GPIO_Pins = GPIO_Pin0_7;     
        MOVS     R0,#+255
        STR      R0,[SP, #+8]
//   78     gpio_init.GPIO_Dir = DIR_INPUT;        
        MOVS     R0,#+0
        STRB     R0,[SP, #+16]
//   79     gpio_init.GPIO_Isr = NULL;
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
//   80     gpio_init.GPIO_PinControl = INPUT_PULL_DOWN|IRQC_DIS;   
        MOVS     R0,#+2
        STR      R0,[SP, #+12]
//   81     LPLD_GPIO_Init(gpio_init);
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   82        
//   83     //���ý���DMA
//   84     dma_init.DMA_CHx = DMA_CH0; 
        MOVS     R0,#+0
        STRB     R0,[SP, #+28]
//   85     dma_init.DMA_MajorLoopCnt   = 8; 
        MOVS     R0,#+8
        STRH     R0,[SP, #+32]
//   86     dma_init.DMA_MinorByteCnt   = 1; 
        MOVS     R0,#+1
        STR      R0,[SP, #+36]
//   87     dma_init.DMA_MajorCompleteIntEnable = TRUE; 
        MOVS     R0,#+1
        STRB     R0,[SP, #+65]
//   88     dma_init.DMA_Req            = PORTE_DMAREQ; 
        MOVS     R0,#+53
        STRB     R0,[SP, #+29]
//   89     
//   90     dma_init.DMA_DestAddr       = (uint32)Pix_Data; 
        LDR.N    R0,??DataTable6_3
        STR      R0,[SP, #+52]
//   91     dma_init.DMA_DestAddrOffset = 1;                
        MOVS     R0,#+1
        STRH     R0,[SP, #+58]
//   92     dma_init.DMA_DestDataSize   = DMA_DST_8BIT;     
        MOVS     R0,#+0
        STRB     R0,[SP, #+56]
//   93     
//   94     dma_init.DMA_SourceAddr     = (uint32)&PTE->PDIR;
        LDR.N    R0,??DataTable6_5  ;; 0x400ff110
        STR      R0,[SP, #+40]
//   95     dma_init.DMA_SourceDataSize = DMA_SRC_8BIT;   
        MOVS     R0,#+0
        STRB     R0,[SP, #+44]
//   96     
//   97     dma_init.DMA_AutoDisableReq = TRUE;            
        MOVS     R0,#+1
        STRB     R0,[SP, #+64]
//   98     dma_init.DMA_Isr = row_finish; /////
        LDR.N    R0,??DataTable6_19
        STR      R0,[SP, #+68]
//   99     
//  100     LPLD_DMA_Init(dma_init); 
        ADD      R1,SP,#+28
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//  101     //LPLD_DMA_DisableReq(DMA_CH0);
//  102     LPLD_DMA_EnableIrq(dma_init);
        ADD      R1,SP,#+28
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_EnableIrq
//  103     
//  104     ///////////////
//  105     vsync_cnt=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_7
        STR      R0,[R1, #+0]
//  106 }
        ADD      SP,SP,#+76
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x4004c0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     Pix_Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x40009010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x400ff110

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x40009000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     vsync_cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     href_cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     rowacq_cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     acq_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     0x4000800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     vsync_isr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     0xa0002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     href_isr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     0x90003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_17:
        DC32     0x10003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_18:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_19:
        DC32     row_finish

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  107 
//  108 
//  109 
//  110 
//  111 
//  112 
//  113 
//  114 
//  115 
//  116 
//  117 
//  118 
//  119 
//  120 
//  121 
//  122 
//  123 
//  124 
//  125 
//  126 
// 
// 513 bytes in section .bss
//  64 bytes in section .rodata
// 578 bytes in section .text
// 
// 578 bytes of CODE  memory
//  64 bytes of CONST memory
// 513 bytes of DATA  memory
//
//Errors: none
//Warnings: none
