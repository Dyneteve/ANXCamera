package android.support.v4.view;

import android.util.Log;
import android.view.View;
import android.view.ViewParent;

class ViewParentCompatLollipop {
    private static final String TAG = "ViewParentCompat";

    ViewParentCompatLollipop() {
    }

    public static boolean onStartNestedScroll(ViewParent parent, View child, View target, int nestedScrollAxes) {
        try {
            return parent.onStartNestedScroll(child, target, nestedScrollAxes);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(parent);
            sb.append(" does not implement interface ");
            sb.append("method onStartNestedScroll");
            Log.e(str, sb.toString(), e);
            return false;
        }
    }

    public static void onNestedScrollAccepted(ViewParent parent, View child, View target, int nestedScrollAxes) {
        try {
            parent.onNestedScrollAccepted(child, target, nestedScrollAxes);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(parent);
            sb.append(" does not implement interface ");
            sb.append("method onNestedScrollAccepted");
            Log.e(str, sb.toString(), e);
        }
    }

    public static void onStopNestedScroll(ViewParent parent, View target) {
        try {
            parent.onStopNestedScroll(target);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(parent);
            sb.append(" does not implement interface ");
            sb.append("method onStopNestedScroll");
            Log.e(str, sb.toString(), e);
        }
    }

    public static void onNestedScroll(ViewParent parent, View target, int dxConsumed, int dyConsumed, int dxUnconsumed, int dyUnconsumed) {
        try {
            parent.onNestedScroll(target, dxConsumed, dyConsumed, dxUnconsumed, dyUnconsumed);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(parent);
            sb.append(" does not implement interface ");
            sb.append("method onNestedScroll");
            Log.e(str, sb.toString(), e);
        }
    }

    public static void onNestedPreScroll(ViewParent parent, View target, int dx, int dy, int[] consumed) {
        try {
            parent.onNestedPreScroll(target, dx, dy, consumed);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(parent);
            sb.append(" does not implement interface ");
            sb.append("method onNestedPreScroll");
            Log.e(str, sb.toString(), e);
        }
    }

    public static boolean onNestedFling(ViewParent parent, View target, float velocityX, float velocityY, boolean consumed) {
        try {
            return parent.onNestedFling(target, velocityX, velocityY, consumed);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(parent);
            sb.append(" does not implement interface ");
            sb.append("method onNestedFling");
            Log.e(str, sb.toString(), e);
            return false;
        }
    }

    public static boolean onNestedPreFling(ViewParent parent, View target, float velocityX, float velocityY) {
        try {
            return parent.onNestedPreFling(target, velocityX, velocityY);
        } catch (AbstractMethodError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("ViewParent ");
            sb.append(parent);
            sb.append(" does not implement interface ");
            sb.append("method onNestedPreFling");
            Log.e(str, sb.toString(), e);
            return false;
        }
    }
}
