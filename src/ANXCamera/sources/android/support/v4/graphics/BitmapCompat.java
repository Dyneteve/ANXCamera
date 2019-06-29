package android.support.v4.graphics;

import android.graphics.Bitmap;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;

public final class BitmapCompat {
    private BitmapCompat() {
    }

    public static int getAllocationByteCount(@NonNull Bitmap bitmap) {
        return VERSION.SDK_INT >= 19 ? bitmap.getAllocationByteCount() : bitmap.getByteCount();
    }

    public static boolean hasMipMap(@NonNull Bitmap bitmap) {
        if (VERSION.SDK_INT >= 18) {
            return bitmap.hasMipMap();
        }
        return false;
    }

    public static void setHasMipMap(@NonNull Bitmap bitmap, boolean z) {
        if (VERSION.SDK_INT >= 18) {
            bitmap.setHasMipMap(z);
        }
    }
}
