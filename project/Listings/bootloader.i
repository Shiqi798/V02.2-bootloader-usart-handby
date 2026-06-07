#line 1 "..\\sysFunction\\bootloader.c"
#line 1 "..\\sysFunction\\bootloader.h"



#line 1 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"
 






 





#line 25 "D:\\AsusMCenterDownload\\keil5 MDK\\core\\ARM\\ARMCC\\Bin\\..\\include\\stdbool.h"



#line 5 "..\\sysFunction\\bootloader.h"
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






 
#line 6 "..\\sysFunction\\bootloader.h"

#line 16 "..\\sysFunction\\bootloader.h"













typedef struct {
    uint32_t magic;
    uint16_t device_id;
    uint8_t baud_code;
    uint8_t boot_flag;
    uint32_t checksum;
} boot_param_t;

typedef enum {
    BOOT_STATUS_OK = 0U,
    BOOT_STATUS_TIMEOUT,
    BOOT_STATUS_ERROR,
    BOOT_STATUS_CRC,
    BOOT_STATUS_FLASH,
    BOOT_STATUS_RANGE
} boot_status_t;

typedef struct {
    char name[32];
    uint32_t size;
    uint32_t crc32;
} boot_image_info_t;

uint32_t GetTick(void);

void bootloader_init(void);
_Bool bootloader_update_requested(void);
_Bool bootloader_boot_default(void);
void bootloader_console(void);

#line 2 "..\\sysFunction\\bootloader.c"
#line 1 "..\\Function\\boot_flow.h"



#line 5 "..\\Function\\boot_flow.h"

void boot_flow_init(void);
_Bool boot_flow_update_requested(void);
_Bool boot_flow_boot_default(void);
void boot_flow_console(void);

#line 3 "..\\sysFunction\\bootloader.c"

void bootloader_init(void)
{
    boot_flow_init();
}

_Bool bootloader_update_requested(void)
{
    return boot_flow_update_requested();
}

_Bool bootloader_boot_default(void)
{
    return boot_flow_boot_default();
}

void bootloader_console(void)
{
    
    boot_flow_console();
}
