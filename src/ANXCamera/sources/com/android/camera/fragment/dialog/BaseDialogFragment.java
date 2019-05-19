package com.android.camera.fragment.dialog;

import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.support.v4.app.DialogFragment;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;

public class BaseDialogFragment extends DialogFragment implements OnKeyListener, HandleBackTrace {
    /* access modifiers changed from: private */
    public GestureDetector gesture;

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

    public boolean canProvide() {
        return false;
    }

    /* access modifiers changed from: protected */
    public void initViewOnTouchListener(View view) {
        this.gesture = new GestureDetector(getActivity(), new MyOnGestureListener());
        view.setOnTouchListener(new OnTouchListener() {
            public boolean onTouch(View view, MotionEvent motionEvent) {
                return BaseDialogFragment.this.gesture.onTouchEvent(motionEvent);
            }
        });
    }

    public boolean onBackEvent(int i) {
        return false;
    }

    public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
        return false;
    }
}
