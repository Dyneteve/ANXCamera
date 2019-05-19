package com.xiaomi.camera.processor;

import android.media.Image;
import android.support.annotation.NonNull;
import com.android.camera.groupshot.GroupShot;
import com.android.camera.log.Log;
import com.xiaomi.camera.core.CaptureData;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.core.CaptureDataListener;
import com.xiaomi.camera.imagecodec.ImagePool;
import com.xiaomi.camera.imagecodec.ImagePool.ImageFormat;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.List;

public class GroupShotProcessor implements AlgoProcessor {
    private static final int GROUP_SHOT_MAX_FACE_NUM = 10;
    private static final String TAG = GroupShotProcessor.class.getSimpleName();
    private GroupShot mGroupShot;

    public GroupShotProcessor() {
        if (this.mGroupShot == null || this.mGroupShot.isUsed()) {
            this.mGroupShot = new GroupShot();
        }
    }

    private void onImageAvailable(CaptureData captureData, CaptureDataBean captureDataBean, ProcessResultListener processResultListener) {
        captureDataBean.getMainImage().setTimestamp(captureDataBean.getResult().getTimeStamp());
        captureData.setMultiFrameProcessResult(captureDataBean);
        processResultListener.onProcessFinished(captureData, false);
    }

    private void prepareGroupShot(int i, int i2, int i3) {
        this.mGroupShot.initialize(i, 10, i2, i3, i2, i3);
        this.mGroupShot.attach_start(0);
    }

    public void doProcess(@NonNull CaptureData captureData, ProcessResultListener processResultListener) {
        List<CaptureDataBean> captureDataBeanList = captureData.getCaptureDataBeanList();
        if (captureDataBeanList == null || captureDataBeanList.isEmpty()) {
            throw new IllegalArgumentException("taskBeanList is not allow to be empty!");
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("doProcess>>dataNum=");
        sb.append(captureDataBeanList.size());
        Log.d(str, sb.toString());
        long currentTimeMillis = System.currentTimeMillis();
        CaptureDataBean captureDataBean = (CaptureDataBean) captureDataBeanList.get(0);
        Image mainImage = captureDataBean.getMainImage();
        prepareGroupShot(captureDataBeanList.size(), mainImage.getWidth(), mainImage.getHeight());
        for (int i = 0; i < captureDataBeanList.size(); i++) {
            this.mGroupShot.attach(((CaptureDataBean) captureDataBeanList.get(i)).getMainImage());
        }
        int attach_end = this.mGroupShot.attach_end();
        Log.v(TAG, String.format("doProcess: attachEnd=0x%x", new Object[]{Integer.valueOf(attach_end)}));
        int baseImage = this.mGroupShot.setBaseImage(0);
        Log.v(TAG, String.format("doProcess: setBaseImage=0x%x", new Object[]{Integer.valueOf(baseImage)}));
        int bestFace = this.mGroupShot.setBestFace();
        Log.v(TAG, String.format("doProcess: setBaseFace=0x%x", new Object[]{Integer.valueOf(bestFace)}));
        CaptureDataBean captureDataBean2 = new CaptureDataBean(captureData.getStreamNum());
        ICustomCaptureResult result = ((CaptureDataBean) captureDataBeanList.get(captureDataBeanList.size() - 1)).getResult();
        captureDataBean2.setCaptureResult(result, true);
        long timeStamp = result.getTimeStamp();
        Image anEmptyImage = ImagePool.getInstance().getAnEmptyImage(new ImageFormat(mainImage.getWidth(), mainImage.getHeight(), mainImage.getFormat()));
        anEmptyImage.setTimestamp(timeStamp);
        this.mGroupShot.getYuvImage(anEmptyImage);
        ImagePool.getInstance().queueImage(anEmptyImage);
        Image image = ImagePool.getInstance().getImage(timeStamp);
        captureDataBean2.setImage(image, 0);
        ImagePool.getInstance().holdImage(image);
        CaptureDataListener captureDataListener = captureData.getCaptureDataListener();
        for (CaptureDataBean captureDataBean3 : captureDataBeanList) {
            Image mainImage2 = captureDataBean3.getMainImage();
            if (!captureData.isSaveInputImage() || captureDataBean3 != captureDataBean) {
                mainImage2.close();
                captureDataListener.onOriginalImageClosed(mainImage2);
            }
        }
        captureDataBeanList.clear();
        if (captureData.isSaveInputImage()) {
            Image mainImage3 = captureDataBean.getMainImage();
            captureDataListener.onOriginalImageClosed(mainImage3);
            long timestamp = mainImage3.getTimestamp();
            ImagePool.getInstance().queueImage(mainImage3);
            Image image2 = ImagePool.getInstance().getImage(timestamp);
            ImagePool.getInstance().holdImage(image2);
            captureDataBean.setMainImage(image2);
            captureDataBeanList.add(captureDataBean);
            result.setSequenceId((int) (((long) result.getSequenceId()) + result.getFrameNumber()));
            ICustomCaptureResult result2 = captureDataBean.getResult();
            result2.setSequenceId((int) (((long) result2.getSequenceId()) + result2.getFrameNumber()));
        }
        onImageAvailable(captureData, captureDataBean2, processResultListener);
        this.mGroupShot.clearImages();
        this.mGroupShot.finish();
        this.mGroupShot = null;
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("doProcess<<cost=");
        sb2.append(System.currentTimeMillis() - currentTimeMillis);
        Log.d(str2, sb2.toString());
    }
}
