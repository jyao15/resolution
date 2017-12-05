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
static const char *ng0 = "D:/Junior/ComputerOrganization/CPU/jiyuan/cpu/ImmeExtendUnit.vhd";
extern char *IEEE_P_2592010699;



static void work_a_2393008886_3212880686_p_0(char *t0)
{
    char t33[16];
    char t35[16];
    char t39[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    char *t18;
    int t19;
    char *t20;
    char *t21;
    int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned char t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t34;
    char *t36;
    char *t37;
    unsigned int t38;
    char *t40;
    int t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5131);
    t4 = xsi_mem_cmp(t1, t2, 3U);
    if (t4 == 1)
        goto LAB3;

LAB10:    t5 = (t0 + 5134);
    t7 = xsi_mem_cmp(t5, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB11:    t8 = (t0 + 5137);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB12:    t11 = (t0 + 5140);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB13:    t14 = (t0 + 5143);
    t16 = xsi_mem_cmp(t14, t2, 3U);
    if (t16 == 1)
        goto LAB7;

LAB14:    t17 = (t0 + 5146);
    t19 = xsi_mem_cmp(t17, t2, 3U);
    if (t19 == 1)
        goto LAB8;

LAB15:
LAB9:
LAB2:    xsi_set_current_line(55, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    t3 = (t0 + 1648U);
    t5 = *((char **)t3);
    t26 = *((unsigned char *)t5);
    memset(t2, t26, 16U);
    t3 = (t0 + 1768U);
    t6 = *((char **)t3);
    t3 = (t6 + 0);
    memcpy(t3, t1, 16U);
    t8 = (t0 + 1712U);
    xsi_variable_act(t8);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5149);
    t4 = xsi_mem_cmp(t1, t2, 3U);
    if (t4 == 1)
        goto LAB18;

LAB25:    t5 = (t0 + 5152);
    t7 = xsi_mem_cmp(t5, t2, 3U);
    if (t7 == 1)
        goto LAB19;

LAB26:    t8 = (t0 + 5155);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB20;

LAB27:    t11 = (t0 + 5158);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB21;

LAB28:    t14 = (t0 + 5161);
    t16 = xsi_mem_cmp(t14, t2, 3U);
    if (t16 == 1)
        goto LAB22;

LAB29:    t17 = (t0 + 5164);
    t19 = xsi_mem_cmp(t17, t2, 3U);
    if (t19 == 1)
        goto LAB23;

LAB30:
LAB24:
LAB17:    t1 = (t0 + 3072);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(47, ng0);
    t20 = (t0 + 1032U);
    t21 = *((char **)t20);
    t22 = (10 - 10);
    t23 = (t22 * -1);
    t24 = (1U * t23);
    t25 = (0 + t24);
    t20 = (t21 + t25);
    t26 = *((unsigned char *)t20);
    t27 = (t0 + 1648U);
    t28 = *((char **)t27);
    t27 = (t28 + 0);
    *((unsigned char *)t27) = t26;
    t29 = (t0 + 1592U);
    xsi_variable_act(t29);
    goto LAB2;

LAB4:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    t3 = (t0 + 1592U);
    xsi_variable_act(t3);
    goto LAB2;

LAB5:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    t3 = (t0 + 1592U);
    xsi_variable_act(t3);
    goto LAB2;

LAB6:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (3 - 10);
    t23 = (t4 * -1);
    t24 = (1U * t23);
    t25 = (0 + t24);
    t1 = (t2 + t25);
    t26 = *((unsigned char *)t1);
    t3 = (t0 + 1648U);
    t5 = *((char **)t3);
    t3 = (t5 + 0);
    *((unsigned char *)t3) = t26;
    t6 = (t0 + 1592U);
    xsi_variable_act(t6);
    goto LAB2;

LAB7:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (4 - 10);
    t23 = (t4 * -1);
    t24 = (1U * t23);
    t25 = (0 + t24);
    t1 = (t2 + t25);
    t26 = *((unsigned char *)t1);
    t3 = (t0 + 1648U);
    t5 = *((char **)t3);
    t3 = (t5 + 0);
    *((unsigned char *)t3) = t26;
    t6 = (t0 + 1592U);
    xsi_variable_act(t6);
    goto LAB2;

LAB8:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (7 - 10);
    t23 = (t4 * -1);
    t24 = (1U * t23);
    t25 = (0 + t24);
    t1 = (t2 + t25);
    t26 = *((unsigned char *)t1);
    t3 = (t0 + 1648U);
    t5 = *((char **)t3);
    t3 = (t5 + 0);
    *((unsigned char *)t3) = t26;
    t6 = (t0 + 1592U);
    xsi_variable_act(t6);
    goto LAB2;

LAB16:;
LAB18:    xsi_set_current_line(59, ng0);
    t20 = (t0 + 1768U);
    t21 = *((char **)t20);
    t23 = (15 - 15);
    t24 = (t23 * 1U);
    t25 = (0 + t24);
    t20 = (t21 + t25);
    t27 = (t0 + 1032U);
    t28 = *((char **)t27);
    t30 = (10 - 10);
    t31 = (t30 * 1U);
    t32 = (0 + t31);
    t27 = (t28 + t32);
    t34 = ((IEEE_P_2592010699) + 4024);
    t36 = (t35 + 0U);
    t37 = (t36 + 0U);
    *((int *)t37) = 15;
    t37 = (t36 + 4U);
    *((int *)t37) = 11;
    t37 = (t36 + 8U);
    *((int *)t37) = -1;
    t22 = (11 - 15);
    t38 = (t22 * -1);
    t38 = (t38 + 1);
    t37 = (t36 + 12U);
    *((unsigned int *)t37) = t38;
    t37 = (t39 + 0U);
    t40 = (t37 + 0U);
    *((int *)t40) = 10;
    t40 = (t37 + 4U);
    *((int *)t40) = 0;
    t40 = (t37 + 8U);
    *((int *)t40) = -1;
    t41 = (0 - 10);
    t38 = (t41 * -1);
    t38 = (t38 + 1);
    t40 = (t37 + 12U);
    *((unsigned int *)t40) = t38;
    t29 = xsi_base_array_concat(t29, t33, t34, (char)97, t20, t35, (char)97, t27, t39, (char)101);
    t38 = (5U + 11U);
    t26 = (16U != t38);
    if (t26 == 1)
        goto LAB32;

LAB33:    t40 = (t0 + 3152);
    t42 = (t40 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memcpy(t45, t29, 16U);
    xsi_driver_first_trans_fast_port(t40);
    goto LAB17;

LAB19:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1768U);
    t2 = *((char **)t1);
    t23 = (15 - 15);
    t24 = (t23 * 1U);
    t25 = (0 + t24);
    t1 = (t2 + t25);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t30 = (10 - 4);
    t31 = (t30 * 1U);
    t32 = (0 + t31);
    t3 = (t5 + t32);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = (t35 + 0U);
    t11 = (t9 + 0U);
    *((int *)t11) = 15;
    t11 = (t9 + 4U);
    *((int *)t11) = 3;
    t11 = (t9 + 8U);
    *((int *)t11) = -1;
    t4 = (3 - 15);
    t38 = (t4 * -1);
    t38 = (t38 + 1);
    t11 = (t9 + 12U);
    *((unsigned int *)t11) = t38;
    t11 = (t39 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 4;
    t12 = (t11 + 4U);
    *((int *)t12) = 2;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t7 = (2 - 4);
    t38 = (t7 * -1);
    t38 = (t38 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t38;
    t6 = xsi_base_array_concat(t6, t33, t8, (char)97, t1, t35, (char)97, t3, t39, (char)101);
    t38 = (13U + 3U);
    t26 = (16U != t38);
    if (t26 == 1)
        goto LAB34;

LAB35:    t12 = (t0 + 3152);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t6, 16U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB17;

LAB20:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 1768U);
    t2 = *((char **)t1);
    t23 = (15 - 15);
    t24 = (t23 * 1U);
    t25 = (0 + t24);
    t1 = (t2 + t25);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t30 = (10 - 7);
    t31 = (t30 * 1U);
    t32 = (0 + t31);
    t3 = (t5 + t32);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = (t35 + 0U);
    t11 = (t9 + 0U);
    *((int *)t11) = 15;
    t11 = (t9 + 4U);
    *((int *)t11) = 8;
    t11 = (t9 + 8U);
    *((int *)t11) = -1;
    t4 = (8 - 15);
    t38 = (t4 * -1);
    t38 = (t38 + 1);
    t11 = (t9 + 12U);
    *((unsigned int *)t11) = t38;
    t11 = (t39 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 7;
    t12 = (t11 + 4U);
    *((int *)t12) = 0;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t7 = (0 - 7);
    t38 = (t7 * -1);
    t38 = (t38 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t38;
    t6 = xsi_base_array_concat(t6, t33, t8, (char)97, t1, t35, (char)97, t3, t39, (char)101);
    t38 = (8U + 8U);
    t26 = (16U != t38);
    if (t26 == 1)
        goto LAB36;

LAB37:    t12 = (t0 + 3152);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t6, 16U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB17;

LAB21:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1768U);
    t2 = *((char **)t1);
    t23 = (15 - 15);
    t24 = (t23 * 1U);
    t25 = (0 + t24);
    t1 = (t2 + t25);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t30 = (10 - 3);
    t31 = (t30 * 1U);
    t32 = (0 + t31);
    t3 = (t5 + t32);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = (t35 + 0U);
    t11 = (t9 + 0U);
    *((int *)t11) = 15;
    t11 = (t9 + 4U);
    *((int *)t11) = 4;
    t11 = (t9 + 8U);
    *((int *)t11) = -1;
    t4 = (4 - 15);
    t38 = (t4 * -1);
    t38 = (t38 + 1);
    t11 = (t9 + 12U);
    *((unsigned int *)t11) = t38;
    t11 = (t39 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 3;
    t12 = (t11 + 4U);
    *((int *)t12) = 0;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t7 = (0 - 3);
    t38 = (t7 * -1);
    t38 = (t38 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t38;
    t6 = xsi_base_array_concat(t6, t33, t8, (char)97, t1, t35, (char)97, t3, t39, (char)101);
    t38 = (12U + 4U);
    t26 = (16U != t38);
    if (t26 == 1)
        goto LAB38;

LAB39:    t12 = (t0 + 3152);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t6, 16U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB17;

LAB22:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1768U);
    t2 = *((char **)t1);
    t23 = (15 - 15);
    t24 = (t23 * 1U);
    t25 = (0 + t24);
    t1 = (t2 + t25);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t30 = (10 - 4);
    t31 = (t30 * 1U);
    t32 = (0 + t31);
    t3 = (t5 + t32);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = (t35 + 0U);
    t11 = (t9 + 0U);
    *((int *)t11) = 15;
    t11 = (t9 + 4U);
    *((int *)t11) = 5;
    t11 = (t9 + 8U);
    *((int *)t11) = -1;
    t4 = (5 - 15);
    t38 = (t4 * -1);
    t38 = (t38 + 1);
    t11 = (t9 + 12U);
    *((unsigned int *)t11) = t38;
    t11 = (t39 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 4;
    t12 = (t11 + 4U);
    *((int *)t12) = 0;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t7 = (0 - 4);
    t38 = (t7 * -1);
    t38 = (t38 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t38;
    t6 = xsi_base_array_concat(t6, t33, t8, (char)97, t1, t35, (char)97, t3, t39, (char)101);
    t38 = (11U + 5U);
    t26 = (16U != t38);
    if (t26 == 1)
        goto LAB40;

LAB41:    t12 = (t0 + 3152);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t6, 16U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB17;

LAB23:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1768U);
    t2 = *((char **)t1);
    t23 = (15 - 15);
    t24 = (t23 * 1U);
    t25 = (0 + t24);
    t1 = (t2 + t25);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t30 = (10 - 7);
    t31 = (t30 * 1U);
    t32 = (0 + t31);
    t3 = (t5 + t32);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = (t35 + 0U);
    t11 = (t9 + 0U);
    *((int *)t11) = 15;
    t11 = (t9 + 4U);
    *((int *)t11) = 8;
    t11 = (t9 + 8U);
    *((int *)t11) = -1;
    t4 = (8 - 15);
    t38 = (t4 * -1);
    t38 = (t38 + 1);
    t11 = (t9 + 12U);
    *((unsigned int *)t11) = t38;
    t11 = (t39 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 7;
    t12 = (t11 + 4U);
    *((int *)t12) = 0;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t7 = (0 - 7);
    t38 = (t7 * -1);
    t38 = (t38 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t38;
    t6 = xsi_base_array_concat(t6, t33, t8, (char)97, t1, t35, (char)97, t3, t39, (char)101);
    t38 = (8U + 8U);
    t26 = (16U != t38);
    if (t26 == 1)
        goto LAB42;

LAB43:    t12 = (t0 + 3152);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t6, 16U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB17;

LAB31:;
LAB32:    xsi_size_not_matching(16U, t38, 0);
    goto LAB33;

LAB34:    xsi_size_not_matching(16U, t38, 0);
    goto LAB35;

LAB36:    xsi_size_not_matching(16U, t38, 0);
    goto LAB37;

LAB38:    xsi_size_not_matching(16U, t38, 0);
    goto LAB39;

LAB40:    xsi_size_not_matching(16U, t38, 0);
    goto LAB41;

LAB42:    xsi_size_not_matching(16U, t38, 0);
    goto LAB43;

}


extern void work_a_2393008886_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2393008886_3212880686_p_0};
	xsi_register_didat("work_a_2393008886_3212880686", "isim/youqu_isim_beh.exe.sim/work/a_2393008886_3212880686.didat");
	xsi_register_executes(pe);
}
