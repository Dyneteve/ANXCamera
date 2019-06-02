package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class AlphaOutOnSubscribe extends BaseOnSubScribe {
    public AlphaOutOnSubscribe(View view) {
        super(view);
    }

    public static void directSetResult(View view) {
        setAnimateViewVisible(view, 4);
    }

    /* access modifiers changed from: protected */
    public ViewPropertyAnimatorCompat getAnimation() {
        setAnimateViewVisible(this.mAniView, 0);
        ViewCompat.setAlpha(this.mAniView, 1.0f);
        return ViewCompat.animate(this.mAniView).alpha(0.0f);
    }

    /* access modifiers changed from: protected */
    public void onAnimationEnd() {
        super.onAnimationEnd();
        setAnimateViewVisible(this.mAniView, this.mTargetGone ? 8 : 4);
    }
}
