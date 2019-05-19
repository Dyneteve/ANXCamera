package com.android.camera.fragment.beauty;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Deprecated
public class MiBeauty {
    public static final int BACK_BEAUTY_MENU_TYPE = 162;
    public static final int FRONT_BEAUTY_MENU_TYPE = 161;
    public static final int LIVE_BEAUTY_MENU_TYPE = 163;
    public static final int LIVE_SPEED_MENU_TYPE = 165;
    public static final int LIVE_STICKER_MENU_TYPE = 164;
    public static final int MIMOJI_MENU_TYPE = 166;
    public static final int NONE_MENU_TYPE = 160;
    public AbBeautyFragmentBusiness mBeautyBusiness;
    private BeautyFragmentManager mBeautyFragmentManager;
    private BeautySettingManager mBeautySettingManager;

    @Retention(RetentionPolicy.SOURCE)
    public @interface BeautyMenuType {
    }
}
