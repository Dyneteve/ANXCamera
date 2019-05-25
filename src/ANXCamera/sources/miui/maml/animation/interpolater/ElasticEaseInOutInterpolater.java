package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class ElasticEaseInOutInterpolater implements Interpolator {
    private float mAmplitude;
    private float mPriod;

    public ElasticEaseInOutInterpolater() {
        this.mPriod = 0.45000002f;
        this.mAmplitude = 0.0f;
    }

    public ElasticEaseInOutInterpolater(float priod, float amplitude) {
        this.mPriod = priod;
        this.mAmplitude = amplitude;
    }

    public float getInterpolation(float t) {
        float s;
        float a = this.mAmplitude;
        if (t == 0.0f) {
            return 0.0f;
        }
        float f = t / 0.5f;
        float t2 = f;
        if (f == 2.0f) {
            return 1.0f;
        }
        if (a < 1.0f) {
            a = 1.0f;
            s = this.mPriod / 4.0f;
        } else {
            s = (float) ((((double) this.mPriod) / 6.283185307179586d) * Math.asin((double) (1.0f / a)));
        }
        if (t2 < 1.0f) {
            float f2 = t2 - 1.0f;
            return -0.5f * ((float) (((double) a) * Math.pow(2.0d, (double) (10.0f * f2)) * Math.sin((((double) (f2 - s)) * 6.283185307179586d) / ((double) this.mPriod))));
        }
        float f3 = t2 - 1.0f;
        return (float) ((((double) a) * Math.pow(2.0d, (double) (-10.0f * f3)) * Math.sin((((double) (f3 - s)) * 6.283185307179586d) / ((double) this.mPriod)) * 0.5d) + 1.0d);
    }
}
