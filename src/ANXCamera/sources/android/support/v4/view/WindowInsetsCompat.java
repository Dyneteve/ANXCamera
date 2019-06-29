package android.support.v4.view;

import android.graphics.Rect;
import android.os.Build.VERSION;
import android.support.annotation.Nullable;
import android.view.WindowInsets;

public class WindowInsetsCompat {
    private final Object mInsets;

    public WindowInsetsCompat(WindowInsetsCompat windowInsetsCompat) {
        WindowInsets windowInsets = null;
        if (VERSION.SDK_INT >= 20) {
            if (windowInsetsCompat != null) {
                windowInsets = new WindowInsets((WindowInsets) windowInsetsCompat.mInsets);
            }
            this.mInsets = windowInsets;
            return;
        }
        this.mInsets = null;
    }

    private WindowInsetsCompat(Object obj) {
        this.mInsets = obj;
    }

    static Object unwrap(WindowInsetsCompat windowInsetsCompat) {
        if (windowInsetsCompat == null) {
            return null;
        }
        return windowInsetsCompat.mInsets;
    }

    static WindowInsetsCompat wrap(Object obj) {
        if (obj == null) {
            return null;
        }
        return new WindowInsetsCompat(obj);
    }

    public WindowInsetsCompat consumeDisplayCutout() {
        if (VERSION.SDK_INT >= 28) {
            return new WindowInsetsCompat((Object) ((WindowInsets) this.mInsets).consumeDisplayCutout());
        }
        return null;
    }

    public WindowInsetsCompat consumeStableInsets() {
        if (VERSION.SDK_INT >= 21) {
            return new WindowInsetsCompat((Object) ((WindowInsets) this.mInsets).consumeStableInsets());
        }
        return null;
    }

    public WindowInsetsCompat consumeSystemWindowInsets() {
        if (VERSION.SDK_INT >= 20) {
            return new WindowInsetsCompat((Object) ((WindowInsets) this.mInsets).consumeSystemWindowInsets());
        }
        return null;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        WindowInsetsCompat windowInsetsCompat = (WindowInsetsCompat) obj;
        if (this.mInsets != null) {
            z = this.mInsets.equals(windowInsetsCompat.mInsets);
        } else if (windowInsetsCompat.mInsets != null) {
            z = false;
        }
        return z;
    }

    @Nullable
    public DisplayCutoutCompat getDisplayCutout() {
        if (VERSION.SDK_INT >= 28) {
            return DisplayCutoutCompat.wrap(((WindowInsets) this.mInsets).getDisplayCutout());
        }
        return null;
    }

    public int getStableInsetBottom() {
        if (VERSION.SDK_INT >= 21) {
            return ((WindowInsets) this.mInsets).getStableInsetBottom();
        }
        return 0;
    }

    public int getStableInsetLeft() {
        if (VERSION.SDK_INT >= 21) {
            return ((WindowInsets) this.mInsets).getStableInsetLeft();
        }
        return 0;
    }

    public int getStableInsetRight() {
        if (VERSION.SDK_INT >= 21) {
            return ((WindowInsets) this.mInsets).getStableInsetRight();
        }
        return 0;
    }

    public int getStableInsetTop() {
        if (VERSION.SDK_INT >= 21) {
            return ((WindowInsets) this.mInsets).getStableInsetTop();
        }
        return 0;
    }

    public int getSystemWindowInsetBottom() {
        if (VERSION.SDK_INT >= 20) {
            return ((WindowInsets) this.mInsets).getSystemWindowInsetBottom();
        }
        return 0;
    }

    public int getSystemWindowInsetLeft() {
        if (VERSION.SDK_INT >= 20) {
            return ((WindowInsets) this.mInsets).getSystemWindowInsetLeft();
        }
        return 0;
    }

    public int getSystemWindowInsetRight() {
        if (VERSION.SDK_INT >= 20) {
            return ((WindowInsets) this.mInsets).getSystemWindowInsetRight();
        }
        return 0;
    }

    public int getSystemWindowInsetTop() {
        if (VERSION.SDK_INT >= 20) {
            return ((WindowInsets) this.mInsets).getSystemWindowInsetTop();
        }
        return 0;
    }

    public boolean hasInsets() {
        if (VERSION.SDK_INT >= 20) {
            return ((WindowInsets) this.mInsets).hasInsets();
        }
        return false;
    }

    public boolean hasStableInsets() {
        if (VERSION.SDK_INT >= 21) {
            return ((WindowInsets) this.mInsets).hasStableInsets();
        }
        return false;
    }

    public boolean hasSystemWindowInsets() {
        if (VERSION.SDK_INT >= 20) {
            return ((WindowInsets) this.mInsets).hasSystemWindowInsets();
        }
        return false;
    }

    public int hashCode() {
        if (this.mInsets == null) {
            return 0;
        }
        return this.mInsets.hashCode();
    }

    public boolean isConsumed() {
        if (VERSION.SDK_INT >= 21) {
            return ((WindowInsets) this.mInsets).isConsumed();
        }
        return false;
    }

    public boolean isRound() {
        if (VERSION.SDK_INT >= 20) {
            return ((WindowInsets) this.mInsets).isRound();
        }
        return false;
    }

    public WindowInsetsCompat replaceSystemWindowInsets(int i, int i2, int i3, int i4) {
        if (VERSION.SDK_INT >= 20) {
            return new WindowInsetsCompat((Object) ((WindowInsets) this.mInsets).replaceSystemWindowInsets(i, i2, i3, i4));
        }
        return null;
    }

    public WindowInsetsCompat replaceSystemWindowInsets(Rect rect) {
        if (VERSION.SDK_INT >= 21) {
            return new WindowInsetsCompat((Object) ((WindowInsets) this.mInsets).replaceSystemWindowInsets(rect));
        }
        return null;
    }
}
