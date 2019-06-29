package com.android.camera.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.preference.Preference;
import android.text.TextUtils;
import android.text.TextUtils.TruncateAt;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.R;

public class ValuePreference extends Preference {
    private int mExtraPaddingEnd;
    private String mLabels;
    private int mMaxEms;
    private boolean mShowArrow;

    public ValuePreference(Context context) {
        this(context, null);
    }

    public ValuePreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.ValuePreference, 0, 0);
        this.mLabels = obtainStyledAttributes.getString(1);
        this.mShowArrow = obtainStyledAttributes.getBoolean(0, true);
        this.mMaxEms = obtainStyledAttributes.getInt(2, -1);
        this.mExtraPaddingEnd = context.getResources().getDimensionPixelSize(R.dimen.preference_entry_padding_end);
        obtainStyledAttributes.recycle();
        setLayoutResource(R.layout.preference_value_list);
    }

    public ValuePreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    /* access modifiers changed from: protected */
    public void onBindView(View view) {
        super.onBindView(view);
        TextView textView = (TextView) view.findViewById(R.id.value_right);
        ImageView imageView = (ImageView) view.findViewById(R.id.arrow_right);
        if (textView != null) {
            if (this.mMaxEms != -1) {
                textView.setEllipsize(TruncateAt.END);
                textView.setMaxEms(this.mMaxEms);
                textView.setSingleLine();
            }
            if (!TextUtils.isEmpty(this.mLabels)) {
                textView.setText(String.valueOf(this.mLabels));
                textView.setVisibility(0);
            } else {
                textView.setVisibility(8);
            }
        }
        if (imageView == null) {
            return;
        }
        if (this.mShowArrow) {
            imageView.setVisibility(0);
        } else {
            imageView.setVisibility(4);
        }
    }

    public void setValue(String str) {
        if (!TextUtils.equals(str, this.mLabels)) {
            this.mLabels = str;
            notifyChanged();
        }
    }
}
