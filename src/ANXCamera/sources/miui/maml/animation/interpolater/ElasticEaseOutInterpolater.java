package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class ElasticEaseOutInterpolater implements Interpolator {
    private float mAmplitude;
    private float mPriod;

    public ElasticEaseOutInterpolater() {
        this.mPriod = 0.3f;
        this.mAmplitude = 0.0f;
    }

    public ElasticEaseOutInterpolater(float f, float f2) {
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
        return (float) ((((double) f3) * Math.pow(2.0d, (double) (-10.0f * f)) * Math.sin((((double) (f - f2)) * 6.283185307179586d) / ((double) this.mPriod))) + 1.0d);
    }
}
