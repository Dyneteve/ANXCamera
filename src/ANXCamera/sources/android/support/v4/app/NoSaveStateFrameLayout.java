package android.support.v4.app;

import android.content.Context;
import android.os.Parcelable;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.widget.FrameLayout;

class NoSaveStateFrameLayout extends FrameLayout {
    public NoSaveStateFrameLayout(Context context) {
        super(context);
    }

    static ViewGroup wrap(View view) {
        NoSaveStateFrameLayout noSaveStateFrameLayout = new NoSaveStateFrameLayout(view.getContext());
        LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams != null) {
            noSaveStateFrameLayout.setLayoutParams(layoutParams);
        }
        view.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        noSaveStateFrameLayout.addView(view);
        return noSaveStateFrameLayout;
    }

    /* access modifiers changed from: protected */
    public void dispatchRestoreInstanceState(SparseArray<Parcelable> sparseArray) {
        dispatchThawSelfOnly(sparseArray);
    }

    /* access modifiers changed from: protected */
    public void dispatchSaveInstanceState(SparseArray<Parcelable> sparseArray) {
        dispatchFreezeSelfOnly(sparseArray);
    }
}
