package com.android.camera2.vendortag;

import android.hardware.camera2.CaptureResult.Key;
import android.util.Log;
import com.android.camera2.vendortag.struct.AECFrameControl;
import com.android.camera2.vendortag.struct.AFFrameControl;
import com.android.camera2.vendortag.struct.AWBFrameControl;
import com.mi.config.b;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.function.Supplier;

public class CaptureResultVendorTags {
    public static VendorTag<Key<AECFrameControl>> AEC_FRAME_CONTROL = create($$Lambda$CaptureResultVendorTags$EmL98sLBYpqWaOOec9Sgv0kz_A.INSTANCE, AECFrameControl.class);
    public static VendorTag<Key<Float>> AEC_LUX = create($$Lambda$CaptureResultVendorTags$5tKT0IisicMATZT4c6qX0QZ9QOc.INSTANCE, Float.class);
    public static VendorTag<Key<AFFrameControl>> AF_FRAME_CONTROL = create($$Lambda$CaptureResultVendorTags$dZED62aBR9DC3ozPodEvXjgdogw.INSTANCE, AFFrameControl.class);
    public static VendorTag<Key<Byte>> AI_HDR_DETECTED = create($$Lambda$CaptureResultVendorTags$b2giw9_5WeoT5fTeW0nm53oJAQ.INSTANCE, Byte.class);
    public static VendorTag<Key<Integer>> AI_SCENE_DETECTED = create($$Lambda$CaptureResultVendorTags$ysoTaj_udYYdNVLQ72bNPLNJsbY.INSTANCE, Integer.class);
    public static VendorTag<Key<Byte>> AI_SCENE_ENABLE = create($$Lambda$CaptureResultVendorTags$Hc2nw1ixOMsG1BQtqB8nhy4IUmo.INSTANCE, Byte.class);
    public static final VendorTag<Key<int[]>> AUTOZOOM_ACTIVE_OBJECTS = create($$Lambda$CaptureResultVendorTags$gkHbFAOrhasb4HI9rHH7hhSLLQ.INSTANCE, int[].class);
    public static final VendorTag<Key<float[]>> AUTOZOOM_BOUNDS = create($$Lambda$CaptureResultVendorTags$obbPMBHb_GBdD6Y0MtMtPjA_WsE.INSTANCE, float[].class);
    public static final VendorTag<Key<float[]>> AUTOZOOM_DELAYED_TARGET_BOUNDS_STABILIZED = create($$Lambda$CaptureResultVendorTags$O6wZjn_i1vbVBVFsfP_KvcUM_Jg.INSTANCE, float[].class);
    public static final VendorTag<Key<float[]>> AUTOZOOM_DELAYED_TARGET_BOUNDS_ZOOMED = create($$Lambda$CaptureResultVendorTags$rUXpgGl87MdgLgVApjzX8B_XDnk.INSTANCE, float[].class);
    public static final VendorTag<Key<float[]>> AUTOZOOM_OBJECT_BOUNDS_STABILIZED = create($$Lambda$CaptureResultVendorTags$WbrtGPoqpxhIhhawjqNRIuYAVs.INSTANCE, float[].class);
    public static final VendorTag<Key<float[]>> AUTOZOOM_OBJECT_BOUNDS_ZOOMED = create($$Lambda$CaptureResultVendorTags$kjs1PdFVdzaSEM6TmZMxgx9948.INSTANCE, float[].class);
    public static final VendorTag<Key<int[]>> AUTOZOOM_PAUSED_OBJECTS = create($$Lambda$CaptureResultVendorTags$m2HVGXr8zKsKR5Qroz_OFeZ8L8.INSTANCE, int[].class);
    public static final VendorTag<Key<int[]>> AUTOZOOM_SELECTED_OBJECTS = create($$Lambda$CaptureResultVendorTags$CxYVF2xg6PT6jKjBTtLpr1EpfjU.INSTANCE, int[].class);
    public static final VendorTag<Key<Integer>> AUTOZOOM_STATUS = create($$Lambda$CaptureResultVendorTags$xXUbfJUUbFQPqnErWIU9EaJxRKM.INSTANCE, Integer.class);
    public static final VendorTag<Key<float[]>> AUTOZOOM_TARGET_BOUNDS_STABILIZED = create($$Lambda$CaptureResultVendorTags$EN2LOEiGDSAZgW0iI7UkCY4Q3c.INSTANCE, float[].class);
    public static final VendorTag<Key<float[]>> AUTOZOOM_TARGET_BOUNDS_ZOOMED = create($$Lambda$CaptureResultVendorTags$3R_nG2QKafRX8jVLYTVEsegkvfg.INSTANCE, float[].class);
    public static VendorTag<Key<AWBFrameControl>> AWB_FRAME_CONTROL = create($$Lambda$CaptureResultVendorTags$c6uapKCJDTRgaVA8CxculdIcf24.INSTANCE, AWBFrameControl.class);
    public static VendorTag<Key<Integer>> BEAUTY_BODY_SLIM_COUNT = create($$Lambda$CaptureResultVendorTags$gTJp84cCJV5AFlJrMo1AbrgafA.INSTANCE, Integer.class);
    public static VendorTag<Key<Byte>> FAST_ZOOM_RESULT = create($$Lambda$CaptureResultVendorTags$V3OEZ7LJdxUShSpOwNRXfOjTBXc.INSTANCE, Byte.class);
    public static VendorTag<Key<byte[]>> HDR_CHECKTER_EV_VALUES = create($$Lambda$CaptureResultVendorTags$AmpgzHDWjWZYRSSfa_2h4su0Q_U.INSTANCE, byte[].class);
    public static VendorTag<Key<Boolean>> IS_HDR_ENABLE = create($$Lambda$CaptureResultVendorTags$NFyFSdb9tWEwXtJduF_2VsXOI38.INSTANCE, Boolean.class);
    public static VendorTag<Key<Boolean>> IS_SR_ENABLE = create($$Lambda$CaptureResultVendorTags$Ej6br5bkLZZNkVjWTjIfda0d3qo.INSTANCE, Boolean.class);
    public static VendorTag<Key<Integer>> LENS_DIRTY_DETECTED = create($$Lambda$CaptureResultVendorTags$OuDdYNL5o2nKYD_avIyoEIwM7M.INSTANCE, Integer.class);
    public static VendorTag<Key<Boolean>> REMOSAIC_DETECTED = create($$Lambda$CaptureResultVendorTags$jQt4ICS0DuQEHquDYVe265KMKE.INSTANCE, Boolean.class);
    public static VendorTag<Key<Integer>> SCENE_DETECTION_RESULT = create($$Lambda$CaptureResultVendorTags$Pwi4CJC_LlaqCQdr5h0bo4Wkg0.INSTANCE, Integer.class);
    public static VendorTag<Key<Byte>> SENSOR_HDR_ENABLE = create($$Lambda$CaptureResultVendorTags$0pkYDXcQpTrjtN72bGtCqgTXe4.INSTANCE, Byte.class);
    public static VendorTag<Key<float[]>> STATISTICS_FACE_AGE = create($$Lambda$CaptureResultVendorTags$OQ124yUz0vineh4s4APfJYZMVXU.INSTANCE, float[].class);
    public static VendorTag<Key<float[]>> STATISTICS_FACE_FACESCORE = create($$Lambda$CaptureResultVendorTags$fG9Zh3e_2FW_ZyNEkBunBVpmHAs.INSTANCE, float[].class);
    public static VendorTag<Key<float[]>> STATISTICS_FACE_GENDER = create($$Lambda$CaptureResultVendorTags$IUig401iOhYNDeswArldJ9n3Do.INSTANCE, float[].class);
    public static VendorTag<Key<byte[]>> STATISTICS_FACE_INFO = create($$Lambda$CaptureResultVendorTags$8eJ_H6yp3YCrTi4oIT8u_EI4Oo4.INSTANCE, byte[].class);
    public static VendorTag<Key<float[]>> STATISTICS_FACE_PROP = create($$Lambda$CaptureResultVendorTags$ECtPEcOVBYrkInIH68dthnUKF5A.INSTANCE, float[].class);
    private static final String TAG = "CaptureResultVendorTags";
    public static VendorTag<Key<Integer>> ULTRA_WIDE_RECOMMENDED_RESULT = create($$Lambda$CaptureResultVendorTags$okmTDnWRCMJwkgqJP_Ym3qDZgI.INSTANCE, Integer.class);
    public static final int VALUE_VIDEO_RECORD_STATE_IDLE = 2;
    public static final int VALUE_VIDEO_RECORD_STATE_PROCESS = 1;
    public static VendorTag<Key<Integer>> VIDEO_RECORD_STATE = create($$Lambda$CaptureResultVendorTags$epwX1VZVjFjsaGj2RvZM3mNJcM.INSTANCE, Integer.class);
    private static Constructor<Key> resultConstructor;

    private static <T> VendorTag<Key<T>> create(final Supplier<String> supplier, final Class<T> cls) {
        return new VendorTag<Key<T>>() {
            /* access modifiers changed from: protected */
            public Key<T> create() {
                return CaptureResultVendorTags.resultKey(getName(), cls);
            }

            public String getName() {
                return (String) supplier.get();
            }
        };
    }

    static /* synthetic */ String lambda$static$0() {
        return "com.vidhance.autozoom.bounds";
    }

    static /* synthetic */ String lambda$static$1() {
        return "com.vidhance.autozoom.target_bounds_stabilized";
    }

    static /* synthetic */ String lambda$static$10() {
        return "com.vidhance.autozoom.delayed_target_bounds_zoomed";
    }

    static /* synthetic */ String lambda$static$11() {
        return "xiaomi.video.recordState";
    }

    static /* synthetic */ String lambda$static$12() {
        return "xiaomi.faceAnalyzeResult.result";
    }

    static /* synthetic */ String lambda$static$13() {
        return "xiaomi.faceAnalyzeResult.age";
    }

    static /* synthetic */ String lambda$static$14() {
        return "xiaomi.faceAnalyzeResult.gender";
    }

    static /* synthetic */ String lambda$static$15() {
        return "xiaomi.faceAnalyzeResult.score";
    }

    static /* synthetic */ String lambda$static$16() {
        return "xiaomi.faceAnalyzeResult.prop";
    }

    static /* synthetic */ String lambda$static$17() {
        return "org.quic.camera2.statsconfigs.AECIsInsensorHDR";
    }

    static /* synthetic */ String lambda$static$18() {
        return "xiaomi.scene.result";
    }

    static /* synthetic */ String lambda$static$19() {
        return "com.qti.chi.statsaec.AecLux";
    }

    static /* synthetic */ String lambda$static$2() {
        return "com.vidhance.autozoom.target_bounds_zoomed";
    }

    static /* synthetic */ String lambda$static$20() {
        return "xiaomi.ai.asd.enabled";
    }

    static /* synthetic */ String lambda$static$21() {
        return "xiaomi.ai.asd.sceneDetected";
    }

    static /* synthetic */ String lambda$static$22() {
        return "xiaomi.hdr.hdrDetected";
    }

    static /* synthetic */ String lambda$static$23() {
        return "xiaomi.ai.add.lensDirtyDetected";
    }

    static /* synthetic */ String lambda$static$24() {
        return b.isMTKPlatform() ? "xiaomi.camera.awb.colorTemperature" : "org.quic.camera2.statsconfigs.AWBFrameControl";
    }

    static /* synthetic */ String lambda$static$25() {
        return "org.quic.camera2.statsconfigs.AECFrameControl";
    }

    static /* synthetic */ String lambda$static$26() {
        return "org.quic.camera2.statsconfigs.AFFrameControl";
    }

    static /* synthetic */ String lambda$static$27() {
        return "xiaomi.smoothTransition.result";
    }

    static /* synthetic */ String lambda$static$28() {
        return "xiaomi.hdr.hdrChecker";
    }

    static /* synthetic */ String lambda$static$29() {
        return "xiaomi.ai.misd.ultraWideRecommended";
    }

    static /* synthetic */ String lambda$static$3() {
        return "com.vidhance.autozoom.status";
    }

    static /* synthetic */ String lambda$static$30() {
        return "xiaomi.beauty.bodySlimCnt";
    }

    static /* synthetic */ String lambda$static$31() {
        return "xiaomi.superResolution.enabled";
    }

    static /* synthetic */ String lambda$static$32() {
        return "xiaomi.hdr.enabled";
    }

    static /* synthetic */ String lambda$static$33() {
        return "xiaomi.remosaic.detected";
    }

    static /* synthetic */ String lambda$static$4() {
        return "com.vidhance.autozoom.active_objects";
    }

    static /* synthetic */ String lambda$static$5() {
        return "com.vidhance.autozoom.selected_objects";
    }

    static /* synthetic */ String lambda$static$6() {
        return "com.vidhance.autozoom.paused_objects";
    }

    static /* synthetic */ String lambda$static$7() {
        return "com.vidhance.autozoom.object_bounds_stabilized";
    }

    static /* synthetic */ String lambda$static$8() {
        return "com.vidhance.autozoom.object_bounds_zoomed";
    }

    static /* synthetic */ String lambda$static$9() {
        return "com.vidhance.autozoom.delayed_target_bounds_stabilized";
    }

    public static void preload() {
        Log.d(TAG, "preloading...");
    }

    /* access modifiers changed from: private */
    public static <T> Key<T> resultKey(String str, Class<T> cls) {
        try {
            if (resultConstructor == null) {
                resultConstructor = Key.class.getConstructor(new Class[]{String.class, cls.getClass()});
                resultConstructor.setAccessible(true);
            }
            return (Key) resultConstructor.newInstance(new Object[]{str, cls});
        } catch (IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Cannot find/call Key constructor: ");
            sb.append(e.getMessage());
            Log.d(str2, sb.toString());
            return null;
        }
    }
}
