package com.android.camera.fragment.beauty;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SeekBar;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.fragment.beauty.SingleCheckAdapter.LevelItem;
import com.android.camera.ui.SeekBarCompat;
import com.android.camera.ui.SeekBarCompat.OnSeekBarCompatChangeListener;
import com.android.camera.ui.SeekBarCompat.OnSeekBarCompatTouchListener;
import com.oneplus.camera.R;
import java.util.List;

public class BeautySmoothLevelFragment extends BaseBeautyFragment {
    private static final int INTERVAL = 5;
    /* access modifiers changed from: private */
    public SeekBarCompat mAdjustSeekBar;
    /* access modifiers changed from: private */
    public boolean mIsRTL;
    /* access modifiers changed from: private */
    public int mSeekBarMaxProgress = 100;

    private void initView(View view) {
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mAdjustSeekBar = (SeekBarCompat) view.findViewById(R.id.beauty_level_adjust_seekbar);
        initBeautyItems();
        this.mSeekBarMaxProgress = 100;
        String str = "pref_beautify_skin_smooth_ratio_key";
        int faceBeautyRatio = CameraSettings.getFaceBeautyRatio(str);
        int defaultValueByKey = BeautyConstant.getDefaultValueByKey(str);
        this.mAdjustSeekBar.setProgressDrawable(getResources().getDrawable(R.drawable.seekbar_style));
        this.mAdjustSeekBar.setMax(this.mSeekBarMaxProgress);
        this.mAdjustSeekBar.setSeekBarPinProgress(defaultValueByKey);
        this.mAdjustSeekBar.setProgress(faceBeautyRatio);
        this.mAdjustSeekBar.setOnSeekBarChangeListener(new OnSeekBarCompatChangeListener() {
            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                BeautySmoothLevelFragment.this.onLevelSelected(i);
            }

            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        this.mAdjustSeekBar.setOnSeekBarCompatTouchListener(new OnSeekBarCompatTouchListener() {
            private int getNextProgress(MotionEvent motionEvent) {
                int width = BeautySmoothLevelFragment.this.mAdjustSeekBar.getWidth();
                int x = (int) (((BeautySmoothLevelFragment.this.mIsRTL ? ((float) width) - motionEvent.getX() : motionEvent.getX()) / ((float) width)) * ((float) BeautySmoothLevelFragment.this.mSeekBarMaxProgress));
                int pinProgress = BeautySmoothLevelFragment.this.mAdjustSeekBar.getPinProgress();
                if (pinProgress > 0 && (motionEvent.getAction() == 2 || motionEvent.getAction() == 1)) {
                    if (Math.abs(x + 0) <= 5) {
                        x = 0;
                    } else if (Math.abs(x - pinProgress) <= 5) {
                        x = pinProgress;
                    } else if (Math.abs(x - BeautySmoothLevelFragment.this.mSeekBarMaxProgress) <= 5) {
                        x = BeautySmoothLevelFragment.this.mSeekBarMaxProgress;
                    }
                }
                return BeautySmoothLevelFragment.this.mAdjustSeekBar.isCenterTwoWayMode() ? Util.clamp(x - pinProgress, 0 - pinProgress, BeautySmoothLevelFragment.this.mSeekBarMaxProgress - pinProgress) : Util.clamp(x, 0, BeautySmoothLevelFragment.this.mSeekBarMaxProgress);
            }

            public boolean onTouch(View view, MotionEvent motionEvent) {
                switch (motionEvent.getAction()) {
                    case 0:
                        if (!BeautySmoothLevelFragment.this.mAdjustSeekBar.getThumb().getBounds().contains((int) motionEvent.getX(), (int) motionEvent.getY())) {
                            return true;
                        }
                        break;
                    case 1:
                    case 2:
                        break;
                    default:
                        return false;
                }
                BeautySmoothLevelFragment.this.mAdjustSeekBar.setProgress(getNextProgress(motionEvent));
                return true;
            }
        });
    }

    /* access modifiers changed from: private */
    public void onLevelSelected(int i) {
        CameraSettings.setFaceBeautyRatio("pref_beautify_skin_smooth_ratio_key", i);
        BeautyHelper.onBeautyChanged();
    }

    /* access modifiers changed from: protected */
    public int beautyLevelToPosition(int i, int i2) {
        return Util.clamp(i, 0, i2);
    }

    /* access modifiers changed from: protected */
    public View getAnimateView() {
        return this.mAdjustSeekBar;
    }

    /* access modifiers changed from: protected */
    public List<LevelItem> initBeautyItems() {
        return null;
    }

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_beauty_smooth, viewGroup, false);
        initView(inflate);
        return inflate;
    }

    /* access modifiers changed from: protected */
    public void onViewCreatedAndJumpOut() {
        super.onViewCreatedAndJumpOut();
        this.mAdjustSeekBar.setEnabled(false);
    }

    /* access modifiers changed from: protected */
    public void onViewCreatedAndVisibleToUser(boolean z) {
        super.onViewCreatedAndVisibleToUser(z);
        this.mAdjustSeekBar.setEnabled(true);
    }

    /* access modifiers changed from: protected */
    public int provideItemHorizontalMargin() {
        return getResources().getDimensionPixelSize(R.dimen.beautycamera_beauty_level_item_margin);
    }

    public void setEnableClick(boolean z) {
        this.mAdjustSeekBar.setEnabled(z);
    }
}
