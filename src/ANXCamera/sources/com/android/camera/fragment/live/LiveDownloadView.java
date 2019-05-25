package com.android.camera.fragment.live;

import android.content.Context;
import android.util.AttributeSet;
import com.android.camera.fragment.sticker.download.DownloadView;
import com.oneplus.camera.R;

public class LiveDownloadView extends DownloadView {
    public LiveDownloadView(Context context) {
        super(context);
    }

    public LiveDownloadView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    /* access modifiers changed from: protected */
    public float getAlphaNormal() {
        return 0.9f;
    }

    /* access modifiers changed from: protected */
    public int getStateImageResource(int i) {
        if (i == 0) {
            return R.drawable.icon_live_sticker_download;
        }
        switch (i) {
            case 2:
                return R.drawable.icon_live_sticker_downloading;
            case 3:
                return R.drawable.icon_live_sticker_downloaded;
            case 4:
                return R.drawable.icon_live_sticker_download;
            default:
                return 0;
        }
    }
}
