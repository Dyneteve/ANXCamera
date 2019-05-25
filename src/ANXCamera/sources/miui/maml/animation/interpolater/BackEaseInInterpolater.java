package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class BackEaseInInterpolater implements Interpolator {
    private final float mFactor;

    public BackEaseInInterpolater() {
        this.mFactor = 1.70158f;
    }

    public BackEaseInInterpolater(float factor) {
        this.mFactor = factor;
    }

    public float getInterpolation(float t) {
        return t * t * (((this.mFactor + 1.0f) * t) - this.mFactor);
    }
}
