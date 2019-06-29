package com.android.camera.fragment.top;

import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.constant.ColorConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigBeauty;
import com.android.camera.data.data.config.ComponentConfigRatio;
import com.android.camera.data.data.config.ComponentRunningMacroMode;
import com.android.camera.data.data.config.ComponentRunningUltraPixel;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.config.SupportedConfigs;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.fragment.CommonRecyclerViewHolder;
import com.android.camera.module.ModuleManager;
import com.android.camera.ui.ColorImageView;

public class ExtraAdapter extends Adapter<CommonRecyclerViewHolder> {
    private DataItemConfig mDataItemConfig;
    private DataItemRunning mDataItemRunning;
    private int mDegree;
    private int mImageNormalColor;
    private OnClickListener mOnClickListener;
    private int mSelectedColor;
    private SupportedConfigs mSupportedConfigs;
    private int mTAG = -1;
    private int mTextNormalColor;

    public ExtraAdapter(SupportedConfigs supportedConfigs, OnClickListener onClickListener) {
        this.mSupportedConfigs = supportedConfigs;
        this.mOnClickListener = onClickListener;
        this.mDataItemRunning = DataRepository.dataItemRunning();
        this.mDataItemConfig = DataRepository.dataItemConfig();
        this.mTextNormalColor = ColorConstant.COLOR_COMMON_NORMAL;
        this.mImageNormalColor = -1315861;
        this.mSelectedColor = -15101209;
    }

    public int getItemCount() {
        return this.mSupportedConfigs.getLength();
    }

    /* JADX WARNING: type inference failed for: r3v0 */
    /* JADX WARNING: type inference failed for: r3v1, types: [int] */
    /* JADX WARNING: type inference failed for: r1v3 */
    /* JADX WARNING: type inference failed for: r3v2 */
    /* JADX WARNING: type inference failed for: r1v8, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v3, types: [boolean] */
    /* JADX WARNING: type inference failed for: r0v22, types: [int] */
    /* JADX WARNING: type inference failed for: r7v0 */
    /* JADX WARNING: type inference failed for: r3v4 */
    /* JADX WARNING: type inference failed for: r1v13 */
    /* JADX WARNING: type inference failed for: r3v5 */
    /* JADX WARNING: type inference failed for: r0v24 */
    /* JADX WARNING: type inference failed for: r7v1 */
    /* JADX WARNING: type inference failed for: r3v6 */
    /* JADX WARNING: type inference failed for: r3v7, types: [int] */
    /* JADX WARNING: type inference failed for: r0v28, types: [boolean] */
    /* JADX WARNING: type inference failed for: r1v15 */
    /* JADX WARNING: type inference failed for: r5v4 */
    /* JADX WARNING: type inference failed for: r3v8 */
    /* JADX WARNING: type inference failed for: r1v16 */
    /* JADX WARNING: type inference failed for: r3v9 */
    /* JADX WARNING: type inference failed for: r5v5, types: [int] */
    /* JADX WARNING: type inference failed for: r0v32 */
    /* JADX WARNING: type inference failed for: r3v10, types: [boolean] */
    /* JADX WARNING: type inference failed for: r5v6, types: [int] */
    /* JADX WARNING: type inference failed for: r3v12, types: [boolean] */
    /* JADX WARNING: type inference failed for: r7v2 */
    /* JADX WARNING: type inference failed for: r3v13 */
    /* JADX WARNING: type inference failed for: r0v39, types: [int] */
    /* JADX WARNING: type inference failed for: r1v22 */
    /* JADX WARNING: type inference failed for: r3v14 */
    /* JADX WARNING: type inference failed for: r3v15 */
    /* JADX WARNING: type inference failed for: r1v24, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v16 */
    /* JADX WARNING: type inference failed for: r1v26, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v17 */
    /* JADX WARNING: type inference failed for: r1v28, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v18 */
    /* JADX WARNING: type inference failed for: r1v29, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v19 */
    /* JADX WARNING: type inference failed for: r1v30, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v20 */
    /* JADX WARNING: type inference failed for: r1v32, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v21 */
    /* JADX WARNING: type inference failed for: r1v34, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v22 */
    /* JADX WARNING: type inference failed for: r1v36, types: [boolean] */
    /* JADX WARNING: type inference failed for: r0v49 */
    /* JADX WARNING: type inference failed for: r3v23 */
    /* JADX WARNING: type inference failed for: r1v39, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v24, types: [boolean] */
    /* JADX WARNING: type inference failed for: r5v16, types: [int] */
    /* JADX WARNING: type inference failed for: r3v25 */
    /* JADX WARNING: type inference failed for: r1v42, types: [boolean] */
    /* JADX WARNING: type inference failed for: r3v26 */
    /* JADX WARNING: type inference failed for: r1v44, types: [boolean] */
    /* JADX WARNING: type inference failed for: r0v55 */
    /* JADX WARNING: type inference failed for: r0v56 */
    /* JADX WARNING: type inference failed for: r1v47 */
    /* JADX WARNING: type inference failed for: r3v27 */
    /* JADX WARNING: type inference failed for: r3v28 */
    /* JADX WARNING: type inference failed for: r3v29 */
    /* JADX WARNING: type inference failed for: r3v30 */
    /* JADX WARNING: type inference failed for: r3v31 */
    /* JADX WARNING: type inference failed for: r3v32 */
    /* JADX WARNING: type inference failed for: r3v33 */
    /* JADX WARNING: type inference failed for: r1v48 */
    /* JADX WARNING: type inference failed for: r3v34 */
    /* JADX WARNING: type inference failed for: r0v58 */
    /* JADX WARNING: type inference failed for: r3v35 */
    /* JADX WARNING: type inference failed for: r3v36 */
    /* JADX WARNING: type inference failed for: r5v18 */
    /* JADX WARNING: type inference failed for: r0v59 */
    /* JADX WARNING: type inference failed for: r3v37 */
    /* JADX WARNING: type inference failed for: r5v19 */
    /* JADX WARNING: type inference failed for: r3v38 */
    /* JADX WARNING: type inference failed for: r1v49 */
    /* JADX WARNING: type inference failed for: r3v39 */
    /* JADX WARNING: type inference failed for: r1v50 */
    /* JADX WARNING: type inference failed for: r3v40 */
    /* JADX WARNING: type inference failed for: r1v51 */
    /* JADX WARNING: type inference failed for: r3v41 */
    /* JADX WARNING: type inference failed for: r1v52 */
    /* JADX WARNING: type inference failed for: r3v42 */
    /* JADX WARNING: type inference failed for: r1v53 */
    /* JADX WARNING: type inference failed for: r3v43 */
    /* JADX WARNING: type inference failed for: r1v54 */
    /* JADX WARNING: type inference failed for: r3v44 */
    /* JADX WARNING: type inference failed for: r1v55 */
    /* JADX WARNING: type inference failed for: r3v45 */
    /* JADX WARNING: type inference failed for: r1v56 */
    /* JADX WARNING: type inference failed for: r0v60 */
    /* JADX WARNING: type inference failed for: r3v46 */
    /* JADX WARNING: type inference failed for: r1v57 */
    /* JADX WARNING: type inference failed for: r3v47 */
    /* JADX WARNING: type inference failed for: r5v20 */
    /* JADX WARNING: type inference failed for: r3v48 */
    /* JADX WARNING: type inference failed for: r1v58 */
    /* JADX WARNING: type inference failed for: r3v49 */
    /* JADX WARNING: type inference failed for: r1v59 */
    /* JADX WARNING: type inference failed for: r0v61 */
    /* JADX WARNING: type inference failed for: r0v62 */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x016c, code lost:
        r1 = r3;
        r3 = r5;
     */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r3v4
  assigns: []
  uses: []
  mth insns count: 215
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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 49 */
    public void onBindViewHolder(final CommonRecyclerViewHolder commonRecyclerViewHolder, int i) {
        ? r3;
        ? r1;
        int i2;
        int resText;
        ? r7;
        ? r32;
        ? r33;
        ? r0;
        ? r34;
        int i3;
        ? r5;
        ? r35;
        int config = this.mSupportedConfigs.getConfig(i);
        commonRecyclerViewHolder.itemView.setTag(Integer.valueOf(config));
        commonRecyclerViewHolder.itemView.setOnClickListener(this.mOnClickListener);
        int currentMode = DataRepository.dataItemGlobal().getCurrentMode();
        ? r36 = 0;
        String str = null;
        if (config != 252) {
            if (config != 255) {
                switch (config) {
                    case 209:
                        ComponentRunningUltraPixel componentUltraPixel = DataRepository.dataItemRunning().getComponentUltraPixel();
                        ? menuDrawable = componentUltraPixel.getMenuDrawable();
                        str = componentUltraPixel.getMenuString();
                        r1 = CameraSettings.isUltraPixelOn();
                        i2 = -1;
                        r3 = menuDrawable;
                        break;
                    case 210:
                        ComponentConfigRatio componentConfigRatio = this.mDataItemConfig.getComponentConfigRatio();
                        ? valueSelectedDrawable = componentConfigRatio.getValueSelectedDrawable(currentMode);
                        i2 = componentConfigRatio.getValueDisplayString(currentMode);
                        r35 = r36;
                        r5 = valueSelectedDrawable;
                        break;
                    default:
                        switch (config) {
                            case 225:
                                resText = R.string.config_name_setting;
                                r33 = r36;
                                r0 = 2130837667;
                                break;
                            case 226:
                                ComponentRunningTimer componentRunningTimer = this.mDataItemRunning.getComponentRunningTimer();
                                ? isSwitchOn = componentRunningTimer.isSwitchOn();
                                ? valueSelectedDrawable2 = componentRunningTimer.getValueSelectedDrawable(160);
                                i2 = componentRunningTimer.getValueDisplayString(160);
                                r35 = isSwitchOn;
                                r5 = valueSelectedDrawable2;
                                break;
                            default:
                                switch (config) {
                                    case 228:
                                        ComponentRunningTiltValue componentRunningTiltValue = this.mDataItemRunning.getComponentRunningTiltValue();
                                        ? isSwitchOn2 = this.mDataItemRunning.isSwitchOn("pref_camera_tilt_shift_mode");
                                        if (isSwitchOn2 != 0) {
                                            int valueDisplayString = componentRunningTiltValue.getValueDisplayString(160);
                                            r1 = isSwitchOn2;
                                            r3 = componentRunningTiltValue.getValueSelectedDrawable(160);
                                            i2 = valueDisplayString;
                                            break;
                                        } else {
                                            i3 = R.string.config_name_tilt;
                                            r7 = isSwitchOn2;
                                            r34 = R.drawable.ic_config_tilt;
                                        }
                                    case 229:
                                        i2 = R.string.config_name_straighten;
                                        r3 = 2130837682;
                                        r1 = this.mDataItemRunning.isSwitchOn("pref_camera_gradienter_key");
                                        break;
                                    case 230:
                                        i2 = R.string.config_name_hht;
                                        r3 = 2130837674;
                                        r1 = this.mDataItemRunning.isSwitchOn("pref_camera_hand_night_key");
                                        break;
                                    case 231:
                                        i2 = R.string.config_name_magic;
                                        r3 = 2130837677;
                                        r1 = this.mDataItemRunning.isSwitchOn("pref_camera_ubifocus_key");
                                        break;
                                    case 232:
                                        i2 = R.string.pref_video_speed_slow_title;
                                        r3 = 2130837681;
                                        r1 = ModuleManager.isSlowMotionModule();
                                        break;
                                    case 233:
                                        i2 = R.string.pref_video_speed_fast_title;
                                        r3 = 2130837668;
                                        r1 = ModuleManager.isFastMotionModule();
                                        break;
                                    case 234:
                                        i2 = R.string.config_name_scene;
                                        r3 = 2130837680;
                                        r1 = this.mDataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key");
                                        break;
                                    case 235:
                                        i2 = R.string.config_name_group;
                                        r3 = 2130837672;
                                        r1 = this.mDataItemRunning.isSwitchOn("pref_camera_groupshot_mode_key");
                                        break;
                                    case 236:
                                        i2 = R.string.pref_camera_magic_mirror_title;
                                        r3 = 2130837678;
                                        r1 = this.mDataItemRunning.isSwitchOn("pref_camera_magic_mirror_key");
                                        break;
                                    case 237:
                                        resText = R.string.pref_camera_picture_format_entry_raw;
                                        r33 = r36;
                                        r0 = 2130837679;
                                        break;
                                    case 238:
                                        i2 = R.string.pref_camera_show_gender_age_config_title;
                                        r3 = 2130837671;
                                        r1 = this.mDataItemRunning.isSwitchOn("pref_camera_show_gender_age_key");
                                        break;
                                    case 239:
                                        ComponentConfigBeauty componentConfigBeauty = this.mDataItemConfig.getComponentConfigBeauty();
                                        ? isSwitchOn3 = componentConfigBeauty.isSwitchOn(currentMode);
                                        ? valueSelectedDrawable3 = componentConfigBeauty.getValueSelectedDrawable(currentMode);
                                        i2 = componentConfigBeauty.getValueDisplayString(currentMode);
                                        r35 = isSwitchOn3;
                                        r5 = valueSelectedDrawable3;
                                        break;
                                    case 240:
                                        i2 = R.string.pref_camera_device_watermark_title;
                                        r3 = 2130837666;
                                        r1 = CameraSettings.isDualCameraWaterMarkOpen();
                                        break;
                                    case 241:
                                        i2 = R.string.config_name_super_resolution;
                                        r3 = 2130837683;
                                        r1 = this.mDataItemRunning.isSwitchOn("pref_camera_super_resolution_key");
                                        break;
                                    case 242:
                                        if (!Util.isGlobalVersion()) {
                                            resText = R.string.pref_ai_detect;
                                            r33 = r36;
                                            r0 = 2130837661;
                                            break;
                                        } else {
                                            resText = R.string.pref_google_lens;
                                            r33 = r36;
                                            r0 = 2130837662;
                                            break;
                                        }
                                    default:
                                        i2 = -1;
                                        r1 = 0;
                                        r3 = r36;
                                        break;
                                }
                        }
                }
            } else {
                ComponentRunningMacroMode componentRunningMacroMode = DataRepository.dataItemRunning().getComponentRunningMacroMode();
                ? isSwitchOn4 = componentRunningMacroMode.isSwitchOn(currentMode);
                ? resIcon = componentRunningMacroMode.getResIcon(isSwitchOn4);
                resText = componentRunningMacroMode.getResText();
                r33 = isSwitchOn4;
                r0 = resIcon;
            }
            r7 = r33;
            r34 = r0;
            i3 = resText;
            r1 = r7;
            r3 = r32;
        } else {
            i2 = R.string.hand_gesture_tip;
            r3 = 2130837673;
            r1 = this.mDataItemRunning.isSwitchOn("pref_hand_gesture");
        }
        TextView textView = (TextView) commonRecyclerViewHolder.getView(R.id.extra_item_text);
        textView.setSelected(true);
        ColorImageView colorImageView = (ColorImageView) commonRecyclerViewHolder.getView(R.id.extra_item_image);
        if (i2 != -1) {
            textView.setText(i2);
        } else {
            textView.setText(str);
        }
        int i4 = r1 != 0 ? this.mSelectedColor : this.mTextNormalColor;
        int i5 = r1 != 0 ? this.mSelectedColor : this.mImageNormalColor;
        textView.setTextColor(i4);
        colorImageView.setColor(i5);
        colorImageView.setImageResource(r3);
        if ((Util.isAccessible() || Util.isSetContentDesc()) && this.mTAG == config) {
            StringBuilder sb = new StringBuilder();
            sb.append(textView.getText());
            if (r1 != 0) {
                sb.append(commonRecyclerViewHolder.itemView.getResources().getString(R.string.accessibility_open));
            } else {
                sb.append(commonRecyclerViewHolder.itemView.getResources().getString(R.string.accessibility_closed));
            }
            commonRecyclerViewHolder.itemView.setContentDescription(sb);
            commonRecyclerViewHolder.itemView.postDelayed(new Runnable() {
                public void run() {
                    commonRecyclerViewHolder.itemView.sendAccessibilityEvent(128);
                }
            }, 100);
        }
    }

    public CommonRecyclerViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        View inflate = LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.fragment_top_config_extra_item, viewGroup, false);
        if (this.mDegree != 0) {
            ViewCompat.setRotation(inflate, (float) this.mDegree);
        }
        return new CommonRecyclerViewHolder(inflate);
    }

    public void setNewDegree(int i) {
        this.mDegree = i;
    }

    public void setOnClictTag(int i) {
        this.mTAG = i;
    }
}
