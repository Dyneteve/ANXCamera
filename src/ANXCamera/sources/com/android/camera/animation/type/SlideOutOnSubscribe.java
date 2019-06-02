package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class SlideOutOnSubscribe extends BaseOnSubScribe {
    private int mGravity;

    public SlideOutOnSubscribe(View view, int i) {
        super(view);
        this.mGravity = i;
    }

    public static void directSetResult(View view, int i) {
        int max = Math.max(view.getWidth(), view.getLayoutParams().width);
        int max2 = Math.max(view.getHeight(), view.getLayoutParams().height);
        int i2 = 0;
        if (i == 3) {
            max = -max;
        } else if (i != 5) {
            if (i == 48) {
                max2 = -max2;
            } else if (i != 80) {
                max2 = 0;
            }
            ViewCompat.setTranslationX(view, (float) i2);
            ViewCompat.setTranslationY(view, (float) max2);
            ViewCompat.setAlpha(view, 1.0f);
            setAnimateViewVisible(view, 4);
        }
        max2 = 0;
        i2 = max;
        ViewCompat.setTranslationX(view, (float) i2);
        ViewCompat.setTranslationY(view, (float) max2);
        ViewCompat.setAlpha(view, 1.0f);
        setAnimateViewVisible(view, 4);
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
            ViewCompat.setTranslationX(this.mAniView, 0.0f);
            ViewCompat.setTranslationY(this.mAniView, 0.0f);
            ViewCompat.setAlpha(this.mAniView, 1.0f);
            return ViewCompat.animate(this.mAniView).translationX((float) i2).translationY((float) i);
        }
        i2 = max;
        i = 0;
        ViewCompat.setTranslationX(this.mAniView, 0.0f);
        ViewCompat.setTranslationY(this.mAniView, 0.0f);
        ViewCompat.setAlpha(this.mAniView, 1.0f);
        return ViewCompat.animate(this.mAniView).translationX((float) i2).translationY((float) i);
    }

    /* access modifiers changed from: protected */
    public void onAnimationEnd() {
        super.onAnimationEnd();
        setAnimateViewVisible(this.mAniView, this.mTargetGone ? 8 : 4);
    }
}
