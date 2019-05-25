package com.android.camera.watermark;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.graphics.Paint.FontMetricsInt;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public abstract class BaseWaterMarkDrawable {
    private static final String TAG = BaseWaterMarkDrawable.class.getSimpleName();
    protected final Context mContext = CameraAppImpl.getAndroidContext();
    private int mCorrection;
    private Paint mFaceInfoNumberPaint;
    private Paint mFaceInfoTextPaint;
    protected int mFacePopupBottom;
    private int mGap;
    private int mHeight;
    private int mOrientation;
    protected int mPopBottomMargin;
    private Pattern mSplitFaceInfoPattern;
    protected int mVerPadding;
    private Bitmap mWaterMarkBitmap;
    private WaterMarkData mWaterMarkData;
    protected List<WaterMarkData> mWaterMarkInfos;
    private int mWidth;

    public BaseWaterMarkDrawable(List<WaterMarkData> list) {
        this.mWaterMarkInfos = list;
        if (this.mWaterMarkInfos != null && !this.mWaterMarkInfos.isEmpty()) {
            this.mWidth = ((WaterMarkData) this.mWaterMarkInfos.get(0)).getFaceViewWidth();
            this.mHeight = ((WaterMarkData) this.mWaterMarkInfos.get(0)).getFaceViewHeight();
            this.mOrientation = ((WaterMarkData) this.mWaterMarkInfos.get(0)).getOrientation();
        }
        this.mFaceInfoTextPaint = new Paint();
        this.mFaceInfoTextPaint.setAntiAlias(true);
        this.mFaceInfoTextPaint.setColor(-1);
        this.mFaceInfoTextPaint.setTextSize(CameraAppImpl.getAndroidContext().getResources().getDimension(R.dimen.face_info_magic_textSize));
        this.mFaceInfoTextPaint.setTextAlign(Align.CENTER);
        this.mFaceInfoTextPaint.setFakeBoldText(true);
        this.mGap = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.face_info_text_left_dis);
        this.mCorrection = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelOffset(R.dimen.face_info_correction);
        this.mFaceInfoNumberPaint = new Paint(this.mFaceInfoTextPaint);
        this.mSplitFaceInfoPattern = Pattern.compile("(\\D+)|(\\d+\\.?\\d*)");
        this.mVerPadding = this.mContext.getResources().getDimensionPixelSize(R.dimen.face_info_ver_padding);
        this.mGap = this.mContext.getResources().getDimensionPixelSize(R.dimen.face_info_text_left_dis);
        this.mCorrection = this.mContext.getResources().getDimensionPixelOffset(R.dimen.face_info_correction);
        this.mPopBottomMargin = this.mContext.getResources().getDimensionPixelSize(R.dimen.face_pop_bottom_margin);
        initBeforeDraw();
        draw();
    }

    private void draw() {
        if (this.mWaterMarkInfos != null && !this.mWaterMarkInfos.isEmpty()) {
            this.mWaterMarkData = new WaterMarkData();
            this.mWaterMarkData.setWatermarkType(((WaterMarkData) this.mWaterMarkInfos.get(0)).getWatermarkType());
            this.mWaterMarkBitmap = Bitmap.createBitmap(this.mWidth, this.mHeight, Config.ARGB_8888);
            onDraw(new Canvas(this.mWaterMarkBitmap));
        }
    }

    private void drawFaceInfoText(Canvas canvas, String str, int i, int i2) {
        float f;
        Matcher matcher = this.mSplitFaceInfoPattern.matcher(str);
        float f2 = (float) i;
        float f3 = (float) i2;
        while (matcher.find()) {
            String group = matcher.group();
            if (group.matches("\\d+\\.?\\d*")) {
                f = this.mFaceInfoNumberPaint.measureText(group);
                canvas.drawText(group, (f / 2.0f) + f2, f3, this.mFaceInfoNumberPaint);
            } else {
                f = this.mFaceInfoTextPaint.measureText(group);
                canvas.drawText(group, (f / 2.0f) + f2, f3, this.mFaceInfoTextPaint);
            }
            f2 += f;
        }
    }

    public Bitmap getBitmap() {
        return this.mWaterMarkBitmap;
    }

    public abstract Paint getFaceRectPaint(WaterMarkData waterMarkData);

    public abstract int getHonPadding(WaterMarkData waterMarkData);

    public abstract Drawable getTopBackgroundDrawable(WaterMarkData waterMarkData);

    public abstract Drawable getTopIndicatorDrawable(WaterMarkData waterMarkData);

    public WaterMarkData getWaterMarkData() {
        return this.mWaterMarkData;
    }

    public abstract void initBeforeDraw();

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        Canvas canvas2 = canvas;
        long currentTimeMillis = System.currentTimeMillis();
        Log.e(TAG, "start make water mark.");
        canvas.save();
        canvas2.rotate((float) (-this.mOrientation));
        Iterator it = new ArrayList(this.mWaterMarkInfos).iterator();
        while (it.hasNext()) {
            WaterMarkData waterMarkData = (WaterMarkData) it.next();
            canvas2.drawRoundRect(waterMarkData.getFaceRectF(), waterMarkData.getFaceRectF().width() * 0.015f, waterMarkData.getFaceRectF().height() * 0.015f, getFaceRectPaint(waterMarkData));
            Matcher matcher = this.mSplitFaceInfoPattern.matcher(waterMarkData.getInfo());
            float f = 0.0f;
            while (matcher.find()) {
                String group = matcher.group();
                f += group.matches("\\d+\\.?\\d*") ? this.mFaceInfoNumberPaint.measureText(group) : this.mFaceInfoTextPaint.measureText(group);
            }
            int honPadding = getHonPadding(waterMarkData);
            int intrinsicHeight = (int) ((((float) this.mVerPadding) * 3.6f) + ((float) getTopIndicatorDrawable(waterMarkData).getIntrinsicHeight()));
            int intrinsicWidth = ((int) ((((float) ((getTopIndicatorDrawable(waterMarkData).getIntrinsicWidth() + honPadding) + this.mGap)) + f) + ((float) honPadding))) / 2;
            Rect rect = new Rect(((int) waterMarkData.getFaceRectF().centerX()) - intrinsicWidth, ((((int) waterMarkData.getFaceRectF().top) - intrinsicHeight) - this.mPopBottomMargin) - this.mFacePopupBottom, ((int) waterMarkData.getFaceRectF().centerX()) + intrinsicWidth, ((int) waterMarkData.getFaceRectF().top) - this.mPopBottomMargin);
            if (getTopBackgroundDrawable(waterMarkData) != null) {
                getTopBackgroundDrawable(waterMarkData).setBounds(rect);
                getTopBackgroundDrawable(waterMarkData).draw(canvas2);
            }
            Bitmap createBitmap = Bitmap.createBitmap(rect.width(), rect.height(), Config.ARGB_8888);
            Canvas canvas3 = new Canvas(createBitmap);
            Rect rect2 = new Rect();
            Iterator it2 = it;
            rect2.set(honPadding, (int) ((((float) this.mVerPadding) * 1.8f) - ((float) this.mCorrection)), getTopIndicatorDrawable(waterMarkData).getIntrinsicWidth() + honPadding, (int) (((((float) this.mVerPadding) * 1.8f) - ((float) this.mCorrection)) + ((float) getTopIndicatorDrawable(waterMarkData).getIntrinsicHeight())));
            getTopIndicatorDrawable(waterMarkData).setBounds(rect2);
            getTopIndicatorDrawable(waterMarkData).draw(canvas3);
            if (f != 0.0f) {
                FontMetricsInt fontMetricsInt = this.mFaceInfoTextPaint.getFontMetricsInt();
                drawFaceInfoText(canvas3, waterMarkData.getInfo(), rect2.right + this.mGap, (((rect2.bottom + rect2.top) - fontMetricsInt.bottom) - fontMetricsInt.top) / 2);
            }
            if (!CameraSettings.isFrontMirror()) {
                createBitmap = Util.flipBitmap(createBitmap, 0);
            }
            canvas2.drawBitmap(createBitmap, (float) (((int) waterMarkData.getFaceRectF().centerX()) - intrinsicWidth), (float) (((((int) waterMarkData.getFaceRectF().top) - intrinsicHeight) - this.mPopBottomMargin) - this.mFacePopupBottom), null);
            it = it2;
        }
        canvas.restore();
        this.mWaterMarkData.setOrientation(this.mOrientation);
        if (!CameraSettings.isFrontMirror()) {
            if (this.mOrientation == 90 || this.mOrientation == 270) {
                this.mWaterMarkBitmap = Util.flipBitmap(this.mWaterMarkBitmap, 1);
            } else {
                this.mWaterMarkBitmap = Util.flipBitmap(this.mWaterMarkBitmap, 0);
            }
        }
        this.mWaterMarkData.setImage(this.mWaterMarkBitmap);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("end make water mark...time consuming：");
        sb.append(System.currentTimeMillis() - currentTimeMillis);
        Log.e(str, sb.toString());
    }

    public void setWaterMarkInfos(List<WaterMarkData> list) {
        this.mWaterMarkInfos = list;
    }
}
