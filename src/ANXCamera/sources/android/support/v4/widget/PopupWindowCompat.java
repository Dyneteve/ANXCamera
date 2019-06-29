package android.support.v4.widget;

import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewCompat;
import android.util.Log;
import android.view.View;
import android.widget.PopupWindow;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public final class PopupWindowCompat {
    private static final String TAG = "PopupWindowCompatApi21";
    private static Method sGetWindowLayoutTypeMethod;
    private static boolean sGetWindowLayoutTypeMethodAttempted;
    private static Field sOverlapAnchorField;
    private static boolean sOverlapAnchorFieldAttempted;
    private static Method sSetWindowLayoutTypeMethod;
    private static boolean sSetWindowLayoutTypeMethodAttempted;

    private PopupWindowCompat() {
    }

    public static boolean getOverlapAnchor(@NonNull PopupWindow popupWindow) {
        if (VERSION.SDK_INT >= 23) {
            return popupWindow.getOverlapAnchor();
        }
        if (VERSION.SDK_INT >= 21) {
            if (!sOverlapAnchorFieldAttempted) {
                try {
                    sOverlapAnchorField = PopupWindow.class.getDeclaredField("mOverlapAnchor");
                    sOverlapAnchorField.setAccessible(true);
                } catch (NoSuchFieldException e) {
                    Log.i(TAG, "Could not fetch mOverlapAnchor field from PopupWindow", e);
                }
                sOverlapAnchorFieldAttempted = true;
            }
            if (sOverlapAnchorField != null) {
                try {
                    return ((Boolean) sOverlapAnchorField.get(popupWindow)).booleanValue();
                } catch (IllegalAccessException e2) {
                    Log.i(TAG, "Could not get overlap anchor field in PopupWindow", e2);
                }
            }
        }
        return false;
    }

    public static int getWindowLayoutType(@NonNull PopupWindow popupWindow) {
        if (VERSION.SDK_INT >= 23) {
            return popupWindow.getWindowLayoutType();
        }
        if (!sGetWindowLayoutTypeMethodAttempted) {
            try {
                sGetWindowLayoutTypeMethod = PopupWindow.class.getDeclaredMethod("getWindowLayoutType", new Class[0]);
                sGetWindowLayoutTypeMethod.setAccessible(true);
            } catch (Exception e) {
            }
            sGetWindowLayoutTypeMethodAttempted = true;
        }
        if (sGetWindowLayoutTypeMethod != null) {
            try {
                return ((Integer) sGetWindowLayoutTypeMethod.invoke(popupWindow, new Object[0])).intValue();
            } catch (Exception e2) {
            }
        }
        return 0;
    }

    public static void setOverlapAnchor(@NonNull PopupWindow popupWindow, boolean z) {
        if (VERSION.SDK_INT >= 23) {
            popupWindow.setOverlapAnchor(z);
        } else if (VERSION.SDK_INT >= 21) {
            if (!sOverlapAnchorFieldAttempted) {
                try {
                    sOverlapAnchorField = PopupWindow.class.getDeclaredField("mOverlapAnchor");
                    sOverlapAnchorField.setAccessible(true);
                } catch (NoSuchFieldException e) {
                    Log.i(TAG, "Could not fetch mOverlapAnchor field from PopupWindow", e);
                }
                sOverlapAnchorFieldAttempted = true;
            }
            if (sOverlapAnchorField != null) {
                try {
                    sOverlapAnchorField.set(popupWindow, Boolean.valueOf(z));
                } catch (IllegalAccessException e2) {
                    Log.i(TAG, "Could not set overlap anchor field in PopupWindow", e2);
                }
            }
        }
    }

    public static void setWindowLayoutType(@NonNull PopupWindow popupWindow, int i) {
        if (VERSION.SDK_INT >= 23) {
            popupWindow.setWindowLayoutType(i);
            return;
        }
        if (!sSetWindowLayoutTypeMethodAttempted) {
            try {
                sSetWindowLayoutTypeMethod = PopupWindow.class.getDeclaredMethod("setWindowLayoutType", new Class[]{Integer.TYPE});
                sSetWindowLayoutTypeMethod.setAccessible(true);
            } catch (Exception e) {
            }
            sSetWindowLayoutTypeMethodAttempted = true;
        }
        if (sSetWindowLayoutTypeMethod != null) {
            try {
                sSetWindowLayoutTypeMethod.invoke(popupWindow, new Object[]{Integer.valueOf(i)});
            } catch (Exception e2) {
            }
        }
    }

    public static void showAsDropDown(@NonNull PopupWindow popupWindow, @NonNull View view, int i, int i2, int i3) {
        if (VERSION.SDK_INT >= 19) {
            popupWindow.showAsDropDown(view, i, i2, i3);
            return;
        }
        if ((GravityCompat.getAbsoluteGravity(i3, ViewCompat.getLayoutDirection(view)) & 7) == 5) {
            i -= popupWindow.getWidth() - view.getWidth();
        }
        popupWindow.showAsDropDown(view, i, i2);
    }
}
