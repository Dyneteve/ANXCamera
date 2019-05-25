package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class ExpoEaseInInterpolater implements Interpolator {
    public float getInterpolation(float t) {
        if (t == 0.0f) {
            return 0.0f;
        }
        return (float) Math.pow(2.0d, (double) (10.0f * (t - 1.0f)));
    }
}
