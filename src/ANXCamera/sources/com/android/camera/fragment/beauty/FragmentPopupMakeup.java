package com.android.camera.fragment.beauty;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.widget.SeekBar;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraModuleSpecial;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.ui.SeekBarCompat;
import com.android.camera.ui.SeekBarCompat.OnSeekBarCompatChangeListener;
import com.android.camera.ui.SeekBarCompat.OnSeekBarCompatTouchListener;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Completable;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.schedulers.Schedulers;
import java.util.List;

@Deprecated
public class FragmentPopupMakeup extends BaseFragment implements MakeupProtocol, Consumer<Integer> {
    public static final int FRAGMENT_INFO = 252;
    private static final int INTERVAL = 5;
    /* access modifiers changed from: private */
    public static int SEEKBAR_PROGRESS_MAX = 100;
    private static final int SEEKBAR_PROGRESS_RATIO = 1;
    /* access modifiers changed from: private */
    public int mActiveProgress;
    private Disposable mDisposable;
    /* access modifiers changed from: private */
    public FlowableEmitter<Integer> mFlowableEmitter;
    /* access modifiers changed from: private */
    public boolean mIsRTL;
    private boolean mIsShow;
    private View mRootView;
    /* access modifiers changed from: private */
    public SeekBarCompat mSeekBar;
    private BeautyModeSettingBusiness modeSettingBusiness;

    /* access modifiers changed from: private */
    public int centerSeekbarValueMap(int i) {
        return i + (SEEKBAR_PROGRESS_MAX / 2);
    }

    public void accept(@NonNull Integer num) throws Exception {
    }

    public int getFragmentInto() {
        return 252;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_popup_makeup;
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mRootView = view;
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources()) + getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height);
        view.setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
            }
        });
        this.mDisposable = Flowable.create(new FlowableOnSubscribe<Integer>() {
            public void subscribe(FlowableEmitter<Integer> flowableEmitter) throws Exception {
                FragmentPopupMakeup.this.mFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).observeOn(Schedulers.computation()).onBackpressureDrop(new Consumer<Integer>() {
            public void accept(@NonNull Integer num) throws Exception {
                String str = Log.VIEW_TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("seekbar change too fast :");
                sb.append(num.toString());
                Log.e(str, sb.toString());
            }
        }).subscribe((Consumer<? super T>) this);
        this.modeSettingBusiness = new BeautyModeSettingBusiness();
        this.mSeekBar = (SeekBarCompat) view.findViewById(R.id.makeup_params_level);
        this.mSeekBar.setProgressDrawable(getResources().getDrawable(R.drawable.seekbar_style));
        this.mSeekBar.setOnSeekBarChangeListener(new OnSeekBarCompatChangeListener() {
            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                if (i == 0 || i == FragmentPopupMakeup.SEEKBAR_PROGRESS_MAX || Math.abs(i - FragmentPopupMakeup.this.mActiveProgress) > 5) {
                    FragmentPopupMakeup.this.mActiveProgress = i;
                    FragmentPopupMakeup.this.mFlowableEmitter.onNext(Integer.valueOf(i / 1));
                }
            }

            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        this.mSeekBar.setOnSeekBarCompatTouchListener(new OnSeekBarCompatTouchListener() {
            private int getNextProgress(MotionEvent motionEvent) {
                int width = FragmentPopupMakeup.this.mSeekBar.getWidth();
                int x = (int) (((FragmentPopupMakeup.this.mIsRTL ? ((float) width) - motionEvent.getX() : motionEvent.getX()) / ((float) width)) * ((float) FragmentPopupMakeup.SEEKBAR_PROGRESS_MAX));
                if (!FragmentPopupMakeup.this.mSeekBar.isCenterTwoWayMode()) {
                    return Util.clamp(x, 0, FragmentPopupMakeup.SEEKBAR_PROGRESS_MAX);
                }
                if (motionEvent.getAction() == 2 || motionEvent.getAction() == 1) {
                    if (x >= FragmentPopupMakeup.this.centerSeekbarValueMap(-5) && x <= FragmentPopupMakeup.this.centerSeekbarValueMap(5) && x != FragmentPopupMakeup.this.centerSeekbarValueMap(0)) {
                        x = FragmentPopupMakeup.this.centerSeekbarValueMap(0);
                    } else if (x <= FragmentPopupMakeup.this.centerSeekbarValueMap(-95) && x != FragmentPopupMakeup.this.centerSeekbarValueMap(-100)) {
                        x = FragmentPopupMakeup.this.centerSeekbarValueMap(-100);
                    } else if (x >= FragmentPopupMakeup.this.centerSeekbarValueMap(95) && x != FragmentPopupMakeup.this.centerSeekbarValueMap(100)) {
                        x = FragmentPopupMakeup.this.centerSeekbarValueMap(100);
                    }
                }
                return Util.clamp(x, 0, FragmentPopupMakeup.SEEKBAR_PROGRESS_MAX) - (FragmentPopupMakeup.SEEKBAR_PROGRESS_MAX / 2);
            }

            public boolean onTouch(View view, MotionEvent motionEvent) {
                switch (motionEvent.getAction()) {
                    case 0:
                        if (!FragmentPopupMakeup.this.mSeekBar.getThumb().getBounds().contains((int) motionEvent.getX(), (int) motionEvent.getY())) {
                            return true;
                        }
                        break;
                    case 1:
                    case 2:
                        break;
                    default:
                        return false;
                }
                FragmentPopupMakeup.this.mSeekBar.setProgress(getNextProgress(motionEvent));
                return true;
            }
        });
    }

    public boolean isSeekBarVisible() {
        return false;
    }

    public void onDestroyView() {
        super.onDestroyView();
        if (this.mCurrentMode == 163) {
            MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
            CameraModuleSpecial cameraModuleSpecial = (CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195);
            if (cameraModuleSpecial != null) {
                cameraModuleSpecial.showOrHideChip(miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow());
            }
        }
    }

    public void onMakeupItemSelected(String str, boolean z) {
        BeautyConstant.isSupportTwoWayAdjustable(str);
        if (str == "pref_eye_light_type_key") {
            this.mRootView.setVisibility(8);
        } else {
            this.mRootView.setVisibility(0);
        }
    }

    public void onViewCreated(View view, @Nullable Bundle bundle) {
        super.onViewCreated(view, bundle);
        if (this.mCurrentMode == 163) {
            CameraModuleSpecial cameraModuleSpecial = (CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195);
            if (cameraModuleSpecial != null) {
                cameraModuleSpecial.showOrHideChip(false);
            }
        }
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        int i3 = (i == 163 || i == 165) ? 1 : -1;
        if (getView().getTag() == null || ((Integer) getView().getTag()).intValue() != i3) {
            getView().setTag(Integer.valueOf(i3));
            MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
            if (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) {
                i3 = -1;
            }
            if (i3 == 1) {
                if (getView().getVisibility() != 0) {
                    getView().setVisibility(0);
                }
                if (list == null) {
                    SlideInOnSubscribe.directSetResult(this.mSeekBar, 80);
                } else {
                    list.add(Completable.create(new SlideInOnSubscribe(this.mSeekBar, 80)));
                }
            } else if (list == null) {
                SlideOutOnSubscribe.directSetResult(this.mSeekBar, 80);
            } else {
                list.add(Completable.create(new SlideOutOnSubscribe(this.mSeekBar, 80)));
            }
        }
    }

    /* access modifiers changed from: protected */
    public Animation provideEnterAnimation(int i) {
        return FragmentAnimationFactory.wrapperAnimation(161);
    }

    /* access modifiers changed from: protected */
    public Animation provideExitAnimation() {
        return FragmentAnimationFactory.wrapperAnimation(162);
    }

    /* access modifiers changed from: protected */
    public void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(180, this);
        this.mIsShow = true;
    }

    public void setSeekBarMode(int i) {
        boolean z = false;
        switch (i) {
            case 1:
                SEEKBAR_PROGRESS_MAX = 100;
                this.mSeekBar.setProgressDrawable(getResources().getDrawable(R.drawable.seekbar_style));
                break;
            case 2:
                SEEKBAR_PROGRESS_MAX = 200;
                z = true;
                this.mSeekBar.setProgressDrawable(getResources().getDrawable(R.drawable.center_seekbar_style));
                break;
        }
        this.mSeekBar.setMax(SEEKBAR_PROGRESS_MAX);
        this.mSeekBar.setCenterTwoWayMode(z);
    }

    /* access modifiers changed from: protected */
    public void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(180, this);
        if (this.mDisposable != null && !this.mDisposable.isDisposed()) {
            this.mDisposable.dispose();
        }
        this.mIsShow = false;
    }
}
