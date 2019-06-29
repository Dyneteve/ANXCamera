package miui.view.animation;

import android.view.animation.Interpolator;

public class CirclularEaseInOutInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        float f2 = f * 2.0f;
        if (f2 < 1.0f) {
            return -0.5f * ((float) (Math.sqrt((double) (1.0f - (f2 * f2))) - 1.0d));
        }
        float f3 = f2 - 2.0f;
        return 0.5f * ((float) (Math.sqrt((double) (1.0f - (f3 * f3))) + 1.0d));
    }
}
