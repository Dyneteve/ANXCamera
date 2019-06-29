package com.android.camera.animation;

import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.TranslateAnimation;

public class FragmentAnimationFactory {
    /* JADX WARNING: type inference failed for: r7v2, types: [android.view.animation.AlphaAnimation] */
    /* JADX WARNING: type inference failed for: r7v3, types: [android.view.animation.AlphaAnimation] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Unknown variable types count: 2 */
    public static Animation wrapperAnimation(AnimationListener animationListener, int... iArr) {
        TranslateAnimation translateAnimation;
        AnimationListener animationListener2 = animationListener;
        int[] iArr2 = iArr;
        AnimationSet animationSet = new AnimationSet(true);
        boolean z = false;
        for (int i : iArr2) {
            switch (i) {
                case 161:
                    translateAnimation = new AlphaAnimation(0.0f, 1.0f);
                    break;
                case 162:
                    translateAnimation = new AlphaAnimation(1.0f, 0.0f);
                    break;
                case 167:
                    TranslateAnimation translateAnimation2 = new TranslateAnimation(1, 0.0f, 1, 0.0f, 1, 1.0f, 1, 0.0f);
                    translateAnimation = translateAnimation2;
                    break;
                case 168:
                    TranslateAnimation translateAnimation3 = new TranslateAnimation(1, 0.0f, 1, 0.0f, 1, 0.0f, 1, 1.0f);
                    translateAnimation = translateAnimation3;
                    break;
                default:
                    return null;
            }
            if (animationListener2 != null && !z) {
                translateAnimation.setAnimationListener(animationListener2);
                z = true;
            }
            translateAnimation.setDuration(200);
            translateAnimation.setInterpolator(AnimationDelegate.DEFAULT_INTERPOLATOR);
            animationSet.addAnimation(translateAnimation);
        }
        return animationSet;
    }

    public static Animation wrapperAnimation(int... iArr) {
        return wrapperAnimation(null, iArr);
    }
}
