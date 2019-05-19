package miui.view.animation;

import android.view.animation.Interpolator;

public class ElasticEaseInInterpolator implements Interpolator {
    private final float Oh;
    private final float Oi;

    public ElasticEaseInInterpolator() {
        this(0.0f, 0.0f);
    }

    public ElasticEaseInInterpolator(float f, float f2) {
        this.Oh = f;
        this.Oi = f2;
    }

    public float getInterpolation(float f) {
        float f2;
        float f3 = this.Oi;
        float f4 = this.Oh;
        if (f == 0.0f) {
            return 0.0f;
        }
        if (f == 1.0f) {
            return 1.0f;
        }
        if (f3 == 0.0f) {
            f3 = 0.3f;
        }
        if (f4 == 0.0f || f4 < 1.0f) {
            f2 = f3 / 4.0f;
            f4 = 1.0f;
        } else {
            f2 = (float) ((((double) f3) / 6.283185307179586d) * Math.asin((double) (1.0f / f4)));
        }
        float f5 = f - 1.0f;
        return -((float) (((double) f4) * Math.pow(2.0d, (double) (10.0f * f5)) * Math.sin((((double) (f5 - f2)) * 6.283185307179586d) / ((double) f3))));
    }
}
