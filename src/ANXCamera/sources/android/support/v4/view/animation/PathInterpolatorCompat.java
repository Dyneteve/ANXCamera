package android.support.v4.view.animation;

import android.graphics.Path;
import android.os.Build.VERSION;
import android.view.animation.Interpolator;
import android.view.animation.PathInterpolator;

public final class PathInterpolatorCompat {
    private PathInterpolatorCompat() {
    }

    public static Interpolator create(float f, float f2) {
        return VERSION.SDK_INT >= 21 ? new PathInterpolator(f, f2) : new PathInterpolatorApi14(f, f2);
    }

    public static Interpolator create(float f, float f2, float f3, float f4) {
        return VERSION.SDK_INT >= 21 ? new PathInterpolator(f, f2, f3, f4) : new PathInterpolatorApi14(f, f2, f3, f4);
    }

    public static Interpolator create(Path path) {
        return VERSION.SDK_INT >= 21 ? new PathInterpolator(path) : new PathInterpolatorApi14(path);
    }
}
