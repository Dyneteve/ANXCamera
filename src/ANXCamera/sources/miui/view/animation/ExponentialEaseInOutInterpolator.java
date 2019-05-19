package miui.view.animation;

import android.view.animation.Interpolator;

public class ExponentialEaseInOutInterpolator implements Interpolator {
    public float getInterpolation(float f) {
        if (f == 0.0f) {
            return 0.0f;
        }
        if (f == 1.0f) {
            return 1.0f;
        }
        float f2 = f * 2.0f;
        if (f2 < 1.0f) {
            return 0.5f * ((float) Math.pow(2.0d, (double) (10.0f * (f2 - 1.0f))));
        }
        return 0.5f * ((float) ((-Math.pow(2.0d, (double) (-10.0f * (f2 - 1.0f)))) + 2.0d));
    }
}
