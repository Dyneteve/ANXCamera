package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class QuadEaseInOutInterpolater implements Interpolator {
    public float getInterpolation(float f) {
        float f2 = f * 2.0f;
        float f3 = f2;
        if (f2 < 1.0f) {
            return 0.5f * f3 * f3;
        }
        float f4 = f3 - 1.0f;
        return -0.5f * ((f4 * (f4 - 2.0f)) - 1.0f);
    }
}
