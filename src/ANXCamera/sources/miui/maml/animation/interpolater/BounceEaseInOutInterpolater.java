package miui.maml.animation.interpolater;

import android.view.animation.Interpolator;

public class BounceEaseInOutInterpolater implements Interpolator {
    public float getInterpolation(float f) {
        return f < 0.5f ? BounceEaseInInterpolater.getInterpolationImp(2.0f * f) * 0.5f : (BounceEaseOutInterpolater.getInterpolationImp((2.0f * f) - 1.0f) * 0.5f) + 0.5f;
    }
}
