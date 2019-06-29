package android.support.v4.media.subtitle;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.media.MediaFormat;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Message;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.v4.media.SubtitleData2;
import android.support.v4.media.subtitle.Cea708CCParser.CaptionEvent;
import android.support.v4.media.subtitle.Cea708CCParser.CaptionPenAttr;
import android.support.v4.media.subtitle.Cea708CCParser.CaptionPenColor;
import android.support.v4.media.subtitle.Cea708CCParser.CaptionPenLocation;
import android.support.v4.media.subtitle.Cea708CCParser.CaptionWindow;
import android.support.v4.media.subtitle.Cea708CCParser.CaptionWindowAttr;
import android.support.v4.media.subtitle.SubtitleController.Renderer;
import android.support.v4.media.subtitle.SubtitleTrack.RenderingWidget;
import android.text.Layout.Alignment;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.CharacterStyle;
import android.text.style.RelativeSizeSpan;
import android.text.style.StyleSpan;
import android.text.style.SubscriptSpan;
import android.text.style.SuperscriptSpan;
import android.text.style.UnderlineSpan;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnLayoutChangeListener;
import android.view.ViewGroup;
import android.view.accessibility.CaptioningManager;
import android.view.accessibility.CaptioningManager.CaptionStyle;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

@RequiresApi(28)
@RestrictTo({Scope.LIBRARY_GROUP})
public class Cea708CaptionRenderer extends Renderer {
    private Cea708CCWidget mCCWidget;
    private final Context mContext;

    class Cea708CCWidget extends ClosedCaptionWidget implements DisplayListener {
        private final CCHandler mCCHandler;

        class CCHandler implements Callback {
            private static final int CAPTION_ALL_WINDOWS_BITMAP = 255;
            private static final long CAPTION_CLEAR_INTERVAL_MS = 60000;
            private static final int CAPTION_WINDOWS_MAX = 8;
            private static final boolean DEBUG = false;
            private static final int MSG_CAPTION_CLEAR = 2;
            private static final int MSG_DELAY_CANCEL = 1;
            private static final String TAG = "CCHandler";
            private static final int TENTHS_OF_SECOND_IN_MILLIS = 100;
            private final CCLayout mCCLayout;
            private final CCWindowLayout[] mCaptionWindowLayouts = new CCWindowLayout[8];
            private CCWindowLayout mCurrentWindowLayout;
            private final Handler mHandler;
            private boolean mIsDelayed = false;
            private final ArrayList<CaptionEvent> mPendingCaptionEvents = new ArrayList<>();

            CCHandler(CCLayout cCLayout) {
                this.mCCLayout = cCLayout;
                this.mHandler = new Handler(this);
            }

            private void clearWindows(int i) {
                if (i != 0) {
                    Iterator it = getWindowsFromBitmap(i).iterator();
                    while (it.hasNext()) {
                        ((CCWindowLayout) it.next()).clear();
                    }
                }
            }

            private void defineWindow(CaptionWindow captionWindow) {
                if (captionWindow != null) {
                    int i = captionWindow.id;
                    if (i >= 0 && i < this.mCaptionWindowLayouts.length) {
                        CCWindowLayout cCWindowLayout = this.mCaptionWindowLayouts[i];
                        if (cCWindowLayout == null) {
                            cCWindowLayout = new CCWindowLayout(Cea708CCWidget.this, this.mCCLayout.getContext());
                        }
                        cCWindowLayout.initWindow(this.mCCLayout, captionWindow);
                        this.mCaptionWindowLayouts[i] = cCWindowLayout;
                        this.mCurrentWindowLayout = cCWindowLayout;
                    }
                }
            }

            private void delay(int i) {
                if (i >= 0 && i <= 255) {
                    this.mIsDelayed = true;
                    this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(1), (long) (i * 100));
                }
            }

            private void delayCancel() {
                this.mIsDelayed = false;
                processPendingBuffer();
            }

            private void deleteWindows(int i) {
                if (i != 0) {
                    Iterator it = getWindowsFromBitmap(i).iterator();
                    while (it.hasNext()) {
                        CCWindowLayout cCWindowLayout = (CCWindowLayout) it.next();
                        cCWindowLayout.removeFromCaptionView();
                        this.mCaptionWindowLayouts[cCWindowLayout.getCaptionWindowId()] = null;
                    }
                }
            }

            private void displayWindows(int i) {
                if (i != 0) {
                    Iterator it = getWindowsFromBitmap(i).iterator();
                    while (it.hasNext()) {
                        ((CCWindowLayout) it.next()).show();
                    }
                }
            }

            private ArrayList<CCWindowLayout> getWindowsFromBitmap(int i) {
                ArrayList<CCWindowLayout> arrayList = new ArrayList<>();
                for (int i2 = 0; i2 < 8; i2++) {
                    if (((1 << i2) & i) != 0) {
                        CCWindowLayout cCWindowLayout = this.mCaptionWindowLayouts[i2];
                        if (cCWindowLayout != null) {
                            arrayList.add(cCWindowLayout);
                        }
                    }
                }
                return arrayList;
            }

            private void hideWindows(int i) {
                if (i != 0) {
                    Iterator it = getWindowsFromBitmap(i).iterator();
                    while (it.hasNext()) {
                        ((CCWindowLayout) it.next()).hide();
                    }
                }
            }

            private void processPendingBuffer() {
                Iterator it = this.mPendingCaptionEvents.iterator();
                while (it.hasNext()) {
                    processCaptionEvent((CaptionEvent) it.next());
                }
                this.mPendingCaptionEvents.clear();
            }

            private void sendBufferToCurrentWindow(String str) {
                if (this.mCurrentWindowLayout != null) {
                    this.mCurrentWindowLayout.sendBuffer(str);
                    this.mHandler.removeMessages(2);
                    this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(2), CAPTION_CLEAR_INTERVAL_MS);
                }
            }

            private void sendControlToCurrentWindow(char c) {
                if (this.mCurrentWindowLayout != null) {
                    this.mCurrentWindowLayout.sendControl(c);
                }
            }

            private void setCurrentWindowLayout(int i) {
                if (i >= 0 && i < this.mCaptionWindowLayouts.length) {
                    CCWindowLayout cCWindowLayout = this.mCaptionWindowLayouts[i];
                    if (cCWindowLayout != null) {
                        this.mCurrentWindowLayout = cCWindowLayout;
                    }
                }
            }

            private void setPenAttr(CaptionPenAttr captionPenAttr) {
                if (this.mCurrentWindowLayout != null) {
                    this.mCurrentWindowLayout.setPenAttr(captionPenAttr);
                }
            }

            private void setPenColor(CaptionPenColor captionPenColor) {
                if (this.mCurrentWindowLayout != null) {
                    this.mCurrentWindowLayout.setPenColor(captionPenColor);
                }
            }

            private void setPenLocation(CaptionPenLocation captionPenLocation) {
                if (this.mCurrentWindowLayout != null) {
                    this.mCurrentWindowLayout.setPenLocation(captionPenLocation.row, captionPenLocation.column);
                }
            }

            private void setWindowAttr(CaptionWindowAttr captionWindowAttr) {
                if (this.mCurrentWindowLayout != null) {
                    this.mCurrentWindowLayout.setWindowAttr(captionWindowAttr);
                }
            }

            private void toggleWindows(int i) {
                if (i != 0) {
                    Iterator it = getWindowsFromBitmap(i).iterator();
                    while (it.hasNext()) {
                        CCWindowLayout cCWindowLayout = (CCWindowLayout) it.next();
                        if (cCWindowLayout.isShown()) {
                            cCWindowLayout.hide();
                        } else {
                            cCWindowLayout.show();
                        }
                    }
                }
            }

            public boolean handleMessage(Message message) {
                switch (message.what) {
                    case 1:
                        delayCancel();
                        return true;
                    case 2:
                        clearWindows(255);
                        return true;
                    default:
                        return false;
                }
            }

            public void processCaptionEvent(CaptionEvent captionEvent) {
                if (this.mIsDelayed) {
                    this.mPendingCaptionEvents.add(captionEvent);
                    return;
                }
                switch (captionEvent.type) {
                    case 1:
                        sendBufferToCurrentWindow((String) captionEvent.obj);
                        break;
                    case 2:
                        sendControlToCurrentWindow(((Character) captionEvent.obj).charValue());
                        break;
                    case 3:
                        setCurrentWindowLayout(((Integer) captionEvent.obj).intValue());
                        break;
                    case 4:
                        clearWindows(((Integer) captionEvent.obj).intValue());
                        break;
                    case 5:
                        displayWindows(((Integer) captionEvent.obj).intValue());
                        break;
                    case 6:
                        hideWindows(((Integer) captionEvent.obj).intValue());
                        break;
                    case 7:
                        toggleWindows(((Integer) captionEvent.obj).intValue());
                        break;
                    case 8:
                        deleteWindows(((Integer) captionEvent.obj).intValue());
                        break;
                    case 9:
                        delay(((Integer) captionEvent.obj).intValue());
                        break;
                    case 10:
                        delayCancel();
                        break;
                    case 11:
                        reset();
                        break;
                    case 12:
                        setPenAttr((CaptionPenAttr) captionEvent.obj);
                        break;
                    case 13:
                        setPenColor((CaptionPenColor) captionEvent.obj);
                        break;
                    case 14:
                        setPenLocation((CaptionPenLocation) captionEvent.obj);
                        break;
                    case 15:
                        setWindowAttr((CaptionWindowAttr) captionEvent.obj);
                        break;
                    case 16:
                        defineWindow((CaptionWindow) captionEvent.obj);
                        break;
                }
            }

            public void reset() {
                this.mCurrentWindowLayout = null;
                this.mIsDelayed = false;
                this.mPendingCaptionEvents.clear();
                for (int i = 0; i < 8; i++) {
                    if (this.mCaptionWindowLayouts[i] != null) {
                        this.mCaptionWindowLayouts[i].removeFromCaptionView();
                    }
                    this.mCaptionWindowLayouts[i] = null;
                }
                this.mCCLayout.setVisibility(4);
                this.mHandler.removeMessages(2);
            }
        }

        class CCLayout extends ScaledLayout implements ClosedCaptionLayout {
            private static final float SAFE_TITLE_AREA_SCALE_END_X = 0.9f;
            private static final float SAFE_TITLE_AREA_SCALE_END_Y = 0.9f;
            private static final float SAFE_TITLE_AREA_SCALE_START_X = 0.1f;
            private static final float SAFE_TITLE_AREA_SCALE_START_Y = 0.1f;
            private final ScaledLayout mSafeTitleAreaLayout;

            CCLayout(Context context) {
                super(context);
                this.mSafeTitleAreaLayout = new ScaledLayout(context);
                ScaledLayout scaledLayout = this.mSafeTitleAreaLayout;
                ScaledLayoutParams scaledLayoutParams = new ScaledLayoutParams(0.1f, 0.9f, 0.1f, 0.9f);
                addView(scaledLayout, scaledLayoutParams);
            }

            public void addOrUpdateViewToSafeTitleArea(CCWindowLayout cCWindowLayout, ScaledLayoutParams scaledLayoutParams) {
                if (this.mSafeTitleAreaLayout.indexOfChild(cCWindowLayout) < 0) {
                    this.mSafeTitleAreaLayout.addView(cCWindowLayout, scaledLayoutParams);
                } else {
                    this.mSafeTitleAreaLayout.updateViewLayout(cCWindowLayout, scaledLayoutParams);
                }
            }

            public void removeViewFromSafeTitleArea(CCWindowLayout cCWindowLayout) {
                this.mSafeTitleAreaLayout.removeView(cCWindowLayout);
            }

            public void setCaptionStyle(CaptionStyle captionStyle) {
                int childCount = this.mSafeTitleAreaLayout.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    ((CCWindowLayout) this.mSafeTitleAreaLayout.getChildAt(i)).setCaptionStyle(captionStyle);
                }
            }

            public void setFontScale(float f) {
                int childCount = this.mSafeTitleAreaLayout.getChildCount();
                for (int i = 0; i < childCount; i++) {
                    ((CCWindowLayout) this.mSafeTitleAreaLayout.getChildAt(i)).setFontScale(f);
                }
            }
        }

        class CCView extends SubtitleView {
            CCView(Cea708CCWidget cea708CCWidget, Context context) {
                this(cea708CCWidget, context, null);
            }

            CCView(Cea708CCWidget cea708CCWidget, Context context, AttributeSet attributeSet) {
                this(cea708CCWidget, context, attributeSet, 0);
            }

            CCView(Cea708CCWidget cea708CCWidget, Context context, AttributeSet attributeSet, int i) {
                this(context, attributeSet, i, 0);
            }

            CCView(Context context, AttributeSet attributeSet, int i, int i2) {
                super(context, attributeSet, i, i2);
            }

            /* access modifiers changed from: 0000 */
            public void setCaptionStyle(CaptionStyle captionStyle) {
                if (captionStyle.hasForegroundColor()) {
                    setForegroundColor(captionStyle.foregroundColor);
                }
                if (captionStyle.hasBackgroundColor()) {
                    setBackgroundColor(captionStyle.backgroundColor);
                }
                if (captionStyle.hasEdgeType()) {
                    setEdgeType(captionStyle.edgeType);
                }
                if (captionStyle.hasEdgeColor()) {
                    setEdgeColor(captionStyle.edgeColor);
                }
                setTypeface(captionStyle.getTypeface());
            }
        }

        private class CCWindowLayout extends RelativeLayout implements OnLayoutChangeListener {
            private static final int ANCHOR_HORIZONTAL_16_9_MAX = 209;
            private static final int ANCHOR_HORIZONTAL_MODE_CENTER = 1;
            private static final int ANCHOR_HORIZONTAL_MODE_LEFT = 0;
            private static final int ANCHOR_HORIZONTAL_MODE_RIGHT = 2;
            private static final int ANCHOR_MODE_DIVIDER = 3;
            private static final int ANCHOR_RELATIVE_POSITIONING_MAX = 99;
            private static final int ANCHOR_VERTICAL_MAX = 74;
            private static final int ANCHOR_VERTICAL_MODE_BOTTOM = 2;
            private static final int ANCHOR_VERTICAL_MODE_CENTER = 1;
            private static final int ANCHOR_VERTICAL_MODE_TOP = 0;
            private static final int MAX_COLUMN_COUNT_16_9 = 42;
            private static final float PROPORTION_PEN_SIZE_LARGE = 1.25f;
            private static final float PROPORTION_PEN_SIZE_SMALL = 0.75f;
            private static final String TAG = "CCWindowLayout";
            private final SpannableStringBuilder mBuilder;
            private CCLayout mCCLayout;
            private CCView mCCView;
            private CaptionStyle mCaptionStyle;
            private int mCaptionWindowId;
            private final List<CharacterStyle> mCharacterStyles;
            private float mFontScale;
            private int mLastCaptionLayoutHeight;
            private int mLastCaptionLayoutWidth;
            private int mRow;
            private int mRowLimit;
            private float mTextSize;
            private String mWidestChar;

            CCWindowLayout(Cea708CCWidget cea708CCWidget, Context context) {
                this(cea708CCWidget, context, null);
            }

            CCWindowLayout(Cea708CCWidget cea708CCWidget, Context context, AttributeSet attributeSet) {
                this(cea708CCWidget, context, attributeSet, 0);
            }

            CCWindowLayout(Cea708CCWidget cea708CCWidget, Context context, AttributeSet attributeSet, int i) {
                this(context, attributeSet, i, 0);
            }

            CCWindowLayout(Context context, AttributeSet attributeSet, int i, int i2) {
                super(context, attributeSet, i, i2);
                this.mRowLimit = 0;
                this.mBuilder = new SpannableStringBuilder();
                this.mCharacterStyles = new ArrayList();
                this.mRow = -1;
                this.mCCView = new CCView(Cea708CCWidget.this, context);
                addView(this.mCCView, new LayoutParams(-2, -2));
                CaptioningManager captioningManager = (CaptioningManager) context.getSystemService("captioning");
                this.mFontScale = captioningManager.getFontScale();
                setCaptionStyle(captioningManager.getUserStyle());
                this.mCCView.setText((CharSequence) "");
                updateWidestChar();
            }

            private int getScreenColumnCount() {
                return 42;
            }

            private void updateText(String str, boolean z) {
                if (!z) {
                    this.mBuilder.clear();
                }
                if (str != null && str.length() > 0) {
                    int length = this.mBuilder.length();
                    this.mBuilder.append(str);
                    for (CharacterStyle span : this.mCharacterStyles) {
                        this.mBuilder.setSpan(span, length, this.mBuilder.length(), 33);
                    }
                }
                String[] split = TextUtils.split(this.mBuilder.toString(), "\n");
                this.mBuilder.delete(0, this.mBuilder.length() - TextUtils.join("\n", Arrays.copyOfRange(split, Math.max(0, split.length - (this.mRowLimit + 1)), split.length)).length());
                int length2 = this.mBuilder.length() - 1;
                int i = 0;
                while (i <= length2 && this.mBuilder.charAt(i) <= ' ') {
                    i++;
                }
                int i2 = length2;
                while (i2 >= i && this.mBuilder.charAt(i2) <= ' ') {
                    i2--;
                }
                if (i == 0 && i2 == length2) {
                    this.mCCView.setText((CharSequence) this.mBuilder);
                    return;
                }
                SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
                spannableStringBuilder.append(this.mBuilder);
                if (i2 < length2) {
                    spannableStringBuilder.delete(i2 + 1, length2 + 1);
                }
                if (i > 0) {
                    spannableStringBuilder.delete(0, i);
                }
                this.mCCView.setText((CharSequence) spannableStringBuilder);
            }

            private void updateTextSize() {
                if (this.mCCLayout != null) {
                    StringBuilder sb = new StringBuilder();
                    int screenColumnCount = getScreenColumnCount();
                    for (int i = 0; i < screenColumnCount; i++) {
                        sb.append(this.mWidestChar);
                    }
                    String sb2 = sb.toString();
                    Paint paint = new Paint();
                    paint.setTypeface(this.mCaptionStyle.getTypeface());
                    float f = 0.0f;
                    float f2 = 255.0f;
                    while (f < f2) {
                        float f3 = (f + f2) / 2.0f;
                        paint.setTextSize(f3);
                        if (((float) this.mCCLayout.getWidth()) * 0.8f > paint.measureText(sb2)) {
                            f = f3 + 0.01f;
                        } else {
                            f2 = f3 - 0.01f;
                        }
                    }
                    this.mTextSize = f2 * this.mFontScale;
                    this.mCCView.setTextSize(this.mTextSize);
                }
            }

            private void updateWidestChar() {
                Paint paint = new Paint();
                paint.setTypeface(this.mCaptionStyle.getTypeface());
                Charset forName = Charset.forName("ISO-8859-1");
                float f = 0.0f;
                for (int i = 0; i < 256; i++) {
                    String str = new String(new byte[]{(byte) i}, forName);
                    float measureText = paint.measureText(str);
                    if (f < measureText) {
                        this.mWidestChar = str;
                        f = measureText;
                    }
                }
                updateTextSize();
            }

            public void appendText(String str) {
                updateText(str, true);
            }

            public void clear() {
                clearText();
                hide();
            }

            public void clearText() {
                this.mBuilder.clear();
                this.mCCView.setText((CharSequence) "");
            }

            public int getCaptionWindowId() {
                return this.mCaptionWindowId;
            }

            public void hide() {
                setVisibility(4);
                requestLayout();
            }

            /* JADX WARNING: Code restructure failed: missing block: B:43:0x0123, code lost:
                r9 = r1;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:44:0x0124, code lost:
                r10 = r3;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:48:0x013e, code lost:
                r14 = r13.mCCLayout;
                r8 = r13.mCCLayout;
                r8.getClass();
                r7 = new android.support.v4.media.subtitle.Cea708CaptionRenderer.Cea708CCWidget.ScaledLayout.ScaledLayoutParams(r8, r9, r10, r11, r12);
                r14.addOrUpdateViewToSafeTitleArea(r13, r7);
                setCaptionWindowId(r15.id);
                setRowLimit(r15.rowCount);
                setGravity(r2);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:49:0x015d, code lost:
                if (r15.visible == false) goto L_0x0163;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:50:0x015f, code lost:
                show();
             */
            /* JADX WARNING: Code restructure failed: missing block: B:51:0x0163, code lost:
                hide();
             */
            /* JADX WARNING: Code restructure failed: missing block: B:53:?, code lost:
                return;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:54:?, code lost:
                return;
             */
            public void initWindow(CCLayout cCLayout, CaptionWindow captionWindow) {
                float f;
                float f2;
                float f3;
                if (this.mCCLayout != cCLayout) {
                    if (this.mCCLayout != null) {
                        this.mCCLayout.removeOnLayoutChangeListener(this);
                    }
                    this.mCCLayout = cCLayout;
                    this.mCCLayout.addOnLayoutChangeListener(this);
                    updateWidestChar();
                }
                int i = 99;
                float f4 = ((float) captionWindow.anchorVertical) / ((float) (captionWindow.relativePositioning ? 99 : 74));
                float f5 = (float) captionWindow.anchorHorizontal;
                if (!captionWindow.relativePositioning) {
                    i = 209;
                }
                float f6 = f5 / ((float) i);
                float f7 = 0.0f;
                float f8 = 1.0f;
                if (f4 < 0.0f || f4 > 1.0f) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("The vertical position of the anchor point should be at the range of 0 and 1 but ");
                    sb.append(f4);
                    Log.i(str, sb.toString());
                    f4 = Math.max(0.0f, Math.min(f4, 1.0f));
                }
                if (f6 < 0.0f || f6 > 1.0f) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("The horizontal position of the anchor point should be at the range of 0 and 1 but ");
                    sb2.append(f6);
                    Log.i(str2, sb2.toString());
                    f6 = Math.max(0.0f, Math.min(f6, 1.0f));
                }
                int i2 = 17;
                int i3 = captionWindow.anchorId / 3;
                switch (captionWindow.anchorId % 3) {
                    case 0:
                        this.mCCView.setAlignment(Alignment.ALIGN_NORMAL);
                    case 1:
                        float min = Math.min(1.0f - f6, f6);
                        int min2 = Math.min(getScreenColumnCount(), captionWindow.columnCount + 1);
                        StringBuilder sb3 = new StringBuilder();
                        for (int i4 = 0; i4 < min2; i4++) {
                            sb3.append(this.mWidestChar);
                        }
                        Paint paint = new Paint();
                        paint.setTypeface(this.mCaptionStyle.getTypeface());
                        paint.setTextSize(this.mTextSize);
                        float measureText = this.mCCLayout.getWidth() > 0 ? (paint.measureText(sb3.toString()) / 2.0f) / (((float) this.mCCLayout.getWidth()) * 0.8f) : 0.0f;
                        if (measureText <= 0.0f || measureText >= f6) {
                            this.mCCView.setAlignment(Alignment.ALIGN_CENTER);
                            f = f6 + min;
                            f2 = f6 - min;
                            i2 = 1;
                            break;
                        } else {
                            this.mCCView.setAlignment(Alignment.ALIGN_NORMAL);
                            f6 -= measureText;
                        }
                        break;
                    case 2:
                        i2 = 5;
                        f = f6;
                        f2 = 0.0f;
                        break;
                    default:
                        f2 = 0.0f;
                        f = 1.0f;
                        break;
                }
                f2 = f6;
                f = 1.0f;
                i2 = 3;
                switch (i3) {
                    case 0:
                        i2 |= 48;
                        f3 = f4;
                        break;
                    case 1:
                        i2 |= 16;
                        float min3 = Math.min(1.0f - f4, f4);
                        f7 = f4 - min3;
                        f8 = f4 + min3;
                        break;
                    case 2:
                        i2 |= 80;
                        float f9 = f4;
                        f3 = 0.0f;
                        break;
                }
            }

            public void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                int i9 = i3 - i;
                int i10 = i4 - i2;
                if (i9 != this.mLastCaptionLayoutWidth || i10 != this.mLastCaptionLayoutHeight) {
                    this.mLastCaptionLayoutWidth = i9;
                    this.mLastCaptionLayoutHeight = i10;
                    updateTextSize();
                }
            }

            public void removeFromCaptionView() {
                if (this.mCCLayout != null) {
                    this.mCCLayout.removeViewFromSafeTitleArea(this);
                    this.mCCLayout.removeOnLayoutChangeListener(this);
                    this.mCCLayout = null;
                }
            }

            public void sendBuffer(String str) {
                appendText(str);
            }

            public void sendControl(char c) {
            }

            public void setCaptionStyle(CaptionStyle captionStyle) {
                this.mCaptionStyle = captionStyle;
                this.mCCView.setCaptionStyle(captionStyle);
            }

            public void setCaptionWindowId(int i) {
                this.mCaptionWindowId = i;
            }

            public void setFontScale(float f) {
                this.mFontScale = f;
                updateTextSize();
            }

            public void setPenAttr(CaptionPenAttr captionPenAttr) {
                this.mCharacterStyles.clear();
                if (captionPenAttr.italic) {
                    this.mCharacterStyles.add(new StyleSpan(2));
                }
                if (captionPenAttr.underline) {
                    this.mCharacterStyles.add(new UnderlineSpan());
                }
                int i = captionPenAttr.penSize;
                if (i == 0) {
                    this.mCharacterStyles.add(new RelativeSizeSpan(PROPORTION_PEN_SIZE_SMALL));
                } else if (i == 2) {
                    this.mCharacterStyles.add(new RelativeSizeSpan(PROPORTION_PEN_SIZE_LARGE));
                }
                int i2 = captionPenAttr.penOffset;
                if (i2 == 0) {
                    this.mCharacterStyles.add(new SubscriptSpan());
                } else if (i2 == 2) {
                    this.mCharacterStyles.add(new SuperscriptSpan());
                }
            }

            public void setPenColor(CaptionPenColor captionPenColor) {
            }

            public void setPenLocation(int i, int i2) {
                if (this.mRow >= 0) {
                    for (int i3 = this.mRow; i3 < i; i3++) {
                        appendText("\n");
                    }
                }
                this.mRow = i;
            }

            public void setRowLimit(int i) {
                if (i >= 0) {
                    this.mRowLimit = i;
                    return;
                }
                throw new IllegalArgumentException("A rowLimit should have a positive number");
            }

            public void setText(String str) {
                updateText(str, false);
            }

            public void setWindowAttr(CaptionWindowAttr captionWindowAttr) {
            }

            public void show() {
                setVisibility(0);
                requestLayout();
            }
        }

        class ScaledLayout extends ViewGroup {
            private static final boolean DEBUG = false;
            private static final String TAG = "ScaledLayout";
            private Rect[] mRectArray;
            private final Comparator<Rect> mRectTopLeftSorter = new Comparator<Rect>() {
                public int compare(Rect rect, Rect rect2) {
                    return rect.top != rect2.top ? rect.top - rect2.top : rect.left - rect2.left;
                }
            };

            class ScaledLayoutParams extends ViewGroup.LayoutParams {
                public static final float SCALE_UNSPECIFIED = -1.0f;
                public float scaleEndCol;
                public float scaleEndRow;
                public float scaleStartCol;
                public float scaleStartRow;

                ScaledLayoutParams(float f, float f2, float f3, float f4) {
                    super(-1, -1);
                    this.scaleStartRow = f;
                    this.scaleEndRow = f2;
                    this.scaleStartCol = f3;
                    this.scaleEndCol = f4;
                }

                ScaledLayoutParams(Context context, AttributeSet attributeSet) {
                    super(-1, -1);
                }
            }

            ScaledLayout(Context context) {
                super(context);
            }

            /* access modifiers changed from: protected */
            public boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
                return layoutParams instanceof ScaledLayoutParams;
            }

            public void dispatchDraw(Canvas canvas) {
                int paddingLeft = getPaddingLeft();
                int paddingTop = getPaddingTop();
                int childCount = getChildCount();
                for (int i = 0; i < childCount; i++) {
                    View childAt = getChildAt(i);
                    if (childAt.getVisibility() != 8) {
                        if (i < this.mRectArray.length) {
                            int i2 = this.mRectArray[i].left + paddingLeft;
                            int i3 = this.mRectArray[i].top + paddingTop;
                            int save = canvas.save();
                            canvas.translate((float) i2, (float) i3);
                            childAt.draw(canvas);
                            canvas.restoreToCount(save);
                        } else {
                            return;
                        }
                    }
                }
            }

            public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
                return new ScaledLayoutParams(getContext(), attributeSet);
            }

            /* access modifiers changed from: protected */
            public void onLayout(boolean z, int i, int i2, int i3, int i4) {
                int paddingLeft = getPaddingLeft();
                int paddingTop = getPaddingTop();
                int childCount = getChildCount();
                for (int i5 = 0; i5 < childCount; i5++) {
                    View childAt = getChildAt(i5);
                    if (childAt.getVisibility() != 8) {
                        childAt.layout(this.mRectArray[i5].left + paddingLeft, this.mRectArray[i5].top + paddingTop, this.mRectArray[i5].right + paddingTop, this.mRectArray[i5].bottom + paddingLeft);
                    }
                }
            }

            /* access modifiers changed from: protected */
            public void onMeasure(int i, int i2) {
                int i3;
                int size = MeasureSpec.getSize(i);
                int size2 = MeasureSpec.getSize(i2);
                int paddingLeft = (size - getPaddingLeft()) - getPaddingRight();
                int paddingTop = (size2 - getPaddingTop()) - getPaddingBottom();
                int childCount = getChildCount();
                this.mRectArray = new Rect[childCount];
                int i4 = 0;
                while (i4 < childCount) {
                    View childAt = getChildAt(i4);
                    ViewGroup.LayoutParams layoutParams = childAt.getLayoutParams();
                    if (layoutParams instanceof ScaledLayoutParams) {
                        ScaledLayoutParams scaledLayoutParams = (ScaledLayoutParams) layoutParams;
                        float f = scaledLayoutParams.scaleStartRow;
                        float f2 = scaledLayoutParams.scaleEndRow;
                        float f3 = scaledLayoutParams.scaleStartCol;
                        float f4 = scaledLayoutParams.scaleEndCol;
                        if (f >= 0.0f) {
                            int i5 = (f > 1.0f ? 1 : (f == 1.0f ? 0 : -1));
                            if (i5 <= 0) {
                                if (f2 < f || i5 > 0) {
                                    throw new RuntimeException("A child of ScaledLayout should have a range of scaleEndRow between scaleStartRow and 1");
                                }
                                if (f4 >= 0.0f) {
                                    int i6 = (f4 > 1.0f ? 1 : (f4 == 1.0f ? 0 : -1));
                                    if (i6 <= 0) {
                                        if (f4 < f3 || i6 > 0) {
                                            throw new RuntimeException("A child of ScaledLayout should have a range of scaleEndCol between scaleStartCol and 1");
                                        }
                                        float f5 = (float) paddingLeft;
                                        int i7 = paddingLeft;
                                        float f6 = (float) paddingTop;
                                        int i8 = size;
                                        int i9 = size2;
                                        int i10 = childCount;
                                        this.mRectArray[i4] = new Rect((int) (f3 * f5), (int) (f * f6), (int) (f4 * f5), (int) (f2 * f6));
                                        int makeMeasureSpec = MeasureSpec.makeMeasureSpec((int) (f5 * (f4 - f3)), 1073741824);
                                        childAt.measure(makeMeasureSpec, MeasureSpec.makeMeasureSpec(0, 0));
                                        if (childAt.getMeasuredHeight() > this.mRectArray[i4].height()) {
                                            int measuredHeight = ((childAt.getMeasuredHeight() - this.mRectArray[i4].height()) + 1) / 2;
                                            Rect rect = this.mRectArray[i4];
                                            rect.bottom += measuredHeight;
                                            Rect rect2 = this.mRectArray[i4];
                                            rect2.top -= measuredHeight;
                                            if (this.mRectArray[i4].top < 0) {
                                                Rect rect3 = this.mRectArray[i4];
                                                rect3.bottom -= this.mRectArray[i4].top;
                                                this.mRectArray[i4].top = 0;
                                            }
                                            if (this.mRectArray[i4].bottom > paddingTop) {
                                                Rect rect4 = this.mRectArray[i4];
                                                rect4.top -= this.mRectArray[i4].bottom - paddingTop;
                                                this.mRectArray[i4].bottom = paddingTop;
                                            }
                                        }
                                        childAt.measure(makeMeasureSpec, MeasureSpec.makeMeasureSpec((int) (f6 * (f2 - f)), 1073741824));
                                        i4++;
                                        paddingLeft = i7;
                                        size = i8;
                                        size2 = i9;
                                        childCount = i10;
                                    }
                                }
                                throw new RuntimeException("A child of ScaledLayout should have a range of scaleStartCol between 0 and 1");
                            }
                        }
                        throw new RuntimeException("A child of ScaledLayout should have a range of scaleStartRow between 0 and 1");
                    }
                    throw new RuntimeException("A child of ScaledLayout cannot have the UNSPECIFIED scale factors");
                }
                int i11 = size;
                int i12 = size2;
                int i13 = childCount;
                int[] iArr = new int[i13];
                Rect[] rectArr = new Rect[i13];
                int i14 = 0;
                for (int i15 = 0; i15 < i13; i15++) {
                    if (getChildAt(i15).getVisibility() == 0) {
                        iArr[i14] = i14;
                        rectArr[i14] = this.mRectArray[i15];
                        i14++;
                    }
                }
                Arrays.sort(rectArr, 0, i14, this.mRectTopLeftSorter);
                int i16 = 0;
                while (true) {
                    i3 = i14 - 1;
                    if (i16 >= i3) {
                        break;
                    }
                    int i17 = i16 + 1;
                    for (int i18 = i17; i18 < i14; i18++) {
                        if (Rect.intersects(rectArr[i16], rectArr[i18])) {
                            iArr[i18] = iArr[i16];
                            rectArr[i18].set(rectArr[i18].left, rectArr[i16].bottom, rectArr[i18].right, rectArr[i16].bottom + rectArr[i18].height());
                        }
                    }
                    i16 = i17;
                }
                while (i3 >= 0) {
                    if (rectArr[i3].bottom > paddingTop) {
                        int i19 = rectArr[i3].bottom - paddingTop;
                        for (int i20 = 0; i20 <= i3; i20++) {
                            if (iArr[i3] == iArr[i20]) {
                                rectArr[i20].set(rectArr[i20].left, rectArr[i20].top - i19, rectArr[i20].right, rectArr[i20].bottom - i19);
                            }
                        }
                    }
                    i3--;
                }
                setMeasuredDimension(i11, i12);
            }
        }

        Cea708CCWidget(Cea708CaptionRenderer cea708CaptionRenderer, Context context) {
            this(cea708CaptionRenderer, context, null);
        }

        Cea708CCWidget(Cea708CaptionRenderer cea708CaptionRenderer, Context context, AttributeSet attributeSet) {
            this(cea708CaptionRenderer, context, attributeSet, 0);
        }

        Cea708CCWidget(Cea708CaptionRenderer cea708CaptionRenderer, Context context, AttributeSet attributeSet, int i) {
            this(context, attributeSet, i, 0);
        }

        Cea708CCWidget(Context context, AttributeSet attributeSet, int i, int i2) {
            super(context, attributeSet, i, i2);
            this.mCCHandler = new CCHandler((CCLayout) this.mClosedCaptionLayout);
        }

        public ClosedCaptionLayout createCaptionLayout(Context context) {
            return new CCLayout(context);
        }

        public void emitEvent(CaptionEvent captionEvent) {
            this.mCCHandler.processCaptionEvent(captionEvent);
            setSize(getWidth(), getHeight());
            if (this.mListener != null) {
                this.mListener.onChanged(this);
            }
        }

        public void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            ((ViewGroup) this.mClosedCaptionLayout).draw(canvas);
        }
    }

    static class Cea708CaptionTrack extends SubtitleTrack {
        private final Cea708CCParser mCCParser = new Cea708CCParser(this.mRenderingWidget);
        private final Cea708CCWidget mRenderingWidget;

        Cea708CaptionTrack(Cea708CCWidget cea708CCWidget, MediaFormat mediaFormat) {
            super(mediaFormat);
            this.mRenderingWidget = cea708CCWidget;
        }

        public RenderingWidget getRenderingWidget() {
            return this.mRenderingWidget;
        }

        public void onData(byte[] bArr, boolean z, long j) {
            this.mCCParser.parse(bArr);
        }

        public void updateView(ArrayList<Cue> arrayList) {
        }
    }

    public Cea708CaptionRenderer(Context context) {
        this.mContext = context;
    }

    public SubtitleTrack createTrack(MediaFormat mediaFormat) {
        if (SubtitleData2.MIMETYPE_TEXT_CEA_708.equals(mediaFormat.getString("mime"))) {
            if (this.mCCWidget == null) {
                this.mCCWidget = new Cea708CCWidget(this, this.mContext);
            }
            return new Cea708CaptionTrack(this.mCCWidget, mediaFormat);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("No matching format: ");
        sb.append(mediaFormat.toString());
        throw new RuntimeException(sb.toString());
    }

    public boolean supports(MediaFormat mediaFormat) {
        if (!mediaFormat.containsKey("mime")) {
            return false;
        }
        return SubtitleData2.MIMETYPE_TEXT_CEA_708.equals(mediaFormat.getString("mime"));
    }
}
