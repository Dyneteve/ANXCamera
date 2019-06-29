package com.android.camera;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.DialogInterface.OnShowListener;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.method.ReplacementTransformationMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.sensitive.SensitiveFilter;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.ValuePreference;
import com.mi.config.b;
import miui.app.ActionBar;

public class WatermarkActivity extends BasePreferenceActivity implements TextWatcher {
    private static final int MSG_BG_FILTER_WORDS = 1;
    private static final int MSG_MT_UI = 2;
    private static final int PROP_NAME_MAX = 14;
    public static final String TAG = "WatermarkActivity";
    /* access modifiers changed from: private */
    public AlertDialog mAlertDialog;
    protected BackgroundHandler mBackgroundHandler;
    /* access modifiers changed from: private */
    public String mDefindWatermark;
    /* access modifiers changed from: private */
    public EditText mEtUserDefineWords;
    protected PreferenceScreen mPreferenceGroup;
    /* access modifiers changed from: private */
    public HandlerThread mThreadBg;
    protected UiHandler mUiHandler;
    private Preference mUserDefineWatermark;

    private static final class AllCapTransformationMethod extends ReplacementTransformationMethod {
        private AllCapTransformationMethod() {
        }

        /* access modifiers changed from: protected */
        public char[] getOriginal() {
            return new char[]{'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
        }

        /* access modifiers changed from: protected */
        public char[] getReplacement() {
            return new char[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
        }
    }

    private final class BackgroundHandler extends Handler {
        BackgroundHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            WatermarkActivity.this.doInBackground(message);
        }
    }

    class TextJudge {
        boolean isOverLimit;
        String legalString;

        TextJudge() {
        }
    }

    private final class UiHandler extends Handler {
        UiHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            WatermarkActivity.this.doInMainThread(message);
        }
    }

    private String checkContentlegal(CharSequence charSequence) {
        return SensitiveFilter.getInstance().getSensitiveWord((String) charSequence);
    }

    /* JADX WARNING: type inference failed for: r2v0, types: [android.content.Context, com.android.camera.WatermarkActivity] */
    private boolean checkContentlength(CharSequence charSequence) {
        StringBuilder sb = new StringBuilder(32);
        sb.append(charSequence);
        TextJudge textLength = getTextLength(sb);
        if (!textLength.isOverLimit) {
            return true;
        }
        this.mEtUserDefineWords.setText(textLength.legalString);
        ToastUtils.showToast((Context) this, (int) R.string.custom_watermark_too_many_words);
        return false;
    }

    /* access modifiers changed from: private */
    public void doInBackground(Message message) {
        if (message.what == 1) {
            String checkContentlegal = checkContentlegal(this.mEtUserDefineWords.getText().toString());
            Message obtain = Message.obtain();
            obtain.what = 2;
            Bundle bundle = new Bundle();
            bundle.putString("LEGAL_WORD", checkContentlegal);
            obtain.setData(bundle);
            this.mUiHandler.sendMessage(obtain);
        }
    }

    /* JADX WARNING: type inference failed for: r3v0, types: [android.content.Context, com.android.camera.WatermarkActivity] */
    /* access modifiers changed from: private */
    public void doInMainThread(Message message) {
        if (message.what == 2) {
            String string = message.getData().getString("LEGAL_WORD");
            if (TextUtils.isEmpty(string)) {
                String customWords = getCustomWords();
                if (!customWords.equals(CameraSettings.getCustomWatermark())) {
                    CameraSettings.setCustomWatermark(customWords);
                    this.mDefindWatermark = customWords;
                    Util.generateWatermark2File();
                    CameraStatUtil.trackUserDefineWatermark();
                }
                ValuePreference valuePreference = (ValuePreference) this.mUserDefineWatermark;
                if (customWords.equals(getString(R.string.device_watermark_default_text))) {
                    customWords = "";
                }
                valuePreference.setValue(customWords);
                Toast.makeText(this, R.string.custom_watermark_words_save_success, 0).show();
                return;
            }
            ToastUtils.showToast((Context) this, getString(R.string.custom_watermark_contains_senstive_words, new Object[]{string}));
        }
    }

    private void filterPreference() {
        if (!b.hL()) {
            removePreference(this.mPreferenceGroup, "pref_time_watermark_key");
        }
        if (!CameraSettings.isSupportedDualCameraWaterMark()) {
            removePreference(this.mPreferenceGroup, "pref_dualcamera_watermark_key");
            removePreference(this.mPreferenceGroup, "user_define_watermark_key");
        }
        if (CameraSettings.isSupportedDualCameraWaterMark() && !DataRepository.dataItemFeature().gv()) {
            removePreference(this.mPreferenceGroup, "user_define_watermark_key");
        }
    }

    private String getCustomWords() {
        if (this.mEtUserDefineWords == null) {
            return getResources().getString(R.string.device_watermark_default_text);
        }
        String trim = this.mEtUserDefineWords.getText().toString().trim();
        return TextUtils.isEmpty(trim) ? getResources().getString(R.string.device_watermark_default_text) : trim.toUpperCase();
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
        filterPreference();
        registerListener();
        updateEntries();
        updatePreferences(this.mPreferenceGroup, this.mPreferences);
    }

    /* access modifiers changed from: private */
    public void onSave() {
        this.mBackgroundHandler.sendEmptyMessage(1);
    }

    private void registerListener() {
        registerListener(this.mPreferenceGroup, this);
        Preference findPreference = this.mPreferenceGroup.findPreference("pref_time_watermark_key");
        if (findPreference != null) {
            findPreference.setOnPreferenceClickListener(this);
        }
        Preference findPreference2 = this.mPreferenceGroup.findPreference("pref_dualcamera_watermark_key");
        if (findPreference2 != null) {
            findPreference2.setOnPreferenceClickListener(this);
        }
        this.mUserDefineWatermark = this.mPreferenceGroup.findPreference("user_define_watermark_key");
        if (this.mUserDefineWatermark != null) {
            this.mUserDefineWatermark.setOnPreferenceClickListener(this);
        }
    }

    /* access modifiers changed from: private */
    public void release() {
        if (this.mBackgroundHandler != null) {
            this.mBackgroundHandler.removeCallbacksAndMessages(null);
        }
        if (this.mUiHandler != null) {
            this.mUiHandler.removeCallbacksAndMessages(null);
        }
        if (this.mThreadBg != null) {
            this.mThreadBg.quit();
        }
    }

    /* JADX WARNING: type inference failed for: r5v0, types: [android.content.Context, com.android.camera.WatermarkActivity, android.text.TextWatcher] */
    private void showDialog() {
        if (this.mAlertDialog == null) {
            Builder builder = new Builder(this, R.style.EditAlertDialog);
            View inflate = LayoutInflater.from(this).inflate(R.layout.dialog_userdefine_watermark, null);
            this.mEtUserDefineWords = (EditText) inflate.findViewById(R.id.et_user_define_words);
            this.mEtUserDefineWords.addTextChangedListener(this);
            this.mEtUserDefineWords.setTransformationMethod(new AllCapTransformationMethod());
            builder.setTitle(getString(R.string.pref_userdefine_watermark_title)).setView(inflate);
            builder.setNegativeButton(getString(R.string.user_define_watermark_cancel), null);
            builder.setPositiveButton(getString(R.string.user_define_watermark_save), new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    WatermarkActivity.this.onSave();
                }
            });
            this.mAlertDialog = builder.create();
            this.mAlertDialog.setOnShowListener(new OnShowListener() {
                public void onShow(DialogInterface dialogInterface) {
                    if (WatermarkActivity.this.getIntent().getBooleanExtra(CameraIntentManager.EXTRA_START_WHEN_LOCKED, false)) {
                        WatermarkActivity.this.mAlertDialog.getWindow().addFlags(524288);
                    }
                    WatermarkActivity.this.mEtUserDefineWords.setHint(CameraSettings.getCustomWatermarkDefault());
                    if (!TextUtils.isEmpty(WatermarkActivity.this.mDefindWatermark)) {
                        if (WatermarkActivity.this.getString(R.string.device_watermark_default_text).equals(WatermarkActivity.this.mDefindWatermark)) {
                            WatermarkActivity.this.mEtUserDefineWords.setText("");
                        } else {
                            WatermarkActivity.this.mEtUserDefineWords.setText(WatermarkActivity.this.mDefindWatermark);
                        }
                    }
                    WatermarkActivity.this.mEtUserDefineWords.setSelection(WatermarkActivity.this.mEtUserDefineWords.getText().length());
                    WatermarkActivity.this.mThreadBg = new HandlerThread(WatermarkActivity.TAG, 10);
                    WatermarkActivity.this.mThreadBg.start();
                    WatermarkActivity.this.mBackgroundHandler = new BackgroundHandler(WatermarkActivity.this.mThreadBg.getLooper());
                    WatermarkActivity.this.mUiHandler = new UiHandler(Looper.getMainLooper());
                    WatermarkActivity.this.mEtUserDefineWords.setFocusable(true);
                    WatermarkActivity.this.mEtUserDefineWords.setFocusableInTouchMode(true);
                    WatermarkActivity.this.mEtUserDefineWords.requestFocus();
                }
            });
            this.mAlertDialog.setOnDismissListener(new OnDismissListener() {
                public void onDismiss(DialogInterface dialogInterface) {
                    WatermarkActivity.this.release();
                }
            });
            this.mAlertDialog.show();
        } else if (!this.mAlertDialog.isShowing()) {
            this.mAlertDialog.show();
        }
    }

    private void updateEntries() {
        CheckBoxPreference checkBoxPreference = (CheckBoxPreference) this.mPreferenceGroup.findPreference("pref_dualcamera_watermark_key");
        if (checkBoxPreference != null) {
            checkBoxPreference.setDefaultValue(Boolean.valueOf(b.r(getResources().getBoolean(R.bool.pref_device_watermark_default))));
            checkBoxPreference.setChecked(b.r(getResources().getBoolean(R.bool.pref_device_watermark_default)));
        }
        if (this.mUserDefineWatermark != null) {
            this.mDefindWatermark = CameraSettings.getCustomWatermark();
            ((ValuePreference) this.mUserDefineWatermark).setValue(this.mDefindWatermark.equals(getString(R.string.device_watermark_default_text)) ? "" : this.mDefindWatermark);
            ((ValuePreference) this.mUserDefineWatermark).setEnabled(CameraSettings.isDualCameraWaterMarkOpen() || CameraSettings.isFrontCameraWaterMarkOpen());
        }
    }

    public void afterTextChanged(Editable editable) {
        this.mEtUserDefineWords.setSelection(this.mEtUserDefineWords.getText().length());
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    /* access modifiers changed from: protected */
    public int getPreferenceXml() {
        return R.xml.camera_preferences_watermark;
    }

    public TextJudge getTextLength(CharSequence charSequence) {
        TextJudge textJudge = new TextJudge();
        StringBuilder sb = new StringBuilder(32);
        StringBuilder sb2 = new StringBuilder(32);
        int length = charSequence.length();
        char c = 65535;
        double d = 0.0d;
        int i = 0;
        while (true) {
            char c2 = 1;
            if (i >= length) {
                break;
            }
            String valueOf = String.valueOf(charSequence.charAt(i));
            if (valueOf.matches("[^\\x00-\\xff]")) {
                c2 = 0;
            }
            if (c < 0) {
                sb.append(valueOf);
            } else if (c2 == c) {
                sb.append(valueOf);
            } else if (c2 != c) {
                d += c == 0 ? (double) sb.length() : ((double) sb.length()) / 1.29d;
                sb.delete(0, sb.length());
                sb.append(valueOf);
            }
            if (i == length - 1) {
                d += c == 0 ? (double) sb.length() : ((double) sb.length()) / 1.29d;
                sb.delete(0, sb.length());
                sb.append(valueOf);
            }
            if (d <= 14.0d) {
                sb2.append(valueOf);
            }
            i++;
            c = c2;
        }
        if (d > 14.0d) {
            textJudge.isOverLimit = true;
        } else {
            textJudge.isOverLimit = false;
        }
        textJudge.legalString = String.valueOf(sb2);
        return textJudge;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (getIntent().getBooleanExtra(CameraIntentManager.EXTRA_START_WHEN_LOCKED, false)) {
            getWindow().addFlags(524288);
        }
        if (getIntent().getCharSequenceExtra(":miui:starting_window_label") != null) {
            ActionBar actionBar = getActionBar();
            if (actionBar != null) {
                actionBar.setTitle(R.string.pref_watermark_title);
            }
        }
        initializeActivity();
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        release();
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x002f A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x0030  */
    public boolean onPreferenceChange(Preference preference, Object obj) {
        char c;
        String key = preference.getKey();
        int hashCode = key.hashCode();
        if (hashCode != 1739638146) {
            if (hashCode == 1752299636 && key.equals("user_define_watermark_key")) {
                c = 1;
                switch (c) {
                    case 0:
                        if (DataRepository.dataItemFeature().gv()) {
                            if (!((Boolean) obj).booleanValue()) {
                                this.mUserDefineWatermark.setEnabled(false);
                                break;
                            } else {
                                this.mUserDefineWatermark.setEnabled(true);
                                break;
                            }
                        }
                        break;
                    case 1:
                        return false;
                }
                super.onPreferenceChange(preference, obj);
                return true;
            }
        } else if (key.equals("pref_dualcamera_watermark_key")) {
            c = 0;
            switch (c) {
                case 0:
                    break;
                case 1:
                    break;
            }
            super.onPreferenceChange(preference, obj);
            return true;
        }
        c = 65535;
        switch (c) {
            case 0:
                break;
            case 1:
                break;
        }
        super.onPreferenceChange(preference, obj);
        return true;
    }

    public boolean onPreferenceClick(Preference preference) {
        if (!preference.getKey().equals("user_define_watermark_key")) {
            return false;
        }
        showDialog();
        return true;
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        checkContentlength(charSequence);
    }

    /* access modifiers changed from: protected */
    public void updateConflictPreference(Preference preference) {
    }
}
