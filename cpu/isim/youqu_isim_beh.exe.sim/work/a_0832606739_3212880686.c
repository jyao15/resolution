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
static const char *ng0 = "D:/Junior/ComputerOrganization/CPU/jiyuan/cpu/ALU.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_3293060193_503743352(char *, char *, char *, char *, unsigned char );
char *ieee_p_2592010699_sub_393209765_503743352(char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t41[16];
    char t57[16];
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
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    int t31;
    char *t32;
    int t34;
    char *t35;
    int t37;
    char *t38;
    int t40;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned char t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned char t58;

LAB0:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5748);
    t4 = xsi_mem_cmp(t1, t2, 4U);
    if (t4 == 1)
        goto LAB3;

LAB17:    t5 = (t0 + 5752);
    t7 = xsi_mem_cmp(t5, t2, 4U);
    if (t7 == 1)
        goto LAB4;

LAB18:    t8 = (t0 + 5756);
    t10 = xsi_mem_cmp(t8, t2, 4U);
    if (t10 == 1)
        goto LAB5;

LAB19:    t11 = (t0 + 5760);
    t13 = xsi_mem_cmp(t11, t2, 4U);
    if (t13 == 1)
        goto LAB6;

LAB20:    t14 = (t0 + 5764);
    t16 = xsi_mem_cmp(t14, t2, 4U);
    if (t16 == 1)
        goto LAB7;

LAB21:    t17 = (t0 + 5768);
    t19 = xsi_mem_cmp(t17, t2, 4U);
    if (t19 == 1)
        goto LAB8;

LAB22:    t20 = (t0 + 5772);
    t22 = xsi_mem_cmp(t20, t2, 4U);
    if (t22 == 1)
        goto LAB9;

LAB23:    t23 = (t0 + 5776);
    t25 = xsi_mem_cmp(t23, t2, 4U);
    if (t25 == 1)
        goto LAB10;

LAB24:    t26 = (t0 + 5780);
    t28 = xsi_mem_cmp(t26, t2, 4U);
    if (t28 == 1)
        goto LAB11;

LAB25:    t29 = (t0 + 5784);
    t31 = xsi_mem_cmp(t29, t2, 4U);
    if (t31 == 1)
        goto LAB12;

LAB26:    t32 = (t0 + 5788);
    t34 = xsi_mem_cmp(t32, t2, 4U);
    if (t34 == 1)
        goto LAB13;

LAB27:    t35 = (t0 + 5792);
    t37 = xsi_mem_cmp(t35, t2, 4U);
    if (t37 == 1)
        goto LAB14;

LAB28:    t38 = (t0 + 5796);
    t40 = xsi_mem_cmp(t38, t2, 4U);
    if (t40 == 1)
        goto LAB15;

LAB29:
LAB16:    xsi_set_current_line(112, ng0);
    t1 = (t0 + 5832);
    t3 = (t0 + 3472);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(113, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t1 = (t0 + 3392);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(52, ng0);
    t42 = (t0 + 1032U);
    t43 = *((char **)t42);
    t42 = (t0 + 5560U);
    t44 = (t0 + 1192U);
    t45 = *((char **)t44);
    t44 = (t0 + 5576U);
    t46 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t41, t43, t42, t45, t44);
    t47 = (t41 + 12U);
    t48 = *((unsigned int *)t47);
    t49 = (1U * t48);
    t50 = (16U != t49);
    if (t50 == 1)
        goto LAB31;

LAB32:    t51 = (t0 + 3472);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    t54 = (t53 + 56U);
    t55 = *((char **)t54);
    memcpy(t55, t46, 16U);
    xsi_driver_first_trans_fast_port(t51);
    xsi_set_current_line(53, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB4:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5560U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5576U);
    t6 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t41, t2, t1, t5, t3);
    t8 = (t41 + 12U);
    t48 = *((unsigned int *)t8);
    t49 = (1U * t48);
    t50 = (16U != t49);
    if (t50 == 1)
        goto LAB33;

LAB34:    t9 = (t0 + 3472);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 16U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(56, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB5:    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5560U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5576U);
    t6 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t41, t2, t1, t5, t3);
    t8 = (t41 + 12U);
    t48 = *((unsigned int *)t8);
    t49 = (1U * t48);
    t50 = (16U != t49);
    if (t50 == 1)
        goto LAB35;

LAB36:    t9 = (t0 + 3472);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 16U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(59, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB6:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5560U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5576U);
    t6 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t41, t2, t1, t5, t3);
    t8 = (t41 + 12U);
    t48 = *((unsigned int *)t8);
    t49 = (1U * t48);
    t50 = (16U != t49);
    if (t50 == 1)
        goto LAB37;

LAB38:    t9 = (t0 + 3472);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 16U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB7:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 2088U);
    t2 = *((char **)t1);
    t1 = (t0 + 5640U);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t3 = (t0 + 5560U);
    t6 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t41, t2, t1, t5, t3);
    t8 = (t41 + 12U);
    t48 = *((unsigned int *)t8);
    t49 = (1U * t48);
    t50 = (16U != t49);
    if (t50 == 1)
        goto LAB39;

LAB40:    t9 = (t0 + 3472);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 16U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(65, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB8:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t48 = (15 - 15);
    t49 = (t48 * 1U);
    t56 = (0 + t49);
    t1 = (t2 + t56);
    t3 = (t0 + 1968U);
    t5 = *((char **)t3);
    t3 = (t5 + 0);
    memcpy(t3, t1, 16U);
    t6 = (t0 + 1912U);
    xsi_variable_act(t6);
    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5576U);
    t3 = (t0 + 2088U);
    t5 = *((char **)t3);
    t3 = (t0 + 5640U);
    t50 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t3);
    if (t50 != 0)
        goto LAB41;

LAB43:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5560U);
    t3 = ieee_p_2592010699_sub_3293060193_503743352(IEEE_P_2592010699, t57, t2, t1, (unsigned char)0);
    t5 = (t57 + 12U);
    t48 = *((unsigned int *)t5);
    t48 = (t48 * 1U);
    t6 = (t0 + 1192U);
    t8 = *((char **)t6);
    t6 = (t0 + 5576U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t8, t6);
    t9 = xsi_vhdl_bitvec_sll(t9, t3, t48, t4);
    t11 = ieee_p_2592010699_sub_393209765_503743352(IEEE_P_2592010699, t41, t9, t57);
    t12 = (t41 + 12U);
    t49 = *((unsigned int *)t12);
    t49 = (t49 * 1U);
    t50 = (16U != t49);
    if (t50 == 1)
        goto LAB46;

LAB47:    t14 = (t0 + 3472);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    memcpy(t20, t11, 16U);
    xsi_driver_first_trans_fast_port(t14);

LAB42:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB9:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5560U);
    t3 = ieee_p_2592010699_sub_3293060193_503743352(IEEE_P_2592010699, t57, t2, t1, (unsigned char)0);
    t5 = (t57 + 12U);
    t48 = *((unsigned int *)t5);
    t48 = (t48 * 1U);
    t6 = (t0 + 1192U);
    t8 = *((char **)t6);
    t6 = (t0 + 5576U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t8, t6);
    t9 = xsi_vhdl_bitvec_sll(t9, t3, t48, t4);
    t11 = ieee_p_2592010699_sub_393209765_503743352(IEEE_P_2592010699, t41, t9, t57);
    t12 = (t41 + 12U);
    t49 = *((unsigned int *)t12);
    t49 = (t49 * 1U);
    t50 = (16U != t49);
    if (t50 == 1)
        goto LAB48;

LAB49:    t14 = (t0 + 3472);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    memcpy(t20, t11, 16U);
    xsi_driver_first_trans_fast_port(t14);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB10:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t48 = (15 - 15);
    t49 = (t48 * 1U);
    t56 = (0 + t49);
    t1 = (t2 + t56);
    t3 = (t0 + 1968U);
    t5 = *((char **)t3);
    t3 = (t5 + 0);
    memcpy(t3, t1, 16U);
    t6 = (t0 + 1912U);
    xsi_variable_act(t6);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5576U);
    t3 = (t0 + 2088U);
    t5 = *((char **)t3);
    t3 = (t0 + 5640U);
    t50 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t3);
    if (t50 != 0)
        goto LAB50;

LAB52:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5560U);
    t3 = ieee_p_2592010699_sub_3293060193_503743352(IEEE_P_2592010699, t57, t2, t1, (unsigned char)0);
    t5 = (t57 + 12U);
    t48 = *((unsigned int *)t5);
    t48 = (t48 * 1U);
    t6 = (t0 + 1192U);
    t8 = *((char **)t6);
    t6 = (t0 + 5576U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t8, t6);
    t9 = xsi_vhdl_bitvec_sra(t9, t3, t48, t4);
    t11 = ieee_p_2592010699_sub_393209765_503743352(IEEE_P_2592010699, t41, t9, t57);
    t12 = (t41 + 12U);
    t49 = *((unsigned int *)t12);
    t49 = (t49 * 1U);
    t50 = (16U != t49);
    if (t50 == 1)
        goto LAB55;

LAB56:    t14 = (t0 + 3472);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    memcpy(t20, t11, 16U);
    xsi_driver_first_trans_fast_port(t14);

LAB51:    xsi_set_current_line(84, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB11:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5560U);
    t3 = ieee_p_2592010699_sub_3293060193_503743352(IEEE_P_2592010699, t57, t2, t1, (unsigned char)0);
    t5 = (t57 + 12U);
    t48 = *((unsigned int *)t5);
    t48 = (t48 * 1U);
    t6 = (t0 + 1192U);
    t8 = *((char **)t6);
    t6 = (t0 + 5576U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t8, t6);
    t9 = xsi_vhdl_bitvec_sra(t9, t3, t48, t4);
    t11 = ieee_p_2592010699_sub_393209765_503743352(IEEE_P_2592010699, t41, t9, t57);
    t12 = (t41 + 12U);
    t49 = *((unsigned int *)t12);
    t49 = (t49 * 1U);
    t50 = (16U != t49);
    if (t50 == 1)
        goto LAB57;

LAB58:    t14 = (t0 + 3472);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    memcpy(t20, t11, 16U);
    xsi_driver_first_trans_fast_port(t14);
    xsi_set_current_line(87, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB12:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5560U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5576U);
    t50 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t3);
    if (t50 != 0)
        goto LAB59;

LAB61:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 5816);
    t3 = (t0 + 3472);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 16U);
    xsi_driver_first_trans_fast_port(t3);

LAB60:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB13:    xsi_set_current_line(97, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5560U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5576U);
    t50 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t3);
    if (t50 != 0)
        goto LAB62;

LAB64:    xsi_set_current_line(100, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB63:    goto LAB2;

LAB14:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB2;

LAB15:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5560U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5576U);
    t50 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t3);
    if (t50 != 0)
        goto LAB65;

LAB67:    xsi_set_current_line(109, ng0);
    t1 = (t0 + 3536);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB66:    goto LAB2;

LAB30:;
LAB31:    xsi_size_not_matching(16U, t49, 0);
    goto LAB32;

LAB33:    xsi_size_not_matching(16U, t49, 0);
    goto LAB34;

LAB35:    xsi_size_not_matching(16U, t49, 0);
    goto LAB36;

LAB37:    xsi_size_not_matching(16U, t49, 0);
    goto LAB38;

LAB39:    xsi_size_not_matching(16U, t49, 0);
    goto LAB40;

LAB41:    xsi_set_current_line(69, ng0);
    t6 = (t0 + 1968U);
    t8 = *((char **)t6);
    t6 = (t0 + 5624U);
    t9 = ieee_p_2592010699_sub_3293060193_503743352(IEEE_P_2592010699, t57, t8, t6, (unsigned char)0);
    t11 = (t57 + 12U);
    t48 = *((unsigned int *)t11);
    t48 = (t48 * 1U);
    t12 = xsi_vhdl_bitvec_sll(t12, t9, t48, 8);
    t14 = ieee_p_2592010699_sub_393209765_503743352(IEEE_P_2592010699, t41, t12, t57);
    t15 = (t41 + 12U);
    t49 = *((unsigned int *)t15);
    t49 = (t49 * 1U);
    t58 = (16U != t49);
    if (t58 == 1)
        goto LAB44;

LAB45:    t17 = (t0 + 3472);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    t21 = (t20 + 56U);
    t23 = *((char **)t21);
    memcpy(t23, t14, 16U);
    xsi_driver_first_trans_delta(t17, 0U, 16U, 0LL);
    goto LAB42;

LAB44:    xsi_size_not_matching(16U, t49, 0);
    goto LAB45;

LAB46:    xsi_size_not_matching(16U, t49, 0);
    goto LAB47;

LAB48:    xsi_size_not_matching(16U, t49, 0);
    goto LAB49;

LAB50:    xsi_set_current_line(80, ng0);
    t6 = (t0 + 1968U);
    t8 = *((char **)t6);
    t6 = (t0 + 5624U);
    t9 = ieee_p_2592010699_sub_3293060193_503743352(IEEE_P_2592010699, t57, t8, t6, (unsigned char)0);
    t11 = (t57 + 12U);
    t48 = *((unsigned int *)t11);
    t48 = (t48 * 1U);
    t12 = xsi_vhdl_bitvec_sra(t12, t9, t48, 8);
    t14 = ieee_p_2592010699_sub_393209765_503743352(IEEE_P_2592010699, t41, t12, t57);
    t15 = (t41 + 12U);
    t49 = *((unsigned int *)t15);
    t49 = (t49 * 1U);
    t58 = (16U != t49);
    if (t58 == 1)
        goto LAB53;

LAB54:    t17 = (t0 + 3472);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    t21 = (t20 + 56U);
    t23 = *((char **)t21);
    memcpy(t23, t14, 16U);
    xsi_driver_first_trans_delta(t17, 0U, 16U, 0LL);
    goto LAB51;

LAB53:    xsi_size_not_matching(16U, t49, 0);
    goto LAB54;

LAB55:    xsi_size_not_matching(16U, t49, 0);
    goto LAB56;

LAB57:    xsi_size_not_matching(16U, t49, 0);
    goto LAB58;

LAB59:    xsi_set_current_line(90, ng0);
    t6 = (t0 + 5800);
    t9 = (t0 + 3472);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 16U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB60;

LAB62:    xsi_set_current_line(98, ng0);
    t6 = (t0 + 3536);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t6);
    goto LAB63;

LAB65:    xsi_set_current_line(107, ng0);
    t6 = (t0 + 3536);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t6);
    goto LAB66;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/youqu_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
