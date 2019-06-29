package miui.view.animation;

import android.view.animation.Interpolator;

public class CirclularEaseOutInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        float f2 = f - 1.0f;
        return (float) Math.sqrt((double) (1.0f - (f2 * f2)));
    }
}
