package com.android.camera.fragment;

import android.app.Dialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.DialogInterface;
import android.os.Bundle;
import com.android.camera.R;
import miui.app.AlertDialog.Builder;

public class GoogleLensFragment extends DialogFragment {
    public static final String TAG = "GoogleLensFragment";
    private OnClickListener mClickListener;

    public interface OnClickListener {
        void onOptionClick(int i);
    }

    public GoogleLensFragment() {
    }

    public GoogleLensFragment(OnClickListener onClickListener) {
        this.mClickListener = onClickListener;
    }

    public static /* synthetic */ void lambda$onCreateDialog$0(GoogleLensFragment googleLensFragment, DialogInterface dialogInterface, int i) {
        if (googleLensFragment.mClickListener != null) {
            googleLensFragment.mClickListener.onOptionClick(i);
        }
    }

    public static GoogleLensFragment showOptions(FragmentManager fragmentManager, OnClickListener onClickListener) {
        Fragment findFragmentByTag = fragmentManager.findFragmentByTag(TAG);
        if (findFragmentByTag != null) {
            return (GoogleLensFragment) findFragmentByTag;
        }
        GoogleLensFragment googleLensFragment = new GoogleLensFragment(onClickListener);
        googleLensFragment.show(fragmentManager, TAG);
        return googleLensFragment;
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
    }

    public Dialog onCreateDialog(Bundle bundle) {
        return new Builder(getActivity()).setTitle(R.string.pref_camera_long_press_viewfinder_title).setItems(R.array.dialog_camera_long_press_viewfinder_options, new android.content.DialogInterface.OnClickListener() {
            public final void onClick(DialogInterface dialogInterface, int i) {
                GoogleLensFragment.lambda$onCreateDialog$0(GoogleLensFragment.this, dialogInterface, i);
            }
        }).setNegativeButton(17039360, null).create();
    }
}
