package com.android.camera;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import android.provider.MiuiSettings;
import android.provider.MiuiSettings.Key;
import android.provider.Settings.Secure;
import android.provider.Settings.System;
import android.text.TextUtils;
import android.view.MenuItem;
import android.widget.Toast;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.lib.compatibility.util.CompatibilityUtils.PackageInstallerListener;
import com.android.camera.log.Log;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.PriorityStorageBroadcastReceiver;
import com.android.camera.storage.Storage;
import com.android.camera.ui.PreviewListPreference;
import com.android.camera.ui.ValuePreference;
import com.android.camera2.DetachableClickListener;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import miui.app.ActionBar;

public class CameraPreferenceActivity extends BasePreferenceActivity {
    public static final String FROM_WHERE = "from_where";
    public static final String IS_IMAGE_CAPTURE_INTENT = "IsCaptureIntent";
    protected static final String PREF_KEY_PRIVACY = "pref_privacy";
    protected static final String PREF_KEY_RESTORE = "pref_restore";
    public static final String REMOVE_KEYS = "remove_keys";
    public static final String TAG = CameraPreferenceActivity.class.getSimpleName();
    /* access modifiers changed from: private */
    public PackageInstallerListener mAppInstalledListener = new PackageInstallerListener() {
        public void onPackageInstalled(String str, boolean z) {
            if (z && TextUtils.equals(str, "com.xiaomi.scanner")) {
                final CheckBoxPreference checkBoxPreference = (CheckBoxPreference) CameraPreferenceActivity.this.mPreferenceGroup.findPreference(CameraSettings.KEY_SCAN_QRCODE);
                if (checkBoxPreference != null) {
                    CameraPreferenceActivity.this.runOnUiThread(new Runnable() {
                        public void run() {
                            checkBoxPreference.setChecked(true);
                            CameraPreferenceActivity.this.onPreferenceChange(checkBoxPreference, Boolean.TRUE);
                        }
                    });
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public AlertDialog mDoubleConfirmActionChooseDialog = null;
    private int mFromWhere;
    private boolean mGoToActivity;
    private boolean mHasReset;
    protected PreferenceScreen mPreferenceGroup;
    private Preference mWatermark;

    /* JADX WARNING: type inference failed for: r1v0, types: [android.content.Context, com.android.camera.CameraPreferenceActivity] */
    private void bringUpDoubleConfirmDlg(final PreviewListPreference previewListPreference, final String str) {
        if (this.mDoubleConfirmActionChooseDialog == null) {
            DetachableClickListener wrap = DetachableClickListener.wrap(new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    if (i == -1) {
                        CameraPreferenceActivity.this.mDoubleConfirmActionChooseDialog = null;
                        CameraStatUtil.trackPreferenceChange(CameraSettings.KEY_CAMERA_SNAP, str);
                        previewListPreference.setValue(str);
                        Secure.putString(CameraPreferenceActivity.this.getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN, CameraSettings.getMiuiSettingsKeyForStreetSnap(str));
                    } else if (i == -2) {
                        CameraPreferenceActivity.this.mDoubleConfirmActionChooseDialog.dismiss();
                        CameraPreferenceActivity.this.mDoubleConfirmActionChooseDialog = null;
                    }
                }
            });
            this.mDoubleConfirmActionChooseDialog = new Builder(this).setTitle(R.string.title_snap_double_confirm).setMessage(R.string.message_snap_double_confirm).setPositiveButton(R.string.snap_confirmed, wrap).setNegativeButton(R.string.snap_cancel, wrap).setCancelable(false).create();
            wrap.clearOnDetach(this.mDoubleConfirmActionChooseDialog);
            this.mDoubleConfirmActionChooseDialog.show();
        }
    }

    private void filterByCloud() {
        for (String removePreference : DataRepository.dataCloudMgr().DataCloudFeature().getAllDisabledFeatures()) {
            removePreference(this.mPreferenceGroup, removePreference);
        }
    }

    private void filterByConfig() {
        Log.d(TAG, "filterByConfig:");
        Preference findPreference = this.mPreferenceGroup.findPreference(CameraSettings.KEY_CATEGORY_DEVICE_SETTING);
        Preference findPreference2 = this.mPreferenceGroup.findPreference(CameraSettings.KEY_CATEGORY_CAPTURE_SETTING);
        if (this.mFromWhere == 177) {
            removeFromGroup(findPreference2, "pref_camera_focus_shoot_key");
            removeFromGroup(this.mPreferenceGroup, CameraSettings.KEY_MOVIE_SOLID);
            removeFromGroup(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_QUALITY);
            removeFromGroup(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_HIGH_FRAME_RATE);
            removeFromGroup(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_NEW_SLOW_MOTION);
            removeFromGroup(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_TIME_LAPSE_FRAME_INTERVAL);
            removeFromGroup(this.mPreferenceGroup, CameraSettings.KEY_LONG_PRESS_SHUTTER);
            removeFromGroup(this.mPreferenceGroup, CameraSettings.KEY_FINGERPRINT_CAPTURE);
            removeFromGroup(this.mPreferenceGroup, CameraSettings.KEY_LONG_PRESS_SHUTTER);
        }
        if (this.mFromWhere == 161 || this.mFromWhere == 174 || this.mFromWhere == 169 || this.mFromWhere == 168 || this.mFromWhere == 172 || this.mFromWhere == 170 || this.mFromWhere == 177) {
            removeFromGroup(findPreference, CameraSettings.KEY_FRONT_MIRROR);
            removeFromGroup(findPreference2, CameraSettings.KEY_FRONT_MIRROR);
            return;
        }
        boolean gf = DataRepository.dataItemFeature().gf();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("filterByConfig: isSupportVideoFrontMirror = ");
        sb.append(gf);
        Log.d(str, sb.toString());
        if (gf) {
            removeFromGroup(findPreference2, CameraSettings.KEY_FRONT_MIRROR);
        } else {
            removeFromGroup(findPreference, CameraSettings.KEY_FRONT_MIRROR);
        }
        if (b.jx() && this.mFromWhere == 162) {
            removeFromGroup(findPreference, CameraSettings.KEY_FRONT_MIRROR);
        }
    }

    private void filterByDeviceCapability() {
        if (this.mFromWhere == 172) {
            boolean isSlowMotionFps960 = DataRepository.dataItemConfig().getComponentConfigSlowMotion().isSlowMotionFps960();
            boolean isSlowMotionFps120 = DataRepository.dataItemConfig().getComponentConfigSlowMotion().isSlowMotionFps120();
            PreviewListPreference previewListPreference = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_NEW_SLOW_MOTION);
            if (CameraSettings.getSupportedHfrSettings(0).contains(CameraSettings.SIZE_FPS_1080_240) || isSlowMotionFps120) {
                filterUnsupportedOptions(this.mPreferenceGroup, previewListPreference, Arrays.asList(getResources().getStringArray(R.array.pref_video_new_slow_motion_entryvalues)));
                previewListPreference.setEnabled(true);
            } else {
                previewListPreference.filterUnsupported(Arrays.asList(new String[]{String.valueOf(5)}));
                resetIfInvalid(previewListPreference);
                previewListPreference.setSummary(isSlowMotionFps960 ? R.string.pref_new_slow_motion_video_quality_960_720only : R.string.pref_new_slow_motion_video_quality_240_720only);
                previewListPreference.setEnabled(false);
            }
        }
        if (DataRepository.dataItemFeature().gh()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_HIGH_FRAME_RATE);
        } else {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_NEW_SLOW_MOTION);
        }
        if (!CameraSettings.isH265EncoderSupport()) {
            removeFromGroup(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_ENCODER);
        }
    }

    private void filterByDeviceID() {
        DataRepository.dataItemFeature();
        if (!b.hX()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_HIGH_FRAME_RATE);
        }
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_LONG_PRESS_SHUTTER);
        if (!b.hA()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_MOVIE_SOLID);
        }
        if (!b.hL() && !CameraSettings.isSupportedDualCameraWaterMark()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_WATERMARK);
            removePreference(this.mPreferenceGroup, "pref_dualcamera_watermark_key");
            removePreference(this.mPreferenceGroup, "pref_time_watermark_key");
        } else if (b.hL() && !CameraSettings.isSupportedDualCameraWaterMark()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_WATERMARK);
            removePreference(this.mPreferenceGroup, "pref_dualcamera_watermark_key");
        } else if (b.hL() || !CameraSettings.isSupportedDualCameraWaterMark() || DataRepository.dataItemFeature().gv()) {
            removePreference(this.mPreferenceGroup, "pref_dualcamera_watermark_key");
            removePreference(this.mPreferenceGroup, "pref_time_watermark_key");
        } else {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_WATERMARK);
            removePreference(this.mPreferenceGroup, "pref_time_watermark_key");
        }
        if (!b.hE()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_SOUND);
        }
        if (!b.hJ()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_RECORD_LOCATION);
        }
        if (!Storage.hasSecondaryStorage()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_PRIORITY_STORAGE);
        }
        if (!b.hY()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_AUTO_CHROMA_FLASH);
        }
        if (!b.hG()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_LONG_PRESS_SHUTTER_FEATURE);
        }
        if (!b.hZ()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAPTURE_WHEN_STABLE);
        }
        if (!b.ih()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_ASD_NIGHT);
        }
        if (!b.iG()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_SNAP);
        }
        if (!b.iW()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_GROUPSHOT_PRIMITIVE);
        }
        if (!CameraSettings.isSupportedPortrait()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PORTRAIT_WITH_FACEBEAUTY);
        }
        if (!b.isSupportedOpticalZoom() && !DataRepository.dataItemFeature().hi()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_ENABLE);
        }
        if (!b.isSupportedOpticalZoom()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_SAT_ENABLE);
        }
        if (!b.isSupportSuperResolution()) {
            removePreference(this.mPreferenceGroup, "pref_camera_super_resolution_key");
        }
        if (!DataRepository.dataItemFeature().gd()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PARALLEL_PROCESS_ENABLE);
        }
        if (!CameraSettings.isSupportQuickShot()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_QUICK_SHOT_ENABLE);
        }
        if (!DataRepository.dataItemFeature().hs()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_LYING_TIP_SWITCH);
        }
        if (b.ir()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_FACE_DETECTION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_FACE_DETECTION_AUTO_HIDDEN);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PARALLEL_PROCESS_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_QUICK_SHOT_ANIM_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_QUICK_SHOT_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_SAT_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_FRONT_MIRROR);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_SHARPNESS);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_CONTRAST);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_SATURATION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_AUTOEXPOSURE);
        }
        if (!ProximitySensorLock.supported()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PROXIMITY_LOCK);
        }
        if (!b.jh()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_FINGERPRINT_CAPTURE);
        }
        if (!CameraSettings.shouldNormalWideLDCBeVisibleInMode(this.mFromWhere) || CameraSettings.isUltraWideConfigOpen(this.mFromWhere) || CameraSettings.isUltraPixelOn() || CameraSettings.isMacroModeEnabled(this.mFromWhere)) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_NORMAL_WIDE_LDC);
        }
        if (!CameraSettings.shouldUltraWideLDCBeVisibleInMode(this.mFromWhere) || ((HybridZoomingSystem.IS_2_SAT && !CameraSettings.isUltraWideConfigOpen(this.mFromWhere)) || ((HybridZoomingSystem.IS_3_OR_MORE_SAT && !CameraSettings.isUltraWideConfigOpen(this.mFromWhere) && this.mFromWhere == 167) || (!CameraSettings.isSupportedOpticalZoom() && !HybridZoomingSystem.IS_3_OR_MORE_SAT && !CameraSettings.isUltraWideConfigOpen(this.mFromWhere))))) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_ULTRA_WIDE_LDC);
        }
        if (!CameraSettings.shouldUltraWideVideoLDCBeVisibleInMode(this.mFromWhere) || !CameraSettings.isUltraWideConfigOpen(this.mFromWhere)) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_ULTRA_WIDE_VIDEO_LDC);
        }
        if (DataRepository.dataItemFeature().hg()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_SCAN_QRCODE);
        }
        removeIncompatibleAdvancePreference();
    }

    private void filterByFrom() {
        if (this.mFromWhere == 163 || this.mFromWhere == 165 || this.mFromWhere == 166 || this.mFromWhere == 176 || this.mFromWhere == 167 || this.mFromWhere == 173 || this.mFromWhere == 175 || this.mFromWhere == 171) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_VIDEO_FUNCTION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_LIVE_FUNCTION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CATEGORY_CAMCORDER_SETTING);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_AUTOEXPOSURE);
        } else if (this.mFromWhere == 161 || this.mFromWhere == 174 || this.mFromWhere == 162 || this.mFromWhere == 169 || this.mFromWhere == 168 || this.mFromWhere == 172 || this.mFromWhere == 170) {
            if (this.mFromWhere == 174) {
                removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_VIDEO_FUNCTION);
            } else {
                removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_LIVE_FUNCTION);
            }
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_CAMERA_FUNCTION);
            removeNonVideoPreference();
            removeIncompatibleVideoPreference();
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_AUTOEXPOSURE);
        } else {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_VIDEO_FUNCTION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_LIVE_FUNCTION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_AUTOEXPOSURE);
        }
    }

    private void filterByPreference() {
        PreviewListPreference previewListPreference = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_QUALITY);
        if (previewListPreference != null) {
            ArrayList supportedVideoQuality = CameraSettings.getSupportedVideoQuality(this.mFromWhere);
            filterUnsupportedOptions(this.mPreferenceGroup, previewListPreference, supportedVideoQuality);
            PreviewListPreference previewListPreference2 = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_QUALITY_EXTRA);
            boolean isFaceBeautyOn = CameraSettings.isFaceBeautyOn(this.mFromWhere, null);
            if (previewListPreference2 == null || this.mFromWhere != 162 || (!CameraSettings.isVideoBokehOn() && !isFaceBeautyOn)) {
                removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_QUALITY_EXTRA);
            } else {
                supportedVideoQuality.clear();
                supportedVideoQuality.add(String.valueOf(5));
                removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_QUALITY);
                previewListPreference2.filterUnsupported(supportedVideoQuality);
                resetIfInvalid(previewListPreference2);
                previewListPreference2.setEnabled(false);
            }
        }
        PreviewListPreference previewListPreference3 = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_HIGH_FRAME_RATE);
        if (previewListPreference3 != null) {
            filterUnsupportedOptions(this.mPreferenceGroup, previewListPreference3, CameraSettings.getSupportedHfrSettings(CameraSettings.getCameraId(this.mFromWhere)));
        }
        DataRepository.dataItemRunning().getVideoSpeed();
        if (b.ju() || CameraSettings.isMacroModeEnabled(DataRepository.dataItemGlobal().getCurrentMode())) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_MOVIE_SOLID);
        }
        if (!Util.isLabOptionsVisible()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_FACE_DETECTION);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PORTRAIT_WITH_FACEBEAUTY);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_FACE_DETECTION_AUTO_HIDDEN);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_DUAL_SAT_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_MFNR_SAT_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_SR_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_PARALLEL_PROCESS_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_QUICK_SHOT_ANIM_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_CAMERA_QUICK_SHOT_ENABLE);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_LIVE_STICKER_INTERNAL);
        }
        if (b.gE()) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_SCAN_QRCODE);
            return;
        }
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_GOOGLE_LENS_SUGGESTIONS);
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_LONG_PRESS_VIEWFINDER);
    }

    private void filterGroup() {
        filterGroupIfEmpty(CameraSettings.KEY_CATEGORY_DEVICE_SETTING);
        filterGroupIfEmpty(CameraSettings.KEY_CATEGORY_CAMCORDER_SETTING);
        filterGroupIfEmpty(CameraSettings.KEY_CATEGORY_CAPTURE_SETTING);
        filterGroupIfEmpty(CameraSettings.KEY_CATEGORY_ADVANCE_SETTING);
    }

    private void filterGroupIfEmpty(String str) {
        Preference findPreference = this.mPreferenceGroup.findPreference(str);
        if (findPreference != null && (findPreference instanceof PreferenceGroup) && ((PreferenceGroup) findPreference).getPreferenceCount() == 0) {
            removePreference(this.mPreferenceGroup, str);
        }
    }

    private String getFilterValue(PreviewListPreference previewListPreference, SharedPreferences sharedPreferences) {
        String value = previewListPreference.getValue();
        if (sharedPreferences == null) {
            return value;
        }
        String string = sharedPreferences.getString(previewListPreference.getKey(), value);
        if (!Util.isStringValueContained((Object) string, previewListPreference.getEntryValues())) {
            Editor edit = sharedPreferences.edit();
            edit.putString(previewListPreference.getKey(), value);
            edit.apply();
        } else {
            value = string;
        }
        return value;
    }

    private void initializeActivity() {
        this.mPreferenceGroup = getPreferenceScreen();
        if (this.mPreferenceGroup != null) {
            this.mPreferenceGroup.removeAll();
        }
        addPreferencesFromResource(getPreferenceXml());
        this.mPreferenceGroup = getPreferenceScreen();
        if (this.mPreferenceGroup == null) {
            Log.e(TAG, "fail to init PreferenceGroup");
            finish();
        }
        registerListener();
        filterByCloud();
        filterByPreference();
        filterByFrom();
        filterByDeviceID();
        filterByDeviceCapability();
        filterByIntent();
        filterByConfig();
        filterGroup();
        updateEntries();
        updatePreferences(this.mPreferenceGroup, this.mPreferences);
        updateConflictPreference(null);
    }

    /* access modifiers changed from: private */
    public void installQRCodeReceiver() {
        new AsyncTask<Void, Void, Void>() {
            /* JADX WARNING: type inference failed for: r5v2, types: [android.content.Context, com.android.camera.CameraPreferenceActivity] */
            /* access modifiers changed from: protected */
            /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r5v2, types: [android.content.Context, com.android.camera.CameraPreferenceActivity]
  assigns: [com.android.camera.CameraPreferenceActivity]
  uses: [android.content.Context]
  mth insns count: 9
            	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
            	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
            	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
            	at java.util.ArrayList.forEach(Unknown Source)
            	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
            	at jadx.core.ProcessClass.process(ProcessClass.java:30)
            	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
            	at jadx.api.JavaClass.decompile(JavaClass.java:62)
            	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
             */
            /* JADX WARNING: Unknown variable types count: 1 */
            public Void doInBackground(Void... voidArr) {
                Log.v(CameraPreferenceActivity.TAG, "install...");
                Util.installPackage(CameraPreferenceActivity.this, "com.xiaomi.scanner", CameraPreferenceActivity.this.mAppInstalledListener, false, true);
                return null;
            }
        }.execute(new Void[0]);
    }

    private void registerListener() {
        registerListener(this.mPreferenceGroup, this);
        Preference findPreference = this.mPreferenceGroup.findPreference(PREF_KEY_RESTORE);
        if (findPreference != null) {
            findPreference.setOnPreferenceClickListener(this);
        }
        Preference findPreference2 = this.mPreferenceGroup.findPreference(PREF_KEY_PRIVACY);
        if (findPreference2 != null) {
            findPreference2.setOnPreferenceClickListener(this);
        }
        Preference findPreference3 = this.mPreferenceGroup.findPreference(CameraSettings.KEY_PRIORITY_STORAGE);
        if (findPreference3 != null) {
            findPreference3.setOnPreferenceClickListener(this);
        }
        Preference findPreference4 = this.mPreferenceGroup.findPreference(CameraSettings.KEY_FACE_DETECTION);
        if (findPreference4 != null) {
            findPreference4.setOnPreferenceClickListener(this);
        }
        Preference findPreference5 = this.mPreferenceGroup.findPreference(CameraSettings.KEY_SCAN_QRCODE);
        if (findPreference5 != null) {
            findPreference5.setOnPreferenceClickListener(this);
        }
        this.mWatermark = this.mPreferenceGroup.findPreference(CameraSettings.KEY_WATERMARK);
        if (this.mWatermark != null) {
            this.mWatermark.setOnPreferenceClickListener(this);
        }
    }

    private void removeIncompatibleAdvancePreference() {
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_CONTRAST);
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_SATURATION);
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_QC_SHARPNESS);
    }

    private void removeIncompatibleVideoPreference() {
        if (this.mFromWhere == 172) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_QUALITY);
        } else if (this.mFromWhere == 161 || this.mFromWhere == 174) {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_QUALITY);
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_NEW_SLOW_MOTION);
        } else {
            removePreference(this.mPreferenceGroup, CameraSettings.KEY_VIDEO_NEW_SLOW_MOTION);
        }
    }

    private void removeNonVideoPreference() {
        removePreference(this.mPreferenceGroup, CameraSettings.KEY_CATEGORY_CAPTURE_SETTING);
    }

    private void resetPreferences() {
        this.mHasReset = true;
        boolean z = DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_CAMERA_FIRST_USE_PERMISSION_SHOWN, true);
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        int intentType = dataItemGlobal.getIntentType();
        dataItemGlobal.resetAll();
        ((DataItemConfig) DataRepository.provider().dataConfig(0, intentType)).resetAll();
        ((DataItemConfig) DataRepository.provider().dataConfig(1, intentType)).resetAll();
        DataRepository.dataItemRunning().clearArrayMap();
        DataRepository.getInstance().backUp().clearBackUp();
        if (!z) {
            DataRepository.dataItemGlobal().putBoolean(CameraSettings.KEY_CAMERA_FIRST_USE_PERMISSION_SHOWN, false);
        }
        Util.generateWatermark2File();
    }

    private void resetSnapSetting() {
        String string = Secure.getString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN);
        if (Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_PICTURE.equals(string) || Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_MOVIE.equals(string)) {
            Secure.putString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN, "none");
        }
    }

    private void resetTimeOutFlag() {
        if (!this.mHasReset) {
            DataRepository.dataItemGlobal().resetTimeOut();
        }
    }

    /* access modifiers changed from: private */
    public void restorePreferences() {
        resetPreferences();
        resetSnapSetting();
        initializeActivity();
        PriorityStorageBroadcastReceiver.setPriorityStorage(getResources().getBoolean(R.bool.priority_storage));
        onSettingChanged(3);
    }

    private void updateEntries() {
        PreviewListPreference previewListPreference = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_ANTIBANDING);
        CheckBoxPreference checkBoxPreference = (CheckBoxPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_AUTO_CHROMA_FLASH);
        PreviewListPreference previewListPreference2 = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_QUALITY);
        PreviewListPreference previewListPreference3 = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_CAMERA_SNAP);
        PreviewListPreference previewListPreference4 = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VOLUME_CAMERA_FUNCTION);
        if (previewListPreference != null && Util.isAntibanding60()) {
            String string = getString(R.string.pref_camera_antibanding_entryvalue_60hz);
            previewListPreference.setValue(string);
            previewListPreference.setDefaultValue(string);
        }
        if (checkBoxPreference != null) {
            checkBoxPreference.setChecked(getResources().getBoolean(CameraSettings.getDefaultPreferenceId(R.bool.pref_camera_auto_chroma_flash_default)));
        }
        if (previewListPreference2 != null) {
            String string2 = getString(CameraSettings.getDefaultPreferenceId(R.string.pref_video_quality_default));
            previewListPreference2.setDefaultValue(string2);
            previewListPreference2.setValue(string2);
        }
        if (previewListPreference3 != null && b.iG()) {
            String string3 = getString(R.string.pref_camera_snap_default);
            previewListPreference3.setDefaultValue(string3);
            previewListPreference3.setValue(string3);
            String string4 = Secure.getString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN);
            if (System.getInt(getContentResolver(), MiuiSettings.System.VOLUMEKEY_WAKE_SCREEN, 0) == 1 || Key.LONG_PRESS_VOLUME_DOWN_PAY.equals(string4) || "none".equals(string4)) {
                previewListPreference3.setValue(getString(R.string.pref_camera_snap_value_off));
            } else {
                String string5 = DataRepository.dataItemGlobal().getString(CameraSettings.KEY_CAMERA_SNAP, null);
                if (string5 != null) {
                    Secure.putString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN, CameraSettings.getMiuiSettingsKeyForStreetSnap(string5));
                    DataRepository.dataItemGlobal().editor().remove(CameraSettings.KEY_CAMERA_SNAP).apply();
                    previewListPreference3.setValue(string5);
                } else if (Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_PICTURE.equals(string4)) {
                    previewListPreference3.setValue(getString(R.string.pref_camera_snap_value_take_picture));
                } else if (Key.LONG_PRESS_VOLUME_DOWN_STREET_SNAP_MOVIE.equals(string4)) {
                    previewListPreference3.setValue(getString(R.string.pref_camera_snap_value_take_movie));
                }
            }
        }
        if (this.mFromWhere == 176 || this.mFromWhere == 166) {
            String string6 = getString(R.string.pref_camera_volumekey_function_entry_shutter);
            String string7 = getString(R.string.pref_camera_volumekey_function_entry_volume);
            String string8 = getString(R.string.pref_camera_volumekey_function_entryvalue_shutter);
            String string9 = getString(R.string.pref_camera_volumekey_function_entryvalue_volume);
            previewListPreference4.setEntries(new CharSequence[]{string6, string7});
            previewListPreference4.setEntryValues(new CharSequence[]{string8, string9});
            previewListPreference4.setDefaultValue(string6);
            previewListPreference4.setValue(string7);
        }
        CheckBoxPreference checkBoxPreference2 = (CheckBoxPreference) this.mPreferenceGroup.findPreference("pref_dualcamera_watermark_key");
        if (checkBoxPreference2 != null) {
            checkBoxPreference2.setDefaultValue(Boolean.valueOf(b.r(getResources().getBoolean(R.bool.pref_device_watermark_default))));
            checkBoxPreference2.setChecked(b.r(getResources().getBoolean(R.bool.pref_device_watermark_default)));
        }
    }

    /* JADX WARNING: type inference failed for: r4v0, types: [android.content.Context, com.android.camera.CameraPreferenceActivity] */
    private void updateQRCodeEntry() {
        CheckBoxPreference checkBoxPreference = (CheckBoxPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_SCAN_QRCODE);
        if (checkBoxPreference != null && this.mPreferences.getBoolean(CameraSettings.KEY_SCAN_QRCODE, checkBoxPreference.isChecked()) && !CameraSettings.isQRCodeReceiverAvailable(this)) {
            Log.v(TAG, "disable QRCodeScan");
            Editor edit = this.mPreferences.edit();
            edit.putBoolean(CameraSettings.KEY_SCAN_QRCODE, false);
            edit.apply();
            checkBoxPreference.setChecked(false);
        }
    }

    private void updateWaterMark(SharedPreferences sharedPreferences, ValuePreference valuePreference) {
        if ((!CameraSettings.isSupportedDualCameraWaterMark() || !sharedPreferences.getBoolean("pref_dualcamera_watermark_key", b.r(CameraSettings.getBool(R.bool.pref_device_watermark_default)))) && !sharedPreferences.getBoolean("pref_time_watermark_key", false)) {
            valuePreference.setValue(getString(R.string.pref_watermark_off));
        } else {
            valuePreference.setValue(getString(R.string.pref_watermark_on));
        }
    }

    /* access modifiers changed from: protected */
    public void filterByIntent() {
        ArrayList stringArrayListExtra = getIntent().getStringArrayListExtra(REMOVE_KEYS);
        if (stringArrayListExtra != null) {
            Iterator it = stringArrayListExtra.iterator();
            while (it.hasNext()) {
                removePreference(this.mPreferenceGroup, (String) it.next());
            }
        }
    }

    /* access modifiers changed from: protected */
    public int getPreferenceXml() {
        return R.xml.camera_other_preferences;
    }

    public void onBackPressed() {
        resetTimeOutFlag();
        super.onBackPressed();
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [android.content.Context, com.android.camera.CameraPreferenceActivity, com.android.camera.BasePreferenceActivity] */
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.mFromWhere = getIntent().getIntExtra(FROM_WHERE, 0);
        if (getIntent().getBooleanExtra(CameraIntentManager.EXTRA_START_WHEN_LOCKED, false)) {
            getWindow().addFlags(524288);
        }
        CameraSettings.upgradeGlobalPreferences();
        Storage.initStorage(this);
        initializeActivity();
        if (getIntent().getCharSequenceExtra(":miui:starting_window_label") != null) {
            ActionBar actionBar = getActionBar();
            if (actionBar != null) {
                actionBar.setTitle(R.string.pref_camera_settings_category);
            }
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() != 16908332) {
            return super.onOptionsItemSelected(menuItem);
        }
        resetTimeOutFlag();
        finish();
        return true;
    }

    /* JADX WARNING: type inference failed for: r5v0, types: [android.content.Context, com.android.camera.CameraPreferenceActivity, com.android.camera.BasePreferenceActivity] */
    public boolean onPreferenceChange(Preference preference, Object obj) {
        if (!preference.getKey().equals(CameraSettings.KEY_CAMERA_SNAP) || obj == null) {
            return super.onPreferenceChange(preference, obj);
        }
        if (System.getInt(getContentResolver(), MiuiSettings.System.VOLUMEKEY_WAKE_SCREEN, 0) == 1) {
            Toast.makeText(this, R.string.pref_camera_snap_toast_when_volume_can_wake_screen, 0).show();
            return false;
        } else if ((obj.equals(getString(R.string.pref_camera_snap_value_take_picture)) || obj.equals(getString(R.string.pref_camera_snap_value_take_movie))) && Key.LONG_PRESS_VOLUME_DOWN_PAY.equals(Secure.getString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN))) {
            bringUpDoubleConfirmDlg((PreviewListPreference) preference, (String) obj);
            return false;
        } else {
            Secure.putString(getContentResolver(), Key.LONG_PRESS_VOLUME_DOWN, CameraSettings.getMiuiSettingsKeyForStreetSnap((String) obj));
            CameraStatUtil.trackPreferenceChange(CameraSettings.KEY_CAMERA_SNAP, obj);
            return true;
        }
    }

    /* JADX WARNING: type inference failed for: r11v0, types: [android.content.Context, com.android.camera.CameraPreferenceActivity] */
    public boolean onPreferenceClick(Preference preference) {
        if (preference.getKey().equals(PREF_KEY_RESTORE)) {
            RotateDialogController.showSystemAlertDialog(this, getString(R.string.confirm_restore_title), getString(R.string.confirm_restore_message), getString(17039370), new Runnable() {
                public void run() {
                    CameraPreferenceActivity.this.restorePreferences();
                }
            }, getString(17039360), null);
            return true;
        } else if (preference.getKey().equals(PREF_KEY_PRIVACY)) {
            ActivityLauncher.launchPrivacyPolicyWebpage(this);
            return true;
        } else if (preference.getKey().equals(CameraSettings.KEY_WATERMARK)) {
            Intent intent = new Intent(this, WatermarkActivity.class);
            if (getIntent().getBooleanExtra(CameraIntentManager.EXTRA_START_WHEN_LOCKED, false)) {
                intent.putExtra(CameraIntentManager.EXTRA_START_WHEN_LOCKED, true);
            }
            this.mGoToActivity = true;
            startActivity(intent);
            return true;
        } else {
            if (CameraSettings.KEY_PRIORITY_STORAGE.equals(preference.getKey())) {
                PriorityStorageBroadcastReceiver.setPriorityStorage(((CheckBoxPreference) preference).isChecked());
            } else if (CameraSettings.KEY_SCAN_QRCODE.equals(preference.getKey()) && !CameraSettings.isQRCodeReceiverAvailable(this)) {
                RotateDialogController.showSystemAlertDialog(this, getString(R.string.confirm_install_scanner_title), getString(R.string.confirm_install_scanner_message), getString(R.string.install_confirmed), new Runnable() {
                    public void run() {
                        CameraPreferenceActivity.this.installQRCodeReceiver();
                    }
                }, getString(17039360), null);
                return true;
            }
            return false;
        }
    }

    /* access modifiers changed from: protected */
    public void onRestart() {
        super.onRestart();
        if (this.mGoToActivity) {
            updateWaterMark(this.mPreferences, (ValuePreference) this.mWatermark);
            this.mGoToActivity = false;
            return;
        }
        finish();
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [android.content.Context, com.android.camera.CameraPreferenceActivity, com.android.camera.BasePreferenceActivity] */
    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        updateQRCodeEntry();
        if (Util.isLabOptionsVisible()) {
            Toast.makeText(this, R.string.camera_facedetection_sub_option_hint, 1).show();
        }
    }

    public void updateConflictPreference(Preference preference) {
        CheckBoxPreference checkBoxPreference = (CheckBoxPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_MOVIE_SOLID);
        PreviewListPreference previewListPreference = (PreviewListPreference) this.mPreferenceGroup.findPreference(CameraSettings.KEY_VIDEO_QUALITY);
        boolean isAutoZoomEnabled = CameraSettings.isAutoZoomEnabled(this.mFromWhere);
        if (this.mFromWhere == 162) {
            if (checkBoxPreference != null) {
                if (isAutoZoomEnabled) {
                    checkBoxPreference.setEnabled(false);
                } else {
                    checkBoxPreference.setEnabled(true);
                }
            }
            if (previewListPreference != null) {
                if (isAutoZoomEnabled) {
                    previewListPreference.setValue(getString(R.string.pref_video_quality_value_autozoom));
                    previewListPreference.setShowArrow(false);
                    previewListPreference.setEnabled(false);
                } else {
                    previewListPreference.setShowArrow(true);
                    previewListPreference.setEnabled(true);
                }
            }
            if (this.mPreferenceGroup.findPreference(CameraSettings.KEY_VOLUME_VIDEO_FUNCTION) != null && isAutoZoomEnabled) {
                removePreference(this.mPreferenceGroup, CameraSettings.KEY_VOLUME_VIDEO_FUNCTION);
            }
        }
    }

    public void updatePreferences(PreferenceGroup preferenceGroup, SharedPreferences sharedPreferences) {
        if (preferenceGroup != null) {
            int preferenceCount = preferenceGroup.getPreferenceCount();
            for (int i = 0; i < preferenceCount; i++) {
                Preference preference = preferenceGroup.getPreference(i);
                if (preference instanceof ValuePreference) {
                    if (preference.getKey().equals(CameraSettings.KEY_WATERMARK)) {
                        updateWaterMark(sharedPreferences, (ValuePreference) preference);
                    }
                } else if (preference instanceof PreviewListPreference) {
                    PreviewListPreference previewListPreference = (PreviewListPreference) preference;
                    if (!b.jx() || !CameraSettings.KEY_FRONT_MIRROR.equals(previewListPreference.getKey()) || sharedPreferences.getString(CameraSettings.KEY_FRONT_MIRROR, null) != null) {
                        previewListPreference.setValue(getFilterValue(previewListPreference, sharedPreferences));
                    } else {
                        String string = getString(R.string.pref_front_mirror_entryvalue_off);
                        previewListPreference.setValue(string);
                        previewListPreference.setDefaultValue(string);
                    }
                    preference.setPersistent(false);
                } else if (preference instanceof CheckBoxPreference) {
                    CheckBoxPreference checkBoxPreference = (CheckBoxPreference) preference;
                    checkBoxPreference.setChecked(sharedPreferences.getBoolean(checkBoxPreference.getKey(), checkBoxPreference.isChecked()));
                    preference.setPersistent(false);
                } else if (preference instanceof PreferenceGroup) {
                    updatePreferences((PreferenceGroup) preference, sharedPreferences);
                } else {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("no need update preference for ");
                    sb.append(preference.getKey());
                    Log.v(str, sb.toString());
                }
            }
        }
    }
}
