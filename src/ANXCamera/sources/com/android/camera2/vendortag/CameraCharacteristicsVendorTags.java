package com.android.camera2.vendortag;

import android.graphics.Rect;
import android.hardware.camera2.CameraCharacteristics.Key;
import android.hardware.camera2.params.StreamConfiguration;
import android.util.Log;
import com.mi.config.b;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.function.Supplier;

public class CameraCharacteristicsVendorTags {
    public static VendorTag<Key<Boolean>> ADAPTIVE_SNAPSHOT_SIZE_IN_SAT_MODE_SUPPORTED = create($$Lambda$CameraCharacteristicsVendorTags$vCqabTOJy_9UMCAOa2lTBH3pbrc.INSTANCE, Boolean.class);
    public static VendorTag<Key<int[]>> AI_SCENE_AVAILABLE_MODES = create($$Lambda$CameraCharacteristicsVendorTags$Nxul1q8p2_KKVfxacipmB4hcDao.INSTANCE, int[].class);
    public static VendorTag<Key<Boolean>> BEAUTY_MAKEUP = create($$Lambda$CameraCharacteristicsVendorTags$EmYWy8us27A2JPzluWECQsQRqw.INSTANCE, Boolean.class);
    public static VendorTag<Key<Byte>> BEAUTY_VERSION = create($$Lambda$CameraCharacteristicsVendorTags$ZuBO8yFJOLgFELj1pyv9BZq8dEs.INSTANCE, Byte.class);
    public static VendorTag<Key<byte[]>> CAM_CALIBRATION_DATA = create($$Lambda$CameraCharacteristicsVendorTags$xWe_b7ueXRuWplHlU6b2TvrXGMQ.INSTANCE, byte[].class);
    public static VendorTag<Key<int[]>> CUSTOM_HFR_FPS_TABLE = create($$Lambda$CameraCharacteristicsVendorTags$OexgdvjvbJ97Rfy6YepAoKh6J2A.INSTANCE, int[].class);
    public static VendorTag<Key<Byte>> EIS_PREVIEW_SUPPORTED = create($$Lambda$CameraCharacteristicsVendorTags$a5xL2qGgl685RoYhVWQOd1Z9m8.INSTANCE, Byte.class);
    public static VendorTag<Key<int[]>> EXTRA_HIGH_SPEED_VIDEO_CONFIGURATIONS = create($$Lambda$CameraCharacteristicsVendorTags$5HDn5Cy9pvPJCCCRG5q_EUYiqF4.INSTANCE, int[].class);
    public static VendorTag<Key<Integer>> EXTRA_HIGH_SPEED_VIDEO_NUMBER = create($$Lambda$CameraCharacteristicsVendorTags$3BjMUvEu9kSFxTf1ztK2CcqRxCM.INSTANCE, Integer.class);
    public static VendorTag<Key<Byte>> FOVC_SUPPORTED = create($$Lambda$CameraCharacteristicsVendorTags$u23AJ2dvShM1mxISGBwQDzZ8G4I.INSTANCE, Byte.class);
    public static VendorTag<Key<Byte>> IS_QCFA_SENSOR = create($$Lambda$CameraCharacteristicsVendorTags$bnJ_X_GSleIJc5jnER_CUSyP7Ow.INSTANCE, Byte.class);
    public static VendorTag<Key<Byte>> MFNR_BOKEH_SUPPORTED = create($$Lambda$CameraCharacteristicsVendorTags$R8YELJA1oBhS7k9FyPABVH0QaO4.INSTANCE, Byte.class);
    public static VendorTag<Key<Rect>> QCFA_ACTIVE_ARRAY_SIZE = create($$Lambda$CameraCharacteristicsVendorTags$E38aH_N_UAp9_0NqOzAsKPtAHI.INSTANCE, Rect.class);
    public static VendorTag<Key<StreamConfiguration[]>> QCFA_STREAM_CONFIGURATIONS = create($$Lambda$CameraCharacteristicsVendorTags$jz6GJBsMbf6826OWOWQqaqhh0LA.INSTANCE, StreamConfiguration[].class);
    public static VendorTag<Key<StreamConfiguration[]>> SCALER_AVAILABLE_LIMIT_STREAM_CONFIGURATIONS = create($$Lambda$CameraCharacteristicsVendorTags$TPOMajA55289UMLRROOnyqI_6gk.INSTANCE, StreamConfiguration[].class);
    public static VendorTag<Key<StreamConfiguration[]>> SCALER_AVAILABLE_SR_STREAM_CONFIGURATIONS = create($$Lambda$CameraCharacteristicsVendorTags$ugjtQMxNjHi2QRYXeNgW0VEcxdk.INSTANCE, StreamConfiguration[].class);
    public static VendorTag<Key<StreamConfiguration[]>> SCALER_AVAILABLE_STREAM_CONFIGURATIONS = create($$Lambda$CameraCharacteristicsVendorTags$G2S9gbcgxEOi4d4wiktpHhNYltI.INSTANCE, StreamConfiguration[].class);
    public static VendorTag<Key<Integer>> SCREEN_LIGHT_BRIGHTNESS = create($$Lambda$CameraCharacteristicsVendorTags$wOSikJRG7iJT3U9dU9XETvU4Io.INSTANCE, Integer.class);
    private static final String TAG = "CameraCharacteristicsVendorTags";
    public static VendorTag<Key<Boolean>> VIDEO_BEAUTY = create($$Lambda$CameraCharacteristicsVendorTags$ZSypsLUPBQ_l6mIgtqTx_7AunMY.INSTANCE, Boolean.class);
    private static Constructor<Key> characteristicsConstructor;

    /* access modifiers changed from: private */
    public static <T> Key<T> characteristicsKey(String str, Class<T> cls) {
        try {
            if (characteristicsConstructor == null) {
                characteristicsConstructor = Key.class.getConstructor(new Class[]{String.class, cls.getClass()});
                characteristicsConstructor.setAccessible(true);
            }
            return (Key) characteristicsConstructor.newInstance(new Object[]{str, cls});
        } catch (IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Cannot find/call Key constructor: ");
            sb.append(e.getMessage());
            Log.d(str2, sb.toString());
            return null;
        }
    }

    private static <T> VendorTag<Key<T>> create(final Supplier<String> supplier, final Class<T> cls) {
        return new VendorTag<Key<T>>() {
            /* access modifiers changed from: protected */
            public Key<T> create() {
                return CameraCharacteristicsVendorTags.characteristicsKey(getName(), cls);
            }

            public String getName() {
                return (String) supplier.get();
            }
        };
    }

    static /* synthetic */ String lambda$static$0() {
        return "xiaomi.ai.asd.availableSceneMode";
    }

    static /* synthetic */ String lambda$static$1() {
        return b.isMTKPlatform() ? "xiaomi.qcfa.supported" : "org.codeaurora.qcamera3.quadra_cfa.is_qcfa_sensor";
    }

    static /* synthetic */ String lambda$static$10() {
        return "xiaomi.scaler.availableSuperResolutionStreamConfigurations";
    }

    static /* synthetic */ String lambda$static$11() {
        return "com.xiaomi.camera.algoup.dualCalibrationData";
    }

    static /* synthetic */ String lambda$static$12() {
        return "xiaomi.capabilities.videoStabilization.previewSupported";
    }

    static /* synthetic */ String lambda$static$13() {
        return "xiaomi.flash.screenLight.brightness";
    }

    static /* synthetic */ String lambda$static$14() {
        return "xiaomi.capabilities.mfnr_bokeh_supported";
    }

    static /* synthetic */ String lambda$static$15() {
        return "com.xiaomi.camera.supportedfeatures.fovcEnable";
    }

    static /* synthetic */ String lambda$static$16() {
        return "com.xiaomi.camera.supportedfeatures.beautyVersion";
    }

    static /* synthetic */ String lambda$static$17() {
        return "xiaomi.capabilities.satAdaptiveSnapshotSizeSupported";
    }

    static /* synthetic */ String lambda$static$18() {
        return "org.codeaurora.qcamera3.additional_hfr_video_sizes.valid_number";
    }

    static /* synthetic */ String lambda$static$2() {
        return "com.xiaomi.camera.supportedfeatures.videoBeauty";
    }

    static /* synthetic */ String lambda$static$3() {
        return "com.xiaomi.camera.supportedfeatures.beautyMakeup";
    }

    static /* synthetic */ String lambda$static$4() {
        return "org.codeaurora.qcamera3.additional_hfr_video_sizes.hfr_video_size";
    }

    static /* synthetic */ String lambda$static$5() {
        return b.isMTKPlatform() ? "com.mediatek.streamingfeature.availableHfpsMaxResolutions" : "org.quic.camera2.customhfrfps.info.CustomHFRFpsTable";
    }

    static /* synthetic */ String lambda$static$6() {
        return "xiaomi.scaler.availableStreamConfigurations";
    }

    static /* synthetic */ String lambda$static$7() {
        return "xiaomi.scaler.availableLimitStreamConfigurations";
    }

    static /* synthetic */ String lambda$static$8() {
        return "org.codeaurora.qcamera3.quadra_cfa.activeArraySize";
    }

    static /* synthetic */ String lambda$static$9() {
        return "org.codeaurora.qcamera3.quadra_cfa.availableStreamConfigurations";
    }

    public static void preload() {
        Log.d(TAG, "preloading...");
    }
}
