package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class SineEaseInOutInterpolater implements Interpolator {
    public float getInterpolation(float t) {
        return -0.5f * ((float) (Math.cos(3.141592653589793d * ((double) t)) - 1.0d));
    }
}
