package com.mi.config;

import com.android.camera.data.DataRepository;
import java.util.Collections;
import java.util.Map;
import miui.util.FeatureParser;

@Deprecated
/* compiled from: FeatureParserWrapper */
public class d {
    public static final String rS = "camera_supported_asd";
    public static final String rV = "support_zoom_mfnr";
    public static final String tP = "is_xiaomi";
    public static final String tQ = "is_hongmi";
    public static final String tR = "is_pad";
    public static final String tS = "vendor";
    public static final String tT = "support_dual_sd_card";
    public static final String tU = "support_edge_handgrip";
    public static final String tV = "camera_continuous_shot_callback_class";
    public static final String tW = "camera_continuous_shot_callback_setter";
    public static final String tX = "fp_nav_event_name_list";
    public static final String tY = "support_camera_shader_effect";
    public static final String tZ = "support_camera_burst_shoot";
    public static final String uA = "is_camera_face_detection_need_orientation";
    public static final String uB = "is_camera_hold_blur_background";
    public static final String uC = "support_camera_peaking_mf";
    public static final String uD = "support_camera_gradienter";
    public static final String uE = "is_camera_lower_qrscan_frequency";
    public static final String uF = "is_camera_preview_with_subthread_looper";
    public static final String uG = "camera_reduce_preview_flag";
    public static final String uH = "camera_focus_success_flag";
    public static final String uI = "camera_exposure_compensation_steps_num";
    public static final String uJ = "is_camera_app_water_mark";
    public static final String uK = "support_camera_tilt_shift";
    public static final String uL = "support_camera_magic_mirror";
    public static final String uM = "support_camera_quick_snap";
    public static final String uN = "camera_front_count_down_margin";
    public static final String uO = "support_camera_groupshot";
    public static final String uP = "is_full_size_effect";
    public static final String uQ = "support_camera_face_info_water_mark";
    public static final String uR = "support_camera_square_mode";
    public static final String uS = "is_camera_use_still_effect_image";
    public static final String uT = "support_front_flash";
    public static final String uU = "support_video_front_flash";
    public static final String uV = "is_camera_isp_rotated";
    public static final String uW = "support_full_size_panorama";
    public static final String uX = "support_hfr_video_pause";
    public static final String uY = "is_front_remosic_sensor";
    public static final String uZ = "front_fingerprint_sensor";
    public static final String ua = "support_camera_burst_shoot_denoise";
    public static final String ub = "burst_shoot_count";
    public static final String uc = "support_camera_movie_solid";
    public static final String ud = "support_camera_skin_beauty";
    public static final String ue = "support_camera_age_detection";
    public static final String uf = "support_camera_record_location";
    public static final String ug = "support_camera_water_mark";
    public static final String uh = "support_camera_new_style_time_water_mark";
    public static final String ui = "support_camera_video_pause";
    public static final String uj = "support_camera_boost_brightness";
    public static final String uk = "is_lower_size_effect";
    public static final String ul = "support_camera_aohdr";
    public static final String um = "support_camera_hfr";
    public static final String un = "support_chroma_flash";
    public static final String uo = "support_object_track";
    public static final String up = "support_camera_4k_quality";
    public static final String uq = "support_camera_ubifocus";
    public static final String ur = "camera_supported_scene";
    public static final String us = "camera_supported_ai_scene";
    public static final String ut = "support_camera_audio_focus";
    public static final String uu = "is_camera_use_morpho_lib";
    public static final String uv = "is_camera_replace_higher_cost_effect";
    public static final String uw = "support_camera_manual_function";
    public static final String ux = "support_camera_press_down_capture";
    public static final String uy = "support_camera_torch_capture";
    public static final String uz = "is_camera_freeze_after_hdr_capture";
    public static final String vA = "support_video_hfr_mode";
    public static final String vB = "support_3d_face_beauty";
    public static final String vC = "support_mi_face_beauty";
    public static final String vD = "support_lens_dirty_detect";
    public static final String vE = "enable_algorithm_in_file_suffix";
    public static final String vF = "support_camera_dynamic_light_spot";
    public static final String vG = "support_super_resolution";
    public static final String vH = "support_realtime_manual_exposure_time";
    public static final String vI = "support_picture_watermark";
    public static final String vJ = "sensor_has_latency";
    private static final Map<String, String> vK = Collections.unmodifiableMap(new FeatureParserWrapper$1());
    public static final String va = "cmcc_strategic_phone";
    public static final String vb = "is_need_force_recycle_effect";
    public static final String vc = "is_18x9_ratio_screen";
    public static final String vd = "camera_extra_picture_size";
    public static final String ve = "is_support_tele_asd_night";
    public static final String vf = "is_front_video_quality_1080p";
    public static final String vg = "is_capture_stop_face_detection";
    public static final String vh = "is_video_snapshot_size_limit";
    public static final String vi = "is_surface_size_limit";
    public static final String vj = "is_hal_does_caf_when_flash_on";
    public static final String vk = "is_new_hdr_param_key_used";
    public static final String vl = "is_hrf_video_capture_support";
    public static final String vm = "is_support_stereo";
    public static final String vn = "is_support_optical_zoom";
    public static final String vo = "is_support_portrait";
    public static final String vp = "camera_is_support_portrait_front";
    public static final String vq = "is_support_fhd_fhr";
    public static final String vr = "is_rgb888_egl_prefer";
    public static final String vs = "is_legacy_face_beauty";
    public static final String vt = "use_legacy_normal_filter";
    public static final String vu = "camera_hibernation_timeout_in_minutes";
    public static final String vv = "support_front_hht_enhance";
    public static final String vw = "support_screen_light";
    public static final String vx = "support_parallel_process";
    public static final String vy = "support_psensor_pocket_mode";
    public static final String vz = "support_front_beauty_mfnr";

    private static String M(String str) {
        return (String) vK.get(str);
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
