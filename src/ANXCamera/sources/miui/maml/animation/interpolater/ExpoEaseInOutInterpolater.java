package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class ExpoEaseInOutInterpolater implements Interpolator {
    public float getInterpolation(float f) {
        if (f == 0.0f) {
            return 0.0f;
        }
        if (f == 1.0f) {
            return 1.0f;
        }
        float f2 = 2.0f * f;
        float f3 = f2;
        if (f2 < 1.0f) {
            return 0.5f * ((float) Math.pow(2.0d, (double) (10.0f * (f3 - 1.0f))));
        }
        float f4 = f3 - 1.0f;
        float f5 = f4;
        return 0.5f * ((float) ((-Math.pow(2.0d, (double) (-10.0f * f4))) + 2.0d));
    }
}
