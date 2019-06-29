package com.android.camera.fragment.dialog;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.graphics.Rect;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import com.android.camera.Camera;
import com.android.camera.Util;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;

public class BaseDialogFragment extends DialogFragment implements OnKeyListener, HandleBackTrace {
    private GestureDetector gesture;

    private class MyOnGestureListener extends SimpleOnGestureListener {
        private MyOnGestureListener() {
        }

        public boolean onDown(MotionEvent motionEvent) {
            return true;
        }

        public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent2, float f, float f2) {
            BaseDialogFragment.this.onBackEvent(5);
            return super.onScroll(motionEvent, motionEvent2, f, f2);
        }

        public boolean onSingleTapUp(MotionEvent motionEvent) {
            BaseDialogFragment.this.onBackEvent(5);
            return super.onSingleTapUp(motionEvent);
        }
    }

    /* access modifiers changed from: protected */
    public void adjustViewHeight(View view) {
        Rect displayRect = Util.getDisplayRect(getContext(), 0);
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        marginLayoutParams.width = displayRect.width();
        marginLayoutParams.height = displayRect.height();
        marginLayoutParams.topMargin = displayRect.top;
    }

    public boolean canProvide() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void initViewOnTouchListener(View view) {
        this.gesture = new GestureDetector(getActivity(), new MyOnGestureListener());
        view.setOnTouchListener(new OnTouchListener() {
            public final boolean onTouch(View view, MotionEvent motionEvent) {
                return BaseDialogFragment.this.gesture.onTouchEvent(motionEvent);
            }
        });
    }

    public void onActivityCreated(@Nullable Bundle bundle) {
        super.onActivityCreated(bundle);
        Dialog dialog = getDialog();
        if (dialog != null && dialog.getWindow() != null) {
            Window window = dialog.getWindow();
            window.setGravity(48);
            window.setLayout(-1, -1);
            LayoutParams attributes = window.getAttributes();
            attributes.type = 1;
            window.setAttributes(attributes);
            if (Util.isNotchDevice) {
                CompatibilityUtils.setCutoutModeShortEdges(window);
            }
        }
    }

    public boolean onBackEvent(int i) {
        Camera camera = (Camera) getActivity();
        if (camera != null) {
            camera.getCameraScreenNail().drawBlackFrame(false);
        }
        return false;
    }

    public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
        return false;
    }
}
