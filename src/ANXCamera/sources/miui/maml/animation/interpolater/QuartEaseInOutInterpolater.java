package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class QuartEaseInOutInterpolater implements Interpolator {
    public float getInterpolation(float t) {
        float f = t * 2.0f;
        float t2 = f;
        if (f < 1.0f) {
            return 0.5f * t2 * t2 * t2 * t2;
        }
        float f2 = t2 - 2.0f;
        float t3 = f2;
        return -0.5f * ((((f2 * t3) * t3) * t3) - 2.0f);
    }
}
