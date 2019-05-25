package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class QuadEaseInOutInterpolater implements Interpolator {
    public float getInterpolation(float t) {
        float f = t * 2.0f;
        float t2 = f;
        if (f < 1.0f) {
            return 0.5f * t2 * t2;
        }
        float f2 = t2 - 1.0f;
        return -0.5f * ((f2 * (f2 - 2.0f)) - 1.0f);
    }
}
