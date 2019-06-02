package com.android.camera;

import com.android.camera.data.DataRepository;
import java.util.ArrayList;
import java.util.List;

public class PictureSizeManager {
    private static final ArrayList<CameraSize> sPictureList = new ArrayList<>();

    private static CameraSize _findMaxRatio16_9(List<CameraSize> list) {
        int i = 0;
        int i2 = 0;
        for (CameraSize cameraSize : list) {
            if (((double) Math.abs(cameraSize.getRatio() - 1.77f)) < 0.02d && cameraSize.area() > i * i2) {
                i = cameraSize.getWidth();
                i2 = cameraSize.getHeight();
            }
        }
        return i != 0 ? new CameraSize(i, i2) : new CameraSize();
    }

    private static CameraSize _findMaxRatio18_9(List<CameraSize> list) {
        int i = 0;
        int i2 = 0;
        for (CameraSize cameraSize : list) {
            if (((double) Math.abs(cameraSize.getRatio() - 2.0f)) < 0.02d && cameraSize.area() > i * i2) {
                i = cameraSize.getWidth();
                i2 = cameraSize.getHeight();
            }
        }
        return i != 0 ? new CameraSize(i, i2) : new CameraSize();
    }

    private static CameraSize _findMaxRatio19_5_9(List<CameraSize> list) {
        int i = 0;
        int i2 = 0;
        for (CameraSize cameraSize : list) {
            if (((double) Math.abs(cameraSize.getRatio() - 2.16f)) < 0.02d && cameraSize.area() > i * i2) {
                i = cameraSize.getWidth();
                i2 = cameraSize.getHeight();
            }
        }
        return i != 0 ? new CameraSize(i, i2) : new CameraSize();
    }

    private static CameraSize _findMaxRatio1_1(List<CameraSize> list) {
        int i = 0;
        int i2 = 0;
        for (CameraSize cameraSize : list) {
            if (((double) Math.abs(cameraSize.getRatio() - 1.0f)) < 0.02d && cameraSize.area() > i * i2) {
                i = cameraSize.getWidth();
                i2 = cameraSize.getHeight();
            }
        }
        return i != 0 ? new CameraSize(i, i2) : new CameraSize();
    }

    private static CameraSize _findMaxRatio4_3(List<CameraSize> list) {
        int i = 0;
        int i2 = 0;
        for (CameraSize cameraSize : list) {
            if (((double) Math.abs(cameraSize.getRatio() - 1.33f)) < 0.02d && cameraSize.area() > i * i2) {
                i = cameraSize.getWidth();
                i2 = cameraSize.getHeight();
            }
        }
        return i != 0 ? new CameraSize(i, i2) : new CameraSize();
    }

    public static CameraSize getBestPanoPictureSize() {
        CameraSize cameraSize;
        if (CameraSettings.isAspectRatio4_3(Util.sWindowWidth, Util.sWindowHeight)) {
            cameraSize = _findMaxRatio4_3(sPictureList);
        } else if (CameraSettings.isAspectRatio18_9(Util.sWindowWidth, Util.sWindowHeight)) {
            cameraSize = _findMaxRatio18_9(sPictureList);
            if (cameraSize == null || cameraSize.isEmpty()) {
                cameraSize = _findMaxRatio16_9(sPictureList);
            }
        } else {
            cameraSize = _findMaxRatio16_9(sPictureList);
        }
        return (cameraSize == null || cameraSize.isEmpty()) ? new CameraSize(((CameraSize) sPictureList.get(0)).width, ((CameraSize) sPictureList.get(0)).height) : cameraSize;
    }

    public static CameraSize getBestPictureSize() {
        return getBestPictureSize((List<CameraSize>) sPictureList);
    }

    public static CameraSize getBestPictureSize(float f) {
        if (sPictureList == null || sPictureList.isEmpty()) {
            return new CameraSize();
        }
        CameraSize cameraSize = null;
        if (((double) Math.abs(f - 1.77f)) < 0.02d) {
            cameraSize = _findMaxRatio16_9(sPictureList);
        } else if (((double) Math.abs(f - 1.33f)) < 0.02d) {
            cameraSize = _findMaxRatio4_3(sPictureList);
        } else if (((double) Math.abs(f - 1.0f)) < 0.02d) {
            cameraSize = _findMaxRatio1_1(sPictureList);
        } else if (((double) Math.abs(f - 2.0f)) < 0.02d) {
            cameraSize = _findMaxRatio18_9(sPictureList);
        } else if (((double) Math.abs(f - 2.16f)) < 0.02d) {
            cameraSize = _findMaxRatio19_5_9(sPictureList);
        }
        if (cameraSize == null || cameraSize.isEmpty()) {
            cameraSize = new CameraSize(((CameraSize) sPictureList.get(0)).width, ((CameraSize) sPictureList.get(0)).height);
        }
        return cameraSize;
    }

    public static CameraSize getBestPictureSize(List<CameraSize> list) {
        if (list == null || list.isEmpty()) {
            return new CameraSize();
        }
        float ratio = Util.getRatio(CameraSettings.getPictureSizeRatioString());
        CameraSize cameraSize = null;
        if (((double) Math.abs(ratio - 1.77f)) < 0.02d) {
            cameraSize = _findMaxRatio16_9(list);
        } else if (((double) Math.abs(ratio - 1.33f)) < 0.02d) {
            cameraSize = _findMaxRatio4_3(list);
        } else if (((double) Math.abs(ratio - 1.0f)) < 0.02d) {
            cameraSize = _findMaxRatio1_1(list);
        } else if (((double) Math.abs(ratio - 2.0f)) < 0.02d) {
            cameraSize = _findMaxRatio18_9(list);
        } else if (((double) Math.abs(ratio - 2.16f)) < 0.02d) {
            cameraSize = _findMaxRatio19_5_9(list);
        }
        if (cameraSize == null || cameraSize.isEmpty()) {
            cameraSize = new CameraSize(((CameraSize) list.get(0)).width, ((CameraSize) list.get(0)).height);
        }
        return cameraSize;
    }

    public static CameraSize getBestSquareSize(List<CameraSize> list) {
        int i = 0;
        if (list == null || list.isEmpty()) {
            return new CameraSize(0, 0);
        }
        for (CameraSize cameraSize : list) {
            if (cameraSize.getWidth() == cameraSize.getHeight()) {
                if (i < cameraSize.getWidth()) {
                    i = cameraSize.getWidth();
                }
            }
        }
        return new CameraSize(i, i);
    }

    /* JADX WARNING: type inference failed for: r1v2, types: [java.util.List] */
    /* JADX WARNING: type inference failed for: r1v8 */
    /* JADX WARNING: Multi-variable type inference failed */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void initialize(List<CameraSize> list, int i, int i2, int i3) {
        sPictureList.clear();
        if (list == 0 || list.size() == 0) {
            throw new IllegalArgumentException("The supported picture size list return from hal is null!");
        }
        DataRepository.dataItemConfig().getComponentConfigRatio().initSensorRatio(list, i2, i3);
        if (i != 0) {
            ArrayList arrayList = new ArrayList();
            for (CameraSize cameraSize : list) {
                if (cameraSize.area() <= i) {
                    arrayList.add(cameraSize);
                }
            }
            list = arrayList;
        }
        CameraSize _findMaxRatio4_3 = _findMaxRatio4_3(list);
        if (_findMaxRatio4_3 != null) {
            sPictureList.add(_findMaxRatio4_3);
        }
        CameraSize _findMaxRatio1_1 = _findMaxRatio1_1(list);
        if (_findMaxRatio1_1 != null) {
            sPictureList.add(_findMaxRatio1_1);
        }
        CameraSize _findMaxRatio16_9 = _findMaxRatio16_9(list);
        if (_findMaxRatio16_9 != null) {
            sPictureList.add(_findMaxRatio16_9);
        }
        CameraSize _findMaxRatio18_9 = _findMaxRatio18_9(list);
        if (_findMaxRatio18_9 != null) {
            sPictureList.add(_findMaxRatio18_9);
        }
        CameraSize _findMaxRatio19_5_9 = _findMaxRatio19_5_9(list);
        if (_findMaxRatio19_5_9 != null) {
            sPictureList.add(_findMaxRatio19_5_9);
        }
        if (sPictureList.size() == 0) {
            throw new IllegalArgumentException("Not find the desire picture sizes!");
        }
    }
}
