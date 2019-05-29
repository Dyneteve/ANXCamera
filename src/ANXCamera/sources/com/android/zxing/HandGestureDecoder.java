package com.android.zxing;

import android.annotation.SuppressLint;
import android.graphics.Rect;
import android.graphics.YuvImage;
import android.media.Image;
import android.provider.MiuiSettings.ScreenEffect;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.handgesture.HandGesture;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.storage.Storage;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.schedulers.Schedulers;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicInteger;
import miui.os.Environment;

public class HandGestureDecoder extends Decoder {
    /* access modifiers changed from: private */
    public static boolean DEBUG = false;
    /* access modifiers changed from: private */
    public static int DETECTION_FRAMES_PER_SECOND = 16;
    public static final String TAG = "HandGestureDecoder";
    private int mCameraId;
    /* access modifiers changed from: private */
    public AtomicInteger mContinuousInterval = new AtomicInteger(0);
    /* access modifiers changed from: private */
    public HandGesture mHandGesture = new HandGesture();
    /* access modifiers changed from: private */
    public boolean mTargetDetected = false;
    int mTipShowInterval = DETECTION_FRAMES_PER_SECOND;
    /* access modifiers changed from: private */
    public boolean mTipVisible = true;
    /* access modifiers changed from: private */
    public boolean mTriggeringPhoto = false;

    @SuppressLint({"CheckResult"})
    HandGestureDecoder() {
        DECODE_MAX_COUNT = 5000;
        DECODE_AUTO_INTERVAL = (long) (1000 / DETECTION_FRAMES_PER_SECOND);
        this.mEnable = true;
        Flowable.create(new FlowableOnSubscribe<PreviewImage>() {
            public void subscribe(FlowableEmitter<PreviewImage> flowableEmitter) throws Exception {
                HandGestureDecoder.this.mDecodeFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.LATEST).observeOn(Schedulers.single()).map(new Function<PreviewImage, Integer>() {
            public Integer apply(PreviewImage previewImage) {
                switch (previewImage.getPreviewStatus()) {
                    case 1:
                        HandGestureDecoder.this.mHandGesture.init(previewImage.getCameraId());
                        break;
                    case 2:
                        if (!(previewImage.getData() == null || previewImage.getData().length == 0)) {
                            if (HandGestureDecoder.DEBUG) {
                                HandGestureDecoder.this.dumpPreviewImage(previewImage);
                            }
                            return Integer.valueOf(HandGestureDecoder.this.decode(previewImage));
                        }
                    case 3:
                        HandGestureDecoder.this.mHandGesture.unInit();
                        break;
                }
                return Integer.valueOf(-1);
            }
        }).observeOn(AndroidSchedulers.mainThread()).subscribe(new Consumer<Integer>() {
            public void accept(Integer num) throws Exception {
                String str = HandGestureDecoder.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Detected rect left = ");
                sb.append(num);
                sb.append(" ");
                sb.append(HandGestureDecoder.this.mTipShowInterval);
                Log.d(str, sb.toString());
                if (num.intValue() >= 0) {
                    HandGestureDecoder.this.mTargetDetected = true;
                } else {
                    HandGestureDecoder.this.mTargetDetected = false;
                    HandGestureDecoder.this.mContinuousInterval.set(0);
                }
                if (!HandGestureDecoder.this.mTriggeringPhoto) {
                    String str2 = HandGestureDecoder.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Continuous interval: ");
                    sb2.append(HandGestureDecoder.this.mContinuousInterval.get());
                    Log.d(str2, sb2.toString());
                    if (HandGestureDecoder.this.mContinuousInterval.get() > 0) {
                        HandGestureDecoder.this.mContinuousInterval.getAndDecrement();
                    } else if (HandGestureDecoder.this.mTargetDetected) {
                        Log.d(HandGestureDecoder.TAG, "Triggering countdown...");
                        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                        if (cameraAction != null && !cameraAction.isDoingAction()) {
                            cameraAction.onShutterButtonClick(100);
                            HandGestureDecoder.this.mTriggeringPhoto = true;
                            HandGestureDecoder.this.mContinuousInterval.set(3 * HandGestureDecoder.DETECTION_FRAMES_PER_SECOND);
                            DataRepository.dataItemRunning().setHandGestureRunning(!HandGestureDecoder.this.mTriggeringPhoto);
                            HandGestureDecoder.this.mTipVisible = false;
                            HandGestureDecoder.this.mTipShowInterval = HandGestureDecoder.DETECTION_FRAMES_PER_SECOND;
                        }
                    }
                    if (!HandGestureDecoder.this.mTipVisible && HandGestureDecoder.this.mTipShowInterval <= 0) {
                        DataRepository.dataItemRunning().setHandGestureRunning(true);
                        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                        if (topAlert != null && !topAlert.isExtraMenuShowing()) {
                            topAlert.reInitAlert(true);
                        }
                        HandGestureDecoder.this.mTipVisible = true;
                    }
                    if (HandGestureDecoder.this.mTipShowInterval > 0) {
                        HandGestureDecoder.this.mTipShowInterval--;
                    }
                }
            }
        }, new Consumer<Throwable>() {
            public void accept(Throwable th) throws Exception {
                Log.d(HandGestureDecoder.TAG, "onError: ", th);
            }
        });
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0092 A[SYNTHETIC, Splitter:B:23:0x0092] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void dumpPreviewImage(PreviewImage previewImage) {
        FileOutputStream fileOutputStream = null;
        try {
            long timestamp = previewImage.getTimestamp();
            int width = previewImage.getWidth();
            int height = previewImage.getHeight();
            StringBuilder sb = new StringBuilder();
            sb.append(Environment.getExternalStorageDirectory());
            sb.append("/DCIM/Camera/hand_");
            sb.append(String.valueOf(timestamp));
            sb.append(Storage.JPEG_SUFFIX);
            FileOutputStream fileOutputStream2 = new FileOutputStream(sb.toString());
            String str = TAG;
            try {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("PreviewImage timestamp: [");
                sb2.append(timestamp);
                sb2.append("]");
                Log.d(str, sb2.toString());
                YuvImage yuvImage = new YuvImage(previewImage.getData(), 17, width, height, null);
                yuvImage.compressToJpeg(new Rect(0, 0, width, height), 100, fileOutputStream2);
            } catch (IOException e) {
                e = e;
                fileOutputStream = fileOutputStream2;
            } catch (Throwable th) {
                th = th;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                }
                throw th;
            }
            try {
                fileOutputStream2.close();
            } catch (IOException e2) {
                Log.e(TAG, "Close stream failed!", e2);
            }
        } catch (IOException e3) {
            e = e3;
            try {
                Log.e(TAG, "Dump preview Image failed!", e);
                if (fileOutputStream != null) {
                    fileOutputStream.close();
                }
            } catch (Throwable th2) {
                th = th2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (IOException e4) {
                        Log.e(TAG, "Close stream failed!", e4);
                    }
                }
                throw th;
            }
        }
    }

    /* access modifiers changed from: protected */
    public int decode(PreviewImage previewImage) {
        int orientation = previewImage.getOrientation();
        if (orientation == -1) {
            orientation = 0;
        }
        return this.mHandGesture.detectGesture(previewImage.getData(), previewImage.getWidth(), previewImage.getHeight(), this.mCameraId == 1 ? 270 - orientation : (90 + orientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT);
    }

    public void init(int i) {
        reset();
        this.mCameraId = i;
        this.mDecodeFlowableEmitter.onNext(new PreviewImage(1, i));
        DataRepository.dataItemRunning().setHandGestureRunning(true);
    }

    public boolean needPreviewFrame() {
        return super.needPreviewFrame() && CameraSettings.isHandGestureOpen();
    }

    public void onPreviewFrame(Image image, int i) {
        if (needPreviewFrame() && this.mDecodeFlowableEmitter != null) {
            this.mDecodeFlowableEmitter.onNext(new PreviewImage(image, i));
        }
    }

    public void quit() {
        super.quit();
        this.mDecodeFlowableEmitter.onNext(new PreviewImage(3, this.mCameraId));
        this.mDecodeFlowableEmitter.onComplete();
    }

    public void reset() {
        Log.d(TAG, "Reset");
        this.mDecodingCount.set(0);
        this.mTriggeringPhoto = false;
    }

    public void startDecode() {
        this.mDecoding = true;
        this.mDecodingCount.set(0);
    }
}
