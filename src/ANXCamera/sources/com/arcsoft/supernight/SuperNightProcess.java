package com.arcsoft.supernight;

import android.graphics.Rect;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.Face;
import android.media.Image;
import android.media.Image.Plane;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

public class SuperNightProcess {
    public static final int ARC_INPUT_IMAGE_COUNT = 8;
    public static final int ARC_SN_CAMERA_MODE_UNKNOWN = -1;
    public static final int ARC_SN_CAMERA_MODE_XIAOMI_G80_GW1 = 1793;
    public static final int ARC_SN_CAMERA_MODE_XIAOMI_G90_GW1 = 1793;
    public static final int ARC_SN_CAMERA_MODE_XIAOMI_SDM855_12MB_IMX586 = 1792;
    public static final int ARC_SN_CAMERA_STATE_HAND = 2;
    public static final int ARC_SN_CAMERA_STATE_UNKNOWN = 0;
    public static final int ARC_SN_MAX_INPUT_IMAGE_NUM = 20;
    public static final int ARC_SN_SCENEMODE_INDOOR = 1;
    public static final int ARC_SN_SCENEMODE_LOWLIGHT = 3;
    public static final int ARC_SN_SCENEMODE_OUTDOOR = 2;
    public static final int ARC_SN_SCENEMODE_PORTRAIT = 4;
    public static final int ARC_SN_SCENEMODE_UNKNOW = 0;
    public static final int ASVL_PAF_NV12 = 2049;
    public static final int ASVL_PAF_NV21 = 2050;
    public static final int ASVL_PAF_RAW10_BGGR_10B = 3332;
    public static final int ASVL_PAF_RAW10_BGGR_16B = 3340;
    public static final int ASVL_PAF_RAW10_GBRG_10B = 3331;
    public static final int ASVL_PAF_RAW10_GBRG_16B = 3339;
    public static final int ASVL_PAF_RAW10_GRAY_10B = 3585;
    public static final int ASVL_PAF_RAW10_GRAY_16B = 3713;
    public static final int ASVL_PAF_RAW10_GRBG_10B = 3330;
    public static final int ASVL_PAF_RAW10_GRBG_16B = 3338;
    public static final int ASVL_PAF_RAW10_RGGB_10B = 3329;
    public static final int ASVL_PAF_RAW10_RGGB_16B = 3337;
    public static final int ASVL_PAF_RAW12_BGGR_12B = 3336;
    public static final int ASVL_PAF_RAW12_BGGR_16B = 3348;
    public static final int ASVL_PAF_RAW12_GBRG_12B = 3335;
    public static final int ASVL_PAF_RAW12_GBRG_16B = 3347;
    public static final int ASVL_PAF_RAW12_GRAY_12B = 3601;
    public static final int ASVL_PAF_RAW12_GRAY_16B = 3729;
    public static final int ASVL_PAF_RAW12_GRBG_12B = 3334;
    public static final int ASVL_PAF_RAW12_GRBG_16B = 3346;
    public static final int ASVL_PAF_RAW12_RGGB_12B = 3333;
    public static final int ASVL_PAF_RAW12_RGGB_16B = 3345;
    public static final int ASVL_PAF_RAW14_BGGR_14B = 3384;
    public static final int ASVL_PAF_RAW14_BGGR_16B = 3396;
    public static final int ASVL_PAF_RAW14_GBRG_14B = 3383;
    public static final int ASVL_PAF_RAW14_GBRG_16B = 3395;
    public static final int ASVL_PAF_RAW14_GRAY_14B = 3617;
    public static final int ASVL_PAF_RAW14_GRAY_16B = 3745;
    public static final int ASVL_PAF_RAW14_GRBG_14B = 3382;
    public static final int ASVL_PAF_RAW14_GRBG_16B = 3394;
    public static final int ASVL_PAF_RAW14_RGGB_14B = 3381;
    public static final int ASVL_PAF_RAW14_RGGB_16B = 3393;
    public static final int ASVL_PAF_RAW16_BGGR_16B = 3364;
    public static final int ASVL_PAF_RAW16_GBRG_16B = 3363;
    public static final int ASVL_PAF_RAW16_GRAY_16B = 3633;
    public static final int ASVL_PAF_RAW16_GRBG_16B = 3362;
    public static final int ASVL_PAF_RAW16_RGGB_16B = 3361;
    private static final String TAG = "SuperNightProcess";
    private TotalCaptureResult mMetdata;
    private InputInfo mResultInputInfo;
    private SuperNightJni mSuperNightJni = new SuperNightJni();

    public class FaceInfo {
        public int faceNum;
        public int faceOrientation;
        public Rect[] faceRects;

        public FaceInfo() {
        }
    }

    public class InputInfo {
        public int cameraState;
        public int curIndex;
        public int imgNum;
        public int[] inputFd = new int[20];
        public RawImage[] inputImages = new RawImage[20];
        public float[] inputImagesEV = new float[20];

        public InputInfo() {
        }
    }

    public class Param {
        public int curveBrightness;
        public int curveContrast;
        public int curveHighlight;
        public int curveMid;
        public int curveShadow;
        public int edgeSharpIntensity;
        public int noiseLength;
        public int sharpIntensity;

        public Param() {
        }
    }

    public class RawInfo {
        public int[] blackLevel = new int[4];
        public int[] brightLevel = new int[4];
        public int[] evList = new int[20];
        public int expIndex;
        public float fAdrcGain = 1.0f;
        public float fISPGain;
        public float fSensorGain;
        public float fShutter;
        public float fTotalGain;
        public float[] fWbGain = new float[4];
        public int luxIndex;
        public int rawType;

        public RawInfo() {
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:29:0x00ec  */
    /* JADX WARNING: Removed duplicated region for block: B:54:0x00ee A[SYNTHETIC] */
    public int addAllInputInfo(ArrayList<Image> arrayList, ArrayList<TotalCaptureResult> arrayList2, int i) {
        ArrayList<Image> arrayList3 = arrayList;
        ArrayList<TotalCaptureResult> arrayList4 = arrayList2;
        if (arrayList3 == null || arrayList.size() <= 0 || arrayList4 == null || arrayList2.size() <= 0 || arrayList.size() != arrayList2.size() || this.mSuperNightJni == null) {
            LOG.d(TAG, "addAllInputInfo - > error invalid param");
            return -1;
        }
        InputInfo inputInfo = new InputInfo();
        int i2 = 0;
        while (true) {
            FaceInfo faceInfo = null;
            if (i2 < arrayList.size()) {
                Image image = (Image) arrayList3.get(i2);
                TotalCaptureResult totalCaptureResult = (TotalCaptureResult) arrayList4.get(i2);
                if (image == null || totalCaptureResult == null) {
                    LOG.d(TAG, "TotalCaptureResult - > error invalid param");
                } else {
                    InputInfo inputInfo2 = new InputInfo();
                    inputInfo2.curIndex = i2;
                    inputInfo2.imgNum = 8;
                    inputInfo2.cameraState = 2;
                    RawInfo rawInfo = new RawInfo();
                    rawInfo.rawType = 0;
                    rawInfo.blackLevel[0] = 64;
                    Integer num = (Integer) totalCaptureResult.get(CaptureResult.CONTROL_AE_EXPOSURE_COMPENSATION);
                    if (num != null) {
                        rawInfo.evList[0] = num.intValue();
                        inputInfo2.inputImagesEV[0] = (float) num.intValue();
                    }
                    rawInfo.blackLevel[0] = 64;
                    RawImage rawImage = new RawImage();
                    int format = image.getFormat();
                    rawImage.mWidth = image.getWidth();
                    rawImage.mHeight = image.getHeight();
                    Plane[] planes = image.getPlanes();
                    ByteBuffer buffer = planes[0].getBuffer();
                    buffer.rewind();
                    rawImage.mPitch1 = 0;
                    rawImage.mPlane1 = null;
                    if (format == 35) {
                        rawImage.mPixelArrayFormat = 2050;
                        ByteBuffer buffer2 = planes[2].getBuffer();
                        buffer2.rewind();
                        rawImage.mPitch1 = planes[2].getRowStride();
                        rawImage.mPlane1 = buffer2;
                    } else if (format == 32) {
                        rawImage.mPixelArrayFormat = i;
                        rawImage.mPitch0 = planes[0].getRowStride();
                        rawImage.mPitch2 = 0;
                        rawImage.mPitch3 = 0;
                        rawImage.mPlane0 = buffer;
                        rawImage.mPlane2 = null;
                        rawImage.mPlane3 = null;
                        inputInfo2.inputImages[0] = rawImage;
                        this.mSuperNightJni.AddOneInputInfo(rawInfo, inputInfo2);
                        if (i2 != 0) {
                            inputInfo = inputInfo2;
                        }
                        i2++;
                    }
                    int i3 = i;
                    rawImage.mPitch0 = planes[0].getRowStride();
                    rawImage.mPitch2 = 0;
                    rawImage.mPitch3 = 0;
                    rawImage.mPlane0 = buffer;
                    rawImage.mPlane2 = null;
                    rawImage.mPlane3 = null;
                    inputInfo2.inputImages[0] = rawImage;
                    this.mSuperNightJni.AddOneInputInfo(rawInfo, inputInfo2);
                    if (i2 != 0) {
                    }
                    i2++;
                }
            } else {
                Iterator it = arrayList2.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    TotalCaptureResult totalCaptureResult2 = (TotalCaptureResult) it.next();
                    Integer num2 = (Integer) totalCaptureResult2.get(CaptureResult.CONTROL_AE_EXPOSURE_COMPENSATION);
                    if (num2 != null && num2.intValue() == 0) {
                        Face[] faceArr = (Face[]) totalCaptureResult2.get(CaptureResult.STATISTICS_FACES);
                        if (faceArr.length > 0) {
                            faceInfo = new FaceInfo();
                            faceInfo.faceRects = new Rect[faceArr.length];
                            faceInfo.faceNum = faceArr.length;
                            faceInfo.faceOrientation = 90;
                            for (int i4 = 0; i4 < faceArr.length; i4++) {
                                faceInfo.faceRects[i4] = new Rect(faceArr[i4].getBounds());
                            }
                        }
                    }
                }
                return this.mSuperNightJni.process(faceInfo, inputInfo, 3, new Rect());
            }
        }
        LOG.d(TAG, "TotalCaptureResult - > error invalid param");
        return -1;
    }

    public int addOneInputInfo(Image image, TotalCaptureResult totalCaptureResult, int i, int i2) {
        if (image == null || totalCaptureResult == null || this.mSuperNightJni == null) {
            LOG.d(TAG, "addOneInputInfo - > error invalid param");
            return -1;
        }
        InputInfo inputInfo = new InputInfo();
        inputInfo.curIndex = i;
        inputInfo.imgNum = 8;
        inputInfo.cameraState = 2;
        RawInfo rawInfo = new RawInfo();
        rawInfo.rawType = 0;
        Integer num = (Integer) totalCaptureResult.get(CaptureResult.CONTROL_AE_EXPOSURE_COMPENSATION);
        if (num != null) {
            rawInfo.evList[0] = num.intValue();
            inputInfo.inputImagesEV[0] = (float) num.intValue();
        }
        RawImage rawImage = new RawImage();
        int format = image.getFormat();
        rawImage.mWidth = image.getWidth();
        rawImage.mHeight = image.getHeight();
        Plane[] planes = image.getPlanes();
        ByteBuffer buffer = planes[0].getBuffer();
        buffer.rewind();
        rawImage.mPitch1 = 0;
        rawImage.mPlane1 = null;
        if (format == 35) {
            rawImage.mPixelArrayFormat = 2050;
            ByteBuffer buffer2 = planes[2].getBuffer();
            buffer2.rewind();
            rawImage.mPitch1 = planes[2].getRowStride();
            rawImage.mPlane1 = buffer2;
        } else if (format == 32) {
            rawImage.mPixelArrayFormat = i2;
        }
        rawImage.mPitch0 = planes[0].getRowStride();
        rawImage.mPitch2 = 0;
        rawImage.mPitch3 = 0;
        rawImage.mPlane0 = buffer;
        rawImage.mPlane2 = null;
        rawImage.mPlane3 = null;
        inputInfo.inputImages[0] = rawImage;
        int AddOneInputInfo = this.mSuperNightJni.AddOneInputInfo(rawInfo, inputInfo);
        if (num != null && num.intValue() == 0 && this.mMetdata == null) {
            this.mMetdata = totalCaptureResult;
            this.mResultInputInfo = inputInfo;
        }
        return AddOneInputInfo;
    }

    public int addOneInputInfoEx(Image image, InputInfo inputInfo, int i) {
        if (image == null || inputInfo == null || this.mSuperNightJni == null) {
            LOG.d(TAG, "addOneInputInfoEx - > error invalid param");
            return -1;
        }
        RawInfo rawInfo = new RawInfo();
        rawInfo.rawType = 0;
        rawInfo.evList[0] = (int) inputInfo.inputImagesEV[0];
        RawImage rawImage = new RawImage();
        int format = image.getFormat();
        rawImage.mWidth = image.getWidth();
        rawImage.mHeight = image.getHeight();
        Plane[] planes = image.getPlanes();
        ByteBuffer buffer = planes[0].getBuffer();
        buffer.rewind();
        rawImage.mPitch1 = 0;
        rawImage.mPlane1 = null;
        if (format == 35) {
            rawImage.mPixelArrayFormat = 2050;
            ByteBuffer buffer2 = planes[2].getBuffer();
            buffer2.rewind();
            rawImage.mPitch1 = planes[2].getRowStride();
            rawImage.mPlane1 = buffer2;
        } else if (format == 32) {
            rawImage.mPixelArrayFormat = i;
        }
        rawImage.mPitch0 = planes[0].getRowStride();
        rawImage.mPitch2 = 0;
        rawImage.mPitch3 = 0;
        rawImage.mPlane0 = buffer;
        rawImage.mPlane2 = null;
        rawImage.mPlane3 = null;
        inputInfo.inputImages[0] = rawImage;
        int AddOneInputInfo = this.mSuperNightJni.AddOneInputInfo(rawInfo, inputInfo);
        if (rawInfo.evList[0] == 0 && this.mMetdata == null) {
            this.mResultInputInfo = inputInfo;
        }
        return AddOneInputInfo;
    }

    public int init(int i, int i2, int i3, int i4) {
        if (this.mSuperNightJni == null) {
            return -1;
        }
        this.mSuperNightJni.init(i, i2, i3, i4);
        int preProcess = this.mSuperNightJni.preProcess();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("preprocess = ");
        sb.append(preProcess);
        LOG.d(str, sb.toString());
        return preProcess;
    }

    public int process() {
        FaceInfo faceInfo;
        Face[] faceArr = (Face[]) this.mMetdata.get(CaptureResult.STATISTICS_FACES);
        if (faceArr.length > 0) {
            faceInfo = new FaceInfo();
            faceInfo.faceRects = new Rect[faceArr.length];
            faceInfo.faceNum = faceArr.length;
            faceInfo.faceOrientation = 90;
            for (int i = 0; i < faceArr.length; i++) {
                faceInfo.faceRects[i] = new Rect(faceArr[i].getBounds());
            }
        } else {
            faceInfo = null;
        }
        int process = this.mSuperNightJni.process(faceInfo, this.mResultInputInfo, 3, new Rect());
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("process = ");
        sb.append(process);
        LOG.d(str, sb.toString());
        return process;
    }

    public int processEx(FaceInfo faceInfo) {
        int process = this.mSuperNightJni.process(faceInfo, this.mResultInputInfo, 3, new Rect());
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("processEx = ");
        sb.append(process);
        LOG.d(str, sb.toString());
        return process;
    }

    public int unInit() {
        if (this.mSuperNightJni == null) {
            return -1;
        }
        int postProcess = this.mSuperNightJni.postProcess();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("postProcess = ");
        sb.append(postProcess);
        LOG.d(str, sb.toString());
        int unInit = this.mSuperNightJni.unInit();
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("unInit = ");
        sb2.append(unInit);
        LOG.d(str2, sb2.toString());
        this.mMetdata = null;
        this.mResultInputInfo = null;
        return unInit;
    }
}
