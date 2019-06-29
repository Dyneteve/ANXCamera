package com.android.camera.fragment;

import android.app.Dialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.text.method.LinkMovementMethod;
import com.android.camera.R;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
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

    public interface OnCtaNoticeClickListener {
        void onNegativeClick(DialogInterface dialogInterface, int i);

        void onPositiveClick(DialogInterface dialogInterface, int i);
    }

    public CtaNoticeFragment(boolean z, OnCtaNoticeClickListener onCtaNoticeClickListener) {
        this.mShowRemindButton = z;
        this.mClickListener = onCtaNoticeClickListener;
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
        Builder negativeButton = new Builder(getActivity()).setTitle(R.string.network_access_user_notice_title).setMessage(R.string.user_notice_identify_summary_format).setPositiveButton(R.string.user_agree, new OnClickListener() {
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
