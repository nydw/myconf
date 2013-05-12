#if 1
/*
 * =====================================================================================
 *    Description:  print debug info to /tmp/lgx_file
 * =====================================================================================
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define INFO_MAX 512

int debug_to_file(char *buf)
{

    char info[INFO_MAX]={ 0 };

    FILE *fp = fopen("/tmp/lgx_debug_file.txt", "a+");
    if(fp == NULL) return -1;

    snprintf(info, 512, "%s\n", buf);
    fwrite(info, strlen(info), 1, fp);

    fclose(fp);      
    return 0;
}


#endif
