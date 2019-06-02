package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class BackEaseInInterpolater implements Interpolator {
    private final float mFactor;

    public BackEaseInInterpolater() {
        this.mFactor = 1.70158f;
    }

    public BackEaseInInterpolater(float f) {
        this.mFactor = f;
    }

    public float getInterpolation(float f) {
        return f * f * (((this.mFactor + 1.0f) * f) - this.mFactor);
    }
}
