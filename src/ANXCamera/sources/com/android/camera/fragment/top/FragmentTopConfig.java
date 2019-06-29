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
import io.reactivex.android.schedulers.AndroidSchedulers;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
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
    private int mCurrentAiSceneLevel;
    private SparseBooleanArray mDisabledFunctionMenu;
    private int mDisplayRectTopMargin;
    private RecyclerView mExpandView;
    private int[] mFilterResources;
    private FragmentTopAlert mFragmentTopAlert;
    private FragmentTopConfigExtra mFragmentTopConfigExtra;
    private boolean mIsRTL;
    private boolean mIsShowExtraMenu;
    private boolean mIsShowTopLyingDirectHint;
    private LastAnimationComponent mLastAnimationComponent;
    private int[] mLightingResource;
    private int[] mLiveMusicSelectResources;
    private ObjectAnimator mLiveShotAnimator;
    private int[] mLiveShotResource;
    private int[] mMacroResources;
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
        int i2 = GravityCompat.START;
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
                    layoutParams.gravity = GravityCompat.START;
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

    private int[] getMacroResources() {
        return new int[]{R.drawable.ic_config_macro_mode_off, R.drawable.ic_config_macro_mode_on};
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

    public static /* synthetic */ void lambda$reInitAlert$0(FragmentTopConfig fragmentTopConfig, FragmentTopAlert fragmentTopAlert, boolean z) {
        if (fragmentTopAlert != null) {
            fragmentTopAlert.setShow(true);
            fragmentTopConfig.reConfigCommonTip();
            fragmentTopConfig.reConfigTipOfFlash(z);
            fragmentTopConfig.reConfigTipOfHdr(z);
            fragmentTopAlert.updateMusicHint();
            fragmentTopConfig.alertUpdateValue(4);
            fragmentTopConfig.updateLyingDirectHint(false, true);
            TopConfigProtocol topConfigProtocol = (TopConfigProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(193);
            if (topConfigProtocol != null) {
                switch (fragmentTopConfig.mCurrentMode) {
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

    private void reConfigCommonTip() {
        if (CameraSettings.isHandGestureOpen() && DataRepository.dataItemRunning().getHandGestureRunning()) {
            alertTopHint(0, (int) R.string.hand_gesture_tip);
        }
        if (CameraSettings.isUltraPixelOn()) {
            alertTopHint(0, DataRepository.dataItemRunning().getComponentUltraPixel().getUltraPixelOpenTip());
        }
        if (!"-1".equals(CameraSettings.getEyeLightType())) {
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

    /* JADX WARNING: type inference failed for: r2v0 */
    /* JADX WARNING: type inference failed for: r2v1, types: [int] */
    /* JADX WARNING: type inference failed for: r2v2 */
    /* JADX WARNING: type inference failed for: r2v3 */
    /* JADX WARNING: type inference failed for: r2v4 */
    /* JADX WARNING: type inference failed for: r2v5, types: [int] */
    /* JADX WARNING: type inference failed for: r2v6, types: [int] */
    /* JADX WARNING: type inference failed for: r2v7 */
    /* JADX WARNING: type inference failed for: r2v8 */
    /* JADX WARNING: type inference failed for: r2v9 */
    /* JADX WARNING: type inference failed for: r2v10 */
    /* JADX WARNING: type inference failed for: r10v17 */
    /* JADX WARNING: type inference failed for: r10v18 */
    /* JADX WARNING: type inference failed for: r2v11 */
    /* JADX WARNING: type inference failed for: r10v19 */
    /* JADX WARNING: type inference failed for: r10v21 */
    /* JADX WARNING: type inference failed for: r10v22 */
    /* JADX WARNING: type inference failed for: r2v12 */
    /* JADX WARNING: type inference failed for: r10v23 */
    /* JADX WARNING: type inference failed for: r2v13, types: [int] */
    /* JADX WARNING: type inference failed for: r2v14 */
    /* JADX WARNING: type inference failed for: r2v15 */
    /* JADX WARNING: type inference failed for: r2v16, types: [int] */
    /* JADX WARNING: type inference failed for: r2v17, types: [int] */
    /* JADX WARNING: type inference failed for: r10v33 */
    /* JADX WARNING: type inference failed for: r10v34 */
    /* JADX WARNING: type inference failed for: r2v18 */
    /* JADX WARNING: type inference failed for: r10v35 */
    /* JADX WARNING: type inference failed for: r10v37 */
    /* JADX WARNING: type inference failed for: r10v38 */
    /* JADX WARNING: type inference failed for: r2v19 */
    /* JADX WARNING: type inference failed for: r10v39 */
    /* JADX WARNING: type inference failed for: r10v44 */
    /* JADX WARNING: type inference failed for: r10v45 */
    /* JADX WARNING: type inference failed for: r2v20 */
    /* JADX WARNING: type inference failed for: r10v46 */
    /* JADX WARNING: type inference failed for: r2v21 */
    /* JADX WARNING: type inference failed for: r2v22 */
    /* JADX WARNING: type inference failed for: r10v55 */
    /* JADX WARNING: type inference failed for: r10v56 */
    /* JADX WARNING: type inference failed for: r2v23 */
    /* JADX WARNING: type inference failed for: r10v57 */
    /* JADX WARNING: type inference failed for: r2v24 */
    /* JADX WARNING: type inference failed for: r2v25 */
    /* JADX WARNING: type inference failed for: r2v26 */
    /* JADX WARNING: type inference failed for: r2v27 */
    /* JADX WARNING: type inference failed for: r2v28 */
    /* JADX WARNING: type inference failed for: r2v29 */
    /* JADX WARNING: type inference failed for: r10v76 */
    /* JADX WARNING: type inference failed for: r10v77 */
    /* JADX WARNING: type inference failed for: r10v78 */
    /* JADX WARNING: type inference failed for: r10v79 */
    /* JADX WARNING: type inference failed for: r2v30 */
    /* JADX WARNING: type inference failed for: r2v31 */
    /* JADX WARNING: type inference failed for: r2v32 */
    /* JADX WARNING: type inference failed for: r2v33 */
    /* JADX WARNING: type inference failed for: r2v34 */
    /* JADX WARNING: type inference failed for: r10v80 */
    /* JADX WARNING: type inference failed for: r10v81 */
    /* JADX WARNING: type inference failed for: r10v82 */
    /* JADX WARNING: type inference failed for: r10v83 */
    /* JADX WARNING: type inference failed for: r10v84 */
    /* JADX WARNING: type inference failed for: r10v85 */
    /* JADX WARNING: type inference failed for: r2v35 */
    /* JADX WARNING: type inference failed for: r2v36 */
    /* JADX WARNING: type inference failed for: r10v86 */
    /* JADX WARNING: type inference failed for: r10v87 */
    /* JADX WARNING: Code restructure failed: missing block: B:128:0x0287, code lost:
        r2 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:130:0x028d, code lost:
        r2 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:131:0x028e, code lost:
        r5 = r10;
        r2 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:132:0x028f, code lost:
        if (r5 <= 0) goto L_0x02f7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:133:0x0291, code lost:
        r10 = getResources().getDrawable(r5);
        r8.margin = getInitialMargin(r8, r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:134:0x02a1, code lost:
        if (r8.margin <= 0) goto L_0x02d5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:135:0x02a3, code lost:
        r11 = (android.widget.FrameLayout.LayoutParams) r9.getLayoutParams();
        r8.margin -= (r10.getIntrinsicWidth() / 2) + r7.mViewPadding;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:136:0x02ba, code lost:
        if (r7.mIsRTL == false) goto L_0x02ce;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:137:0x02bc, code lost:
        r11.leftMargin = ((r7.mTotalWidth - r8.margin) - r10.getIntrinsicWidth()) - (r7.mViewPadding * 2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:138:0x02ce, code lost:
        r11.leftMargin = r8.margin;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:139:0x02d2, code lost:
        r9.setLayoutParams(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:141:0x02d9, code lost:
        if (r8.configItem != 177) goto L_0x02df;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:142:0x02db, code lost:
        r9.setImageDrawable(null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:143:0x02df, code lost:
        r9.setImageDrawable(r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:144:0x02e2, code lost:
        if (r2 <= 0) goto L_0x02f7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:146:0x02e8, code lost:
        if (com.android.camera.Util.isAccessible() != false) goto L_0x02f0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:148:0x02ee, code lost:
        if (com.android.camera.Util.isSetContentDesc() == false) goto L_0x02f7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:149:0x02f0, code lost:
        r9.setContentDescription(getString(r2));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:150:0x02f7, code lost:
        return true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x004d, code lost:
        r2 = com.android.camera.R.string.autozoom_hint;
     */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v2
  assigns: []
  uses: []
  mth insns count: 271
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 30 */
    private boolean setTopImageResource(TopConfigItem topConfigItem, ImageView imageView, int i, DataItemConfig dataItemConfig, boolean z) {
        int i2;
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        int i3 = topConfigItem.configItem;
        ? r2 = 2131296487;
        int i4 = 0;
        switch (i3) {
            case 176:
                return false;
            case 177:
                i2 = R.drawable.ic_new_config_flash_off;
            default:
                switch (i3) {
                    case 193:
                        ComponentConfigFlash componentFlash = dataItemConfig.getComponentFlash();
                        if (!componentFlash.isEmpty()) {
                            i4 = componentFlash.getValueSelectedDrawableIgnoreClose(i);
                            r2 = componentFlash.getValueSelectedStringIdIgnoreClose(i);
                            if (!z) {
                                reConfigTipOfFlash(true);
                                break;
                            }
                        }
                        break;
                    case 194:
                        ComponentConfigHdr componentHdr = dataItemConfig.getComponentHdr();
                        if (!componentHdr.isEmpty()) {
                            i4 = componentHdr.getValueSelectedDrawableIgnoreClose(i);
                            r2 = componentHdr.getValueSelectedStringIdIgnoreClose(i);
                            if (!z) {
                                reConfigTipOfHdr(true);
                                break;
                            }
                        }
                        break;
                    case 195:
                        i4 = getPortraitResources();
                        r2 = 2131296495;
                        break;
                    case 196:
                        int parseInt = Integer.parseInt(z ? DataRepository.getInstance().backUp().getBackupFilter(i, DataRepository.dataItemGlobal().getCurrentCameraId()) : DataRepository.dataItemRunning().getComponentConfigFilter().getComponentValue(i));
                        i2 = (parseInt == FilterInfo.FILTER_ID_NONE || parseInt <= 0) ? this.mFilterResources[0] : this.mFilterResources[1];
                        if (actionProcessing != null) {
                            if (actionProcessing.isShowFilterView()) {
                                r2 = 2131296488;
                                break;
                            }
                        }
                        break;
                    case 197:
                        i4 = getMoreResources();
                        r2 = 2131296493;
                        break;
                    default:
                        switch (i3) {
                            case 199:
                                i4 = getFocusPeakImageResource();
                                r2 = 2131296496;
                                break;
                            case 200:
                                String componentValue = dataItemConfig.getComponentBokeh().getComponentValue(i);
                                i4 = "on".equals(componentValue) ? R.drawable.ic_portrait_button_on : R.drawable.ic_portrait_button_normal;
                                r2 = "on".equals(componentValue) ? 2131296490 : 2131296489;
                                break;
                            case 201:
                                i4 = CameraSettings.getAiSceneOpen(i) ? this.mAiSceneResources[1] : this.mAiSceneResources[0];
                                r2 = CameraSettings.getAiSceneOpen(i) ? 2131296491 : 2131296492;
                                break;
                            case 202:
                                i4 = getHFRImageResource(i);
                                r2 = getHFRContentDesc(i);
                                break;
                            case 203:
                                i2 = DataRepository.dataItemRunning().getComponentRunningLighting().isSwitchOn(i) ? this.mLightingResource[1] : this.mLightingResource[0];
                                if (actionProcessing != null) {
                                    if (!actionProcessing.isShowLightingView()) {
                                        r2 = 2131296518;
                                        break;
                                    } else {
                                        r2 = 2131296519;
                                        break;
                                    }
                                }
                            case 204:
                                i4 = getFPS960ImageResource(i);
                                r2 = DataRepository.dataItemConfig().getComponentConfigSlowMotion().getContentDesc();
                                break;
                            case 205:
                                ComponentConfigUltraWide componentConfigUltraWide = dataItemConfig.getComponentConfigUltraWide();
                                if (!componentConfigUltraWide.isEmpty()) {
                                    i4 = componentConfigUltraWide.getValueSelectedDrawableIgnoreClose(i);
                                    r2 = componentConfigUltraWide.getValueSelectedStringIdIgnoreClose(i);
                                    break;
                                }
                            case 206:
                                boolean isLiveShotOn = CameraSettings.isLiveShotOn();
                                i4 = isLiveShotOn ? this.mLiveShotResource[1] : this.mLiveShotResource[0];
                                r2 = isLiveShotOn ? 2131296839 : 2131296840;
                                break;
                            case 207:
                                boolean backupSwitchState = z ? DataRepository.getInstance().backUp().getBackupSwitchState(i, "pref_ultra_wide_bokeh_enabled", DataRepository.dataItemGlobal().getCurrentCameraId()) : DataRepository.dataItemRunning().isSwitchOn("pref_ultra_wide_bokeh_enabled");
                                i4 = backupSwitchState ? this.mUltraWideBokehResources[1] : this.mUltraWideBokehResources[0];
                                r2 = backupSwitchState ? 2131296852 : 2131296853;
                                break;
                            default:
                                switch (i3) {
                                    case 209:
                                        boolean isUltraPixelOn = CameraSettings.isUltraPixelOn();
                                        i4 = isUltraPixelOn ? this.mUltraPixelPhotographyResources[1] : this.mUltraPixelPhotographyResources[0];
                                        r2 = isUltraPixelOn ? 2131296857 : 2131296858;
                                        break;
                                    case 212:
                                        i4 = DataRepository.dataItemRunning().getComponentRunningShine().getTopConfigEntryRes(i);
                                        break;
                                    case 225:
                                        i4 = getSettingResources();
                                        r2 = 2131296494;
                                        break;
                                    case 239:
                                        i4 = i != 174 ? CameraSettings.isFaceBeautyOn(this.mCurrentMode, null) : CameraSettings.isLiveBeautyOpen() ? R.drawable.ic_beauty_on : R.drawable.ic_beauty_off;
                                        r2 = 2131296503;
                                        break;
                                    case 243:
                                        boolean isVideoBokehOn = CameraSettings.isVideoBokehOn();
                                        String str = TAG;
                                        StringBuilder sb = new StringBuilder();
                                        sb.append("setTopImageResource: VIDEO_BOKEH isSwitchOn = ");
                                        sb.append(isVideoBokehOn);
                                        Log.d(str, sb.toString());
                                        i4 = isVideoBokehOn ? this.mVideoBokehResource[1] : this.mVideoBokehResource[0];
                                        r2 = isVideoBokehOn ? 2131296782 : 2131296783;
                                        break;
                                    case 245:
                                        String[] currentLiveMusic = CameraSettings.getCurrentLiveMusic();
                                        if (!currentLiveMusic[1].isEmpty()) {
                                            alertTopMusicHint(0, currentLiveMusic[1]);
                                            i2 = this.mLiveMusicSelectResources[1];
                                        } else {
                                            i2 = this.mLiveMusicSelectResources[0];
                                        }
                                    case 253:
                                        i4 = CameraSettings.isAutoZoomEnabled(i) ? this.mAutoZoomResources[1] : this.mAutoZoomResources[0];
                                        break;
                                    case 255:
                                        i4 = CameraSettings.isMacroModeEnabled(i) ? this.mMacroResources[1] : this.mMacroResources[0];
                                        break;
                                }
                        }
                }
                break;
        }
    }

    private void showMenu() {
        this.mTopConfigMenu.setVisibility(8);
        hideSwitchHint();
        hideAlert();
        this.mFragmentTopConfigExtra = new FragmentTopConfigExtra();
        this.mFragmentTopConfigExtra.setDegree(this.mDegree);
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

    public void alertMimojiFaceDetect(boolean z, int i) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null && topAlert.isShow()) {
            topAlert.alertMimojiFaceDetect(z, i);
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
            topAlert.alertVideoUltraClear(i, i2, Util.getDisplayRect(getContext()).top + getResources().getDimensionPixelSize(R.dimen.video_ultra_tip_margin_top), !(this.mFragmentTopConfigExtra == null || !this.mFragmentTopConfigExtra.isAdded()));
        }
    }

    public void clearAlertStatus() {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.clearAlertStatus();
        }
    }

    public void directHideLyingDirectHint() {
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

    public int getCurrentAiSceneLevel() {
        return this.mCurrentAiSceneLevel;
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
            topAlert.clear(true);
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
        this.mMacroResources = getMacroResources();
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
        int i3 = this.mCurrentMode;
        int i4 = 7;
        if (this.mResetType != 7) {
            i4 = 2;
        }
        provideAnimateElement(i3, null, i4);
        if (this.mFragmentTopAlert == null) {
            this.mFragmentTopAlert = new FragmentTopAlert();
            this.mFragmentTopAlert.setShow(!isExtraMenuShowing());
            this.mFragmentTopAlert.setDegree(this.mDegree);
            FragmentUtils.addFragmentWithTag(getChildFragmentManager(), (int) R.id.top_alert, (Fragment) this.mFragmentTopAlert, this.mFragmentTopAlert.getFragmentTag());
        }
    }

    public void onAngleChanged(float f) {
    }

    public boolean onBackEvent(int i) {
        boolean z = false;
        if (this.mLastAnimationComponent.reverse(i != 4)) {
            return true;
        }
        boolean z2 = this.mIsShowExtraMenu;
        FragmentTopConfigExtra topExtra = getTopExtra();
        if (topExtra == null) {
            return false;
        }
        switch (i) {
            case 1:
            case 2:
                topExtra.animateOut();
                Completable.create(new AlphaInOnSubscribe(this.mTopConfigMenu).setStartDelayTime(200)).subscribe();
                break;
            case 6:
                topExtra.animateOut();
                Completable.create(new AlphaInOnSubscribe(this.mTopConfigMenu).setStartDelayTime(200)).subscribe();
                break;
            case 7:
                z = z2;
                break;
            default:
                FragmentUtils.removeFragmentByTag(getChildFragmentManager(), String.valueOf(245));
                this.mTopConfigMenu.setVisibility(0);
                break;
        }
        if (!(i == 4 || i == 7)) {
            reInitAlert(true);
        }
        this.mIsShowExtraMenu = z;
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
                            } else if (i == 253) {
                                configChanges.onConfigChanged(253);
                            } else if (i != 255) {
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
                                configChanges.onConfigChanged(255);
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

    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0039, code lost:
        if (r13 == 162) goto L_0x0040;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x003b, code lost:
        switch(r13) {
            case 168: goto L_0x0040;
            case 169: goto L_0x0040;
            case 170: goto L_0x0040;
            default: goto L_0x003e;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x003e, code lost:
        r1 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0040, code lost:
        r1 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x004a, code lost:
        r1 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x004c, code lost:
        if (r1 == false) goto L_0x0057;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x004e, code lost:
        if (r15 != 7) goto L_0x0053;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x0050, code lost:
        r1 = 7;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x0053, code lost:
        r1 = 4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x0054, code lost:
        onBackEvent(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x005b, code lost:
        if (isExtraMenuShowing() == false) goto L_0x0064;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:0x005d, code lost:
        if (r15 != 7) goto L_0x0064;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x005f, code lost:
        r12.mFragmentTopConfigExtra.provideAnimateElement(r13, r14, r15);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:0x0064, code lost:
        if (r4 == false) goto L_0x0082;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x0072, code lost:
        if (com.android.camera.data.DataRepository.dataItemLive().getMimojiStatusManager().IsInMimojiPreview() != false) goto L_0x007d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x0074, code lost:
        enableMenuItem(true, 197, 193);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x007d, code lost:
        r12.mDisabledFunctionMenu.clear();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x0082, code lost:
        r1 = getTopAlert();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x0086, code lost:
        if (r1 == null) goto L_0x008b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x0088, code lost:
        r1.provideAnimateElement(r13, r14, r15);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x008b, code lost:
        r15 = com.android.camera.data.DataRepository.dataItemConfig();
        r1 = com.android.camera.data.DataRepository.dataItemGlobal().getCurrentCameraId();
        r5 = com.android.camera.module.loader.camera2.Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(r1, r12.mCurrentMode);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x00a1, code lost:
        if (r5 != null) goto L_0x00a4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:46:0x00a3, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x00a4, code lost:
        if (r4 == false) goto L_0x00b3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:0x00ac, code lost:
        if (r12.mTopConfigMenu.getVisibility() == 0) goto L_0x00b3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x00ae, code lost:
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r12.mTopConfigMenu);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x00b3, code lost:
        r12.mSupportedConfigs = com.android.camera.data.data.config.SupportedConfigFactory.getSupportedTopConfigs(r12.mCurrentMode, r1, r5, com.android.camera.data.DataRepository.dataItemGlobal().isNormalIntent());
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00ca, code lost:
        if (r1 >= r12.mConfigViews.size()) goto L_0x015d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x00cc, code lost:
        r4 = (android.widget.ImageView) r12.mConfigViews.get(r1);
        r4.setEnabled(true);
        r11 = r12.mSupportedConfigs.getConfigItem(r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x00dd, code lost:
        if (r14 == null) goto L_0x00e1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x00df, code lost:
        r10 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x00e1, code lost:
        r10 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x00e2, code lost:
        r5 = setTopImageResource(r11, r4, r13, r15, r10);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x00eb, code lost:
        if (r5 == false) goto L_0x0102;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x00f5, code lost:
        if (r12.mDisabledFunctionMenu.indexOfKey(r11.configItem) < 0) goto L_0x0102;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:63:0x00ff, code lost:
        if (r12.mDisabledFunctionMenu.get(r11.configItem) == false) goto L_0x0102;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x0102, code lost:
        r6 = (com.android.camera.data.data.config.TopConfigItem) r4.getTag();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:65:0x0108, code lost:
        if (r6 == null) goto L_0x0114;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x010e, code lost:
        if (r6.configItem != r11.configItem) goto L_0x0114;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:68:0x0110, code lost:
        r4.setTag(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:69:0x0114, code lost:
        r4.setTag(r11);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x0117, code lost:
        if (r14 != null) goto L_0x0123;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x0119, code lost:
        if (r5 == false) goto L_0x011f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x011b, code lost:
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r4);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:73:0x011f, code lost:
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r4);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:75:0x0125, code lost:
        if (r5 == false) goto L_0x013c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:76:0x0127, code lost:
        r5 = new com.android.camera.animation.type.AlphaInOnSubscribe(r4);
        r5.setStartDelayTime(150).setDurationTime(150);
        r14.add(io.reactivex.Completable.create(r5));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:78:0x013e, code lost:
        if (r0 == 165) goto L_0x0156;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:80:0x0142, code lost:
        if (r12.mCurrentMode != 165) goto L_0x0145;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:81:0x0145, code lost:
        r14.add(io.reactivex.Completable.create(new com.android.camera.animation.type.AlphaOutOnSubscribe(r4).setDurationTime(150)));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:82:0x0156, code lost:
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r4);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:83:0x0159, code lost:
        r1 = r1 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:84:0x015d, code lost:
        return;
     */
    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        int i3 = this.mCurrentMode;
        boolean z = i2 == 3;
        MimojiStatusManager mimojiStatusManager = DataRepository.dataItemLive().getMimojiStatusManager();
        if (this.mCurrentMode != 177 || !mimojiStatusManager.IsInMimojiCreate() || i2 == 3) {
            if (isInModeChanging() || i2 == 3) {
                this.mIsShowTopLyingDirectHint = false;
            }
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
        if (!CameraSettings.isHandGestureOpen() || DataRepository.dataItemRunning().getHandGestureRunning()) {
            AndroidSchedulers.mainThread().scheduleDirect(new Runnable(topAlert, z) {
                private final /* synthetic */ FragmentTopAlert f$1;
                private final /* synthetic */ boolean f$2;

                {
                    this.f$1 = r2;
                    this.f$2 = r3;
                }

                public final void run() {
                    FragmentTopConfig.lambda$reInitAlert$0(FragmentTopConfig.this, this.f$1, this.f$2);
                }
            }, this.mIsShowExtraMenu ? 120 : 0, TimeUnit.MILLISECONDS);
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
        this.mCurrentAiSceneLevel = i;
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

    public void updateLyingDirectHint(boolean z, boolean z2) {
        if (!z2) {
            this.mIsShowTopLyingDirectHint = z;
        }
        if (!isExtraMenuShowing()) {
            FragmentTopAlert topAlert = getTopAlert();
            if (topAlert != null && topAlert.isShow()) {
                topAlert.updateLyingDirectHint(this.mIsShowTopLyingDirectHint);
            }
        }
    }

    public void updateRecordingTime(String str) {
        FragmentTopAlert topAlert = getTopAlert();
        if (topAlert != null) {
            topAlert.updateRecordingTime(str);
        }
    }
}
