#line 1 "..\\Protocol\\boot_crc.c"
#line 1 "..\\Protocol\\boot_crc.h"



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






 
#line 5 "..\\Protocol\\boot_crc.h"

uint32_t boot_crc32_step(uint32_t crc, const uint8_t *data, uint32_t len);
uint32_t boot_crc32_buffer(const uint8_t *data, uint32_t len);
uint32_t boot_crc32_flash(uint32_t addr, uint32_t len);
uint16_t boot_crc16_ccitt(const uint8_t *data, uint32_t len);
uint16_t boot_crc16_modbus(const uint8_t *data, uint32_t len);

#line 2 "..\\Protocol\\boot_crc.c"

uint32_t boot_crc32_step(uint32_t crc, const uint8_t *data, uint32_t len)
{
    for (uint32_t i = 0U; i < len; i++) {
        crc ^= data[i];
        for (uint32_t j = 0U; j < 8U; j++) {
            crc = (crc & 1U) ? ((crc >> 1U) ^ 0xEDB88320U) : (crc >> 1U);
        }
    }

    return crc;
}

uint32_t boot_crc32_buffer(const uint8_t *data, uint32_t len)
{
    return boot_crc32_step(0xFFFFFFFFU, data, len) ^ 0xFFFFFFFFU;
}

uint32_t boot_crc32_flash(uint32_t addr, uint32_t len)
{
    return boot_crc32_buffer((const uint8_t *)addr, len);
}

uint16_t boot_crc16_ccitt(const uint8_t *data, uint32_t len)
{
    uint16_t crc = 0U;

    for (uint32_t i = 0U; i < len; i++) {
        crc ^= (uint16_t)data[i] << 8;
        for (uint32_t j = 0U; j < 8U; j++) {
            crc = (crc & 0x8000U) ? (uint16_t)((crc << 1U) ^ 0x1021U) : (uint16_t)(crc << 1U);
        }
    }

    return crc;
}

uint16_t boot_crc16_modbus(const uint8_t *data, uint32_t len)
{
    uint16_t crc = 0xFFFFU;

    for (uint32_t i = 0U; i < len; i++) {
        crc ^= data[i];
        for (uint32_t j = 0U; j < 8U; j++) {
            crc = (crc & 1U) ? (uint16_t)((crc >> 1U) ^ 0xA001U) : (uint16_t)(crc >> 1U);
        }
    }

    return crc;
}
