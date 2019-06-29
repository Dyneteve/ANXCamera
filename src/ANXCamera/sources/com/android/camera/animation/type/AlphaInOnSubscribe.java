package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class AlphaInOnSubscribe extends BaseOnSubScribe {
    public AlphaInOnSubscribe(View view) {
        super(view);
    }

    public static void directSetResult(View view) {
        ViewCompat.setAlpha(view, 1.0f);
        setAnimateViewVisible(view, 0);
    }

    /* access modifiers changed from: protected */
    public ViewPropertyAnimatorCompat getAnimation() {
        setAnimateViewVisible(this.mAniView, 0);
        ViewCompat.setAlpha(this.mAniView, 0.0f);
        return ViewCompat.animate(this.mAniView).alpha(1.0f);
    }
}
