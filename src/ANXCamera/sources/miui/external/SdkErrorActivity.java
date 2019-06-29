package miui.external;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.app.DialogFragment;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import miui.external.SdkConstants.SdkError;

public class SdkErrorActivity extends Activity implements SdkConstants {
    private OnClickListener mDismissListener = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            dialogInterface.dismiss();
            SdkErrorActivity.this.finish();
            System.exit(0);
        }
    };
    private String mLanguage;
    private OnClickListener mUpdateListener = new OnClickListener() {
        public void onClick(DialogInterface dialogInterface, int i) {
            dialogInterface.dismiss();
            final Dialog access$000 = SdkErrorActivity.this.createUpdateDialog();
            new SdkDialogFragment(access$000).show(SdkErrorActivity.this.getFragmentManager(), "SdkUpdatePromptDialog");
            new AsyncTask<Void, Void, Boolean>() {
                /* access modifiers changed from: protected */
                public Boolean doInBackground(Void... voidArr) {
                    try {
                        Thread.sleep(5000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    return Boolean.valueOf(SdkErrorActivity.this.updateSdk());
                }

                /* access modifiers changed from: protected */
                public void onPostExecute(Boolean bool) {
                    access$000.dismiss();
                    new SdkDialogFragment(bool.booleanValue() ? SdkErrorActivity.this.createUpdateSuccessfulDialog() : SdkErrorActivity.this.createUpdateFailedDialog()).show(SdkErrorActivity.this.getFragmentManager(), "SdkUpdateFinishDialog");
                }
            }.execute(new Void[0]);
        }
    };

    class SdkDialogFragment extends DialogFragment {
        private Dialog mDialog;

        public SdkDialogFragment(Dialog dialog) {
            this.mDialog = dialog;
        }

        public Dialog onCreateDialog(Bundle bundle) {
            return this.mDialog;
        }
    }

    private Dialog createDoubleActionDialog(String str, String str2, OnClickListener onClickListener, OnClickListener onClickListener2) {
        return new Builder(this).setTitle(str).setMessage(str2).setPositiveButton(17039370, onClickListener).setNegativeButton(17039360, onClickListener2).setIcon(17301543).setCancelable(false).create();
    }

    private Dialog createGenericErrorDialog() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            str2 = "MIUI SDK发生错误";
            str = "请重新安装MIUI SDK再运行本程序。";
        } else {
            str2 = "MIUI SDK encounter errors";
            str = "Please re-install MIUI SDK and then re-run this application.";
        }
        return createSingleActionDialog(str2, str, this.mDismissListener);
    }

    private Dialog createLowSdkVersionDialog() {
        String str;
        String str2;
        String str3;
        String str4;
        if (!supportUpdateSdk()) {
            if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
                str4 = "MIUI SDK版本过低";
                str3 = "请先升级MIUI SDK再运行本程序。";
            } else {
                str4 = "MIUI SDK too old";
                str3 = "Please upgrade MIUI SDK and then re-run this application.";
            }
            return createSingleActionDialog(str4, str3, this.mDismissListener);
        }
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            str2 = "MIUI SDK版本过低";
            str = "请先升级MIUI SDK再运行本程序。是否现在升级？";
        } else {
            str2 = "MIUI SDK too old";
            str = "Please upgrade MIUI SDK and then re-run this application. Upgrade now?";
        }
        return createDoubleActionDialog(str2, str, this.mUpdateListener, this.mDismissListener);
    }

    private Dialog createNoSdkDialog() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            str2 = "没有找到MIUI SDK";
            str = "请先安装MIUI SDK再运行本程序。";
        } else {
            str2 = "MIUI SDK not found";
            str = "Please install MIUI SDK and then re-run this application.";
        }
        return createSingleActionDialog(str2, str, this.mDismissListener);
    }

    private Dialog createSingleActionDialog(String str, String str2, OnClickListener onClickListener) {
        return new Builder(this).setTitle(str).setMessage(str2).setPositiveButton(17039370, onClickListener).setIcon(17301543).setCancelable(false).create();
    }

    /* access modifiers changed from: private */
    public Dialog createUpdateDialog() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            str2 = "MIUI SDK正在更新";
            str = "请稍候...";
        } else {
            str2 = "MIUI SDK updating";
            str = "Please wait...";
        }
        return ProgressDialog.show(this, str2, str, true, false);
    }

    /* access modifiers changed from: private */
    public Dialog createUpdateFailedDialog() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            str2 = "MIUI SDK更新失败";
            str = "请稍后重试。";
        } else {
            str2 = "MIUI SDK update failed";
            str = "Please try it later.";
        }
        return createSingleActionDialog(str2, str, this.mDismissListener);
    }

    /* access modifiers changed from: private */
    public Dialog createUpdateSuccessfulDialog() {
        String str;
        String str2;
        if (Locale.CHINESE.getLanguage().equals(this.mLanguage)) {
            str2 = "MIUI SDK更新完成";
            str = "请重新运行本程序。";
        } else {
            str2 = "MIUI SDK updated";
            str = "Please re-run this application.";
        }
        return createSingleActionDialog(str2, str, this.mDismissListener);
    }

    private boolean supportUpdateSdk() {
        try {
            return ((Boolean) SdkEntranceHelper.getSdkEntrance().getMethod("supportUpdate", new Class[]{Map.class}).invoke(null, new Object[]{null})).booleanValue();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /* access modifiers changed from: private */
    public boolean updateSdk() {
        try {
            HashMap hashMap = new HashMap();
            return ((Boolean) SdkEntranceHelper.getSdkEntrance().getMethod("update", new Class[]{Map.class}).invoke(null, new Object[]{hashMap})).booleanValue();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle bundle) {
        Dialog dialog;
        setTheme(16973909);
        super.onCreate(bundle);
        this.mLanguage = Locale.getDefault().getLanguage();
        Intent intent = getIntent();
        SdkError sdkError = intent != null ? (SdkError) intent.getSerializableExtra(SdkError.INTENT_EXTRA_KEY) : null;
        if (sdkError == null) {
            sdkError = SdkError.GENERIC;
        }
        switch (sdkError) {
            case NO_SDK:
                dialog = createNoSdkDialog();
                break;
            case LOW_SDK_VERSION:
                dialog = createLowSdkVersionDialog();
                break;
            default:
                dialog = createGenericErrorDialog();
                break;
        }
        new SdkDialogFragment(dialog).show(getFragmentManager(), "SdkErrorPromptDialog");
    }
}
