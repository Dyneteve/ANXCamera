package miui.view.animation;

import android.view.animation.Interpolator;

public class BackEaseOutInterpolator implements Interpolator {
    private final float Qg;

    public BackEaseOutInterpolator() {
        this(0.0f);
    }

    public BackEaseOutInterpolator(float f) {
        this.Qg = f;
    }

    public float getInterpolation(float f) {
        float f2 = this.Qg == 0.0f ? 1.70158f : this.Qg;
        float f3 = f - 1.0f;
        return (f3 * f3 * (((f2 + 1.0f) * f3) + f2)) + 1.0f;
    }
}
