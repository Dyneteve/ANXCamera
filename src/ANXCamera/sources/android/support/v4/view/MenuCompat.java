package android.support.v4.view;

import android.annotation.SuppressLint;
import android.support.v4.internal.view.SupportMenu;
import android.support.v4.os.BuildCompat;
import android.view.Menu;
import android.view.MenuItem;

public final class MenuCompat {
    private MenuCompat() {
    }

    @SuppressLint({"NewApi"})
    public static void setGroupDividerEnabled(Menu menu, boolean z) {
        if (menu instanceof SupportMenu) {
            ((SupportMenu) menu).setGroupDividerEnabled(z);
        } else if (BuildCompat.isAtLeastP()) {
            menu.setGroupDividerEnabled(z);
        }
    }

    @Deprecated
    public static void setShowAsAction(MenuItem menuItem, int i) {
        menuItem.setShowAsAction(i);
    }
}
