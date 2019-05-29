package com.android.zxing;

import com.android.camera.log.Log;
import io.reactivex.functions.Consumer;

/* compiled from: lambda */
/* renamed from: com.android.zxing.-$$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c reason: invalid class name */
public final /* synthetic */ class $$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c implements Consumer {
    public static final /* synthetic */ $$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c INSTANCE = new $$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c();

    private /* synthetic */ $$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c() {
    }

    public final void accept(Object obj) {
        Log.d(QrDecoder.TAG, "onError: ", (Throwable) obj);
    }
}
