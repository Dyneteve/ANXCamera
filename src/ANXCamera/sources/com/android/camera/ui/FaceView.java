package com.android.camera.ui;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.graphics.Paint.FontMetricsInt;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import com.android.camera.ActivityBase;
import com.android.camera.CameraScreenNail;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.fragment.top.FragmentTopAlert;
import com.android.camera.log.Log;
import com.android.camera.watermark.WaterMarkData;
import com.android.camera2.CameraHardwareFace;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import miui.view.animation.CubicEaseOutInterpolator;

public class FaceView extends FrameView {
    private static final int AUTO_HIDE_TIME_DELAY = 2000;
    private static final int GENDER_FEMALE_RECT_COLOR = -1152383;
    private static final int GENDER_MALE_RECT_COLOR = -9455628;
    private static final int LATEST_FACE_NUM = 6;
    private static final int MAGIC_MIRROR_RECT_COLOR = -18377;
    private static final int MAX_FACE_MOVE_DISTANCE = 120;
    private static final int MAX_FACE_WIDTH_DISTANCE = 90;
    public static final float MAX_GENDER_FEMALE = 0.4f;
    public static final float MIN_ANALYZE_PROB = 0.5f;
    private static final int MIN_FACE_WIDTH = 670;
    public static final float MIN_GENDER_MALE = 0.6f;
    private static final int MSG_AUTOMATIC_HIDE_FACE = 1;
    private static final int MSG_CANCEL_FACE_HIDE = 2;
    private static final int MSG_SET_FACE_VISIBLE = 3;
    private static final int SHOW_TYPE_GENDER_AGE = 1;
    private static final int SHOW_TYPE_NORMAL = 0;
    private static final int SHOW_TYPE_NULL = -1;
    private static final int SHOW_TYPE_SCORE = 4;
    private static final int SHOW_TYPE_SCORE_WINNER = 2;
    private static final int STATE_FORCE_HIDE = 4;
    private static final int STATE_HIDE = 2;
    private static final int STATE_NORMAL = 1;
    private static final int STATE_WAIT_FOR_HIDE = 3;
    private static final String TAG = "FaceView";
    private Configuration configuration;
    private Rect mActiveArraySize;
    private int mAgeFemaleHonPadding;
    private int mAgeMaleHonPadding;
    private int mAgeVerPadding;
    private Drawable mBeautyScoreIc;
    private Matrix mCamera2TranslateMatrix = new Matrix();
    private CameraScreenNail mCameraScreenNail;
    private Matrix mCanvasMatrix = new Matrix();
    private int mCorrection;
    private List<WaterMarkData> mCurrentWaterMarkDataInfos;
    private CameraHardwareFace[] mDrawingFaces;
    private Paint mEffectRectPaint = new Paint();
    private String mFaceAgeFormat;
    private Paint mFaceInfoNumberPaint;
    private Paint mFaceInfoTextPaint;
    private int mFacePopupBottom;
    private Animator mFaceRectHideAnimator;
    private String mFaceScoreInfoFormat;
    private CameraHardwareFace[] mFaces;
    private Drawable mFemaleAgeInfoPop;
    private int mGap;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    if (FaceView.this.mRectState == 3) {
                        FaceView.this.mRectState = 2;
                        FaceView.this.setFaceRectVisible(8, 600);
                        return;
                    }
                    return;
                case 2:
                    FaceView.this.cancelHideAnimator();
                    return;
                case 3:
                    FaceView.this.setFaceRectVisible(0, 0);
                    return;
                default:
                    return;
            }
        }
    };
    private boolean mIsCameraFaceDetectionAutoHidden;
    private boolean mIsUpdateFaceInfos = true;
    private int mLatestFaceIndex = -1;
    private CameraHardwareFace[] mLatestFaces = new CameraHardwareFace[6];
    private boolean mLightingOn;
    private Drawable mMagicMirrorInfoPop;
    private Drawable mMaleAgeInfoPop;
    private Matrix mMatrix = new Matrix();
    private boolean mMirror;
    /* access modifiers changed from: private */
    public Paint mNormalRectPaint;
    private int mOrientation;
    private int mPopBottomMargin;
    private RectF mRect = new RectF();
    /* access modifiers changed from: private */
    public int mRectState = 1;
    private int mScoreHonPadding;
    private int mScoreVerPadding;
    private Drawable mSexFemaleIc;
    private Drawable mSexMaleIc;
    private boolean mShowGenderAndAge;
    private boolean mShowMagicMirror;
    private boolean mSkipDraw;
    private Pattern mSplitFaceInfoPattern;
    private List<WaterMarkData> mWaterInfos;
    private int mWinnerIndex = -1;
    private float mZoomValue;

    @Retention(RetentionPolicy.SOURCE)
    @interface FaceViewRectState {
    }

    @Retention(RetentionPolicy.SOURCE)
    @interface PopType {
    }

    public FaceView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mEffectRectPaint.setAntiAlias(true);
        this.mEffectRectPaint.setStrokeWidth((float) getResources().getDimensionPixelSize(R.dimen.face_rect_width));
        this.mEffectRectPaint.setStyle(Style.STROKE);
        this.mNormalRectPaint = new Paint();
        this.mNormalRectPaint.setAntiAlias(true);
        this.mNormalRectPaint.setColor(-1);
        this.mNormalRectPaint.setStyle(Style.STROKE);
        this.mNormalRectPaint.setStrokeWidth((float) Util.dpToPixel(1.0f));
        this.mCameraScreenNail = ((ActivityBase) context).getCameraScreenNail();
    }

    private void attemptHideFaceRect() {
        this.mRectState = 3;
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessageDelayed(1, FragmentTopAlert.HINT_DELAY_TIME);
    }

    /* access modifiers changed from: private */
    public void cancelHideAnimator() {
        if (this.mFaceRectHideAnimator != null && this.mFaceRectHideAnimator.isRunning()) {
            this.mFaceRectHideAnimator.cancel();
        }
    }

    private void clearAttemptHideFaceRect() {
        this.mRectState = 1;
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessage(2);
    }

    private int determineWatermarkType() {
        if (CameraSettings.isMagicMirrorWaterMarkOpen()) {
            return 1;
        }
        return CameraSettings.isAgeGenderWaterMarkOpen() ? 2 : 0;
    }

    private void drawFaceInfoText(Canvas canvas, String str, int i, int i2) {
        float f;
        Matcher matcher = this.mSplitFaceInfoPattern.matcher(str);
        while (matcher.find()) {
            String group = matcher.group();
            if (group.matches("\\d+\\.?\\d*")) {
                f = this.mFaceInfoNumberPaint.measureText(group);
                canvas.drawText(group, ((float) i) + (f / 2.0f), (float) i2, this.mFaceInfoNumberPaint);
            } else {
                f = this.mFaceInfoTextPaint.measureText(group);
                canvas.drawText(group, ((float) i) + (f / 2.0f), (float) i2, this.mFaceInfoTextPaint);
            }
            i = (int) (((float) i) + f);
        }
    }

    private void drawFacePopInfo(Canvas canvas, RectF rectF, Drawable drawable, Drawable drawable2, String str, int i, int i2, int i3, int i4) {
        Canvas canvas2 = canvas;
        RectF rectF2 = rectF;
        Drawable drawable3 = drawable;
        Drawable drawable4 = drawable2;
        String str2 = str;
        int i5 = i;
        Matcher matcher = this.mSplitFaceInfoPattern.matcher(str2);
        float f = 0.0f;
        while (matcher.find()) {
            String group = matcher.group();
            f += group.matches("\\d+\\.?\\d*") ? this.mFaceInfoNumberPaint.measureText(group) : this.mFaceInfoTextPaint.measureText(group);
        }
        float f2 = (float) i2;
        int intrinsicWidth = ((int) ((((float) ((drawable.getIntrinsicWidth() + i5) + this.mGap)) + f) + ((float) i5))) / 2;
        Rect rect = new Rect(((int) rectF.centerX()) - intrinsicWidth, ((((int) rectF2.top) - ((int) ((3.6f * f2) + ((float) drawable.getIntrinsicHeight())))) - i4) - i3, ((int) rectF.centerX()) + intrinsicWidth, ((int) rectF2.top) - i4);
        if (drawable4 != null) {
            drawable4.setBounds(rect);
            drawable4.draw(canvas2);
        }
        Rect rect2 = new Rect();
        float f3 = f2 * 1.8f;
        rect2.set(rect.left + i5, (int) ((((float) rect.top) + f3) - ((float) this.mCorrection)), rect.left + i5 + drawable.getIntrinsicWidth(), (int) (((((float) rect.top) + f3) - ((float) this.mCorrection)) + ((float) drawable.getIntrinsicHeight())));
        drawable3.setBounds(rect2);
        drawable3.draw(canvas2);
        if (f != 0.0f) {
            FontMetricsInt fontMetricsInt = this.mFaceInfoTextPaint.getFontMetricsInt();
            drawFaceInfoText(canvas2, str2, rect2.right + this.mGap, (((rect2.bottom + rect2.top) - fontMetricsInt.bottom) - fontMetricsInt.top) / 2);
        }
    }

    private void drawFaceRect(Canvas canvas, RectF rectF, int i, CameraHardwareFace cameraHardwareFace) {
        if (i != 4) {
            switch (i) {
                case -1:
                    return;
                case 0:
                    canvas.drawRoundRect(rectF, rectF.width() * 0.015f, rectF.height() * 0.015f, this.mNormalRectPaint);
                    break;
                case 1:
                    if (isValidAGInfo(cameraHardwareFace)) {
                        this.mEffectRectPaint.setColor((cameraHardwareFace.gender > 0.4f ? 1 : (cameraHardwareFace.gender == 0.4f ? 0 : -1)) < 0 ? GENDER_FEMALE_RECT_COLOR : GENDER_MALE_RECT_COLOR);
                        canvas.drawRoundRect(rectF, rectF.width() * 0.015f, rectF.height() * 0.015f, this.mEffectRectPaint);
                        break;
                    } else {
                        return;
                    }
                case 2:
                    break;
            }
        }
        if (cameraHardwareFace.beautyscore > 0.0f) {
            this.mEffectRectPaint.setColor(MAGIC_MIRROR_RECT_COLOR);
            canvas.drawRoundRect(rectF, rectF.width() * 0.015f, rectF.height() * 0.015f, this.mEffectRectPaint);
        }
    }

    private String getAgeInfo(CameraHardwareFace cameraHardwareFace) {
        int i = (int) cameraHardwareFace.ageMale;
        if (cameraHardwareFace.gender < 0.4f) {
            i = (int) cameraHardwareFace.ageFemale;
        }
        return String.format(this.configuration.locale, this.mFaceAgeFormat, new Object[]{Integer.valueOf(i)});
    }

    private int getPopShowType(CameraHardwareFace[] cameraHardwareFaceArr) {
        int i;
        if (cameraHardwareFaceArr == null || cameraHardwareFaceArr.length <= 0) {
            return 0;
        }
        if (!this.mShowMagicMirror) {
            return this.mShowGenderAndAge ? 1 : 0;
        }
        this.mWinnerIndex = -1;
        int i2 = 0;
        for (int i3 = 0; i3 < this.mFaces.length; i3++) {
            CameraHardwareFace cameraHardwareFace = cameraHardwareFaceArr[i3];
            if (cameraHardwareFace.beautyscore > 0.0f) {
                i2++;
                if (this.mWinnerIndex == -1 || cameraHardwareFace.beautyscore > cameraHardwareFaceArr[this.mWinnerIndex].beautyscore) {
                    this.mWinnerIndex = i3;
                }
            }
        }
        if (i2 > 1) {
            i = 2;
        } else if (i2 <= 0) {
            return -1;
        } else {
            i = 4;
        }
        return i;
    }

    private String getScoreInfo(CameraHardwareFace cameraHardwareFace) {
        return String.format(this.configuration.locale, this.mFaceScoreInfoFormat, new Object[]{Float.valueOf(cameraHardwareFace.beautyscore / 10.0f)});
    }

    private void initFaceInfoStyle() {
        if (this.mFaceInfoTextPaint == null) {
            this.mSplitFaceInfoPattern = Pattern.compile("(\\D+)|(\\d+\\.?\\d*)");
            Resources resources = getResources();
            this.configuration = resources.getConfiguration();
            this.mFaceAgeFormat = resources.getString(R.string.face_age_info);
            this.mFaceScoreInfoFormat = resources.getString(R.string.face_score_info);
            this.mMaleAgeInfoPop = resources.getDrawable(R.drawable.male_age_info_pop);
            this.mFemaleAgeInfoPop = resources.getDrawable(R.drawable.female_age_info_pop);
            this.mSexMaleIc = resources.getDrawable(R.drawable.ic_sex_male);
            this.mSexFemaleIc = resources.getDrawable(R.drawable.ic_sex_female);
            this.mFaceInfoTextPaint = new Paint();
            this.mFaceInfoTextPaint.setAntiAlias(true);
            this.mFaceInfoTextPaint.setColor(-1);
            float dimension = resources.getDimension(R.dimen.face_info_magic_textSize);
            this.mFaceInfoTextPaint.setTextSize(dimension);
            this.mFaceInfoTextPaint.setTextAlign(Align.CENTER);
            this.mFaceInfoTextPaint.setFakeBoldText(true);
            this.mFaceInfoNumberPaint = new Paint(this.mFaceInfoTextPaint);
            if (this.configuration.locale.equals(Locale.SIMPLIFIED_CHINESE) || this.configuration.locale.equals(Locale.TRADITIONAL_CHINESE)) {
                this.mFaceInfoNumberPaint.setFakeBoldText(false);
                this.mFaceInfoNumberPaint.setTextSize(dimension * 1.16f);
            }
            this.mMagicMirrorInfoPop = resources.getDrawable(R.drawable.magic_mirror_info_pop);
            this.mBeautyScoreIc = resources.getDrawable(R.drawable.ic_beauty_score);
            this.mAgeVerPadding = resources.getDimensionPixelSize(R.dimen.face_info_ver_padding);
            this.mGap = resources.getDimensionPixelSize(R.dimen.face_info_text_left_dis);
            this.mCorrection = resources.getDimensionPixelOffset(R.dimen.face_info_correction);
            this.mPopBottomMargin = resources.getDimensionPixelSize(R.dimen.face_pop_bottom_margin);
            this.mScoreHonPadding = resources.getDimensionPixelSize(R.dimen.face_info_score_hon_padding);
            this.mScoreVerPadding = resources.getDimensionPixelSize(R.dimen.face_info_score_ver_padding);
            this.mAgeMaleHonPadding = resources.getDimensionPixelSize(R.dimen.face_info_male_hon_padding);
            this.mAgeFemaleHonPadding = resources.getDimensionPixelSize(R.dimen.face_info_female_hon_padding);
            this.mFacePopupBottom = (int) (((double) this.mMagicMirrorInfoPop.getIntrinsicHeight()) * 0.12d);
        }
    }

    private boolean isValidAGInfo(CameraHardwareFace cameraHardwareFace) {
        return 0.5f <= cameraHardwareFace.prob && cameraHardwareFace.gender != 0.0f && (cameraHardwareFace.gender <= 0.4f || 0.6f <= cameraHardwareFace.gender);
    }

    private void prepareMatrix() {
        this.mCamera2TranslateMatrix.reset();
        this.mMatrix.reset();
        this.mCanvasMatrix.reset();
        Util.scaleCamera2Matrix(this.mCamera2TranslateMatrix, this.mActiveArraySize, this.mZoomValue);
        int renderHeight = this.mCameraScreenNail.getRenderHeight();
        this.mCameraScreenNail.getRenderWidth();
        int height = (this.mCameraDisplayOrientation == 90 || this.mCameraDisplayOrientation == 270) ? (this.mActiveArraySize.height() * renderHeight) / this.mActiveArraySize.width() : (this.mActiveArraySize.width() * renderHeight) / this.mActiveArraySize.height();
        Util.prepareMatrix(this.mMatrix, this.mMirror, this.mCameraDisplayOrientation, height, renderHeight, getWidth() / 2, getHeight() / 2, this.mActiveArraySize.width(), this.mActiveArraySize.height());
        if (!this.mLightingOn) {
            this.mMatrix.postRotate((float) this.mOrientation);
            this.mCanvasMatrix.postRotate((float) this.mOrientation);
        }
    }

    private void setContentDescription(int i) {
        if (i > 0) {
            announceForAccessibility(getResources().getQuantityString(R.plurals.accessibility_focus_face_detect, i, new Object[]{Integer.valueOf(i)}));
        }
    }

    private void setCurrentFaceInfos(RectF rectF, String str, int i, int i2, int i3) {
        if (!this.mIsUpdateFaceInfos) {
            Log.d(TAG, "setCurrentFaceInfos@2: updateInfo=false");
            return;
        }
        if (this.mCurrentWaterMarkDataInfos == null) {
            this.mCurrentWaterMarkDataInfos = new ArrayList();
        }
        WaterMarkData waterMarkData = new WaterMarkData();
        waterMarkData.setFaceRectF(rectF);
        waterMarkData.setInfo(str);
        waterMarkData.setFaceViewWidth(i);
        waterMarkData.setFaceViewHeight(i2);
        waterMarkData.setOrientation(i3);
        waterMarkData.setWatermarkType(determineWatermarkType());
        if (this.mCurrentWaterMarkDataInfos != null) {
            this.mCurrentWaterMarkDataInfos.add(waterMarkData);
        }
    }

    private void setCurrentFaceInfos(RectF rectF, boolean z, String str, int i, int i2, int i3) {
        if (!this.mIsUpdateFaceInfos) {
            Log.d(TAG, "setCurrentFaceInfos@1: updateInfo=false");
            return;
        }
        if (this.mCurrentWaterMarkDataInfos == null) {
            this.mCurrentWaterMarkDataInfos = new ArrayList();
        }
        WaterMarkData waterMarkData = new WaterMarkData();
        waterMarkData.setFaceRectF(rectF);
        waterMarkData.setFemale(z);
        waterMarkData.setInfo(str);
        waterMarkData.setFaceViewWidth(i);
        waterMarkData.setFaceViewHeight(i2);
        waterMarkData.setOrientation(i3);
        waterMarkData.setWatermarkType(determineWatermarkType());
        this.mCurrentWaterMarkDataInfos.add(waterMarkData);
    }

    private void setToVisible() {
        if (getVisibility() != 0) {
            setVisibility(0);
        }
    }

    private void showNormalFaceRectImmediately() {
        this.mRectState = 1;
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessage(3);
    }

    private void updateFaceInfos() {
        if (!this.mIsUpdateFaceInfos) {
            Log.d(TAG, "updateFaceInfos: false");
            return;
        }
        if (this.mWaterInfos == null) {
            this.mWaterInfos = new ArrayList();
        }
        if (this.mCurrentWaterMarkDataInfos != null && !this.mCurrentWaterMarkDataInfos.isEmpty()) {
            if (!this.mWaterInfos.isEmpty()) {
                this.mWaterInfos.clear();
            }
            this.mWaterInfos.addAll(this.mCurrentWaterMarkDataInfos);
        }
        if (this.mCurrentWaterMarkDataInfos != null) {
            this.mCurrentWaterMarkDataInfos.clear();
        }
    }

    private void updateLatestFaces() {
        int i = this.mLatestFaceIndex;
        int i2 = i >= 5 ? 0 : i + 1;
        if (!faceExists()) {
            this.mLatestFaces[i2] = null;
        } else {
            CameraHardwareFace cameraHardwareFace = this.mFaces[0];
            for (int i3 = 1; i3 < this.mFaces.length; i3++) {
                if (this.mFaces[i3].rect.right - this.mFaces[i3].rect.left > cameraHardwareFace.rect.right - cameraHardwareFace.rect.left) {
                    cameraHardwareFace = this.mFaces[i3];
                }
            }
            this.mLatestFaces[i2] = cameraHardwareFace;
        }
        this.mLatestFaceIndex = i2;
    }

    public void clear() {
        this.mFaces = null;
        this.mRectState = 1;
        clearPreviousFaces();
        postInvalidate();
    }

    public void clearFaceFlags() {
        this.mShowGenderAndAge = false;
        this.mShowMagicMirror = false;
    }

    public void clearPreviousFaces() {
        this.mLatestFaceIndex = -1;
        for (int i = 0; i < this.mLatestFaces.length; i++) {
            this.mLatestFaces[i] = null;
        }
    }

    public boolean faceExisted() {
        if (this.mLatestFaceIndex < 0) {
            return false;
        }
        int i = this.mLatestFaceIndex;
        for (int i2 = 0; i2 < 3; i2++) {
            if (i < 0) {
                i += this.mLatestFaces.length;
            }
            if (this.mLatestFaces[i] != null) {
                return true;
            }
            i--;
        }
        return false;
    }

    public boolean faceExists() {
        return this.mFaces != null && this.mFaces.length > 0;
    }

    public void forceHideRect() {
        if (this.mRectState != 4) {
            this.mRectState = 4;
            this.mHandler.removeMessages(1);
            if (this.mNormalRectPaint.getAlpha() > 0) {
                setFaceRectVisible(8, 200);
            }
        }
    }

    public List<WaterMarkData> getFaceWaterMarkInfos() {
        this.mDrawingFaces = getFaces();
        if (this.mDrawingFaces == null || this.mDrawingFaces.length == 0 || this.mCameraScreenNail == null || this.mPause) {
            return null;
        }
        int popShowType = getPopShowType(this.mDrawingFaces);
        int i = 0;
        while (i < this.mDrawingFaces.length) {
            this.mRect.set(this.mDrawingFaces[i].rect);
            transToViewRect(this.mDrawingFaces[i].rect, this.mRect);
            if (popShowType == 1 && isValidAGInfo(this.mDrawingFaces[i])) {
                initFaceInfoStyle();
                setCurrentFaceInfos(new RectF(this.mRect.left, this.mRect.top, this.mRect.right, this.mRect.bottom), this.mDrawingFaces[i].gender < 0.4f, getAgeInfo(this.mDrawingFaces[i]), getWidth(), getHeight(), this.mOrientation);
            }
            if ((popShowType == 2 || popShowType == 4) && this.mDrawingFaces[i].beautyscore > 0.0f) {
                setCurrentFaceInfos(new RectF(this.mRect.left, this.mRect.top, this.mRect.right, this.mRect.bottom), getScoreInfo(this.mDrawingFaces[i]), getWidth(), getHeight(), this.mOrientation);
            }
            i++;
        }
        updateFaceInfos();
        return this.mWaterInfos;
    }

    public CameraHardwareFace[] getFaces() {
        return this.mFaces;
    }

    public RectF getFocusRect() {
        RectF rectF = new RectF();
        CameraScreenNail cameraScreenNail = ((ActivityBase) getContext()).getCameraScreenNail();
        if (cameraScreenNail == null || this.mLatestFaceIndex < 0 || this.mLatestFaceIndex >= 6) {
            return null;
        }
        this.mCamera2TranslateMatrix.reset();
        this.mMatrix.reset();
        Util.scaleCamera2Matrix(this.mCamera2TranslateMatrix, this.mActiveArraySize, this.mZoomValue);
        Util.prepareMatrix(this.mMatrix, this.mMirror, this.mCameraDisplayOrientation, cameraScreenNail.getRenderWidth(), cameraScreenNail.getRenderHeight(), getWidth() / 2, getHeight() / 2, this.mActiveArraySize.width(), this.mActiveArraySize.height());
        rectF.set(this.mLatestFaces[this.mLatestFaceIndex].rect);
        this.mMatrix.postRotate((float) this.mOrientation);
        this.mCamera2TranslateMatrix.mapRect(rectF);
        this.mMatrix.mapRect(rectF);
        return rectF;
    }

    public boolean isFaceStable() {
        CameraHardwareFace[] cameraHardwareFaceArr;
        boolean z = false;
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        for (CameraHardwareFace cameraHardwareFace : this.mLatestFaces) {
            if (cameraHardwareFace == null) {
                i++;
                if (i >= 3) {
                    return false;
                }
            } else {
                i2 += cameraHardwareFace.rect.right - cameraHardwareFace.rect.left;
                i3 += cameraHardwareFace.rect.bottom - cameraHardwareFace.rect.top;
                i4 += cameraHardwareFace.rect.left;
                i5 += cameraHardwareFace.rect.top;
            }
        }
        int length = this.mLatestFaces.length - i;
        int i6 = i2 / length;
        int i7 = i3 / length;
        int i8 = i4 / length;
        int i9 = i5 / length;
        int i10 = i6 / 3;
        if (i10 <= 90) {
            i10 = 90;
        }
        CameraHardwareFace[] cameraHardwareFaceArr2 = this.mLatestFaces;
        int length2 = cameraHardwareFaceArr2.length;
        for (int i11 = 0; i11 < length2; i11++) {
            CameraHardwareFace cameraHardwareFace2 = cameraHardwareFaceArr2[i11];
            if (cameraHardwareFace2 != null && (Math.abs((cameraHardwareFace2.rect.right - cameraHardwareFace2.rect.left) - i6) > i10 || Math.abs(cameraHardwareFace2.rect.left - i8) > 120 || Math.abs(cameraHardwareFace2.rect.top - i9) > 120)) {
                return false;
            }
        }
        if (i6 > MIN_FACE_WIDTH || i7 > MIN_FACE_WIDTH) {
            z = true;
        }
        this.mIsBigEnoughRect = z;
        return true;
    }

    public boolean isGroupCapture() {
        return this.mFaces != null && this.mFaces.length > 1;
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mHandler.removeCallbacksAndMessages(null);
        cancelHideAnimator();
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        Canvas canvas2 = canvas;
        if (!this.mSkipDraw) {
            this.mDrawingFaces = getFaces();
            if (this.mDrawingFaces != null && this.mDrawingFaces.length != 0 && this.mCameraScreenNail != null && !this.mPause) {
                canvas.save();
                if (!this.mLightingOn) {
                    canvas2.rotate((float) (-this.mOrientation));
                }
                int popShowType = getPopShowType(this.mDrawingFaces);
                for (int i = 0; i < this.mDrawingFaces.length; i++) {
                    this.mRect.set(this.mDrawingFaces[i].rect);
                    transToViewRect(this.mDrawingFaces[i].rect, this.mRect);
                    drawFaceRect(canvas2, this.mRect, popShowType, this.mDrawingFaces[i]);
                    if (popShowType != 4) {
                        switch (popShowType) {
                            case 1:
                                if (!isValidAGInfo(this.mDrawingFaces[i])) {
                                    break;
                                } else {
                                    initFaceInfoStyle();
                                    boolean z = this.mDrawingFaces[i].gender < 0.4f;
                                    drawFacePopInfo(canvas2, this.mRect, z ? this.mSexFemaleIc : this.mSexMaleIc, z ? this.mFemaleAgeInfoPop : this.mMaleAgeInfoPop, getAgeInfo(this.mDrawingFaces[i]), z ? this.mAgeFemaleHonPadding : this.mAgeMaleHonPadding, this.mAgeVerPadding, this.mFacePopupBottom, this.mPopBottomMargin);
                                    break;
                                }
                            case 2:
                                if (this.mDrawingFaces[i].beautyscore > 0.0f) {
                                    initFaceInfoStyle();
                                    drawFacePopInfo(canvas2, this.mRect, this.mBeautyScoreIc, this.mMagicMirrorInfoPop, getScoreInfo(this.mDrawingFaces[i]), this.mAgeFemaleHonPadding, this.mAgeVerPadding, this.mFacePopupBottom, this.mPopBottomMargin);
                                    break;
                                } else {
                                    break;
                                }
                        }
                    } else if (this.mDrawingFaces[i].beautyscore > 0.0f) {
                        initFaceInfoStyle();
                        drawFacePopInfo(canvas2, this.mRect, this.mBeautyScoreIc, this.mMagicMirrorInfoPop, getScoreInfo(this.mDrawingFaces[i]), this.mAgeFemaleHonPadding, this.mAgeVerPadding, this.mFacePopupBottom, this.mPopBottomMargin);
                    }
                }
                canvas.restore();
            }
        }
    }

    public void pause() {
        super.pause();
        clearPreviousFaces();
    }

    public void reShowFaceRect() {
        if (this.mRectState != 1) {
            showNormalFaceRectImmediately();
        }
    }

    public void resume() {
        super.resume();
        this.mIsCameraFaceDetectionAutoHidden = CameraSettings.isCameraFaceDetectionAutoHidden();
    }

    public void setCameraDisplayOrientation(int i) {
        this.mCameraDisplayOrientation = i;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("mCameraDisplayOrientation=");
        sb.append(i);
        Log.v(str, sb.toString());
    }

    /* JADX WARNING: type inference failed for: r0v0, types: [android.animation.TimeInterpolator, com.android.camera.ui.FaceView$2] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [android.animation.TimeInterpolator, com.android.camera.ui.FaceView$2]
  assigns: [com.android.camera.ui.FaceView$2]
  uses: [android.animation.TimeInterpolator]
  mth insns count: 21
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void setFaceRectVisible(int i, int i2) {
        cancelHideAnimator();
        if (i2 == 0) {
            this.mNormalRectPaint.setAlpha(i == 0 ? 255 : 0);
            return;
        }
        this.mFaceRectHideAnimator = ValueAnimator.ofFloat(new float[]{0.0f, 1.0f});
        this.mFaceRectHideAnimator.setInterpolator(new CubicEaseOutInterpolator() {
            public float getInterpolation(float f) {
                float interpolation = FaceView.super.getInterpolation(f);
                FaceView.this.mNormalRectPaint.setAlpha((int) (255.0f * (1.0f - interpolation)));
                FaceView.this.invalidate();
                return interpolation;
            }
        });
        this.mFaceRectHideAnimator.setDuration((long) i2);
        this.mFaceRectHideAnimator.start();
    }

    public boolean setFaces(CameraHardwareFace[] cameraHardwareFaceArr, Rect rect, float f) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Num of faces = ");
        boolean z = false;
        sb.append(cameraHardwareFaceArr == null ? 0 : cameraHardwareFaceArr.length);
        Log.c(str, sb.toString());
        if (this.mPause) {
            return false;
        }
        int length = cameraHardwareFaceArr != null ? cameraHardwareFaceArr.length : 0;
        int length2 = this.mFaces != null ? this.mFaces.length : 0;
        if (length != length2) {
            z = true;
        }
        if (length == 0 && length2 == 0) {
            return true;
        }
        this.mFaces = cameraHardwareFaceArr;
        this.mActiveArraySize = rect;
        this.mZoomValue = f;
        updateLatestFaces();
        prepareMatrix();
        postInvalidate();
        if (this.mRectState == 4 || this.mShowGenderAndAge || this.mShowMagicMirror) {
            return true;
        }
        if (z) {
            if (length > 0) {
                showNormalFaceRectImmediately();
            }
            if (Util.isAccessible()) {
                setContentDescription(length);
            }
        }
        if (this.mIsCameraFaceDetectionAutoHidden) {
            if (isFaceStable()) {
                if (!(this.mRectState == 2 || this.mRectState == 3)) {
                    attemptHideFaceRect();
                }
            } else if (this.mRectState != 1) {
                clearAttemptHideFaceRect();
            }
        }
        return true;
    }

    public void setLightingOn(boolean z) {
        this.mLightingOn = z;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("mLightingOn=");
        sb.append(this.mLightingOn);
        Log.v(str, sb.toString());
    }

    public void setMirror(boolean z) {
        this.mMirror = z;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("mMirror=");
        sb.append(z);
        Log.v(str, sb.toString());
    }

    public void setOrientation(int i, boolean z) {
        this.mOrientation = i;
        if (!this.mPause && faceExists() && !this.mSkipDraw) {
            invalidate();
        }
    }

    public void setShowGenderAndAge(boolean z) {
        boolean z2 = this.mShowGenderAndAge && !z;
        this.mShowGenderAndAge = z;
        if (z2) {
            showNormalFaceRectImmediately();
        }
        if (z) {
            setShowMagicMirror(false);
        }
    }

    public void setShowMagicMirror(boolean z) {
        boolean z2 = this.mShowMagicMirror && !z;
        this.mShowMagicMirror = z;
        if (z2) {
            showNormalFaceRectImmediately();
        }
        if (z) {
            setShowGenderAndAge(false);
        }
    }

    public void setShutterStatus(boolean z) {
        if (this.mIsUpdateFaceInfos != z) {
            this.mIsUpdateFaceInfos = z;
            if (!z) {
                if (this.mCurrentWaterMarkDataInfos != null && !this.mCurrentWaterMarkDataInfos.isEmpty()) {
                    this.mCurrentWaterMarkDataInfos.clear();
                }
                if (this.mWaterInfos != null && !this.mWaterInfos.isEmpty()) {
                    this.mWaterInfos.clear();
                }
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("setShutterStatus: updateInfo=");
                sb.append(this.mIsUpdateFaceInfos);
                Log.d(str, sb.toString());
            }
        }
    }

    public void setSkipDraw(boolean z) {
        this.mSkipDraw = z;
    }

    public void showFail() {
        setToVisible();
        invalidate();
    }

    public void showStart() {
        setToVisible();
        invalidate();
    }

    public void showSuccess() {
        setToVisible();
        invalidate();
    }

    public void transToViewRect(Rect rect, RectF rectF) {
        rectF.set(rect);
        this.mCamera2TranslateMatrix.mapRect(rectF);
        this.mMatrix.mapRect(rectF);
    }
}
