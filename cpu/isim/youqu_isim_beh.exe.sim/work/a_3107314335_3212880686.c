/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Junior/ComputerOrganization/CPU/jiyuan/cpu/ReadReg2Mux.vhd";
extern char *IEEE_P_2592010699;



static void work_a_3107314335_3212880686_p_0(char *t0)
{
    char t6[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB5, &&LAB5, &&LAB3, &&LAB4, &&LAB5, &&LAB5, &&LAB5, &&LAB5, &&LAB5};

LAB0:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t3);
    goto **((char **)t1);

LAB2:    t1 = (t0 + 2992);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(51, ng0);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t7 = ((IEEE_P_2592010699) + 4024);
    t8 = (t0 + 4804U);
    t4 = xsi_base_array_concat(t4, t6, t7, (char)99, (unsigned char)2, (char)97, t5, t8, (char)101);
    t9 = (1U + 3U);
    t10 = (4U != t9);
    if (t10 == 1)
        goto LAB6;

LAB7:    t11 = (t0 + 3072);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 4U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB2;

LAB4:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t4 = ((IEEE_P_2592010699) + 4024);
    t5 = (t0 + 4820U);
    t1 = xsi_base_array_concat(t1, t6, t4, (char)99, (unsigned char)2, (char)97, t2, t5, (char)101);
    t9 = (1U + 3U);
    t3 = (4U != t9);
    if (t3 == 1)
        goto LAB8;

LAB9:    t7 = (t0 + 3072);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 4U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB2;

LAB5:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 4867);
    t4 = (t0 + 3072);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    memcpy(t11, t1, 4U);
    xsi_driver_first_trans_fast_port(t4);
    goto LAB2;

LAB6:    xsi_size_not_matching(4U, t9, 0);
    goto LAB7;

LAB8:    xsi_size_not_matching(4U, t9, 0);
    goto LAB9;

}


extern void work_a_3107314335_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3107314335_3212880686_p_0};
	xsi_register_didat("work_a_3107314335_3212880686", "isim/youqu_isim_beh.exe.sim/work/a_3107314335_3212880686.didat");
	xsi_register_executes(pe);
}
