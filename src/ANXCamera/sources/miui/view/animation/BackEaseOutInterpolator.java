package miui.view.animation;

import android.view.animation.Interpolator;

public class BackEaseOutInterpolator implements Interpolator {
    private final float Og;

    public BackEaseOutInterpolator() {
        this(0.0f);
    }

    public BackEaseOutInterpolator(float f) {
        this.Og = f;
    }

    public float getInterpolation(float f) {
        float f2 = this.Og == 0.0f ? 1.70158f : this.Og;
        float f3 = f - 1.0f;
        return (f3 * f3 * (((f2 + 1.0f) * f3) + f2)) + 1.0f;
    }
}
