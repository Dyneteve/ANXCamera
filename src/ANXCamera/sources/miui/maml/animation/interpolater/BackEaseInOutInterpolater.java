package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class BackEaseInOutInterpolater implements Interpolator {
    private final float mFactor;

    public BackEaseInOutInterpolater() {
        this.mFactor = 1.70158f;
    }

    public BackEaseInOutInterpolater(float f) {
        this.mFactor = f;
    }

    public float getInterpolation(float f) {
        float f2 = this.mFactor;
        float f3 = f * 2.0f;
        float f4 = f3;
        if (f3 < 1.0f) {
            float f5 = (float) (((double) f2) * 1.525d);
            return 0.5f * f4 * f4 * (((f5 + 1.0f) * f4) - f5);
        }
        float f6 = f4 - 2.0f;
        float f7 = f6;
        float f8 = (float) (((double) f2) * 1.525d);
        return 0.5f * ((f6 * f7 * (((f8 + 1.0f) * f7) + f8)) + 2.0f);
    }
}
