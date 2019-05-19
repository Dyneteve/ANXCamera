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
import android.util.AttributeSet;
import android.view.View;
import android.widget.HorizontalScrollView;
import com.android.camera.R;
import com.android.camera.Util;

public class MimojiTypeHorizonScrollView extends HorizontalScrollView {
    private boolean mIsRTL;
    private Paint mPaint;
    private int mWidth;

    public MimojiTypeHorizonScrollView(Context context) {
        super(context);
        initView();
    }

    public MimojiTypeHorizonScrollView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        initView();
    }

    public MimojiTypeHorizonScrollView(Context context, @Nullable AttributeSet attributeSet, int i) {
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
        canvas2.translate((float) computeHorizontalScrollOffset(), 0.0f);
        float f2 = (float) width;
        float f3 = f2 / 2.0f;
        float f4 = f / 2.0f;
        float f5 = ((float) (height - width)) / 2.0f;
        int save = canvas.save();
        canvas2.rotate(90.0f, f3, f4);
        canvas2.translate(0.0f, f5);
        float f6 = 0.0f - f5;
        float f7 = f2 + f5;
        canvas2.drawRect(f6, 0.0f, f7, (float) this.mWidth, this.mPaint);
        canvas2.restoreToCount(save);
        int save2 = canvas.save();
        canvas2.rotate(-90.0f, f3, f4);
        canvas2.translate(0.0f, f5);
        canvas2.drawRect(f6, 0.0f, f7, (float) this.mWidth, this.mPaint);
        canvas2.restoreToCount(save2);
        canvas2.restoreToCount(saveLayer);
        return drawChild;
    }

    public void initView() {
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mWidth = getResources().getDimensionPixelSize(R.dimen.mode_select_layout_edge);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStyle(Style.FILL);
        this.mPaint.setXfermode(new PorterDuffXfermode(Mode.DST_OUT));
        Paint paint = this.mPaint;
        LinearGradient linearGradient = new LinearGradient(0.0f, 0.0f, 0.0f, (float) this.mWidth, new int[]{-16777216, -939524096, 0}, new float[]{0.0f, 0.2f, 1.0f}, TileMode.CLAMP);
        paint.setShader(linearGradient);
        setFocusable(false);
    }
}
