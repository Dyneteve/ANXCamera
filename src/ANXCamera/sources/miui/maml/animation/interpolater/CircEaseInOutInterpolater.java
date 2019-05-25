package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class CircEaseInOutInterpolater implements Interpolator {
    public float getInterpolation(float t) {
        float f = t * 2.0f;
        float t2 = f;
        if (f < 1.0f) {
            return -0.5f * ((float) (Math.sqrt((double) (1.0f - (t2 * t2))) - 1.0d));
        }
        float f2 = t2 - 2.0f;
        return 0.5f * ((float) (Math.sqrt((double) (1.0f - (f2 * f2))) + 1.0d));
    }
}
