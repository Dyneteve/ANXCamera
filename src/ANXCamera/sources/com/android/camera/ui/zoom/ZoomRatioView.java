package com.android.camera.ui.zoom;

import android.content.Context;
import android.text.SpannableStringBuilder;
import android.text.style.TextAppearanceSpan;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.R;
import com.android.camera.Util;

public class ZoomRatioView extends FrameLayout {
    private static final String TAG = "ZoomRatioView";
    private static final boolean UI_DEBUG_ENABLED = false;
    private TextAppearanceSpan mDigitsTextStyle;
    private TextAppearanceSpan mSnapStyle;
    private TextAppearanceSpan mXTextStyle;
    private ImageView mZoomRatioIcon;
    private int mZoomRatioIndex;
    private TextView mZoomRatioText;

    public ZoomRatioView(Context context) {
        this(context, null);
    }

    public ZoomRatioView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public ZoomRatioView(Context context, AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, 0);
    }

    public ZoomRatioView(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        init();
    }

    private static void debugUi(String str, String str2) {
    }

    private void init() {
        this.mDigitsTextStyle = new TextAppearanceSpan(getContext(), R.style.ZoomButtonDigitsTextStyle);
        this.mXTextStyle = new TextAppearanceSpan(getContext(), R.style.ZoomButtonXTextStyle);
        this.mSnapStyle = new TextAppearanceSpan(getContext(), R.style.SnapTipTextStyle);
    }

    public float getAlpha() {
        return this.mZoomRatioIcon.getAlpha();
    }

    public ImageView getIconView() {
        return this.mZoomRatioIcon;
    }

    public TextView getTextView() {
        return this.mZoomRatioText;
    }

    public int getZoomRatioIndex() {
        return this.mZoomRatioIndex;
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mZoomRatioIcon = (ImageView) findViewById(R.id.zoom_ratio_item_image);
        this.mZoomRatioText = (TextView) findViewById(R.id.zoom_ratio_item_text);
    }

    public void setAlpha(float f) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setAlpha(): index = ");
        sb.append(this.mZoomRatioIndex);
        sb.append(", alpha = ");
        sb.append(f);
        debugUi(str, sb.toString());
        this.mZoomRatioIcon.setAlpha(f);
        this.mZoomRatioText.setAlpha(1.0f - f);
    }

    public void setCaptureCount(int i) {
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        Util.appendInApi26(spannableStringBuilder, String.format("%02d", new Object[]{Integer.valueOf(i)}), this.mSnapStyle, 33);
        this.mZoomRatioText.setText(spannableStringBuilder);
    }

    public void setIconify(boolean z) {
        setAlpha(z ? 1.0f : 0.0f);
    }

    public void setVisibility(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setVisibility(): index = ");
        sb.append(this.mZoomRatioIndex);
        sb.append(", visibility = ");
        sb.append(Util.viewVisibilityToString(i));
        debugUi(str, sb.toString());
        super.setVisibility(i);
    }

    public void setZoomRatio(float f) {
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        float decimal = HybridZoomingSystem.toDecimal(f);
        int i = (int) decimal;
        if (((int) ((10.0f * decimal) - ((float) (i * 10)))) == 0) {
            Util.appendInApi26(spannableStringBuilder, String.valueOf(i), this.mDigitsTextStyle, 33);
        } else {
            Util.appendInApi26(spannableStringBuilder, String.valueOf(decimal), this.mDigitsTextStyle, 33);
        }
        Util.appendInApi26(spannableStringBuilder, "X", this.mXTextStyle, 33);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setZoomRatio(): ");
        sb.append(f);
        debugUi(str, sb.toString());
        this.mZoomRatioText.setText(spannableStringBuilder);
    }

    public void setZoomRatioIndex(int i) {
        this.mZoomRatioIndex = i;
    }
}
