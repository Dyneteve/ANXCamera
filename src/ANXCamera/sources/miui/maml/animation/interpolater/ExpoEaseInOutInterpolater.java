package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class ExpoEaseInOutInterpolater implements Interpolator {
    public float getInterpolation(float t) {
        if (t == 0.0f) {
            return 0.0f;
        }
        if (t == 1.0f) {
            return 1.0f;
        }
        float f = 2.0f * t;
        float t2 = f;
        if (f < 1.0f) {
            return 0.5f * ((float) Math.pow(2.0d, (double) (10.0f * (t2 - 1.0f))));
        }
        float f2 = t2 - 1.0f;
        float t3 = f2;
        return 0.5f * ((float) ((-Math.pow(2.0d, (double) (-10.0f * f2))) + 2.0d));
    }
}
