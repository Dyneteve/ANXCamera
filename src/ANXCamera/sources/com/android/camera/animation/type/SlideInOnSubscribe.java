package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class SlideInOnSubscribe extends BaseOnSubScribe {
    private int mGravity;

    public SlideInOnSubscribe(View view, int i) {
        super(view);
        this.mGravity = i;
    }

    public static void directSetResult(View view, int i) {
        ViewCompat.setTranslationX(view, 0.0f);
        ViewCompat.setTranslationY(view, 0.0f);
        ViewCompat.setAlpha(view, 1.0f);
        setAnimateViewVisible(view, 0);
    }

    /* access modifiers changed from: protected */
    public ViewPropertyAnimatorCompat getAnimation() {
        int i;
        int i2 = 0;
        setAnimateViewVisible(this.mAniView, 0);
        int max = Math.max(this.mAniView.getWidth(), this.mAniView.getLayoutParams().width);
        int max2 = Math.max(this.mAniView.getHeight(), this.mAniView.getLayoutParams().height);
        int i3 = this.mGravity;
        if (i3 == 3) {
            max = -max;
        } else if (i3 != 5) {
            i = i3 != 48 ? i3 != 80 ? 0 : max2 : -max2;
            ViewCompat.setTranslationX(this.mAniView, (float) i2);
            ViewCompat.setTranslationY(this.mAniView, (float) i);
            ViewCompat.setAlpha(this.mAniView, 1.0f);
            return ViewCompat.animate(this.mAniView).translationX(0.0f).translationY(0.0f);
        }
        i2 = max;
        i = 0;
        ViewCompat.setTranslationX(this.mAniView, (float) i2);
        ViewCompat.setTranslationY(this.mAniView, (float) i);
        ViewCompat.setAlpha(this.mAniView, 1.0f);
        return ViewCompat.animate(this.mAniView).translationX(0.0f).translationY(0.0f);
    }
}
