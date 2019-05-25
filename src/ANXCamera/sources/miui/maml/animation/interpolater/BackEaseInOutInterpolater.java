package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class BackEaseInOutInterpolater implements Interpolator {
    private final float mFactor;

    public BackEaseInOutInterpolater() {
        this.mFactor = 1.70158f;
    }

    public BackEaseInOutInterpolater(float factor) {
        this.mFactor = factor;
    }

    public float getInterpolation(float t) {
        float s = this.mFactor;
        float f = t * 2.0f;
        float t2 = f;
        if (f < 1.0f) {
            float f2 = (float) (((double) s) * 1.525d);
            return 0.5f * t2 * t2 * (((f2 + 1.0f) * t2) - f2);
        }
        float f3 = t2 - 2.0f;
        float t3 = f3;
        float f4 = (float) (((double) s) * 1.525d);
        return 0.5f * ((f3 * t3 * (((f4 + 1.0f) * t3) + f4)) + 2.0f);
    }
}
