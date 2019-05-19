package com.android.camera.animation.type;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.view.View;

public class TranslateXOnSubscribe extends BaseOnSubScribe {
    private int mDistanceX;

    public TranslateXOnSubscribe(View view, int i) {
        super(view);
        this.mDistanceX = i;
    }

    public static void directSetResult(View view, int i) {
        setAnimateViewVisible(view, 0);
        ViewCompat.setTranslationX(view, (float) i);
    }

    /* access modifiers changed from: protected */
    public ViewPropertyAnimatorCompat getAnimation() {
        setAnimateViewVisible(this.mAniView, 0);
        return ViewCompat.animate(this.mAniView).translationX((float) this.mDistanceX);
    }
}
