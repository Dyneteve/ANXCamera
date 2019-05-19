package com.android.camera.animation;

import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.provider.MiuiSettings.ScreenEffect;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.util.SparseArray;
import android.view.View;
import android.view.animation.LinearInterpolator;
import com.android.camera.animation.AnimationDelegate.AnimationResource;
import com.android.camera.data.DataRepository;
import com.android.camera.module.loader.StartControl;
import com.ss.android.vesdk.VEResult;
import io.reactivex.Completable;
import io.reactivex.CompletableSource;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import java.util.ArrayList;

public class AnimationComposite implements Consumer<Integer> {
    private Disposable mAfterFrameArrivedDisposable = Observable.create(new ObservableOnSubscribe<Integer>() {
        public void subscribe(ObservableEmitter<Integer> observableEmitter) throws Exception {
            AnimationComposite.this.mAfterFrameArrivedEmitter = observableEmitter;
        }
    }).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) this);
    /* access modifiers changed from: private */
    public ObservableEmitter<Integer> mAfterFrameArrivedEmitter;
    private Disposable mAnimationDisposable;
    /* access modifiers changed from: private */
    public int mCurrentDegree = 0;
    private int mOrientation = -1;
    private SparseArray<AnimationResource> mResourceSparseArray = new SparseArray<>();
    private ValueAnimator mRotationAnimator;
    private int mStartDegree = 0;
    private int mTargetDegree = 0;

    public void accept(@NonNull Integer num) throws Exception {
        DataRepository.dataItemGlobal().setRetriedIfCameraError(false);
        for (int i = 0; i < this.mResourceSparseArray.size(); i++) {
            AnimationResource animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i);
            if (animationResource.canProvide()) {
                if (!animationResource.isEnableClick()) {
                    animationResource.setClickEnable(true);
                }
                animationResource.notifyAfterFrameAvailable(num.intValue());
            }
        }
    }

    public void destroy() {
        if (this.mResourceSparseArray != null) {
            this.mResourceSparseArray.clear();
            this.mResourceSparseArray = null;
        }
        if (this.mAfterFrameArrivedDisposable != null && !this.mAfterFrameArrivedDisposable.isDisposed()) {
            this.mAfterFrameArrivedEmitter.onComplete();
            this.mAfterFrameArrivedDisposable.dispose();
            this.mAfterFrameArrivedDisposable = null;
        }
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public Disposable dispose(@Nullable Completable completable, @Nullable Action action, StartControl startControl) {
        int i;
        ArrayList arrayList = new ArrayList();
        if (completable != null) {
            arrayList.add(completable);
        }
        int i2 = startControl.mTargetMode;
        int i3 = startControl.mResetType;
        int i4 = 0;
        switch (startControl.mViewConfigType) {
            case 1:
                while (i4 < this.mResourceSparseArray.size()) {
                    AnimationResource animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i4);
                    if (animationResource.canProvide()) {
                        animationResource.provideAnimateElement(i2, null, i3);
                    }
                    i4++;
                }
                break;
            case 2:
                while (i < this.mResourceSparseArray.size()) {
                    AnimationResource animationResource2 = (AnimationResource) this.mResourceSparseArray.valueAt(i);
                    if (animationResource2.canProvide()) {
                        animationResource2.provideAnimateElement(i2, arrayList, i3);
                    }
                    i++;
                }
                break;
            case 3:
                while (i4 < this.mResourceSparseArray.size()) {
                    AnimationResource animationResource3 = (AnimationResource) this.mResourceSparseArray.valueAt(i4);
                    if (animationResource3.canProvide() && animationResource3.needViewClear()) {
                        animationResource3.provideAnimateElement(i2, null, i3);
                    }
                    i4++;
                }
                break;
        }
        if (this.mAnimationDisposable != null && !this.mAnimationDisposable.isDisposed()) {
            this.mAnimationDisposable.dispose();
        }
        if (action != null) {
            this.mAnimationDisposable = Completable.merge((Iterable<? extends CompletableSource>) arrayList).subscribe(action);
        } else {
            this.mAnimationDisposable = Completable.merge((Iterable<? extends CompletableSource>) arrayList).subscribe();
        }
        return this.mAnimationDisposable;
    }

    public void disposeRotation(int i) {
        int i2;
        int i3 = ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        int i4 = i >= 0 ? i % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT : (i % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
        if (this.mOrientation != i4) {
            boolean z = this.mOrientation != -1;
            int i5 = i4 - this.mOrientation;
            if (i5 < 0) {
                i5 += ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
            }
            if (i5 > 180) {
                i5 += VEResult.TER_EGL_BAD_MATCH;
            }
            boolean z2 = i5 <= 0;
            this.mOrientation = i4;
            if (this.mOrientation != 0 || this.mCurrentDegree != 0) {
                this.mTargetDegree = (360 - i4) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
                final ArrayList<View> arrayList = new ArrayList<>();
                for (int i6 = 0; i6 < this.mResourceSparseArray.size(); i6++) {
                    AnimationResource animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i6);
                    if (animationResource.canProvide()) {
                        animationResource.provideRotateItem(arrayList, this.mTargetDegree);
                    }
                }
                if (!z) {
                    this.mCurrentDegree = this.mTargetDegree;
                    for (View rotation : arrayList) {
                        ViewCompat.setRotation(rotation, (float) this.mTargetDegree);
                    }
                    return;
                }
                if (this.mRotationAnimator != null) {
                    this.mRotationAnimator.cancel();
                }
                this.mStartDegree = this.mCurrentDegree;
                if (z2) {
                    i2 = this.mStartDegree == 360 ? 0 : this.mStartDegree;
                    if (this.mTargetDegree != 0) {
                        i3 = this.mTargetDegree;
                    }
                } else {
                    i2 = this.mStartDegree == 0 ? 360 : this.mStartDegree;
                    i3 = this.mTargetDegree == 360 ? 0 : this.mTargetDegree;
                }
                this.mRotationAnimator = ValueAnimator.ofInt(new int[]{i2, i3});
                this.mRotationAnimator.setInterpolator(new LinearInterpolator());
                this.mRotationAnimator.removeAllUpdateListeners();
                this.mRotationAnimator.addUpdateListener(new AnimatorUpdateListener() {
                    public void onAnimationUpdate(ValueAnimator valueAnimator) {
                        AnimationComposite.this.mCurrentDegree = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                        for (View rotation : arrayList) {
                            ViewCompat.setRotation(rotation, (float) AnimationComposite.this.mCurrentDegree);
                        }
                    }
                });
                this.mRotationAnimator.start();
            }
        }
    }

    public void notifyAfterFirstFrameArrived(int i) {
        if (this.mAfterFrameArrivedDisposable != null && !this.mAfterFrameArrivedDisposable.isDisposed()) {
            this.mAfterFrameArrivedEmitter.onNext(Integer.valueOf(i));
        }
    }

    public void notifyDataChanged(int i, int i2) {
        for (int i3 = 0; i3 < this.mResourceSparseArray.size(); i3++) {
            AnimationResource animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i3);
            if (animationResource.canProvide()) {
                animationResource.notifyDataChanged(i, i2);
            }
        }
    }

    public void put(int i, AnimationResource animationResource) {
        this.mResourceSparseArray.put(i, animationResource);
    }

    public void remove(int i) {
        this.mResourceSparseArray.remove(i);
    }

    public void setClickEnable(boolean z) {
        for (int i = 0; i < this.mResourceSparseArray.size(); i++) {
            AnimationResource animationResource = (AnimationResource) this.mResourceSparseArray.valueAt(i);
            if (animationResource.canProvide() && animationResource.isEnableClick() != z) {
                animationResource.setClickEnable(z);
            }
        }
    }
}
