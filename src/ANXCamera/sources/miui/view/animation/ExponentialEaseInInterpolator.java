package miui.view.animation;

import android.view.animation.Interpolator;

public class ExponentialEaseInInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        if (f == 0.0f) {
            return 0.0f;
        }
        return (float) Math.pow(2.0d, (double) (10.0f * (f - 1.0f)));
    }
}
