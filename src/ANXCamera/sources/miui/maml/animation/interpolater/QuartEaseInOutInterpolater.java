package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class QuartEaseInOutInterpolater implements Interpolator {
    public float getInterpolation(float f) {
        float f2 = f * 2.0f;
        float f3 = f2;
        if (f2 < 1.0f) {
            return 0.5f * f3 * f3 * f3 * f3;
        }
        float f4 = f3 - 2.0f;
        float f5 = f4;
        return -0.5f * ((((f4 * f5) * f5) * f5) - 2.0f);
    }
}
