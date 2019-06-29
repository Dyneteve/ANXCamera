package com.android.camera.fragment.top;

import android.os.Bundle;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.ScaleAnimation;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.ComponentConfigRatio;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.TopConfigProtocol;
import com.android.camera.statistic.CameraStat;
import io.reactivex.Completable;
import java.util.List;
import miui.view.animation.QuarticEaseInOutInterpolator;
import miui.view.animation.QuarticEaseOutInterpolator;
import miui.view.animation.SineEaseInInterpolator;

public class FragmentTopConfigExtra extends BaseFragment implements OnClickListener {
    public static final int FRAGMENT_INFO = 245;
    public static final int TOP_CONFIG_EXTRA_ANIM_OUT_ALPHA_TIME = 120;
    /* access modifiers changed from: private */
    public View mBackgroundView;
    private ExtraAdapter mExtraAdapter;
    private RecyclerView mRecyclerView;

    private void addContentDescriptionForConfigs(int i) {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        StringBuilder sb = new StringBuilder();
        switch (i) {
            case 226:
                ComponentRunningTimer componentRunningTimer = dataItemRunning.getComponentRunningTimer();
                boolean isSwitchOn = componentRunningTimer.isSwitchOn();
                sb.append(getString(componentRunningTimer.getValueDisplayString(160)));
                if (!isSwitchOn) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                }
                break;
            case 228:
                ComponentRunningTiltValue componentRunningTiltValue = dataItemRunning.getComponentRunningTiltValue();
                if (!dataItemRunning.isSwitchOn("pref_camera_tilt_shift_mode")) {
                    sb.append(getString(R.string.config_name_tilt));
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(componentRunningTiltValue.getValueDisplayString(160)));
                    break;
                }
            case 229:
                boolean isSwitchOn2 = dataItemRunning.isSwitchOn("pref_camera_gradienter_key");
                sb.append(getString(R.string.config_name_straighten));
                if (!isSwitchOn2) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(R.string.accessibility_open));
                    break;
                }
            case 230:
                boolean isSwitchOn3 = dataItemRunning.isSwitchOn("pref_camera_hand_night_key");
                sb.append(getString(R.string.config_name_hht));
                if (!isSwitchOn3) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(R.string.accessibility_open));
                    break;
                }
            case 231:
                boolean isSwitchOn4 = dataItemRunning.isSwitchOn("pref_camera_ubifocus_key");
                sb.append(getString(R.string.config_name_magic));
                if (!isSwitchOn4) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(R.string.accessibility_open));
                    break;
                }
            case 232:
                boolean isSwitchOn5 = dataItemRunning.isSwitchOn("pref_video_speed_slow_key");
                sb.append(getString(R.string.pref_video_speed_slow_title));
                if (!isSwitchOn5) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(R.string.accessibility_open));
                    break;
                }
            case 233:
                boolean isSwitchOn6 = dataItemRunning.isSwitchOn("pref_video_speed_fast_key");
                sb.append(getString(R.string.pref_video_speed_fast_title));
                if (!isSwitchOn6) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(R.string.accessibility_open));
                    break;
                }
            case 234:
                boolean isSwitchOn7 = dataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key");
                sb.append(getString(R.string.config_name_scene));
                if (!isSwitchOn7) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(R.string.accessibility_open));
                    break;
                }
            case 235:
                boolean isSwitchOn8 = dataItemRunning.isSwitchOn("pref_camera_groupshot_mode_key");
                sb.append(getString(R.string.config_name_group));
                if (!isSwitchOn8) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(R.string.accessibility_open));
                    break;
                }
            case 236:
                boolean isSwitchOn9 = dataItemRunning.isSwitchOn("pref_camera_magic_mirror_key");
                sb.append(getString(R.string.pref_camera_magic_mirror_title));
                if (!isSwitchOn9) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(R.string.accessibility_open));
                    break;
                }
            case 238:
                boolean isSwitchOn10 = dataItemRunning.isSwitchOn("pref_camera_show_gender_age_key");
                sb.append(getString(R.string.pref_camera_show_gender_age_config_title));
                if (!isSwitchOn10) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(R.string.accessibility_open));
                    break;
                }
            case 239:
                int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
                ComponentConfigBeauty componentConfigBeauty = dataItemConfig.getComponentConfigBeauty();
                boolean isSwitchOn11 = componentConfigBeauty.isSwitchOn(currentMode);
                sb.append(getString(componentConfigBeauty.getValueDisplayString(currentMode)));
                if (!isSwitchOn11) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(R.string.accessibility_open));
                    break;
                }
            case 240:
                boolean isDualCameraWaterMarkOpen = CameraSettings.isDualCameraWaterMarkOpen();
                sb.append(getString(R.string.pref_camera_device_watermark_title));
                if (!isDualCameraWaterMarkOpen) {
                    sb.append(getString(R.string.accessibility_closed));
                    break;
                } else {
                    sb.append(getString(R.string.accessibility_open));
                    break;
                }
        }
        if (!TextUtils.isEmpty(sb) && Util.isAccessible()) {
            this.mRecyclerView.setContentDescription(sb);
            this.mRecyclerView.sendAccessibilityEvent(4);
        }
    }

    private void adjustViewBackground(boolean z) {
        int uiStyle = DataRepository.dataItemRunning().getUiStyle();
        if (z) {
            String componentValue = DataRepository.dataItemConfig().getComponentConfigRatio().getComponentValue(this.mCurrentMode);
            char c = 65535;
            int hashCode = componentValue.hashCode();
            if (hashCode != 1517352) {
                if (hashCode != 1518313) {
                    if (hashCode == 1456894192 && componentValue.equals(ComponentConfigRatio.RATIO_FULL_195X9)) {
                        c = 0;
                    }
                } else if (componentValue.equals(ComponentConfigRatio.RATIO_FULL_19X9)) {
                    c = 1;
                }
            } else if (componentValue.equals(ComponentConfigRatio.RATIO_FULL_18X9)) {
                c = 2;
            }
            switch (c) {
                case 0:
                case 1:
                case 2:
                    if (uiStyle == 3) {
                        this.mBackgroundView.postDelayed(new Runnable() {
                            public void run() {
                                if (FragmentTopConfigExtra.this.isAdded()) {
                                    FragmentTopConfigExtra.this.mBackgroundView.setBackgroundResource(R.color.halfscreen_background);
                                }
                            }
                        }, 300);
                        return;
                    }
                    return;
                default:
                    this.mBackgroundView.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
                    return;
            }
        } else if (uiStyle != 3) {
            this.mBackgroundView.setBackgroundColor(ViewCompat.MEASURED_STATE_MASK);
        } else {
            this.mBackgroundView.setBackgroundResource(R.color.halfscreen_background);
        }
    }

    public void animateIn() {
        ScaleAnimation scaleAnimation = new ScaleAnimation(1.0f, 1.0f, 0.0f, 1.0f);
        scaleAnimation.setInterpolator(new QuarticEaseInOutInterpolator());
        scaleAnimation.setDuration(320);
        this.mBackgroundView.startAnimation(scaleAnimation);
        AlphaAnimation alphaAnimation = new AlphaAnimation(0.0f, 1.0f);
        alphaAnimation.setInterpolator(new QuarticEaseOutInterpolator());
        alphaAnimation.setStartOffset(150);
        alphaAnimation.setDuration(280);
        this.mRecyclerView.startAnimation(alphaAnimation);
    }

    public void animateOut() {
        AnonymousClass2 r0 = new AnimationListener() {
            public void onAnimationEnd(Animation animation) {
                if (FragmentTopConfigExtra.this.canProvide()) {
                    FragmentUtils.removeFragmentByTag(FragmentTopConfigExtra.this.getFragmentManager(), FragmentTopConfigExtra.this.getFragmentTag());
                }
            }

            public void onAnimationRepeat(Animation animation) {
            }

            public void onAnimationStart(Animation animation) {
                FragmentTopConfigExtra.this.setClickEnable(false);
            }
        };
        ScaleAnimation scaleAnimation = new ScaleAnimation(1.0f, 1.0f, 1.0f, 0.0f);
        scaleAnimation.setInterpolator(new QuarticEaseInOutInterpolator());
        scaleAnimation.setDuration(320);
        scaleAnimation.setAnimationListener(r0);
        this.mBackgroundView.startAnimation(scaleAnimation);
        AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
        alphaAnimation.setInterpolator(new SineEaseInInterpolator());
        alphaAnimation.setDuration(120);
        alphaAnimation.setFillAfter(true);
        this.mRecyclerView.startAnimation(alphaAnimation);
    }

    public int getFragmentInto() {
        return 245;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_top_config_extra;
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        this.mBackgroundView = view.findViewById(R.id.top_config_extra_background);
        this.mRecyclerView = (RecyclerView) view.findViewById(R.id.top_config_extra_recyclerview);
        int currentCameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        SupportedConfigs supportedExtraConfigs = SupportedConfigFactory.getSupportedExtraConfigs(this.mCurrentMode, currentCameraId, DataRepository.dataCloudMgr().DataCloudFeature(), Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(currentCameraId, this.mCurrentMode), DataRepository.dataItemGlobal().isNormalIntent());
        int i = 4;
        if (supportedExtraConfigs.getLength() <= 4) {
            i = supportedExtraConfigs.getLength();
        }
        int max = Math.max(1, i);
        ((MarginLayoutParams) this.mRecyclerView.getLayoutParams()).height = getResources().getDimensionPixelSize(R.dimen.config_item_height) * ((int) Math.ceil((double) (((float) supportedExtraConfigs.getLength()) / ((float) max))));
        provideAnimateElement(this.mCurrentMode, null, 2);
        this.mRecyclerView.setLayoutManager(new GridLayoutManager(getContext(), max));
        this.mExtraAdapter = new ExtraAdapter(supportedExtraConfigs, this);
        this.mExtraAdapter.setNewDegree(this.mDegree);
        this.mRecyclerView.setAdapter(this.mExtraAdapter);
        this.mRecyclerView.setFocusable(false);
    }

    public void onClick(View view) {
        if (isEnableClick()) {
            ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (configChanges != null) {
                int intValue = ((Integer) view.getTag()).intValue();
                configChanges.onConfigChanged(intValue);
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (Util.isAccessible()) {
                    this.mExtraAdapter.setOnClictTag(intValue);
                }
                if (intValue == 225) {
                    topAlert.removeExtraMenu(5);
                } else if (intValue != 242) {
                    this.mRecyclerView.getAdapter().notifyDataSetChanged();
                } else {
                    topAlert.hideExtraMenu();
                    ((TopConfigProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(193)).startAiLens();
                    CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_AI_DETECT_CHANGED);
                }
            }
        }
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        animateIn();
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        adjustViewBackground(i2 == 7);
    }

    /* access modifiers changed from: protected */
    public Animation provideEnterAnimation(int i) {
        return null;
    }

    /* access modifiers changed from: protected */
    public Animation provideExitAnimation() {
        return null;
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        this.mExtraAdapter.setNewDegree(i);
        for (int i2 = 0; i2 < this.mRecyclerView.getChildCount(); i2++) {
            list.add(this.mRecyclerView.getChildAt(i2));
        }
    }

    public void reFresh() {
        this.mRecyclerView.getAdapter().notifyDataSetChanged();
    }
}
