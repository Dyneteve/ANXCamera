package com.mi.config;

import com.android.camera.data.DataRepository;
import java.util.Collections;
import java.util.Map;
import miui.util.FeatureParser;

@Deprecated
/* compiled from: FeatureParserWrapper */
public class d {
    public static final String sV = "camera_supported_asd";
    public static final String ta = "support_zoom_mfnr";
    public static final String vA = "support_camera_water_mark";
    public static final String vB = "support_camera_new_style_time_water_mark";
    public static final String vC = "support_camera_video_pause";
    public static final String vD = "support_camera_boost_brightness";
    public static final String vE = "is_lower_size_effect";
    public static final String vF = "support_camera_aohdr";
    public static final String vG = "support_camera_hfr";
    public static final String vH = "support_chroma_flash";
    public static final String vI = "support_object_track";
    public static final String vJ = "support_camera_4k_quality";
    public static final String vK = "support_camera_ubifocus";
    public static final String vL = "camera_supported_scene";
    public static final String vM = "camera_supported_ai_scene";
    public static final String vN = "support_camera_audio_focus";
    public static final String vO = "is_camera_use_morpho_lib";
    public static final String vP = "is_camera_replace_higher_cost_effect";
    public static final String vQ = "support_camera_manual_function";
    public static final String vR = "support_camera_press_down_capture";
    public static final String vS = "support_camera_torch_capture";
    public static final String vT = "is_camera_freeze_after_hdr_capture";
    public static final String vU = "is_camera_face_detection_need_orientation";
    public static final String vV = "is_camera_hold_blur_background";
    public static final String vW = "support_camera_peaking_mf";
    public static final String vX = "support_camera_gradienter";
    public static final String vY = "is_camera_lower_qrscan_frequency";
    public static final String vZ = "is_camera_preview_with_subthread_looper";
    public static final String vj = "is_xiaomi";
    public static final String vk = "is_hongmi";
    public static final String vl = "is_pad";
    public static final String vm = "vendor";
    public static final String vn = "support_dual_sd_card";
    public static final String vo = "support_edge_handgrip";
    public static final String vp = "camera_continuous_shot_callback_class";
    public static final String vq = "camera_continuous_shot_callback_setter";
    public static final String vr = "fp_nav_event_name_list";
    public static final String vs = "support_camera_shader_effect";
    public static final String vt = "support_camera_burst_shoot";
    public static final String vu = "support_camera_burst_shoot_denoise";
    public static final String vv = "burst_shoot_count";
    public static final String vw = "support_camera_movie_solid";
    public static final String vx = "support_camera_skin_beauty";
    public static final String vy = "support_camera_age_detection";
    public static final String vz = "support_camera_record_location";
    public static final String wA = "is_front_video_quality_1080p";
    public static final String wB = "is_capture_stop_face_detection";
    public static final String wC = "is_video_snapshot_size_limit";
    public static final String wD = "is_surface_size_limit";
    public static final String wE = "is_hal_does_caf_when_flash_on";
    public static final String wF = "is_new_hdr_param_key_used";
    public static final String wG = "is_hrf_video_capture_support";
    public static final String wH = "is_support_stereo";
    public static final String wI = "is_support_optical_zoom";
    public static final String wJ = "is_support_portrait";
    public static final String wK = "camera_is_support_portrait_front";
    public static final String wL = "is_support_fhd_fhr";
    public static final String wM = "is_rgb888_egl_prefer";
    public static final String wN = "is_legacy_face_beauty";
    public static final String wO = "use_legacy_normal_filter";
    public static final String wP = "camera_hibernation_timeout_in_minutes";
    public static final String wQ = "support_front_hht_enhance";
    public static final String wR = "support_screen_light";
    public static final String wS = "support_parallel_process";
    public static final String wT = "support_psensor_pocket_mode";
    public static final String wU = "support_front_beauty_mfnr";
    public static final String wV = "support_video_hfr_mode";
    public static final String wW = "support_3d_face_beauty";
    public static final String wX = "support_mi_face_beauty";
    public static final String wY = "support_lens_dirty_detect";
    public static final String wZ = "enable_algorithm_in_file_suffix";
    public static final String wa = "camera_reduce_preview_flag";
    public static final String wb = "camera_focus_success_flag";
    public static final String wc = "camera_exposure_compensation_steps_num";
    public static final String wd = "is_camera_app_water_mark";
    public static final String we = "support_camera_tilt_shift";
    public static final String wf = "support_camera_magic_mirror";
    public static final String wg = "support_camera_quick_snap";
    public static final String wh = "camera_front_count_down_margin";
    public static final String wi = "support_camera_groupshot";
    public static final String wj = "is_full_size_effect";
    public static final String wk = "support_camera_face_info_water_mark";
    public static final String wl = "support_camera_square_mode";
    public static final String wm = "is_camera_use_still_effect_image";
    public static final String wn = "support_front_flash";
    public static final String wo = "support_video_front_flash";
    public static final String wp = "is_camera_isp_rotated";
    public static final String wq = "support_full_size_panorama";
    public static final String wr = "support_hfr_video_pause";
    public static final String wt = "is_front_remosic_sensor";
    public static final String wu = "front_fingerprint_sensor";
    public static final String wv = "cmcc_strategic_phone";
    public static final String ww = "is_need_force_recycle_effect";
    public static final String wx = "is_18x9_ratio_screen";
    public static final String wy = "camera_extra_picture_size";
    public static final String wz = "is_support_tele_asd_night";
    public static final String xa = "support_camera_dynamic_light_spot";
    public static final String xb = "support_super_resolution";
    public static final String xc = "support_realtime_manual_exposure_time";
    public static final String xd = "support_picture_watermark";
    public static final String xe = "sensor_has_latency";
    private static final Map<String, String> xf = Collections.unmodifiableMap(new FeatureParserWrapper$1());

    private static String N(String str) {
        return (String) xf.get(str);
    }

    public static boolean getBoolean(String str, boolean z) {
        String N = N(str);
        return (N == null || !DataRepository.dataItemFeature().K(N)) ? FeatureParser.getBoolean(str, z) : DataRepository.dataItemFeature().getBoolean(N, z);
    }

    public static Float getFloat(String str, float f) {
        String N = N(str);
        return (N == null || !DataRepository.dataItemFeature().K(N)) ? FeatureParser.getFloat(str, f) : Float.valueOf(DataRepository.dataItemFeature().getFloat(N, f));
    }

    public static int getInteger(String str, int i) {
        String N = N(str);
        return (N == null || !DataRepository.dataItemFeature().K(N)) ? FeatureParser.getInteger(str, i) : DataRepository.dataItemFeature().getInt(N, i);
    }

    public static String getString(String str) {
        String N = N(str);
        return (N == null || !DataRepository.dataItemFeature().K(N)) ? FeatureParser.getString(str) : DataRepository.dataItemFeature().getString(N, "N/A");
    }

    public static String[] getStringArray(String str) {
        return FeatureParser.getStringArray(str);
    }
}
