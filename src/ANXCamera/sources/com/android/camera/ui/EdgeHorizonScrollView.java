package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Shader.TileMode;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.HorizontalScrollView;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ModeChangeController;

public class EdgeHorizonScrollView extends HorizontalScrollView {
    private float mDownX = -1.0f;
    private Paint mEdgePaint;
    private int mEdgeWidth;
    private boolean mIsRTL;
    private boolean mScrolled = false;

    public EdgeHorizonScrollView(Context context) {
        super(context);
        initView();
    }

    public EdgeHorizonScrollView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    public EdgeHorizonScrollView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initView();
    }

    /* access modifiers changed from: protected */
    public boolean drawChild(Canvas canvas, View view, long j) {
        Canvas canvas2 = canvas;
        int width = getWidth();
        int height = getHeight();
        float f = (float) height;
        int saveLayer = canvas2.saveLayer(0.0f, 0.0f, (float) Math.max(width, view.getWidth()), f, null, 31);
        boolean drawChild = super.drawChild(canvas, view, j);
        canvas2.translate(this.mIsRTL ? (float) Math.max(0, view.getWidth() - width) : 0.0f, 0.0f);
        float f2 = (float) width;
        float f3 = f2 / 2.0f;
        float f4 = f / 2.0f;
        float f5 = ((float) (height - width)) / 2.0f;
        int save = canvas.save();
        canvas2.rotate(90.0f, f3, f4);
        canvas2.translate(0.0f, f5);
        float f6 = 0.0f - f5;
        float f7 = f2 + f5;
        canvas2.drawRect(f6, 0.0f, f7, (float) this.mEdgeWidth, this.mEdgePaint);
        canvas2.restoreToCount(save);
        int save2 = canvas.save();
        canvas2.rotate(-90.0f, f3, f4);
        canvas2.translate(0.0f, f5);
        canvas2.drawRect(f6, 0.0f, f7, (float) this.mEdgeWidth, this.mEdgePaint);
        canvas2.restoreToCount(save2);
        canvas2.restoreToCount(saveLayer);
        return drawChild;
    }

    public void initView() {
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mEdgeWidth = getResources().getDimensionPixelSize(R.dimen.mode_select_layout_edge);
        this.mEdgePaint = new Paint();
        this.mEdgePaint.setAntiAlias(true);
        this.mEdgePaint.setStyle(Style.FILL);
        this.mEdgePaint.setXfermode(new PorterDuffXfermode(Mode.DST_OUT));
        Paint paint = this.mEdgePaint;
        LinearGradient linearGradient = new LinearGradient(0.0f, 0.0f, 0.0f, (float) this.mEdgeWidth, new int[]{ViewCompat.MEASURED_STATE_MASK, -1728053248, 0}, new float[]{0.0f, 0.3f, 2.0f}, TileMode.CLAMP);
        paint.setShader(linearGradient);
        setFocusable(false);
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        switch (motionEvent.getAction()) {
            case 0:
                this.mDownX = motionEvent.getX();
                this.mScrolled = false;
                return true;
            case 1:
            case 3:
                this.mDownX = -1.0f;
                this.mScrolled = false;
                break;
            case 2:
                if (this.mDownX == -1.0f) {
                    this.mDownX = motionEvent.getX();
                }
                float x = motionEvent.getX() - this.mDownX;
                ModeChangeController modeChangeController = (ModeChangeController) ModeCoordinatorImpl.getInstance().getAttachProtocol(179);
                if (!this.mScrolled && modeChangeController != null) {
                    if (x > ((float) Util.dpToPixel(17.0f)) && modeChangeController.canSwipeChangeMode()) {
                        modeChangeController.changeModeByGravity(3, 0);
                        this.mScrolled = true;
                    } else if (x < ((float) (-Util.dpToPixel(17.0f))) && modeChangeController.canSwipeChangeMode()) {
                        modeChangeController.changeModeByGravity(5, 0);
                        this.mScrolled = true;
                    }
                }
                return true;
        }
        return false;
    }
}
