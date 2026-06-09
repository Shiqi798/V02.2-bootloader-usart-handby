#line 1 "..\\User\\main.c"
#line 1 "..\\Driver\\HeaderFiles\\HeaderFiles.h"


 

#line 1 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"





 



























 

 








 
#line 54 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"
   




 




 




 




 




 




 




 


 
#line 101 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"

 





 
typedef enum IRQn
{
     
    NonMaskableInt_IRQn          = -14,     
    MemoryManagement_IRQn        = -12,     
    BusFault_IRQn                = -11,     
    UsageFault_IRQn              = -10,     
    SVCall_IRQn                  = -5,      
    DebugMonitor_IRQn            = -4,      
    PendSV_IRQn                  = -2,      
    SysTick_IRQn                 = -1,      
     
    WWDGT_IRQn                   = 0,       
    LVD_IRQn                     = 1,       
    TAMPER_STAMP_IRQn            = 2,       
    RTC_WKUP_IRQn                = 3,       
    FMC_IRQn                     = 4,       
    RCU_CTC_IRQn                 = 5,       
    EXTI0_IRQn                   = 6,       
    EXTI1_IRQn                   = 7,       
    EXTI2_IRQn                   = 8,       
    EXTI3_IRQn                   = 9,       
    EXTI4_IRQn                   = 10,      
    DMA0_Channel0_IRQn           = 11,      
    DMA0_Channel1_IRQn           = 12,      
    DMA0_Channel2_IRQn           = 13,      
    DMA0_Channel3_IRQn           = 14,      
    DMA0_Channel4_IRQn           = 15,      
    DMA0_Channel5_IRQn           = 16,      
    DMA0_Channel6_IRQn           = 17,      
    ADC_IRQn                     = 18,      
    CAN0_TX_IRQn                 = 19,      
    CAN0_RX0_IRQn                = 20,      
    CAN0_RX1_IRQn                = 21,      
    CAN0_EWMC_IRQn               = 22,      
    EXTI5_9_IRQn                 = 23,      
    TIMER0_BRK_TIMER8_IRQn       = 24,      
    TIMER0_UP_TIMER9_IRQn        = 25,      
    TIMER0_TRG_CMT_TIMER10_IRQn  = 26,      
    TIMER0_Channel_IRQn          = 27,      
    TIMER1_IRQn                  = 28,      
    TIMER2_IRQn                  = 29,      
    TIMER3_IRQn                  = 30,      
    I2C0_EV_IRQn                 = 31,      
    I2C0_ER_IRQn                 = 32,      
    I2C1_EV_IRQn                 = 33,      
    I2C1_ER_IRQn                 = 34,      
    SPI0_IRQn                    = 35,      
    SPI1_IRQn                    = 36,      
    USART0_IRQn                  = 37,      
    USART1_IRQn                  = 38,      
    USART2_IRQn                  = 39,      
    EXTI10_15_IRQn               = 40,      
    RTC_Alarm_IRQn               = 41,      
    USBFS_WKUP_IRQn              = 42,      
    TIMER7_BRK_TIMER11_IRQn      = 43,      
    TIMER7_UP_TIMER12_IRQn       = 44,      
    TIMER7_TRG_CMT_TIMER13_IRQn  = 45,      
    TIMER7_Channel_IRQn          = 46,      
    DMA0_Channel7_IRQn           = 47,      
    

    EXMC_IRQn                    = 48,      
    SDIO_IRQn                    = 49,      
    TIMER4_IRQn                  = 50,      
    SPI2_IRQn                    = 51,      
    UART3_IRQn                   = 52,      
    UART4_IRQn                   = 53,      
    TIMER5_DAC_IRQn              = 54,      
    TIMER6_IRQn                  = 55,      
    DMA1_Channel0_IRQn           = 56,      
    DMA1_Channel1_IRQn           = 57,      
    DMA1_Channel2_IRQn           = 58,      
    DMA1_Channel3_IRQn           = 59,      
    DMA1_Channel4_IRQn           = 60,      
    ENET_IRQn                    = 61,      
    ENET_WKUP_IRQn               = 62,      
    CAN1_TX_IRQn                 = 63,      
    CAN1_RX0_IRQn                = 64,      
    CAN1_RX1_IRQn                = 65,      
    CAN1_EWMC_IRQn               = 66,      
    USBFS_IRQn                   = 67,      
    DMA1_Channel5_IRQn           = 68,      
    DMA1_Channel6_IRQn           = 69,      
    DMA1_Channel7_IRQn           = 70,      
    USART5_IRQn                  = 71,      
    I2C2_EV_IRQn                 = 72,      
    I2C2_ER_IRQn                 = 73,      
    USBHS_EP1_Out_IRQn           = 74,      
    USBHS_EP1_In_IRQn            = 75,      
    USBHS_WKUP_IRQn              = 76,      
    USBHS_IRQn                   = 77,      
    DCI_IRQn                     = 78,      
    TRNG_IRQn                    = 80,      
    FPU_IRQn                     = 81,      
    UART6_IRQn                   = 82,      
    UART7_IRQn                   = 83,      
    SPI3_IRQn                    = 84,      
    SPI4_IRQn                    = 85,      
    SPI5_IRQn                    = 86,      
    TLI_IRQn                     = 88,      
    TLI_ER_IRQn                  = 89,      
    IPA_IRQn                     = 90,      


#line 246 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"

#line 282 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"

} IRQn_Type;

 
#line 1 "..\\Driver\\Start\\CMSIS\\core_cm4.h"
 







 

























 
























 




 


 

 













#line 110 "..\\Driver\\Start\\CMSIS\\core_cm4.h"


 
#line 124 "..\\Driver\\Start\\CMSIS\\core_cm4.h"

#line 185 "..\\Driver\\Start\\CMSIS\\core_cm4.h"

#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 187 "..\\Driver\\Start\\CMSIS\\core_cm4.h"
#line 1 "..\\Driver\\Start\\CMSIS\\core_cmInstr.h"
 




















 





 



 


 









 







 







 






 








 







 







 









 









 
__attribute__((section(".rev16_text"))) static __inline __asm uint32_t __REV16(uint32_t value)
{
  rev16 r0, r0
  bx lr
}








 
__attribute__((section(".revsh_text"))) static __inline __asm int32_t __REVSH(int32_t value)
{
  revsh r0, r0
  bx lr
}









 











 









 









 









 











 











 











 







 










 










 









 






#line 615 "..\\Driver\\Start\\CMSIS\\core_cmInstr.h"

   

#line 188 "..\\Driver\\Start\\CMSIS\\core_cm4.h"
#line 1 "..\\Driver\\Start\\CMSIS\\core_cmFunc.h"
 




















 





 



 


 





 
 






 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}







 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}







 
static __inline uint32_t __get_IPSR(void)
{
  register uint32_t __regIPSR          __asm("ipsr");
  return(__regIPSR);
}







 
static __inline uint32_t __get_APSR(void)
{
  register uint32_t __regAPSR          __asm("apsr");
  return(__regAPSR);
}







 
static __inline uint32_t __get_xPSR(void)
{
  register uint32_t __regXPSR          __asm("xpsr");
  return(__regXPSR);
}







 
static __inline uint32_t __get_PSP(void)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  return(__regProcessStackPointer);
}







 
static __inline void __set_PSP(uint32_t topOfProcStack)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  __regProcessStackPointer = topOfProcStack;
}







 
static __inline uint32_t __get_MSP(void)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  return(__regMainStackPointer);
}







 
static __inline void __set_MSP(uint32_t topOfMainStack)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  __regMainStackPointer = topOfMainStack;
}







 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}







 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}








 







 








 
static __inline uint32_t  __get_BASEPRI(void)
{
  register uint32_t __regBasePri         __asm("basepri");
  return(__regBasePri);
}







 
static __inline void __set_BASEPRI(uint32_t basePri)
{
  register uint32_t __regBasePri         __asm("basepri");
  __regBasePri = (basePri & 0xff);
}







 
static __inline uint32_t __get_FAULTMASK(void)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  return(__regFaultMask);
}







 
static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  __regFaultMask = (faultMask & (uint32_t)1);
}











 
static __inline uint32_t __get_FPSCR(void)
{

  register uint32_t __regfpscr         __asm("fpscr");
  return(__regfpscr);



}







 
static __inline void __set_FPSCR(uint32_t fpscr)
{

  register uint32_t __regfpscr         __asm("fpscr");
  __regfpscr = (fpscr);

}




#line 612 "..\\Driver\\Start\\CMSIS\\core_cmFunc.h"

 


#line 189 "..\\Driver\\Start\\CMSIS\\core_cm4.h"
#line 1 "..\\Driver\\Start\\CMSIS\\core_cm4_simd.h"
 







 

























 
















 


 



 


 
#line 122 "..\\Driver\\Start\\CMSIS\\core_cm4_simd.h"











#line 689 "..\\Driver\\Start\\CMSIS\\core_cm4_simd.h"

 






#line 190 "..\\Driver\\Start\\CMSIS\\core_cm4.h"








 
#line 225 "..\\Driver\\Start\\CMSIS\\core_cm4.h"

 






 
#line 241 "..\\Driver\\Start\\CMSIS\\core_cm4.h"

 













 


 





 


 
typedef union
{
  struct
  {



    uint32_t _reserved0:16;               
    uint32_t GE:4;                        
    uint32_t _reserved1:7;                

    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} APSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:23;               
  } b;                                    
  uint32_t w;                             
} IPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       



    uint32_t _reserved0:7;                
    uint32_t GE:4;                        
    uint32_t _reserved1:4;                

    uint32_t T:1;                         
    uint32_t IT:2;                        
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} xPSR_Type;



 
typedef union
{
  struct
  {
    uint32_t nPRIV:1;                     
    uint32_t SPSEL:1;                     
    uint32_t FPCA:1;                      
    uint32_t _reserved0:29;               
  } b;                                    
  uint32_t w;                             
} CONTROL_Type;

 






 


 
typedef struct
{
  volatile uint32_t ISER[8];                  
       uint32_t RESERVED0[24];
  volatile uint32_t ICER[8];                  
       uint32_t RSERVED1[24];
  volatile uint32_t ISPR[8];                  
       uint32_t RESERVED2[24];
  volatile uint32_t ICPR[8];                  
       uint32_t RESERVED3[24];
  volatile uint32_t IABR[8];                  
       uint32_t RESERVED4[56];
  volatile uint8_t  IP[240];                  
       uint32_t RESERVED5[644];
  volatile  uint32_t STIR;                     
}  NVIC_Type;

 



 






 


 
typedef struct
{
  volatile const  uint32_t CPUID;                    
  volatile uint32_t ICSR;                     
  volatile uint32_t VTOR;                     
  volatile uint32_t AIRCR;                    
  volatile uint32_t SCR;                      
  volatile uint32_t CCR;                      
  volatile uint8_t  SHP[12];                  
  volatile uint32_t SHCSR;                    
  volatile uint32_t CFSR;                     
  volatile uint32_t HFSR;                     
  volatile uint32_t DFSR;                     
  volatile uint32_t MMFAR;                    
  volatile uint32_t BFAR;                     
  volatile uint32_t AFSR;                     
  volatile const  uint32_t PFR[2];                   
  volatile const  uint32_t DFR;                      
  volatile const  uint32_t ADR;                      
  volatile const  uint32_t MMFR[4];                  
  volatile const  uint32_t ISAR[5];                  
       uint32_t RESERVED0[5];
  volatile uint32_t CPACR;                    
} SCB_Type;

 















 






























 



 





















 









 


















 










































 









 









 















 






 


 
typedef struct
{
       uint32_t RESERVED0[1];
  volatile const  uint32_t ICTR;                     
  volatile uint32_t ACTLR;                    
} SCnSCB_Type;

 



 















 






 


 
typedef struct
{
  volatile uint32_t CTRL;                     
  volatile uint32_t LOAD;                     
  volatile uint32_t VAL;                      
  volatile const  uint32_t CALIB;                    
} SysTick_Type;

 












 



 



 









 






 


 
typedef struct
{
  volatile  union
  {
    volatile  uint8_t    u8;                   
    volatile  uint16_t   u16;                  
    volatile  uint32_t   u32;                  
  }  PORT [32];                           
       uint32_t RESERVED0[864];
  volatile uint32_t TER;                      
       uint32_t RESERVED1[15];
  volatile uint32_t TPR;                      
       uint32_t RESERVED2[15];
  volatile uint32_t TCR;                      
       uint32_t RESERVED3[29];
  volatile  uint32_t IWR;                      
  volatile const  uint32_t IRR;                      
  volatile uint32_t IMCR;                     
       uint32_t RESERVED4[43];
  volatile  uint32_t LAR;                      
  volatile const  uint32_t LSR;                      
       uint32_t RESERVED5[6];
  volatile const  uint32_t PID4;                     
  volatile const  uint32_t PID5;                     
  volatile const  uint32_t PID6;                     
  volatile const  uint32_t PID7;                     
  volatile const  uint32_t PID0;                     
  volatile const  uint32_t PID1;                     
  volatile const  uint32_t PID2;                     
  volatile const  uint32_t PID3;                     
  volatile const  uint32_t CID0;                     
  volatile const  uint32_t CID1;                     
  volatile const  uint32_t CID2;                     
  volatile const  uint32_t CID3;                     
} ITM_Type;

 



 



























 



 



 



 









   






 


 
typedef struct
{
  volatile uint32_t CTRL;                     
  volatile uint32_t CYCCNT;                   
  volatile uint32_t CPICNT;                   
  volatile uint32_t EXCCNT;                   
  volatile uint32_t SLEEPCNT;                 
  volatile uint32_t LSUCNT;                   
  volatile uint32_t FOLDCNT;                  
  volatile const  uint32_t PCSR;                     
  volatile uint32_t COMP0;                    
  volatile uint32_t MASK0;                    
  volatile uint32_t FUNCTION0;                
       uint32_t RESERVED0[1];
  volatile uint32_t COMP1;                    
  volatile uint32_t MASK1;                    
  volatile uint32_t FUNCTION1;                
       uint32_t RESERVED1[1];
  volatile uint32_t COMP2;                    
  volatile uint32_t MASK2;                    
  volatile uint32_t FUNCTION2;                
       uint32_t RESERVED2[1];
  volatile uint32_t COMP3;                    
  volatile uint32_t MASK3;                    
  volatile uint32_t FUNCTION3;                
} DWT_Type;

 






















































 



 



 



 



 



 



 



























   






 


 
typedef struct
{
  volatile uint32_t SSPSR;                    
  volatile uint32_t CSPSR;                    
       uint32_t RESERVED0[2];
  volatile uint32_t ACPR;                     
       uint32_t RESERVED1[55];
  volatile uint32_t SPPR;                     
       uint32_t RESERVED2[131];
  volatile const  uint32_t FFSR;                     
  volatile uint32_t FFCR;                     
  volatile const  uint32_t FSCR;                     
       uint32_t RESERVED3[759];
  volatile const  uint32_t TRIGGER;                  
  volatile const  uint32_t FIFO0;                    
  volatile const  uint32_t ITATBCTR2;                
       uint32_t RESERVED4[1];
  volatile const  uint32_t ITATBCTR0;                
  volatile const  uint32_t FIFO1;                    
  volatile uint32_t ITCTRL;                   
       uint32_t RESERVED5[39];
  volatile uint32_t CLAIMSET;                 
  volatile uint32_t CLAIMCLR;                 
       uint32_t RESERVED7[8];
  volatile const  uint32_t DEVID;                    
  volatile const  uint32_t DEVTYPE;                  
} TPI_Type;

 



 



 












 






 



 





















 



 





















 



 



 


















 






   







 


 
typedef struct
{
  volatile const  uint32_t TYPE;                     
  volatile uint32_t CTRL;                     
  volatile uint32_t RNR;                      
  volatile uint32_t RBAR;                     
  volatile uint32_t RASR;                     
  volatile uint32_t RBAR_A1;                  
  volatile uint32_t RASR_A1;                  
  volatile uint32_t RBAR_A2;                  
  volatile uint32_t RASR_A2;                  
  volatile uint32_t RBAR_A3;                  
  volatile uint32_t RASR_A3;                  
} MPU_Type;

 









 









 



 









 






























 








 


 
typedef struct
{
       uint32_t RESERVED0[1];
  volatile uint32_t FPCCR;                    
  volatile uint32_t FPCAR;                    
  volatile uint32_t FPDSCR;                   
  volatile const  uint32_t MVFR0;                    
  volatile const  uint32_t MVFR1;                    
} FPU_Type;

 



























 



 












 
























 












 







 


 
typedef struct
{
  volatile uint32_t DHCSR;                    
  volatile  uint32_t DCRSR;                    
  volatile uint32_t DCRDR;                    
  volatile uint32_t DEMCR;                    
} CoreDebug_Type;

 




































 






 







































 






 

 
#line 1399 "..\\Driver\\Start\\CMSIS\\core_cm4.h"

#line 1408 "..\\Driver\\Start\\CMSIS\\core_cm4.h"











 










 

 



 




 










 
static __inline void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07);                

  reg_value  =  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;                                                    
  reg_value &= ~((0xFFFFUL << 16) | (7UL << 8));              
  reg_value  =  (reg_value                                 |
                ((uint32_t)0x5FA << 16) |
                (PriorityGroupTmp << 8));                                      
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR =  reg_value;
}







 
static __inline uint32_t NVIC_GetPriorityGrouping(void)
{
  return ((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8)) >> 8);    
}







 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
 
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(uint32_t)((int32_t)IRQn) >> 5] = (uint32_t)(1 << ((uint32_t)((int32_t)IRQn) & (uint32_t)0x1F));  
}







 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}











 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}







 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}







 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}










 
static __inline uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
  return((uint32_t)((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(uint32_t)(IRQn) >> 5] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}










 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[((uint32_t)(IRQn) & 0xF)-4] = ((priority << (8 - 4)) & 0xff); }  
  else {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[(uint32_t)(IRQn)] = ((priority << (8 - 4)) & 0xff);    }         
}












 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)(((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHP[((uint32_t)(IRQn) & 0xF)-4] >> (8 - 4)));  }  
  else {
    return((uint32_t)(((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[(uint32_t)(IRQn)]           >> (8 - 4)));  }  
}













 
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);           
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 4) ? 4 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 4) < 7) ? 0 : PriorityGroupTmp - 7 + 4;

  return (
           ((PreemptPriority & ((1 << (PreemptPriorityBits)) - 1)) << SubPriorityBits) |
           ((SubPriority     & ((1 << (SubPriorityBits    )) - 1)))
         );
}













 
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & 0x07);           
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7 - PriorityGroupTmp) > 4) ? 4 : 7 - PriorityGroupTmp;
  SubPriorityBits     = ((PriorityGroupTmp + 4) < 7) ? 0 : PriorityGroupTmp - 7 + 4;

  *pPreemptPriority = (Priority >> SubPriorityBits) & ((1 << (PreemptPriorityBits)) - 1);
  *pSubPriority     = (Priority                   ) & ((1 << (SubPriorityBits    )) - 1);
}





 
static __inline void NVIC_SystemReset(void)
{
  __dsb(0xF);                                                     
 
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR  = ((0x5FA << 16)      |
                 (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8)) |
                 (1UL << 2));                    
  __dsb(0xF);                                                      
  while(1);                                                     
}

 



 




 

















 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1) > (0xFFFFFFUL << 0))  return (1);       

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD  = ticks - 1;                                   
  NVIC_SetPriority (SysTick_IRQn, (1<<4) - 1);   
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL   = 0;                                           
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL  = (1UL << 2) |
                   (1UL << 1)   |
                   (1UL << 0);                     
  return (0);                                                   
}



 



 




 

extern volatile int32_t ITM_RxBuffer;                     












 
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if ((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL << 0))                  &&       
      (((ITM_Type *) (0xE0000000UL) )->TER & (1UL << 0)        )                    )      
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0].u32 == 0);
    ((ITM_Type *) (0xE0000000UL) )->PORT[0].u8 = (uint8_t) ch;
  }
  return (ch);
}








 
static __inline int32_t ITM_ReceiveChar (void) {
  int32_t ch = -1;                            

  if (ITM_RxBuffer != 0x5AA55AA5) {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = 0x5AA55AA5;        
  }

  return (ch);
}








 
static __inline int32_t ITM_CheckChar (void) {

  if (ITM_RxBuffer == 0x5AA55AA5) {
    return (0);                                  
  } else {
    return (1);                                  
  }
}

 





#line 287 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"
#line 1 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\system_gd32f4xx.h"




 



























 

 








#line 45 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\system_gd32f4xx.h"

 
extern uint32_t SystemCoreClock;

 
 
extern void SystemInit (void);
 
extern void SystemCoreClockUpdate (void);





#line 288 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"
#line 289 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"

 
typedef enum {DISABLE = 0, ENABLE = !DISABLE} EventStatus, ControlStatus;
typedef enum {RESET = 0, SET = !RESET} FlagStatus;
typedef enum {ERROR = 0, SUCCESS = !ERROR} ErrStatus;

 
#line 302 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"

 





 





 


 
#line 332 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"

 





 
#line 349 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"

 



 



 
#line 1 "..\\User\\gd32f4xx_libopt.h"





 


























 




#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"





 


























 




#line 1 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"





 



























 

 

#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 


 
#line 76 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
 
#line 93 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 






 
#line 113 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 138 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 155 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 



                                    
 


 
#line 190 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 207 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 230 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 




 


 
#line 265 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 284 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 310 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 




 


 
#line 345 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 364 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 373 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 385 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 395 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 



 




 



 






 




 



 



 



 


 


 
 



 


 
 
#line 461 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

                                         
#line 470 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 




 



 
#line 487 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
typedef enum
{
     
    RCU_GPIOA     = (((uint32_t)(0x30U) << 6) | (uint32_t)(0U)),                   
    RCU_GPIOB     = (((uint32_t)(0x30U) << 6) | (uint32_t)(1U)),                   
    RCU_GPIOC     = (((uint32_t)(0x30U) << 6) | (uint32_t)(2U)),                   
    RCU_GPIOD     = (((uint32_t)(0x30U) << 6) | (uint32_t)(3U)),                   
    RCU_GPIOE     = (((uint32_t)(0x30U) << 6) | (uint32_t)(4U)),                   
    RCU_GPIOF     = (((uint32_t)(0x30U) << 6) | (uint32_t)(5U)),                   
    RCU_GPIOG     = (((uint32_t)(0x30U) << 6) | (uint32_t)(6U)),                   
    RCU_GPIOH     = (((uint32_t)(0x30U) << 6) | (uint32_t)(7U)),                   
    RCU_GPIOI     = (((uint32_t)(0x30U) << 6) | (uint32_t)(8U)),                   
    RCU_CRC       = (((uint32_t)(0x30U) << 6) | (uint32_t)(12U)),                  
    RCU_BKPSRAM   = (((uint32_t)(0x30U) << 6) | (uint32_t)(18U)),                  
    RCU_TCMSRAM   = (((uint32_t)(0x30U) << 6) | (uint32_t)(20U)),                  
    RCU_DMA0      = (((uint32_t)(0x30U) << 6) | (uint32_t)(21U)),                  
    RCU_DMA1      = (((uint32_t)(0x30U) << 6) | (uint32_t)(22U)),                  
    RCU_IPA       = (((uint32_t)(0x30U) << 6) | (uint32_t)(23U)),                  
    RCU_ENET      = (((uint32_t)(0x30U) << 6) | (uint32_t)(25U)),                  
    RCU_ENETTX    = (((uint32_t)(0x30U) << 6) | (uint32_t)(26U)),                  
    RCU_ENETRX    = (((uint32_t)(0x30U) << 6) | (uint32_t)(27U)),                  
    RCU_ENETPTP   = (((uint32_t)(0x30U) << 6) | (uint32_t)(28U)),                  
    RCU_USBHS     = (((uint32_t)(0x30U) << 6) | (uint32_t)(29U)),                  
    RCU_USBHSULPI = (((uint32_t)(0x30U) << 6) | (uint32_t)(30U)),                  
     
    RCU_DCI       = (((uint32_t)(0x34U) << 6) | (uint32_t)(0U)),                   
    RCU_TRNG      = (((uint32_t)(0x34U) << 6) | (uint32_t)(6U)),                   
    RCU_USBFS     = (((uint32_t)(0x34U) << 6) | (uint32_t)(7U)),                   
     
    RCU_EXMC      = (((uint32_t)(0x38U) << 6) | (uint32_t)(0U)),                   
     
    RCU_TIMER1    = (((uint32_t)(0x40U) << 6) | (uint32_t)(0U)),                   
    RCU_TIMER2    = (((uint32_t)(0x40U) << 6) | (uint32_t)(1U)),                   
    RCU_TIMER3    = (((uint32_t)(0x40U) << 6) | (uint32_t)(2U)),                   
    RCU_TIMER4    = (((uint32_t)(0x40U) << 6) | (uint32_t)(3U)),                   
    RCU_TIMER5    = (((uint32_t)(0x40U) << 6) | (uint32_t)(4U)),                   
    RCU_TIMER6    = (((uint32_t)(0x40U) << 6) | (uint32_t)(5U)),                   
    RCU_TIMER11   = (((uint32_t)(0x40U) << 6) | (uint32_t)(6U)),                   
    RCU_TIMER12   = (((uint32_t)(0x40U) << 6) | (uint32_t)(7U)),                   
    RCU_TIMER13   = (((uint32_t)(0x40U) << 6) | (uint32_t)(8U)),                      
    RCU_WWDGT     = (((uint32_t)(0x40U) << 6) | (uint32_t)(11U)),                  
    RCU_SPI1      = (((uint32_t)(0x40U) << 6) | (uint32_t)(14U)),                  
    RCU_SPI2      = (((uint32_t)(0x40U) << 6) | (uint32_t)(15U)),                  
    RCU_USART1    = (((uint32_t)(0x40U) << 6) | (uint32_t)(17U)),                  
    RCU_USART2    = (((uint32_t)(0x40U) << 6) | (uint32_t)(18U)),                  
    RCU_UART3     = (((uint32_t)(0x40U) << 6) | (uint32_t)(19U)),                  
    RCU_UART4     = (((uint32_t)(0x40U) << 6) | (uint32_t)(20U)),                  
    RCU_I2C0      = (((uint32_t)(0x40U) << 6) | (uint32_t)(21U)),                  
    RCU_I2C1      = (((uint32_t)(0x40U) << 6) | (uint32_t)(22U)),                  
    RCU_I2C2      = (((uint32_t)(0x40U) << 6) | (uint32_t)(23U)),                     
    RCU_CAN0      = (((uint32_t)(0x40U) << 6) | (uint32_t)(25U)),                  
    RCU_CAN1      = (((uint32_t)(0x40U) << 6) | (uint32_t)(26U)),                  
    RCU_PMU       = (((uint32_t)(0x40U) << 6) | (uint32_t)(28U)),                  
    RCU_DAC       = (((uint32_t)(0x40U) << 6) | (uint32_t)(29U)),                  
    RCU_UART6     = (((uint32_t)(0x40U) << 6) | (uint32_t)(30U)),                  
    RCU_UART7     = (((uint32_t)(0x40U) << 6) | (uint32_t)(31U)),                  
    RCU_RTC       = (((uint32_t)(0x70U) << 6) | (uint32_t)(15U)),                   
     
    RCU_TIMER0    = (((uint32_t)(0x44U) << 6) | (uint32_t)(0U)),                   
    RCU_TIMER7    = (((uint32_t)(0x44U) << 6) | (uint32_t)(1U)),                   
    RCU_USART0    = (((uint32_t)(0x44U) << 6) | (uint32_t)(4U)),                   
    RCU_USART5    = (((uint32_t)(0x44U) << 6) | (uint32_t)(5U)),                   
    RCU_ADC0      = (((uint32_t)(0x44U) << 6) | (uint32_t)(8U)),                   
    RCU_ADC1      = (((uint32_t)(0x44U) << 6) | (uint32_t)(9U)),                   
    RCU_ADC2      = (((uint32_t)(0x44U) << 6) | (uint32_t)(10U)),                  
    RCU_SDIO      = (((uint32_t)(0x44U) << 6) | (uint32_t)(11U)),                  
    RCU_SPI0      = (((uint32_t)(0x44U) << 6) | (uint32_t)(12U)),                  
    RCU_SPI3      = (((uint32_t)(0x44U) << 6) | (uint32_t)(13U)),                  
    RCU_SYSCFG    = (((uint32_t)(0x44U) << 6) | (uint32_t)(14U)),                  
    RCU_TIMER8    = (((uint32_t)(0x44U) << 6) | (uint32_t)(16U)),                  
    RCU_TIMER9    = (((uint32_t)(0x44U) << 6) | (uint32_t)(17U)),                  
    RCU_TIMER10   = (((uint32_t)(0x44U) << 6) | (uint32_t)(18U)),                  
    RCU_SPI4      = (((uint32_t)(0x44U) << 6) | (uint32_t)(20U)),                  
    RCU_SPI5      = (((uint32_t)(0x44U) << 6) | (uint32_t)(21U)),                  
    RCU_TLI       = (((uint32_t)(0x44U) << 6) | (uint32_t)(26U)),                  
     
    RCU_CTC       = (((uint32_t)(0xE4U) << 6) | (uint32_t)(27U)),              
    RCU_IREF      = (((uint32_t)(0xE4U) << 6) | (uint32_t)(31U)),              
}rcu_periph_enum;

 
typedef enum
{
     
    RCU_GPIOA_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(0U)),             
    RCU_GPIOB_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(1U)),             
    RCU_GPIOC_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(2U)),             
    RCU_GPIOD_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(3U)),             
    RCU_GPIOE_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(4U)),             
    RCU_GPIOF_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(5U)),             
    RCU_GPIOG_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(6U)),             
    RCU_GPIOH_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(7U)),             
    RCU_GPIOI_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(8U)),             
    RCU_CRC_SLP       = (((uint32_t)(0x50U) << 6) | (uint32_t)(12U)),            
    RCU_FMC_SLP       = (((uint32_t)(0x50U) << 6) | (uint32_t)(15U)),            
    RCU_SRAM0_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(16U)),            
    RCU_SRAM1_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(17U)),            
    RCU_BKPSRAM_SLP   = (((uint32_t)(0x50U) << 6) | (uint32_t)(18U)),            
    RCU_SRAM2_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(19U)),            
    RCU_DMA0_SLP      = (((uint32_t)(0x50U) << 6) | (uint32_t)(21U)),            
    RCU_DMA1_SLP      = (((uint32_t)(0x50U) << 6) | (uint32_t)(22U)),            
    RCU_IPA_SLP       = (((uint32_t)(0x50U) << 6) | (uint32_t)(23U)),            
    RCU_ENET_SLP      = (((uint32_t)(0x50U) << 6) | (uint32_t)(25U)),            
    RCU_ENETTX_SLP    = (((uint32_t)(0x50U) << 6) | (uint32_t)(26U)),            
    RCU_ENETRX_SLP    = (((uint32_t)(0x50U) << 6) | (uint32_t)(27U)),            
    RCU_ENETPTP_SLP   = (((uint32_t)(0x50U) << 6) | (uint32_t)(28U)),            
    RCU_USBHS_SLP     = (((uint32_t)(0x50U) << 6) | (uint32_t)(29U)),            
    RCU_USBHSULPI_SLP = (((uint32_t)(0x50U) << 6) | (uint32_t)(30U)),            
     
    RCU_DCI_SLP       = (((uint32_t)(0x54U) << 6) | (uint32_t)(0U)),             
    RCU_TRNG_SLP      = (((uint32_t)(0x54U) << 6) | (uint32_t)(6U)),             
    RCU_USBFS_SLP     = (((uint32_t)(0x54U) << 6) | (uint32_t)(7U)),             
     
    RCU_EXMC_SLP      = (((uint32_t)(0x58U) << 6) | (uint32_t)(0U)),             
     
    RCU_TIMER1_SLP    = (((uint32_t)(0x60U) << 6) | (uint32_t)(0U)),             
    RCU_TIMER2_SLP    = (((uint32_t)(0x60U) << 6) | (uint32_t)(1U)),             
    RCU_TIMER3_SLP    = (((uint32_t)(0x60U) << 6) | (uint32_t)(2U)),             
    RCU_TIMER4_SLP    = (((uint32_t)(0x60U) << 6) | (uint32_t)(3U)),             
    RCU_TIMER5_SLP    = (((uint32_t)(0x60U) << 6) | (uint32_t)(4U)),             
    RCU_TIMER6_SLP    = (((uint32_t)(0x60U) << 6) | (uint32_t)(5U)),             
    RCU_TIMER11_SLP   = (((uint32_t)(0x60U) << 6) | (uint32_t)(6U)),             
    RCU_TIMER12_SLP   = (((uint32_t)(0x60U) << 6) | (uint32_t)(7U)),             
    RCU_TIMER13_SLP   = (((uint32_t)(0x60U) << 6) | (uint32_t)(8U)),                
    RCU_WWDGT_SLP     = (((uint32_t)(0x60U) << 6) | (uint32_t)(11U)),            
    RCU_SPI1_SLP      = (((uint32_t)(0x60U) << 6) | (uint32_t)(14U)),            
    RCU_SPI2_SLP      = (((uint32_t)(0x60U) << 6) | (uint32_t)(15U)),            
    RCU_USART1_SLP    = (((uint32_t)(0x60U) << 6) | (uint32_t)(17U)),            
    RCU_USART2_SLP    = (((uint32_t)(0x60U) << 6) | (uint32_t)(18U)),            
    RCU_UART3_SLP     = (((uint32_t)(0x60U) << 6) | (uint32_t)(19U)),            
    RCU_UART4_SLP     = (((uint32_t)(0x60U) << 6) | (uint32_t)(20U)),            
    RCU_I2C0_SLP      = (((uint32_t)(0x60U) << 6) | (uint32_t)(21U)),            
    RCU_I2C1_SLP      = (((uint32_t)(0x60U) << 6) | (uint32_t)(22U)),            
    RCU_I2C2_SLP      = (((uint32_t)(0x60U) << 6) | (uint32_t)(23U)),               
    RCU_CAN0_SLP      = (((uint32_t)(0x60U) << 6) | (uint32_t)(25U)),            
    RCU_CAN1_SLP      = (((uint32_t)(0x60U) << 6) | (uint32_t)(26U)),            
    RCU_PMU_SLP       = (((uint32_t)(0x60U) << 6) | (uint32_t)(28U)),            
    RCU_DAC_SLP       = (((uint32_t)(0x60U) << 6) | (uint32_t)(29U)),            
    RCU_UART6_SLP     = (((uint32_t)(0x60U) << 6) | (uint32_t)(30U)),            
    RCU_UART7_SLP     = (((uint32_t)(0x60U) << 6) | (uint32_t)(31U)),            
     
    RCU_TIMER0_SLP    = (((uint32_t)(0x64U) << 6) | (uint32_t)(0U)),             
    RCU_TIMER7_SLP    = (((uint32_t)(0x64U) << 6) | (uint32_t)(1U)),             
    RCU_USART0_SLP    = (((uint32_t)(0x64U) << 6) | (uint32_t)(4U)),             
    RCU_USART5_SLP    = (((uint32_t)(0x64U) << 6) | (uint32_t)(5U)),             
    RCU_ADC0_SLP      = (((uint32_t)(0x64U) << 6) | (uint32_t)(8U)),             
    RCU_ADC1_SLP      = (((uint32_t)(0x64U) << 6) | (uint32_t)(9U)),             
    RCU_ADC2_SLP      = (((uint32_t)(0x64U) << 6) | (uint32_t)(10U)),            
    RCU_SDIO_SLP      = (((uint32_t)(0x64U) << 6) | (uint32_t)(11U)),            
    RCU_SPI0_SLP      = (((uint32_t)(0x64U) << 6) | (uint32_t)(12U)),            
    RCU_SPI3_SLP      = (((uint32_t)(0x64U) << 6) | (uint32_t)(13U)),            
    RCU_SYSCFG_SLP    = (((uint32_t)(0x64U) << 6) | (uint32_t)(14U)),            
    RCU_TIMER8_SLP    = (((uint32_t)(0x64U) << 6) | (uint32_t)(16U)),            
    RCU_TIMER9_SLP    = (((uint32_t)(0x64U) << 6) | (uint32_t)(17U)),            
    RCU_TIMER10_SLP   = (((uint32_t)(0x64U) << 6) | (uint32_t)(18U)),            
    RCU_SPI4_SLP      = (((uint32_t)(0x64U) << 6) | (uint32_t)(20U)),            
    RCU_SPI5_SLP      = (((uint32_t)(0x64U) << 6) | (uint32_t)(21U)),            
    RCU_TLI_SLP       = (((uint32_t)(0x64U) << 6) | (uint32_t)(26U)),            
     
    RCU_CTC_SLP       = (((uint32_t)(0xE8U) << 6) | (uint32_t)(27U)),        
    RCU_IREF_SLP      = (((uint32_t)(0xE8U) << 6) | (uint32_t)(31U)),        
}rcu_periph_sleep_enum;

 
typedef enum
{
     
    RCU_GPIOARST     = (((uint32_t)(0x10U) << 6) | (uint32_t)(0U)),               
    RCU_GPIOBRST     = (((uint32_t)(0x10U) << 6) | (uint32_t)(1U)),               
    RCU_GPIOCRST     = (((uint32_t)(0x10U) << 6) | (uint32_t)(2U)),               
    RCU_GPIODRST     = (((uint32_t)(0x10U) << 6) | (uint32_t)(3U)),               
    RCU_GPIOERST     = (((uint32_t)(0x10U) << 6) | (uint32_t)(4U)),               
    RCU_GPIOFRST     = (((uint32_t)(0x10U) << 6) | (uint32_t)(5U)),               
    RCU_GPIOGRST     = (((uint32_t)(0x10U) << 6) | (uint32_t)(6U)),               
    RCU_GPIOHRST     = (((uint32_t)(0x10U) << 6) | (uint32_t)(7U)),               
    RCU_GPIOIRST     = (((uint32_t)(0x10U) << 6) | (uint32_t)(8U)),               
    RCU_CRCRST       = (((uint32_t)(0x10U) << 6) | (uint32_t)(12U)),              
    RCU_DMA0RST      = (((uint32_t)(0x10U) << 6) | (uint32_t)(21U)),              
    RCU_DMA1RST      = (((uint32_t)(0x10U) << 6) | (uint32_t)(22U)),              
    RCU_IPARST       = (((uint32_t)(0x10U) << 6) | (uint32_t)(23U)),              
    RCU_ENETRST      = (((uint32_t)(0x10U) << 6) | (uint32_t)(25U)),                 
    RCU_USBHSRST     = (((uint32_t)(0x10U) << 6) | (uint32_t)(29U)),              
     
    RCU_DCIRST       = (((uint32_t)(0x14U) << 6) | (uint32_t)(0U)),               
    RCU_TRNGRST      = (((uint32_t)(0x14U) << 6) | (uint32_t)(6U)),               
    RCU_USBFSRST     = (((uint32_t)(0x14U) << 6) | (uint32_t)(7U)),               
     
    RCU_EXMCRST      = (((uint32_t)(0x18U) << 6) | (uint32_t)(0U)),               
     
    RCU_TIMER1RST    = (((uint32_t)(0x20U) << 6) | (uint32_t)(0U)),               
    RCU_TIMER2RST    = (((uint32_t)(0x20U) << 6) | (uint32_t)(1U)),               
    RCU_TIMER3RST    = (((uint32_t)(0x20U) << 6) | (uint32_t)(2U)),               
    RCU_TIMER4RST    = (((uint32_t)(0x20U) << 6) | (uint32_t)(3U)),               
    RCU_TIMER5RST    = (((uint32_t)(0x20U) << 6) | (uint32_t)(4U)),               
    RCU_TIMER6RST    = (((uint32_t)(0x20U) << 6) | (uint32_t)(5U)),               
    RCU_TIMER11RST   = (((uint32_t)(0x20U) << 6) | (uint32_t)(6U)),               
    RCU_TIMER12RST   = (((uint32_t)(0x20U) << 6) | (uint32_t)(7U)),               
    RCU_TIMER13RST   = (((uint32_t)(0x20U) << 6) | (uint32_t)(8U)),                  
    RCU_WWDGTRST     = (((uint32_t)(0x20U) << 6) | (uint32_t)(11U)),              
    RCU_SPI1RST      = (((uint32_t)(0x20U) << 6) | (uint32_t)(14U)),              
    RCU_SPI2RST      = (((uint32_t)(0x20U) << 6) | (uint32_t)(15U)),              
    RCU_USART1RST    = (((uint32_t)(0x20U) << 6) | (uint32_t)(17U)),              
    RCU_USART2RST    = (((uint32_t)(0x20U) << 6) | (uint32_t)(18U)),              
    RCU_UART3RST     = (((uint32_t)(0x20U) << 6) | (uint32_t)(19U)),              
    RCU_UART4RST     = (((uint32_t)(0x20U) << 6) | (uint32_t)(20U)),              
    RCU_I2C0RST      = (((uint32_t)(0x20U) << 6) | (uint32_t)(21U)),              
    RCU_I2C1RST      = (((uint32_t)(0x20U) << 6) | (uint32_t)(22U)),              
    RCU_I2C2RST      = (((uint32_t)(0x20U) << 6) | (uint32_t)(23U)),                 
    RCU_CAN0RST      = (((uint32_t)(0x20U) << 6) | (uint32_t)(25U)),              
    RCU_CAN1RST      = (((uint32_t)(0x20U) << 6) | (uint32_t)(26U)),              
    RCU_PMURST       = (((uint32_t)(0x20U) << 6) | (uint32_t)(28U)),              
    RCU_DACRST       = (((uint32_t)(0x20U) << 6) | (uint32_t)(29U)),              
    RCU_UART6RST     = (((uint32_t)(0x20U) << 6) | (uint32_t)(30U)),              
    RCU_UART7RST     = (((uint32_t)(0x20U) << 6) | (uint32_t)(31U)),              
     
    RCU_TIMER0RST    = (((uint32_t)(0x24U) << 6) | (uint32_t)(0U)),               
    RCU_TIMER7RST    = (((uint32_t)(0x24U) << 6) | (uint32_t)(1U)),               
    RCU_USART0RST    = (((uint32_t)(0x24U) << 6) | (uint32_t)(4U)),               
    RCU_USART5RST    = (((uint32_t)(0x24U) << 6) | (uint32_t)(5U)),               
    RCU_ADCRST       = (((uint32_t)(0x24U) << 6) | (uint32_t)(8U)),               
    RCU_SDIORST      = (((uint32_t)(0x24U) << 6) | (uint32_t)(11U)),              
    RCU_SPI0RST      = (((uint32_t)(0x24U) << 6) | (uint32_t)(12U)),              
    RCU_SPI3RST      = (((uint32_t)(0x24U) << 6) | (uint32_t)(13U)),              
    RCU_SYSCFGRST    = (((uint32_t)(0x24U) << 6) | (uint32_t)(14U)),              
    RCU_TIMER8RST    = (((uint32_t)(0x24U) << 6) | (uint32_t)(16U)),              
    RCU_TIMER9RST    = (((uint32_t)(0x24U) << 6) | (uint32_t)(17U)),              
    RCU_TIMER10RST   = (((uint32_t)(0x24U) << 6) | (uint32_t)(18U)),              
    RCU_SPI4RST      = (((uint32_t)(0x24U) << 6) | (uint32_t)(20U)),              
    RCU_SPI5RST      = (((uint32_t)(0x24U) << 6) | (uint32_t)(21U)),              
    RCU_TLIRST       = (((uint32_t)(0x24U) << 6) | (uint32_t)(26U)),              
     
    RCU_CTCRST       = (((uint32_t)(0xE0U) << 6) | (uint32_t)(27U)),          
    RCU_IREFRST      = (((uint32_t)(0xE0U) << 6) | (uint32_t)(31U))           
}rcu_periph_reset_enum;

 
typedef enum
{
     
    RCU_FLAG_IRC16MSTB     = (((uint32_t)(0x00U) << 6) | (uint32_t)(1U)),             
    RCU_FLAG_HXTALSTB      = (((uint32_t)(0x00U) << 6) | (uint32_t)(17U)),            
    RCU_FLAG_PLLSTB        = (((uint32_t)(0x00U) << 6) | (uint32_t)(25U)),            
    RCU_FLAG_PLLI2SSTB     = (((uint32_t)(0x00U) << 6) | (uint32_t)(27U)),            
    RCU_FLAG_PLLSAISTB     = (((uint32_t)(0x00U) << 6) | (uint32_t)(29U)),            
    RCU_FLAG_LXTALSTB      = (((uint32_t)(0x70U) << 6) | (uint32_t)(1U)),           
    RCU_FLAG_IRC32KSTB     = (((uint32_t)(0x74U) << 6) | (uint32_t)(1U)),          
    RCU_FLAG_IRC48MSTB     = (((uint32_t)(0xC0U) << 6) | (uint32_t)(17U)),         
     
    RCU_FLAG_BORRST        = (((uint32_t)(0x74U) << 6) | (uint32_t)(25U)),         
    RCU_FLAG_EPRST         = (((uint32_t)(0x74U) << 6) | (uint32_t)(26U)),         
    RCU_FLAG_PORRST        = (((uint32_t)(0x74U) << 6) | (uint32_t)(27U)),         
    RCU_FLAG_SWRST         = (((uint32_t)(0x74U) << 6) | (uint32_t)(28U)),         
    RCU_FLAG_FWDGTRST      = (((uint32_t)(0x74U) << 6) | (uint32_t)(29U)),         
    RCU_FLAG_WWDGTRST      = (((uint32_t)(0x74U) << 6) | (uint32_t)(30U)),         
    RCU_FLAG_LPRST         = (((uint32_t)(0x74U) << 6) | (uint32_t)(31U)),         
}rcu_flag_enum;

 
typedef enum
{
    RCU_INT_FLAG_IRC32KSTB = (((uint32_t)(0x0CU) << 6) | (uint32_t)(0U)),             
    RCU_INT_FLAG_LXTALSTB  = (((uint32_t)(0x0CU) << 6) | (uint32_t)(1U)),             
    RCU_INT_FLAG_IRC16MSTB = (((uint32_t)(0x0CU) << 6) | (uint32_t)(2U)),             
    RCU_INT_FLAG_HXTALSTB  = (((uint32_t)(0x0CU) << 6) | (uint32_t)(3U)),             
    RCU_INT_FLAG_PLLSTB    = (((uint32_t)(0x0CU) << 6) | (uint32_t)(4U)),             
    RCU_INT_FLAG_PLLI2SSTB = (((uint32_t)(0x0CU) << 6) | (uint32_t)(5U)),             
    RCU_INT_FLAG_PLLSAISTB = (((uint32_t)(0x0CU) << 6) | (uint32_t)(6U)),             
    RCU_INT_FLAG_CKM       = (((uint32_t)(0x0CU) << 6) | (uint32_t)(7U)),             
    RCU_INT_FLAG_IRC48MSTB = (((uint32_t)(0xCCU) << 6) | (uint32_t)(6U)),          
}rcu_int_flag_enum;

 
typedef enum
{
    RCU_INT_FLAG_IRC32KSTB_CLR = (((uint32_t)(0x0CU) << 6) | (uint32_t)(16U)),        
    RCU_INT_FLAG_LXTALSTB_CLR  = (((uint32_t)(0x0CU) << 6) | (uint32_t)(17U)),        
    RCU_INT_FLAG_IRC16MSTB_CLR = (((uint32_t)(0x0CU) << 6) | (uint32_t)(18U)),        
    RCU_INT_FLAG_HXTALSTB_CLR  = (((uint32_t)(0x0CU) << 6) | (uint32_t)(19U)),        
    RCU_INT_FLAG_PLLSTB_CLR    = (((uint32_t)(0x0CU) << 6) | (uint32_t)(20U)),        
    RCU_INT_FLAG_PLLI2SSTB_CLR = (((uint32_t)(0x0CU) << 6) | (uint32_t)(21U)),        
    RCU_INT_FLAG_PLLSAISTB_CLR = (((uint32_t)(0x0CU) << 6) | (uint32_t)(22U)),        
    RCU_INT_FLAG_CKM_CLR       = (((uint32_t)(0x0CU) << 6) | (uint32_t)(23U)),        
    RCU_INT_FLAG_IRC48MSTB_CLR = (((uint32_t)(0xCCU) << 6) | (uint32_t)(22U)),     
}rcu_int_flag_clear_enum;

 
typedef enum
{
    RCU_INT_IRC32KSTB       = (((uint32_t)(0x0CU) << 6) | (uint32_t)(8U)),            
    RCU_INT_LXTALSTB        = (((uint32_t)(0x0CU) << 6) | (uint32_t)(9U)),            
    RCU_INT_IRC16MSTB       = (((uint32_t)(0x0CU) << 6) | (uint32_t)(10U)),           
    RCU_INT_HXTALSTB        = (((uint32_t)(0x0CU) << 6) | (uint32_t)(11U)),           
    RCU_INT_PLLSTB          = (((uint32_t)(0x0CU) << 6) | (uint32_t)(12U)),           
    RCU_INT_PLLI2SSTB       = (((uint32_t)(0x0CU) << 6) | (uint32_t)(13U)),           
    RCU_INT_PLLSAISTB       = (((uint32_t)(0x0CU) << 6) | (uint32_t)(14U)),           
    RCU_INT_IRC48MSTB       = (((uint32_t)(0xCCU) << 6) | (uint32_t)(14U)),        
}rcu_int_enum;

 
typedef enum
{
    RCU_HXTAL      = (((uint32_t)(0x00U) << 6) | (uint32_t)(16U)),                    
    RCU_LXTAL      = (((uint32_t)(0x70U) << 6) | (uint32_t)(0U)),                   
    RCU_IRC16M     = (((uint32_t)(0x00U) << 6) | (uint32_t)(0U)),                     
    RCU_IRC48M     = (((uint32_t)(0xC0U) << 6) | (uint32_t)(16U)),                 
    RCU_IRC32K     = (((uint32_t)(0x74U) << 6) | (uint32_t)(0U)),                  
    RCU_PLL_CK     = (((uint32_t)(0x00U) << 6) | (uint32_t)(24U)),                    
    RCU_PLLI2S_CK  = (((uint32_t)(0x00U) << 6) | (uint32_t)(26U)),                    
    RCU_PLLSAI_CK  = (((uint32_t)(0x00U) << 6) | (uint32_t)(28U)),                    
}rcu_osci_type_enum;

 
typedef enum
{
    CK_SYS      = 0,                                                         
    CK_AHB,                                                                  
    CK_APB1,                                                                 
    CK_APB2,                                                                 
}rcu_clock_freq_enum;

 
 





 





 
#line 833 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 841 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 849 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 883 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 






 



 
#line 902 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
#line 910 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 






 
 
#line 953 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 






 
#line 970 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rcu.h"

 
 



 
 



 





 


                                         
 



 








 
 



 






 
 



 



 



 
 



 



 



 













 
  



 



 







 
 
 
void rcu_deinit(void);
 
void rcu_periph_clock_enable(rcu_periph_enum periph);
 
void rcu_periph_clock_disable(rcu_periph_enum periph);
 
void rcu_periph_clock_sleep_enable(rcu_periph_sleep_enum periph);
 
void rcu_periph_clock_sleep_disable(rcu_periph_sleep_enum periph);
 
void rcu_periph_reset_enable(rcu_periph_reset_enum periph_reset);
 
void rcu_periph_reset_disable(rcu_periph_reset_enum periph_reset);
 
void rcu_bkp_reset_enable(void);
 
void rcu_bkp_reset_disable(void);

 
 
void rcu_system_clock_source_config(uint32_t ck_sys);
 
uint32_t rcu_system_clock_source_get(void);
 
void rcu_ahb_clock_config(uint32_t ck_ahb);
 
void rcu_apb1_clock_config(uint32_t ck_apb1);
 
void rcu_apb2_clock_config(uint32_t ck_apb2);
 
void rcu_ckout0_config(uint32_t ckout0_src, uint32_t ckout0_div);
 
void rcu_ckout1_config(uint32_t ckout1_src, uint32_t ckout1_div);
 
ErrStatus rcu_pll_config(uint32_t pll_src, uint32_t pll_psc, uint32_t pll_n, uint32_t pll_p, uint32_t pll_q);
 
ErrStatus rcu_plli2s_config(uint32_t plli2s_n, uint32_t plli2s_r);
 
ErrStatus rcu_pllsai_config(uint32_t pllsai_n, uint32_t pllsai_p, uint32_t pllsai_r);
 
void rcu_rtc_clock_config(uint32_t rtc_clock_source);
 
void rcu_rtc_div_config(uint32_t rtc_div);
 
void rcu_i2s_clock_config(uint32_t i2s_clock_source);
 
void rcu_ck48m_clock_config(uint32_t ck48m_clock_source);
 
void rcu_pll48m_clock_config(uint32_t pll48m_clock_source);
 
void rcu_timer_clock_prescaler_config(uint32_t timer_clock_prescaler);       
 
void rcu_tli_clock_div_config(uint32_t pllsai_r_div);

 
 
void rcu_lxtal_drive_capability_config(uint32_t lxtal_dricap);
 
ErrStatus rcu_osci_stab_wait(rcu_osci_type_enum osci);
 
void rcu_osci_on(rcu_osci_type_enum osci);
 
void rcu_osci_off(rcu_osci_type_enum osci);
 
void rcu_osci_bypass_mode_enable(rcu_osci_type_enum osci);
 
void rcu_osci_bypass_mode_disable(rcu_osci_type_enum osci);
 
void rcu_irc16m_adjust_value_set(uint32_t irc16m_adjval);
 
void rcu_spread_spectrum_config(uint32_t spread_spectrum_type, uint32_t modstep, uint32_t modcnt);
 
void rcu_spread_spectrum_enable(void);
 
void rcu_spread_spectrum_disable(void);

 
 
void rcu_hxtal_clock_monitor_enable(void);
 
void rcu_hxtal_clock_monitor_disable(void);

 
 
void rcu_voltage_key_unlock(void);
 
void rcu_deepsleep_voltage_set(uint32_t dsvol);
 
uint32_t rcu_clock_freq_get(rcu_clock_freq_enum clock);

 
 
FlagStatus rcu_flag_get(rcu_flag_enum flag);
 
void rcu_all_reset_flag_clear(void);
 
FlagStatus rcu_interrupt_flag_get(rcu_int_flag_enum int_flag);
 
void rcu_interrupt_flag_clear(rcu_int_flag_clear_enum int_flag);
 
void rcu_interrupt_enable(rcu_int_enum interrupt);
 
void rcu_interrupt_disable(rcu_int_enum interrupt);

#line 40 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 




 
#line 70 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 
 
#line 79 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 
#line 95 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 
#line 111 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 


 


 


 


 



 



 


 


 





 
#line 163 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 
#line 172 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 



 
 
#line 185 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 


 




 



 
#line 213 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 



 





 
#line 242 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 
#line 261 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 
#line 272 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 


 


 


 


 


 
 






 
#line 307 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 
#line 318 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 



 





 





 
#line 355 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 





 





 
#line 378 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 
#line 396 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_adc.h"

 




 



 
 
 
void adc_deinit(void);
 
void adc_clock_config(uint32_t prescaler);
 
void adc_special_function_config(uint32_t adc_periph , uint32_t function , ControlStatus newvalue);
 
void adc_data_alignment_config(uint32_t adc_periph , uint32_t data_alignment);
 
void adc_enable(uint32_t adc_periph);
 
void adc_disable(uint32_t adc_periph);
 
void adc_calibration_enable(uint32_t adc_periph);
 
void adc_channel_16_to_18(uint32_t function, ControlStatus newvalue);
 
void adc_resolution_config(uint32_t adc_periph, uint32_t resolution);
 
void adc_oversample_mode_config(uint32_t adc_periph, uint32_t mode, uint16_t shift, uint8_t ratio);
 
void adc_oversample_mode_enable(uint32_t adc_periph);
 
void adc_oversample_mode_disable(uint32_t adc_periph);

 
 
void adc_dma_mode_enable(uint32_t adc_periph);
 
void adc_dma_mode_disable(uint32_t adc_periph);
 
void adc_dma_request_after_last_enable(uint32_t adc_periph);
 
void adc_dma_request_after_last_disable(uint32_t adc_periph);

 
 
void adc_discontinuous_mode_config(uint32_t adc_periph , uint8_t adc_sequence , uint8_t length);
 
void adc_channel_length_config(uint32_t adc_periph , uint8_t adc_sequence , uint32_t length);
 
void adc_routine_channel_config(uint32_t adc_periph , uint8_t rank , uint8_t adc_channel , uint32_t sample_time);
 
void adc_inserted_channel_config(uint32_t adc_periph , uint8_t rank , uint8_t adc_channel , uint32_t sample_time);
 
void adc_inserted_channel_offset_config(uint32_t adc_periph , uint8_t inserted_channel , uint16_t offset);
 
void adc_external_trigger_source_config(uint32_t adc_periph , uint8_t adc_sequence , uint32_t external_trigger_source);
 
void adc_external_trigger_config(uint32_t adc_periph , uint8_t adc_sequence , uint32_t trigger_mode);
 
void adc_software_trigger_enable(uint32_t adc_periph , uint8_t adc_sequence);
 
void adc_end_of_conversion_config(uint32_t adc_periph , uint8_t end_selection);

 
 
uint16_t adc_routine_data_read(uint32_t adc_periph);
 
uint16_t adc_inserted_data_read(uint32_t adc_periph , uint8_t inserted_channel);

 
 
void adc_watchdog_single_channel_disable(uint32_t adc_periph );
 
void adc_watchdog_single_channel_enable(uint32_t adc_periph , uint8_t adc_channel);
 
void adc_watchdog_sequence_channel_enable(uint32_t adc_periph , uint8_t adc_sequence);
 
void adc_watchdog_disable(uint32_t adc_periph , uint8_t adc_sequence);
 
void adc_watchdog_threshold_config(uint32_t adc_periph , uint16_t low_threshold , uint16_t high_threshold);

 
 
FlagStatus adc_flag_get(uint32_t adc_periph , uint32_t adc_flag);
 
void adc_flag_clear(uint32_t adc_periph , uint32_t adc_flag);
 
FlagStatus adc_routine_software_startconv_flag_get(uint32_t adc_periph);
 
FlagStatus adc_inserted_software_startconv_flag_get(uint32_t adc_periph);
 
FlagStatus adc_interrupt_flag_get(uint32_t adc_periph , uint32_t adc_interrupt);
 
void adc_interrupt_flag_clear(uint32_t adc_periph , uint32_t adc_interrupt);
 
void adc_interrupt_enable(uint32_t adc_periph , uint32_t adc_interrupt);
 
void adc_interrupt_disable(uint32_t adc_periph , uint32_t adc_interrupt);

 
 
void adc_sync_mode_config(uint32_t sync_mode);
 
void adc_sync_delay_config(uint32_t sample_delay);
 
void adc_sync_dma_config(uint32_t dma_mode );
 
void adc_sync_dma_request_after_last_enable(void);
 
void adc_sync_dma_request_after_last_disable(void);
 
uint32_t adc_sync_routine_data_read(void);

#line 41 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"





 


























 





#line 40 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"

 



 
#line 135 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"

 





 



 





 
 
#line 164 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"

 
#line 175 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"

 
#line 199 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"

 





 





 
#line 227 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"

 
#line 235 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"

 
#line 243 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"

 






 




 





 





 





 




 





 





 



 


 


 


 


 


 
 









 






 
typedef enum {
     
    CAN_FLAG_RXL      = (((uint32_t)(((uint8_t)0x04U)) << 6) | (uint32_t)(11U)),            
    CAN_FLAG_LASTRX   = (((uint32_t)(((uint8_t)0x04U)) << 6) | (uint32_t)(10U)),            
    CAN_FLAG_RS       = (((uint32_t)(((uint8_t)0x04U)) << 6) | (uint32_t)(9U)),             
    CAN_FLAG_TS       = (((uint32_t)(((uint8_t)0x04U)) << 6) | (uint32_t)(8U)),             
    CAN_FLAG_SLPIF    = (((uint32_t)(((uint8_t)0x04U)) << 6) | (uint32_t)(4U)),             
    CAN_FLAG_WUIF     = (((uint32_t)(((uint8_t)0x04U)) << 6) | (uint32_t)(3U)),             
    CAN_FLAG_ERRIF    = (((uint32_t)(((uint8_t)0x04U)) << 6) | (uint32_t)(2U)),             
    CAN_FLAG_SLPWS    = (((uint32_t)(((uint8_t)0x04U)) << 6) | (uint32_t)(1U)),             
    CAN_FLAG_IWS      = (((uint32_t)(((uint8_t)0x04U)) << 6) | (uint32_t)(0U)),             
     
    CAN_FLAG_TMLS2    = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(31U)),           
    CAN_FLAG_TMLS1    = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(30U)),           
    CAN_FLAG_TMLS0    = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(29U)),           
    CAN_FLAG_TME2     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(28U)),           
    CAN_FLAG_TME1     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(27U)),           
    CAN_FLAG_TME0     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(26U)),           
    CAN_FLAG_MTE2     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(19U)),           
    CAN_FLAG_MTE1     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(11U)),           
    CAN_FLAG_MTE0     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(3U)),            
    CAN_FLAG_MAL2     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(18U)),           
    CAN_FLAG_MAL1     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(10U)),           
    CAN_FLAG_MAL0     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(2U)),            
    CAN_FLAG_MTFNERR2 = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(17U)),           
    CAN_FLAG_MTFNERR1 = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(9U)),            
    CAN_FLAG_MTFNERR0 = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(1U)),            
    CAN_FLAG_MTF2     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(16U)),           
    CAN_FLAG_MTF1     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(8U)),            
    CAN_FLAG_MTF0     = (((uint32_t)(((uint8_t)0x08U)) << 6) | (uint32_t)(0U)),            
     
    CAN_FLAG_RFO0     = (((uint32_t)(((uint8_t)0x0CU)) << 6) | (uint32_t)(4U)),           
    CAN_FLAG_RFF0     = (((uint32_t)(((uint8_t)0x0CU)) << 6) | (uint32_t)(3U)),           
     
    CAN_FLAG_RFO1     = (((uint32_t)(((uint8_t)0x10U)) << 6) | (uint32_t)(4U)),           
    CAN_FLAG_RFF1     = (((uint32_t)(((uint8_t)0x10U)) << 6) | (uint32_t)(3U)),           
     
    CAN_FLAG_BOERR    = (((uint32_t)(((uint8_t)0x18U)) << 6) | (uint32_t)(2U)),              
    CAN_FLAG_PERR     = (((uint32_t)(((uint8_t)0x18U)) << 6) | (uint32_t)(1U)),              
    CAN_FLAG_WERR     = (((uint32_t)(((uint8_t)0x18U)) << 6) | (uint32_t)(0U)),              
} can_flag_enum;

 
typedef enum {
     
    CAN_INT_FLAG_SLPIF = (((uint32_t)(((uint8_t)0x04U)) << 12) | ((uint32_t)(4U) << 6) | (uint32_t)(17U)),      
    CAN_INT_FLAG_WUIF  = (((uint32_t)(((uint8_t)0x04U)) << 12) | ((uint32_t)(3U) << 6) | (uint32_t)(16)),       
    CAN_INT_FLAG_ERRIF = (((uint32_t)(((uint8_t)0x04U)) << 12) | ((uint32_t)(2U) << 6) | (uint32_t)(15)),       
     
    CAN_INT_FLAG_MTF2  = (((uint32_t)(((uint8_t)0x08U)) << 12) | ((uint32_t)(16U) << 6) | (uint32_t)(0U)),     
    CAN_INT_FLAG_MTF1  = (((uint32_t)(((uint8_t)0x08U)) << 12) | ((uint32_t)(8U) << 6) | (uint32_t)(0U)),      
    CAN_INT_FLAG_MTF0  = (((uint32_t)(((uint8_t)0x08U)) << 12) | ((uint32_t)(0U) << 6) | (uint32_t)(0U)),      
     
    CAN_INT_FLAG_RFO0  = (((uint32_t)(((uint8_t)0x0CU)) << 12) | ((uint32_t)(4U) << 6) | (uint32_t)(3U)),     
    CAN_INT_FLAG_RFF0  = (((uint32_t)(((uint8_t)0x0CU)) << 12) | ((uint32_t)(3U) << 6) | (uint32_t)(2U)),     
    CAN_INT_FLAG_RFL0  = (((uint32_t)(((uint8_t)0x0CU)) << 12) | ((uint32_t)(2U) << 6) | (uint32_t)(1U)),     
     
    CAN_INT_FLAG_RFO1  = (((uint32_t)(((uint8_t)0x10U)) << 12) | ((uint32_t)(4U) << 6) | (uint32_t)(6U)),     
    CAN_INT_FLAG_RFF1  = (((uint32_t)(((uint8_t)0x10U)) << 12) | ((uint32_t)(3U) << 6) | (uint32_t)(5U)),     
    CAN_INT_FLAG_RFL1  = (((uint32_t)(((uint8_t)0x10U)) << 12) | ((uint32_t)(2U) << 6) | (uint32_t)(4U)),     
     
    CAN_INT_FLAG_ERRN  = (((uint32_t)(((uint8_t)0x18U)) << 12) | ((uint32_t)(3U) << 6) | (uint32_t)(11U)),       
    CAN_INT_FLAG_BOERR = (((uint32_t)(((uint8_t)0x18U)) << 12) | ((uint32_t)(2U) << 6) | (uint32_t)(10U)),       
    CAN_INT_FLAG_PERR  = (((uint32_t)(((uint8_t)0x18U)) << 12) | ((uint32_t)(1U) << 6) | (uint32_t)(9U)),        
    CAN_INT_FLAG_WERR  = (((uint32_t)(((uint8_t)0x18U)) << 12) | ((uint32_t)(0U) << 6) | (uint32_t)(8U)),        
} can_interrupt_flag_enum;

 
typedef struct {
    uint8_t working_mode;                                                
    uint8_t resync_jump_width;                                           
    uint8_t time_segment_1;                                              
    uint8_t time_segment_2;                                              
    ControlStatus time_triggered;                                        
    ControlStatus auto_bus_off_recovery;                                 
    ControlStatus auto_wake_up;                                          
    ControlStatus auto_retrans;                                          
    ControlStatus rec_fifo_overwrite;                                    
    ControlStatus trans_fifo_order;                                      
    uint16_t prescaler;                                                  
} can_parameter_struct;

 
typedef struct {
    uint32_t tx_sfid;                                                    
    uint32_t tx_efid;                                                    
    uint8_t tx_ff;                                                       
    uint8_t tx_ft;                                                       
    uint8_t tx_dlen;                                                     
    uint8_t tx_data[8];                                                  
} can_trasnmit_message_struct;

 
typedef struct {
    uint32_t rx_sfid;                                                    
    uint32_t rx_efid;                                                    
    uint8_t rx_ff;                                                       
    uint8_t rx_ft;                                                       
    uint8_t rx_dlen;                                                     
    uint8_t rx_data[8];                                                  
    uint8_t rx_fi;                                                       
} can_receive_message_struct;

 
typedef struct {
    uint16_t filter_list_high;                                           
    uint16_t filter_list_low;                                            
    uint16_t filter_mask_high;                                           
    uint16_t filter_mask_low;                                            
    uint16_t filter_fifo_number;                                         
    uint16_t filter_number;                                              
    uint16_t filter_mode;                                                
    uint16_t filter_bits;                                                
    ControlStatus filter_enable;                                         
} can_filter_parameter_struct;

 
typedef enum {
    CAN_ERROR_NONE = 0,                                                  
    CAN_ERROR_FILL,                                                      
    CAN_ERROR_FORMATE,                                                   
    CAN_ERROR_ACK,                                                       
    CAN_ERROR_BITRECESSIVE,                                              
    CAN_ERROR_BITDOMINANTER,                                             
    CAN_ERROR_CRC,                                                       
    CAN_ERROR_SOFTWARECFG,                                               
} can_error_enum;

 
typedef enum {
    CAN_TRANSMIT_FAILED = 0U,                                            
    CAN_TRANSMIT_OK = 1U,                                                
    CAN_TRANSMIT_PENDING = 2U,                                           
    CAN_TRANSMIT_NOMAILBOX = 4U,                                         
} can_transmit_state_enum;

typedef enum {
    CAN_INIT_STRUCT = 0,                                                 
    CAN_FILTER_STRUCT,                                                   
    CAN_TX_MESSAGE_STRUCT,                                               
    CAN_RX_MESSAGE_STRUCT,                                               
} can_struct_type_enum;

 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 


 
#line 581 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"



 





 





 
#line 613 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"

 
#line 623 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"

 





 



 



 





 




 



 



 


 



 


 
#line 682 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_can.h"

 
 
 
void can_deinit(uint32_t can_periph);
 
void can_struct_para_init(can_struct_type_enum type, void *p_struct);
 
ErrStatus can_init(uint32_t can_periph, can_parameter_struct *can_parameter_init);
 
void can_filter_init(can_filter_parameter_struct *can_filter_parameter_init);

 
 
void can1_filter_start_bank(uint8_t start_bank);
 
 
void can_debug_freeze_enable(uint32_t can_periph);
 
void can_debug_freeze_disable(uint32_t can_periph);
 
void can_time_trigger_mode_enable(uint32_t can_periph);
 
void can_time_trigger_mode_disable(uint32_t can_periph);

 
 
uint8_t can_message_transmit(uint32_t can_periph, can_trasnmit_message_struct *transmit_message);
 
can_transmit_state_enum can_transmit_states(uint32_t can_periph, uint8_t mailbox_number);
 
void can_transmission_stop(uint32_t can_periph, uint8_t mailbox_number);
 
void can_message_receive(uint32_t can_periph, uint8_t fifo_number, can_receive_message_struct *receive_message);
 
void can_fifo_release(uint32_t can_periph, uint8_t fifo_number);
 
uint8_t can_receive_message_length_get(uint32_t can_periph, uint8_t fifo_number);
 
ErrStatus can_working_mode_set(uint32_t can_periph, uint8_t working_mode);
 
ErrStatus can_wakeup(uint32_t can_periph);

 
can_error_enum can_error_get(uint32_t can_periph);
 
uint8_t can_receive_error_number_get(uint32_t can_periph);
 
uint8_t can_transmit_error_number_get(uint32_t can_periph);

 
 
FlagStatus can_flag_get(uint32_t can_periph, can_flag_enum flag);
 
void can_flag_clear(uint32_t can_periph, can_flag_enum flag);
 
void can_interrupt_enable(uint32_t can_periph, uint32_t interrupt);
 
void can_interrupt_disable(uint32_t can_periph, uint32_t interrupt);
 
FlagStatus can_interrupt_flag_get(uint32_t can_periph, can_interrupt_flag_enum flag);
 
void can_interrupt_flag_clear(uint32_t can_periph, can_interrupt_flag_enum flag);

#line 42 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_crc.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_crc.h"

 


 




 
 


 


 



 
 
void crc_deinit(void);

 
void crc_data_register_reset(void);
 
uint32_t crc_data_register_read(void);

 
uint8_t crc_free_data_register_read(void);
 
void crc_free_data_register_write(uint8_t free_data);

 
uint32_t crc_single_data_calculate(uint32_t sdata);
 
uint32_t crc_block_data_calculate(uint32_t array[], uint32_t size);

#line 43 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ctc.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ctc.h"

 


 





 
 
#line 59 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ctc.h"

 






 
#line 77 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ctc.h"

 





 
 



 



 




 
#line 108 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ctc.h"

 





 
#line 123 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ctc.h"

 
#line 132 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ctc.h"

 
 
void ctc_deinit(void);
 
void ctc_counter_enable(void);
 
void ctc_counter_disable(void);

 
void ctc_irc48m_trim_value_config(uint8_t trim_value);
 
void ctc_software_refsource_pulse_generate(void);
 
void ctc_hardware_trim_mode_config(uint32_t hardmode);

 
void ctc_refsource_polarity_config(uint32_t polarity);
 
void ctc_refsource_signal_select(uint32_t refs);
 
void ctc_refsource_prescaler_config(uint32_t prescaler);
 
void ctc_clock_limit_value_config(uint8_t limit_value);
 
void ctc_counter_reload_value_config(uint16_t reload_value);

 
uint16_t ctc_counter_capture_value_read(void);
 
FlagStatus ctc_counter_direction_read(void);
 
uint16_t ctc_counter_reload_value_read(void);
 
uint8_t ctc_irc48m_trim_value_read(void);

 
 
void ctc_interrupt_enable(uint32_t interrupt);
 
void ctc_interrupt_disable(uint32_t interrupt);
 
FlagStatus ctc_interrupt_flag_get(uint32_t int_flag); 
 
void ctc_interrupt_flag_clear(uint32_t int_flag);
 
FlagStatus ctc_flag_get(uint32_t flag);
 
void ctc_flag_clear(uint32_t flag);

#line 44 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dac.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dac.h"

 


 
#line 58 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dac.h"

 
 
#line 69 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dac.h"

#line 78 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dac.h"

 



 


 


 


 


 


 


 



 



 



 


 


 



 
 
#line 134 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dac.h"

 





 
#line 155 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dac.h"

 
#line 169 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dac.h"

 
#line 183 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dac.h"

 





 



 



 



 



 
 
 
void dac_deinit(uint32_t dac_periph);
 
void dac_enable(uint32_t dac_periph, uint8_t dac_out);
 
void dac_disable(uint32_t dac_periph, uint8_t dac_out);
 
void dac_dma_enable(uint32_t dac_periph, uint8_t dac_out);
 
void dac_dma_disable(uint32_t dac_periph, uint8_t dac_out);

 
 
void dac_output_buffer_enable(uint32_t dac_periph, uint8_t dac_out);
 
void dac_output_buffer_disable(uint32_t dac_periph, uint8_t dac_out);

 
 
uint16_t dac_output_value_get(uint32_t dac_periph, uint8_t dac_out);
 
void dac_data_set(uint32_t dac_periph, uint8_t dac_out, uint32_t dac_align, uint16_t data);

 
 
void dac_trigger_enable(uint32_t dac_periph, uint8_t dac_out);
 
void dac_trigger_disable(uint32_t dac_periph, uint8_t dac_out);
 
void dac_trigger_source_config(uint32_t dac_periph, uint8_t dac_out, uint32_t triggersource);
 
void dac_software_trigger_enable(uint32_t dac_periph, uint8_t dac_out);

 
 
void dac_wave_mode_config(uint32_t dac_periph, uint8_t dac_out, uint32_t wave_mode);
 
void dac_lfsr_noise_config(uint32_t dac_periph, uint8_t dac_out, uint32_t unmask_bits);
 
void dac_triangle_noise_config(uint32_t dac_periph, uint8_t dac_out, uint32_t amplitude);

 
 
void dac_concurrent_enable(uint32_t dac_periph);
 
void dac_concurrent_disable(uint32_t dac_periph);
 
void dac_concurrent_software_trigger_enable(uint32_t dac_periph);
 
void dac_concurrent_output_buffer_enable(uint32_t dac_periph);
 
void dac_concurrent_output_buffer_disable(uint32_t dac_periph);
 
void dac_concurrent_data_set(uint32_t dac_periph, uint32_t dac_align, uint16_t data0, uint16_t data1);

 
 
FlagStatus dac_flag_get(uint32_t dac_periph, uint32_t flag);
 
void dac_flag_clear(uint32_t dac_periph, uint32_t flag);
 
void dac_interrupt_enable(uint32_t dac_periph, uint32_t interrupt);
 
void dac_interrupt_disable(uint32_t dac_periph, uint32_t interrupt);
 
FlagStatus dac_interrupt_flag_get(uint32_t dac_periph, uint32_t int_flag);
 
void dac_interrupt_flag_clear(uint32_t dac_periph, uint32_t int_flag);

#line 45 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dbg.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dbg.h"

 


 





 
 


 





 
#line 77 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dbg.h"

 






 




 




 
enum dbg_reg_idx
{
    DBG_IDX_CTL0  = 0x04U,
    DBG_IDX_CTL1  = 0x08U,
    DBG_IDX_CTL2  = 0x0CU
};

typedef enum
{
    DBG_TIMER1_HOLD            = (((DBG_IDX_CTL1) << 6) | (0U)),                     
    DBG_TIMER2_HOLD            = (((DBG_IDX_CTL1) << 6) | (1U)),                     
    DBG_TIMER3_HOLD            = (((DBG_IDX_CTL1) << 6) | (2U)),                     
    DBG_TIMER4_HOLD            = (((DBG_IDX_CTL1) << 6) | (3U)),                     
    DBG_TIMER5_HOLD            = (((DBG_IDX_CTL1) << 6) | (4U)),                     
    DBG_TIMER6_HOLD            = (((DBG_IDX_CTL1) << 6) | (5U)),                     
    DBG_TIMER11_HOLD           = (((DBG_IDX_CTL1) << 6) | (6U)),                     
    DBG_TIMER12_HOLD           = (((DBG_IDX_CTL1) << 6) | (7U)),                     
    DBG_TIMER13_HOLD           = (((DBG_IDX_CTL1) << 6) | (8U)),                     
    DBG_RTC_HOLD               = (((DBG_IDX_CTL1) << 6) | (10U)),                    
    DBG_WWDGT_HOLD             = (((DBG_IDX_CTL1) << 6) | (11U)),                    
    DBG_FWDGT_HOLD             = (((DBG_IDX_CTL1) << 6) | (12U)),                    
    DBG_I2C0_HOLD              = (((DBG_IDX_CTL1) << 6) | (21U)),                    
    DBG_I2C1_HOLD              = (((DBG_IDX_CTL1) << 6) | (22U)),                    
    DBG_I2C2_HOLD              = (((DBG_IDX_CTL1) << 6) | (23U)),                    
    DBG_CAN0_HOLD              = (((DBG_IDX_CTL1) << 6) | (25U)),                    
    DBG_CAN1_HOLD              = (((DBG_IDX_CTL1) << 6) | (26U)),                    
    DBG_TIMER0_HOLD            = (((DBG_IDX_CTL2) << 6) | (0U)),                     
    DBG_TIMER7_HOLD            = (((DBG_IDX_CTL2) << 6) | (1U)),                     
    DBG_TIMER8_HOLD            = (((DBG_IDX_CTL2) << 6) | (16U)),                    
    DBG_TIMER9_HOLD            = (((DBG_IDX_CTL2) << 6) | (17U)),                    
    DBG_TIMER10_HOLD           = (((DBG_IDX_CTL2) << 6) | (18U))                     
}dbg_periph_enum;

 
 
void dbg_deinit(void);
 
uint32_t dbg_id_get(void);

 
void dbg_low_power_enable(uint32_t dbg_low_power);
 
void dbg_low_power_disable(uint32_t dbg_low_power);

 
void dbg_periph_enable(dbg_periph_enum dbg_periph);
 
void dbg_periph_disable(dbg_periph_enum dbg_periph);

 
void dbg_trace_pin_enable(void);
 
void dbg_trace_pin_disable(void);

#line 46 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dci.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dci.h"

 


 
#line 55 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dci.h"

 
 
#line 69 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dci.h"

 




 






 






 






 






 





 





 



 



 
 
typedef struct
{   
    uint32_t capture_mode;                                            
    uint32_t clock_polarity;                                          
    uint32_t hsync_polarity;                                          
    uint32_t vsync_polarity;                                          
    uint32_t frame_rate;                                              
    uint32_t interface_format;                                        
}dci_parameter_struct;                                                         












 











 






 






   
#line 181 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dci.h"

 
 
 
void dci_deinit(void);
 
void dci_init(dci_parameter_struct* dci_struct);

 
void dci_enable(void);
 
void dci_disable(void);
 
void dci_capture_enable(void);
 
void dci_capture_disable(void);
 
void dci_jpeg_enable(void);
 
void dci_jpeg_disable(void);

 
 
void dci_crop_window_enable(void);
 
void dci_crop_window_disable(void);
 
void dci_crop_window_config(uint16_t start_x, uint16_t start_y, uint16_t size_width, uint16_t size_height);

 
void dci_embedded_sync_enable(void);
 
void dci_embedded_sync_disable(void);
 
void dci_sync_codes_config(uint8_t frame_start, uint8_t line_start, uint8_t line_end, uint8_t frame_end);
 
void dci_sync_codes_unmask_config(uint8_t frame_start, uint8_t line_start, uint8_t line_end, uint8_t frame_end);

 
uint32_t dci_data_read(void);

 
 
FlagStatus dci_flag_get(uint32_t flag);
 
void dci_interrupt_enable(uint32_t interrupt);
 
void dci_interrupt_disable(uint32_t interrupt);


 
FlagStatus dci_interrupt_flag_get(uint32_t int_flag);
 
void dci_interrupt_flag_clear(uint32_t int_flag);

#line 47 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"




 


























 




#line 41 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"


 



 





#line 59 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

#line 66 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

#line 73 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

#line 80 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

#line 87 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

#line 94 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

#line 101 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

#line 108 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

 
 






 






 
#line 144 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

 


 


 


 


 





 
 
typedef enum 
{
    DMA_CH0 = 0,                                     
    DMA_CH1,                                         
    DMA_CH2,                                         
    DMA_CH3,                                         
    DMA_CH4,                                         
    DMA_CH5,                                         
    DMA_CH6,                                         
    DMA_CH7                                          
} dma_channel_enum;

 
typedef enum 
{
    DMA_SUBPERI0 = 0,                                
    DMA_SUBPERI1,                                    
    DMA_SUBPERI2,                                    
    DMA_SUBPERI3,                                    
    DMA_SUBPERI4,                                    
    DMA_SUBPERI5,                                    
    DMA_SUBPERI6,                                    
    DMA_SUBPERI7                                     
} dma_subperipheral_enum;

 
typedef struct
{
    uint32_t periph_addr;                            
    uint32_t periph_width;                           
    uint32_t periph_inc;                               

    uint32_t memory0_addr;                           
    uint32_t memory_width;                           
    uint32_t memory_inc;                             

    uint32_t memory_burst_width;                     
    uint32_t periph_burst_width;                     
    uint32_t critical_value;                         

    uint32_t circular_mode;                          
    uint32_t direction;                              
    uint32_t number;                                 
    uint32_t priority;                               
}dma_multi_data_parameter_struct;

 
typedef struct
{
    uint32_t periph_addr;                            
    uint32_t periph_inc;                               

    uint32_t memory0_addr;                           
    uint32_t memory_inc;                             

    uint32_t periph_memory_width;                    

    uint32_t circular_mode;                          
    uint32_t direction;                              
    uint32_t number;                                 
    uint32_t priority;                               
} dma_single_data_parameter_struct;



 
#line 237 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

 
#line 248 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

 






 






 






 





 





 





 






 



 



 



 




 



 
#line 323 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

 
#line 331 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_dma.h"

 
 






 






 
 






 
 
 
void dma_deinit(uint32_t dma_periph, dma_channel_enum channelx);
 
void dma_single_data_para_struct_init(dma_single_data_parameter_struct* init_struct);
 
void dma_multi_data_para_struct_init(dma_multi_data_parameter_struct* init_struct);
 
void dma_single_data_mode_init(uint32_t dma_periph, dma_channel_enum channelx, dma_single_data_parameter_struct* init_struct);
 
void dma_multi_data_mode_init(uint32_t dma_periph, dma_channel_enum channelx, dma_multi_data_parameter_struct* init_struct);

 
 
void dma_periph_address_config(uint32_t dma_periph, dma_channel_enum channelx, uint32_t address);
 
void dma_memory_address_config(uint32_t dma_periph, dma_channel_enum channelx, uint8_t memory_flag, uint32_t address);

 
void dma_transfer_number_config(uint32_t dma_periph,dma_channel_enum channelx, uint32_t number);
 
uint32_t dma_transfer_number_get(uint32_t dma_periph, dma_channel_enum channelx);

 
void dma_priority_config(uint32_t dma_periph, dma_channel_enum channelx, uint32_t priority);

 
void dma_memory_burst_beats_config (uint32_t dma_periph, dma_channel_enum channelx, uint32_t mbeat);
 
void dma_periph_burst_beats_config (uint32_t dma_periph, dma_channel_enum channelx, uint32_t pbeat);
 
void dma_memory_width_config (uint32_t dma_periph, dma_channel_enum channelx, uint32_t msize);
 
void dma_periph_width_config (uint32_t dma_periph, dma_channel_enum channelx, uint32_t psize);

 
void dma_memory_address_generation_config(uint32_t dma_periph, dma_channel_enum channelx, uint8_t generation_algorithm);
 
void dma_peripheral_address_generation_config(uint32_t dma_periph, dma_channel_enum channelx, uint8_t generation_algorithm);

 
void dma_circulation_enable(uint32_t dma_periph, dma_channel_enum channelx);
 
void dma_circulation_disable(uint32_t dma_periph, dma_channel_enum channelx);
 
void dma_channel_enable(uint32_t dma_periph, dma_channel_enum channelx);
 
void dma_channel_disable(uint32_t dma_periph, dma_channel_enum channelx);

 
void dma_transfer_direction_config(uint32_t dma_periph, dma_channel_enum channelx, uint8_t direction);

 
void dma_switch_buffer_mode_config(uint32_t dma_periph, dma_channel_enum channelx, uint32_t memory1_addr, uint32_t memory_select);
 
uint32_t dma_using_memory_get(uint32_t dma_periph, dma_channel_enum channelx);

 
void dma_channel_subperipheral_select(uint32_t dma_periph, dma_channel_enum channelx, dma_subperipheral_enum sub_periph);
 
void dma_flow_controller_config(uint32_t dma_periph, dma_channel_enum channelx, uint32_t controller);
 
void dma_switch_buffer_mode_enable(uint32_t dma_periph, dma_channel_enum channelx, ControlStatus newvalue);
 
uint32_t dma_fifo_status_get(uint32_t dma_periph, dma_channel_enum channelx);

 
 
FlagStatus dma_flag_get(uint32_t dma_periph, dma_channel_enum channelx, uint32_t flag);
 
void dma_flag_clear(uint32_t dma_periph, dma_channel_enum channelx, uint32_t flag);
 
void dma_interrupt_enable(uint32_t dma_periph, dma_channel_enum channelx, uint32_t source);
 
void dma_interrupt_disable(uint32_t dma_periph, dma_channel_enum channelx, uint32_t source);
 
FlagStatus dma_interrupt_flag_get(uint32_t dma_periph, dma_channel_enum channelx, uint32_t interrupt);
 
void dma_interrupt_flag_clear(uint32_t dma_periph, dma_channel_enum channelx, uint32_t interrupt);





#line 48 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exti.h"




 


























 




#line 38 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exti.h"

 


 
#line 49 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exti.h"

 
 
#line 75 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exti.h"

 
#line 100 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exti.h"

 
#line 125 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exti.h"

 
#line 150 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exti.h"

 
#line 175 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exti.h"

 
#line 200 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exti.h"

 
 
typedef enum { 
    EXTI_0      = ((uint32_t)((uint32_t)0x01U<<(0))),                                      
    EXTI_1      = ((uint32_t)((uint32_t)0x01U<<(1))),                                      
    EXTI_2      = ((uint32_t)((uint32_t)0x01U<<(2))),                                      
    EXTI_3      = ((uint32_t)((uint32_t)0x01U<<(3))),                                      
    EXTI_4      = ((uint32_t)((uint32_t)0x01U<<(4))),                                      
    EXTI_5      = ((uint32_t)((uint32_t)0x01U<<(5))),                                      
    EXTI_6      = ((uint32_t)((uint32_t)0x01U<<(6))),                                      
    EXTI_7      = ((uint32_t)((uint32_t)0x01U<<(7))),                                      
    EXTI_8      = ((uint32_t)((uint32_t)0x01U<<(8))),                                      
    EXTI_9      = ((uint32_t)((uint32_t)0x01U<<(9))),                                      
    EXTI_10     = ((uint32_t)((uint32_t)0x01U<<(10))),                                     
    EXTI_11     = ((uint32_t)((uint32_t)0x01U<<(11))),                                     
    EXTI_12     = ((uint32_t)((uint32_t)0x01U<<(12))),                                     
    EXTI_13     = ((uint32_t)((uint32_t)0x01U<<(13))),                                     
    EXTI_14     = ((uint32_t)((uint32_t)0x01U<<(14))),                                     
    EXTI_15     = ((uint32_t)((uint32_t)0x01U<<(15))),                                     
    EXTI_16     = ((uint32_t)((uint32_t)0x01U<<(16))),                                     
    EXTI_17     = ((uint32_t)((uint32_t)0x01U<<(17))),                                     
    EXTI_18     = ((uint32_t)((uint32_t)0x01U<<(18))),                                     
    EXTI_19     = ((uint32_t)((uint32_t)0x01U<<(19))),                                     
    EXTI_20     = ((uint32_t)((uint32_t)0x01U<<(20))),                                         
    EXTI_21     = ((uint32_t)((uint32_t)0x01U<<(21))),                                     
    EXTI_22     = ((uint32_t)((uint32_t)0x01U<<(22)))                                      
} exti_line_enum;

 
typedef enum {
    EXTI_INTERRUPT   = 0,                                      
    EXTI_EVENT                                                 
} exti_mode_enum;

 
typedef enum { 
    EXTI_TRIG_RISING = 0,                                      
    EXTI_TRIG_FALLING,                                         
    EXTI_TRIG_BOTH,                                            
    EXTI_TRIG_NONE                                             
} exti_trig_type_enum;

 
 
void exti_deinit(void);
 
void exti_init(exti_line_enum linex, exti_mode_enum mode, exti_trig_type_enum trig_type);
 
void exti_interrupt_enable(exti_line_enum linex);
 
void exti_interrupt_disable(exti_line_enum linex);
 
void exti_event_enable(exti_line_enum linex);
 
void exti_event_disable(exti_line_enum linex);
 
void exti_software_interrupt_enable(exti_line_enum linex);
 
void exti_software_interrupt_disable(exti_line_enum linex);

 
 
FlagStatus exti_flag_get(exti_line_enum linex);
 
void exti_flag_clear(exti_line_enum linex);
 
FlagStatus exti_interrupt_flag_get(exti_line_enum linex);
 
void exti_interrupt_flag_clear(exti_line_enum linex);

#line 49 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"





 


























 





#line 40 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"

 



 
#line 57 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"






 
 


 


 


 
#line 81 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"

 
#line 93 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"

 
#line 106 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"

 


 



 


 


 


 
 
typedef enum {
    FMC_READY = 0,                                                 
    FMC_BUSY,                                                      
    FMC_RDDERR,                                                    
    FMC_PGSERR,                                                    
    FMC_PGMERR,                                                    
    FMC_WPERR,                                                     
    FMC_OPERR,                                                     
    FMC_TOERR                                                      
} fmc_state_enum;

 







 



 
#line 166 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"

 






 




 




 




 




 




 
#line 225 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"

 
#line 252 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"

 




 




 
#line 293 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"


 





 



 
#line 313 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"

 
#line 321 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fmc.h"


 


 
 
 
void fmc_wscnt_set(uint32_t wscnt);
 
void fmc_unlock(void);
 
void fmc_lock(void);

 
fmc_state_enum fmc_page_erase(uint32_t page_addr);

 
fmc_state_enum fmc_sector_erase(uint32_t fmc_sector);
 
fmc_state_enum fmc_mass_erase(void);
 
fmc_state_enum fmc_bank0_erase(void);
 
fmc_state_enum fmc_bank1_erase(void);
 
fmc_state_enum fmc_word_program(uint32_t address, uint32_t data);
 
fmc_state_enum fmc_halfword_program(uint32_t address, uint16_t data);
 
fmc_state_enum fmc_byte_program(uint32_t address, uint8_t data);

 
 
void ob_unlock(void);
 
void ob_lock(void);
 
void ob_start(void);
 
void ob_erase(void);
 
ErrStatus ob_write_protection_enable(uint32_t ob_wp);
 
ErrStatus ob_write_protection_disable(uint32_t ob_wp);
 
void ob_drp_enable(uint32_t ob_drp);
 
void ob_drp_disable(void);
 
void ob_security_protection_config(uint8_t ob_spc);
 
void ob_user_write(uint32_t ob_fwdgt, uint32_t ob_deepsleep, uint32_t ob_stdby);
 
void ob_user_bor_threshold(uint32_t ob_bor_th);
 
void ob_boot_mode_config(uint32_t boot_mode);

 
void ob_double_bank_select(uint32_t double_bank);

 
uint8_t ob_user_get(void);
 
uint16_t ob_write_protection0_get(void);
 
uint16_t ob_write_protection1_get(void);
 
uint16_t ob_drp0_get(void);
 
uint16_t ob_drp1_get(void);
 
FlagStatus ob_spc_get(void);
 
uint8_t ob_user_bor_threshold_get(void);

 
 
FlagStatus fmc_flag_get(uint32_t fmc_flag);
 
void fmc_flag_clear(uint32_t fmc_flag);
 
void fmc_interrupt_enable(uint32_t fmc_int);
 
void fmc_interrupt_disable(uint32_t fmc_int);
 
FlagStatus fmc_interrupt_flag_get(uint32_t fmc_int_flag);
 
void fmc_interrupt_flag_clear(uint32_t fmc_int_flag);
 
fmc_state_enum fmc_state_get(void);
 
fmc_state_enum fmc_ready_wait(uint32_t timeout);

#line 50 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fwdgt.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fwdgt.h"

 


 





 
 


 


 


 



 
 
#line 73 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_fwdgt.h"

 





 



 



 


 
 
void fwdgt_write_enable(void);
 
void fwdgt_write_disable(void);
 
void fwdgt_enable(void);

 
ErrStatus fwdgt_prescaler_value_config(uint16_t prescaler_value);
 
ErrStatus fwdgt_reload_value_config(uint16_t reload_value);
 
void fwdgt_counter_reload(void);
 
ErrStatus fwdgt_config(uint16_t reload_value, uint8_t prescaler_div);

 
FlagStatus fwdgt_flag_get(uint16_t flag);

#line 51 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 50 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 64 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
 
#line 83 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 101 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 119 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 137 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 155 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 173 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 207 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 226 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 236 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 246 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 264 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
#line 282 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
typedef FlagStatus bit_status;

 






 





 
#line 317 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 



 



 



 



 






 





 


 
 
#line 369 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_gpio.h"

 
 
void gpio_deinit(uint32_t gpio_periph);
 
void gpio_mode_set(uint32_t gpio_periph, uint32_t mode, uint32_t pull_up_down, uint32_t pin);
 
void gpio_output_options_set(uint32_t gpio_periph, uint8_t otype, uint32_t speed, uint32_t pin);

 
void gpio_bit_set(uint32_t gpio_periph, uint32_t pin);
 
void gpio_bit_reset(uint32_t gpio_periph, uint32_t pin);
 
void gpio_bit_write(uint32_t gpio_periph, uint32_t pin, bit_status bit_value);
 
void gpio_port_write(uint32_t gpio_periph, uint16_t data);

 
FlagStatus gpio_input_bit_get(uint32_t gpio_periph, uint32_t pin);
 
uint16_t gpio_input_port_get(uint32_t gpio_periph);
 
FlagStatus gpio_output_bit_get(uint32_t gpio_periph, uint32_t pin);
 
uint16_t gpio_output_port_get(uint32_t gpio_periph);

 
void gpio_af_set(uint32_t gpio_periph, uint32_t alt_func_num, uint32_t pin);
 
void gpio_pin_lock(uint32_t gpio_periph, uint32_t pin);

 
void gpio_bit_toggle(uint32_t gpio_periph, uint32_t pin);
 
void gpio_port_toggle(uint32_t gpio_periph);

#line 52 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_syscfg.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_syscfg.h"

 


 
#line 51 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_syscfg.h"

 




 


 





 





 





 





 



 
 






 



 



 





 


 


 


 
#line 129 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_syscfg.h"

 
#line 147 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_syscfg.h"

 



 



 
 
 
void syscfg_deinit(void);

 
 
void syscfg_bootmode_config(uint8_t syscfg_bootmode);
 
void syscfg_fmc_swap_config(uint32_t syscfg_fmc_swap);
 
void syscfg_exmc_swap_config(uint32_t syscfg_exmc_swap); 
 
void syscfg_exti_line_config(uint8_t exti_port, uint8_t exti_pin);
 
void syscfg_enet_phy_interface_config(uint32_t syscfg_enet_phy_interface);
 
void syscfg_compensation_config(uint32_t syscfg_compensation);

 
 
FlagStatus syscfg_flag_get(void);

#line 53 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_i2c.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_i2c.h"

 




 
#line 57 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_i2c.h"

 
 
#line 74 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_i2c.h"

 
#line 82 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_i2c.h"

 





 



 


 
#line 111 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_i2c.h"

 
#line 121 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_i2c.h"

 




 


 



 
#line 147 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_i2c.h"

 
 
#line 157 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_i2c.h"

 





 
typedef enum {
     
    I2C_FLAG_SBSEND = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(0U)),          
    I2C_FLAG_ADDSEND = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(1U)),         
    I2C_FLAG_BTC = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(2U)),             
    I2C_FLAG_ADD10SEND = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(3U)),       
    I2C_FLAG_STPDET = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(4U)),          
    I2C_FLAG_RBNE = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(6U)),            
    I2C_FLAG_TBE = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(7U)),             
    I2C_FLAG_BERR = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(8U)),            
    I2C_FLAG_LOSTARB = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(9U)),         
    I2C_FLAG_AERR = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(10U)),           
    I2C_FLAG_OUERR = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(11U)),          
    I2C_FLAG_PECERR = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(12U)),         
    I2C_FLAG_SMBTO = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(14U)),          
    I2C_FLAG_SMBALT = (((uint32_t)(((uint32_t)0x00000014U)) << 6) | (uint32_t)(15U)),         
     
    I2C_FLAG_MASTER = (((uint32_t)(((uint32_t)0x00000018U)) << 6) | (uint32_t)(0U)),          
    I2C_FLAG_I2CBSY = (((uint32_t)(((uint32_t)0x00000018U)) << 6) | (uint32_t)(1U)),          
    I2C_FLAG_TR = (((uint32_t)(((uint32_t)0x00000018U)) << 6) | (uint32_t)(2U)),              
    I2C_FLAG_RXGC = (((uint32_t)(((uint32_t)0x00000018U)) << 6) | (uint32_t)(4U)),            
    I2C_FLAG_DEFSMB = (((uint32_t)(((uint32_t)0x00000018U)) << 6) | (uint32_t)(5U)),          
    I2C_FLAG_HSTSMB = (((uint32_t)(((uint32_t)0x00000018U)) << 6) | (uint32_t)(6U)),          
    I2C_FLAG_DUMOD = (((uint32_t)(((uint32_t)0x00000018U)) << 6) | (uint32_t)(7U)),           
     
    I2C_FLAG_TFF = (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(12U)),            
    I2C_FLAG_TFR = (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(13U)),            
    I2C_FLAG_RFF = (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(14U)),            
    I2C_FLAG_RFR = (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(15U))             
} i2c_flag_enum;

 
typedef enum {
     
    I2C_INT_FLAG_SBSEND = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((0U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(9U))),         
    I2C_INT_FLAG_ADDSEND = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((1U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(9U))),        
    I2C_INT_FLAG_BTC =  (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((2U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(9U))),           
    I2C_INT_FLAG_ADD10SEND =  (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((3U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(9U))),     
    I2C_INT_FLAG_STPDET = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((4U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(9U))),         
    I2C_INT_FLAG_RBNE = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((6U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(9U))),           
    I2C_INT_FLAG_TBE = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((7U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(9U))),            
    I2C_INT_FLAG_BERR = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((8U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(8U))),           
    I2C_INT_FLAG_LOSTARB = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((9U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(8U))),        
    I2C_INT_FLAG_AERR = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((10U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(8U))),          
    I2C_INT_FLAG_OUERR = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((11U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(8U))),         
    I2C_INT_FLAG_PECERR = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((12U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(8U))),        
    I2C_INT_FLAG_SMBTO = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((14U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(8U))),         
    I2C_INT_FLAG_SMBALT = (((uint32_t)(((uint32_t)0x00000014U)) << 22) | (uint32_t)((15U) << 16) | (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(8U))),        
     
    I2C_INT_FLAG_TFF = (((uint32_t)(((uint32_t)0x00000080U)) << 22) | (uint32_t)((12U) << 16) | (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(4U))),          
    I2C_INT_FLAG_TFR = (((uint32_t)(((uint32_t)0x00000080U)) << 22) | (uint32_t)((13U) << 16) | (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(5U))),          
    I2C_INT_FLAG_RFF = (((uint32_t)(((uint32_t)0x00000080U)) << 22) | (uint32_t)((14U) << 16) | (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(6U))),          
    I2C_INT_FLAG_RFR = (((uint32_t)(((uint32_t)0x00000080U)) << 22) | (uint32_t)((15U) << 16) | (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(7U)))           
} i2c_interrupt_flag_enum;

 
typedef enum {
     
    I2C_INT_ERR = (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(8U)),               
    I2C_INT_EV = (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(9U)),                
    I2C_INT_BUF = (((uint32_t)(((uint32_t)0x00000004U)) << 6) | (uint32_t)(10U)),              
     
    I2C_INT_TFF = (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(4U)),              
    I2C_INT_TFR = (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(5U)),              
    I2C_INT_RFF = (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(6U)),              
    I2C_INT_RFR = (((uint32_t)(((uint32_t)0x00000080U)) << 6) | (uint32_t)(7U))               
} i2c_interrupt_enum;

 
typedef enum {
    I2C_DF_DISABLE = 0,                                                  
    I2C_DF_1PCLK,                                                        
    I2C_DF_2PCLKS,                                                       
    I2C_DF_3PCLKS,                                                       
    I2C_DF_4PCLKS,                                                       
    I2C_DF_5PCLKS,                                                       
    I2C_DF_6PCLKS,                                                       
    I2C_DF_7PCLKS,                                                       
    I2C_DF_8PCLKS,                                                       
    I2C_DF_9PCLKS,                                                       
    I2C_DF_10PCLKS,                                                      
    I2C_DF_11PCLKS,                                                      
    I2C_DF_12PCLKS,                                                      
    I2C_DF_13PCLKS,                                                      
    I2C_DF_14PCLKS,                                                      
    I2C_DF_15PCLKS                                                       
} i2c_digital_filter_enum;

 



 



 



 



 



 



 



 



 
 



 



 
 



 



 
 



 



 


 


 



 



 
 
 
void i2c_deinit(uint32_t i2c_periph);
 
void i2c_clock_config(uint32_t i2c_periph, uint32_t clkspeed, uint32_t dutycyc);
 
void i2c_mode_addr_config(uint32_t i2c_periph, uint32_t mode, uint32_t addformat, uint32_t addr);

 
 
void i2c_smbus_type_config(uint32_t i2c_periph, uint32_t type);
 
void i2c_ack_config(uint32_t i2c_periph, uint32_t ack);
 
void i2c_ackpos_config(uint32_t i2c_periph, uint32_t pos);
 
void i2c_master_addressing(uint32_t i2c_periph, uint32_t addr, uint32_t trandirection);
 
void i2c_dualaddr_enable(uint32_t i2c_periph, uint32_t addr);
 
void i2c_dualaddr_disable(uint32_t i2c_periph);
 
void i2c_enable(uint32_t i2c_periph);
 
void i2c_disable(uint32_t i2c_periph);
 
void i2c_start_on_bus(uint32_t i2c_periph);
 
void i2c_stop_on_bus(uint32_t i2c_periph);
 
void i2c_data_transmit(uint32_t i2c_periph, uint8_t data);
 
uint8_t i2c_data_receive(uint32_t i2c_periph);
 
void i2c_dma_config(uint32_t i2c_periph, uint32_t dmastate);
 
void i2c_dma_last_transfer_config(uint32_t i2c_periph, uint32_t dmalast);
 
void i2c_stretch_scl_low_config(uint32_t i2c_periph, uint32_t stretchpara);
 
void i2c_slave_response_to_gcall_config(uint32_t i2c_periph, uint32_t gcallpara);
 
void i2c_software_reset_config(uint32_t i2c_periph, uint32_t sreset);
 
void i2c_pec_config(uint32_t i2c_periph, uint32_t pecstate);
 
void i2c_pec_transfer_config(uint32_t i2c_periph, uint32_t pecpara);
 
uint8_t i2c_pec_value_get(uint32_t i2c_periph);
 
void i2c_smbus_alert_config(uint32_t i2c_periph, uint32_t smbuspara);
 
void i2c_smbus_arp_config(uint32_t i2c_periph, uint32_t arpstate);
 
void i2c_analog_noise_filter_disable(uint32_t i2c_periph);
 
void i2c_analog_noise_filter_enable(uint32_t i2c_periph);
 
void i2c_digital_noise_filter_config(uint32_t i2c_periph, i2c_digital_filter_enum dfilterpara);
 
void i2c_sam_enable(uint32_t i2c_periph);
 
void i2c_sam_disable(uint32_t i2c_periph);
 
void i2c_sam_timeout_enable(uint32_t i2c_periph);
 
void i2c_sam_timeout_disable(uint32_t i2c_periph);

 
 
FlagStatus i2c_flag_get(uint32_t i2c_periph, i2c_flag_enum flag);
 
void i2c_flag_clear(uint32_t i2c_periph, i2c_flag_enum flag);
 
void i2c_interrupt_enable(uint32_t i2c_periph, i2c_interrupt_enum interrupt);
 
void i2c_interrupt_disable(uint32_t i2c_periph, i2c_interrupt_enum interrupt);
 
FlagStatus i2c_interrupt_flag_get(uint32_t i2c_periph, i2c_interrupt_flag_enum int_flag);
 
void i2c_interrupt_flag_clear(uint32_t i2c_periph, i2c_interrupt_flag_enum int_flag);

#line 54 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_iref.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_iref.h"

 


 


 
 






 
 
#line 89 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_iref.h"

 
#line 156 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_iref.h"
 
 



 
  




 
 
void iref_deinit(void);
 
void iref_enable(void);
 
void iref_disable(void);

 
void iref_mode_set(uint32_t step);
 
void iref_sink_set(uint32_t sinkmode);
 
void iref_precision_trim_value_set(uint32_t precisiontrim);
 
void iref_step_data_config(uint32_t stepdata);

#line 55 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_pmu.h"





 


























 





#line 40 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_pmu.h"

 


 



 
 
#line 63 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_pmu.h"

 
#line 75 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_pmu.h"

 
 



 
#line 91 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_pmu.h"

 




 




 






 




 




 




 




 
#line 138 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_pmu.h"

 



 



 
 
void pmu_deinit(void);

 
 
void pmu_lvd_select(uint32_t lvdt_n);
 
void pmu_lvd_disable(void);

 
 
void pmu_ldo_output_select(uint32_t ldo_output);

 
 
void pmu_highdriver_mode_enable(void);
 
void pmu_highdriver_mode_disable(void);
 
void pmu_highdriver_switch_select(uint32_t highdr_switch);
 
void pmu_lowdriver_mode_enable(void);
 
void pmu_lowdriver_mode_disable(void);
 
void pmu_lowpower_driver_config(uint32_t mode);
 
void pmu_normalpower_driver_config(uint32_t mode);

 
 
void pmu_to_sleepmode(uint8_t sleepmodecmd);
 
void pmu_to_deepsleepmode(uint32_t ldo, uint32_t lowdrive, uint8_t deepsleepmodecmd);
 
void pmu_to_standbymode(void);
 
void pmu_wakeup_pin_enable(void);
 
void pmu_wakeup_pin_disable(void);

 
 
void pmu_backup_ldo_config(uint32_t bkp_ldo);
 
void pmu_backup_write_enable(void);
 
void pmu_backup_write_disable(void);

 
 
FlagStatus pmu_flag_get(uint32_t flag);
 
void pmu_flag_clear(uint32_t flag);

#line 56 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"





 


























 





#line 40 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

 


 
#line 84 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

 
 
#line 94 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

 
#line 103 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

 
#line 126 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

 
#line 144 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

 



 


 



 
#line 171 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

 


 


 



 
#line 190 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

 






 


 





 
#line 221 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

 



 



 
 
typedef struct
{
    uint8_t year;                                                                
    uint8_t month;                                                               
    uint8_t date;                                                                
    uint8_t day_of_week;                                                         
    uint8_t hour;                                                                
    uint8_t minute;                                                              
    uint8_t second;                                                              
    uint16_t factor_asyn;                                                        
    uint16_t factor_syn;                                                         
    uint32_t am_pm;                                                              
    uint32_t display_format;                                                     
}rtc_parameter_struct;

 
typedef struct
{
    uint32_t alarm_mask;                                                         
    uint32_t weekday_or_date;                                                    
    uint8_t alarm_day;                                                           
    uint8_t alarm_hour;                                                          
    uint8_t alarm_minute;                                                        
    uint8_t alarm_second;                                                        
    uint32_t am_pm;                                                              
}rtc_alarm_struct;

 
typedef struct
{
    uint8_t timestamp_month;                                                     
    uint8_t timestamp_date;                                                      
    uint8_t timestamp_day;                                                       
    uint8_t timestamp_hour;                                                      
    uint8_t timestamp_minute;                                                    
    uint8_t timestamp_second;                                                    
    uint32_t am_pm;                                                              
}rtc_timestamp_struct;

 
typedef struct
{
    uint32_t tamper_source;                                                      
    uint32_t tamper_trigger;                                                     
    uint32_t tamper_filter;                                                      
    uint32_t tamper_sample_frequency;                                            
    ControlStatus tamper_precharge_enable;                                       
    uint32_t tamper_precharge_time;                                              
    ControlStatus tamper_with_timestamp;                                         
}rtc_tamper_struct; 

 












 



#line 314 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

#line 324 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"




 






#line 343 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"







 






 












#line 376 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"




 


 


 





 









 









 


 









 
#line 435 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"


























 


#line 481 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

 






 




 






 



 



 
#line 517 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"
 
 





 
#line 540 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_rtc.h"

 
 
ErrStatus rtc_deinit(void);
 
ErrStatus rtc_init(rtc_parameter_struct* rtc_initpara_struct);
 
ErrStatus rtc_init_mode_enter(void);
 
void rtc_init_mode_exit(void);
 
ErrStatus rtc_register_sync_wait(void);

 
void rtc_current_time_get(rtc_parameter_struct* rtc_initpara_struct);
 
uint32_t rtc_subsecond_get(void);

 
void rtc_alarm_config(uint8_t rtc_alarm, rtc_alarm_struct* rtc_alarm_time);
 
void rtc_alarm_subsecond_config(uint8_t rtc_alarm, uint32_t mask_subsecond, uint32_t subsecond);
 
void rtc_alarm_get(uint8_t rtc_alarm,rtc_alarm_struct* rtc_alarm_time);
 
uint32_t rtc_alarm_subsecond_get(uint8_t rtc_alarm);
 
void rtc_alarm_enable(uint8_t rtc_alarm);
 
ErrStatus rtc_alarm_disable(uint8_t rtc_alarm);

 
void rtc_timestamp_enable(uint32_t edge);
 
void rtc_timestamp_disable(void);
 
void rtc_timestamp_get(rtc_timestamp_struct* rtc_timestamp);
 
uint32_t rtc_timestamp_subsecond_get(void);
 
void rtc_timestamp_pin_map(uint32_t rtc_af);

 
void rtc_tamper_enable(rtc_tamper_struct* rtc_tamper);
 
void rtc_tamper_disable(uint32_t source);
 
void rtc_tamper0_pin_map(uint32_t rtc_af);

 
void rtc_interrupt_enable(uint32_t interrupt);
 
void rtc_interrupt_disable(uint32_t interrupt);
 
FlagStatus rtc_flag_get(uint32_t flag);
 
void rtc_flag_clear(uint32_t flag);

 
void rtc_alarm_output_config(uint32_t source, uint32_t mode);
 
void rtc_calibration_output_config(uint32_t source);

 
void rtc_hour_adjust(uint32_t operation);
 
ErrStatus rtc_second_adjust(uint32_t add, uint32_t minus);

 
void rtc_bypass_shadow_enable(void);
 
void rtc_bypass_shadow_disable(void);

 
ErrStatus rtc_refclock_detection_enable(void);
 
ErrStatus rtc_refclock_detection_disable(void);

 
void rtc_wakeup_enable(void);
 
ErrStatus rtc_wakeup_disable(void);
 
ErrStatus rtc_wakeup_clock_set(uint8_t wakeup_clock);
 
ErrStatus rtc_wakeup_timer_set(uint16_t wakeup_timer);
 
uint16_t rtc_wakeup_timer_get(void);

 
ErrStatus rtc_smooth_calibration_config(uint32_t window, uint32_t plus, uint32_t minus);
 
ErrStatus rtc_coarse_calibration_enable(void);
 
ErrStatus rtc_coarse_calibration_disable(void);
 
ErrStatus rtc_coarse_calibration_config(uint8_t direction, uint8_t step);

#line 57 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 


 
#line 62 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 
 


 
#line 76 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 


 
#line 90 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 


 


 
#line 107 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 
#line 133 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 
#line 148 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 
#line 174 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 


 
 
#line 204 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 
#line 230 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 
#line 256 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 




 





 



 



 



 





 









 
#line 313 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_sdio.h"

 



 



 



 
 
 
void sdio_deinit(void);
 
void sdio_clock_config(uint32_t clock_edge, uint32_t clock_bypass, uint32_t clock_powersave, uint16_t clock_division);
 
void sdio_hardware_clock_enable(void);
 
void sdio_hardware_clock_disable(void);
 
void sdio_bus_mode_set(uint32_t bus_mode);
 
void sdio_power_state_set(uint32_t power_state);
 
uint32_t sdio_power_state_get(void);
 
void sdio_clock_enable(void);
 
void sdio_clock_disable(void);

 
 
void sdio_command_response_config(uint32_t cmd_index, uint32_t cmd_argument, uint32_t response_type);
 
void sdio_wait_type_set(uint32_t wait_type);
 
void sdio_csm_enable(void);
 
void sdio_csm_disable(void);
 
uint8_t sdio_command_index_get(void);
 
uint32_t sdio_response_get(uint32_t sdio_responsex);

 
 
void sdio_data_config(uint32_t data_timeout, uint32_t data_length, uint32_t data_blocksize);
 
void sdio_data_transfer_config(uint32_t transfer_mode, uint32_t transfer_direction);
 
void sdio_dsm_enable(void);
 
void sdio_dsm_disable(void);
 
void sdio_data_write(uint32_t data);
 
uint32_t sdio_data_read(void);
 
uint32_t sdio_data_counter_get(void);
 
uint32_t sdio_fifo_counter_get(void);
 
void sdio_dma_enable(void);
 
void sdio_dma_disable(void);

 
 
FlagStatus sdio_flag_get(uint32_t flag);
 
void sdio_flag_clear(uint32_t flag);
 
void sdio_interrupt_enable(uint32_t int_flag);
 
void sdio_interrupt_disable(uint32_t int_flag);
 
FlagStatus sdio_interrupt_flag_get(uint32_t int_flag);
 
void sdio_interrupt_flag_clear(uint32_t int_flag);

 
 
void sdio_readwait_enable(void);
 
void sdio_readwait_disable(void);
 
void sdio_stop_readwait_enable(void);
 
void sdio_stop_readwait_disable(void);
 
void sdio_readwait_type_set(uint32_t readwait_type);
 
void sdio_operation_enable(void);
 
void sdio_operation_disable(void);
 
void sdio_suspend_enable(void);
 
void sdio_suspend_disable(void);

 
 
void sdio_ceata_command_enable(void);
 
void sdio_ceata_command_disable(void);
 
void sdio_ceata_interrupt_enable(void);
 
void sdio_ceata_interrupt_disable(void);
 
void sdio_ceata_command_completion_enable(void);
 
void sdio_ceata_command_completion_disable(void);

#line 58 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"





 


























 





#line 40 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 
#line 48 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 



 
#line 64 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 
#line 75 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 
 
#line 92 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 
#line 101 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 
#line 112 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 


 


 


 


 
#line 134 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 




 




 
 
typedef struct {
    uint32_t device_mode;                                                        
    uint32_t trans_mode;                                                         
    uint32_t frame_size;                                                         
    uint32_t nss;                                                                
    uint32_t endian;                                                             
    uint32_t clock_polarity_phase;                                               
    uint32_t prescale;                                                           
} spi_parameter_struct;

 



 



 





 



 



 



 





 
#line 199 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 
#line 210 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 






 



 






 
#line 236 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 



 



 



 




 
#line 262 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 
#line 278 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_spi.h"

 
 
 
void spi_i2s_deinit(uint32_t spi_periph);
 
void spi_struct_para_init(spi_parameter_struct *spi_struct);
 
void spi_init(uint32_t spi_periph, spi_parameter_struct *spi_struct);
 
void spi_enable(uint32_t spi_periph);
 
void spi_disable(uint32_t spi_periph);

 
void i2s_init(uint32_t spi_periph, uint32_t i2s_mode, uint32_t i2s_standard, uint32_t i2s_ckpl);
 
void i2s_psc_config(uint32_t spi_periph, uint32_t i2s_audiosample, uint32_t i2s_frameformat, uint32_t i2s_mckout);
 
void i2s_enable(uint32_t spi_periph);
 
void i2s_disable(uint32_t spi_periph);

 
 
void spi_nss_output_enable(uint32_t spi_periph);
 
void spi_nss_output_disable(uint32_t spi_periph);
 
void spi_nss_internal_high(uint32_t spi_periph);
 
void spi_nss_internal_low(uint32_t spi_periph);

 
 
void spi_dma_enable(uint32_t spi_periph, uint8_t spi_dma);
 
void spi_dma_disable(uint32_t spi_periph, uint8_t spi_dma);

 
 
void spi_i2s_data_frame_format_config(uint32_t spi_periph, uint16_t frame_format);
 
void spi_i2s_data_transmit(uint32_t spi_periph, uint16_t data);
 
uint16_t spi_i2s_data_receive(uint32_t spi_periph);
 
void spi_bidirectional_transfer_config(uint32_t spi_periph, uint32_t transfer_direction);
 
void i2s_full_duplex_mode_config(uint32_t i2s_add_periph, uint32_t i2s_mode, uint32_t i2s_standard, uint32_t i2s_ckpl, uint32_t i2s_frameformat);
 
void spi_i2s_format_error_clear(uint32_t spi_periph, uint32_t flag);

 
 
void spi_crc_polynomial_set(uint32_t spi_periph, uint16_t crc_poly);
 
uint16_t spi_crc_polynomial_get(uint32_t spi_periph);
 
void spi_crc_on(uint32_t spi_periph);
 
void spi_crc_off(uint32_t spi_periph);
 
void spi_crc_next(uint32_t spi_periph);
 
uint16_t spi_crc_get(uint32_t spi_periph, uint8_t spi_crc);
 
void spi_crc_error_clear(uint32_t spi_periph);

 
 
void spi_ti_mode_enable(uint32_t spi_periph);
 
void spi_ti_mode_disable(uint32_t spi_periph);

 
 
void spi_quad_enable(uint32_t spi_periph);
 
void spi_quad_disable(uint32_t spi_periph);
 
void spi_quad_write_enable(uint32_t spi_periph);
 
void spi_quad_read_enable(uint32_t spi_periph);
 
void spi_quad_io23_output_enable(uint32_t spi_periph);
 
void spi_quad_io23_output_disable(uint32_t spi_periph);

 
 
FlagStatus spi_i2s_flag_get(uint32_t spi_periph, uint32_t flag);
 
void spi_i2s_interrupt_enable(uint32_t spi_periph, uint8_t interrupt);
 
void spi_i2s_interrupt_disable(uint32_t spi_periph, uint8_t interrupt);
 
FlagStatus spi_i2s_interrupt_flag_get(uint32_t spi_periph, uint8_t interrupt);

#line 59 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 55 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 79 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
 
#line 90 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 104 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 113 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"
 
 
#line 130 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 144 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 154 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
 
#line 167 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"
 





 
 
#line 185 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"
 





 
#line 206 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 



 


 



 


 



 



 



 



 
#line 246 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 



 


 




 



 
 
typedef struct
{ 
    uint16_t prescaler;                          
    uint16_t alignedmode;                        
    uint16_t counterdirection;                   
    uint16_t clockdivision;                      
    uint32_t period;                             
    uint8_t  repetitioncounter;                  
}timer_parameter_struct;

 
typedef struct
{ 
    uint16_t runoffstate;                        
    uint16_t ideloffstate;                       
    uint16_t deadtime;                           
    uint16_t breakpolarity;                      
    uint16_t outputautostate;                    
    uint16_t protectmode;                        
    uint16_t breakstate;                         
}timer_break_parameter_struct;

 
typedef struct
{ 
    uint16_t outputstate;                        
    uint16_t outputnstate;                       
    uint16_t ocpolarity;                         
    uint16_t ocnpolarity;                        
    uint16_t ocidlestate;                        
    uint16_t ocnidlestate;                       
}timer_oc_parameter_struct;

 
typedef struct
{ 
    uint16_t icpolarity;                         
    uint16_t icselection;                        
    uint16_t icprescaler;                        
    uint16_t icfilter;                           
}timer_ic_parameter_struct;

 
#line 316 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 330 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 340 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 349 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

  



 
#line 376 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 397 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 407 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 






 



 



 





 



 



 



                                                  



 



 



 






 



 





 



 



 



 



  



  



 
#line 503 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 



 



 



  



 




 




 





 
#line 546 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 557 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

 
#line 568 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_timer.h"

  



 






 



  



 






 






 




 



 



 
 
 
void timer_deinit(uint32_t timer_periph);
 
void timer_struct_para_init(timer_parameter_struct* initpara);
 
void timer_init(uint32_t timer_periph, timer_parameter_struct* initpara);
 
void timer_enable(uint32_t timer_periph);
 
void timer_disable(uint32_t timer_periph);
 
void timer_auto_reload_shadow_enable(uint32_t timer_periph);
 
void timer_auto_reload_shadow_disable(uint32_t timer_periph);
 
void timer_update_event_enable(uint32_t timer_periph);
 
void timer_update_event_disable(uint32_t timer_periph);
 
void timer_counter_alignment(uint32_t timer_periph, uint16_t aligned);
 
void timer_counter_up_direction(uint32_t timer_periph);
 
void timer_counter_down_direction(uint32_t timer_periph);
 
void timer_prescaler_config(uint32_t timer_periph, uint16_t prescaler, uint8_t pscreload);
 
void timer_repetition_value_config(uint32_t timer_periph, uint16_t repetition);
 
void timer_autoreload_value_config(uint32_t timer_periph,uint32_t autoreload);
 
void timer_counter_value_config(uint32_t timer_periph , uint32_t counter);
 
uint32_t timer_counter_read(uint32_t timer_periph);
 
uint16_t timer_prescaler_read(uint32_t timer_periph);
 
void timer_single_pulse_mode_config(uint32_t timer_periph, uint32_t spmode);
 
void timer_update_source_config(uint32_t timer_periph, uint32_t update);

 
 
void timer_dma_enable(uint32_t timer_periph, uint16_t dma);
 
void timer_dma_disable(uint32_t timer_periph, uint16_t dma);
 
void timer_channel_dma_request_source_select(uint32_t timer_periph, uint8_t dma_request);
 
void timer_dma_transfer_config(uint32_t timer_periph,uint32_t dma_baseaddr, uint32_t dma_lenth);
 
void timer_event_software_generate(uint32_t timer_periph, uint16_t event);

 
 
void timer_break_struct_para_init(timer_break_parameter_struct* breakpara);
 
void timer_break_config(uint32_t timer_periph, timer_break_parameter_struct* breakpara);
 
void timer_break_enable(uint32_t timer_periph);
 
void timer_break_disable(uint32_t timer_periph);
 
void timer_automatic_output_enable(uint32_t timer_periph);
 
void timer_automatic_output_disable(uint32_t timer_periph);
 
void timer_primary_output_config(uint32_t timer_periph, ControlStatus newvalue);
 
void timer_channel_control_shadow_config(uint32_t timer_periph, ControlStatus newvalue);
 
void timer_channel_control_shadow_update_config(uint32_t timer_periph, uint8_t ccuctl);

 
 
void timer_channel_output_struct_para_init(timer_oc_parameter_struct* ocpara);
 
void timer_channel_output_config(uint32_t timer_periph,uint16_t channel, timer_oc_parameter_struct* ocpara);
 
void timer_channel_output_mode_config(uint32_t timer_periph, uint16_t channel,uint16_t ocmode);
 
void timer_channel_output_pulse_value_config(uint32_t timer_periph, uint16_t channel, uint32_t pulse);
 
void timer_channel_output_shadow_config(uint32_t timer_periph, uint16_t channel, uint16_t ocshadow);
 
void timer_channel_output_fast_config(uint32_t timer_periph, uint16_t channel, uint16_t ocfast);
 
void timer_channel_output_clear_config(uint32_t timer_periph,uint16_t channel,uint16_t occlear);
 
void timer_channel_output_polarity_config(uint32_t timer_periph, uint16_t channel, uint16_t ocpolarity);
 
void timer_channel_complementary_output_polarity_config(uint32_t timer_periph, uint16_t channel, uint16_t ocnpolarity);
 
void timer_channel_output_state_config(uint32_t timer_periph, uint16_t channel, uint32_t state);
 
void timer_channel_complementary_output_state_config(uint32_t timer_periph, uint16_t channel, uint16_t ocnstate);

 
 
void timer_channel_input_struct_para_init(timer_ic_parameter_struct* icpara);
 
void timer_input_capture_config(uint32_t timer_periph, uint16_t channel, timer_ic_parameter_struct* icpara);
 
void timer_channel_input_capture_prescaler_config(uint32_t timer_periph, uint16_t channel, uint16_t prescaler);
 
uint32_t timer_channel_capture_value_register_read(uint32_t timer_periph, uint16_t channel);
 
void timer_input_pwm_capture_config(uint32_t timer_periph, uint16_t channel, timer_ic_parameter_struct* icpwm);
 
void timer_hall_mode_config(uint32_t timer_periph, uint32_t hallmode);

 
 
void timer_input_trigger_source_select(uint32_t timer_periph, uint32_t intrigger);
 
void timer_master_output_trigger_source_select(uint32_t timer_periph, uint32_t outrigger);
 
void timer_slave_mode_select(uint32_t timer_periph,uint32_t slavemode);
 
void timer_master_slave_mode_config(uint32_t timer_periph, uint32_t masterslave);
 
void timer_external_trigger_config(uint32_t timer_periph, uint32_t extprescaler, uint32_t extpolarity, uint32_t extfilter);
 
void timer_quadrature_decoder_mode_config(uint32_t timer_periph, uint32_t decomode, uint16_t ic0polarity, uint16_t ic1polarity);
 
void timer_internal_clock_config(uint32_t timer_periph);
 
void timer_internal_trigger_as_external_clock_config(uint32_t timer_periph, uint32_t intrigger);
 
void timer_external_trigger_as_external_clock_config(uint32_t timer_periph, uint32_t extrigger, uint16_t extpolarity,uint32_t extfilter);
 
void timer_external_clock_mode0_config(uint32_t timer_periph, uint32_t extprescaler, uint32_t extpolarity, uint32_t extfilter);
 
void timer_external_clock_mode1_config(uint32_t timer_periph, uint32_t extprescaler, uint32_t extpolarity, uint32_t extfilter);
 
void timer_external_clock_mode1_disable(uint32_t timer_periph);
 
void timer_channel_remap_config(uint32_t timer_periph,uint32_t remap);

 
 
void timer_write_chxval_register_config(uint32_t timer_periph, uint16_t ccsel);
 
void timer_output_value_selection_config(uint32_t timer_periph, uint16_t outsel);

 
 
FlagStatus timer_flag_get(uint32_t timer_periph, uint32_t flag);
 
void timer_flag_clear(uint32_t timer_periph, uint32_t flag);
 
void timer_interrupt_enable(uint32_t timer_periph, uint32_t interrupt);
 
void timer_interrupt_disable(uint32_t timer_periph, uint32_t interrupt);
 
FlagStatus timer_interrupt_flag_get(uint32_t timer_periph, uint32_t interrupt);
 
void timer_interrupt_flag_clear(uint32_t timer_periph, uint32_t interrupt);

#line 60 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_trng.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_trng.h"

 


 




 
 



 






 


 
 
typedef enum { 
    TRNG_FLAG_DRDY = ((uint32_t)((uint32_t)0x01U<<(0))),                            
    TRNG_FLAG_CECS = ((uint32_t)((uint32_t)0x01U<<(1))),                            
    TRNG_FLAG_SECS = ((uint32_t)((uint32_t)0x01U<<(2)))                             
} trng_flag_enum;

 
typedef enum {
    TRNG_INT_FLAG_CEIF = ((uint32_t)((uint32_t)0x01U<<(5))),                        
    TRNG_INT_FLAG_SEIF = ((uint32_t)((uint32_t)0x01U<<(6)))                         
} trng_int_flag_enum;

 
 
 
void trng_deinit(void);
 
void trng_enable(void);
 
void trng_disable(void);
 
uint32_t trng_get_true_random_data(void);

 
 
void trng_interrupt_enable(void);
 
void trng_interrupt_disable(void);
 
FlagStatus trng_flag_get(trng_flag_enum flag);
 
FlagStatus trng_interrupt_flag_get(trng_int_flag_enum int_flag);
 
void trng_interrupt_flag_clear(trng_int_flag_enum int_flag);

#line 61 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_usart.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_usart.h"

 
#line 49 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_usart.h"

 
#line 62 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_usart.h"

 
 
#line 75 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_usart.h"

 


 



 
#line 99 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_usart.h"

 
#line 110 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_usart.h"

 
#line 124 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_usart.h"

 



 
#line 138 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_usart.h"

 



 




 





 
 
#line 163 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_usart.h"

 
#line 172 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_usart.h"

 
typedef enum {
     
    USART_FLAG_CTS = (((uint32_t)(0x00U) << 6) | (uint32_t)(9U)),       
    USART_FLAG_LBD = (((uint32_t)(0x00U) << 6) | (uint32_t)(8U)),       
    USART_FLAG_TBE = (((uint32_t)(0x00U) << 6) | (uint32_t)(7U)),       
    USART_FLAG_TC = (((uint32_t)(0x00U) << 6) | (uint32_t)(6U)),        
    USART_FLAG_RBNE = (((uint32_t)(0x00U) << 6) | (uint32_t)(5U)),      
    USART_FLAG_IDLE = (((uint32_t)(0x00U) << 6) | (uint32_t)(4U)),      
    USART_FLAG_ORERR = (((uint32_t)(0x00U) << 6) | (uint32_t)(3U)),     
    USART_FLAG_NERR = (((uint32_t)(0x00U) << 6) | (uint32_t)(2U)),      
    USART_FLAG_FERR = (((uint32_t)(0x00U) << 6) | (uint32_t)(1U)),      
    USART_FLAG_PERR = (((uint32_t)(0x00U) << 6) | (uint32_t)(0U)),      
     
    USART_FLAG_BSY = (((uint32_t)(0x88U) << 6) | (uint32_t)(16U)),      
    USART_FLAG_EB = (((uint32_t)(0x88U) << 6) | (uint32_t)(12U)),       
    USART_FLAG_RT = (((uint32_t)(0x88U) << 6) | (uint32_t)(11U)),       
     
    USART_FLAG_EPERR = (((uint32_t)(0xC0U) << 6) | (uint32_t)(8U)),       
} usart_flag_enum;

 
typedef enum {
     
    USART_INT_FLAG_PERR = (((uint32_t)(0x00U) << 22) | (uint32_t)((0U) << 16) | (((uint32_t)(0x0CU) << 6) | (uint32_t)(8U))),        
    USART_INT_FLAG_TBE = (((uint32_t)(0x00U) << 22) | (uint32_t)((7U) << 16) | (((uint32_t)(0x0CU) << 6) | (uint32_t)(7U))),         
    USART_INT_FLAG_TC = (((uint32_t)(0x00U) << 22) | (uint32_t)((6U) << 16) | (((uint32_t)(0x0CU) << 6) | (uint32_t)(6U))),          
    USART_INT_FLAG_RBNE = (((uint32_t)(0x00U) << 22) | (uint32_t)((5U) << 16) | (((uint32_t)(0x0CU) << 6) | (uint32_t)(5U))),        
    USART_INT_FLAG_RBNE_ORERR = (((uint32_t)(0x00U) << 22) | (uint32_t)((3U) << 16) | (((uint32_t)(0x0CU) << 6) | (uint32_t)(5U))),  
    USART_INT_FLAG_IDLE = (((uint32_t)(0x00U) << 22) | (uint32_t)((4U) << 16) | (((uint32_t)(0x0CU) << 6) | (uint32_t)(4U))),        
     
    USART_INT_FLAG_LBD = (((uint32_t)(0x00U) << 22) | (uint32_t)((8U) << 16) | (((uint32_t)(0x10U) << 6) | (uint32_t)(6U))),         
     
    USART_INT_FLAG_CTS = (((uint32_t)(0x00U) << 22) | (uint32_t)((9U) << 16) | (((uint32_t)(0x14U) << 6) | (uint32_t)(10U))),        
    USART_INT_FLAG_ERR_ORERR = (((uint32_t)(0x00U) << 22) | (uint32_t)((3U) << 16) | (((uint32_t)(0x14U) << 6) | (uint32_t)(0U))),   
    USART_INT_FLAG_ERR_NERR = (((uint32_t)(0x00U) << 22) | (uint32_t)((2U) << 16) | (((uint32_t)(0x14U) << 6) | (uint32_t)(0U))),    
    USART_INT_FLAG_ERR_FERR = (((uint32_t)(0x00U) << 22) | (uint32_t)((1U) << 16) | (((uint32_t)(0x14U) << 6) | (uint32_t)(0U))),    
     
    USART_INT_FLAG_EB = (((uint32_t)(0x88U) << 22) | (uint32_t)((12U) << 16) | (((uint32_t)(0x80U) << 6) | (uint32_t)(5U))),         
    USART_INT_FLAG_RT = (((uint32_t)(0x88U) << 22) | (uint32_t)((11U) << 16) | (((uint32_t)(0x80U) << 6) | (uint32_t)(4U))),         
} usart_interrupt_flag_enum;

 
typedef enum {
     
    USART_INT_PERR = (((uint32_t)(0x0CU) << 6) | (uint32_t)(8U)),       
    USART_INT_TBE = (((uint32_t)(0x0CU) << 6) | (uint32_t)(7U)),        
    USART_INT_TC = (((uint32_t)(0x0CU) << 6) | (uint32_t)(6U)),         
    USART_INT_RBNE = (((uint32_t)(0x0CU) << 6) | (uint32_t)(5U)),       
    USART_INT_IDLE = (((uint32_t)(0x0CU) << 6) | (uint32_t)(4U)),       
     
    USART_INT_LBD = (((uint32_t)(0x10U) << 6) | (uint32_t)(6U)),        
     
    USART_INT_CTS = (((uint32_t)(0x14U) << 6) | (uint32_t)(10U)),       
    USART_INT_ERR = (((uint32_t)(0x14U) << 6) | (uint32_t)(0U)),        
     
    USART_INT_EB = (((uint32_t)(0x80U) << 6) | (uint32_t)(5U)),         
    USART_INT_RT = (((uint32_t)(0x80U) << 6) | (uint32_t)(4U)),         
} usart_interrupt_enum;

 
typedef enum {
     
    USART_DINV_ENABLE,                              
    USART_DINV_DISABLE,                             
     
    USART_TXPIN_ENABLE,                             
    USART_TXPIN_DISABLE,                            
     
    USART_RXPIN_ENABLE,                             
    USART_RXPIN_DISABLE,                            
} usart_invert_enum;

 




 




 





 




 




 




 






 




 




 




 




 




 




 




 




 




 




 




 




 




 




 
 
 
void usart_deinit(uint32_t usart_periph);
 
void usart_baudrate_set(uint32_t usart_periph, uint32_t baudval);
 
void usart_parity_config(uint32_t usart_periph, uint32_t paritycfg);
 
void usart_word_length_set(uint32_t usart_periph, uint32_t wlen);
 
void usart_stop_bit_set(uint32_t usart_periph, uint32_t stblen);
 
void usart_enable(uint32_t usart_periph);
 
void usart_disable(uint32_t usart_periph);
 
void usart_transmit_config(uint32_t usart_periph, uint32_t txconfig);
 
void usart_receive_config(uint32_t usart_periph, uint32_t rxconfig);

 
 
void usart_data_first_config(uint32_t usart_periph, uint32_t msbf);
 
void usart_invert_config(uint32_t usart_periph, usart_invert_enum invertpara);
 
void usart_oversample_config(uint32_t usart_periph, uint32_t oversamp);
 
void usart_sample_bit_config(uint32_t usart_periph, uint32_t obsm);
 
void usart_receiver_timeout_enable(uint32_t usart_periph);
 
void usart_receiver_timeout_disable(uint32_t usart_periph);
 
void usart_receiver_timeout_threshold_config(uint32_t usart_periph, uint32_t rtimeout);
 
void usart_data_transmit(uint32_t usart_periph, uint16_t data);
 
uint16_t usart_data_receive(uint32_t usart_periph);

 
 
void usart_address_config(uint32_t usart_periph, uint8_t addr);
 
void usart_mute_mode_enable(uint32_t usart_periph);
 
void usart_mute_mode_disable(uint32_t usart_periph);
 
void usart_mute_mode_wakeup_config(uint32_t usart_periph, uint32_t wmehtod);

 
 
void usart_lin_mode_enable(uint32_t usart_periph);
 
void usart_lin_mode_disable(uint32_t usart_periph);
 
void usart_lin_break_detection_length_config(uint32_t usart_periph, uint32_t lblen);
 
void usart_send_break(uint32_t usart_periph);

 
 
void usart_halfduplex_enable(uint32_t usart_periph);
 
void usart_halfduplex_disable(uint32_t usart_periph);

 
 
void usart_synchronous_clock_enable(uint32_t usart_periph);
 
void usart_synchronous_clock_disable(uint32_t usart_periph);
 
void usart_synchronous_clock_config(uint32_t usart_periph, uint32_t clen, uint32_t cph, uint32_t cpl);

 
 
void usart_guard_time_config(uint32_t usart_periph, uint8_t guat);
 
void usart_smartcard_mode_enable(uint32_t usart_periph);
 
void usart_smartcard_mode_disable(uint32_t usart_periph);
 
void usart_smartcard_mode_nack_enable(uint32_t usart_periph);
 
void usart_smartcard_mode_nack_disable(uint32_t usart_periph);
 
void usart_smartcard_autoretry_config(uint32_t usart_periph, uint8_t scrtnum);
 
void usart_block_length_config(uint32_t usart_periph, uint8_t bl);

 
 
void usart_irda_mode_enable(uint32_t usart_periph);
 
void usart_irda_mode_disable(uint32_t usart_periph);
 
void usart_prescaler_config(uint32_t usart_periph, uint8_t psc);
 
void usart_irda_lowpower_config(uint32_t usart_periph, uint32_t irlp);

 
 
void usart_hardware_flow_rts_config(uint32_t usart_periph, uint32_t rtsconfig);
 
void usart_hardware_flow_cts_config(uint32_t usart_periph, uint32_t ctsconfig);

 
 
void usart_break_frame_coherence_config(uint32_t usart_periph, uint32_t bcm);
 
void usart_parity_check_coherence_config(uint32_t usart_periph, uint32_t pcm);
 
void usart_hardware_flow_coherence_config(uint32_t usart_periph, uint32_t hcm);

 
 
void usart_dma_receive_config(uint32_t usart_periph, uint32_t dmacmd);
 
void usart_dma_transmit_config(uint32_t usart_periph, uint32_t dmacmd);

 
 
FlagStatus usart_flag_get(uint32_t usart_periph, usart_flag_enum flag);
 
void usart_flag_clear(uint32_t usart_periph, usart_flag_enum flag);
 
void usart_interrupt_enable(uint32_t usart_periph, usart_interrupt_enum interrupt);
 
void usart_interrupt_disable(uint32_t usart_periph, usart_interrupt_enum interrupt);
 
FlagStatus usart_interrupt_flag_get(uint32_t usart_periph, usart_interrupt_flag_enum int_flag);
 
void usart_interrupt_flag_clear(uint32_t usart_periph, usart_interrupt_flag_enum int_flag);

#line 62 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_wwdgt.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_wwdgt.h"

 


 




 
 



 




 


 






 

 


 
 
void wwdgt_deinit(void);
 
void wwdgt_enable(void);

 
void wwdgt_counter_update(uint16_t counter_value);
 
void wwdgt_config(uint16_t counter, uint16_t window, uint32_t prescaler);

 
FlagStatus wwdgt_flag_get(void);
 
void wwdgt_flag_clear(void);
 
void wwdgt_interrupt_enable(void);

#line 63 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_misc.h"




 


























 




#line 38 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_misc.h"

 
 



 


 


 






 








 



 
 
void nvic_priority_group_set(uint32_t nvic_prigroup);

 
void nvic_irq_enable(uint8_t nvic_irq, uint8_t nvic_irq_pre_priority, uint8_t nvic_irq_sub_priority);
 
void nvic_irq_disable(uint8_t nvic_irq);

 
void nvic_vector_table_set(uint32_t nvic_vict_tab, uint32_t offset);

 
void system_lowpower_set(uint8_t lowpower_mode);
 
void system_lowpower_reset(uint8_t lowpower_mode);

 
void systick_clksource_set(uint32_t systick_clksource);

#line 64 "..\\User\\gd32f4xx_libopt.h"


#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"
#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
 
 
 




 
 



 






   














  


 








#line 54 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


  



    typedef unsigned int size_t;    
#line 70 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"






    



    typedef unsigned short wchar_t;  
#line 91 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"

typedef struct div_t { int quot, rem; } div_t;
    
typedef struct ldiv_t { long int quot, rem; } ldiv_t;
    

typedef struct lldiv_t { long long quot, rem; } lldiv_t;
    


#line 112 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
   



 

   




 
#line 131 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"
   


 
extern __declspec(__nothrow) int __aeabi_MB_CUR_MAX(void);

   




 

   




 




extern __declspec(__nothrow) double atof(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int atoi(const char *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) long int atol(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) long long atoll(const char *  ) __attribute__((__nonnull__(1)));
   



 


extern __declspec(__nothrow) double strtod(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

















 

extern __declspec(__nothrow) float strtof(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) long double strtold(const char * __restrict  , char ** __restrict  ) __attribute__((__nonnull__(1)));
   

 

extern __declspec(__nothrow) long int strtol(const char * __restrict  ,
                        char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   



























 
extern __declspec(__nothrow) unsigned long int strtoul(const char * __restrict  ,
                                       char ** __restrict  , int  ) __attribute__((__nonnull__(1)));
   


























 

 
extern __declspec(__nothrow) long long strtoll(const char * __restrict  ,
                                  char ** __restrict  , int  )
                          __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) unsigned long long strtoull(const char * __restrict  ,
                                            char ** __restrict  , int  )
                                   __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) int rand(void);
   







 
extern __declspec(__nothrow) void srand(unsigned int  );
   






 

struct _rand_state { int __x[57]; };
extern __declspec(__nothrow) int _rand_r(struct _rand_state *);
extern __declspec(__nothrow) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __declspec(__nothrow) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __declspec(__nothrow) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);
   


 

extern __declspec(__nothrow) void *calloc(size_t  , size_t  );
   



 
extern __declspec(__nothrow) void free(void *  );
   





 
extern __declspec(__nothrow) void *malloc(size_t  );
   



 
extern __declspec(__nothrow) void *realloc(void *  , size_t  );
   













 

extern __declspec(__nothrow) int posix_memalign(void **  , size_t  , size_t  );
   









 

typedef int (*__heapprt)(void *, char const *, ...);
extern __declspec(__nothrow) void __heapstats(int (*  )(void *  ,
                                           char const *  , ...),
                        void *  ) __attribute__((__nonnull__(1)));
   










 
extern __declspec(__nothrow) int __heapvalid(int (*  )(void *  ,
                                           char const *  , ...),
                       void *  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) __declspec(__noreturn) void abort(void);
   







 

extern __declspec(__nothrow) int atexit(void (*  )(void)) __attribute__((__nonnull__(1)));
   




 
#line 436 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern __declspec(__nothrow) __declspec(__noreturn) void exit(int  );
   












 

extern __declspec(__nothrow) __declspec(__noreturn) void _Exit(int  );
   







      

extern __declspec(__nothrow) char *getenv(const char *  ) __attribute__((__nonnull__(1)));
   









 

extern __declspec(__nothrow) int  system(const char *  );
   









 

extern  void *bsearch(const void *  , const void *  ,
              size_t  , size_t  ,
              int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
   












 
#line 524 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"


extern  void qsort(void *  , size_t  , size_t  ,
           int (*  )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
   









 

#line 553 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"

extern __declspec(__nothrow) __attribute__((const)) int abs(int  );
   



 

extern __declspec(__nothrow) __attribute__((const)) div_t div(int  , int  );
   









 
extern __declspec(__nothrow) __attribute__((const)) long int labs(long int  );
   



 




extern __declspec(__nothrow) __attribute__((const)) ldiv_t ldiv(long int  , long int  );
   











 







extern __declspec(__nothrow) __attribute__((const)) long long llabs(long long  );
   



 




extern __declspec(__nothrow) __attribute__((const)) lldiv_t lldiv(long long  , long long  );
   











 
#line 634 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"




 
typedef struct __sdiv32by16 { int quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned int quot, rem; } __udiv32by16;
    
typedef struct __sdiv64by32 { int rem, quot; } __sdiv64by32;

__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv32by16 __rt_sdiv32by16(
     int  ,
     short int  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __udiv32by16 __rt_udiv32by16(
     unsigned int  ,
     unsigned short  );
   

 
__value_in_regs extern __declspec(__nothrow) __attribute__((const)) __sdiv64by32 __rt_sdiv64by32(
     int  , unsigned int  ,
     int  );
   

 




 
extern __declspec(__nothrow) unsigned int __fp_status(unsigned int  , unsigned int  );
   







 























 
extern __declspec(__nothrow) int mblen(const char *  , size_t  );
   












 
extern __declspec(__nothrow) int mbtowc(wchar_t * __restrict  ,
                   const char * __restrict  , size_t  );
   















 
extern __declspec(__nothrow) int wctomb(char *  , wchar_t  );
   













 





 
extern __declspec(__nothrow) size_t mbstowcs(wchar_t * __restrict  ,
                      const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 
extern __declspec(__nothrow) size_t wcstombs(char * __restrict  ,
                      const wchar_t * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   














 

extern __declspec(__nothrow) void __use_realtime_heap(void);
extern __declspec(__nothrow) void __use_realtime_division(void);
extern __declspec(__nothrow) void __use_two_region_memory(void);
extern __declspec(__nothrow) void __use_no_heap(void);
extern __declspec(__nothrow) void __use_no_heap_region(void);

extern __declspec(__nothrow) char const *__C_library_version_string(void);
extern __declspec(__nothrow) int __C_library_version_number(void);











#line 892 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdlib.h"





 
#line 40 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

































  



 



  



 
#line 96 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 




#line 111 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"




 


 
#line 141 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

#line 153 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

#line 165 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

#line 180 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 
 
#line 199 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 
#line 212 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"
  
 

  
 

  
 





    
 

  
 
#line 237 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"
  
 


  
 

  
  
#line 253 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

  
#line 267 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

  






 



 


  
 

  
 




  
 

  
 




  
 

  
 





 

  
 


 
 
#line 324 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 



  
 




 



  
 



  
 

  
 

  
 

  
 

  
 

  
 

   
 


#line 382 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"
  
 

  
 

  
 


  
 

  
 



 

  
 

  
 

  
 


  
 


 
#line 429 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"
  
 

  
 


 

  
 

  
 
#line 464 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"
 
 
#line 478 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"
  
 
#line 495 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"
  
 



 


 


 

  
 

  
 


 
#line 541 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 



 


 


#line 559 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 
#line 582 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

  






 


 


#line 614 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 
 




 


 






 





#line 647 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"
                                                                           


#line 658 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 
typedef enum
{
     
    ENET_MAC_FLAG_MPKR              = (((uint32_t)(((uint16_t)0x002CU)) << 6) | (uint32_t)(5U)),       
    ENET_MAC_FLAG_WUFR              = (((uint32_t)(((uint16_t)0x002CU)) << 6) | (uint32_t)(6U)),        
     
    ENET_MAC_FLAG_FLOWCONTROL       = (((uint32_t)(((uint16_t)0x0018U)) << 6) | (uint32_t)(0U)),      
     
    ENET_MAC_FLAG_WUM               = (((uint32_t)(((uint16_t)0x0038U)) << 6) | (uint32_t)(3U)),      
    ENET_MAC_FLAG_MSC               = (((uint32_t)(((uint16_t)0x0038U)) << 6) | (uint32_t)(4U)),      
    ENET_MAC_FLAG_MSCR              = (((uint32_t)(((uint16_t)0x0038U)) << 6) | (uint32_t)(5U)),      
    ENET_MAC_FLAG_MSCT              = (((uint32_t)(((uint16_t)0x0038U)) << 6) | (uint32_t)(6U)),      
    ENET_MAC_FLAG_TMST              = (((uint32_t)(((uint16_t)0x0038U)) << 6) | (uint32_t)(9U)),      
     
    ENET_PTP_FLAG_TSSCO             = (((uint32_t)(((uint16_t)0x0728U)) << 6) | (uint32_t)(0U)),         
    ENET_PTP_FLAG_TTM               = (((uint32_t)(((uint16_t)0x0728U)) << 6) | (uint32_t)(1U)),       
     
    ENET_MSC_FLAG_RFCE              = (((uint32_t)(((uint16_t)0x0104U)) << 6) | (uint32_t)(5U)),     
    ENET_MSC_FLAG_RFAE              = (((uint32_t)(((uint16_t)0x0104U)) << 6) | (uint32_t)(6U)),     
    ENET_MSC_FLAG_RGUF              = (((uint32_t)(((uint16_t)0x0104U)) << 6) | (uint32_t)(17U)),    
      
    ENET_MSC_FLAG_TGFSC             = (((uint32_t)(((uint16_t)0x0108U)) << 6) | (uint32_t)(14U)),    
    ENET_MSC_FLAG_TGFMSC            = (((uint32_t)(((uint16_t)0x0108U)) << 6) | (uint32_t)(15U)),    
    ENET_MSC_FLAG_TGF               = (((uint32_t)(((uint16_t)0x0108U)) << 6) | (uint32_t)(21U)),    
     
    ENET_DMA_FLAG_TS                = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(0U)),      
    ENET_DMA_FLAG_TPS               = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(1U)),      
    ENET_DMA_FLAG_TBU               = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(2U)),      
    ENET_DMA_FLAG_TJT               = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(3U)),      
    ENET_DMA_FLAG_RO                = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(4U)),      
    ENET_DMA_FLAG_TU                = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(5U)),      
    ENET_DMA_FLAG_RS                = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(6U)),      
    ENET_DMA_FLAG_RBU               = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(7U)),      
    ENET_DMA_FLAG_RPS               = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(8U)),      
    ENET_DMA_FLAG_RWT               = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(9U)),      
    ENET_DMA_FLAG_ET                = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(10U)),     
    ENET_DMA_FLAG_FBE               = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(13U)),     
    ENET_DMA_FLAG_ER                = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(14U)),     
    ENET_DMA_FLAG_AI                = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(15U)),     
    ENET_DMA_FLAG_NI                = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(16U)),     
    ENET_DMA_FLAG_EB_DMA_ERROR      = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(23U)),     
    ENET_DMA_FLAG_EB_TRANSFER_ERROR = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(24U)),     
    ENET_DMA_FLAG_EB_ACCESS_ERROR   = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(25U)),     
    ENET_DMA_FLAG_MSC               = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(27U)),     
    ENET_DMA_FLAG_WUM               = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(28U)),     
    ENET_DMA_FLAG_TST               = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(29U)),                             
}enet_flag_enum;

 
typedef enum
{
     
    ENET_DMA_FLAG_TS_CLR            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(0U)),      
    ENET_DMA_FLAG_TPS_CLR           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(1U)),      
    ENET_DMA_FLAG_TBU_CLR           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(2U)),      
    ENET_DMA_FLAG_TJT_CLR           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(3U)),      
    ENET_DMA_FLAG_RO_CLR            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(4U)),      
    ENET_DMA_FLAG_TU_CLR            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(5U)),      
    ENET_DMA_FLAG_RS_CLR            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(6U)),      
    ENET_DMA_FLAG_RBU_CLR           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(7U)),      
    ENET_DMA_FLAG_RPS_CLR           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(8U)),      
    ENET_DMA_FLAG_RWT_CLR           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(9U)),      
    ENET_DMA_FLAG_ET_CLR            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(10U)),     
    ENET_DMA_FLAG_FBE_CLR           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(13U)),     
    ENET_DMA_FLAG_ER_CLR            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(14U)),     
    ENET_DMA_FLAG_AI_CLR            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(15U)),     
    ENET_DMA_FLAG_NI_CLR            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(16U)),                            
}enet_flag_clear_enum;

 
typedef enum
{
     
    ENET_MAC_INT_WUMIM              = (((uint32_t)(((uint16_t)0x003CU)) << 6) | (uint32_t)(3U)),    
    ENET_MAC_INT_TMSTIM             = (((uint32_t)(((uint16_t)0x003CU)) << 6) | (uint32_t)(9U)),    
      
    ENET_MSC_INT_RFCEIM             = (((uint32_t)(((uint16_t)0x010CU)) << 6) | (uint32_t)(5U)),   
    ENET_MSC_INT_RFAEIM             = (((uint32_t)(((uint16_t)0x010CU)) << 6) | (uint32_t)(6U)),   
    ENET_MSC_INT_RGUFIM             = (((uint32_t)(((uint16_t)0x010CU)) << 6) | (uint32_t)(17U)),  
      
    ENET_MSC_INT_TGFSCIM            = (((uint32_t)(((uint16_t)0x0110U)) << 6) | (uint32_t)(14U)),  
    ENET_MSC_INT_TGFMSCIM           = (((uint32_t)(((uint16_t)0x0110U)) << 6) | (uint32_t)(15U)),  
    ENET_MSC_INT_TGFIM              = (((uint32_t)(((uint16_t)0x0110U)) << 6) | (uint32_t)(21U)),  
      
    ENET_DMA_INT_TIE                = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(0U)),     
    ENET_DMA_INT_TPSIE              = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(1U)),     
    ENET_DMA_INT_TBUIE              = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(2U)),     
    ENET_DMA_INT_TJTIE              = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(3U)),     
    ENET_DMA_INT_ROIE               = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(4U)),     
    ENET_DMA_INT_TUIE               = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(5U)),     
    ENET_DMA_INT_RIE                = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(6U)),     
    ENET_DMA_INT_RBUIE              = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(7U)),     
    ENET_DMA_INT_RPSIE              = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(8U)),     
    ENET_DMA_INT_RWTIE              = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(9U)),     
    ENET_DMA_INT_ETIE               = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(10U)),    
    ENET_DMA_INT_FBEIE              = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(13U)),    
    ENET_DMA_INT_ERIE               = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(14U)),    
    ENET_DMA_INT_AIE                = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(15U)),    
    ENET_DMA_INT_NIE                = (((uint32_t)(((uint16_t)0x101CU)) << 6) | (uint32_t)(16U)),    
}enet_int_enum;
 
 
typedef enum
{
     
    ENET_MAC_INT_FLAG_WUM           = (((uint32_t)(((uint16_t)0x0038U)) << 6) | (uint32_t)(3U)),      
    ENET_MAC_INT_FLAG_MSC           = (((uint32_t)(((uint16_t)0x0038U)) << 6) | (uint32_t)(4U)),      
    ENET_MAC_INT_FLAG_MSCR          = (((uint32_t)(((uint16_t)0x0038U)) << 6) | (uint32_t)(5U)),      
    ENET_MAC_INT_FLAG_MSCT          = (((uint32_t)(((uint16_t)0x0038U)) << 6) | (uint32_t)(6U)),      
    ENET_MAC_INT_FLAG_TMST          = (((uint32_t)(((uint16_t)0x0038U)) << 6) | (uint32_t)(9U)),      
     
    ENET_MSC_INT_FLAG_RFCE          = (((uint32_t)(((uint16_t)0x0104U)) << 6) | (uint32_t)(5U)),     
    ENET_MSC_INT_FLAG_RFAE          = (((uint32_t)(((uint16_t)0x0104U)) << 6) | (uint32_t)(6U)),     
    ENET_MSC_INT_FLAG_RGUF          = (((uint32_t)(((uint16_t)0x0104U)) << 6) | (uint32_t)(17U)),    
     
    ENET_MSC_INT_FLAG_TGFSC         = (((uint32_t)(((uint16_t)0x0108U)) << 6) | (uint32_t)(14U)),    
    ENET_MSC_INT_FLAG_TGFMSC        = (((uint32_t)(((uint16_t)0x0108U)) << 6) | (uint32_t)(15U)),    
    ENET_MSC_INT_FLAG_TGF           = (((uint32_t)(((uint16_t)0x0108U)) << 6) | (uint32_t)(21U)),    
     
    ENET_DMA_INT_FLAG_TS            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(0U)),      
    ENET_DMA_INT_FLAG_TPS           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(1U)),      
    ENET_DMA_INT_FLAG_TBU           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(2U)),      
    ENET_DMA_INT_FLAG_TJT           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(3U)),      
    ENET_DMA_INT_FLAG_RO            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(4U)),      
    ENET_DMA_INT_FLAG_TU            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(5U)),      
    ENET_DMA_INT_FLAG_RS            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(6U)),      
    ENET_DMA_INT_FLAG_RBU           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(7U)),      
    ENET_DMA_INT_FLAG_RPS           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(8U)),      
    ENET_DMA_INT_FLAG_RWT           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(9U)),      
    ENET_DMA_INT_FLAG_ET            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(10U)),     
    ENET_DMA_INT_FLAG_FBE           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(13U)),     
    ENET_DMA_INT_FLAG_ER            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(14U)),     
    ENET_DMA_INT_FLAG_AI            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(15U)),     
    ENET_DMA_INT_FLAG_NI            = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(16U)),     
    ENET_DMA_INT_FLAG_MSC           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(27U)),     
    ENET_DMA_INT_FLAG_WUM           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(28U)),     
    ENET_DMA_INT_FLAG_TST           = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(29U)),      
}enet_int_flag_enum;

 
typedef enum
{
     
    ENET_DMA_INT_FLAG_TS_CLR        = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(0U)),      
    ENET_DMA_INT_FLAG_TPS_CLR       = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(1U)),      
    ENET_DMA_INT_FLAG_TBU_CLR       = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(2U)),      
    ENET_DMA_INT_FLAG_TJT_CLR       = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(3U)),      
    ENET_DMA_INT_FLAG_RO_CLR        = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(4U)),      
    ENET_DMA_INT_FLAG_TU_CLR        = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(5U)),      
    ENET_DMA_INT_FLAG_RS_CLR        = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(6U)),      
    ENET_DMA_INT_FLAG_RBU_CLR       = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(7U)),      
    ENET_DMA_INT_FLAG_RPS_CLR       = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(8U)),      
    ENET_DMA_INT_FLAG_RWT_CLR       = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(9U)),      
    ENET_DMA_INT_FLAG_ET_CLR        = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(10U)),     
    ENET_DMA_INT_FLAG_FBE_CLR       = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(13U)),     
    ENET_DMA_INT_FLAG_ER_CLR        = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(14U)),     
    ENET_DMA_INT_FLAG_AI_CLR        = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(15U)),     
    ENET_DMA_INT_FLAG_NI_CLR        = (((uint32_t)(((uint16_t)0x1014U)) << 6) | (uint32_t)(16U)),     
}enet_int_flag_clear_enum;

 
typedef enum
{
    ENET_RX_DESC_TABLE              = ((uint16_t)0x100CU),                        
    ENET_RX_CURRENT_DESC            = ((uint16_t)0x104CU),                        
    ENET_RX_CURRENT_BUFFER          = ((uint16_t)0x1054U),                        
    ENET_TX_DESC_TABLE              = ((uint16_t)0x1010U),                        
    ENET_TX_CURRENT_DESC            = ((uint16_t)0x1048U),                        
    ENET_TX_CURRENT_BUFFER          = ((uint16_t)0x1050U)                         
}enet_desc_reg_enum;

 
typedef enum
{
    ENET_MSC_TX_SCCNT               = ((uint16_t)0x014CU),                          
    ENET_MSC_TX_MSCCNT              = ((uint16_t)0x0150U),                         
    ENET_MSC_TX_TGFCNT              = ((uint16_t)0x0168U),                         
    ENET_MSC_RX_RFCECNT             = ((uint16_t)0x0194U),                        
    ENET_MSC_RX_RFAECNT             = ((uint16_t)0x0198U),                        
    ENET_MSC_RX_RGUFCNT             = ((uint16_t)0x01C4U)                         
}enet_msc_counter_enum; 

 
typedef enum
{
    FORWARD_OPTION                  = ((uint32_t)((uint32_t)0x01U<<(0))),                                        
    DMABUS_OPTION                   = ((uint32_t)((uint32_t)0x01U<<(1))),                                        
    DMA_MAXBURST_OPTION             = ((uint32_t)((uint32_t)0x01U<<(2))),                                        
    DMA_ARBITRATION_OPTION          = ((uint32_t)((uint32_t)0x01U<<(3))),                                        
    STORE_OPTION                    = ((uint32_t)((uint32_t)0x01U<<(4))),                                        
    DMA_OPTION                      = ((uint32_t)((uint32_t)0x01U<<(5))),                                        
    VLAN_OPTION                     = ((uint32_t)((uint32_t)0x01U<<(6))),                                        
    FLOWCTL_OPTION                  = ((uint32_t)((uint32_t)0x01U<<(7))),                                        
    HASHH_OPTION                    = ((uint32_t)((uint32_t)0x01U<<(8))),                                        
    HASHL_OPTION                    = ((uint32_t)((uint32_t)0x01U<<(9))),                                        
    FILTER_OPTION                   = ((uint32_t)((uint32_t)0x01U<<(10))),                                       
    HALFDUPLEX_OPTION               = ((uint32_t)((uint32_t)0x01U<<(11))),                                       
    TIMER_OPTION                    = ((uint32_t)((uint32_t)0x01U<<(12))),                                       
    INTERFRAMEGAP_OPTION            = ((uint32_t)((uint32_t)0x01U<<(13))),                                       
}enet_option_enum;

 
typedef enum
{
    ENET_AUTO_NEGOTIATION           = 0x01U,                                         
    ENET_100M_FULLDUPLEX            = (((uint32_t)((uint32_t)0x01U<<(14))) | ((uint32_t)((uint32_t)0x01U<<(11)))),         
    ENET_100M_HALFDUPLEX            = ((uint32_t)((uint32_t)0x01U<<(14))) ,                             
    ENET_10M_FULLDUPLEX             = ((uint32_t)((uint32_t)0x01U<<(11))),                              
    ENET_10M_HALFDUPLEX             = (uint32_t)0x00000000U,                         
    ENET_LOOPBACKMODE               = (((uint32_t)((uint32_t)0x01U<<(12))) | ((uint32_t)((uint32_t)0x01U<<(11))))          
}enet_mediamode_enum;

 
typedef enum
{
    ENET_NO_AUTOCHECKSUM                = (uint32_t)0x00000000U,                     
    ENET_AUTOCHECKSUM_DROP_FAILFRAMES   = ((uint32_t)((uint32_t)0x01U<<(10))),                        
    ENET_AUTOCHECKSUM_ACCEPT_FAILFRAMES = (((uint32_t)((uint32_t)0x01U<<(10)))|((uint32_t)((uint32_t)0x01U<<(26)))) 
 
}enet_chksumconf_enum;

 
typedef enum
{
    ENET_PROMISCUOUS_MODE           = ((uint32_t)((uint32_t)0x01U<<(0))),                              
    ENET_RECEIVEALL                 = (int32_t)((uint32_t)((uint32_t)0x01U<<(31))),                    
    ENET_BROADCAST_FRAMES_PASS      = (uint32_t)0x00000000U,                         
    ENET_BROADCAST_FRAMES_DROP      = ((uint32_t)((uint32_t)0x01U<<(5)))                            
}enet_frmrecept_enum;

 
typedef enum
{
    ALL_MAC_REG                     = 0U,                                             
    ALL_MSC_REG                     = 22U,                                            
    ALL_PTP_REG                     = 33U,                                            
    ALL_DMA_REG                     = 44U,                                            
}enet_registers_type_enum;

 
typedef enum
{
    ENET_DMA_TX                     = ((0xFFFFFFFFUL << (20)) & (0xFFFFFFFFUL >> (31U - (uint32_t)(22)))),                              
    ENET_DMA_RX                     = ((0xFFFFFFFFUL << (17)) & (0xFFFFFFFFUL >> (31U - (uint32_t)(19))))                               
}enet_dmadirection_enum;

 
typedef enum
{
    ENET_PHY_READ                   = (uint32_t)0x00000000,                          
    ENET_PHY_WRITE                  = ((uint32_t)((uint32_t)0x01U<<(1)))                            
}enet_phydirection_enum;

 
typedef enum
{
    ENET_REG_READ,                                                                   
    ENET_REG_WRITE                                                                   
}enet_regdirection_enum;

  
typedef enum
{
    ENET_MAC_ADDRESS0               = ((uint32_t)0x00000000),                        
    ENET_MAC_ADDRESS1               = ((uint32_t)0x00000008),                        
    ENET_MAC_ADDRESS2               = ((uint32_t)0x00000010),                        
    ENET_MAC_ADDRESS3               = ((uint32_t)0x00000018)                         
}enet_macaddress_enum;

 
typedef enum
{
    TXDESC_COLLISION_COUNT,                                                          
    TXDESC_BUFFER_1_ADDR,                                                            
    RXDESC_FRAME_LENGTH,                                                             
    RXDESC_BUFFER_1_SIZE,                                                            
    RXDESC_BUFFER_2_SIZE,                                                            
    RXDESC_BUFFER_1_ADDR                                                             
}enet_descstate_enum;

 
typedef enum
{
    ENET_MSC_PRESET_NONE            = 0U,                                            
    ENET_MSC_PRESET_HALF            = ((uint32_t)((uint32_t)0x01U<<(4))),                              
    ENET_MSC_PRESET_FULL            = ((uint32_t)((uint32_t)0x01U<<(4))) | ((uint32_t)((uint32_t)0x01U<<(5)))          
}enet_msc_preset_enum;

typedef enum{
    ENET_CKNT_ORDINARY                = (((0xFFFFFFFFUL << (16)) & (0xFFFFFFFFUL >> (31U - (uint32_t)(17)))) & ((uint32_t)(0) << 16)),                           
    ENET_CKNT_BOUNDARY                = (((0xFFFFFFFFUL << (16)) & (0xFFFFFFFFUL >> (31U - (uint32_t)(17)))) & ((uint32_t)(1) << 16)),                           
    ENET_CKNT_END_TO_END              = (((0xFFFFFFFFUL << (16)) & (0xFFFFFFFFUL >> (31U - (uint32_t)(17)))) & ((uint32_t)(2) << 16)),                           
    ENET_CKNT_PEER_TO_PEER            = (((0xFFFFFFFFUL << (16)) & (0xFFFFFFFFUL >> (31U - (uint32_t)(17)))) & ((uint32_t)(3) << 16)),                           
    ENET_PTP_SYSTIME_INIT             = ((uint32_t)((uint32_t)0x01U<<(2))),                       
    ENET_PTP_SYSTIME_UPDATE           = ((uint32_t)((uint32_t)0x01U<<(3))),                        
    ENET_PTP_ADDEND_UPDATE            = ((uint32_t)((uint32_t)0x01U<<(5))),                       
    ENET_PTP_FINEMODE                 = (int32_t)(((uint32_t)((uint32_t)0x01U<<(1)))| ((uint32_t)((uint32_t)0x01U<<(31)))),   
    ENET_PTP_COARSEMODE               = ((uint32_t)((uint32_t)0x01U<<(1))),                       
    ENET_SUBSECOND_DIGITAL_ROLLOVER   = (int32_t)(((uint32_t)((uint32_t)0x01U<<(9))) | ((uint32_t)((uint32_t)0x01U<<(31)))),   
    ENET_SUBSECOND_BINARY_ROLLOVER    = ((uint32_t)((uint32_t)0x01U<<(9))),                        
    ENET_SNOOPING_PTP_VERSION_2       = (int32_t)(((uint32_t)((uint32_t)0x01U<<(10)))| ((uint32_t)((uint32_t)0x01U<<(31)))),     
    ENET_SNOOPING_PTP_VERSION_1       = ((uint32_t)((uint32_t)0x01U<<(10))),                         
    ENET_EVENT_TYPE_MESSAGES_SNAPSHOT = (int32_t)(((uint32_t)((uint32_t)0x01U<<(14)))| ((uint32_t)((uint32_t)0x01U<<(31)))),   
    ENET_ALL_TYPE_MESSAGES_SNAPSHOT   = ((uint32_t)((uint32_t)0x01U<<(14))),                       
    ENET_MASTER_NODE_MESSAGE_SNAPSHOT = (int32_t)(((uint32_t)((uint32_t)0x01U<<(15)))| ((uint32_t)((uint32_t)0x01U<<(31)))),   
    ENET_SLAVE_NODE_MESSAGE_SNAPSHOT  = ((uint32_t)((uint32_t)0x01U<<(15))),                       
}enet_ptp_function_enum;

 
typedef struct
{
    uint32_t option_enable;                                                          
    uint32_t forward_frame;                                                           
    uint32_t dmabus_mode;                                                            
    uint32_t dma_maxburst;                                                           
    uint32_t dma_arbitration;                                                        
    uint32_t store_forward_mode;                                                     
    uint32_t dma_function;                                                           
    uint32_t vlan_config;                                                               
    uint32_t flow_control;                                                           
    uint32_t hashtable_high;                                                         
    uint32_t hashtable_low;                                                          
    uint32_t framesfilter_mode;                                                      
    uint32_t halfduplex_param;                                                                   
    uint32_t timer_config;                                                           
    uint32_t interframegap;                                                          
}enet_initpara_struct;

  
typedef struct  
{
    uint32_t status;                                                                 
    uint32_t control_buffer_size;                                                    
    uint32_t buffer1_addr;                                                           
    uint32_t buffer2_next_desc_addr;                                                 

#line 1002 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"
  
} enet_descriptors_struct;

  
typedef struct
{
    uint32_t second;                                                                 
    uint32_t subsecond;                                                              
    uint32_t sign;                                                                   
}enet_ptp_systime_struct;

 






#line 1029 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"







 





 

























 





 


 








 






          
#line 1101 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"






 
#line 1114 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"





 


 












 











                                                                                      

 

 



  
#line 1163 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 
#line 1177 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"











 


 


#line 1200 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"



 
 
#line 1213 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

#line 1222 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 




 
#line 1236 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 


 

 





 





 
#line 1272 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 






#line 1293 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

#line 1300 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"




#line 1317 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"










 
#line 1335 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

#line 1343 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"






 






#line 1365 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

























 




 


 









 




 



 







 






 






#line 1446 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 


  


 





 
 
 
void enet_deinit(void);
 
void enet_initpara_config(enet_option_enum option, uint32_t para);
 
ErrStatus enet_init(enet_mediamode_enum mediamode, enet_chksumconf_enum checksum, enet_frmrecept_enum recept);
 
ErrStatus enet_software_reset(void);
 
uint32_t enet_rxframe_size_get(void);
 
void enet_descriptors_chain_init(enet_dmadirection_enum direction);
 
void enet_descriptors_ring_init(enet_dmadirection_enum direction);
 
ErrStatus enet_frame_receive(uint8_t *buffer, uint32_t bufsize);
 

 
ErrStatus enet_frame_transmit(uint8_t *buffer, uint32_t length);
 

 
void enet_transmit_checksum_config(enet_descriptors_struct *desc, uint32_t checksum);
 
void enet_enable(void);   
 
void enet_disable(void);
 
void enet_mac_address_set(enet_macaddress_enum mac_addr, uint8_t paddr[]);
    
void enet_mac_address_get(enet_macaddress_enum mac_addr, uint8_t paddr[]);

 
FlagStatus enet_flag_get(enet_flag_enum enet_flag);
 
void enet_flag_clear(enet_flag_clear_enum enet_flag);
 
void enet_interrupt_enable(enet_int_enum enet_int);
 
void enet_interrupt_disable(enet_int_enum enet_int);
 
FlagStatus enet_interrupt_flag_get(enet_int_flag_enum int_flag);
 
void enet_interrupt_flag_clear(enet_int_flag_clear_enum int_flag_clear);

 
 
void enet_tx_enable(void);
 
void enet_tx_disable(void);
 
void enet_rx_enable(void);
 
void enet_rx_disable(void);
 
void enet_registers_get(enet_registers_type_enum type, uint32_t *preg, uint32_t num);
 
uint32_t enet_debug_status_get(uint32_t mac_debug);
 
void enet_address_filter_enable(enet_macaddress_enum mac_addr);
 
void enet_address_filter_disable(enet_macaddress_enum mac_addr);
 
void enet_address_filter_config(enet_macaddress_enum mac_addr, uint32_t addr_mask, uint32_t filter_type);
 
ErrStatus enet_phy_config(void);
 
ErrStatus enet_phy_write_read(enet_phydirection_enum direction, uint16_t phy_address, uint16_t phy_reg, uint16_t *pvalue);
 
ErrStatus enet_phyloopback_enable(void);
 
ErrStatus enet_phyloopback_disable(void);
 
void enet_forward_feature_enable(uint32_t feature);
 
void enet_forward_feature_disable(uint32_t feature);
 
void enet_fliter_feature_enable(uint32_t feature);
 
void enet_fliter_feature_disable(uint32_t feature);

 
 
ErrStatus enet_pauseframe_generate(void);
 
void enet_pauseframe_detect_config(uint32_t detect);
 
void enet_pauseframe_config(uint32_t pausetime, uint32_t pause_threshold);
 
void enet_flowcontrol_threshold_config(uint32_t deactive, uint32_t active);
 
void enet_flowcontrol_feature_enable(uint32_t feature);
 
void enet_flowcontrol_feature_disable(uint32_t feature);

 
 
uint32_t enet_dmaprocess_state_get(enet_dmadirection_enum direction); 
 
void enet_dmaprocess_resume(enet_dmadirection_enum direction);
 
void enet_rxprocess_check_recovery(void);
 
ErrStatus enet_txfifo_flush(void);
 
uint32_t enet_current_desc_address_get(enet_desc_reg_enum addr_get);
 
uint32_t enet_desc_information_get(enet_descriptors_struct *desc, enet_descstate_enum info_get);
 
void enet_missed_frame_counter_get(uint32_t *rxfifo_drop, uint32_t *rxdma_drop);

 
 
FlagStatus enet_desc_flag_get(enet_descriptors_struct *desc, uint32_t desc_flag);
 
void enet_desc_flag_set(enet_descriptors_struct *desc, uint32_t desc_flag);
 
void enet_desc_flag_clear(enet_descriptors_struct *desc, uint32_t desc_flag); 
 
void enet_rx_desc_immediate_receive_complete_interrupt(enet_descriptors_struct *desc);
 
void enet_rx_desc_delay_receive_complete_interrupt(enet_descriptors_struct *desc, uint32_t delay_time);
 
void enet_rxframe_drop(void);
 
void enet_dma_feature_enable(uint32_t feature);
 
void enet_dma_feature_disable(uint32_t feature);


 
#line 1612 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_enet.h"

 
void enet_desc_select_normal_mode(void);
 
void enet_ptp_normal_descriptors_chain_init(enet_dmadirection_enum direction, enet_descriptors_struct *desc_ptptab);
 
void enet_ptp_normal_descriptors_ring_init(enet_dmadirection_enum direction, enet_descriptors_struct *desc_ptptab);
 
ErrStatus enet_ptpframe_receive_normal_mode(uint8_t *buffer, uint32_t bufsize, uint32_t timestamp[]);
 

 
ErrStatus enet_ptpframe_transmit_normal_mode(uint8_t *buffer, uint32_t length, uint32_t timestamp[]);
 




 
 
void enet_wum_filter_register_pointer_reset(void);
 
void enet_wum_filter_config(uint32_t pdata[]);
 
void enet_wum_feature_enable(uint32_t feature);
 
void enet_wum_feature_disable(uint32_t feature);

 
 
void enet_msc_counters_reset(void);
  
void enet_msc_feature_enable(uint32_t feature);
  
void enet_msc_feature_disable(uint32_t feature);
 
void enet_msc_counters_preset_config(enet_msc_preset_enum mode);
                    
uint32_t enet_msc_counters_get(enet_msc_counter_enum counter);

 
 
void enet_ptp_feature_enable(uint32_t feature);
 
void enet_ptp_feature_disable(uint32_t feature);
 
ErrStatus enet_ptp_timestamp_function_config(enet_ptp_function_enum func);
 
void enet_ptp_subsecond_increment_config(uint32_t subsecond);
 
void enet_ptp_timestamp_addend_config(uint32_t add);
 
void enet_ptp_timestamp_update_config(uint32_t sign, uint32_t second, uint32_t subsecond);
 
void enet_ptp_expected_time_config(uint32_t second, uint32_t nanosecond);
 
void enet_ptp_system_time_get(enet_ptp_systime_struct *systime_struct);
 
void enet_ptp_pps_output_frequency_config(uint32_t freq);


 
 
void enet_initpara_reset(void);


#line 68 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 






 
 
















 


















 











 






 
 
#line 121 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 
#line 130 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 






 
#line 147 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 
#line 156 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 





 





 





 


 
#line 188 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 
#line 197 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 






 




 





 




 





 





 





 


 


 
 
typedef struct
{
    uint32_t asyn_access_mode;                                           
    uint32_t syn_data_latency;                                           
    uint32_t syn_clk_division;                                           
    uint32_t bus_latency;                                                
    uint32_t asyn_data_setuptime;                                        
    uint32_t asyn_address_holdtime;                                      
    uint32_t asyn_address_setuptime;                                     
}exmc_norsram_timing_parameter_struct;

 
typedef struct
{
    uint32_t norsram_region;                                             
    uint32_t write_mode;                                                 
    uint32_t extended_mode;                                              
    uint32_t asyn_wait;                                                  
    uint32_t nwait_signal;                                               
    uint32_t memory_write;                                               
    uint32_t nwait_config;                                               
    uint32_t wrap_burst_mode;                                            
    uint32_t nwait_polarity;                                             
    uint32_t burst_mode;                                                 
    uint32_t databus_width;                                              
    uint32_t memory_type;                                                
    uint32_t address_data_mux;                                           
    exmc_norsram_timing_parameter_struct* read_write_timing;            
 
    exmc_norsram_timing_parameter_struct* write_timing;                  
}exmc_norsram_parameter_struct;

 
typedef struct
{
    uint32_t databus_hiztime;                                            
    uint32_t holdtime;                                                   
    uint32_t waittime;                                                   
    uint32_t setuptime;                                                  
}exmc_nand_pccard_timing_parameter_struct;

 
typedef struct
{
    uint32_t nand_bank;                                                   
    uint32_t ecc_size;                                                   
    uint32_t atr_latency;                                                
    uint32_t ctr_latency;                                                
    uint32_t ecc_logic;                                                  
    uint32_t databus_width;                                              
    uint32_t wait_feature;                                               
    exmc_nand_pccard_timing_parameter_struct* common_space_timing;       
    exmc_nand_pccard_timing_parameter_struct* attribute_space_timing;    
}exmc_nand_parameter_struct;

 
typedef struct
{
    uint32_t atr_latency;                                                
    uint32_t ctr_latency;                                                
    uint32_t wait_feature;                                               
    exmc_nand_pccard_timing_parameter_struct*  common_space_timing;      
    exmc_nand_pccard_timing_parameter_struct*  attribute_space_timing;   
    exmc_nand_pccard_timing_parameter_struct*  io_space_timing;          
}exmc_pccard_parameter_struct;

 
typedef struct
{
    uint32_t row_to_column_delay;                                        
    uint32_t row_precharge_delay;                                        
    uint32_t write_recovery_delay;                                       
    uint32_t auto_refresh_delay;                                         
    uint32_t row_address_select_delay;                                   
    uint32_t exit_selfrefresh_delay;                                     
    uint32_t load_mode_register_delay;                                   
}exmc_sdram_timing_parameter_struct;

 
typedef struct
{
    uint32_t sdram_device;                                               
    uint32_t pipeline_read_delay;                                        
    uint32_t burst_read_switch;                                          
    uint32_t sdclock_config;                                             
    uint32_t write_protection;                                           
    uint32_t cas_latency;                                                
    uint32_t internal_bank_number;                                       
    uint32_t data_width;                                                 
    uint32_t row_address_width;                                          
    uint32_t column_address_width;                                       
    exmc_sdram_timing_parameter_struct* timing;                          
}exmc_sdram_parameter_struct;

 
typedef struct
{
    uint32_t mode_register_content;                                      
    uint32_t auto_refresh_number;                                        
    uint32_t bank_select;                                                
    uint32_t command;                                                    
}exmc_sdram_command_parameter_struct;

 
typedef struct{
    uint32_t sample_polarity;                                            
    uint32_t id_length;                                                  
    uint32_t address_bits;                                               
    uint32_t command_bits;                                               
}exmc_sqpipsram_parameter_struct;

 













 
#line 379 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 




 





 






 
#line 416 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 
#line 435 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 
#line 444 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 
#line 463 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 
#line 482 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 




 





 





 





 





 





 






 
#line 542 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 
#line 552 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 
#line 571 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 






 
#line 607 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 





 






 






 





 



 



 



 



 




 



 



 



 



 




 



 



 



 
#line 695 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_exmc.h"

 





 
 
 
 
void exmc_norsram_deinit(uint32_t exmc_norsram_region);
 
void exmc_norsram_struct_para_init(exmc_norsram_parameter_struct* exmc_norsram_init_struct);
 
void exmc_norsram_init(exmc_norsram_parameter_struct* exmc_norsram_init_struct);
 
void exmc_norsram_enable(uint32_t exmc_norsram_region);
 
void exmc_norsram_disable(uint32_t exmc_norsram_region);
 
 
void exmc_nand_deinit(uint32_t exmc_nand_bank);
 
void exmc_nand_struct_para_init(exmc_nand_parameter_struct* exmc_nand_init_struct);
 
void exmc_nand_init(exmc_nand_parameter_struct* exmc_nand_init_struct);
 
void exmc_nand_enable(uint32_t exmc_nand_bank);
 
void exmc_nand_disable(uint32_t exmc_nand_bank);
 
 
void exmc_pccard_deinit(void);
 
void exmc_pccard_struct_para_init(exmc_pccard_parameter_struct* exmc_pccard_init_struct);
 
void exmc_pccard_init(exmc_pccard_parameter_struct* exmc_pccard_init_struct);
 
void exmc_pccard_enable(void);
 
void exmc_pccard_disable(void);
 
 
void exmc_sdram_deinit(uint32_t exmc_sdram_device);
 
void exmc_sdram_struct_para_init(exmc_sdram_parameter_struct* exmc_sdram_init_struct);
 
void exmc_sdram_init(exmc_sdram_parameter_struct* exmc_sdram_init_struct);
 
void exmc_sdram_struct_command_para_init(exmc_sdram_command_parameter_struct *exmc_sdram_command_init_struct);
 
 
void exmc_sqpipsram_deinit(void);
 
void exmc_sqpipsram_struct_para_init(exmc_sqpipsram_parameter_struct* exmc_sqpipsram_init_struct);
 
void exmc_sqpipsram_init(exmc_sqpipsram_parameter_struct* exmc_sqpipsram_init_struct);

 
 
 
void exmc_norsram_consecutive_clock_config(uint32_t clock_mode);
 
void exmc_norsram_page_size_config(uint32_t exmc_norsram_region, uint32_t page_size);
 
 
void exmc_nand_ecc_config(uint32_t exmc_nand_bank, ControlStatus newvalue);
 
uint32_t exmc_ecc_get(uint32_t exmc_nand_bank);
 
 
void exmc_sdram_readsample_enable(ControlStatus newvalue);
 
void exmc_sdram_readsample_config(uint32_t delay_cell, uint32_t extra_hclk);
 
void exmc_sdram_command_config(exmc_sdram_command_parameter_struct* exmc_sdram_command_init_struct);
 
void exmc_sdram_refresh_count_set(uint32_t exmc_count);
 
void exmc_sdram_autorefresh_number_set(uint32_t exmc_number);
 
void exmc_sdram_write_protection_config(uint32_t exmc_sdram_device, ControlStatus newvalue);
 
uint32_t exmc_sdram_bankstatus_get(uint32_t exmc_sdram_device);
 
 
void exmc_sqpipsram_read_command_set(uint32_t read_command_mode,uint32_t read_wait_cycle,uint32_t read_command_code);
 
void exmc_sqpipsram_write_command_set(uint32_t write_command_mode,uint32_t write_wait_cycle,uint32_t write_command_code);
 
void exmc_sqpipsram_read_id_command_send(void);
 
void exmc_sqpipsram_write_cmd_send(void);
 
uint32_t exmc_sqpipsram_low_id_get(void);
 
uint32_t exmc_sqpipsram_high_id_get(void);
 
FlagStatus exmc_sqpipsram_send_command_state_get(uint32_t send_command_flag);

 
 
void exmc_interrupt_enable(uint32_t exmc_bank,uint32_t interrupt);
 
void exmc_interrupt_disable(uint32_t exmc_bank,uint32_t interrupt);
 
FlagStatus exmc_flag_get(uint32_t exmc_bank,uint32_t flag);
 
void exmc_flag_clear(uint32_t exmc_bank,uint32_t flag);
 
FlagStatus exmc_interrupt_flag_get(uint32_t exmc_bank,uint32_t interrupt);
 
void exmc_interrupt_flag_clear(uint32_t exmc_bank,uint32_t interrupt);

#line 69 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 


 
 
#line 65 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 
#line 77 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 
#line 85 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 
#line 93 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 


 


 


 


 
#line 113 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 




 
#line 126 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 




 


 


 


 
 





 




 




 





 





 


 


 



 


 




 
 
typedef struct {
    uint32_t foreground_memaddr;                           
    uint32_t foreground_lineoff;                           
    uint32_t foreground_prealpha;                          
    uint32_t foreground_alpha_algorithm;                   
    uint32_t foreground_pf;                                
    uint32_t foreground_prered;                            
    uint32_t foreground_pregreen;                          
    uint32_t foreground_preblue;                           
} ipa_foreground_parameter_struct;

 
typedef struct {
    uint32_t background_memaddr;                           
    uint32_t background_lineoff;                           
    uint32_t background_prealpha;                          
    uint32_t background_alpha_algorithm;                   
    uint32_t background_pf;                                
    uint32_t background_prered;                            
    uint32_t background_pregreen;                          
    uint32_t background_preblue;                           
} ipa_background_parameter_struct;

 
typedef struct {
    uint32_t destination_memaddr;                          
    uint32_t destination_lineoff;                          
    uint32_t destination_prealpha;                         
    uint32_t destination_pf;                               
    uint32_t destination_prered;                           
    uint32_t destination_pregreen;                         
    uint32_t destination_preblue;                          
    uint32_t image_width;                                  
    uint32_t image_height;                                 
} ipa_destination_parameter_struct;

 
typedef enum {
    IPA_DPF_ARGB8888,                                      
    IPA_DPF_RGB888,                                        
    IPA_DPF_RGB565,                                        
    IPA_DPF_ARGB1555,                                      
    IPA_DPF_ARGB4444                                       
} ipa_dpf_enum;

 



 



 






 





 





 
#line 275 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 
#line 289 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 
#line 297 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 
#line 305 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 
#line 313 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_ipa.h"

 
 
 
void ipa_deinit(void);
 
void ipa_transfer_enable(void);
 
void ipa_transfer_hangup_enable(void);
 
void ipa_transfer_hangup_disable(void);
 
void ipa_transfer_stop_enable(void);
 
void ipa_transfer_stop_disable(void);
 
void ipa_foreground_lut_loading_enable(void);
 
void ipa_background_lut_loading_enable(void);
 
void ipa_pixel_format_convert_mode_set(uint32_t pfcm);

 

 
void ipa_foreground_struct_para_init(ipa_foreground_parameter_struct *foreground_struct);
 
void ipa_foreground_init(ipa_foreground_parameter_struct *foreground_struct);

 
void ipa_background_struct_para_init(ipa_background_parameter_struct *background_struct);
 
void ipa_background_init(ipa_background_parameter_struct *background_struct);

 
void ipa_destination_struct_para_init(ipa_destination_parameter_struct *destination_struct);
 
void ipa_destination_init(ipa_destination_parameter_struct *destination_struct);
 
void ipa_foreground_lut_init(uint8_t fg_lut_num, uint8_t fg_lut_pf, uint32_t fg_lut_addr);
 
void ipa_background_lut_init(uint8_t bg_lut_num, uint8_t bg_lut_pf, uint32_t bg_lut_addr);

 
 
void ipa_line_mark_config(uint16_t line_num);
 
void ipa_inter_timer_config(uint8_t timer_cfg);
 
void ipa_interval_clock_num_config(uint8_t clk_num);

 
 
FlagStatus ipa_flag_get(uint32_t flag);
 
void ipa_flag_clear(uint32_t flag);
 
void ipa_interrupt_enable(uint32_t int_flag);
 
void ipa_interrupt_disable(uint32_t int_flag);
 
FlagStatus ipa_interrupt_flag_get(uint32_t int_flag);
 
void ipa_interrupt_flag_clear(uint32_t int_flag);

#line 70 "..\\User\\gd32f4xx_libopt.h"
#line 1 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_tli.h"





 


























 




#line 39 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_tli.h"

 

 



 
#line 72 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_tli.h"

 
 



 



 



 



 
#line 100 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_tli.h"

 



 




 





 





 





 


 



 





 




 



 



 




 


 


 





 



 


 



 


 





 
 
typedef struct {
    uint16_t synpsz_vpsz;                      
    uint16_t synpsz_hpsz;                      
    uint16_t backpsz_vbpsz;                    
    uint16_t backpsz_hbpsz;                    
    uint32_t activesz_vasz;                    
    uint32_t activesz_hasz;                    
    uint32_t totalsz_vtsz;                     
    uint32_t totalsz_htsz;                     
    uint32_t backcolor_red;                    
    uint32_t backcolor_green;                  
    uint32_t backcolor_blue;                   
    uint32_t signalpolarity_hs;                
    uint32_t signalpolarity_vs;                
    uint32_t signalpolarity_de;                
    uint32_t signalpolarity_pixelck;           
} tli_parameter_struct;

 
typedef struct {
    uint16_t layer_window_rightpos;            
    uint16_t layer_window_leftpos;             
    uint16_t layer_window_bottompos;           
    uint16_t layer_window_toppos;              
    uint32_t layer_ppf;                        
    uint8_t  layer_sa;                         
    uint8_t  layer_default_alpha;              
    uint8_t  layer_default_red;                
    uint8_t  layer_default_green;              
    uint8_t  layer_default_blue;               
    uint32_t layer_acf1;                       
    uint32_t layer_acf2;                       
    uint32_t layer_frame_bufaddr;              
    uint16_t layer_frame_buf_stride_offset;    
    uint16_t layer_frame_line_length;          
    uint16_t layer_frame_total_line_number;    
} tli_layer_parameter_struct;

 
typedef struct {
    uint32_t layer_table_addr;                 
    uint8_t layer_lut_channel_red;             
    uint8_t layer_lut_channel_green;           
    uint8_t layer_lut_channel_blue;            
} tli_layer_lut_parameter_struct;

 
typedef enum {
    LAYER_PPF_ARGB8888 = 0U,                  
    LAYER_PPF_RGB888,                         
    LAYER_PPF_RGB565,                         
    LAYER_PPF_ARGB1555,                       
    LAYER_PPF_ARGB4444,                       
    LAYER_PPF_L8,                             
    LAYER_PPF_AL44,                           
    LAYER_PPF_AL88                            
} tli_layer_ppf_enum;

 
#line 260 "..\\Driver\\Library\\GD32F4xx_standard_peripheral\\Include\\gd32f4xx_tli.h"

 





 





 



 



 




 




 



 




 




 




 
 
 
void tli_deinit(void);

 
void tli_struct_para_init(tli_parameter_struct *tli_struct);
 
void tli_init(tli_parameter_struct *tli_struct);
 
void tli_dither_config(uint8_t dither_stat);
 
void tli_enable(void);
 
void tli_disable(void);
 
void tli_reload_config(uint8_t reload_mod);

 

 
void tli_layer_struct_para_init(tli_layer_parameter_struct *layer_struct);
 
void tli_layer_init(uint32_t layerx, tli_layer_parameter_struct *layer_struct);
 
void tli_layer_window_offset_modify(uint32_t layerx, uint16_t offset_x, uint16_t offset_y);

 
void tli_lut_struct_para_init(tli_layer_lut_parameter_struct *lut_struct);
 
void tli_lut_init(uint32_t layerx, tli_layer_lut_parameter_struct *lut_struct);
 
void tli_color_key_init(uint32_t layerx, uint8_t redkey, uint8_t greenkey, uint8_t bluekey);
 
void tli_layer_enable(uint32_t layerx);
 
void tli_layer_disable(uint32_t layerx);
 
void tli_color_key_enable(uint32_t layerx);
 
void tli_color_key_disable(uint32_t layerx);
 
void tli_lut_enable(uint32_t layerx);
 
void tli_lut_disable(uint32_t layerx);

 
void tli_line_mark_set(uint16_t line_num);
 
uint32_t tli_current_pos_get(void);

 
 
void tli_interrupt_enable(uint32_t int_flag);
 
void tli_interrupt_disable(uint32_t int_flag);
 
FlagStatus tli_interrupt_flag_get(uint32_t int_flag);
 
void tli_interrupt_flag_clear(uint32_t int_flag);
 
FlagStatus tli_flag_get(uint32_t flag);

#line 71 "..\\User\\gd32f4xx_libopt.h"







#line 364 "..\\Driver\\Start\\CMSIS\\GD\\GD32F4xx\\Include\\gd32f4xx.h"


#line 6 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 7 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 8 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 1 "..\\User\\systick.h"





 


























 




#line 39 "..\\User\\systick.h"

 
void systick_config(void);
 
void delay_1ms(uint32_t count);
 
void delay_decrement(void);

uint32_t GetTick(void);

#line 9 "..\\Driver\\HeaderFiles\\HeaderFiles.h"


#line 1 "..\\Driver\\HardWare\\ROM\\ROM.h"



#line 5 "..\\Driver\\HardWare\\ROM\\ROM.h"
#line 6 "..\\Driver\\HardWare\\ROM\\ROM.h"

#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"
 






 





#line 25 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"



#line 8 "..\\Driver\\HardWare\\ROM\\ROM.h"
#line 9 "..\\Driver\\HardWare\\ROM\\ROM.h"






void ROM_page_erase(uint32_t addr);
void ROM_sector_erase(uint32_t addr);
void ROM_halfword_write(uint32_t addr , uint16_t data);
void ROM_word_write(uint32_t addr , uint32_t data);
void ROM_str_write(uint32_t addr , uint16_t* data , uint16_t len);
_Bool ROM_erase_range(uint32_t start_addr, uint32_t size);
_Bool ROM_buffer_write(uint32_t addr, const uint8_t *data, uint32_t len);
uint16_t ROM_halfword_read(uint32_t addr);
uint8_t ROM_char_read(uint32_t addr);
uint32_t ROM_word_read(uint32_t addr);



 
#line 12 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"
 
 
 
 





 






 








#line 35 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"






#line 49 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"

 
#line 59 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"

 
 









 
#line 81 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"





#line 133 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"

extern __declspec(__nothrow) __attribute__((const)) unsigned char **__rt_ctype_table(void);







    extern int (isalnum)(int  );

     





    extern int (isalpha)(int  );

     





    extern int (iscntrl)(int  );

     
     

 




    extern int (isdigit)(int  );

     

    extern int (isblank)(int  );
     
     
     





    extern int (isgraph)(int  );

     





    extern int (islower)(int  );

     





    extern int (isprint)(int  );

     
     





    extern int (ispunct)(int  );

     





    extern int (isspace)(int  );

     





    extern int (isupper)(int  );

     

 
 

static inline int __isxdigit_helper(int __t) { return (__t ^ (__t << 2)); }




    extern int (isxdigit)(int  );

     



extern int tolower(int  );
     
     

extern int toupper(int  );
     
     







#line 272 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\ctype.h"



 

#line 13 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"
 






 

 
 
 





 





#line 34 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"




  typedef signed int ptrdiff_t;



  



    typedef unsigned int size_t;    
#line 57 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"



   



      typedef unsigned short wchar_t;  
#line 82 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"



    




   




  typedef long double max_align_t;









#line 114 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stddef.h"



 

#line 14 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
 
 
 





 






 







 




  
 








#line 47 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


  



    typedef unsigned int size_t;    









 
 

 



    typedef struct __va_list __va_list;






   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

#line 136 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 166 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int __ARM_snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));


#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int __ARM_vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int __ARM_vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int asprintf(char **  , const char * __restrict  , ...) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) int vasprintf(char **  , const char * __restrict  , __va_list  ) __attribute__((__nonnull__(2)));

#pragma __printf_args
extern __declspec(__nothrow) int __ARM_asprintf(char **  , const char * __restrict  , ...) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) int __ARM_vasprintf(char **  , const char * __restrict  , __va_list  ) __attribute__((__nonnull__(2)));
   








 

extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 1021 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"



 

#line 15 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 16 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 17 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
 
 
 
 




 








 












#line 38 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\string.h"


  



    typedef unsigned int size_t;    
#line 54 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\string.h"




extern __declspec(__nothrow) void *memcpy(void * __restrict  ,
                    const void * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) void *memmove(void *  ,
                    const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   







 
extern __declspec(__nothrow) char *strcpy(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncpy(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 

extern __declspec(__nothrow) char *strcat(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncat(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 






 

extern __declspec(__nothrow) int memcmp(const void *  , const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strcmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int strncmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcasecmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strncasecmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcoll(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   







 

extern __declspec(__nothrow) size_t strxfrm(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   













 


#line 193 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 209 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 232 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 247 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 270 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strstr(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   





 

extern __declspec(__nothrow) char *strtok(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) char *_strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

extern __declspec(__nothrow) char *strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

   

































 

extern __declspec(__nothrow) void *memset(void *  , int  , size_t  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) char *strerror(int  );
   





 
extern __declspec(__nothrow) size_t strlen(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) size_t strlcpy(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   
















 

extern __declspec(__nothrow) size_t strlcat(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






















 

extern __declspec(__nothrow) void _membitcpybl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpybb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
    














































 







#line 502 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\string.h"



 

#line 18 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"




 





 












 






   









 






#line 61 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"

#line 75 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"







   




 















 
#line 112 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"











 





extern __attribute__((__pcs__("aapcs"))) unsigned __ARM_dcmp4(double  , double  );
extern __attribute__((__pcs__("aapcs"))) unsigned __ARM_fcmp4(float  , float  );
    




 

extern __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_fpclassifyf(float  );
extern __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_fpclassify(double  );
     
     

static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isfinitef(float __x)
{
    return (((*(unsigned *)&(__x)) >> 23) & 0xff) != 0xff;
}
static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isfinite(double __x)
{
    return (((*(1 + (unsigned *)&(__x))) >> 20) & 0x7ff) != 0x7ff;
}
     
     

static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isinff(float __x)
{
    return ((*(unsigned *)&(__x)) << 1) == 0xff000000;
}
static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isinf(double __x)
{
    return (((*(1 + (unsigned *)&(__x))) << 1) == 0xffe00000) && ((*(unsigned *)&(__x)) == 0);
}
     
     

static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_islessgreaterf(float __x, float __y)
{
    unsigned __f = __ARM_fcmp4(__x, __y) >> 28;
    return (__f == 8) || (__f == 2);  
}
static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_islessgreater(double __x, double __y)
{
    unsigned __f = __ARM_dcmp4(__x, __y) >> 28;
    return (__f == 8) || (__f == 2);  
}
    


 

static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isnanf(float __x)
{
    return (0x7f800000 - ((*(unsigned *)&(__x)) & 0x7fffffff)) >> 31;
}
static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isnan(double __x)
{
    unsigned __xf = (*(1 + (unsigned *)&(__x))) | (((*(unsigned *)&(__x)) == 0) ? 0 : 1);
    return (0x7ff00000 - (__xf & 0x7fffffff)) >> 31;
}
     
     

static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isnormalf(float __x)
{
    unsigned __xe = ((*(unsigned *)&(__x)) >> 23) & 0xff;
    return (__xe != 0xff) && (__xe != 0);
}
static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_isnormal(double __x)
{
    unsigned __xe = ((*(1 + (unsigned *)&(__x))) >> 20) & 0x7ff;
    return (__xe != 0x7ff) && (__xe != 0);
}
     
     

static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_signbitf(float __x)
{
    return (*(unsigned *)&(__x)) >> 31;
}
static inline __declspec(__nothrow) __attribute__((__pcs__("aapcs"))) int __ARM_signbit(double __x)
{
    return (*(1 + (unsigned *)&(__x))) >> 31;
}
     
     








#line 230 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"







   
  typedef float float_t;
  typedef double double_t;
#line 251 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"



extern const int math_errhandling;
#line 261 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"

extern __declspec(__nothrow) double acos(double  );
    
    
    
extern __declspec(__nothrow) double asin(double  );
    
    
    
    

extern __declspec(__nothrow) __attribute__((const)) double atan(double  );
    
    

extern __declspec(__nothrow) double atan2(double  , double  );
    
    
    
    

extern __declspec(__nothrow) double cos(double  );
    
    
    
    
extern __declspec(__nothrow) double sin(double  );
    
    
    
    

extern void __use_accurate_range_reduction(void);
    
    

extern __declspec(__nothrow) double tan(double  );
    
    
    
    

extern __declspec(__nothrow) double cosh(double  );
    
    
    
    
extern __declspec(__nothrow) double sinh(double  );
    
    
    
    
    

extern __declspec(__nothrow) __attribute__((const)) double tanh(double  );
    
    

extern __declspec(__nothrow) double exp(double  );
    
    
    
    
    

extern __declspec(__nothrow) double frexp(double  , int *  ) __attribute__((__nonnull__(2)));
    
    
    
    
    
    

extern __declspec(__nothrow) double ldexp(double  , int  );
    
    
    
    
extern __declspec(__nothrow) double log(double  );
    
    
    
    
    
extern __declspec(__nothrow) double log10(double  );
    
    
    
extern __declspec(__nothrow) double modf(double  , double *  ) __attribute__((__nonnull__(2)));
    
    
    
    

extern __declspec(__nothrow) double pow(double  , double  );
    
    
    
    
    
    
extern __declspec(__nothrow) double sqrt(double  );
    
    
    




    inline double _sqrt(double __x) { return sqrt(__x); }


    inline float _sqrtf(float __x) { return __sqrtf(__x); }



    



 

extern __declspec(__nothrow) __attribute__((const)) double ceil(double  );
    
    
extern __declspec(__nothrow) __attribute__((const)) double fabs(double  );
    
    

extern __declspec(__nothrow) __attribute__((const)) double floor(double  );
    
    

extern __declspec(__nothrow) double fmod(double  , double  );
    
    
    
    
    

    









 



extern __declspec(__nothrow) double acosh(double  );
    

 
extern __declspec(__nothrow) double asinh(double  );
    

 
extern __declspec(__nothrow) double atanh(double  );
    

 
extern __declspec(__nothrow) double cbrt(double  );
    

 
inline __declspec(__nothrow) __attribute__((const)) double copysign(double __x, double __y)
    

 
{
    (*(1 + (unsigned *)&(__x))) = ((*(1 + (unsigned *)&(__x))) & 0x7fffffff) | ((*(1 + (unsigned *)&(__y))) & 0x80000000);
    return __x;
}
inline __declspec(__nothrow) __attribute__((const)) float copysignf(float __x, float __y)
    

 
{
    (*(unsigned *)&(__x)) = ((*(unsigned *)&(__x)) & 0x7fffffff) | ((*(unsigned *)&(__y)) & 0x80000000);
    return __x;
}
extern __declspec(__nothrow) double erf(double  );
    

 
extern __declspec(__nothrow) double erfc(double  );
    

 
extern __declspec(__nothrow) double expm1(double  );
    

 



    

 






#line 479 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"


extern __declspec(__nothrow) double hypot(double  , double  );
    




 
extern __declspec(__nothrow) int ilogb(double  );
    

 
extern __declspec(__nothrow) int ilogbf(float  );
    

 
extern __declspec(__nothrow) int ilogbl(long double  );
    

 







    

 





    



 





    



 





    

 





    



 





    



 





    



 





    

 





    

 





    


 

extern __declspec(__nothrow) double lgamma (double  );
    


 
extern __declspec(__nothrow) double log1p(double  );
    

 
extern __declspec(__nothrow) double logb(double  );
    

 
extern __declspec(__nothrow) float logbf(float  );
    

 
extern __declspec(__nothrow) long double logbl(long double  );
    

 
extern __declspec(__nothrow) double nextafter(double  , double  );
    


 
extern __declspec(__nothrow) float nextafterf(float  , float  );
    


 
extern __declspec(__nothrow) long double nextafterl(long double  , long double  );
    


 
extern __declspec(__nothrow) double nexttoward(double  , long double  );
    


 
extern __declspec(__nothrow) float nexttowardf(float  , long double  );
    


 
extern __declspec(__nothrow) long double nexttowardl(long double  , long double  );
    


 
extern __declspec(__nothrow) double remainder(double  , double  );
    

 
extern __declspec(__nothrow) __attribute__((const)) double rint(double  );
    

 
extern __declspec(__nothrow) double scalbln(double  , long int  );
    

 
extern __declspec(__nothrow) float scalblnf(float  , long int  );
    

 
extern __declspec(__nothrow) long double scalblnl(long double  , long int  );
    

 
extern __declspec(__nothrow) double scalbn(double  , int  );
    

 
extern __declspec(__nothrow) float scalbnf(float  , int  );
    

 
extern __declspec(__nothrow) long double scalbnl(long double  , int  );
    

 




    

 



 
extern __declspec(__nothrow) __attribute__((const)) float _fabsf(float);  
inline __declspec(__nothrow) __attribute__((const)) float fabsf(float __f) { return _fabsf(__f); }
extern __declspec(__nothrow) float sinf(float  );
extern __declspec(__nothrow) float cosf(float  );
extern __declspec(__nothrow) float tanf(float  );
extern __declspec(__nothrow) float acosf(float  );
extern __declspec(__nothrow) float asinf(float  );
extern __declspec(__nothrow) float atanf(float  );
extern __declspec(__nothrow) float atan2f(float  , float  );
extern __declspec(__nothrow) float sinhf(float  );
extern __declspec(__nothrow) float coshf(float  );
extern __declspec(__nothrow) float tanhf(float  );
extern __declspec(__nothrow) float expf(float  );
extern __declspec(__nothrow) float logf(float  );
extern __declspec(__nothrow) float log10f(float  );
extern __declspec(__nothrow) float powf(float  , float  );
extern __declspec(__nothrow) float sqrtf(float  );
extern __declspec(__nothrow) float ldexpf(float  , int  );
extern __declspec(__nothrow) float frexpf(float  , int *  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) __attribute__((const)) float ceilf(float  );
extern __declspec(__nothrow) __attribute__((const)) float floorf(float  );
extern __declspec(__nothrow) float fmodf(float  , float  );
extern __declspec(__nothrow) float modff(float  , float *  ) __attribute__((__nonnull__(2)));

 
 













 
__declspec(__nothrow) long double acosl(long double );
__declspec(__nothrow) long double asinl(long double );
__declspec(__nothrow) long double atanl(long double );
__declspec(__nothrow) long double atan2l(long double , long double );
__declspec(__nothrow) long double ceill(long double );
__declspec(__nothrow) long double cosl(long double );
__declspec(__nothrow) long double coshl(long double );
__declspec(__nothrow) long double expl(long double );
__declspec(__nothrow) long double fabsl(long double );
__declspec(__nothrow) long double floorl(long double );
__declspec(__nothrow) long double fmodl(long double , long double );
__declspec(__nothrow) long double frexpl(long double , int* ) __attribute__((__nonnull__(2)));
__declspec(__nothrow) long double ldexpl(long double , int );
__declspec(__nothrow) long double logl(long double );
__declspec(__nothrow) long double log10l(long double );
__declspec(__nothrow) long double modfl(long double  , long double *  ) __attribute__((__nonnull__(2)));
__declspec(__nothrow) long double powl(long double , long double );
__declspec(__nothrow) long double sinl(long double );
__declspec(__nothrow) long double sinhl(long double );
__declspec(__nothrow) long double sqrtl(long double );
__declspec(__nothrow) long double tanl(long double );
__declspec(__nothrow) long double tanhl(long double );





 
extern __declspec(__nothrow) float acoshf(float  );
__declspec(__nothrow) long double acoshl(long double );
extern __declspec(__nothrow) float asinhf(float  );
__declspec(__nothrow) long double asinhl(long double );
extern __declspec(__nothrow) float atanhf(float  );
__declspec(__nothrow) long double atanhl(long double );
__declspec(__nothrow) long double copysignl(long double , long double );
extern __declspec(__nothrow) float cbrtf(float  );
__declspec(__nothrow) long double cbrtl(long double );
extern __declspec(__nothrow) float erff(float  );
__declspec(__nothrow) long double erfl(long double );
extern __declspec(__nothrow) float erfcf(float  );
__declspec(__nothrow) long double erfcl(long double );
extern __declspec(__nothrow) float expm1f(float  );
__declspec(__nothrow) long double expm1l(long double );
extern __declspec(__nothrow) float log1pf(float  );
__declspec(__nothrow) long double log1pl(long double );
extern __declspec(__nothrow) float hypotf(float  , float  );
__declspec(__nothrow) long double hypotl(long double , long double );
extern __declspec(__nothrow) float lgammaf(float  );
__declspec(__nothrow) long double lgammal(long double );
extern __declspec(__nothrow) float remainderf(float  , float  );
__declspec(__nothrow) long double remainderl(long double , long double );
extern __declspec(__nothrow) float rintf(float  );
__declspec(__nothrow) long double rintl(long double );






 
extern __declspec(__nothrow) double exp2(double  );  
extern __declspec(__nothrow) float exp2f(float  );
__declspec(__nothrow) long double exp2l(long double );
extern __declspec(__nothrow) double fdim(double  , double  );
extern __declspec(__nothrow) float fdimf(float  , float  );
__declspec(__nothrow) long double fdiml(long double , long double );
#line 803 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"
extern __declspec(__nothrow) double fma(double  , double  , double  );
extern __declspec(__nothrow) float fmaf(float  , float  , float  );

inline __declspec(__nothrow) long double fmal(long double __x, long double __y, long double __z)     { return (long double)fma((double)__x, (double)__y, (double)__z); }


extern __declspec(__nothrow) __attribute__((const)) double fmax(double  , double  );
extern __declspec(__nothrow) __attribute__((const)) float fmaxf(float  , float  );
__declspec(__nothrow) long double fmaxl(long double , long double );
extern __declspec(__nothrow) __attribute__((const)) double fmin(double  , double  );
extern __declspec(__nothrow) __attribute__((const)) float fminf(float  , float  );
__declspec(__nothrow) long double fminl(long double , long double );
extern __declspec(__nothrow) double log2(double  );  
extern __declspec(__nothrow) float log2f(float  );
__declspec(__nothrow) long double log2l(long double );
extern __declspec(__nothrow) long lrint(double  );
extern __declspec(__nothrow) long lrintf(float  );

inline __declspec(__nothrow) long lrintl(long double __x)     { return lrint((double)__x); }


extern __declspec(__nothrow) long long llrint(double  );
extern __declspec(__nothrow) long long llrintf(float  );

inline __declspec(__nothrow) long long llrintl(long double __x)     { return llrint((double)__x); }


extern __declspec(__nothrow) long lround(double  );
extern __declspec(__nothrow) long lroundf(float  );

inline __declspec(__nothrow) long lroundl(long double __x)     { return lround((double)__x); }


extern __declspec(__nothrow) long long llround(double  );
extern __declspec(__nothrow) long long llroundf(float  );

inline __declspec(__nothrow) long long llroundl(long double __x)     { return llround((double)__x); }


extern __declspec(__nothrow) __attribute__((const)) double nan(const char * );
extern __declspec(__nothrow) __attribute__((const)) float nanf(const char * );

inline __declspec(__nothrow) __attribute__((const)) long double nanl(const char *__t)     { return (long double)nan(__t); }
#line 856 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"
extern __declspec(__nothrow) __attribute__((const)) double nearbyint(double  );
extern __declspec(__nothrow) __attribute__((const)) float nearbyintf(float  );
__declspec(__nothrow) long double nearbyintl(long double );
extern  double remquo(double  , double  , int * );
extern  float remquof(float  , float  , int * );

inline long double remquol(long double __x, long double __y, int *__q)     { return (long double)remquo((double)__x, (double)__y, __q); }


extern __declspec(__nothrow) __attribute__((const)) double round(double  );
extern __declspec(__nothrow) __attribute__((const)) float roundf(float  );
__declspec(__nothrow) long double roundl(long double );
extern __declspec(__nothrow) double tgamma(double  );  
extern __declspec(__nothrow) float tgammaf(float  );
__declspec(__nothrow) long double tgammal(long double );
extern __declspec(__nothrow) __attribute__((const)) double trunc(double  );
extern __declspec(__nothrow) __attribute__((const)) float truncf(float  );
__declspec(__nothrow) long double truncl(long double );






#line 896 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"

#line 1087 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"











#line 1317 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\math.h"





 
#line 19 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"
 
 
 





 










#line 27 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"








 

 
 
#line 57 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"
    typedef struct __va_list { void *__ap; } va_list;

   






 


   










 


   















 




   

 


   




 



   





 







#line 138 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"



#line 147 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdarg.h"

 

#line 20 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
   

#line 1 "..\\Driver\\HardWare\\OLED\\OLED.h"



 

#line 1 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 32 "..\\Driver\\HeaderFiles\\HeaderFiles.h"


#line 7 "..\\Driver\\HardWare\\OLED\\OLED.h"







 




 










void OLED_ClearPoint(unsigned char x,unsigned char y);
void OLED_ColorTurn(unsigned char i);
void OLED_DisplayTurn(unsigned char i);
void I2C_Start(void);
void I2C_Stop(void);
void I2C_WaitAck(void);
void Send_Byte(unsigned char dat);
void OLED_WR_Byte(unsigned char dat,unsigned char mode);
void OLED_DisPlay_On(void);
void OLED_DisPlay_Off(void);
void OLED_Refresh(void);
void OLED_Clear(void);
void OLED_DrawPoint(unsigned char x,unsigned char y);
void OLED_DrawLine(unsigned char x1,unsigned char y1,unsigned char x2,unsigned char y2);
void OLED_DrawCircle(unsigned char x,unsigned char y,unsigned char r);
void OLED_ShowChar(unsigned char x,unsigned char y,unsigned char chr,unsigned char size1);
void OLED_ShowString(unsigned char x,unsigned char y,unsigned char *chr,unsigned char size1);
void OLED_ShowNum(unsigned char x,unsigned char y,unsigned int num,unsigned char len,unsigned char size1);
void OLED_ShowChinese(unsigned char x,unsigned char y,unsigned char num,unsigned char size1);
void OLED_ScrollDisplay(unsigned char num,unsigned char space);
void OLED_WR_BP(unsigned char x,unsigned char y);
void OLED_ShowPicture(unsigned char x0,unsigned char y0,unsigned char x1,unsigned char y1,unsigned char BMP[]);

void OLED_Init(void);
void OLED_ShowFloatNum(int16_t X, int16_t Y, double Number, uint8_t IntLength, uint8_t FraLength, uint8_t FontSize);
void OLED_Printf(int16_t X, int16_t Y, uint8_t FontSize, char *format, ...);



 

#line 23 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 1 "..\\Driver\\HardWare\\USART\\USART.h"



 

#line 7 "..\\Driver\\HardWare\\USART\\USART.h"
#line 8 "..\\Driver\\HardWare\\USART\\USART.h"

 













 
extern volatile uint8_t data_recv;                 
extern uint8_t usart1_rx_buf[128]; 
extern volatile uint16_t usart1_rx_len;            
extern volatile uint8_t usart1_rx_flag;             

 
int rs485_printf(const char *fmt, ...);
void USART1_Init(void);

void USART1_ClearRxBuf(void);

void USART1_SendData(uint16_t *buf, uint16_t len);




 
#line 24 "..\\Driver\\HeaderFiles\\HeaderFiles.h"
#line 1 "..\\Driver\\HardWare\\SPI_FLASH\\SPI_FLASH.h"



#line 5 "..\\Driver\\HardWare\\SPI_FLASH\\SPI_FLASH.h"
 

 
 
void spi_flash_init(void);
 
void spi_flash_sector_erase(uint32_t sector_addr);
 
void spi_flash_bulk_erase(void);
 
void spi_flash_page_write(uint8_t *pbuffer, uint32_t write_addr, uint16_t num_byte_to_write);
 
void spi_flash_buffer_write(uint8_t *pbuffer, uint32_t write_addr, uint32_t num_byte_to_write);
 
void spi_flash_buffer_read(uint8_t *pbuffer, uint32_t read_addr, uint16_t num_byte_to_read);
 
uint32_t spi_flash_read_id(void);
 
void spi_flash_start_read_sequence(uint32_t read_addr);
 
uint8_t spi_flash_read_byte(void);
 
uint8_t spi_flash_send_byte(uint8_t byte);
 
uint16_t spi_flash_send_halfword(uint16_t half_word);
 
void spi_flash_write_enable(void);
 
void spi_flash_wait_for_write_end(void);
void spi_flash_buffer_erase(uint32_t sector_addr, uint32_t num_byte_to_erase);



#line 25 "..\\Driver\\HeaderFiles\\HeaderFiles.h"


#line 1 "..\\Driver\\System\\myDMA.h"



#line 5 "..\\Driver\\System\\myDMA.h"
#line 6 "..\\Driver\\System\\myDMA.h"



extern uint8_t usart1_rx_buffer[1152U];
extern uint8_t usart1_tx_buffer[256];
extern uint16_t adc_value[2];


void mydma_init_buffers(void);

void dma_usart_tx_config(uint32_t dma_periph, dma_channel_enum channelx, uint32_t par, uint32_t mar);
void dma_usart1_rx_config(void);
void dma_enable(uint32_t dma_periph, dma_channel_enum channelx, uint16_t ndtr);

void DMA_ADC_Init(void);
void DMA_ADJ_Init(void);
void USART1_DMA_All_Init(void);

uint16_t get_usart1_rx_len(void);
void reset_usart1_rx_dma(void);

#line 28 "..\\Driver\\HeaderFiles\\HeaderFiles.h"






#line 2 "..\\User\\main.c"
#line 1 "..\\Function\\function.h"




void boot_entry_init(void);  
void boot_entry_loop(void);  

#line 3 "..\\User\\main.c"


volatile uint32_t sys_tick = 0;

void SysTick_Handler(void)
{
    sys_tick++;
}

uint32_t GetTick(void)
{
    return sys_tick;
}

int main(void)
{
    boot_entry_init();
    boot_entry_loop();

}
