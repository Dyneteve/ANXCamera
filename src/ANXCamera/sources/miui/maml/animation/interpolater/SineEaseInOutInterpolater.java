package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class SineEaseInOutInterpolater implements Interpolator {
    public float getInterpolation(float f) {
        return -0.5f * ((float) (Math.cos(3.141592653589793d * ((double) f)) - 1.0d));
    }
}
