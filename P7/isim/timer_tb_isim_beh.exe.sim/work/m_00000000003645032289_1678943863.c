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
static const char *ng0 = "D:/ise_project/P7/timer.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {4294967295U, 4294967295U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {8U, 0U};
static unsigned int ng7[] = {4U, 0U};
static int ng8[] = {1, 0};



static void Initial_44_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(44, ng0);

LAB2:    xsi_set_current_line(45, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3112);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 32, 0LL);
    xsi_set_current_line(46, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3272);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 32, 0LL);
    xsi_set_current_line(47, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3432);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 32, 0LL);
    xsi_set_current_line(48, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 2952);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 4, 0LL);

LAB1:    return;
}

static void Always_51_1(char *t0)
{
    char t13[8];
    char t28[8];
    char t31[8];
    char t44[8];
    char t57[8];
    char t73[8];
    char t81[8];
    char t120[8];
    char t121[8];
    char t125[8];
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
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t29;
    char *t30;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t58;
    char *t59;
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
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    char *t80;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    char *t85;
    char *t86;
    char *t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    char *t95;
    char *t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    char *t115;
    char *t116;
    char *t117;
    char *t118;
    int t119;
    char *t122;
    char *t123;
    char *t124;
    char *t126;
    char *t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    char *t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    char *t140;
    char *t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    char *t145;
    unsigned int t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    char *t150;
    char *t151;

LAB0:    t1 = (t0 + 4600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 5416);
    *((int *)t2) = 1;
    t3 = (t0 + 4632);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(51, ng0);

LAB5:    xsi_set_current_line(52, ng0);
    t4 = (t0 + 1752U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(58, ng0);

LAB10:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2072U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(72, ng0);

LAB32:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 3112);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t13, 0, 8);
    t5 = (t13 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 1);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 1);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 3U);
    t14 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t14 & 3U);
    t12 = ((char*)((ng3)));
    memset(t28, 0, 8);
    t26 = (t13 + 4);
    t27 = (t12 + 4);
    t15 = *((unsigned int *)t13);
    t16 = *((unsigned int *)t12);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t26);
    t19 = *((unsigned int *)t27);
    t20 = (t18 ^ t19);
    t21 = (t17 | t20);
    t22 = *((unsigned int *)t26);
    t23 = *((unsigned int *)t27);
    t24 = (t22 | t23);
    t25 = (~(t24));
    t29 = (t21 & t25);
    if (t29 != 0)
        goto LAB36;

LAB33:    if (t24 != 0)
        goto LAB35;

LAB34:    *((unsigned int *)t28) = 1;

LAB36:    memset(t31, 0, 8);
    t32 = (t28 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t28);
    t36 = (t35 & t34);
    t37 = (t36 & 1U);
    if (t37 != 0)
        goto LAB37;

LAB38:    if (*((unsigned int *)t32) != 0)
        goto LAB39;

LAB40:    t39 = (t31 + 4);
    t40 = *((unsigned int *)t31);
    t41 = (!(t40));
    t42 = *((unsigned int *)t39);
    t43 = (t41 || t42);
    if (t43 > 0)
        goto LAB41;

LAB42:    memcpy(t81, t31, 8);

LAB43:    t109 = (t81 + 4);
    t110 = *((unsigned int *)t109);
    t111 = (~(t110));
    t112 = *((unsigned int *)t81);
    t113 = (t112 & t111);
    t114 = (t113 != 0);
    if (t114 > 0)
        goto LAB55;

LAB56:    xsi_set_current_line(157, ng0);

LAB165:    xsi_set_current_line(158, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2952);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB57:
LAB13:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(52, ng0);

LAB9:    xsi_set_current_line(53, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3112);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 0LL);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3272);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3432);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2952);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB8;

LAB11:    xsi_set_current_line(59, ng0);

LAB14:    xsi_set_current_line(60, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t0 + 2952);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1912U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB18;

LAB15:    if (t18 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t13) = 1;

LAB18:    t12 = (t13 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB19;

LAB20:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1912U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB26;

LAB23:    if (t18 != 0)
        goto LAB25;

LAB24:    *((unsigned int *)t13) = 1;

LAB26:    t12 = (t13 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB27;

LAB28:    xsi_set_current_line(67, ng0);

LAB31:    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3112);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3272);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB29:
LAB21:    goto LAB13;

LAB17:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB18;

LAB19:    xsi_set_current_line(61, ng0);

LAB22:    xsi_set_current_line(62, ng0);
    t26 = (t0 + 2232U);
    t27 = *((char **)t26);
    t26 = (t0 + 3112);
    xsi_vlogvar_wait_assign_value(t26, t27, 0, 0, 32, 0LL);
    goto LAB21;

LAB25:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB26;

LAB27:    xsi_set_current_line(64, ng0);

LAB30:    xsi_set_current_line(65, ng0);
    t26 = (t0 + 2232U);
    t27 = *((char **)t26);
    t26 = (t0 + 3272);
    xsi_vlogvar_wait_assign_value(t26, t27, 0, 0, 32, 0LL);
    goto LAB29;

LAB35:    t30 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB36;

LAB37:    *((unsigned int *)t31) = 1;
    goto LAB40;

LAB39:    t38 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB40;

LAB41:    t45 = (t0 + 3112);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    memset(t44, 0, 8);
    t48 = (t44 + 4);
    t49 = (t47 + 4);
    t50 = *((unsigned int *)t47);
    t51 = (t50 >> 1);
    *((unsigned int *)t44) = t51;
    t52 = *((unsigned int *)t49);
    t53 = (t52 >> 1);
    *((unsigned int *)t48) = t53;
    t54 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t54 & 3U);
    t55 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t55 & 3U);
    t56 = ((char*)((ng2)));
    memset(t57, 0, 8);
    t58 = (t44 + 4);
    t59 = (t56 + 4);
    t60 = *((unsigned int *)t44);
    t61 = *((unsigned int *)t56);
    t62 = (t60 ^ t61);
    t63 = *((unsigned int *)t58);
    t64 = *((unsigned int *)t59);
    t65 = (t63 ^ t64);
    t66 = (t62 | t65);
    t67 = *((unsigned int *)t58);
    t68 = *((unsigned int *)t59);
    t69 = (t67 | t68);
    t70 = (~(t69));
    t71 = (t66 & t70);
    if (t71 != 0)
        goto LAB47;

LAB44:    if (t69 != 0)
        goto LAB46;

LAB45:    *((unsigned int *)t57) = 1;

LAB47:    memset(t73, 0, 8);
    t74 = (t57 + 4);
    t75 = *((unsigned int *)t74);
    t76 = (~(t75));
    t77 = *((unsigned int *)t57);
    t78 = (t77 & t76);
    t79 = (t78 & 1U);
    if (t79 != 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t74) != 0)
        goto LAB50;

LAB51:    t82 = *((unsigned int *)t31);
    t83 = *((unsigned int *)t73);
    t84 = (t82 | t83);
    *((unsigned int *)t81) = t84;
    t85 = (t31 + 4);
    t86 = (t73 + 4);
    t87 = (t81 + 4);
    t88 = *((unsigned int *)t85);
    t89 = *((unsigned int *)t86);
    t90 = (t88 | t89);
    *((unsigned int *)t87) = t90;
    t91 = *((unsigned int *)t87);
    t92 = (t91 != 0);
    if (t92 == 1)
        goto LAB52;

LAB53:
LAB54:    goto LAB43;

LAB46:    t72 = (t57 + 4);
    *((unsigned int *)t57) = 1;
    *((unsigned int *)t72) = 1;
    goto LAB47;

LAB48:    *((unsigned int *)t73) = 1;
    goto LAB51;

LAB50:    t80 = (t73 + 4);
    *((unsigned int *)t73) = 1;
    *((unsigned int *)t80) = 1;
    goto LAB51;

LAB52:    t93 = *((unsigned int *)t81);
    t94 = *((unsigned int *)t87);
    *((unsigned int *)t81) = (t93 | t94);
    t95 = (t31 + 4);
    t96 = (t73 + 4);
    t97 = *((unsigned int *)t95);
    t98 = (~(t97));
    t99 = *((unsigned int *)t31);
    t100 = (t99 & t98);
    t101 = *((unsigned int *)t96);
    t102 = (~(t101));
    t103 = *((unsigned int *)t73);
    t104 = (t103 & t102);
    t105 = (~(t100));
    t106 = (~(t104));
    t107 = *((unsigned int *)t87);
    *((unsigned int *)t87) = (t107 & t105);
    t108 = *((unsigned int *)t87);
    *((unsigned int *)t87) = (t108 & t106);
    goto LAB54;

LAB55:    xsi_set_current_line(75, ng0);

LAB58:    xsi_set_current_line(76, ng0);
    t115 = (t0 + 2952);
    t116 = (t115 + 56U);
    t117 = *((char **)t116);

LAB59:    t118 = ((char*)((ng2)));
    t119 = xsi_vlog_unsigned_case_compare(t117, 4, t118, 4);
    if (t119 == 1)
        goto LAB60;

LAB61:    t2 = ((char*)((ng5)));
    t100 = xsi_vlog_unsigned_case_compare(t117, 4, t2, 4);
    if (t100 == 1)
        goto LAB62;

LAB63:    t2 = ((char*)((ng7)));
    t100 = xsi_vlog_unsigned_case_compare(t117, 4, t2, 4);
    if (t100 == 1)
        goto LAB64;

LAB65:    t2 = ((char*)((ng6)));
    t100 = xsi_vlog_unsigned_case_compare(t117, 4, t2, 4);
    if (t100 == 1)
        goto LAB66;

LAB67:
LAB69:
LAB68:    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2952);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB70:    goto LAB57;

LAB60:    xsi_set_current_line(77, ng0);

LAB71:    xsi_set_current_line(78, ng0);
    t122 = (t0 + 3112);
    t123 = (t122 + 56U);
    t124 = *((char **)t123);
    memset(t125, 0, 8);
    t126 = (t125 + 4);
    t127 = (t124 + 4);
    t128 = *((unsigned int *)t124);
    t129 = (t128 >> 0);
    t130 = (t129 & 1);
    *((unsigned int *)t125) = t130;
    t131 = *((unsigned int *)t127);
    t132 = (t131 >> 0);
    t133 = (t132 & 1);
    *((unsigned int *)t126) = t133;
    memset(t121, 0, 8);
    t134 = (t125 + 4);
    t135 = *((unsigned int *)t134);
    t136 = (~(t135));
    t137 = *((unsigned int *)t125);
    t138 = (t137 & t136);
    t139 = (t138 & 1U);
    if (t139 != 0)
        goto LAB72;

LAB73:    if (*((unsigned int *)t134) != 0)
        goto LAB74;

LAB75:    t141 = (t121 + 4);
    t142 = *((unsigned int *)t121);
    t143 = *((unsigned int *)t141);
    t144 = (t142 || t143);
    if (t144 > 0)
        goto LAB76;

LAB77:    t146 = *((unsigned int *)t121);
    t147 = (~(t146));
    t148 = *((unsigned int *)t141);
    t149 = (t147 || t148);
    if (t149 > 0)
        goto LAB78;

LAB79:    if (*((unsigned int *)t141) > 0)
        goto LAB80;

LAB81:    if (*((unsigned int *)t121) > 0)
        goto LAB82;

LAB83:    memcpy(t120, t150, 8);

LAB84:    t151 = (t0 + 2952);
    xsi_vlogvar_wait_assign_value(t151, t120, 0, 0, 4, 0LL);
    goto LAB70;

LAB62:    xsi_set_current_line(80, ng0);

LAB85:    xsi_set_current_line(81, ng0);
    t3 = (t0 + 3112);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t13, 0, 8);
    t11 = (t13 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t13) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 0);
    t14 = (t10 & 1);
    *((unsigned int *)t11) = t14;
    t26 = (t13 + 4);
    t15 = *((unsigned int *)t26);
    t16 = (~(t15));
    t17 = *((unsigned int *)t13);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB86;

LAB87:    xsi_set_current_line(85, ng0);

LAB107:    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2952);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB88:    goto LAB70;

LAB64:    xsi_set_current_line(89, ng0);

LAB108:    xsi_set_current_line(90, ng0);
    t3 = (t0 + 3112);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t13, 0, 8);
    t11 = (t13 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t13) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 0);
    t14 = (t10 & 1);
    *((unsigned int *)t11) = t14;
    t26 = (t13 + 4);
    t15 = *((unsigned int *)t26);
    t16 = (~(t15));
    t17 = *((unsigned int *)t13);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB109;

LAB110:    xsi_set_current_line(101, ng0);

LAB142:    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2952);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB111:    goto LAB70;

LAB66:    xsi_set_current_line(105, ng0);

LAB143:    xsi_set_current_line(106, ng0);
    t3 = (t0 + 3112);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    memset(t13, 0, 8);
    t11 = (t13 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t13) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 0);
    t14 = (t10 & 1);
    *((unsigned int *)t11) = t14;
    t26 = (t13 + 4);
    t15 = *((unsigned int *)t26);
    t16 = (~(t15));
    t17 = *((unsigned int *)t13);
    t18 = (t17 & t16);
    t19 = (t18 != 0);
    if (t19 > 0)
        goto LAB144;

LAB145:
LAB146:    goto LAB70;

LAB72:    *((unsigned int *)t121) = 1;
    goto LAB75;

LAB74:    t140 = (t121 + 4);
    *((unsigned int *)t121) = 1;
    *((unsigned int *)t140) = 1;
    goto LAB75;

LAB76:    t145 = ((char*)((ng5)));
    goto LAB77;

LAB78:    t150 = ((char*)((ng2)));
    goto LAB79;

LAB80:    xsi_vlog_unsigned_bit_combine(t120, 4, t145, 4, t150, 4);
    goto LAB84;

LAB82:    memcpy(t120, t145, 8);
    goto LAB84;

LAB86:    xsi_set_current_line(81, ng0);

LAB89:    xsi_set_current_line(82, ng0);
    t27 = (t0 + 3272);
    t30 = (t27 + 56U);
    t32 = *((char **)t30);
    t38 = (t0 + 3432);
    xsi_vlogvar_wait_assign_value(t38, t32, 0, 0, 32, 0LL);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 3272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t31, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB93;

LAB90:    if (t18 != 0)
        goto LAB92;

LAB91:    *((unsigned int *)t31) = 1;

LAB93:    memset(t28, 0, 8);
    t27 = (t31 + 4);
    t21 = *((unsigned int *)t27);
    t22 = (~(t21));
    t23 = *((unsigned int *)t31);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB94;

LAB95:    if (*((unsigned int *)t27) != 0)
        goto LAB96;

LAB97:    t32 = (t28 + 4);
    t29 = *((unsigned int *)t28);
    t33 = *((unsigned int *)t32);
    t34 = (t29 || t33);
    if (t34 > 0)
        goto LAB98;

LAB99:    t35 = *((unsigned int *)t28);
    t36 = (~(t35));
    t37 = *((unsigned int *)t32);
    t40 = (t36 || t37);
    if (t40 > 0)
        goto LAB100;

LAB101:    if (*((unsigned int *)t32) > 0)
        goto LAB102;

LAB103:    if (*((unsigned int *)t28) > 0)
        goto LAB104;

LAB105:    memcpy(t13, t39, 8);

LAB106:    t45 = (t0 + 2952);
    xsi_vlogvar_wait_assign_value(t45, t13, 0, 0, 4, 0LL);
    goto LAB88;

LAB92:    t26 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB93;

LAB94:    *((unsigned int *)t28) = 1;
    goto LAB97;

LAB96:    t30 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB97;

LAB98:    t38 = ((char*)((ng6)));
    goto LAB99;

LAB100:    t39 = ((char*)((ng7)));
    goto LAB101;

LAB102:    xsi_vlog_unsigned_bit_combine(t13, 4, t38, 4, t39, 4);
    goto LAB106;

LAB104:    memcpy(t13, t38, 8);
    goto LAB106;

LAB109:    xsi_set_current_line(90, ng0);

LAB112:    xsi_set_current_line(91, ng0);
    t27 = (t0 + 3432);
    t30 = (t27 + 56U);
    t32 = *((char **)t30);
    t38 = ((char*)((ng8)));
    memset(t28, 0, 8);
    t39 = (t32 + 4);
    if (*((unsigned int *)t39) != 0)
        goto LAB114;

LAB113:    t45 = (t38 + 4);
    if (*((unsigned int *)t45) != 0)
        goto LAB114;

LAB117:    if (*((unsigned int *)t32) > *((unsigned int *)t38))
        goto LAB116;

LAB115:    *((unsigned int *)t28) = 1;

LAB116:    t47 = (t28 + 4);
    t20 = *((unsigned int *)t47);
    t21 = (~(t20));
    t22 = *((unsigned int *)t28);
    t23 = (t22 & t21);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB118;

LAB119:    xsi_set_current_line(97, ng0);

LAB141:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 3432);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 3432);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 32, 0LL);

LAB120:    goto LAB111;

LAB114:    t46 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t46) = 1;
    goto LAB116;

LAB118:    xsi_set_current_line(91, ng0);

LAB121:    xsi_set_current_line(93, ng0);
    t48 = (t0 + 3112);
    t49 = (t48 + 56U);
    t56 = *((char **)t49);
    memset(t57, 0, 8);
    t58 = (t57 + 4);
    t59 = (t56 + 4);
    t25 = *((unsigned int *)t56);
    t29 = (t25 >> 1);
    *((unsigned int *)t57) = t29;
    t33 = *((unsigned int *)t59);
    t34 = (t33 >> 1);
    *((unsigned int *)t58) = t34;
    t35 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t35 & 3U);
    t36 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t36 & 3U);
    t72 = ((char*)((ng3)));
    memset(t73, 0, 8);
    t74 = (t57 + 4);
    t80 = (t72 + 4);
    t37 = *((unsigned int *)t57);
    t40 = *((unsigned int *)t72);
    t41 = (t37 ^ t40);
    t42 = *((unsigned int *)t74);
    t43 = *((unsigned int *)t80);
    t50 = (t42 ^ t43);
    t51 = (t41 | t50);
    t52 = *((unsigned int *)t74);
    t53 = *((unsigned int *)t80);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t60 = (t51 & t55);
    if (t60 != 0)
        goto LAB125;

LAB122:    if (t54 != 0)
        goto LAB124;

LAB123:    *((unsigned int *)t73) = 1;

LAB125:    memset(t44, 0, 8);
    t86 = (t73 + 4);
    t61 = *((unsigned int *)t86);
    t62 = (~(t61));
    t63 = *((unsigned int *)t73);
    t64 = (t63 & t62);
    t65 = (t64 & 1U);
    if (t65 != 0)
        goto LAB126;

LAB127:    if (*((unsigned int *)t86) != 0)
        goto LAB128;

LAB129:    t95 = (t44 + 4);
    t66 = *((unsigned int *)t44);
    t67 = *((unsigned int *)t95);
    t68 = (t66 || t67);
    if (t68 > 0)
        goto LAB130;

LAB131:    t69 = *((unsigned int *)t44);
    t70 = (~(t69));
    t71 = *((unsigned int *)t95);
    t75 = (t70 || t71);
    if (t75 > 0)
        goto LAB132;

LAB133:    if (*((unsigned int *)t95) > 0)
        goto LAB134;

LAB135:    if (*((unsigned int *)t44) > 0)
        goto LAB136;

LAB137:    memcpy(t31, t81, 8);

LAB138:    t123 = (t0 + 3112);
    t124 = (t0 + 3112);
    t126 = (t124 + 72U);
    t127 = *((char **)t126);
    t134 = ((char*)((ng1)));
    xsi_vlog_generic_convert_bit_index(t120, t127, 2, t134, 32, 1);
    t140 = (t120 + 4);
    t84 = *((unsigned int *)t140);
    t104 = (!(t84));
    if (t104 == 1)
        goto LAB139;

LAB140:    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 2952);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 3432);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng8)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 3432);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 32, 0LL);
    goto LAB120;

LAB124:    t85 = (t73 + 4);
    *((unsigned int *)t73) = 1;
    *((unsigned int *)t85) = 1;
    goto LAB125;

LAB126:    *((unsigned int *)t44) = 1;
    goto LAB129;

LAB128:    t87 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t87) = 1;
    goto LAB129;

LAB130:    t96 = ((char*)((ng3)));
    goto LAB131;

LAB132:    t109 = (t0 + 3112);
    t115 = (t109 + 56U);
    t116 = *((char **)t115);
    memset(t81, 0, 8);
    t118 = (t81 + 4);
    t122 = (t116 + 4);
    t76 = *((unsigned int *)t116);
    t77 = (t76 >> 0);
    t78 = (t77 & 1);
    *((unsigned int *)t81) = t78;
    t79 = *((unsigned int *)t122);
    t82 = (t79 >> 0);
    t83 = (t82 & 1);
    *((unsigned int *)t118) = t83;
    goto LAB133;

LAB134:    xsi_vlog_unsigned_bit_combine(t31, 1, t96, 1, t81, 1);
    goto LAB138;

LAB136:    memcpy(t31, t96, 8);
    goto LAB138;

LAB139:    xsi_vlogvar_wait_assign_value(t123, t31, 0, *((unsigned int *)t120), 1, 0LL);
    goto LAB140;

LAB144:    xsi_set_current_line(106, ng0);

LAB147:    xsi_set_current_line(107, ng0);
    t27 = (t0 + 3272);
    t30 = (t27 + 56U);
    t32 = *((char **)t30);
    t38 = (t0 + 3432);
    xsi_vlogvar_wait_assign_value(t38, t32, 0, 0, 32, 0LL);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 3272);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t31, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB151;

LAB148:    if (t18 != 0)
        goto LAB150;

LAB149:    *((unsigned int *)t31) = 1;

LAB151:    memset(t28, 0, 8);
    t27 = (t31 + 4);
    t21 = *((unsigned int *)t27);
    t22 = (~(t21));
    t23 = *((unsigned int *)t31);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB152;

LAB153:    if (*((unsigned int *)t27) != 0)
        goto LAB154;

LAB155:    t32 = (t28 + 4);
    t29 = *((unsigned int *)t28);
    t33 = *((unsigned int *)t32);
    t34 = (t29 || t33);
    if (t34 > 0)
        goto LAB156;

LAB157:    t35 = *((unsigned int *)t28);
    t36 = (~(t35));
    t37 = *((unsigned int *)t32);
    t40 = (t36 || t37);
    if (t40 > 0)
        goto LAB158;

LAB159:    if (*((unsigned int *)t32) > 0)
        goto LAB160;

LAB161:    if (*((unsigned int *)t28) > 0)
        goto LAB162;

LAB163:    memcpy(t13, t39, 8);

LAB164:    t45 = (t0 + 2952);
    xsi_vlogvar_wait_assign_value(t45, t13, 0, 0, 4, 0LL);
    goto LAB146;

LAB150:    t26 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB151;

LAB152:    *((unsigned int *)t28) = 1;
    goto LAB155;

LAB154:    t30 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB155;

LAB156:    t38 = ((char*)((ng6)));
    goto LAB157;

LAB158:    t39 = ((char*)((ng7)));
    goto LAB159;

LAB160:    xsi_vlog_unsigned_bit_combine(t13, 4, t38, 4, t39, 4);
    goto LAB164;

LAB162:    memcpy(t13, t38, 8);
    goto LAB164;

}

static void Cont_164_2(char *t0)
{
    char t6[8];
    char t22[8];
    char t37[8];
    char t46[8];
    char t54[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
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
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    char *t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    int t78;
    int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    char *t86;
    char *t87;
    char *t88;
    char *t89;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;

LAB0:    t1 = (t0 + 4848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(164, ng0);
    t2 = (t0 + 2952);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    t8 = (t5 + 4);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
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

LAB7:    memset(t22, 0, 8);
    t23 = (t6 + 4);
    t24 = *((unsigned int *)t23);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (t26 & t25);
    t28 = (t27 & 1U);
    if (t28 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t23) != 0)
        goto LAB10;

LAB11:    t30 = (t22 + 4);
    t31 = *((unsigned int *)t22);
    t32 = *((unsigned int *)t30);
    t33 = (t31 || t32);
    if (t33 > 0)
        goto LAB12;

LAB13:    memcpy(t54, t22, 8);

LAB14:    t86 = (t0 + 5528);
    t87 = (t86 + 56U);
    t88 = *((char **)t87);
    t89 = (t88 + 56U);
    t90 = *((char **)t89);
    memset(t90, 0, 8);
    t91 = 1U;
    t92 = t91;
    t93 = (t54 + 4);
    t94 = *((unsigned int *)t54);
    t91 = (t91 & t94);
    t95 = *((unsigned int *)t93);
    t92 = (t92 & t95);
    t96 = (t90 + 4);
    t97 = *((unsigned int *)t90);
    *((unsigned int *)t90) = (t97 | t91);
    t98 = *((unsigned int *)t96);
    *((unsigned int *)t96) = (t98 | t92);
    xsi_driver_vfirst_trans(t86, 0, 0);
    t99 = (t0 + 5432);
    *((int *)t99) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t22) = 1;
    goto LAB11;

LAB10:    t29 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB11;

LAB12:    t34 = (t0 + 3112);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    memset(t37, 0, 8);
    t38 = (t37 + 4);
    t39 = (t36 + 4);
    t40 = *((unsigned int *)t36);
    t41 = (t40 >> 3);
    t42 = (t41 & 1);
    *((unsigned int *)t37) = t42;
    t43 = *((unsigned int *)t39);
    t44 = (t43 >> 3);
    t45 = (t44 & 1);
    *((unsigned int *)t38) = t45;
    memset(t46, 0, 8);
    t47 = (t37 + 4);
    t48 = *((unsigned int *)t47);
    t49 = (~(t48));
    t50 = *((unsigned int *)t37);
    t51 = (t50 & t49);
    t52 = (t51 & 1U);
    if (t52 != 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t47) != 0)
        goto LAB17;

LAB18:    t55 = *((unsigned int *)t22);
    t56 = *((unsigned int *)t46);
    t57 = (t55 & t56);
    *((unsigned int *)t54) = t57;
    t58 = (t22 + 4);
    t59 = (t46 + 4);
    t60 = (t54 + 4);
    t61 = *((unsigned int *)t58);
    t62 = *((unsigned int *)t59);
    t63 = (t61 | t62);
    *((unsigned int *)t60) = t63;
    t64 = *((unsigned int *)t60);
    t65 = (t64 != 0);
    if (t65 == 1)
        goto LAB19;

LAB20:
LAB21:    goto LAB14;

LAB15:    *((unsigned int *)t46) = 1;
    goto LAB18;

LAB17:    t53 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t53) = 1;
    goto LAB18;

LAB19:    t66 = *((unsigned int *)t54);
    t67 = *((unsigned int *)t60);
    *((unsigned int *)t54) = (t66 | t67);
    t68 = (t22 + 4);
    t69 = (t46 + 4);
    t70 = *((unsigned int *)t22);
    t71 = (~(t70));
    t72 = *((unsigned int *)t68);
    t73 = (~(t72));
    t74 = *((unsigned int *)t46);
    t75 = (~(t74));
    t76 = *((unsigned int *)t69);
    t77 = (~(t76));
    t78 = (t71 & t73);
    t79 = (t75 & t77);
    t80 = (~(t78));
    t81 = (~(t79));
    t82 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t82 & t80);
    t83 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t83 & t81);
    t84 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t84 & t80);
    t85 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t85 & t81);
    goto LAB21;

}

static void Cont_166_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t40[8];
    char t41[8];
    char t44[8];
    char t78[8];
    char t79[8];
    char t82[8];
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
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t42;
    char *t43;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t80;
    char *t81;
    char *t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    char *t97;
    char *t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    char *t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    char *t110;
    char *t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    char *t116;
    char *t117;
    char *t118;
    char *t119;
    char *t120;
    char *t121;
    char *t122;

LAB0:    t1 = (t0 + 5096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(166, ng0);
    t2 = (t0 + 1912U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
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

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t29);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t117 = (t0 + 5592);
    t118 = (t117 + 56U);
    t119 = *((char **)t118);
    t120 = (t119 + 56U);
    t121 = *((char **)t120);
    memcpy(t121, t3, 8);
    xsi_driver_vfirst_trans(t117, 0, 31);
    t122 = (t0 + 5448);
    *((int *)t122) = 1;

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

LAB12:    t33 = (t0 + 3112);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    goto LAB13;

LAB14:    t42 = (t0 + 1912U);
    t43 = *((char **)t42);
    t42 = ((char*)((ng2)));
    memset(t44, 0, 8);
    t45 = (t43 + 4);
    t46 = (t42 + 4);
    t47 = *((unsigned int *)t43);
    t48 = *((unsigned int *)t42);
    t49 = (t47 ^ t48);
    t50 = *((unsigned int *)t45);
    t51 = *((unsigned int *)t46);
    t52 = (t50 ^ t51);
    t53 = (t49 | t52);
    t54 = *((unsigned int *)t45);
    t55 = *((unsigned int *)t46);
    t56 = (t54 | t55);
    t57 = (~(t56));
    t58 = (t53 & t57);
    if (t58 != 0)
        goto LAB24;

LAB21:    if (t56 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t44) = 1;

LAB24:    memset(t41, 0, 8);
    t60 = (t44 + 4);
    t61 = *((unsigned int *)t60);
    t62 = (~(t61));
    t63 = *((unsigned int *)t44);
    t64 = (t63 & t62);
    t65 = (t64 & 1U);
    if (t65 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t60) != 0)
        goto LAB27;

LAB28:    t67 = (t41 + 4);
    t68 = *((unsigned int *)t41);
    t69 = *((unsigned int *)t67);
    t70 = (t68 || t69);
    if (t70 > 0)
        goto LAB29;

LAB30:    t74 = *((unsigned int *)t41);
    t75 = (~(t74));
    t76 = *((unsigned int *)t67);
    t77 = (t75 || t76);
    if (t77 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t67) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t41) > 0)
        goto LAB35;

LAB36:    memcpy(t40, t78, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t35, 32, t40, 32);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

LAB23:    t59 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t41) = 1;
    goto LAB28;

LAB27:    t66 = (t41 + 4);
    *((unsigned int *)t41) = 1;
    *((unsigned int *)t66) = 1;
    goto LAB28;

LAB29:    t71 = (t0 + 3272);
    t72 = (t71 + 56U);
    t73 = *((char **)t72);
    goto LAB30;

LAB31:    t80 = (t0 + 1912U);
    t81 = *((char **)t80);
    t80 = ((char*)((ng5)));
    memset(t82, 0, 8);
    t83 = (t81 + 4);
    t84 = (t80 + 4);
    t85 = *((unsigned int *)t81);
    t86 = *((unsigned int *)t80);
    t87 = (t85 ^ t86);
    t88 = *((unsigned int *)t83);
    t89 = *((unsigned int *)t84);
    t90 = (t88 ^ t89);
    t91 = (t87 | t90);
    t92 = *((unsigned int *)t83);
    t93 = *((unsigned int *)t84);
    t94 = (t92 | t93);
    t95 = (~(t94));
    t96 = (t91 & t95);
    if (t96 != 0)
        goto LAB41;

LAB38:    if (t94 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t82) = 1;

LAB41:    memset(t79, 0, 8);
    t98 = (t82 + 4);
    t99 = *((unsigned int *)t98);
    t100 = (~(t99));
    t101 = *((unsigned int *)t82);
    t102 = (t101 & t100);
    t103 = (t102 & 1U);
    if (t103 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t98) != 0)
        goto LAB44;

LAB45:    t105 = (t79 + 4);
    t106 = *((unsigned int *)t79);
    t107 = *((unsigned int *)t105);
    t108 = (t106 || t107);
    if (t108 > 0)
        goto LAB46;

LAB47:    t112 = *((unsigned int *)t79);
    t113 = (~(t112));
    t114 = *((unsigned int *)t105);
    t115 = (t113 || t114);
    if (t115 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t105) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t79) > 0)
        goto LAB52;

LAB53:    memcpy(t78, t116, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t40, 32, t73, 32, t78, 32);
    goto LAB37;

LAB35:    memcpy(t40, t73, 8);
    goto LAB37;

LAB40:    t97 = (t82 + 4);
    *((unsigned int *)t82) = 1;
    *((unsigned int *)t97) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t79) = 1;
    goto LAB45;

LAB44:    t104 = (t79 + 4);
    *((unsigned int *)t79) = 1;
    *((unsigned int *)t104) = 1;
    goto LAB45;

LAB46:    t109 = (t0 + 3432);
    t110 = (t109 + 56U);
    t111 = *((char **)t110);
    goto LAB47;

LAB48:    t116 = ((char*)((ng4)));
    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t78, 32, t111, 32, t116, 32);
    goto LAB54;

LAB52:    memcpy(t78, t111, 8);
    goto LAB54;

}


extern void work_m_00000000003645032289_1678943863_init()
{
	static char *pe[] = {(void *)Initial_44_0,(void *)Always_51_1,(void *)Cont_164_2,(void *)Cont_166_3};
	xsi_register_didat("work_m_00000000003645032289_1678943863", "isim/timer_tb_isim_beh.exe.sim/work/m_00000000003645032289_1678943863.didat");
	xsi_register_executes(pe);
}
