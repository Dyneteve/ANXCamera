package com.xiaomi.camera.processor;

import android.media.Image;
import android.support.annotation.NonNull;
import com.android.camera.log.Log;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.CaptureData;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.core.CaptureDataListener;
import com.xiaomi.camera.imagecodec.ImagePool;
import com.xiaomi.camera.imagecodec.ImagePool.ImageFormat;
import com.xiaomi.engine.FrameData;
import com.xiaomi.engine.MiaNodeJNI;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.ArrayList;
import java.util.List;

public class ClearShotProcessor implements AlgoProcessor {
    private static final String TAG = ClearShotProcessor.class.getSimpleName();

    private void onImageAvailable(CaptureData captureData, CaptureDataBean captureDataBean, ProcessResultListener processResultListener) {
        captureData.setMultiFrameProcessResult(captureDataBean);
        processResultListener.onProcessFinished(captureData, true);
    }

    public void doProcess(@NonNull CaptureData captureData, ProcessResultListener processResultListener) {
        Log.d(TAG, "doProcess: start process capture data");
        List<CaptureDataBean> captureDataBeanList = captureData.getCaptureDataBeanList();
        if (captureDataBeanList == null || captureDataBeanList.isEmpty()) {
            throw new IllegalArgumentException("taskBeanList is not allow to be empty!");
        }
        CaptureDataBean captureDataBean = new CaptureDataBean(captureData.getStreamNum());
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("doProcess: dataNum = ");
        sb.append(captureDataBeanList.size());
        Log.d(str, sb.toString());
        PerformanceTracker.trackAlgorithmProcess("[CLEARSHOT]", 0);
        ArrayList arrayList = new ArrayList();
        for (CaptureDataBean captureDataBean2 : captureDataBeanList) {
            FrameData frameData = new FrameData(0, captureDataBean2.getResult().getSequenceId(), captureDataBean2.getResult().getFrameNumber(), captureDataBean2.getResult().getResults(), captureDataBean2.getMainImage());
            arrayList.add(frameData);
        }
        Image mainImage = ((CaptureDataBean) captureDataBeanList.get(0)).getMainImage();
        Image anEmptyImage = ImagePool.getInstance().getAnEmptyImage(new ImageFormat(mainImage.getWidth(), mainImage.getHeight(), mainImage.getFormat()));
        int process = MiaNodeJNI.getInstance().process(arrayList, anEmptyImage, 2, captureData.getStreamNum() == 2);
        if (process > arrayList.size() || process < 0) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("doProcess: returned a error baseIndex: ");
            sb2.append(process);
            Log.w(str2, sb2.toString());
            process = 0;
        }
        PerformanceTracker.trackAlgorithmProcess("[CLEARSHOT]", 1);
        String str3 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("doProcess: clearShot done. baseIndex: ");
        sb3.append(process);
        Log.d(str3, sb3.toString());
        CaptureDataBean captureDataBean3 = (CaptureDataBean) captureDataBeanList.get(process);
        ICustomCaptureResult result = captureDataBean3.getResult();
        long timeStamp = result.getTimeStamp();
        anEmptyImage.setTimestamp(timeStamp);
        ImagePool.getInstance().queueImage(anEmptyImage);
        Image image = ImagePool.getInstance().getImage(timeStamp);
        captureDataBean.setImage(image, 0);
        ImagePool.getInstance().holdImage(image);
        CaptureDataListener captureDataListener = captureData.getCaptureDataListener();
        for (CaptureDataBean captureDataBean4 : captureDataBeanList) {
            if (captureDataBean4 != captureDataBean3) {
                Image mainImage2 = captureDataBean4.getMainImage();
                mainImage2.close();
                captureDataListener.onOriginalImageClosed(mainImage2);
                Image subImage = captureDataBean4.getSubImage();
                if (subImage != null) {
                    subImage.close();
                    captureDataListener.onOriginalImageClosed(subImage);
                }
            }
        }
        captureDataBeanList.clear();
        Image mainImage3 = captureDataBean3.getMainImage();
        Image subImage2 = captureDataBean3.getSubImage();
        mainImage3.close();
        captureDataListener.onOriginalImageClosed(mainImage3);
        captureDataBean.setCaptureResult(result, true);
        if (subImage2 != null) {
            long timestamp = subImage2.getTimestamp();
            ImagePool.getInstance().queueImage(subImage2);
            Image image2 = ImagePool.getInstance().getImage(timestamp);
            captureDataBean.setImage(image2, 1);
            captureDataListener.onOriginalImageClosed(subImage2);
            if (timestamp != timeStamp) {
                image2.setTimestamp(timeStamp);
            }
            ImagePool.getInstance().holdImage(image2);
        }
        if (captureDataBean.isDataReady()) {
            onImageAvailable(captureData, captureDataBean, processResultListener);
        }
    }
}
