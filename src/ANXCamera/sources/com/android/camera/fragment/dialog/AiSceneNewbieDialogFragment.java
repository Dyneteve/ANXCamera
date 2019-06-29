package com.android.camera.fragment.dialog;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.android.camera.R;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;

public class AiSceneNewbieDialogFragment extends BaseDialogFragment {
    public static final String TAG = "AiSceneHint";

    public final boolean canProvide() {
        return isAdded();
    }

    public boolean onBackEvent(int i) {
        super.onBackEvent(i);
        dismissAllowingStateLoss();
        switch (i) {
            case 1:
            case 2:
                return true;
            default:
                return false;
        }
    }

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_dialog_ai_scene_hint, viewGroup, false);
        initViewOnTouchListener(inflate);
        adjustViewHeight(inflate.findViewById(R.id.ai_scene_use_hint_layout));
        return inflate;
    }

    public void onDestroyView() {
        BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
        if (backStack != null) {
            backStack.removeBackStack(this);
        }
        super.onDestroyView();
    }

    public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
        if (i != 4 || keyEvent.getAction() != 1) {
            return i == 25 || i == 24;
        }
        onBackEvent(5);
        return true;
    }

    public void onResume() {
        super.onResume();
        getDialog().setOnKeyListener(this);
    }

    public void onViewCreated(View view, @Nullable Bundle bundle) {
        super.onViewCreated(view, bundle);
        BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
        if (backStack != null) {
            backStack.addInBackStack(this);
        }
    }
}
