package com.android.camera;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.view.Surface;
import com.android.camera.log.Log;
import com.android.camera.storage.ImageSaver;
import com.mi.config.b;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.PostProcessor;
import com.xiaomi.camera.core.PostProcessor.PostProcessStatusCallback;
import com.xiaomi.camera.imagecodec.JpegEncoder;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.MiCameraAlgo;
import com.xiaomi.protocol.ICustomCaptureResult;
import com.xiaomi.protocol.IImageReaderParameterSets;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class LocalParallelService extends Service {
    /* access modifiers changed from: private */
    public static final String TAG = LocalParallelService.class.getSimpleName();
    /* access modifiers changed from: private */
    public LocalBinder mLocalBinder;
    /* access modifiers changed from: private */
    public PostProcessStatusCallback mPostProcessStatusCallback = new PostProcessStatusCallback() {
        public void onImagePostProcessStart(ParallelTaskData parallelTaskData) {
            if (LocalParallelService.this.mServiceStatusListenerRef != null && LocalParallelService.this.mServiceStatusListenerRef.get() != null) {
                ((ServiceStatusListener) LocalParallelService.this.mServiceStatusListenerRef.get()).onImagePostProcessStart(parallelTaskData);
            }
        }

        public void onPostProcessorClosed(PostProcessor postProcessor) {
            if (LocalParallelService.this.mLocalBinder != null) {
                LocalParallelService.this.mLocalBinder.onPostProcessorClosed(postProcessor);
            }
        }
    };
    /* access modifiers changed from: private */
    public WeakReference<ServiceStatusListener> mServiceStatusListenerRef;

    public class LocalBinder extends Binder {
        private List<PostProcessor> mAlivePostProcessor = new ArrayList();
        private BufferFormat mCurrentBufferFormat;
        private List<IImageReaderParameterSets> mCurrentParams;
        private PostProcessor mCurrentPostProcessor;

        LocalBinder() {
            JpegEncoder.instance().init(LocalParallelService.this);
            if (b.rF) {
                JpegEncoder.instance().setVTCameraIds("5", "6");
            }
            MiCameraAlgo.init(LocalParallelService.this);
        }

        private boolean isSetsEquals(List<IImageReaderParameterSets> list, List<IImageReaderParameterSets> list2) {
            boolean z = false;
            if (list == null || list2 == null || list.size() != list2.size()) {
                return false;
            }
            int i = 0;
            for (IImageReaderParameterSets iImageReaderParameterSets : list) {
                Iterator it = list2.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    } else if (iImageReaderParameterSets.equals((IImageReaderParameterSets) it.next())) {
                        i++;
                        break;
                    }
                }
            }
            if (list.size() == i) {
                z = true;
            }
            return z;
        }

        /* access modifiers changed from: private */
        public void onPostProcessorClosed(PostProcessor postProcessor) {
            this.mAlivePostProcessor.remove(postProcessor);
        }

        public List<Surface> configCaptureOutputBuffer(@NonNull List<IImageReaderParameterSets> list) throws RemoteException {
            if (list.isEmpty()) {
                throw new RemoteException("List is empty");
            } else if (!isSetsEquals(list, this.mCurrentParams) || this.mCurrentPostProcessor == null || this.mCurrentPostProcessor.getSurfaceList().isEmpty()) {
                if (this.mCurrentPostProcessor != null) {
                    this.mCurrentPostProcessor.destroyWhenTasksFinished();
                }
                this.mCurrentParams = list;
                this.mCurrentPostProcessor = new PostProcessor(LocalParallelService.this, LocalParallelService.this.mPostProcessStatusCallback);
                String access$300 = LocalParallelService.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("configCaptureOutputBuffer: create a new PostProcessor: ");
                sb.append(this.mCurrentPostProcessor);
                Log.d(access$300, sb.toString());
                this.mCurrentBufferFormat = null;
                this.mAlivePostProcessor.add(this.mCurrentPostProcessor);
                return this.mCurrentPostProcessor.configHALOutputSurface(list);
            } else {
                Log.d(LocalParallelService.TAG, "configCaptureOutputBuffer: sets is not changed, return the old.");
                return this.mCurrentPostProcessor.getSurfaceList();
            }
        }

        public void configCaptureSession(@NonNull BufferFormat bufferFormat) {
            if (!bufferFormat.equals(this.mCurrentBufferFormat)) {
                this.mCurrentBufferFormat = bufferFormat;
                long currentTimeMillis = System.currentTimeMillis();
                this.mCurrentPostProcessor.configCaptureSession(this.mCurrentBufferFormat);
                String access$300 = LocalParallelService.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("configCaptureSession: create session cost: ");
                sb.append(System.currentTimeMillis() - currentTimeMillis);
                Log.d(access$300, sb.toString());
                return;
            }
            Log.d(LocalParallelService.TAG, "current BufferFormat is equals last BufferFormat, so need not re-config, returned.");
        }

        public boolean isIdle() {
            for (PostProcessor isIdle : this.mAlivePostProcessor) {
                if (!isIdle.isIdle()) {
                    return false;
                }
            }
            return true;
        }

        public boolean needWaitProcess() {
            return this.mCurrentPostProcessor.needWaitImageClose() || this.mCurrentPostProcessor.needWaitAlgorithmEngine();
        }

        public void onCaptureCompleted(ICustomCaptureResult iCustomCaptureResult, boolean z) {
            this.mCurrentPostProcessor.getCaptureStatusListener().onCaptureCompleted(iCustomCaptureResult, z);
        }

        public void onCaptureFailed(long j, int i) {
            this.mCurrentPostProcessor.getCaptureStatusListener().onCaptureFailed(j, i);
        }

        public void onCaptureStarted(ParallelTaskData parallelTaskData) {
            this.mCurrentPostProcessor.getCaptureStatusListener().onCaptureStarted(parallelTaskData);
        }

        public void onServiceDestroy() {
            JpegEncoder.instance().deInit();
            MiCameraAlgo.deInit();
        }

        public void setImageSaver(ImageSaver imageSaver) {
            this.mCurrentPostProcessor.setImageSaver(imageSaver);
        }

        public void setJpegOutputSize(int i, int i2) {
            JpegEncoder.instance().setJpegOutputSize(i, i2);
        }

        public void setOnPictureTakenListener(ServiceStatusListener serviceStatusListener) {
            LocalParallelService.this.mServiceStatusListenerRef = new WeakReference(serviceStatusListener);
        }
    }

    public interface ServiceStatusListener {
        void onImagePostProcessStart(ParallelTaskData parallelTaskData);
    }

    public IBinder onBind(Intent intent) {
        Log.d(TAG, "onBind: start");
        return this.mLocalBinder;
    }

    public void onCreate() {
        Log.d(TAG, "onCreate: start");
        this.mLocalBinder = new LocalBinder();
        super.onCreate();
    }

    public void onDestroy() {
        Log.d(TAG, "onDestroy: start");
        this.mLocalBinder.onServiceDestroy();
        this.mLocalBinder = null;
        super.onDestroy();
    }

    public int onStartCommand(Intent intent, int i, int i2) {
        Log.d(TAG, "onStartCommand: start");
        return super.onStartCommand(intent, i, i2);
    }

    public boolean onUnbind(Intent intent) {
        Log.d(TAG, "onUnbind: start");
        return super.onUnbind(intent);
    }
}
