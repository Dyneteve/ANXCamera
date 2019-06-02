package com.android.camera.fragment.bottom;

import android.content.Context;
import android.util.SparseArray;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.LinearLayout;
import com.android.camera.fragment.beauty.MenuItem;
import com.android.camera.ui.ColorActivateTextView;

public abstract class AbBottomMenu {
    private static final int CLICK_INTERVAL = 300;
    protected BeautyMenuAnimator mBeautyMenuAnimator;
    protected LinearLayout mContainerView;
    protected Context mContext;
    protected ColorActivateTextView mCurrentBeautyTextView;
    private long mLastClickTime;

    public AbBottomMenu(Context context, LinearLayout linearLayout, BeautyMenuAnimator beautyMenuAnimator) {
        this.mContext = context;
        this.mContainerView = linearLayout;
        this.mBeautyMenuAnimator = beautyMenuAnimator;
    }

    public abstract void addAllView();

    public abstract SparseArray<ColorActivateTextView> getChildMenuViewList();

    public abstract int getDefaultType();

    public abstract SparseArray<MenuItem> getMenuData();

    /* access modifiers changed from: protected */
    public void hideAdvance() {
        this.mContainerView.getViewTreeObserver().addOnGlobalLayoutListener(new OnGlobalLayoutListener() {
            public void onGlobalLayout() {
                if (AbBottomMenu.this.mBeautyMenuAnimator != null) {
                    AbBottomMenu.this.mBeautyMenuAnimator.shrinkImmediately();
                    AbBottomMenu.this.mContainerView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                }
            }
        });
    }

    /* access modifiers changed from: protected */
    public boolean isClickEnable() {
        long currentTimeMillis = System.currentTimeMillis();
        if (currentTimeMillis - this.mLastClickTime < 300) {
            return false;
        }
        this.mLastClickTime = currentTimeMillis;
        return true;
    }

    public abstract boolean isRefreshUI();

    /* access modifiers changed from: 0000 */
    public void selectBeautyType(int i) {
        if (this.mCurrentBeautyTextView != null) {
            this.mCurrentBeautyTextView.setActivated(false);
        }
        SparseArray childMenuViewList = getChildMenuViewList();
        if (childMenuViewList != null) {
            ColorActivateTextView colorActivateTextView = (ColorActivateTextView) childMenuViewList.get(i);
            if (colorActivateTextView != null) {
                colorActivateTextView.setActivated(true);
                this.mCurrentBeautyTextView = colorActivateTextView;
            }
        }
    }

    public abstract void switchMenu();
}
