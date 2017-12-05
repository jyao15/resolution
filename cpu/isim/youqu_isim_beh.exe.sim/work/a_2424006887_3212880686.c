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
static const char *ng0 = "D:/Junior/ComputerOrganization/CPU/jiyuan/cpu/PCMux.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2424006887_3212880686_p_0(char *t0)
{
    char t9[16];
    char t24[16];
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned char t23;
    int t25;
    unsigned char t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB12;

LAB13:    t1 = (unsigned char)0;

LAB14:    if (t1 != 0)
        goto LAB10;

LAB11:    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)2);
    if (t5 == 1)
        goto LAB17;

LAB18:    t1 = (unsigned char)0;

LAB19:    if (t1 != 0)
        goto LAB15;

LAB16:
LAB3:    t2 = (t0 + 3472);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1192U);
    t10 = *((char **)t2);
    t2 = (t0 + 5496U);
    t11 = (t0 + 1032U);
    t12 = *((char **)t11);
    t11 = (t0 + 5480U);
    t13 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t9, t10, t2, t12, t11);
    t14 = (t9 + 12U);
    t15 = *((unsigned int *)t14);
    t16 = (1U * t15);
    t17 = (16U != t16);
    if (t17 == 1)
        goto LAB8;

LAB9:    t18 = (t0 + 3552);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t13, 16U);
    xsi_driver_first_trans_fast_port(t18);
    goto LAB3;

LAB5:    t2 = (t0 + 1512U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB7;

LAB8:    xsi_size_not_matching(16U, t16, 0);
    goto LAB9;

LAB10:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1352U);
    t10 = *((char **)t2);
    t2 = (t0 + 3552);
    t11 = (t2 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t10, 16U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB3;

LAB12:    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB14;

LAB15:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1832U);
    t10 = *((char **)t2);
    t17 = *((unsigned char *)t10);
    t23 = (t17 == (unsigned char)3);
    if (t23 != 0)
        goto LAB20;

LAB22:    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t4 = (t1 == (unsigned char)2);
    if (t4 != 0)
        goto LAB25;

LAB26:
LAB21:    goto LAB3;

LAB17:    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t7 = *((unsigned char *)t6);
    t8 = (t7 == (unsigned char)2);
    t1 = t8;
    goto LAB19;

LAB20:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1032U);
    t11 = *((char **)t2);
    t2 = (t0 + 5480U);
    t12 = (t0 + 5603);
    t14 = (t24 + 0U);
    t18 = (t14 + 0U);
    *((int *)t18) = 0;
    t18 = (t14 + 4U);
    *((int *)t18) = 15;
    t18 = (t14 + 8U);
    *((int *)t18) = 1;
    t25 = (15 - 0);
    t15 = (t25 * 1);
    t15 = (t15 + 1);
    t18 = (t14 + 12U);
    *((unsigned int *)t18) = t15;
    t18 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t9, t11, t2, t12, t24);
    t19 = (t9 + 12U);
    t15 = *((unsigned int *)t19);
    t16 = (1U * t15);
    t26 = (16U != t16);
    if (t26 == 1)
        goto LAB23;

LAB24:    t20 = (t0 + 3552);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t27 = (t22 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t18, 16U);
    xsi_driver_first_trans_fast_port(t20);
    goto LAB21;

LAB23:    xsi_size_not_matching(16U, t16, 0);
    goto LAB24;

LAB25:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 1032U);
    t6 = *((char **)t2);
    t2 = (t0 + 3552);
    t10 = (t2 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t6, 16U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB21;

}


extern void work_a_2424006887_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2424006887_3212880686_p_0};
	xsi_register_didat("work_a_2424006887_3212880686", "isim/youqu_isim_beh.exe.sim/work/a_2424006887_3212880686.didat");
	xsi_register_executes(pe);
}
