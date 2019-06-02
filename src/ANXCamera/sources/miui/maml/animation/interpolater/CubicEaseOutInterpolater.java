package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class CubicEaseOutInterpolater implements Interpolator {
    public float getInterpolation(float f) {
        float f2 = f - 1.0f;
        float f3 = f2;
        return (f2 * f3 * f3) + 1.0f;
    }
}
