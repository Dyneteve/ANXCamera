package android.support.v4.view;

import android.util.Log;
import android.view.View;
import android.view.ViewParent;

class ViewParentCompatLollipop {
    private static final String TAG = "ViewParentCompat";

    ViewParentCompatLollipop() {
    }

    public static boolean onNestedFling(ViewParent viewParent, View view, float f, float f2, boolean z) {
        try {
            return viewParent.onNestedFling(view, f, f2, z);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(viewParent);
            sb.append(" does not implement interface ");
            sb.append("method onNestedFling");
            Log.e(str, sb.toString(), e);
            return false;
        }
    }

    public static boolean onNestedPreFling(ViewParent viewParent, View view, float f, float f2) {
        try {
            return viewParent.onNestedPreFling(view, f, f2);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(viewParent);
            sb.append(" does not implement interface ");
            sb.append("method onNestedPreFling");
            Log.e(str, sb.toString(), e);
            return false;
        }
    }

    public static void onNestedPreScroll(ViewParent viewParent, View view, int i, int i2, int[] iArr) {
        try {
            viewParent.onNestedPreScroll(view, i, i2, iArr);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(viewParent);
            sb.append(" does not implement interface ");
            sb.append("method onNestedPreScroll");
            Log.e(str, sb.toString(), e);
        }
    }

    public static void onNestedScroll(ViewParent viewParent, View view, int i, int i2, int i3, int i4) {
        try {
            viewParent.onNestedScroll(view, i, i2, i3, i4);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(viewParent);
            sb.append(" does not implement interface ");
            sb.append("method onNestedScroll");
            Log.e(str, sb.toString(), e);
        }
    }

    public static void onNestedScrollAccepted(ViewParent viewParent, View view, View view2, int i) {
        try {
            viewParent.onNestedScrollAccepted(view, view2, i);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(viewParent);
            sb.append(" does not implement interface ");
            sb.append("method onNestedScrollAccepted");
            Log.e(str, sb.toString(), e);
        }
    }

    public static boolean onStartNestedScroll(ViewParent viewParent, View view, View view2, int i) {
        try {
            return viewParent.onStartNestedScroll(view, view2, i);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(viewParent);
            sb.append(" does not implement interface ");
            sb.append("method onStartNestedScroll");
            Log.e(str, sb.toString(), e);
            return false;
        }
    }

    public static void onStopNestedScroll(ViewParent viewParent, View view) {
        try {
            viewParent.onStopNestedScroll(view);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(viewParent);
            sb.append(" does not implement interface ");
            sb.append("method onStopNestedScroll");
            Log.e(str, sb.toString(), e);
        }
    }
}
