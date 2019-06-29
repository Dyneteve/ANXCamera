package com.mi.config;

import java.util.HashMap;

class FeatureParserWrapper$1 extends HashMap<String, String> {
    FeatureParserWrapper$1() {
        put(d.wR, "o_0x00_s_s_l");
        put(d.wa, "o_0x01_r_p_s_f");
        put(d.vm, "o_0x02_soc_vendor");
        put(d.wW, "o_0x03_support_3d_face_beauty");
        put(d.wX, "o_0x04_support_mi_face_beauty");
        put(d.wI, "o_0x05_is_support_optical_zoom");
        put(d.vW, "o_0x06_is_support_peaking_mf");
        put(d.xa, "o_0x08_is_support_dynamic_light_spot");
        put(d.vG, "o_0x07_support_hfr");
        put(d.vw, "o_0x08_support_movie_solid");
        put(d.we, "o_0x09_support_tilt_shift");
        put(d.vX, "o_0x10_support_gradienter");
        put(d.xd, "o_0x11_picture_water_mark");
        put(d.wf, "o_0x12_magic_mirror");
        put(d.vy, "o_0x13_age_detection");
        put(d.vv, "o_0x14_burst_count");
        put(d.vn, "o_0x15_support_dual_sd_card");
    }

    public String put(String str, String str2) {
        if (str2 == null || !str2.startsWith("o_0x")) {
            StringBuilder sb = new StringBuilder();
            sb.append("The key \"");
            sb.append(str);
            sb.append("\" must be mapped to non-null string starting with \"o_0x\"");
            throw new IllegalStateException(sb.toString());
        }
        String str3 = (String) super.put(str, str2);
        if (str3 == null) {
            return null;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("The key \"");
        sb2.append(str);
        sb2.append("\" has already be mapped to \"");
        sb2.append(str3);
        sb2.append("\"");
        throw new IllegalStateException(sb2.toString());
    }
}
