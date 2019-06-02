package com.android.zxing;

import android.text.TextUtils;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.common.HybridBinarizer;
import io.reactivex.BackpressureStrategy;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.schedulers.Schedulers;
import io.reactivex.subjects.PublishSubject;
import java.util.ArrayList;
import java.util.HashMap;

public class QrDecoder extends Decoder {
    public static final String TAG = "QrDecoder";
    private final MultiFormatReader mMultiFormatReader;
    private String mScanResult;

    QrDecoder() {
        this.mScanResult = "";
        this.mSubjects = PublishSubject.create();
        this.mMultiFormatReader = new MultiFormatReader();
        HashMap hashMap = new HashMap(1);
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(DecodeFormats.QR_CODE_FORMATS);
        hashMap.put(DecodeHintType.POSSIBLE_FORMATS, arrayList);
        this.mMultiFormatReader.setHints(hashMap);
        this.mDecodeDisposable = this.mSubjects.toFlowable(BackpressureStrategy.LATEST).observeOn(Schedulers.computation()).map(new Function() {
            public final Object apply(Object obj) {
                return QrDecoder.lambda$new$0(QrDecoder.this, (PreviewImage) obj);
            }
        }).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer() {
            public final void accept(Object obj) {
                QrDecoder.lambda$new$1(QrDecoder.this, (String) obj);
            }
        });
        this.mEnable = true;
    }

    public static /* synthetic */ String lambda$new$0(QrDecoder qrDecoder, PreviewImage previewImage) throws Exception {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("decode E: previewImage is null? ");
        sb.append(previewImage == null);
        Log.d(str, sb.toString());
        return qrDecoder.decode(previewImage);
    }

    public static /* synthetic */ void lambda$new$1(QrDecoder qrDecoder, String str) throws Exception {
        boolean equals;
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("decode X: result = ");
        sb.append(str);
        Log.d(str2, sb.toString());
        if (TextUtils.isEmpty(str)) {
            qrDecoder.mDecoding = true;
            equals = qrDecoder.mScanResult.isEmpty();
        } else {
            qrDecoder.mDecoding = false;
            equals = qrDecoder.mScanResult.equals(str);
        }
        if (!equals) {
            qrDecoder.mScanResult = str;
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            if (!qrDecoder.mDecoding) {
                bottomPopupTips.showQrCodeTip();
            } else {
                bottomPopupTips.hideQrCodeTip();
            }
        }
    }

    /* access modifiers changed from: protected */
    public String decode(PreviewImage previewImage) {
        byte[] bArr;
        String str = "";
        if (previewImage == null || previewImage.getData() == null || previewImage.getData().length == 0 || previewImage.getWidth() == 0 || previewImage.getHeight() == 0) {
            return str;
        }
        byte[] data = previewImage.getData();
        int width = previewImage.getWidth();
        int height = previewImage.getHeight();
        int i = width * height;
        byte[] bArr2 = new byte[i];
        if (data.length > i) {
            System.arraycopy(data, 0, bArr2, 0, bArr2.length);
            bArr = bArr2;
        } else {
            bArr = data;
        }
        YUVLuminanceSource yUVLuminanceSource = new YUVLuminanceSource(bArr, width, height, 0, 0, width, height);
        try {
            Result decodeWithState = this.mMultiFormatReader.decodeWithState(new BinaryBitmap(new HybridBinarizer(yUVLuminanceSource)));
            if (decodeWithState != null) {
                str = decodeWithState.getText();
            }
        } catch (Exception e) {
            Log.w(TAG, "decode: failed...  ");
        } catch (Throwable th) {
            this.mMultiFormatReader.reset();
            throw th;
        }
        this.mMultiFormatReader.reset();
        return str;
    }

    public String getScanResult() {
        return this.mScanResult;
    }

    public void init(int i) {
    }

    public void onPreviewFrame(PreviewImage previewImage) {
        if (this.mSubjects != null) {
            this.mSubjects.onNext(previewImage);
        }
    }

    public void reset() {
    }

    public void resetScanResult() {
        this.mDecoding = true;
        this.mScanResult = "";
    }

    public void startDecode() {
        this.mDecoding = true;
        this.mDecodingCount.set(0);
    }
}
