package com.android.camera.fragment.top;

import android.animation.ObjectAnimator;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RotateDrawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;
import android.support.v4.app.Fragment;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView;
import android.util.SparseBooleanArray;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.FrameLayout.LayoutParams;
import android.widget.ImageView;
import com.android.camera.ActivityBase;
import com.android.camera.Camera;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.constant.DurationConstant;
import com.android.camera.constant.EyeLightConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.ComponentConfigUltraWide;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.data.data.config.TopConfigItem;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.beauty.LinearLayoutManagerWrapper;
import com.android.camera.fragment.music.FragmentLiveMusic;
import com.android.camera.fragment.top.ExpandAdapter.ExpandListener;
import com.android.camera.log.Log;
import com.android.camera.module.impl.component.MimojiStatusManager;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.CameraModuleSpecial;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.HandleBeautyRecording;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.TopConfigProtocol;
import com.android.camera.statistic.CameraStatUtil;
import io.reactivex.Completable;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import miui.view.animation.CubicEaseInOutInterpolator;

public class FragmentTopConfig extends BaseFragment implements OnClickListener, ExpandListener, HandleBackTrace, HandleBeautyRecording, TopAlert {
    private static final int EXPAND_STATE_CENTER = 2;
    private static final int EXPAND_STATE_LEFT = 0;
    private static final int EXPAND_STATE_LEFT_FROM_SIBLING = 1;
    private static final int EXPAND_STATE_RIGHT = 4;
    private static final int EXPAND_STATE_RIGHT_FROM_SIBLING = 3;
    private static final String TAG = "FragmentTopConfig";
    private int[] mAiSceneResources;
    private int[] mAutoZoomResources;
    private List<ImageView> mConfigViews;
    private SparseBooleanArray mDisabledFunctionMenu;
    private int mDisplayRectTopMargin;
    private RecyclerView mExpandView;
    private int[] mFilterResources;
    private FragmentTopAlert mFragmentTopAlert;
    private FragmentTopConfigExtra mFragmentTopConfigExtra;
    private boolean mIsRTL;
    private boolean mIsShowExtraMenu;
    private LastAnimationComponent mLastAnimationComponent;
    private int[] mLightingResource;
    private int[] mLiveMusicSelectResources;
    private ObjectAnimator mLiveShotAnimator;
    private int[] mLiveShotResource;
    private View mMimojiCreateLayout;
    private SupportedConfigs mSupportedConfigs;
    private View mTopConfigMenu;
    private int mTopDrawableWidth;
    private ViewGroup mTopExtraParent;
    private int mTotalWidth;
    private int[] mUltraPixelPhotographyResources;
    private int[] mUltraWideBokehResources;
    private int[] mUltraWideResource;
    private int[] mVideoBokehResource;
    private boolean mVideoRecordingStarted;
    private int mViewPadding;

    private void alertHDR(int i, boolean z, boolean z2, boolean z3) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            if (z3) {
                if (i != 0) {
                    this.mLastAnimationComponent.reverse(true);
                } else if (z2) {
                    ImageView topImage = getTopImage(194);
                    if (topImage != null) {
                        topImage.performClick();
                    }
                }
            }
            topAlert.alertHDR(i, z);
        }
    }

    private void alertTopMusicHint(int i, String str) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.alertMusicTip(i, str);
        }
    }

    private void expandExtra(ComponentData componentData, View view, int i) {
        int i2;
        int i3;
        int i4;
        int i5;
        int i6 = 1;
        if (!this.mLastAnimationComponent.reverse(true)) {
            ExpandAdapter expandAdapter = new ExpandAdapter(componentData, this);
            int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.expanded_text_item_width) * componentData.getItems().size();
            this.mExpandView.getLayoutParams().width = dimensionPixelSize;
            this.mExpandView.setAdapter(expandAdapter);
            int i7 = 0;
            this.mExpandView.setVisibility(0);
            this.mExpandView.setTag(Integer.valueOf(i));
            int dimensionPixelSize2 = getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width) * 3;
            boolean z = ((LayoutParams) view.getLayoutParams()).gravity == 8388611;
            if (z) {
                i6 = 0;
            }
            if (this.mIsRTL) {
                i6 = 4 - i6;
            }
            switch (i6) {
                case 0:
                    this.mLastAnimationComponent.setExpandGravity(5);
                    i2 = view.getRight() - dimensionPixelSize2;
                    i5 = view.getWidth() + 0;
                    break;
                case 1:
                    this.mLastAnimationComponent.setExpandGravity(3);
                    i2 = view.getRight();
                    i5 = view.getWidth() + 0;
                    break;
                case 2:
                    i4 = getView().getWidth() - view.getWidth();
                    i2 = (view.getLeft() - dimensionPixelSize) - dimensionPixelSize2;
                    i3 = i4 - dimensionPixelSize;
                    break;
                case 3:
                    i4 = getView().getWidth() - view.getWidth();
                    i2 = (view.getLeft() - dimensionPixelSize) - dimensionPixelSize2;
                    i3 = i4 - dimensionPixelSize;
                    break;
                case 4:
                    this.mLastAnimationComponent.setExpandGravity(3);
                    i4 = getView().getWidth() - view.getWidth();
                    i2 = dimensionPixelSize2 + (view.getLeft() - dimensionPixelSize);
                    i3 = i4 - dimensionPixelSize;
                    break;
                default:
                    i2 = 0;
                    i4 = 0;
                    i3 = 0;
                    break;
            }
            i3 = i5;
            i4 = 0;
            this.mLastAnimationComponent.mRecyclerView = this.mExpandView;
            this.mLastAnimationComponent.mReverseLeft = view.getLeft();
            this.mLastAnimationComponent.mReverseRecyclerViewLeft = i2;
            this.mLastAnimationComponent.hideOtherViews(i, this.mConfigViews);
            if (!z) {
                this.mLastAnimationComponent.mAnchorView = view;
                this.mLastAnimationComponent.translateAnchorView(i4 - view.getLeft());
            }
            if (this.mIsRTL) {
                i7 = getView().getWidth() - dimensionPixelSize;
            }
            this.mLastAnimationComponent.showExtraView(i2 - i7, i3 - i7);
        }
    }

    private Drawable getAiSceneDrawable(int i) {
        TypedArray obtainTypedArray = getResources().obtainTypedArray(R.array.ai_scene_drawables);
        Drawable drawable = (i < 0 || i >= obtainTypedArray.length()) ? null : obtainTypedArray.getDrawable(i);
        obtainTypedArray.recycle();
        return drawable;
    }

    private int[] getAiSceneResources() {
        return new int[]{R.drawable.ic_new_ai_scene_off, R.drawable.ic_new_ai_scene_on};
    }

    private int[] getAutoZoomResources() {
        return new int[]{R.drawable.ic_autozoom_off, R.drawable.ic_autozoom_on};
    }

    @DrawableRes
    private int getFPS960ImageResource(int i) {
        return DataRepository.dataItemConfig().getComponentConfigSlowMotion().getImageResource();
    }

    private int[] getFilterResources() {
        return new int[]{R.drawable.ic_new_effect_button_normal, R.drawable.ic_new_effect_button_selected};
    }

    @DrawableRes
    private int getFocusPeakImageResource() {
        boolean isSwitchOn = DataRepository.dataItemRunning().isSwitchOn("pref_camera_peak_key");
        return "zh".equals(Locale.getDefault().getLanguage()) ? isSwitchOn ? R.drawable.ic_new_config_focus_peak_ch_on : R.drawable.ic_new_config_foucs_peak_ch_off : isSwitchOn ? R.drawable.ic_new_config_focus_peak_en_on : R.drawable.ic_new_config_focus_peak_en_off;
    }

    @StringRes
    private int getHFRContentDesc(int i) {
        return i == 170 ? R.string.accessibility_camera_video_fps_120 : R.string.accessibility_camera_video_fps_30;
    }

    @DrawableRes
    private int getHFRImageResource(int i) {
        return i == 170 ? R.drawable.ic_new_config_video_fps_120 : R.drawable.ic_new_config_video_fps_30;
    }

    private int getInitialMargin(TopConfigItem topConfigItem, ImageView imageView) {
        int configsSize = this.mSupportedConfigs == null ? 0 : this.mSupportedConfigs.getConfigsSize();
        if (configsSize <= 0) {
            return 0;
        }
        int i = topConfigItem.index;
        LayoutParams layoutParams = (LayoutParams) imageView.getLayoutParams();
        layoutParams.gravity = 0;
        int i2 = 8388611;
        int i3 = GravityCompat.END;
        switch (configsSize) {
            case 1:
                layoutParams.leftMargin = 0;
                if (topConfigItem.gravity != 0) {
                    i3 = topConfigItem.gravity;
                }
                layoutParams.gravity = i3;
                imageView.setLayoutParams(layoutParams);
                return 0;
            case 2:
                if (i == 0) {
                    layoutParams.leftMargin = 0;
                    if (topConfigItem.gravity != 0) {
                        i2 = topConfigItem.gravity;
                    }
                    layoutParams.gravity = i2;
                } else if (i == 1) {
                    layoutParams.leftMargin = 0;
                    if (topConfigItem.gravity != 0) {
                        i3 = topConfigItem.gravity;
                    }
                    layoutParams.gravity = i3;
                }
                imageView.setLayoutParams(layoutParams);
                return 0;
            default:
                if (i == 0) {
                    layoutParams.leftMargin = 0;
                    layoutParams.gravity = 8388611;
                    imageView.setLayoutParams(layoutParams);
                    return 0;
                }
                int i4 = configsSize - 1;
                if (i != i4) {
                    return (((this.mTotalWidth - (this.mViewPadding * 2)) / i4) * i) + this.mViewPadding;
                }
                layoutParams.leftMargin = 0;
                layoutParams.gravity = GravityCompat.END;
                imageView.setLayoutParams(layoutParams);
                return 0;
        }
    }

    private int[] getLightingResources() {
        return new int[]{R.drawable.ic_new_lighting_off, R.drawable.ic_new_lighting_on};
    }

    private int[] getLiveShotResources() {
        return new int[]{R.drawable.ic_motionphoto, R.drawable.ic_motionphoto_highlight};
    }

    private int getMoreResources() {
        return R.drawable.ic_new_more;
    }

    private int[] getMusicSelectResources() {
        return new int[]{R.drawable.ic_live_music_normal, R.drawable.ic_live_music_selected};
    }

    private int getPortraitResources() {
        return R.drawable.ic_new_portrait_button_normal;
    }

    private int getSettingResources() {
        return R.drawable.ic_new_config_setting;
    }

    private FragmentTopAlert getTopAlert() {
        if (this.mFragmentTopAlert == null) {
            Log.d(TAG, "getTopAlert(): fragment is null");
            return null;
        } else if (this.mFragmentTopAlert.isAdded()) {
            return this.mFragmentTopAlert;
        } else {
            Log.d(TAG, "getTopAlert(): fragment is not added yet");
            return null;
        }
    }

    private FragmentTopConfigExtra getTopExtra() {
        return (FragmentTopConfigExtra) getChildFragmentManager().findFragmentByTag(String.valueOf(245));
    }

    private int[] getUltraPixelPhotographyResources() {
        return new int[]{R.drawable.ic_ultra_pixel_photography_48mp, R.drawable.ic_ultra_pixel_photography_48mp_highlight};
    }

    private int[] getUltraWideBokehResources() {
        return new int[]{R.drawable.ic_ultra_wide_bokeh, R.drawable.ic_ultra_wide_bokeh_highlight};
    }

    private int[] getUltraWideResources() {
        return new int[]{R.drawable.icon_config_ultra_wide_off, R.drawable.icon_config_ultra_wide_on};
    }

    private int[] getVideoBokehResources() {
        return new int[]{R.drawable.ic_new_portrait_button_normal, R.drawable.ic_new_portrait_button_on};
    }

    private void initTopView() {
        ImageView imageView = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_00);
        ImageView imageView2 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_01);
        ImageView imageView3 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_02);
        ImageView imageView4 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_03);
        ImageView imageView5 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_04);
        ImageView imageView6 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_05);
        ImageView imageView7 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_06);
        ImageView imageView8 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_07);
        ImageView imageView9 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_08);
        ImageView imageView10 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_09);
        ImageView imageView11 = (ImageView) this.mTopConfigMenu.findViewById(R.id.top_config_10);
        imageView.setOnClickListener(this);
        imageView2.setOnClickListener(this);
        imageView3.setOnClickListener(this);
        imageView4.setOnClickListener(this);
        imageView5.setOnClickListener(this);
        imageView6.setOnClickListener(this);
        imageView7.setOnClickListener(this);
        imageView8.setOnClickListener(this);
        imageView9.setOnClickListener(this);
        imageView10.setOnClickListener(this);
        imageView11.setOnClickListener(this);
        this.mConfigViews = new ArrayList();
        this.mConfigViews.add(imageView);
        this.mConfigViews.add(imageView2);
        this.mConfigViews.add(imageView3);
        this.mConfigViews.add(imageView4);
        this.mConfigViews.add(imageView5);
        this.mConfigViews.add(imageView6);
        this.mConfigViews.add(imageView7);
        this.mConfigViews.add(imageView8);
        this.mConfigViews.add(imageView9);
        this.mConfigViews.add(imageView10);
        this.mConfigViews.add(imageView11);
    }

    private void reConfigCommonTip() {
        if (CameraSettings.isHandGestureOpen() && DataRepository.dataItemRunning().getHandGestureRunning()) {
            alertTopHint(0, (int) R.string.hand_gesture_tip);
        }
        if (CameraSettings.isUltraPixelOn()) {
            alertTopHint(0, DataRepository.dataItemRunning().getComponentUltraPixel().getUltraPixelOpenTip());
        }
        if (!EyeLightConstant.OFF.equals(CameraSettings.getEyeLightType())) {
            alertTopHint(0, (int) R.string.eye_light);
        }
    }

    private void reConfigTipOfFlash(boolean z) {
        if (!isExtraMenuShowing()) {
            ComponentConfigFlash componentFlash = DataRepository.dataItemConfig().getComponentFlash();
            if (!componentFlash.isEmpty()) {
                String componentValue = componentFlash.getComponentValue(this.mCurrentMode);
                if ("1".equals(componentValue) || ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON.equals(componentValue)) {
                    alertFlash(0, false, false, z);
                } else if ("2".equals(componentValue)) {
                    alertFlash(0, true, false, z);
                } else {
                    alertFlash(8, false, false, z);
                }
            }
        }
    }

    private void reConfigTipOfHdr(boolean z) {
        ComponentConfigHdr componentHdr = DataRepository.dataItemConfig().getComponentHdr();
        if (!componentHdr.isEmpty()) {
            String componentValue = componentHdr.getComponentValue(this.mCurrentMode);
            if ("on".equals(componentValue) || "normal".equals(componentValue)) {
                alertHDR(0, false, false, z);
            } else if ("live".equals(componentValue)) {
                alertHDR(0, true, false, z);
            } else {
                alertHDR(8, false, false, z);
            }
        }
    }

    private void resetImages() {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        int currentCameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        this.mSupportedConfigs = SupportedConfigFactory.getSupportedTopConfigs(this.mCurrentMode, currentCameraId, Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(currentCameraId, this.mCurrentMode), DataRepository.dataItemGlobal().isNormalIntent());
        for (int i = 0; i < this.mConfigViews.size(); i++) {
            ImageView imageView = (ImageView) this.mConfigViews.get(i);
            imageView.setEnabled(true);
            imageView.setColorFilter(null);
            TopConfigItem configItem = this.mSupportedConfigs.getConfigItem(i);
            boolean topImageResource = setTopImageResource(configItem, imageView, this.mCurrentMode, dataItemConfig, false);
            TopConfigItem topConfigItem = (TopConfigItem) imageView.getTag();
            if (topConfigItem == null || topConfigItem.configItem != configItem.configItem) {
                imageView.setTag(configItem);
                imageView.clearAnimation();
                imageView.setVisibility(0);
                if (topImageResource) {
                    ViewCompat.setAlpha(imageView, 0.0f);
                    ViewCompat.animate(imageView).alpha(1.0f).setDuration(150).setStartDelay(150).start();
                } else {
                    imageView.setVisibility(4);
                }
            } else {
                imageView.setTag(configItem);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:96:0x01d0, code lost:
        r4 = 0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean setTopImageResource(TopConfigItem topConfigItem, ImageView imageView, int i, DataItemConfig dataItemConfig, boolean z) {
        int i2;
        int i3;
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        int i4 = topConfigItem.configItem;
        int i5 = R.string.accessibility_filter_open_panel;
        int i6 = 0;
        if (i4 == 209) {
            boolean isUltraPixelOn = CameraSettings.isUltraPixelOn();
            i6 = isUltraPixelOn ? this.mUltraPixelPhotographyResources[1] : this.mUltraPixelPhotographyResources[0];
            i5 = isUltraPixelOn ? R.string.accessibility_ultra_pixel_photography_48mp_on : R.string.accessibility_ultra_pixel_photography_48mp_off;
        } else if (i4 == 212) {
            i6 = DataRepository.dataItemRunning().getComponentRunningShine().getTopConfigEntryRes(i);
        } else if (i4 == 225) {
            i6 = getSettingResources();
            i5 = R.string.accessibility_setting;
        } else if (i4 == 239) {
            i6 = i != 174 ? CameraSettings.isFaceBeautyOn(this.mCurrentMode, null) : CameraSettings.isLiveBeautyOpen() ? R.drawable.ic_beauty_on : R.drawable.ic_beauty_off;
            i5 = R.string.accessibility_beauty_panel_open;
        } else if (i4 != 243) {
            if (i4 == 245) {
                String[] currentLiveMusic = CameraSettings.getCurrentLiveMusic();
                if (!currentLiveMusic[1].isEmpty()) {
                    alertTopMusicHint(0, currentLiveMusic[1]);
                    i2 = this.mLiveMusicSelectResources[1];
                } else {
                    i2 = this.mLiveMusicSelectResources[0];
                }
            } else if (i4 != 253) {
                switch (i4) {
                    case 176:
                        return false;
                    case 177:
                        i2 = R.drawable.ic_new_config_flash_off;
                    default:
                        switch (i4) {
                            case 193:
                                ComponentConfigFlash componentFlash = dataItemConfig.getComponentFlash();
                                if (!componentFlash.isEmpty()) {
                                    i6 = componentFlash.getValueSelectedDrawableIgnoreClose(i);
                                    i5 = componentFlash.getValueSelectedStringIdIgnoreClose(i);
                                    if (!z) {
                                        reConfigTipOfFlash(true);
                                        break;
                                    }
                                }
                                break;
                            case 194:
                                ComponentConfigHdr componentHdr = dataItemConfig.getComponentHdr();
                                if (!componentHdr.isEmpty()) {
                                    i6 = componentHdr.getValueSelectedDrawableIgnoreClose(i);
                                    i5 = componentHdr.getValueSelectedStringIdIgnoreClose(i);
                                    if (!z) {
                                        reConfigTipOfHdr(true);
                                        break;
                                    }
                                }
                                break;
                            case 195:
                                i6 = getPortraitResources();
                                i5 = R.string.accessibility_protrait;
                                break;
                            case 196:
                                int parseInt = Integer.parseInt(z ? DataRepository.getInstance().backUp().getBackupFilter(i, DataRepository.dataItemGlobal().getCurrentCameraId()) : DataRepository.dataItemRunning().getComponentConfigFilter().getComponentValue(i));
                                i3 = (parseInt == FilterInfo.FILTER_ID_NONE || parseInt <= 0) ? this.mFilterResources[0] : this.mFilterResources[1];
                                if (actionProcessing != null) {
                                    if (actionProcessing.isShowFilterView()) {
                                        i5 = R.string.accessibility_filter_close_panel;
                                        break;
                                    }
                                }
                                break;
                            case 197:
                                i6 = getMoreResources();
                                i5 = R.string.accessibility_more;
                                break;
                            default:
                                switch (i4) {
                                    case 199:
                                        i6 = getFocusPeakImageResource();
                                        i5 = R.string.accessibility_foucs_peak;
                                        break;
                                    case 200:
                                        String componentValue = dataItemConfig.getComponentBokeh().getComponentValue(i);
                                        i6 = "on".equals(componentValue) ? R.drawable.ic_portrait_button_on : R.drawable.ic_portrait_button_normal;
                                        i5 = "on".equals(componentValue) ? R.string.accessibility_bokeh_on : R.string.accessibility_bokeh_normal;
                                        break;
                                    case 201:
                                        i6 = CameraSettings.getAiSceneOpen(i) ? this.mAiSceneResources[1] : this.mAiSceneResources[0];
                                        i5 = CameraSettings.getAiSceneOpen(i) ? R.string.accessibility_ai_scene_on : R.string.accessibility_ai_scene_off;
                                        break;
                                    case 202:
                                        i6 = getHFRImageResource(i);
                                        i5 = getHFRContentDesc(i);
                                        break;
                                    case 203:
                                        i3 = DataRepository.dataItemRunning().getComponentRunningLighting().isSwitchOn(i) ? this.mLightingResource[1] : this.mLightingResource[0];
                                        if (actionProcessing != null) {
                                            if (!actionProcessing.isShowLightingView()) {
                                                i5 = R.string.accessibility_camera_lighting_open_panel;
                                                break;
                                            } else {
                                                i5 = R.string.accessibility_camera_lighting_close_panel;
                                                break;
                                            }
                                        }
                                    case 204:
                                        i6 = getFPS960ImageResource(i);
                                        i5 = DataRepository.dataItemConfig().getComponentConfigSlowMotion().getContentDesc();
                                        break;
                                    case 205:
                                        ComponentConfigUltraWide componentConfigUltraWide = dataItemConfig.getComponentConfigUltraWide();
                                        if (!componentConfigUltraWide.isEmpty()) {
                                            i6 = componentConfigUltraWide.getValueSelectedDrawableIgnoreClose(i);
                                            i5 = componentConfigUltraWide.getValueSelectedStringIdIgnoreClose(i);
                                            break;
                                        }
                                    case 206:
                                        boolean isLiveShotOn = CameraSettings.isLiveShotOn();
                                        i6 = isLiveShotOn ? this.mLiveShotResource[1] : this.mLiveShotResource[0];
                                        i5 = isLiveShotOn ? R.string.accessibility_camera_liveshot_on : R.string.accessibility_camera_liveshot_off;
                                        break;
                                    case 207:
                                        boolean backupSwitchState = z ? DataRepository.getInstance().backUp().getBackupSwitchState(i, "pref_ultra_wide_bokeh_enabled", DataRepository.dataItemGlobal().getCurrentCameraId()) : DataRepository.dataItemRunning().isSwitchOn("pref_ultra_wide_bokeh_enabled");
                                        i6 = backupSwitchState ? this.mUltraWideBokehResources[1] : this.mUltraWideBokehResources[0];
                                        i5 = backupSwitchState ? R.string.accessibility_camera_ultra_wide_bokeh_on : R.string.accessibility_camera_ultra_wide_bokeh_off;
                                        break;
                                }
                        }
                        break;
                }
            } else {
                i6 = CameraSettings.isAutoZoomEnabled(i) ? this.mAutoZoomResources[1] : this.mAutoZoomResources[0];
                i5 = R.string.autozoom_hint;
            }
            i5 = 0;
            i6 = i3;
        } else {
            boolean isVideoBokehOn = CameraSettings.isVideoBokehOn();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setTopImageResource: VIDEO_BOKEH isSwitchOn = ");
            sb.append(isVideoBokehOn);
            Log.d(str, sb.toString());
            i6 = isVideoBokehOn ? this.mVideoBokehResource[1] : this.mVideoBokehResource[0];
            i5 = isVideoBokehOn ? R.string.pref_camera_video_bokeh_on : R.string.pref_camera_video_bokeh_off;
        }
        if (i6 > 0) {
            Drawable drawable = getResources().getDrawable(i6);
            topConfigItem.margin = getInitialMargin(topConfigItem, imageView);
            if (topConfigItem.margin > 0) {
                LayoutParams layoutParams = (LayoutParams) imageView.getLayoutParams();
                topConfigItem.margin -= (drawable.getIntrinsicWidth() / 2) + this.mViewPadding;
                if (this.mIsRTL) {
                    layoutParams.leftMargin = ((this.mTotalWidth - topConfigItem.margin) - drawable.getIntrinsicWidth()) - (this.mViewPadding * 2);
                } else {
                    layoutParams.leftMargin = topConfigItem.margin;
                }
                imageView.setLayoutParams(layoutParams);
            }
            if (topConfigItem.configItem == 177) {
                imageView.setImageDrawable(null);
            } else {
                imageView.setImageDrawable(drawable);
            }
            if (i5 > 0 && (Util.isAccessible() || Util.isSetContentDesc())) {
                imageView.setContentDescription(getString(i5));
            }
        }
        return true;
    }

    private void showMenu() {
        this.mTopConfigMenu.setVisibility(8);
        hideSwitchHint();
        hideAlert();
        this.mFragmentTopConfigExtra = new FragmentTopConfigExtra();
        this.mFragmentTopConfigExtra.setDegree(this.mDegree);
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mTopExtraParent.getLayoutParams();
        if (Util.isLongRatioScreen) {
            marginLayoutParams.topMargin = 0;
        } else {
            marginLayoutParams.topMargin = this.mDisplayRectTopMargin;
        }
        FragmentUtils.addFragmentWithTag(getChildFragmentManager(), (int) R.id.top_config_extra, (Fragment) this.mFragmentTopConfigExtra, this.mFragmentTopConfigExtra.getFragmentTag());
        this.mIsShowExtraMenu = true;
    }

    public void alertAiDetectTipHint(int i, int i2, long j) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertRecommendTipHint(i, i2, j);
        }
    }

    public void alertAiSceneSelector(int i) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertAiSceneSelector(i);
        }
    }

    public void alertFlash(int i, boolean z, boolean z2) {
        alertFlash(i, z, z2, true);
    }

    public void alertFlash(int i, boolean z, boolean z2, boolean z3) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            if (z3) {
                if (i != 0) {
                    this.mLastAnimationComponent.reverse(true);
                } else if (z2) {
                    ImageView topImage = getTopImage(193);
                    if (topImage != null) {
                        topImage.performClick();
                    }
                }
            }
            topAlert.alertFlash(i, z);
        }
    }

    public void alertHDR(int i, boolean z, boolean z2) {
        alertHDR(i, z, z2, true);
    }

    public void alertLightingHint(int i) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertLightingHint(i);
        }
    }

    public void alertLightingTitle(boolean z) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertLightingTitle(z);
        }
    }

    public void alertMoonModeSelector(int i, boolean z) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertMoonSelector(getResources().getString(R.string.ai_scene_top_tip), getResources().getString(R.string.ai_scene_top_moon_off), i, z);
            if (this.mCurrentMode == 163) {
                CameraModuleSpecial cameraModuleSpecial = (CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195);
                if (cameraModuleSpecial != null) {
                    cameraModuleSpecial.showOrHideChip(i != 0);
                }
            }
        }
    }

    public void alertMusicClose(boolean z) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.alertMusicClose(z);
        }
    }

    public void alertSwitchHint(int i, @StringRes int i2) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertSwitchHint(i, i2);
        }
    }

    public void alertSwitchHint(int i, String str) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertSwitchHint(i, str);
        }
    }

    public void alertTopHint(int i, @StringRes int i2) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertTopHint(i, i2);
        }
    }

    public void alertTopHint(int i, int i2, long j) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertTopHint(i, i2, j);
        }
    }

    public void alertTopHint(int i, String str) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertTopHint(i, str);
        }
    }

    public void alertUpdateValue(int i) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertUpdateValue(i);
        }
    }

    public void alertVideoUltraClear(int i, @StringRes int i2) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            boolean z = this.mFragmentTopConfigExtra == null || !this.mFragmentTopConfigExtra.isAdded();
            topAlert.alertVideoUltraClear(i, i2, Util.getDisplayRect(getContext()).top + getResources().getDimensionPixelSize(R.dimen.video_ultra_tip_margin_top), !z);
        }
    }

    public void clearAlertStatus() {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.clearAlertStatus();
        }
    }

    public void disableMenuItem(boolean z, int... iArr) {
        if (iArr != null) {
            for (int i : iArr) {
                this.mDisabledFunctionMenu.put(i, z);
                if (z) {
                    ImageView topImage = getTopImage(i);
                    if (topImage != null) {
                        AlphaOutOnSubscribe.directSetResult(topImage);
                    }
                }
            }
        }
    }

    public void enableMenuItem(boolean z, int... iArr) {
        if (this.mDisabledFunctionMenu.size() != 0) {
            for (int i : iArr) {
                this.mDisabledFunctionMenu.delete(i);
                if (z) {
                    ImageView topImage = getTopImage(i);
                    if (topImage != null) {
                        AlphaInOnSubscribe.directSetResult(topImage);
                    }
                }
            }
        }
    }

    public int getFragmentInto() {
        return 244;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_top_config;
    }

    public ImageView getTopImage(int i) {
        for (ImageView imageView : this.mConfigViews) {
            TopConfigItem topConfigItem = (TopConfigItem) imageView.getTag();
            if (topConfigItem != null && topConfigItem.configItem == i) {
                return imageView;
            }
        }
        return null;
    }

    public void hideAlert() {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.clear();
            topAlert.setShow(false);
        }
    }

    public void hideConfigMenu() {
        Completable.create(new AlphaOutOnSubscribe(this.mTopConfigMenu)).subscribe();
    }

    public void hideExtraMenu() {
        onBackEvent(6);
    }

    public void hideSwitchHint() {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.hideSwitchHint();
        }
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        this.mAiSceneResources = getAiSceneResources();
        this.mAutoZoomResources = getAutoZoomResources();
        this.mUltraWideResource = getUltraWideResources();
        this.mUltraWideBokehResources = getUltraWideBokehResources();
        this.mUltraPixelPhotographyResources = getUltraPixelPhotographyResources();
        this.mLiveShotResource = getLiveShotResources();
        this.mLightingResource = getLightingResources();
        this.mVideoBokehResource = getVideoBokehResources();
        this.mFilterResources = getFilterResources();
        this.mLiveMusicSelectResources = getMusicSelectResources();
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mLastAnimationComponent = new LastAnimationComponent();
        this.mDisabledFunctionMenu = new SparseBooleanArray(1);
        this.mTopExtraParent = (ViewGroup) view.findViewById(R.id.top_config_extra);
        this.mTopConfigMenu = view.findViewById(R.id.top_config_menu);
        ((MarginLayoutParams) this.mTopConfigMenu.getLayoutParams()).topMargin = Util.isNotchDevice ? Util.sStatusBarHeight : getResources().getDimensionPixelOffset(R.dimen.top_control_panel_extra_margin_top);
        initTopView();
        this.mExpandView = (RecyclerView) view.findViewById(R.id.top_config_expand_view);
        LinearLayoutManagerWrapper linearLayoutManagerWrapper = new LinearLayoutManagerWrapper(getContext(), "top_config_expand_view");
        linearLayoutManagerWrapper.setOrientation(0);
        this.mExpandView.setLayoutManager(linearLayoutManagerWrapper);
        this.mViewPadding = getResources().getDimensionPixelSize(R.dimen.panel_imageview_button_padding_width);
        this.mTopDrawableWidth = getResources().getDrawable(R.drawable.ic_new_config_flash_off).getIntrinsicWidth();
        this.mTotalWidth = getResources().getDisplayMetrics().widthPixels;
        if (((ActivityBase) getContext()).getCameraIntentManager().isFromScreenSlide().booleanValue()) {
            Util.startScreenSlideAlphaInAnimation(this.mTopConfigMenu);
        }
        provideAnimateElement(this.mCurrentMode, null, 2);
    }

    public void insertConfigItem(int i) {
        resetImages();
    }

    public boolean isExtraMenuShowing() {
        return this.mFragmentTopConfigExtra != null && this.mFragmentTopConfigExtra.isAdded() && this.mIsShowExtraMenu;
    }

    public boolean needViewClear() {
        return true;
    }

    public void notifyAfterFrameAvailable(int i) {
        super.notifyAfterFrameAvailable(i);
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (configChanges != null) {
            configChanges.reCheckMutexConfigs(this.mCurrentMode);
            configChanges.reCheckUltraPixel();
            configChanges.reCheckLiveShot();
            configChanges.reCheckHandGesture();
            configChanges.reCheckVideoUltraClearTip();
            configChanges.reCheckMacroMode();
            configChanges.reCheckFrontBokenTip();
            configChanges.reCheckBeauty();
        }
    }

    public void notifyDataChanged(int i, int i2) {
        super.notifyDataChanged(i, i2);
        this.mDisplayRectTopMargin = Util.getDisplayRect(getContext()).top;
        provideAnimateElement(this.mCurrentMode, null, 2);
        if (this.mFragmentTopAlert == null) {
            this.mFragmentTopAlert = new FragmentTopAlert();
            this.mFragmentTopAlert.setShow(true);
            this.mFragmentTopAlert.setDegree(this.mDegree);
            FragmentUtils.addFragmentWithTag(getChildFragmentManager(), (int) R.id.top_alert, (Fragment) this.mFragmentTopAlert, this.mFragmentTopAlert.getFragmentTag());
        }
    }

    public void onAngleChanged(float f) {
    }

    public boolean onBackEvent(int i) {
        if (this.mLastAnimationComponent.reverse(i != 4)) {
            return true;
        }
        FragmentTopConfigExtra topExtra = getTopExtra();
        if (topExtra == null) {
            return false;
        }
        if (i != 6) {
            switch (i) {
                case 1:
                case 2:
                    topExtra.animateOut();
                    this.mIsShowExtraMenu = false;
                    Completable.create(new AlphaInOnSubscribe(this.mTopConfigMenu).setStartDelayTime(200)).subscribe();
                    break;
                default:
                    FragmentUtils.removeFragmentByTag(getChildFragmentManager(), String.valueOf(245));
                    this.mTopConfigMenu.setVisibility(0);
                    this.mIsShowExtraMenu = false;
                    break;
            }
        } else {
            topExtra.animateOut();
            this.mIsShowExtraMenu = false;
            Completable.create(new AlphaInOnSubscribe(this.mTopConfigMenu).setStartDelayTime(200)).subscribe();
        }
        if (i != 4) {
            reInitAlert(true);
        }
        return true;
    }

    public void onBeautyRecordingStart() {
        onBackEvent(5);
        ViewCompat.animate(this.mTopConfigMenu).alpha(0.0f).start();
    }

    public void onBeautyRecordingStop() {
        ViewCompat.animate(this.mTopConfigMenu).alpha(1.0f).start();
    }

    public void onClick(View view) {
        Log.d(TAG, "top config onclick");
        if (isEnableClick()) {
            ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction != null && cameraAction.isDoingAction()) {
                    return;
                }
                if (!CameraSettings.isFrontCamera() || !((Camera) getContext()).isScreenSlideOff()) {
                    TopConfigItem topConfigItem = (TopConfigItem) view.getTag();
                    if (topConfigItem != null) {
                        if (this.mDisabledFunctionMenu.size() <= 0 || this.mDisabledFunctionMenu.indexOfKey(topConfigItem.configItem) < 0) {
                            int i = topConfigItem.configItem;
                            if (i == 209) {
                                configChanges.onConfigChanged(209);
                            } else if (i == 212) {
                                configChanges.onConfigChanged(212);
                            } else if (i == 225) {
                                configChanges.showSetting();
                            } else if (i == 239) {
                                configChanges.onConfigChanged(239);
                            } else if (i == 243) {
                                configChanges.onConfigChanged(243);
                            } else if (i == 245) {
                                Fragment fragmentByTag = FragmentUtils.getFragmentByTag(getFragmentManager(), FragmentLiveMusic.TAG);
                                CameraStatUtil.trackLiveMusicClick();
                                if (fragmentByTag == null) {
                                    FragmentLiveMusic fragmentLiveMusic = new FragmentLiveMusic();
                                    fragmentLiveMusic.setStyle(2, R.style.TTMusicDialogFragment);
                                    getFragmentManager().beginTransaction().add((Fragment) fragmentLiveMusic, FragmentLiveMusic.TAG).commitAllowingStateLoss();
                                }
                            } else if (i != 253) {
                                switch (i) {
                                    case 193:
                                        ComponentConfigFlash componentFlash = ((DataItemConfig) DataRepository.provider().dataConfig()).getComponentFlash();
                                        if (componentFlash.disableUpdate()) {
                                            int disableReasonString = componentFlash.getDisableReasonString();
                                            if (disableReasonString != 0) {
                                                ToastUtils.showToast(CameraAppImpl.getAndroidContext(), disableReasonString);
                                            }
                                            Log.w(TAG, "ignore click flash for disable update");
                                            break;
                                        } else {
                                            expandExtra(componentFlash, view, topConfigItem.configItem);
                                            break;
                                        }
                                    case 194:
                                        expandExtra(((DataItemConfig) DataRepository.provider().dataConfig()).getComponentHdr(), view, topConfigItem.configItem);
                                        break;
                                    case 195:
                                        configChanges.onConfigChanged(195);
                                        break;
                                    case 196:
                                        configChanges.onConfigChanged(196);
                                        break;
                                    case 197:
                                        showMenu();
                                        break;
                                    default:
                                        switch (i) {
                                            case 199:
                                                configChanges.onConfigChanged(199);
                                                ((ImageView) view).setImageResource(getFocusPeakImageResource());
                                                break;
                                            case 200:
                                                DataItemConfig dataItemConfig = (DataItemConfig) DataRepository.provider().dataConfig();
                                                dataItemConfig.getComponentBokeh().toggle(this.mCurrentMode);
                                                String componentValue = dataItemConfig.getComponentBokeh().getComponentValue(this.mCurrentMode);
                                                CameraStatUtil.tarckBokenChanged(this.mCurrentMode, componentValue);
                                                updateConfigItem(200);
                                                if (dataItemConfig.reConfigHdrIfBokehChanged(this.mCurrentMode, componentValue)) {
                                                    updateConfigItem(194);
                                                }
                                                configChanges.configBokeh(componentValue);
                                                break;
                                            case 201:
                                                configChanges.onConfigChanged(201);
                                                break;
                                            case 202:
                                                configChanges.onConfigChanged(202);
                                                break;
                                            case 203:
                                                configChanges.onConfigChanged(203);
                                                break;
                                            case 204:
                                                configChanges.onConfigChanged(204);
                                                break;
                                            case 205:
                                                configChanges.onConfigChanged(205);
                                                break;
                                            case 206:
                                                configChanges.onConfigChanged(206);
                                                break;
                                            case 207:
                                                configChanges.onConfigChanged(207);
                                                break;
                                        }
                                }
                            } else {
                                configChanges.onConfigChanged(253);
                            }
                        }
                    }
                }
            }
        }
    }

    public void onExpandValueChange(ComponentData componentData, String str) {
        if (isEnableClick()) {
            DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
            ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                int displayTitleString = componentData.getDisplayTitleString();
                if (displayTitleString == R.string.pref_camera_flashmode_title) {
                    CameraStatUtil.trackFlashChanged(this.mCurrentMode, str);
                    updateConfigItem(193);
                    if (dataItemConfig.reConfigHhrIfFlashChanged(this.mCurrentMode, str)) {
                        updateConfigItem(194);
                    }
                    configChanges.configFlash(str);
                } else if (displayTitleString == R.string.pref_camera_hdr_title) {
                    CameraStatUtil.trackHdrChanged(this.mCurrentMode, str);
                    updateConfigItem(194);
                    configChanges.restoreMutexFlash(SupportedConfigFactory.CLOSE_BY_AI);
                    if (dataItemConfig.reConfigFlashIfHdrChanged(this.mCurrentMode, str)) {
                        updateConfigItem(193);
                    }
                    if (dataItemConfig.reConfigBokehIfHdrChanged(this.mCurrentMode, str)) {
                        updateConfigItem(200);
                    }
                    configChanges.configHdr(str);
                }
                this.mLastAnimationComponent.reverse(true);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:14:0x002f, code lost:
        if (r13 == 162) goto L_0x0036;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0031, code lost:
        switch(r13) {
            case 168: goto L_0x0036;
            case 169: goto L_0x0036;
            case 170: goto L_0x0036;
            default: goto L_0x0034;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x0034, code lost:
        r1 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0036, code lost:
        r1 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0040, code lost:
        r1 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0041, code lost:
        if (r1 == false) goto L_0x0047;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0043, code lost:
        onBackEvent(4);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x0047, code lost:
        if (r4 == false) goto L_0x004e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0049, code lost:
        r12.mDisabledFunctionMenu.clear();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x004e, code lost:
        r1 = getTopAlert();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x0052, code lost:
        if (r1 == null) goto L_0x0057;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x0054, code lost:
        r1.provideAnimateElement(r13, r14, r15);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x0057, code lost:
        r15 = com.android.camera.data.DataRepository.dataItemConfig();
        r1 = com.android.camera.data.DataRepository.dataItemGlobal().getCurrentCameraId();
        r4 = com.android.camera.module.loader.camera2.Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(r1, r12.mCurrentMode);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x006d, code lost:
        if (r4 != null) goto L_0x0070;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x006f, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x0076, code lost:
        if (r12.mTopConfigMenu.getVisibility() == 0) goto L_0x007d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:0x0078, code lost:
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r12.mTopConfigMenu);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x007d, code lost:
        r12.mSupportedConfigs = com.android.camera.data.data.config.SupportedConfigFactory.getSupportedTopConfigs(r12.mCurrentMode, r1, r4, com.android.camera.data.DataRepository.dataItemGlobal().isNormalIntent());
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x0094, code lost:
        if (r1 >= r12.mConfigViews.size()) goto L_0x0128;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x0096, code lost:
        r10 = (android.widget.ImageView) r12.mConfigViews.get(r1);
        r10.setEnabled(true);
        r11 = r12.mSupportedConfigs.getConfigItem(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x00a8, code lost:
        if (r14 == null) goto L_0x00ac;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x00aa, code lost:
        r9 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x00ac, code lost:
        r9 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x00ad, code lost:
        r4 = setTopImageResource(r11, r10, r13, r15, r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x00b6, code lost:
        if (r4 == false) goto L_0x00cd;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x00c0, code lost:
        if (r12.mDisabledFunctionMenu.indexOfKey(r11.configItem) < 0) goto L_0x00cd;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x00ca, code lost:
        if (r12.mDisabledFunctionMenu.get(r11.configItem) == false) goto L_0x00cd;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x00cd, code lost:
        r5 = (com.android.camera.data.data.config.TopConfigItem) r10.getTag();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:0x00d3, code lost:
        if (r5 == null) goto L_0x00df;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x00d9, code lost:
        if (r5.configItem != r11.configItem) goto L_0x00df;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x00db, code lost:
        r10.setTag(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00df, code lost:
        r10.setTag(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x00e2, code lost:
        if (r14 != null) goto L_0x00ee;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x00e4, code lost:
        if (r4 == false) goto L_0x00ea;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x00e6, code lost:
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x00ea, code lost:
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x00f0, code lost:
        if (r4 == false) goto L_0x0107;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x00f2, code lost:
        r4 = new com.android.camera.animation.type.AlphaInOnSubscribe(r10);
        r4.setStartDelayTime(150).setDurationTime(150);
        r14.add(io.reactivex.Completable.create(r4));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:62:0x0109, code lost:
        if (r0 == 165) goto L_0x0121;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x010d, code lost:
        if (r12.mCurrentMode != 165) goto L_0x0110;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:65:0x0110, code lost:
        r14.add(io.reactivex.Completable.create(new com.android.camera.animation.type.AlphaOutOnSubscribe(r10).setDurationTime(150)));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x0121, code lost:
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x0124, code lost:
        r1 = r1 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:68:0x0128, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        int i3 = this.mCurrentMode;
        boolean z = i2 == 3;
        MimojiStatusManager mimojiStatusManager = DataRepository.dataItemLive().getMimojiStatusManager();
        if (this.mCurrentMode != 177 || !mimojiStatusManager.IsInMimojiCreate() || i2 == 3) {
            super.provideAnimateElement(i, list, i2);
            switch (i3) {
                case 161:
                    if (i == 161) {
                        boolean z2 = false;
                        break;
                    }
                case 162:
                    break;
                default:
                    switch (i3) {
                        case 168:
                        case 169:
                        case 170:
                            break;
                    }
            }
        }
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        FragmentTopConfigExtra topExtra = getTopExtra();
        if (topExtra != null) {
            topExtra.provideRotateItem(list, i);
        }
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.provideRotateItem(list, i);
        }
    }

    public void reInitAlert(boolean z) {
        FragmentTopAlert topAlert = getTopAlert();
        if ((!CameraSettings.isHandGestureOpen() || DataRepository.dataItemRunning().getHandGestureRunning()) && topAlert != null) {
            topAlert.setShow(true);
            reConfigCommonTip();
            reConfigTipOfFlash(z);
            reConfigTipOfHdr(z);
            topAlert.updateMusicHint();
            alertUpdateValue(4);
            TopConfigProtocol topConfigProtocol = (TopConfigProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(193);
            if (topConfigProtocol != null) {
                switch (this.mCurrentMode) {
                    case 162:
                    case 163:
                        topConfigProtocol.reShowMoon();
                        break;
                }
            }
            ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                configChanges.reCheckVideoUltraClearTip();
                configChanges.reCheckMacroMode();
            }
        }
    }

    public void refreshExtraMenu() {
        if (this.mFragmentTopConfigExtra != null && this.mFragmentTopConfigExtra.isAdded()) {
            this.mFragmentTopConfigExtra.reFresh();
        }
    }

    /* access modifiers changed from: protected */
    public void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
        modeCoordinator.attachProtocol(172, this);
    }

    public void removeConfigItem(int i) {
        resetImages();
    }

    public void removeExtraMenu(int i) {
        onBackEvent(i);
    }

    public void rotate() {
    }

    public void setAiSceneImageLevel(int i) {
        if (i == 25) {
            i = 23;
        }
        Drawable aiSceneDrawable = getAiSceneDrawable(i);
        ImageView topImage = getTopImage(201);
        if (aiSceneDrawable != null && topImage != null) {
            topImage.setImageDrawable(aiSceneDrawable);
        }
    }

    public void setClickEnable(boolean z) {
        super.setClickEnable(z);
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.setClickEnable(z);
        }
    }

    public void setRecordingTimeState(int i) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.setRecordingTimeState(i);
        } else {
            FragmentTopAlert.setPendingRecordingState(i);
        }
    }

    public void setShow(boolean z) {
        if (getTopAlert() != null) {
            getTopAlert().setShow(z);
        }
    }

    public void showConfigMenu() {
        Completable.create(new AlphaInOnSubscribe(this.mTopConfigMenu)).subscribe();
    }

    public void showOrHideMimojiCreateTitle(boolean z) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.showOrHideMimojiCreateTitle(z);
        }
    }

    public void startLiveShotAnimation() {
        ImageView topImage = getTopImage(206);
        if (topImage != null) {
            Drawable drawable = topImage.getDrawable();
            if (drawable instanceof LayerDrawable) {
                RotateDrawable rotateDrawable = (RotateDrawable) ((LayerDrawable) drawable).getDrawable(0);
                if (this.mLiveShotAnimator == null || this.mLiveShotAnimator.getTarget() != rotateDrawable) {
                    this.mLiveShotAnimator = ObjectAnimator.ofInt(rotateDrawable, "level", new int[]{0, DurationConstant.DURATION_VIDEO_RECORDING_CIRCLE});
                    this.mLiveShotAnimator.setDuration(1000);
                    this.mLiveShotAnimator.setInterpolator(new CubicEaseInOutInterpolator());
                }
                if (this.mLiveShotAnimator.isRunning()) {
                    this.mLiveShotAnimator.cancel();
                }
                this.mLiveShotAnimator.start();
            }
        }
    }

    /* access modifiers changed from: protected */
    public void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
        modeCoordinator.detachProtocol(172, this);
    }

    public void updateConfigItem(int... iArr) {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        for (int topImage : iArr) {
            ImageView topImage2 = getTopImage(topImage);
            if (topImage2 != null) {
                setTopImageResource((TopConfigItem) topImage2.getTag(), topImage2, this.mCurrentMode, dataItemConfig, false);
            }
        }
    }

    public void updateContentDescription() {
        ImageView topImage = getTopImage(196);
        if (topImage != null) {
            topImage.setContentDescription(getString(R.string.accessibility_filter_open_panel));
        }
    }

    public void updateRecordingTime(String str) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.updateRecordingTime(str);
        }
    }
}
