package miui.view.animation;

import android.view.animation.Interpolator;

public class BackEaseInOutInterpolator implements Interpolator {
    private final float Qg;

    public BackEaseInOutInterpolator() {
        this(0.0f);
    }

    public BackEaseInOutInterpolator(float f) {
        this.Qg = f;
    }

    public float getInterpolation(float f) {
        float f2 = this.Qg == 0.0f ? 1.70158f : this.Qg;
        float f3 = f * 2.0f;
        if (f3 < 1.0f) {
            float f4 = (float) (((double) f2) * 1.525d);
            return 0.5f * f3 * f3 * (((1.0f + f4) * f3) - f4);
        }
        float f5 = f3 - 2.0f;
        float f6 = (float) (((double) f2) * 1.525d);
        return 0.5f * ((f5 * f5 * (((1.0f + f6) * f5) + f6)) + 2.0f);
    }
}
