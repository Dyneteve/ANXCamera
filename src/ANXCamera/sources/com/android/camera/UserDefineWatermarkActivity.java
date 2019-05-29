package com.android.camera;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.Nullable;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.text.method.ReplacementTransformationMethod;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import com.android.camera.sensitive.SensitiveFilter;
import miui.app.ActionBar;

public class UserDefineWatermarkActivity extends Activity implements TextWatcher {
    private static final int MSG_BG_FILTER_WORDS = 1;
    private static final int MSG_MT_UI = 2;
    private static final int PROP_NAME_MAX = 14;
    private static final String TAG = "UserDefineWatermarkAtivity";
    protected BackgroundHandler mBackgroundHandler;
    private EditText mEtUserDefineWords;
    private boolean mFlagBeyondLimit;
    private String mTextLast;
    private HandlerThread mThreadBg;
    protected UiHandler mUiHandler;
    private String mUserDefineWords;

    private final class AllCapTransformationMethod extends ReplacementTransformationMethod {
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
            UserDefineWatermarkActivity.this.doInBackground(message);
        }
    }

    private final class UiHandler extends Handler {
        UiHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            UserDefineWatermarkActivity.this.doInMainThread(message);
        }
    }

    private String checkContentlegal(CharSequence charSequence) {
        return SensitiveFilter.getInstance().getSensitiveWord((String) charSequence);
    }

    private boolean checkContentlength() {
        this.mUserDefineWords = this.mEtUserDefineWords.getText().toString();
        if (getTextLength(this.mUserDefineWords) <= 14.0d) {
            return true;
        }
        this.mFlagBeyondLimit = true;
        this.mEtUserDefineWords.setText(this.mTextLast);
        this.mEtUserDefineWords.setSelection(this.mTextLast.length());
        ToastUtils.showToast((Context) this, (int) R.string.custom_watermark_too_many_words);
        return false;
    }

    /* access modifiers changed from: private */
    public void doInBackground(Message message) {
        if (message.what == 1) {
            String checkContentlegal = checkContentlegal(this.mUserDefineWords);
            Message obtain = Message.obtain();
            obtain.what = 2;
            Bundle bundle = new Bundle();
            bundle.putString("LEGAL_WORD", checkContentlegal);
            obtain.setData(bundle);
            this.mUiHandler.sendMessage(obtain);
        }
    }

    /* access modifiers changed from: private */
    public void doInMainThread(Message message) {
        if (message.what == 2) {
            String string = message.getData().getString("LEGAL_WORD");
            if (TextUtils.isEmpty(string)) {
                String customWords = getCustomWords();
                if (!customWords.equals(CameraSettings.getCustomWatermark())) {
                    CameraSettings.setCustomWatermark(customWords);
                    Util.generateWatermark2File();
                }
                Toast.makeText(this, R.string.custom_watermark_words_save_success, 0).show();
                finish();
                return;
            }
            ToastUtils.showToast((Context) this, getString(R.string.custom_watermark_contains_senstive_words, new Object[]{string}));
        }
    }

    private String getCustomWords() {
        if (this.mEtUserDefineWords == null) {
            return getResources().getString(R.string.device_watermark_default_text);
        }
        String trim = this.mEtUserDefineWords.getText().toString().trim();
        return TextUtils.isEmpty(trim) ? getResources().getString(R.string.device_watermark_default_text) : trim.toUpperCase();
    }

    private void initTitle() {
        ActionBar actionBar = getActionBar();
        if (actionBar != null) {
            actionBar.setDisplayOptions(16, 16);
            actionBar.setCustomView(GeneralUtils.editModeTitleLayout());
            View customView = actionBar.getCustomView();
            ((TextView) customView.findViewById(16908310)).setText(getTitle());
            TextView textView = (TextView) customView.findViewById(16908313);
            textView.setBackgroundResource(R.drawable.action_mode_title_button_cancel);
            textView.setText(null);
            textView.setContentDescription(getText(17039360));
            textView.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    UserDefineWatermarkActivity.this.onCancel();
                }
            });
            TextView textView2 = (TextView) customView.findViewById(16908314);
            textView2.setBackgroundResource(R.drawable.action_mode_title_button_confirm);
            textView2.setText(null);
            textView2.setContentDescription(getText(17039370));
            textView2.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    UserDefineWatermarkActivity.this.onSave();
                }
            });
            setTitle(getResources().getString(R.string.custom_watermark_words));
        }
    }

    /* access modifiers changed from: private */
    public void onCancel() {
        finish();
    }

    /* access modifiers changed from: private */
    public void onSave() {
        if (checkContentlength()) {
            this.mBackgroundHandler.sendEmptyMessage(1);
        }
    }

    public void afterTextChanged(Editable editable) {
    }

    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        if (!this.mFlagBeyondLimit) {
            this.mTextLast = charSequence.toString();
        }
        this.mFlagBeyondLimit = false;
    }

    public double getTextLength(CharSequence charSequence) {
        StringBuilder sb = new StringBuilder(32);
        int length = charSequence.length();
        char c = 65535;
        double d = 0.0d;
        int i = 0;
        while (i < length) {
            String valueOf = String.valueOf(charSequence.charAt(i));
            char c2 = valueOf.matches("[^\\x00-\\xff]") ? (char) 0 : 1;
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
            i++;
            c = c2;
        }
        return d;
    }

    /* access modifiers changed from: protected */
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.fragment_userdefine_watermark);
        if (getIntent().getBooleanExtra("StartActivityWhenLocked", false)) {
            getWindow().addFlags(524288);
        }
        this.mEtUserDefineWords = (EditText) findViewById(R.id.et_user_define_words);
        this.mEtUserDefineWords.addTextChangedListener(this);
        this.mEtUserDefineWords.setTransformationMethod(new AllCapTransformationMethod());
        String customWatermark = CameraSettings.getCustomWatermark();
        String string = getString(R.string.device_watermark_default_text);
        this.mEtUserDefineWords.setHint(CameraSettings.getCustomWatermarkDefault());
        if (!TextUtils.isEmpty(customWatermark)) {
            if (string.equals(customWatermark)) {
                this.mEtUserDefineWords.setText("");
            } else {
                this.mEtUserDefineWords.setText(customWatermark);
            }
            this.mEtUserDefineWords.setSelection(this.mEtUserDefineWords.getText().length());
        }
        this.mThreadBg = new HandlerThread(TAG, 10);
        this.mThreadBg.start();
        this.mBackgroundHandler = new BackgroundHandler(this.mThreadBg.getLooper());
        this.mUiHandler = new UiHandler(Looper.getMainLooper());
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
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

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        showSoftInputFromWindow();
    }

    /* access modifiers changed from: protected */
    public void onStart() {
        super.onStart();
        initTitle();
    }

    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        checkContentlength();
    }

    public void showSoftInputFromWindow() {
        this.mEtUserDefineWords.setFocusable(true);
        this.mEtUserDefineWords.setFocusableInTouchMode(true);
        this.mEtUserDefineWords.requestFocus();
        getWindow().setSoftInputMode(5);
    }
}
