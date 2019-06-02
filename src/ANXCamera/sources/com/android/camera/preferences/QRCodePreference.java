package com.android.camera.preferences;

import android.content.Context;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.view.View;
import com.android.camera.CameraSettings;

public class QRCodePreference extends CheckBoxPreference {
    public QRCodePreference(Context context) {
        super(context);
    }

    public QRCodePreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public QRCodePreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    /* access modifiers changed from: protected */
    public boolean callChangeListener(Object obj) {
        if (!Boolean.TRUE.equals(obj) || CameraSettings.isQRCodeReceiverAvailable(getContext())) {
            return super.callChangeListener(obj);
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public void onBindView(View view) {
        super.onBindView(view);
        View findViewById = view.findViewById(16908289);
        if (findViewById != null) {
            findViewById.setEnabled(CameraSettings.isQRCodeReceiverAvailable(getContext()));
        }
    }
}
