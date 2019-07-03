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
static const char *ng0 = "D:/ise_project/P4/NPC.v";
static int ng1[] = {4, 0};
static int ng2[] = {16, 0};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {3U, 0U};



static void Cont_32_0(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 32, t3, 32, t2, 32);
    t5 = (t0 + 4256);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 4144);
    *((int *)t10) = 1;

LAB1:    return;
}

static void Cont_36_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t13[8];
    char t17[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;

LAB0:    t1 = (t0 + 3576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1208U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t4 + 4);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 0);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t6);
    t10 = (t9 >> 0);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 65535U);
    t12 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t12 & 65535U);
    t14 = ((char*)((ng2)));
    t15 = (t0 + 1208U);
    t16 = *((char **)t15);
    memset(t17, 0, 8);
    t15 = (t17 + 4);
    t18 = (t16 + 4);
    t19 = *((unsigned int *)t16);
    t20 = (t19 >> 15);
    t21 = (t20 & 1);
    *((unsigned int *)t17) = t21;
    t22 = *((unsigned int *)t18);
    t23 = (t22 >> 15);
    t24 = (t23 & 1);
    *((unsigned int *)t15) = t24;
    xsi_vlog_mul_concat(t13, 16, 1, t14, 1U, t17, 1);
    xsi_vlogtype_concat(t3, 32, 32, 2U, t13, 16, t4, 16);
    t25 = (t0 + 4320);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t3, 8);
    xsi_driver_vfirst_trans(t25, 0, 31);
    t30 = (t0 + 4160);
    *((int *)t30) = 1;

LAB1:    return;
}

static void Cont_38_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t39[8];
    char t40[8];
    char t42[8];
    char t69[8];
    char t73[8];
    char t86[8];
    char t87[8];
    char t90[8];
    char t123[8];
    char t124[8];
    char t126[8];
    char t142[8];
    char t156[8];
    char t163[8];
    char t208[8];
    char t209[8];
    char t219[8];
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
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
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
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t70;
    char *t71;
    char *t72;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    char *t88;
    char *t89;
    char *t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    char *t112;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    char *t117;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t125;
    char *t127;
    char *t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    char *t141;
    char *t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    unsigned int t148;
    char *t149;
    char *t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    char *t154;
    char *t155;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    unsigned int t160;
    unsigned int t161;
    char *t162;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    char *t167;
    char *t168;
    char *t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    unsigned int t175;
    unsigned int t176;
    char *t177;
    char *t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    unsigned int t183;
    unsigned int t184;
    unsigned int t185;
    unsigned int t186;
    int t187;
    int t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    unsigned int t192;
    unsigned int t193;
    unsigned int t194;
    char *t195;
    unsigned int t196;
    unsigned int t197;
    unsigned int t198;
    unsigned int t199;
    unsigned int t200;
    char *t201;
    char *t202;
    unsigned int t203;
    unsigned int t204;
    unsigned int t205;
    char *t206;
    char *t207;
    char *t210;
    char *t211;
    char *t212;
    unsigned int t213;
    unsigned int t214;
    unsigned int t215;
    unsigned int t216;
    unsigned int t217;
    unsigned int t218;
    unsigned int t220;
    unsigned int t221;
    unsigned int t222;
    unsigned int t223;
    char *t224;
    char *t225;
    char *t226;
    char *t227;
    char *t228;
    char *t229;
    char *t230;

LAB0:    t1 = (t0 + 3824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1528U);
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

LAB13:    t35 = *((unsigned int *)t4);
    t36 = (~(t35));
    t37 = *((unsigned int *)t29);
    t38 = (t36 || t37);
    if (t38 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t39, 8);

LAB20:    t224 = (t0 + 4384);
    t226 = (t224 + 56U);
    t227 = *((char **)t226);
    t228 = (t227 + 56U);
    t229 = *((char **)t228);
    memcpy(t229, t3, 8);
    xsi_driver_vfirst_trans(t224, 0, 31);
    t230 = (t0 + 4176);
    *((int *)t230) = 1;

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

LAB12:    t33 = (t0 + 2008U);
    t34 = *((char **)t33);
    goto LAB13;

LAB14:    t33 = (t0 + 1528U);
    t41 = *((char **)t33);
    t33 = ((char*)((ng4)));
    memset(t42, 0, 8);
    t43 = (t41 + 4);
    t44 = (t33 + 4);
    t45 = *((unsigned int *)t41);
    t46 = *((unsigned int *)t33);
    t47 = (t45 ^ t46);
    t48 = *((unsigned int *)t43);
    t49 = *((unsigned int *)t44);
    t50 = (t48 ^ t49);
    t51 = (t47 | t50);
    t52 = *((unsigned int *)t43);
    t53 = *((unsigned int *)t44);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t56 = (t51 & t55);
    if (t56 != 0)
        goto LAB24;

LAB21:    if (t54 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t42) = 1;

LAB24:    memset(t40, 0, 8);
    t58 = (t42 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t42);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t58) != 0)
        goto LAB27;

LAB28:    t65 = (t40 + 4);
    t66 = *((unsigned int *)t40);
    t67 = *((unsigned int *)t65);
    t68 = (t66 || t67);
    if (t68 > 0)
        goto LAB29;

LAB30:    t82 = *((unsigned int *)t40);
    t83 = (~(t82));
    t84 = *((unsigned int *)t65);
    t85 = (t83 || t84);
    if (t85 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t65) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t40) > 0)
        goto LAB35;

LAB36:    memcpy(t39, t86, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t34, 32, t39, 32);
    goto LAB20;

LAB18:    memcpy(t3, t34, 8);
    goto LAB20;

LAB23:    t57 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t40) = 1;
    goto LAB28;

LAB27:    t64 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t64) = 1;
    goto LAB28;

LAB29:    t70 = ((char*)((ng3)));
    t71 = (t0 + 1208U);
    t72 = *((char **)t71);
    t71 = (t0 + 1048U);
    t74 = *((char **)t71);
    memset(t73, 0, 8);
    t71 = (t73 + 4);
    t75 = (t74 + 4);
    t76 = *((unsigned int *)t74);
    t77 = (t76 >> 28);
    *((unsigned int *)t73) = t77;
    t78 = *((unsigned int *)t75);
    t79 = (t78 >> 28);
    *((unsigned int *)t71) = t79;
    t80 = *((unsigned int *)t73);
    *((unsigned int *)t73) = (t80 & 15U);
    t81 = *((unsigned int *)t71);
    *((unsigned int *)t71) = (t81 & 15U);
    xsi_vlogtype_concat(t69, 32, 32, 3U, t73, 4, t72, 26, t70, 2);
    goto LAB30;

LAB31:    t88 = (t0 + 1528U);
    t89 = *((char **)t88);
    t88 = ((char*)((ng5)));
    memset(t90, 0, 8);
    t91 = (t89 + 4);
    t92 = (t88 + 4);
    t93 = *((unsigned int *)t89);
    t94 = *((unsigned int *)t88);
    t95 = (t93 ^ t94);
    t96 = *((unsigned int *)t91);
    t97 = *((unsigned int *)t92);
    t98 = (t96 ^ t97);
    t99 = (t95 | t98);
    t100 = *((unsigned int *)t91);
    t101 = *((unsigned int *)t92);
    t102 = (t100 | t101);
    t103 = (~(t102));
    t104 = (t99 & t103);
    if (t104 != 0)
        goto LAB41;

LAB38:    if (t102 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t90) = 1;

LAB41:    memset(t87, 0, 8);
    t106 = (t90 + 4);
    t107 = *((unsigned int *)t106);
    t108 = (~(t107));
    t109 = *((unsigned int *)t90);
    t110 = (t109 & t108);
    t111 = (t110 & 1U);
    if (t111 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t106) != 0)
        goto LAB44;

LAB45:    t113 = (t87 + 4);
    t114 = *((unsigned int *)t87);
    t115 = *((unsigned int *)t113);
    t116 = (t114 || t115);
    if (t116 > 0)
        goto LAB46;

LAB47:    t119 = *((unsigned int *)t87);
    t120 = (~(t119));
    t121 = *((unsigned int *)t113);
    t122 = (t120 || t121);
    if (t122 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t113) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t87) > 0)
        goto LAB52;

LAB53:    memcpy(t86, t123, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t39, 32, t69, 32, t86, 32);
    goto LAB37;

LAB35:    memcpy(t39, t69, 8);
    goto LAB37;

LAB40:    t105 = (t90 + 4);
    *((unsigned int *)t90) = 1;
    *((unsigned int *)t105) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t87) = 1;
    goto LAB45;

LAB44:    t112 = (t87 + 4);
    *((unsigned int *)t87) = 1;
    *((unsigned int *)t112) = 1;
    goto LAB45;

LAB46:    t117 = (t0 + 1368U);
    t118 = *((char **)t117);
    goto LAB47;

LAB48:    t117 = (t0 + 1528U);
    t125 = *((char **)t117);
    t117 = ((char*)((ng6)));
    memset(t126, 0, 8);
    t127 = (t125 + 4);
    t128 = (t117 + 4);
    t129 = *((unsigned int *)t125);
    t130 = *((unsigned int *)t117);
    t131 = (t129 ^ t130);
    t132 = *((unsigned int *)t127);
    t133 = *((unsigned int *)t128);
    t134 = (t132 ^ t133);
    t135 = (t131 | t134);
    t136 = *((unsigned int *)t127);
    t137 = *((unsigned int *)t128);
    t138 = (t136 | t137);
    t139 = (~(t138));
    t140 = (t135 & t139);
    if (t140 != 0)
        goto LAB58;

LAB55:    if (t138 != 0)
        goto LAB57;

LAB56:    *((unsigned int *)t126) = 1;

LAB58:    memset(t142, 0, 8);
    t143 = (t126 + 4);
    t144 = *((unsigned int *)t143);
    t145 = (~(t144));
    t146 = *((unsigned int *)t126);
    t147 = (t146 & t145);
    t148 = (t147 & 1U);
    if (t148 != 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t143) != 0)
        goto LAB61;

LAB62:    t150 = (t142 + 4);
    t151 = *((unsigned int *)t142);
    t152 = *((unsigned int *)t150);
    t153 = (t151 || t152);
    if (t153 > 0)
        goto LAB63;

LAB64:    memcpy(t163, t142, 8);

LAB65:    memset(t124, 0, 8);
    t195 = (t163 + 4);
    t196 = *((unsigned int *)t195);
    t197 = (~(t196));
    t198 = *((unsigned int *)t163);
    t199 = (t198 & t197);
    t200 = (t199 & 1U);
    if (t200 != 0)
        goto LAB73;

LAB74:    if (*((unsigned int *)t195) != 0)
        goto LAB75;

LAB76:    t202 = (t124 + 4);
    t203 = *((unsigned int *)t124);
    t204 = *((unsigned int *)t202);
    t205 = (t203 || t204);
    if (t205 > 0)
        goto LAB77;

LAB78:    t220 = *((unsigned int *)t124);
    t221 = (~(t220));
    t222 = *((unsigned int *)t202);
    t223 = (t221 || t222);
    if (t223 > 0)
        goto LAB79;

LAB80:    if (*((unsigned int *)t202) > 0)
        goto LAB81;

LAB82:    if (*((unsigned int *)t124) > 0)
        goto LAB83;

LAB84:    memcpy(t123, t225, 8);

LAB85:    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t86, 32, t118, 32, t123, 32);
    goto LAB54;

LAB52:    memcpy(t86, t118, 8);
    goto LAB54;

LAB57:    t141 = (t126 + 4);
    *((unsigned int *)t126) = 1;
    *((unsigned int *)t141) = 1;
    goto LAB58;

LAB59:    *((unsigned int *)t142) = 1;
    goto LAB62;

LAB61:    t149 = (t142 + 4);
    *((unsigned int *)t142) = 1;
    *((unsigned int *)t149) = 1;
    goto LAB62;

LAB63:    t154 = (t0 + 1688U);
    t155 = *((char **)t154);
    memset(t156, 0, 8);
    t154 = (t155 + 4);
    t157 = *((unsigned int *)t154);
    t158 = (~(t157));
    t159 = *((unsigned int *)t155);
    t160 = (t159 & t158);
    t161 = (t160 & 1U);
    if (t161 != 0)
        goto LAB66;

LAB67:    if (*((unsigned int *)t154) != 0)
        goto LAB68;

LAB69:    t164 = *((unsigned int *)t142);
    t165 = *((unsigned int *)t156);
    t166 = (t164 & t165);
    *((unsigned int *)t163) = t166;
    t167 = (t142 + 4);
    t168 = (t156 + 4);
    t169 = (t163 + 4);
    t170 = *((unsigned int *)t167);
    t171 = *((unsigned int *)t168);
    t172 = (t170 | t171);
    *((unsigned int *)t169) = t172;
    t173 = *((unsigned int *)t169);
    t174 = (t173 != 0);
    if (t174 == 1)
        goto LAB70;

LAB71:
LAB72:    goto LAB65;

LAB66:    *((unsigned int *)t156) = 1;
    goto LAB69;

LAB68:    t162 = (t156 + 4);
    *((unsigned int *)t156) = 1;
    *((unsigned int *)t162) = 1;
    goto LAB69;

LAB70:    t175 = *((unsigned int *)t163);
    t176 = *((unsigned int *)t169);
    *((unsigned int *)t163) = (t175 | t176);
    t177 = (t142 + 4);
    t178 = (t156 + 4);
    t179 = *((unsigned int *)t142);
    t180 = (~(t179));
    t181 = *((unsigned int *)t177);
    t182 = (~(t181));
    t183 = *((unsigned int *)t156);
    t184 = (~(t183));
    t185 = *((unsigned int *)t178);
    t186 = (~(t185));
    t187 = (t180 & t182);
    t188 = (t184 & t186);
    t189 = (~(t187));
    t190 = (~(t188));
    t191 = *((unsigned int *)t169);
    *((unsigned int *)t169) = (t191 & t189);
    t192 = *((unsigned int *)t169);
    *((unsigned int *)t169) = (t192 & t190);
    t193 = *((unsigned int *)t163);
    *((unsigned int *)t163) = (t193 & t189);
    t194 = *((unsigned int *)t163);
    *((unsigned int *)t163) = (t194 & t190);
    goto LAB72;

LAB73:    *((unsigned int *)t124) = 1;
    goto LAB76;

LAB75:    t201 = (t124 + 4);
    *((unsigned int *)t124) = 1;
    *((unsigned int *)t201) = 1;
    goto LAB76;

LAB77:    t206 = (t0 + 2008U);
    t207 = *((char **)t206);
    t206 = ((char*)((ng3)));
    t210 = (t0 + 2168U);
    t211 = *((char **)t210);
    memset(t209, 0, 8);
    t210 = (t209 + 4);
    t212 = (t211 + 4);
    t213 = *((unsigned int *)t211);
    t214 = (t213 >> 0);
    *((unsigned int *)t209) = t214;
    t215 = *((unsigned int *)t212);
    t216 = (t215 >> 0);
    *((unsigned int *)t210) = t216;
    t217 = *((unsigned int *)t209);
    *((unsigned int *)t209) = (t217 & 1073741823U);
    t218 = *((unsigned int *)t210);
    *((unsigned int *)t210) = (t218 & 1073741823U);
    xsi_vlogtype_concat(t208, 32, 32, 2U, t209, 30, t206, 2);
    memset(t219, 0, 8);
    xsi_vlog_unsigned_add(t219, 32, t207, 32, t208, 32);
    goto LAB78;

LAB79:    t224 = (t0 + 2008U);
    t225 = *((char **)t224);
    goto LAB80;

LAB81:    xsi_vlog_unsigned_bit_combine(t123, 32, t219, 32, t225, 32);
    goto LAB85;

LAB83:    memcpy(t123, t219, 8);
    goto LAB85;

}


extern void work_m_00000000001238163984_0757879789_init()
{
	static char *pe[] = {(void *)Cont_32_0,(void *)Cont_36_1,(void *)Cont_38_2};
	xsi_register_didat("work_m_00000000001238163984_0757879789", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000001238163984_0757879789.didat");
	xsi_register_executes(pe);
}
