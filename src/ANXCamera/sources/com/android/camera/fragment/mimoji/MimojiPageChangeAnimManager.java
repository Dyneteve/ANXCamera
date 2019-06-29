package com.android.camera.fragment.mimoji;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.content.Context;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.TranslateAnimation;
import android.widget.LinearLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.ui.MimojiEditGLTextureView;

public class MimojiPageChangeAnimManager {
    private int MOVE_TOP_DISPLACEMENT_OF_EDIT_LAYOUT;
    private int MOVE_TOP_DISPLACEMENT_OF_GL;
    private int editTabHeight;
    private int heightEditLayout;
    private int heightEditParentLayout;
    private int heightSurfacePixelBuffer;
    private LayoutParams layoutParamsEditLayout;
    /* access modifiers changed from: private */
    public LayoutParams layoutParamsTextureView;
    private Context mContext;
    public int[] mLocationAllEditContent = new int[3];
    public int[] mLocationTextureView = new int[3];
    /* access modifiers changed from: private */
    public MimojiEditGLTextureView mMimojiEditGLTextureView;
    /* access modifiers changed from: private */
    public LinearLayout mRlAllEditContent;
    int navigationBackHeight;
    private Resources resources;
    private int screenHeight;
    private int screenWidth;
    private int widthSurfacePixel;
    int xCoordinateStartTexture;

    public int getNavigationBarHeight(Context context) {
        if (Util.checkDeviceHasNavigationBar(context)) {
            return Util.getNavigationBarHeight(context);
        }
        return 0;
    }

    public void initView(Context context, MimojiEditGLTextureView mimojiEditGLTextureView, LinearLayout linearLayout, int i) {
        this.mContext = context;
        this.mMimojiEditGLTextureView = mimojiEditGLTextureView;
        this.mRlAllEditContent = linearLayout;
        this.resources = this.mContext.getResources();
        WindowManager windowManager = (WindowManager) this.mContext.getSystemService("window");
        DisplayMetrics displayMetrics = new DisplayMetrics();
        windowManager.getDefaultDisplay().getMetrics(displayMetrics);
        this.screenWidth = displayMetrics.widthPixels;
        this.screenHeight = displayMetrics.heightPixels;
        this.widthSurfacePixel = this.resources.getDimensionPixelSize(R.dimen.mimoji_edit_surface_width);
        this.heightSurfacePixelBuffer = this.resources.getDimensionPixelSize(R.dimen.mimoji_edit_surface_buffer);
        this.editTabHeight = this.resources.getDimensionPixelSize(R.dimen.mimoji_edit_tab_height);
        this.heightEditParentLayout = this.screenHeight - this.navigationBackHeight;
        resetViewsCorridinate(i);
    }

    public void resetEditLayoutViewPosition() {
        if (this.mLocationAllEditContent[1] == 0 || this.layoutParamsEditLayout == null) {
            this.heightEditLayout = (this.screenHeight / 2) + this.editTabHeight + getNavigationBarHeight(this.mContext);
            this.mLocationAllEditContent[0] = 0;
            this.mLocationAllEditContent[1] = this.heightEditParentLayout - this.heightEditLayout;
            this.MOVE_TOP_DISPLACEMENT_OF_EDIT_LAYOUT = this.heightEditLayout;
            this.layoutParamsEditLayout = new LayoutParams(this.screenWidth, this.heightEditLayout);
        }
        this.layoutParamsEditLayout.leftMargin = this.mLocationAllEditContent[0];
        this.layoutParamsEditLayout.topMargin = this.mLocationAllEditContent[1];
        this.mRlAllEditContent.setLayoutParams(this.layoutParamsEditLayout);
    }

    public void resetLayoutPosition(int i) {
        resetEditLayoutViewPosition();
        resetTextureViewPosition(i);
    }

    public void resetTextureViewPosition(int i) {
        if (this.layoutParamsTextureView == null) {
            this.layoutParamsTextureView = new LayoutParams(this.widthSurfacePixel, this.widthSurfacePixel);
        }
        if (i == 1) {
            this.navigationBackHeight = this.resources.getDimensionPixelSize(R.dimen.mimoji_edit_back_height);
            this.resources.getDimensionPixelSize(R.dimen.mimoji_edit_back_top);
            this.xCoordinateStartTexture = (this.screenWidth / 2) - (this.widthSurfacePixel / 2);
            int i2 = this.xCoordinateStartTexture + this.heightSurfacePixelBuffer;
            this.mLocationTextureView[0] = this.xCoordinateStartTexture;
            this.mLocationTextureView[1] = i2;
        } else if (i == 4 || i == 2) {
            this.xCoordinateStartTexture = (this.screenWidth / 2) - (this.widthSurfacePixel / 2);
            this.mLocationTextureView[0] = this.xCoordinateStartTexture;
            this.mLocationTextureView[1] = 0;
        }
        updateTextureViewPosition();
    }

    public void resetViewsCorridinate(int i) {
        resetTextureViewPosition(i);
        resetEditLayoutViewPosition();
    }

    public void translateYEditLayout() {
        TranslateAnimation translateAnimation = new TranslateAnimation(1, 0.0f, 1, 0.0f, 1, 1.0f, 1, 0.0f);
        translateAnimation.setDuration(500);
        translateAnimation.setAnimationListener(new AnimationListener() {
            public void onAnimationEnd(Animation animation) {
            }

            public void onAnimationRepeat(Animation animation) {
            }

            public void onAnimationStart(Animation animation) {
                MimojiPageChangeAnimManager.this.mRlAllEditContent.setVisibility(0);
            }
        });
        this.mRlAllEditContent.startAnimation(translateAnimation);
    }

    public void translateYTextureView() {
        final ValueAnimator ofFloat = ValueAnimator.ofFloat(new float[]{(float) this.mLocationTextureView[1], 0.0f});
        ofFloat.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                MimojiPageChangeAnimManager.this.layoutParamsTextureView.topMargin = (int) ((Float) ofFloat.getAnimatedValue()).floatValue();
                MimojiPageChangeAnimManager.this.mMimojiEditGLTextureView.setLayoutParams(MimojiPageChangeAnimManager.this.layoutParamsTextureView);
            }
        });
        ofFloat.addListener(new AnimatorListener() {
            public void onAnimationCancel(Animator animator) {
            }

            public void onAnimationEnd(Animator animator) {
                MimojiPageChangeAnimManager.this.mLocationTextureView[1] = 0;
                MimojiPageChangeAnimManager.this.layoutParamsTextureView.topMargin = MimojiPageChangeAnimManager.this.mLocationTextureView[1];
                MimojiPageChangeAnimManager.this.mMimojiEditGLTextureView.setLayoutParams(MimojiPageChangeAnimManager.this.layoutParamsTextureView);
            }

            public void onAnimationRepeat(Animator animator) {
            }

            public void onAnimationStart(Animator animator) {
            }
        });
        ofFloat.setDuration(500);
        ofFloat.start();
    }

    public void updateEditLayoutViewPosition() {
        this.layoutParamsEditLayout.leftMargin = this.mLocationAllEditContent[0];
        this.layoutParamsEditLayout.topMargin = this.mLocationAllEditContent[1];
        this.mRlAllEditContent.setLayoutParams(this.layoutParamsEditLayout);
    }

    public void updateLayoutPosition() {
        updateTextureViewPosition();
        updateEditLayoutViewPosition();
    }

    public void updateOperateState(int i) {
        switch (i) {
            case 2:
                translateYTextureView();
                translateYEditLayout();
                return;
            default:
                return;
        }
    }

    public void updateTextureViewPosition() {
        this.layoutParamsTextureView.leftMargin = this.mLocationTextureView[0];
        this.layoutParamsTextureView.topMargin = this.mLocationTextureView[1];
        this.mMimojiEditGLTextureView.setLayoutParams(this.layoutParamsTextureView);
    }
}
