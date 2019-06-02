package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class SineEaseOutInterpolater implements Interpolator {
    public float getInterpolation(float f) {
        return (float) Math.sin(((double) f) * 1.5707963267948966d);
    }
}
