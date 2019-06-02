package com.mi.config;

import com.android.camera.data.DataRepository;
import java.util.Collections;
import java.util.Map;
import miui.util.FeatureParser;

@Deprecated
/* compiled from: FeatureParserWrapper */
public class d {
    public static final String rU = "camera_supported_asd";
    public static final String rX = "support_zoom_mfnr";
    public static final String tY = "is_xiaomi";
    public static final String tZ = "is_hongmi";
    public static final String uA = "camera_supported_scene";
    public static final String uB = "camera_supported_ai_scene";
    public static final String uC = "support_camera_audio_focus";
    public static final String uD = "is_camera_use_morpho_lib";
    public static final String uE = "is_camera_replace_higher_cost_effect";
    public static final String uF = "support_camera_manual_function";
    public static final String uG = "support_camera_press_down_capture";
    public static final String uH = "support_camera_torch_capture";
    public static final String uI = "is_camera_freeze_after_hdr_capture";
    public static final String uJ = "is_camera_face_detection_need_orientation";
    public static final String uK = "is_camera_hold_blur_background";
    public static final String uL = "support_camera_peaking_mf";
    public static final String uM = "support_camera_gradienter";
    public static final String uN = "is_camera_lower_qrscan_frequency";
    public static final String uO = "is_camera_preview_with_subthread_looper";
    public static final String uP = "camera_reduce_preview_flag";
    public static final String uQ = "camera_focus_success_flag";
    public static final String uR = "camera_exposure_compensation_steps_num";
    public static final String uS = "is_camera_app_water_mark";
    public static final String uT = "support_camera_tilt_shift";
    public static final String uU = "support_camera_magic_mirror";
    public static final String uV = "support_camera_quick_snap";
    public static final String uW = "camera_front_count_down_margin";
    public static final String uX = "support_camera_groupshot";
    public static final String uY = "is_full_size_effect";
    public static final String uZ = "support_camera_face_info_water_mark";
    public static final String ua = "is_pad";
    public static final String ub = "vendor";
    public static final String uc = "support_dual_sd_card";
    public static final String ud = "support_edge_handgrip";
    public static final String ue = "camera_continuous_shot_callback_class";
    public static final String uf = "camera_continuous_shot_callback_setter";
    public static final String ug = "fp_nav_event_name_list";
    public static final String uh = "support_camera_shader_effect";
    public static final String ui = "support_camera_burst_shoot";
    public static final String uj = "support_camera_burst_shoot_denoise";
    public static final String uk = "burst_shoot_count";
    public static final String ul = "support_camera_movie_solid";
    public static final String um = "support_camera_skin_beauty";
    public static final String un = "support_camera_age_detection";
    public static final String uo = "support_camera_record_location";
    public static final String up = "support_camera_water_mark";
    public static final String uq = "support_camera_new_style_time_water_mark";
    public static final String ur = "support_camera_video_pause";
    public static final String us = "support_camera_boost_brightness";
    public static final String ut = "is_lower_size_effect";
    public static final String uu = "support_camera_aohdr";
    public static final String uv = "support_camera_hfr";
    public static final String uw = "support_chroma_flash";
    public static final String ux = "support_object_track";
    public static final String uy = "support_camera_4k_quality";
    public static final String uz = "support_camera_ubifocus";
    public static final String vA = "is_rgb888_egl_prefer";
    public static final String vB = "is_legacy_face_beauty";
    public static final String vC = "use_legacy_normal_filter";
    public static final String vD = "camera_hibernation_timeout_in_minutes";
    public static final String vE = "support_front_hht_enhance";
    public static final String vF = "support_screen_light";
    public static final String vG = "support_parallel_process";
    public static final String vH = "support_psensor_pocket_mode";
    public static final String vI = "support_front_beauty_mfnr";
    public static final String vJ = "support_video_hfr_mode";
    public static final String vK = "support_3d_face_beauty";
    public static final String vL = "support_mi_face_beauty";
    public static final String vM = "support_lens_dirty_detect";
    public static final String vN = "enable_algorithm_in_file_suffix";
    public static final String vO = "support_camera_dynamic_light_spot";
    public static final String vP = "support_super_resolution";
    public static final String vQ = "support_realtime_manual_exposure_time";
    public static final String vR = "support_picture_watermark";
    public static final String vS = "sensor_has_latency";
    private static final Map<String, String> vT = Collections.unmodifiableMap(new FeatureParserWrapper$1());
    public static final String va = "support_camera_square_mode";
    public static final String vb = "is_camera_use_still_effect_image";
    public static final String vc = "support_front_flash";
    public static final String vd = "support_video_front_flash";
    public static final String ve = "is_camera_isp_rotated";
    public static final String vf = "support_full_size_panorama";
    public static final String vg = "support_hfr_video_pause";
    public static final String vh = "is_front_remosic_sensor";
    public static final String vi = "front_fingerprint_sensor";
    public static final String vj = "cmcc_strategic_phone";
    public static final String vk = "is_need_force_recycle_effect";
    public static final String vl = "is_18x9_ratio_screen";
    public static final String vm = "camera_extra_picture_size";
    public static final String vn = "is_support_tele_asd_night";
    public static final String vo = "is_front_video_quality_1080p";
    public static final String vp = "is_capture_stop_face_detection";
    public static final String vq = "is_video_snapshot_size_limit";
    public static final String vr = "is_surface_size_limit";
    public static final String vs = "is_hal_does_caf_when_flash_on";
    public static final String vt = "is_new_hdr_param_key_used";
    public static final String vu = "is_hrf_video_capture_support";
    public static final String vv = "is_support_stereo";
    public static final String vw = "is_support_optical_zoom";
    public static final String vx = "is_support_portrait";
    public static final String vy = "camera_is_support_portrait_front";
    public static final String vz = "is_support_fhd_fhr";

    private static String M(String str) {
        return (String) vT.get(str);
    }

    public static boolean getBoolean(String str, boolean z) {
        String M = M(str);
        return (M == null || !DataRepository.dataItemFeature().K(M)) ? FeatureParser.getBoolean(str, z) : DataRepository.dataItemFeature().getBoolean(M, z);
    }

    public static Float getFloat(String str, float f) {
        String M = M(str);
        return (M == null || !DataRepository.dataItemFeature().K(M)) ? FeatureParser.getFloat(str, f) : Float.valueOf(DataRepository.dataItemFeature().getFloat(M, f));
    }

    public static int getInteger(String str, int i) {
        String M = M(str);
        return (M == null || !DataRepository.dataItemFeature().K(M)) ? FeatureParser.getInteger(str, i) : DataRepository.dataItemFeature().getInt(M, i);
    }

    public static String getString(String str) {
        String M = M(str);
        return (M == null || !DataRepository.dataItemFeature().K(M)) ? FeatureParser.getString(str) : DataRepository.dataItemFeature().getString(M, "N/A");
    }

    public static String[] getStringArray(String str) {
        return FeatureParser.getStringArray(str);
    }
}
