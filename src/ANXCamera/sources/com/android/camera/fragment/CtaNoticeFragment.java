package com.android.camera.fragment;

import android.app.Dialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.method.LinkMovementMethod;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.ui.UrlSpan;
import com.android.camera.ui.UrlSpan.UrlSpanOnClickListener;
import com.oneplus.camera.R;
import java.util.Locale;
import miui.app.AlertDialog;
import miui.app.AlertDialog.Builder;

public class CtaNoticeFragment extends DialogFragment {
    public static final String TAG = "CtaNoticeFragment";
    /* access modifiers changed from: private */
    public OnCtaNoticeClickListener mClickListener;
    /* access modifiers changed from: private */
    public boolean mShowRemindButton;

    public static class CTA {
        private static boolean sCanConnectToNetworkTemp = false;

        public static boolean canConnectNetwork() {
            if (sCanConnectToNetworkTemp) {
                return true;
            }
            return ((DataItemGlobal) DataRepository.provider().dataGlobal()).getCTACanCollect();
        }

        public static void setCanConnectNetwork(boolean z, boolean z2) {
            if (z) {
                ((DataItemGlobal) DataRepository.provider().dataGlobal()).setCTACanCollect(z2);
            } else {
                sCanConnectToNetworkTemp = z2;
            }
        }
    }

    static class Licence {
        private static String URL_MIUI_PRIVACY_POLICY = "http://www.miui.com/res/doc/privacy.html";
        private static String URL_MIUI_USER_AGREEMENT = "http://www.miui.com/res/doc/eula.html";

        Licence() {
        }

        public static Intent getPrivacyIntent() {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(getUrlByLocale(URL_MIUI_PRIVACY_POLICY)));
            return intent;
        }

        private static String getUrlByLocale(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("?lang=");
            sb.append(Locale.getDefault().getLanguage().equals("zh") ? "zh_CN" : "en_US");
            return sb.toString();
        }

        public static Intent getUserAgreementIntent() {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(getUrlByLocale(URL_MIUI_USER_AGREEMENT)));
            return intent;
        }
    }

    public interface OnCtaNoticeClickListener {
        void onNegativeClick(DialogInterface dialogInterface, int i);

        void onPositiveClick(DialogInterface dialogInterface, int i);
    }

    public CtaNoticeFragment(boolean z, OnCtaNoticeClickListener onCtaNoticeClickListener) {
        this.mShowRemindButton = z;
        this.mClickListener = onCtaNoticeClickListener;
    }

    private static SpannableStringBuilder buildUserNotice(final Context context, int i) {
        Resources resources = context.getResources();
        String string = resources.getString(R.string.user_agreement2);
        String string2 = resources.getString(R.string.user_agreement4);
        String string3 = resources.getString(i, new Object[]{string, string2});
        AnonymousClass3 r0 = new UrlSpanOnClickListener() {
            public void onClick() {
                context.startActivity(Licence.getUserAgreementIntent());
            }
        };
        AnonymousClass4 r3 = new UrlSpanOnClickListener() {
            public void onClick() {
                context.startActivity(Licence.getPrivacyIntent());
            }
        };
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(string3);
        int indexOf = string3.indexOf(string);
        spannableStringBuilder.setSpan(new UrlSpan(r0), indexOf, string.length() + indexOf, 33);
        int indexOf2 = string3.indexOf(string2);
        spannableStringBuilder.setSpan(new UrlSpan(r3), indexOf2, string2.length() + indexOf2, 33);
        return spannableStringBuilder;
    }

    public static boolean checkCta(FragmentManager fragmentManager) {
        return checkCta(fragmentManager, true);
    }

    public static boolean checkCta(FragmentManager fragmentManager, boolean z) {
        return checkCta(fragmentManager, z, null);
    }

    public static boolean checkCta(FragmentManager fragmentManager, boolean z, OnCtaNoticeClickListener onCtaNoticeClickListener) {
        return showCta(fragmentManager, z, onCtaNoticeClickListener) == null;
    }

    public static CtaNoticeFragment showCta(FragmentManager fragmentManager, boolean z, OnCtaNoticeClickListener onCtaNoticeClickListener) {
        if (CTA.canConnectNetwork()) {
            return null;
        }
        Fragment findFragmentByTag = fragmentManager.findFragmentByTag(TAG);
        if (findFragmentByTag != null) {
            return (CtaNoticeFragment) findFragmentByTag;
        }
        CtaNoticeFragment ctaNoticeFragment = new CtaNoticeFragment(z, onCtaNoticeClickListener);
        ctaNoticeFragment.show(fragmentManager, TAG);
        return ctaNoticeFragment;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setCancelable(false);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        Builder negativeButton = new Builder(getActivity()).setTitle(R.string.network_access_user_notice_title).setMessage(buildUserNotice(getActivity(), R.string.user_notice_identify_summary_format)).setPositiveButton(R.string.user_agree, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                CTA.setCanConnectNetwork(CtaNoticeFragment.this.mShowRemindButton ? CtaNoticeFragment.this.getDialog().isChecked() : true, true);
                if (CtaNoticeFragment.this.mClickListener != null) {
                    CtaNoticeFragment.this.mClickListener.onPositiveClick(dialogInterface, i);
                }
            }
        }).setNegativeButton(17039360, new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                CTA.setCanConnectNetwork(CtaNoticeFragment.this.mShowRemindButton ? CtaNoticeFragment.this.getDialog().isChecked() : true, false);
                if (CtaNoticeFragment.this.mClickListener != null) {
                    CtaNoticeFragment.this.mClickListener.onNegativeClick(dialogInterface, i);
                }
            }
        });
        if (this.mShowRemindButton) {
            negativeButton.setCheckBox(true, getActivity().getString(R.string.do_not_remind_me));
        }
        return negativeButton.create();
    }

    public void onStart() {
        super.onStart();
        AlertDialog dialog = getDialog();
        if (dialog != null) {
            dialog.getMessageView().setMovementMethod(LinkMovementMethod.getInstance());
        }
    }
}
