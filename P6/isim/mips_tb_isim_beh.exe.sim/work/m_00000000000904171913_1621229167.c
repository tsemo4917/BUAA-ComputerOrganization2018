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
static const char *ng0 = "D:/ise_project/P6new/GRF.v";
static int ng1[] = {0, 0};
static int ng2[] = {32, 0};
static int ng3[] = {28, 0};
static unsigned int ng4[] = {6144U, 0U};
static int ng5[] = {29, 0};
static unsigned int ng6[] = {12284U, 0U};
static unsigned int ng7[] = {0U, 0U};
static int ng8[] = {1, 0};
static const char *ng9 = "%d@%h: $%d <= %h";



static void Initial_39_0(char *t0)
{
    char t5[8];
    char t12[8];
    char t13[8];
    char t18[8];
    char t35[8];
    char t36[8];
    char t41[8];
    char t60[8];
    char t61[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    char *t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    char *t71;
    unsigned int t72;
    int t73;
    char *t74;
    unsigned int t75;
    int t76;
    int t77;
    unsigned int t78;
    unsigned int t79;
    int t80;
    int t81;

LAB0:    xsi_set_current_line(39, ng0);

LAB2:    xsi_set_current_line(40, ng0);
    xsi_set_current_line(40, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3048);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 3048);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng2)));
    memset(t5, 0, 8);
    xsi_vlog_signed_less(t5, 32, t3, 32, t4, 32);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    xsi_set_current_line(40, ng0);

LAB6:    xsi_set_current_line(41, ng0);
    t14 = (t0 + 3048);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng3)));
    memset(t18, 0, 8);
    xsi_vlog_signed_equal(t18, 32, t16, 32, t17, 32);
    memset(t13, 0, 8);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t19);
    t21 = (~(t20));
    t22 = *((unsigned int *)t18);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB7;

LAB8:    if (*((unsigned int *)t19) != 0)
        goto LAB9;

LAB10:    t26 = (t13 + 4);
    t27 = *((unsigned int *)t13);
    t28 = *((unsigned int *)t26);
    t29 = (t27 || t28);
    if (t29 > 0)
        goto LAB11;

LAB12:    t31 = *((unsigned int *)t13);
    t32 = (~(t31));
    t33 = *((unsigned int *)t26);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t26) > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t13) > 0)
        goto LAB17;

LAB18:    memcpy(t12, t35, 8);

LAB19:    t59 = (t0 + 2888);
    t62 = (t0 + 2888);
    t63 = (t62 + 72U);
    t64 = *((char **)t63);
    t65 = (t0 + 2888);
    t66 = (t65 + 64U);
    t67 = *((char **)t66);
    t68 = (t0 + 3048);
    t69 = (t68 + 56U);
    t70 = *((char **)t69);
    xsi_vlog_generic_convert_array_indices(t60, t61, t64, t67, 2, 1, t70, 32, 1);
    t71 = (t60 + 4);
    t72 = *((unsigned int *)t71);
    t73 = (!(t72));
    t74 = (t61 + 4);
    t75 = *((unsigned int *)t74);
    t76 = (!(t75));
    t77 = (t73 && t76);
    if (t77 == 1)
        goto LAB33;

LAB34:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 3048);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng8)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t3, 32, t4, 32);
    t6 = (t0 + 3048);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 32);
    goto LAB3;

LAB7:    *((unsigned int *)t13) = 1;
    goto LAB10;

LAB9:    t25 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB10;

LAB11:    t30 = ((char*)((ng4)));
    goto LAB12;

LAB13:    t37 = (t0 + 3048);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    t40 = ((char*)((ng5)));
    memset(t41, 0, 8);
    xsi_vlog_signed_equal(t41, 32, t39, 32, t40, 32);
    memset(t36, 0, 8);
    t42 = (t41 + 4);
    t43 = *((unsigned int *)t42);
    t44 = (~(t43));
    t45 = *((unsigned int *)t41);
    t46 = (t45 & t44);
    t47 = (t46 & 1U);
    if (t47 != 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t42) != 0)
        goto LAB22;

LAB23:    t49 = (t36 + 4);
    t50 = *((unsigned int *)t36);
    t51 = *((unsigned int *)t49);
    t52 = (t50 || t51);
    if (t52 > 0)
        goto LAB24;

LAB25:    t54 = *((unsigned int *)t36);
    t55 = (~(t54));
    t56 = *((unsigned int *)t49);
    t57 = (t55 || t56);
    if (t57 > 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t49) > 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t36) > 0)
        goto LAB30;

LAB31:    memcpy(t35, t58, 8);

LAB32:    goto LAB14;

LAB15:    xsi_vlog_unsigned_bit_combine(t12, 32, t30, 32, t35, 32);
    goto LAB19;

LAB17:    memcpy(t12, t30, 8);
    goto LAB19;

LAB20:    *((unsigned int *)t36) = 1;
    goto LAB23;

LAB22:    t48 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t48) = 1;
    goto LAB23;

LAB24:    t53 = ((char*)((ng6)));
    goto LAB25;

LAB26:    t58 = ((char*)((ng7)));
    goto LAB27;

LAB28:    xsi_vlog_unsigned_bit_combine(t35, 32, t53, 32, t58, 32);
    goto LAB32;

LAB30:    memcpy(t35, t53, 8);
    goto LAB32;

LAB33:    t78 = *((unsigned int *)t60);
    t79 = *((unsigned int *)t61);
    t80 = (t78 - t79);
    t81 = (t80 + 1);
    xsi_vlogvar_assign_value(t59, t12, 0, *((unsigned int *)t61), t81);
    goto LAB34;

}

static void Cont_47_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t38[8];
    char t39[8];
    char t42[8];
    char t56[8];
    char t71[8];
    char t79[8];
    char t130[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t40;
    char *t41;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    char *t54;
    char *t55;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    char *t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    char *t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    int t103;
    int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    char *t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    char *t117;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    char *t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    char *t128;
    char *t129;
    char *t131;
    char *t132;
    char *t133;
    char *t134;
    char *t135;
    char *t136;
    char *t137;
    char *t138;
    char *t139;
    char *t140;
    char *t141;
    char *t142;
    char *t143;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1688U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t38, 8);

LAB20:    t137 = (t0 + 5144);
    t139 = (t137 + 56U);
    t140 = *((char **)t139);
    t141 = (t140 + 56U);
    t142 = *((char **)t141);
    memcpy(t142, t3, 8);
    xsi_driver_vfirst_trans(t137, 0, 31);
    t143 = (t0 + 5032);
    *((int *)t143) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t40 = (t0 + 1368U);
    t41 = *((char **)t40);
    memset(t42, 0, 8);
    t40 = (t41 + 4);
    t43 = *((unsigned int *)t40);
    t44 = (~(t43));
    t45 = *((unsigned int *)t41);
    t46 = (t45 & t44);
    t47 = (t46 & 1U);
    if (t47 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t40) != 0)
        goto LAB23;

LAB24:    t49 = (t42 + 4);
    t50 = *((unsigned int *)t42);
    t51 = *((unsigned int *)t49);
    t52 = (t50 || t51);
    if (t52 > 0)
        goto LAB25;

LAB26:    memcpy(t79, t42, 8);

LAB27:    memset(t39, 0, 8);
    t111 = (t79 + 4);
    t112 = *((unsigned int *)t111);
    t113 = (~(t112));
    t114 = *((unsigned int *)t79);
    t115 = (t114 & t113);
    t116 = (t115 & 1U);
    if (t116 != 0)
        goto LAB39;

LAB40:    if (*((unsigned int *)t111) != 0)
        goto LAB41;

LAB42:    t118 = (t39 + 4);
    t119 = *((unsigned int *)t39);
    t120 = *((unsigned int *)t118);
    t121 = (t119 || t120);
    if (t121 > 0)
        goto LAB43;

LAB44:    t124 = *((unsigned int *)t39);
    t125 = (~(t124));
    t126 = *((unsigned int *)t118);
    t127 = (t125 || t126);
    if (t127 > 0)
        goto LAB45;

LAB46:    if (*((unsigned int *)t118) > 0)
        goto LAB47;

LAB48:    if (*((unsigned int *)t39) > 0)
        goto LAB49;

LAB50:    memcpy(t38, t130, 8);

LAB51:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t33, 32, t38, 32);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

LAB21:    *((unsigned int *)t42) = 1;
    goto LAB24;

LAB23:    t48 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t48) = 1;
    goto LAB24;

LAB25:    t53 = (t0 + 1688U);
    t54 = *((char **)t53);
    t53 = (t0 + 2008U);
    t55 = *((char **)t53);
    memset(t56, 0, 8);
    t53 = (t54 + 4);
    t57 = (t55 + 4);
    t58 = *((unsigned int *)t54);
    t59 = *((unsigned int *)t55);
    t60 = (t58 ^ t59);
    t61 = *((unsigned int *)t53);
    t62 = *((unsigned int *)t57);
    t63 = (t61 ^ t62);
    t64 = (t60 | t63);
    t65 = *((unsigned int *)t53);
    t66 = *((unsigned int *)t57);
    t67 = (t65 | t66);
    t68 = (~(t67));
    t69 = (t64 & t68);
    if (t69 != 0)
        goto LAB31;

LAB28:    if (t67 != 0)
        goto LAB30;

LAB29:    *((unsigned int *)t56) = 1;

LAB31:    memset(t71, 0, 8);
    t72 = (t56 + 4);
    t73 = *((unsigned int *)t72);
    t74 = (~(t73));
    t75 = *((unsigned int *)t56);
    t76 = (t75 & t74);
    t77 = (t76 & 1U);
    if (t77 != 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t72) != 0)
        goto LAB34;

LAB35:    t80 = *((unsigned int *)t42);
    t81 = *((unsigned int *)t71);
    t82 = (t80 & t81);
    *((unsigned int *)t79) = t82;
    t83 = (t42 + 4);
    t84 = (t71 + 4);
    t85 = (t79 + 4);
    t86 = *((unsigned int *)t83);
    t87 = *((unsigned int *)t84);
    t88 = (t86 | t87);
    *((unsigned int *)t85) = t88;
    t89 = *((unsigned int *)t85);
    t90 = (t89 != 0);
    if (t90 == 1)
        goto LAB36;

LAB37:
LAB38:    goto LAB27;

LAB30:    t70 = (t56 + 4);
    *((unsigned int *)t56) = 1;
    *((unsigned int *)t70) = 1;
    goto LAB31;

LAB32:    *((unsigned int *)t71) = 1;
    goto LAB35;

LAB34:    t78 = (t71 + 4);
    *((unsigned int *)t71) = 1;
    *((unsigned int *)t78) = 1;
    goto LAB35;

LAB36:    t91 = *((unsigned int *)t79);
    t92 = *((unsigned int *)t85);
    *((unsigned int *)t79) = (t91 | t92);
    t93 = (t42 + 4);
    t94 = (t71 + 4);
    t95 = *((unsigned int *)t42);
    t96 = (~(t95));
    t97 = *((unsigned int *)t93);
    t98 = (~(t97));
    t99 = *((unsigned int *)t71);
    t100 = (~(t99));
    t101 = *((unsigned int *)t94);
    t102 = (~(t101));
    t103 = (t96 & t98);
    t104 = (t100 & t102);
    t105 = (~(t103));
    t106 = (~(t104));
    t107 = *((unsigned int *)t85);
    *((unsigned int *)t85) = (t107 & t105);
    t108 = *((unsigned int *)t85);
    *((unsigned int *)t85) = (t108 & t106);
    t109 = *((unsigned int *)t79);
    *((unsigned int *)t79) = (t109 & t105);
    t110 = *((unsigned int *)t79);
    *((unsigned int *)t79) = (t110 & t106);
    goto LAB38;

LAB39:    *((unsigned int *)t39) = 1;
    goto LAB42;

LAB41:    t117 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t117) = 1;
    goto LAB42;

LAB43:    t122 = (t0 + 2168U);
    t123 = *((char **)t122);
    goto LAB44;

LAB45:    t122 = (t0 + 2888);
    t128 = (t122 + 56U);
    t129 = *((char **)t128);
    t131 = (t0 + 2888);
    t132 = (t131 + 72U);
    t133 = *((char **)t132);
    t134 = (t0 + 2888);
    t135 = (t134 + 64U);
    t136 = *((char **)t135);
    t137 = (t0 + 1688U);
    t138 = *((char **)t137);
    xsi_vlog_generic_get_array_select_value(t130, 32, t129, t133, t136, 2, 1, t138, 5, 2);
    goto LAB46;

LAB47:    xsi_vlog_unsigned_bit_combine(t38, 32, t123, 32, t130, 32);
    goto LAB51;

LAB49:    memcpy(t38, t123, 8);
    goto LAB51;

}

static void Cont_51_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t38[8];
    char t39[8];
    char t42[8];
    char t56[8];
    char t71[8];
    char t79[8];
    char t130[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t40;
    char *t41;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    char *t54;
    char *t55;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    char *t83;
    char *t84;
    char *t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    char *t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    int t103;
    int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    char *t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    char *t117;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    char *t122;
    char *t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    char *t128;
    char *t129;
    char *t131;
    char *t132;
    char *t133;
    char *t134;
    char *t135;
    char *t136;
    char *t137;
    char *t138;
    char *t139;
    char *t140;
    char *t141;
    char *t142;
    char *t143;

LAB0:    t1 = (t0 + 4464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1848U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t38, 8);

LAB20:    t137 = (t0 + 5208);
    t139 = (t137 + 56U);
    t140 = *((char **)t139);
    t141 = (t140 + 56U);
    t142 = *((char **)t141);
    memcpy(t142, t3, 8);
    xsi_driver_vfirst_trans(t137, 0, 31);
    t143 = (t0 + 5048);
    *((int *)t143) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t40 = (t0 + 1368U);
    t41 = *((char **)t40);
    memset(t42, 0, 8);
    t40 = (t41 + 4);
    t43 = *((unsigned int *)t40);
    t44 = (~(t43));
    t45 = *((unsigned int *)t41);
    t46 = (t45 & t44);
    t47 = (t46 & 1U);
    if (t47 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t40) != 0)
        goto LAB23;

LAB24:    t49 = (t42 + 4);
    t50 = *((unsigned int *)t42);
    t51 = *((unsigned int *)t49);
    t52 = (t50 || t51);
    if (t52 > 0)
        goto LAB25;

LAB26:    memcpy(t79, t42, 8);

LAB27:    memset(t39, 0, 8);
    t111 = (t79 + 4);
    t112 = *((unsigned int *)t111);
    t113 = (~(t112));
    t114 = *((unsigned int *)t79);
    t115 = (t114 & t113);
    t116 = (t115 & 1U);
    if (t116 != 0)
        goto LAB39;

LAB40:    if (*((unsigned int *)t111) != 0)
        goto LAB41;

LAB42:    t118 = (t39 + 4);
    t119 = *((unsigned int *)t39);
    t120 = *((unsigned int *)t118);
    t121 = (t119 || t120);
    if (t121 > 0)
        goto LAB43;

LAB44:    t124 = *((unsigned int *)t39);
    t125 = (~(t124));
    t126 = *((unsigned int *)t118);
    t127 = (t125 || t126);
    if (t127 > 0)
        goto LAB45;

LAB46:    if (*((unsigned int *)t118) > 0)
        goto LAB47;

LAB48:    if (*((unsigned int *)t39) > 0)
        goto LAB49;

LAB50:    memcpy(t38, t130, 8);

LAB51:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t33, 32, t38, 32);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

LAB21:    *((unsigned int *)t42) = 1;
    goto LAB24;

LAB23:    t48 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t48) = 1;
    goto LAB24;

LAB25:    t53 = (t0 + 1848U);
    t54 = *((char **)t53);
    t53 = (t0 + 2008U);
    t55 = *((char **)t53);
    memset(t56, 0, 8);
    t53 = (t54 + 4);
    t57 = (t55 + 4);
    t58 = *((unsigned int *)t54);
    t59 = *((unsigned int *)t55);
    t60 = (t58 ^ t59);
    t61 = *((unsigned int *)t53);
    t62 = *((unsigned int *)t57);
    t63 = (t61 ^ t62);
    t64 = (t60 | t63);
    t65 = *((unsigned int *)t53);
    t66 = *((unsigned int *)t57);
    t67 = (t65 | t66);
    t68 = (~(t67));
    t69 = (t64 & t68);
    if (t69 != 0)
        goto LAB31;

LAB28:    if (t67 != 0)
        goto LAB30;

LAB29:    *((unsigned int *)t56) = 1;

LAB31:    memset(t71, 0, 8);
    t72 = (t56 + 4);
    t73 = *((unsigned int *)t72);
    t74 = (~(t73));
    t75 = *((unsigned int *)t56);
    t76 = (t75 & t74);
    t77 = (t76 & 1U);
    if (t77 != 0)
        goto LAB32;

LAB33:    if (*((unsigned int *)t72) != 0)
        goto LAB34;

LAB35:    t80 = *((unsigned int *)t42);
    t81 = *((unsigned int *)t71);
    t82 = (t80 & t81);
    *((unsigned int *)t79) = t82;
    t83 = (t42 + 4);
    t84 = (t71 + 4);
    t85 = (t79 + 4);
    t86 = *((unsigned int *)t83);
    t87 = *((unsigned int *)t84);
    t88 = (t86 | t87);
    *((unsigned int *)t85) = t88;
    t89 = *((unsigned int *)t85);
    t90 = (t89 != 0);
    if (t90 == 1)
        goto LAB36;

LAB37:
LAB38:    goto LAB27;

LAB30:    t70 = (t56 + 4);
    *((unsigned int *)t56) = 1;
    *((unsigned int *)t70) = 1;
    goto LAB31;

LAB32:    *((unsigned int *)t71) = 1;
    goto LAB35;

LAB34:    t78 = (t71 + 4);
    *((unsigned int *)t71) = 1;
    *((unsigned int *)t78) = 1;
    goto LAB35;

LAB36:    t91 = *((unsigned int *)t79);
    t92 = *((unsigned int *)t85);
    *((unsigned int *)t79) = (t91 | t92);
    t93 = (t42 + 4);
    t94 = (t71 + 4);
    t95 = *((unsigned int *)t42);
    t96 = (~(t95));
    t97 = *((unsigned int *)t93);
    t98 = (~(t97));
    t99 = *((unsigned int *)t71);
    t100 = (~(t99));
    t101 = *((unsigned int *)t94);
    t102 = (~(t101));
    t103 = (t96 & t98);
    t104 = (t100 & t102);
    t105 = (~(t103));
    t106 = (~(t104));
    t107 = *((unsigned int *)t85);
    *((unsigned int *)t85) = (t107 & t105);
    t108 = *((unsigned int *)t85);
    *((unsigned int *)t85) = (t108 & t106);
    t109 = *((unsigned int *)t79);
    *((unsigned int *)t79) = (t109 & t105);
    t110 = *((unsigned int *)t79);
    *((unsigned int *)t79) = (t110 & t106);
    goto LAB38;

LAB39:    *((unsigned int *)t39) = 1;
    goto LAB42;

LAB41:    t117 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t117) = 1;
    goto LAB42;

LAB43:    t122 = (t0 + 2168U);
    t123 = *((char **)t122);
    goto LAB44;

LAB45:    t122 = (t0 + 2888);
    t128 = (t122 + 56U);
    t129 = *((char **)t128);
    t131 = (t0 + 2888);
    t132 = (t131 + 72U);
    t133 = *((char **)t132);
    t134 = (t0 + 2888);
    t135 = (t134 + 64U);
    t136 = *((char **)t135);
    t137 = (t0 + 1848U);
    t138 = *((char **)t137);
    xsi_vlog_generic_get_array_select_value(t130, 32, t129, t133, t136, 2, 1, t138, 5, 2);
    goto LAB46;

LAB47:    xsi_vlog_unsigned_bit_combine(t38, 32, t123, 32, t130, 32);
    goto LAB51;

LAB49:    memcpy(t38, t123, 8);
    goto LAB51;

}

static void Always_55_3(char *t0)
{
    char t13[8];
    char t14[8];
    char t15[8];
    char t19[8];
    char t36[8];
    char t37[8];
    char t42[8];
    char t61[8];
    char t62[8];
    char t83[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t16;
    char *t17;
    char *t18;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t60;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    unsigned int t73;
    int t74;
    char *t75;
    unsigned int t76;
    int t77;
    int t78;
    unsigned int t79;
    unsigned int t80;
    int t81;
    int t82;

LAB0:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 5064);
    *((int *)t2) = 1;
    t3 = (t0 + 4744);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(55, ng0);

LAB5:    xsi_set_current_line(56, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB42;

LAB43:
LAB44:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(56, ng0);

LAB9:    xsi_set_current_line(57, ng0);
    xsi_set_current_line(57, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3048);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);

LAB10:    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_signed_less(t13, 32, t4, 32, t5, 32);
    t11 = (t13 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    goto LAB8;

LAB11:    xsi_set_current_line(57, ng0);

LAB13:    xsi_set_current_line(58, ng0);
    t12 = (t0 + 3048);
    t16 = (t12 + 56U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng3)));
    memset(t19, 0, 8);
    xsi_vlog_signed_equal(t19, 32, t17, 32, t18, 32);
    memset(t15, 0, 8);
    t20 = (t19 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t19);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t20) != 0)
        goto LAB16;

LAB17:    t27 = (t15 + 4);
    t28 = *((unsigned int *)t15);
    t29 = *((unsigned int *)t27);
    t30 = (t28 || t29);
    if (t30 > 0)
        goto LAB18;

LAB19:    t32 = *((unsigned int *)t15);
    t33 = (~(t32));
    t34 = *((unsigned int *)t27);
    t35 = (t33 || t34);
    if (t35 > 0)
        goto LAB20;

LAB21:    if (*((unsigned int *)t27) > 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t15) > 0)
        goto LAB24;

LAB25:    memcpy(t14, t36, 8);

LAB26:    t60 = (t0 + 2888);
    t63 = (t0 + 2888);
    t64 = (t63 + 72U);
    t65 = *((char **)t64);
    t66 = (t0 + 2888);
    t67 = (t66 + 64U);
    t68 = *((char **)t67);
    t69 = (t0 + 3048);
    t70 = (t69 + 56U);
    t71 = *((char **)t70);
    xsi_vlog_generic_convert_array_indices(t61, t62, t65, t68, 2, 1, t71, 32, 1);
    t72 = (t61 + 4);
    t73 = *((unsigned int *)t72);
    t74 = (!(t73));
    t75 = (t62 + 4);
    t76 = *((unsigned int *)t75);
    t77 = (!(t76));
    t78 = (t74 && t77);
    if (t78 == 1)
        goto LAB40;

LAB41:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_signed_add(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 3048);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 32);
    goto LAB10;

LAB14:    *((unsigned int *)t15) = 1;
    goto LAB17;

LAB16:    t26 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB17;

LAB18:    t31 = ((char*)((ng4)));
    goto LAB19;

LAB20:    t38 = (t0 + 3048);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = ((char*)((ng5)));
    memset(t42, 0, 8);
    xsi_vlog_signed_equal(t42, 32, t40, 32, t41, 32);
    memset(t37, 0, 8);
    t43 = (t42 + 4);
    t44 = *((unsigned int *)t43);
    t45 = (~(t44));
    t46 = *((unsigned int *)t42);
    t47 = (t46 & t45);
    t48 = (t47 & 1U);
    if (t48 != 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t43) != 0)
        goto LAB29;

LAB30:    t50 = (t37 + 4);
    t51 = *((unsigned int *)t37);
    t52 = *((unsigned int *)t50);
    t53 = (t51 || t52);
    if (t53 > 0)
        goto LAB31;

LAB32:    t55 = *((unsigned int *)t37);
    t56 = (~(t55));
    t57 = *((unsigned int *)t50);
    t58 = (t56 || t57);
    if (t58 > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t50) > 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t37) > 0)
        goto LAB37;

LAB38:    memcpy(t36, t59, 8);

LAB39:    goto LAB21;

LAB22:    xsi_vlog_unsigned_bit_combine(t14, 32, t31, 32, t36, 32);
    goto LAB26;

LAB24:    memcpy(t14, t31, 8);
    goto LAB26;

LAB27:    *((unsigned int *)t37) = 1;
    goto LAB30;

LAB29:    t49 = (t37 + 4);
    *((unsigned int *)t37) = 1;
    *((unsigned int *)t49) = 1;
    goto LAB30;

LAB31:    t54 = ((char*)((ng6)));
    goto LAB32;

LAB33:    t59 = ((char*)((ng7)));
    goto LAB34;

LAB35:    xsi_vlog_unsigned_bit_combine(t36, 32, t54, 32, t59, 32);
    goto LAB39;

LAB37:    memcpy(t36, t54, 8);
    goto LAB39;

LAB40:    t79 = *((unsigned int *)t61);
    t80 = *((unsigned int *)t62);
    t81 = (t79 - t80);
    t82 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t60, t14, 0, *((unsigned int *)t62), t82, 0LL);
    goto LAB41;

LAB42:    xsi_set_current_line(63, ng0);

LAB45:    xsi_set_current_line(64, ng0);
    t4 = (t0 + 2008U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t13, 0, 8);
    t11 = (t5 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB47;

LAB46:    t12 = (t4 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB47;

LAB50:    if (*((unsigned int *)t5) > *((unsigned int *)t4))
        goto LAB48;

LAB49:    t17 = (t13 + 4);
    t21 = *((unsigned int *)t17);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB51;

LAB52:    xsi_set_current_line(69, ng0);

LAB57:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 2888);
    t4 = (t0 + 2888);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 2888);
    t16 = (t12 + 64U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng1)));
    xsi_vlog_generic_convert_array_indices(t13, t14, t11, t17, 2, 1, t18, 32, 1);
    t20 = (t13 + 4);
    t6 = *((unsigned int *)t20);
    t74 = (!(t6));
    t26 = (t14 + 4);
    t7 = *((unsigned int *)t26);
    t77 = (!(t7));
    t78 = (t74 && t77);
    if (t78 == 1)
        goto LAB58;

LAB59:
LAB53:    goto LAB44;

LAB47:    t16 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB49;

LAB48:    *((unsigned int *)t13) = 1;
    goto LAB49;

LAB51:    xsi_set_current_line(64, ng0);

LAB54:    xsi_set_current_line(65, ng0);
    t18 = (t0 + 2168U);
    t20 = *((char **)t18);
    t18 = (t0 + 2888);
    t26 = (t0 + 2888);
    t27 = (t26 + 72U);
    t31 = *((char **)t27);
    t38 = (t0 + 2888);
    t39 = (t38 + 64U);
    t40 = *((char **)t39);
    t41 = (t0 + 2008U);
    t43 = *((char **)t41);
    xsi_vlog_generic_convert_array_indices(t14, t15, t31, t40, 2, 1, t43, 5, 2);
    t41 = (t14 + 4);
    t28 = *((unsigned int *)t41);
    t74 = (!(t28));
    t49 = (t15 + 4);
    t29 = *((unsigned int *)t49);
    t77 = (!(t29));
    t78 = (t74 && t77);
    if (t78 == 1)
        goto LAB55;

LAB56:    xsi_set_current_line(67, ng0);
    t2 = xsi_vlog_time(t83, 1000.0000000000000, 1000.0000000000000);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    t3 = (t0 + 2008U);
    t5 = *((char **)t3);
    t3 = (t0 + 2168U);
    t11 = *((char **)t3);
    xsi_vlogfile_write(1, 0, 0, ng9, 5, t0, (char)118, t83, 64, (char)118, t4, 32, (char)118, t5, 5, (char)118, t11, 32);
    goto LAB53;

LAB55:    t30 = *((unsigned int *)t14);
    t32 = *((unsigned int *)t15);
    t81 = (t30 - t32);
    t82 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t18, t20, 0, *((unsigned int *)t15), t82, 0LL);
    goto LAB56;

LAB58:    t8 = *((unsigned int *)t13);
    t9 = *((unsigned int *)t14);
    t81 = (t8 - t9);
    t82 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t14), t82, 0LL);
    goto LAB59;

}


extern void work_m_00000000000904171913_1621229167_init()
{
	static char *pe[] = {(void *)Initial_39_0,(void *)Cont_47_1,(void *)Cont_51_2,(void *)Always_55_3};
	xsi_register_didat("work_m_00000000000904171913_1621229167", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000000904171913_1621229167.didat");
	xsi_register_executes(pe);
}
