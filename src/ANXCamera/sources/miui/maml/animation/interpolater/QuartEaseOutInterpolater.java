package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class QuartEaseOutInterpolater implements Interpolator {
    public float getInterpolation(float t) {
        float f = t - 1.0f;
        float t2 = f;
        return -((((f * t2) * t2) * t2) - 1.0f);
    }
}
