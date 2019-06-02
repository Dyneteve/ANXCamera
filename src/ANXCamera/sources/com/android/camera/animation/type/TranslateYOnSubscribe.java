package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class TranslateYOnSubscribe extends BaseOnSubScribe {
    private int mDistanceY;

    public TranslateYOnSubscribe(View view, int i) {
        super(view);
        this.mDistanceY = i;
    }

    public static void directSetResult(View view, int i) {
        setAnimateViewVisible(view, 0);
        ViewCompat.setTranslationY(view, (float) i);
    }

    /* access modifiers changed from: protected */
    public ViewPropertyAnimatorCompat getAnimation() {
        setAnimateViewVisible(this.mAniView, 0);
        return ViewCompat.animate(this.mAniView).translationY((float) this.mDistanceY);
    }
}
