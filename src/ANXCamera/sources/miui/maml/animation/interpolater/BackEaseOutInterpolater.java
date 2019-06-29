package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class BackEaseOutInterpolater implements Interpolator {
    private final float mFactor;

    public BackEaseOutInterpolater() {
        this.mFactor = 1.70158f;
    }

    public BackEaseOutInterpolater(float f) {
        this.mFactor = f;
    }

    public float getInterpolation(float f) {
        float f2 = f - 1.0f;
        float f3 = f2;
        return (f2 * f3 * (((this.mFactor + 1.0f) * f3) + this.mFactor)) + 1.0f;
    }
}
