#ifndef __FUNCTION_H
#define __FUNCTION_H

#include "HeaderFiles.h"

extern uint8_t sampling_flag;
extern uint8_t overlimit_flag;
extern uint8_t hide_flag;

void sysFunction_Init(void);
void sysFunction_loop(void);
// void app_update_commit_after_self_check(void);

#endif
