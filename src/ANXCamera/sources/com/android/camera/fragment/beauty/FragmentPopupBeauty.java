package com.android.camera.fragment.beauty;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.support.v4.view.ViewCompat;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.HandleBeautyRecording;
import io.reactivex.Completable;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;

@Deprecated
public class FragmentPopupBeauty extends BaseFragment implements OnClickListener, HandleBeautyRecording {
    public static final int FRAGMENT_INFO = 249;
    private View mIconBeauty;
    private View mIconSticker;

    private void disappear() {
        ObjectAnimator ofFloat = ObjectAnimator.ofFloat(this.mIconSticker, "alpha", new float[]{1.0f, 0.0f});
        ObjectAnimator ofFloat2 = ObjectAnimator.ofFloat(this.mIconBeauty, "alpha", new float[]{1.0f, 0.0f});
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(new Animator[]{ofFloat, ofFloat2});
        animatorSet.setInterpolator(new CubicEaseOutInterpolator());
        animatorSet.setDuration(400);
        animatorSet.start();
    }

    public int getFragmentInto() {
        return 249;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_popup_beauty;
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        this.mIconSticker = view.findViewById(R.id.icon_sticker);
        this.mIconBeauty = view.findViewById(R.id.icon_beauty);
        this.mIconSticker.setOnClickListener(this);
        this.mIconBeauty.setOnClickListener(this);
        provideAnimateElement(this.mCurrentMode, null, 2);
    }

    public void onAngleChanged(float f) {
    }

    public void onBeautyRecordingStart() {
        ViewCompat.animate(getView()).alpha(0.0f).start();
    }

    public void onBeautyRecordingStop() {
        ViewCompat.animate(getView()).alpha(1.0f).start();
    }

    public void onClick(View view) {
        if (isEnableClick()) {
            switch (view.getId()) {
                case R.id.icon_sticker /*2131558597*/:
                    BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
                    if (baseDelegate != null) {
                        baseDelegate.delegateEvent(4);
                        break;
                    } else {
                        return;
                    }
                case R.id.icon_beauty /*2131558598*/:
                    BaseDelegate baseDelegate2 = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
                    if (baseDelegate2 != null) {
                        baseDelegate2.delegateEvent(2);
                        break;
                    } else {
                        return;
                    }
            }
            AlphaOutOnSubscribe.directSetResult(getView());
        }
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        int i3 = (i == 163 || i == 165) ? 1 : -1;
        if (this.mIconSticker.getTag() == null || ((Integer) this.mIconSticker.getTag()).intValue() != i3) {
            this.mIconSticker.setTag(Integer.valueOf(i3));
            if (list == null) {
                if (i3 == 1) {
                    AlphaInOnSubscribe.directSetResult(this.mIconSticker);
                    AlphaInOnSubscribe.directSetResult(this.mIconBeauty);
                } else {
                    AlphaOutOnSubscribe.directSetResult(this.mIconSticker);
                    AlphaOutOnSubscribe.directSetResult(this.mIconBeauty);
                }
            } else if (i3 == 1) {
                list.add(Completable.create(new SlideInOnSubscribe(this.mIconSticker, 3)));
                list.add(Completable.create(new SlideInOnSubscribe(this.mIconBeauty, 5)));
            } else {
                list.add(Completable.create(new SlideOutOnSubscribe(this.mIconSticker, 3)));
                list.add(Completable.create(new SlideOutOnSubscribe(this.mIconBeauty, 5)));
            }
        }
    }

    /* access modifiers changed from: protected */
    public Animation provideEnterAnimation(int i) {
        if (i == 240) {
            return null;
        }
        return FragmentAnimationFactory.wrapperAnimation(161);
    }
}
