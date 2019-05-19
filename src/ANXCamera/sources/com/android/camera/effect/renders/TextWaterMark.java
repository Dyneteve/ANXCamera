package com.android.camera.effect.renders;

import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.gallery3d.ui.BasicTexture;
import com.android.gallery3d.ui.StringTexture;
import com.bytedance.frameworks.core.monitor.MonitorCommonConstants;

class TextWaterMark extends WaterMark {
    private static final float RATIO = 0.82f;
    private static final String TAG = TextWaterMark.class.getSimpleName();
    private static final int TEXT_COLOR = -262152;
    private static final int TEXT_PIXEL_SIZE = 144;
    private final int[][] PIC_WIDTHS = {new int[]{0, 149}, new int[]{150, 239}, new int[]{240, 279}, new int[]{280, MonitorCommonConstants.MAX_COUNT_UPLOAD_SINGLE_TIME}, new int[]{401, 1439}, new int[]{1440, 1511}, new int[]{1512, 1799}, new int[]{1800, 1899}, new int[]{1900, 2299}, new int[]{2300, 3120}, new int[]{3121, 4000}};
    private final int[][] WATERMARK_FONT_SIZES = {new int[]{5, 4, 2, 4, 3, 7}, new int[]{8, 6, 2, 6, 3, 7}, new int[]{11, 6, 5, 6, 5, 12}, new int[]{12, 7, 5, 7, 5, 12}, new int[]{50, 32, 11, 31, 20, 47}, new int[]{58, 36, 19, 38, 24, 55}, new int[]{65, 41, 24, 42, 27, 63}, new int[]{80, 50, 24, 50, 32, 75}, new int[]{83, 52, 25, 52, 33, 78}, new int[]{104, 65, 33, 65, 42, 98}, new int[]{128, 80, 40, 80, 48, 132}};
    private int mCenterX;
    private int mCenterY;
    private int mCharMargin;
    private int mFontIndex;
    private int mPadding;
    private int mWaterHeight;
    private String mWaterText;
    private BasicTexture mWaterTexture;
    private int mWaterWidth;

    public TextWaterMark(String str, int i, int i2, int i3) {
        int i4 = i;
        int i5 = i2;
        super(i4, i5, i3);
        this.mWaterText = str;
        this.mWaterTexture = StringTexture.newInstance(this.mWaterText, 144.0f, TEXT_COLOR, 0.0f, false, 1);
        this.mFontIndex = getFontIndex(i4, i5);
        this.mWaterWidth = getWaterMarkWidth(this.mWaterText, this.mFontIndex);
        this.mWaterHeight = (int) (((float) this.WATERMARK_FONT_SIZES[this.mFontIndex][0]) / RATIO);
        this.mPadding = this.WATERMARK_FONT_SIZES[this.mFontIndex][5];
        this.mCharMargin = (int) ((((float) this.mWaterHeight) * 0.18f) / 2.0f);
        calcCenterAxis();
        if (Util.sIsDumpLog) {
            print();
        }
    }

    private void calcCenterAxis() {
        int i = this.mOrientation;
        if (i == 0) {
            this.mCenterX = (this.mPictureWidth - this.mPadding) - (this.mWaterWidth / 2);
            this.mCenterY = ((this.mPictureHeight - this.mPadding) - (this.mWaterHeight / 2)) + this.mCharMargin;
        } else if (i == 90) {
            this.mCenterX = ((this.mPictureWidth - this.mPadding) - (this.mWaterHeight / 2)) + this.mCharMargin;
            this.mCenterY = this.mPadding + (this.mWaterWidth / 2);
        } else if (i == 180) {
            this.mCenterX = this.mPadding + (this.mWaterWidth / 2);
            this.mCenterY = (this.mPadding + (this.mWaterHeight / 2)) - this.mCharMargin;
        } else if (i == 270) {
            this.mCenterX = (this.mPadding + (this.mWaterHeight / 2)) - this.mCharMargin;
            this.mCenterY = (this.mPictureHeight - this.mPadding) - (this.mWaterWidth / 2);
        }
    }

    private int getFontIndex(int i, int i2) {
        int min = Math.min(i, i2);
        int length = this.WATERMARK_FONT_SIZES.length - 1;
        int i3 = 0;
        while (i3 < this.PIC_WIDTHS.length) {
            if (min >= this.PIC_WIDTHS[i3][0] && min <= this.PIC_WIDTHS[i3][1]) {
                return i3;
            }
            i3++;
        }
        return length;
    }

    private int getWaterMarkWidth(String str, int i) {
        int i2 = this.WATERMARK_FONT_SIZES[i][1];
        int i3 = this.WATERMARK_FONT_SIZES[i][2];
        int i4 = this.WATERMARK_FONT_SIZES[i][3];
        int i5 = this.WATERMARK_FONT_SIZES[i][4];
        char[] charArray = str.toCharArray();
        int length = charArray.length;
        int i6 = 0;
        for (int i7 = 0; i7 < length; i7++) {
            char c = charArray[i7];
            if (c >= '0' && c <= '9') {
                i6 += i2;
            } else if (c == ':') {
                i6 += i5;
            } else if (c == '-') {
                i6 += i3;
            } else if (c == ' ') {
                i6 += i4;
            }
        }
        return i6;
    }

    private void print() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("WaterMark mPictureWidth=");
        sb.append(this.mPictureWidth);
        sb.append(" mPictureHeight =");
        sb.append(this.mPictureHeight);
        sb.append(" mWaterText=");
        sb.append(this.mWaterText);
        sb.append(" mFontIndex=");
        sb.append(this.mFontIndex);
        sb.append(" mCenterX=");
        sb.append(this.mCenterX);
        sb.append(" mCenterY=");
        sb.append(this.mCenterY);
        sb.append(" mWaterWidth=");
        sb.append(this.mWaterWidth);
        sb.append(" mWaterHeight=");
        sb.append(this.mWaterHeight);
        sb.append(" mPadding=");
        sb.append(this.mPadding);
        Log.v(str, sb.toString());
    }

    public int getCenterX() {
        return this.mCenterX;
    }

    public int getCenterY() {
        return this.mCenterY;
    }

    public int getHeight() {
        return this.mWaterHeight;
    }

    public int getPaddingX() {
        return this.mPadding;
    }

    public int getPaddingY() {
        return this.mPadding;
    }

    public BasicTexture getTexture() {
        return this.mWaterTexture;
    }

    public int getWidth() {
        return this.mWaterWidth;
    }
}
