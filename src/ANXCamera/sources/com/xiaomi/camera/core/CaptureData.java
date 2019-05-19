package com.xiaomi.camera.core;

import android.media.Image;
import com.android.camera.log.Log;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.ArrayList;
import java.util.List;

public class CaptureData {
    /* access modifiers changed from: private */
    public static final String TAG = CaptureData.class.getSimpleName();
    private int mAlgoType;
    private int mAlreadyDataNum = 0;
    private int mBurstNum;
    private List<CaptureDataBean> mCaptureDataBeanList = new ArrayList();
    private CaptureDataListener mCaptureDataListener;
    private long mCaptureTimestamp;
    private boolean mCapturedByFrontCamera;
    private CaptureDataBean mMultiFrameProcessResult;
    private boolean mSaveInputImage;
    private int mStreamNum;

    public static class CaptureDataBean {
        private boolean mIsFirstResult;
        private Image mMainImage;
        private ICustomCaptureResult mResult;
        private int mStreamNum;
        private Image mSubImage;

        public CaptureDataBean(int i) {
            this.mStreamNum = i;
        }

        public void close() {
            if (this.mMainImage != null) {
                this.mMainImage.close();
                this.mMainImage = null;
            }
            if (this.mSubImage != null) {
                this.mSubImage.close();
                this.mSubImage = null;
            }
        }

        public Image getMainImage() {
            return this.mMainImage;
        }

        public ICustomCaptureResult getResult() {
            return this.mResult;
        }

        public int getStreamNum() {
            return this.mStreamNum;
        }

        public Image getSubImage() {
            return this.mSubImage;
        }

        public boolean isDataReady() {
            boolean z = false;
            if (2 == this.mStreamNum) {
                if (!(this.mResult == null || this.mMainImage == null || this.mSubImage == null)) {
                    z = true;
                }
                return z;
            } else if (1 != this.mStreamNum) {
                return false;
            } else {
                if (!(this.mResult == null || this.mMainImage == null)) {
                    z = true;
                }
                return z;
            }
        }

        public boolean isFirstResult() {
            return this.mIsFirstResult;
        }

        public void setCaptureResult(ICustomCaptureResult iCustomCaptureResult, boolean z) {
            this.mResult = iCustomCaptureResult;
            this.mIsFirstResult = z;
        }

        public void setImage(Image image, int i) {
            if (i == 0) {
                this.mMainImage = image;
            } else if (i == 1) {
                this.mSubImage = image;
            } else {
                String access$000 = CaptureData.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("setImage: unknown imageFlag: ");
                sb.append(i);
                Log.e(access$000, sb.toString());
            }
        }

        public void setMainImage(Image image) {
            this.mMainImage = image;
        }

        public void setStreamNum(int i) {
            this.mStreamNum = i;
        }
    }

    public CaptureData(int i, int i2, int i3, long j) {
        this.mAlgoType = i;
        this.mStreamNum = i2;
        this.mBurstNum = i3;
        this.mCaptureTimestamp = j;
    }

    public int getAlgoType() {
        return this.mAlgoType;
    }

    public int getBurstNum() {
        return this.mBurstNum;
    }

    public List<CaptureDataBean> getCaptureDataBeanList() {
        return this.mCaptureDataBeanList;
    }

    public CaptureDataListener getCaptureDataListener() {
        return this.mCaptureDataListener;
    }

    public long getCaptureTimestamp() {
        return this.mCaptureTimestamp;
    }

    public CaptureDataBean getMultiFrameProcessResult() {
        return this.mMultiFrameProcessResult;
    }

    public int getStreamNum() {
        return this.mStreamNum;
    }

    public boolean isCapturedByFrontCamera() {
        return this.mCapturedByFrontCamera;
    }

    public boolean isDataReady() {
        return this.mAlreadyDataNum == this.mBurstNum;
    }

    public boolean isSaveInputImage() {
        return this.mSaveInputImage;
    }

    public void putCaptureDataBean(CaptureDataBean captureDataBean) {
        this.mCaptureDataBeanList.add(captureDataBean);
        this.mAlreadyDataNum++;
    }

    public void setCapturedByFrontCamera(boolean z) {
        this.mCapturedByFrontCamera = z;
    }

    public void setMultiFrameProcessListener(CaptureDataListener captureDataListener) {
        this.mCaptureDataListener = captureDataListener;
    }

    public void setMultiFrameProcessResult(CaptureDataBean captureDataBean) {
        this.mMultiFrameProcessResult = captureDataBean;
    }

    public void setSaveInputImage(boolean z) {
        this.mSaveInputImage = z;
    }
}
