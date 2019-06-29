package android.support.v4.database;

import android.database.CursorWindow;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.os.BuildCompat;

public final class CursorWindowCompat {
    private CursorWindowCompat() {
    }

    @NonNull
    public CursorWindow create(@Nullable String str, long j) {
        return BuildCompat.isAtLeastP() ? new CursorWindow(str, j) : VERSION.SDK_INT >= 15 ? new CursorWindow(str) : new CursorWindow(false);
    }
}
