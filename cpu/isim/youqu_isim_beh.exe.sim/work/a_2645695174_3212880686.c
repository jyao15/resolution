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
static const char *ng0 = "D:/Junior/ComputerOrganization/CPU/jiyuan/cpu/StructConflictUnit.vhd";
extern char *IEEE_P_2592010699;



static void work_a_2645695174_3212880686_p_0(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(49, ng0);
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(55, ng0);
    t3 = (t0 + 3232);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(56, ng0);
    t3 = (t0 + 3296);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(57, ng0);
    t3 = (t0 + 3360);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t3);

LAB3:    t3 = (t0 + 3152);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(51, ng0);
    t16 = (t0 + 3232);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t16);
    xsi_set_current_line(52, ng0);
    t3 = (t0 + 3296);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(53, ng0);
    t3 = (t0 + 3360);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t3);
    goto LAB3;

LAB5:    t11 = (t0 + 1192U);
    t12 = *((char **)t11);
    t11 = (t0 + 5321);
    t14 = ((IEEE_P_2592010699) + 4024);
    t15 = xsi_vhdl_greaterEqual(t14, t12, 16U, t11, 16U);
    t1 = t15;
    goto LAB7;

LAB8:    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t3 = (t0 + 5305);
    t9 = ((IEEE_P_2592010699) + 4024);
    t10 = xsi_vhdl_lessthanEqual(t9, t7, 16U, t3, 16U);
    t2 = t10;
    goto LAB10;

}


extern void work_a_2645695174_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2645695174_3212880686_p_0};
	xsi_register_didat("work_a_2645695174_3212880686", "isim/youqu_isim_beh.exe.sim/work/a_2645695174_3212880686.didat");
	xsi_register_executes(pe);
}
