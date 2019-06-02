package com.google.zxing.multi.qrcode.detector;

import com.google.zxing.DecodeHintType;
import com.google.zxing.NotFoundException;
import com.google.zxing.ReaderException;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.DetectorResult;
import com.google.zxing.qrcode.detector.Detector;
import com.google.zxing.qrcode.detector.FinderPatternInfo;
import java.util.ArrayList;
import java.util.Map;

public final class MultiDetector extends Detector {
    private static final DetectorResult[] EMPTY_DETECTOR_RESULTS = new DetectorResult[0];

    public MultiDetector(BitMatrix bitMatrix) {
        super(bitMatrix);
    }

    public DetectorResult[] detectMulti(Map<DecodeHintType, ?> map) throws NotFoundException {
        FinderPatternInfo[] findMulti = new MultiFinderPatternFinder(getImage(), map == null ? null : (ResultPointCallback) map.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK)).findMulti(map);
        if (findMulti.length != 0) {
            ArrayList arrayList = new ArrayList();
            for (FinderPatternInfo processFinderPatternInfo : findMulti) {
                try {
                    arrayList.add(processFinderPatternInfo(processFinderPatternInfo));
                } catch (ReaderException e) {
                }
            }
            return arrayList.isEmpty() ? EMPTY_DETECTOR_RESULTS : (DetectorResult[]) arrayList.toArray(new DetectorResult[arrayList.size()]);
        }
        throw NotFoundException.getNotFoundInstance();
    }
}
