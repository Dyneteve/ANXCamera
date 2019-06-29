package miui.view.animation;

import android.view.animation.Interpolator;

public class ElasticEaseInOutInterpolator implements Interpolator {
    private final float Qh;
    private final float Qi;

    public ElasticEaseInOutInterpolator() {
        this(0.0f, 0.0f);
    }

    public ElasticEaseInOutInterpolator(float f, float f2) {
        this.Qh = f;
        this.Qi = f2;
    }

    public float getInterpolation(float f) {
        float f2;
        float f3 = this.Qi;
        float f4 = this.Qh;
        if (f == 0.0f) {
            return 0.0f;
        }
        float f5 = f / 0.5f;
        if (f5 == 2.0f) {
            return 1.0f;
        }
        if (f3 == 0.0f) {
            f3 = 0.45000002f;
        }
        if (f4 == 0.0f || f4 < 1.0f) {
            f2 = f3 / 4.0f;
            f4 = 1.0f;
        } else {
            f2 = (float) ((((double) f3) / 6.283185307179586d) * Math.asin((double) (1.0f / f4)));
        }
        if (f5 < 1.0f) {
            float f6 = f5 - 1.0f;
            return -0.5f * ((float) (((double) f4) * Math.pow(2.0d, (double) (10.0f * f6)) * Math.sin((((double) (f6 - f2)) * 6.283185307179586d) / ((double) f3))));
        }
        float f7 = f5 - 1.0f;
        return (float) ((((double) f4) * Math.pow(2.0d, (double) (-10.0f * f7)) * Math.sin((((double) (f7 - f2)) * 6.283185307179586d) / ((double) f3)) * 0.5d) + 1.0d);
    }
}
