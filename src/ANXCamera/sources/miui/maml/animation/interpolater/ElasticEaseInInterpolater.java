package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class ElasticEaseInInterpolater implements Interpolator {
    private float mAmplitude;
    private float mPriod;

    public ElasticEaseInInterpolater() {
        this.mPriod = 0.3f;
        this.mAmplitude = 0.0f;
    }

    public ElasticEaseInInterpolater(float f, float f2) {
        this.mPriod = f;
        this.mAmplitude = f2;
    }

    public float getInterpolation(float f) {
        float f2;
        float f3 = this.mAmplitude;
        if (f == 0.0f) {
            return 0.0f;
        }
        if (f == 1.0f) {
            return 1.0f;
        }
        if (f3 < 1.0f) {
            f3 = 1.0f;
            f2 = this.mPriod / 4.0f;
        } else {
            f2 = (float) ((((double) this.mPriod) / 6.283185307179586d) * Math.asin((double) (1.0f / f3)));
        }
        float f4 = f - 1.0f;
        return -((float) (((double) f3) * Math.pow(2.0d, (double) (10.0f * f4)) * Math.sin((((double) (f4 - f2)) * 6.283185307179586d) / ((double) this.mPriod))));
    }
}
