package android.support.v4.view.accessibility;

import android.graphics.Rect;
import android.os.Build.VERSION;
import android.view.accessibility.AccessibilityWindowInfo;

public class AccessibilityWindowInfoCompat {
    public static final int TYPE_ACCESSIBILITY_OVERLAY = 4;
    public static final int TYPE_APPLICATION = 1;
    public static final int TYPE_INPUT_METHOD = 2;
    public static final int TYPE_SPLIT_SCREEN_DIVIDER = 5;
    public static final int TYPE_SYSTEM = 3;
    private static final int UNDEFINED = -1;
    private Object mInfo;

    private AccessibilityWindowInfoCompat(Object obj) {
        this.mInfo = obj;
    }

    public static AccessibilityWindowInfoCompat obtain() {
        if (VERSION.SDK_INT >= 21) {
            return wrapNonNullInstance(AccessibilityWindowInfo.obtain());
        }
        return null;
    }

    public static AccessibilityWindowInfoCompat obtain(AccessibilityWindowInfoCompat accessibilityWindowInfoCompat) {
        AccessibilityWindowInfoCompat accessibilityWindowInfoCompat2 = null;
        if (VERSION.SDK_INT < 21) {
            return null;
        }
        if (accessibilityWindowInfoCompat != null) {
            accessibilityWindowInfoCompat2 = wrapNonNullInstance(AccessibilityWindowInfo.obtain((AccessibilityWindowInfo) accessibilityWindowInfoCompat.mInfo));
        }
        return accessibilityWindowInfoCompat2;
    }

    private static String typeToString(int i) {
        switch (i) {
            case 1:
                return "TYPE_APPLICATION";
            case 2:
                return "TYPE_INPUT_METHOD";
            case 3:
                return "TYPE_SYSTEM";
            case 4:
                return "TYPE_ACCESSIBILITY_OVERLAY";
            default:
                return "<UNKNOWN>";
        }
    }

    static AccessibilityWindowInfoCompat wrapNonNullInstance(Object obj) {
        if (obj != null) {
            return new AccessibilityWindowInfoCompat(obj);
        }
        return null;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        AccessibilityWindowInfoCompat accessibilityWindowInfoCompat = (AccessibilityWindowInfoCompat) obj;
        if (this.mInfo == null) {
            if (accessibilityWindowInfoCompat.mInfo != null) {
                return false;
            }
        } else if (!this.mInfo.equals(accessibilityWindowInfoCompat.mInfo)) {
            return false;
        }
        return true;
    }

    public AccessibilityNodeInfoCompat getAnchor() {
        if (VERSION.SDK_INT >= 24) {
            return AccessibilityNodeInfoCompat.wrapNonNullInstance(((AccessibilityWindowInfo) this.mInfo).getAnchor());
        }
        return null;
    }

    public void getBoundsInScreen(Rect rect) {
        if (VERSION.SDK_INT >= 21) {
            ((AccessibilityWindowInfo) this.mInfo).getBoundsInScreen(rect);
        }
    }

    public AccessibilityWindowInfoCompat getChild(int i) {
        if (VERSION.SDK_INT >= 21) {
            return wrapNonNullInstance(((AccessibilityWindowInfo) this.mInfo).getChild(i));
        }
        return null;
    }

    public int getChildCount() {
        if (VERSION.SDK_INT >= 21) {
            return ((AccessibilityWindowInfo) this.mInfo).getChildCount();
        }
        return 0;
    }

    public int getId() {
        if (VERSION.SDK_INT >= 21) {
            return ((AccessibilityWindowInfo) this.mInfo).getId();
        }
        return -1;
    }

    public int getLayer() {
        if (VERSION.SDK_INT >= 21) {
            return ((AccessibilityWindowInfo) this.mInfo).getLayer();
        }
        return -1;
    }

    public AccessibilityWindowInfoCompat getParent() {
        if (VERSION.SDK_INT >= 21) {
            return wrapNonNullInstance(((AccessibilityWindowInfo) this.mInfo).getParent());
        }
        return null;
    }

    public AccessibilityNodeInfoCompat getRoot() {
        if (VERSION.SDK_INT >= 21) {
            return AccessibilityNodeInfoCompat.wrapNonNullInstance(((AccessibilityWindowInfo) this.mInfo).getRoot());
        }
        return null;
    }

    public CharSequence getTitle() {
        if (VERSION.SDK_INT >= 24) {
            return ((AccessibilityWindowInfo) this.mInfo).getTitle();
        }
        return null;
    }

    public int getType() {
        if (VERSION.SDK_INT >= 21) {
            return ((AccessibilityWindowInfo) this.mInfo).getType();
        }
        return -1;
    }

    public int hashCode() {
        if (this.mInfo == null) {
            return 0;
        }
        return this.mInfo.hashCode();
    }

    public boolean isAccessibilityFocused() {
        if (VERSION.SDK_INT >= 21) {
            return ((AccessibilityWindowInfo) this.mInfo).isAccessibilityFocused();
        }
        return true;
    }

    public boolean isActive() {
        if (VERSION.SDK_INT >= 21) {
            return ((AccessibilityWindowInfo) this.mInfo).isActive();
        }
        return true;
    }

    public boolean isFocused() {
        if (VERSION.SDK_INT >= 21) {
            return ((AccessibilityWindowInfo) this.mInfo).isFocused();
        }
        return true;
    }

    public void recycle() {
        if (VERSION.SDK_INT >= 21) {
            ((AccessibilityWindowInfo) this.mInfo).recycle();
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        Rect rect = new Rect();
        getBoundsInScreen(rect);
        sb.append("AccessibilityWindowInfo[");
        sb.append("id=");
        sb.append(getId());
        sb.append(", type=");
        sb.append(typeToString(getType()));
        sb.append(", layer=");
        sb.append(getLayer());
        sb.append(", bounds=");
        sb.append(rect);
        sb.append(", focused=");
        sb.append(isFocused());
        sb.append(", active=");
        sb.append(isActive());
        sb.append(", hasParent=");
        boolean z = false;
        sb.append(getParent() != null);
        sb.append(", hasChildren=");
        if (getChildCount() > 0) {
            z = true;
        }
        sb.append(z);
        sb.append(']');
        return sb.toString();
    }
}
