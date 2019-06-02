package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.ChecksumException;
import com.google.zxing.DecodeHintType;
import com.google.zxing.FormatException;
import com.google.zxing.NotFoundException;
import com.google.zxing.ReaderException;
import com.google.zxing.Result;
import com.google.zxing.ResultMetadataType;
import com.google.zxing.ResultPoint;
import com.google.zxing.ResultPointCallback;
import com.google.zxing.common.BitArray;
import java.util.Arrays;
import java.util.Map;

public abstract class UPCEANReader extends OneDReader {
    static final int[][] L_AND_G_PATTERNS = new int[20][];
    static final int[][] L_PATTERNS = {new int[]{3, 2, 1, 1}, new int[]{2, 2, 2, 1}, new int[]{2, 1, 2, 2}, new int[]{1, 4, 1, 1}, new int[]{1, 1, 3, 2}, new int[]{1, 2, 3, 1}, new int[]{1, 1, 1, 4}, new int[]{1, 3, 1, 2}, new int[]{1, 2, 1, 3}, new int[]{3, 1, 1, 2}};
    private static final float MAX_AVG_VARIANCE = 0.48f;
    private static final float MAX_INDIVIDUAL_VARIANCE = 0.7f;
    static final int[] MIDDLE_PATTERN = {1, 1, 1, 1, 1};
    static final int[] START_END_PATTERN = {1, 1, 1};
    private final StringBuilder decodeRowStringBuffer = new StringBuilder(20);
    private final EANManufacturerOrgSupport eanManSupport = new EANManufacturerOrgSupport();
    private final UPCEANExtensionSupport extensionReader = new UPCEANExtensionSupport();

    static {
        System.arraycopy(L_PATTERNS, 0, L_AND_G_PATTERNS, 0, 10);
        for (int i = 10; i < 20; i++) {
            int[] iArr = L_PATTERNS[i - 10];
            int[] iArr2 = new int[iArr.length];
            for (int i2 = 0; i2 < iArr.length; i2++) {
                iArr2[i2] = iArr[(iArr.length - i2) - 1];
            }
            L_AND_G_PATTERNS[i] = iArr2;
        }
    }

    protected UPCEANReader() {
    }

    static boolean checkStandardUPCEANChecksum(CharSequence charSequence) throws FormatException {
        int length = charSequence.length();
        boolean z = false;
        if (length == 0) {
            return false;
        }
        int i = 0;
        for (int i2 = length - 2; i2 >= 0; i2 -= 2) {
            int charAt = charSequence.charAt(i2) - '0';
            if (charAt < 0 || charAt > 9) {
                throw FormatException.getFormatInstance();
            }
            i += charAt;
        }
        int i3 = i * 3;
        for (int i4 = length - 1; i4 >= 0; i4 -= 2) {
            int charAt2 = charSequence.charAt(i4) - '0';
            if (charAt2 < 0 || charAt2 > 9) {
                throw FormatException.getFormatInstance();
            }
            i3 += charAt2;
        }
        if (i3 % 10 == 0) {
            z = true;
        }
        return z;
    }

    static int decodeDigit(BitArray bitArray, int[] iArr, int i, int[][] iArr2) throws NotFoundException {
        recordPattern(bitArray, i, iArr);
        float f = MAX_AVG_VARIANCE;
        int i2 = -1;
        int length = iArr2.length;
        for (int i3 = 0; i3 < length; i3++) {
            float patternMatchVariance = patternMatchVariance(iArr, iArr2[i3], 0.7f);
            if (patternMatchVariance < f) {
                f = patternMatchVariance;
                i2 = i3;
            }
        }
        if (i2 >= 0) {
            return i2;
        }
        throw NotFoundException.getNotFoundInstance();
    }

    static int[] findGuardPattern(BitArray bitArray, int i, boolean z, int[] iArr) throws NotFoundException {
        return findGuardPattern(bitArray, i, z, iArr, new int[iArr.length]);
    }

    private static int[] findGuardPattern(BitArray bitArray, int i, boolean z, int[] iArr, int[] iArr2) throws NotFoundException {
        int length = iArr.length;
        int size = bitArray.getSize();
        boolean z2 = z;
        int nextUnset = z ? bitArray.getNextUnset(i) : bitArray.getNextSet(i);
        int i2 = 0;
        int i3 = nextUnset;
        for (int i4 = nextUnset; i4 < size; i4++) {
            boolean z3 = true;
            if (bitArray.get(i4) ^ z2) {
                iArr2[i2] = iArr2[i2] + 1;
            } else {
                if (i2 != length - 1) {
                    i2++;
                } else if (patternMatchVariance(iArr2, iArr, 0.7f) < MAX_AVG_VARIANCE) {
                    return new int[]{i3, i4};
                } else {
                    i3 += iArr2[0] + iArr2[1];
                    System.arraycopy(iArr2, 2, iArr2, 0, length - 2);
                    iArr2[length - 2] = 0;
                    iArr2[length - 1] = 0;
                    i2--;
                }
                iArr2[i2] = 1;
                if (z2) {
                    z3 = false;
                }
                z2 = z3;
            }
        }
        throw NotFoundException.getNotFoundInstance();
    }

    static int[] findStartGuardPattern(BitArray bitArray) throws NotFoundException {
        boolean z = false;
        int[] iArr = null;
        int i = 0;
        int[] iArr2 = new int[START_END_PATTERN.length];
        while (!z) {
            Arrays.fill(iArr2, 0, START_END_PATTERN.length, 0);
            iArr = findGuardPattern(bitArray, i, false, START_END_PATTERN, iArr2);
            int i2 = iArr[0];
            i = iArr[1];
            int i3 = i2 - (i - i2);
            if (i3 >= 0) {
                z = bitArray.isRange(i3, i2, false);
            }
        }
        return iArr;
    }

    /* access modifiers changed from: 0000 */
    public boolean checkChecksum(String str) throws FormatException {
        return checkStandardUPCEANChecksum(str);
    }

    /* access modifiers changed from: 0000 */
    public int[] decodeEnd(BitArray bitArray, int i) throws NotFoundException {
        return findGuardPattern(bitArray, i, false, START_END_PATTERN);
    }

    public abstract int decodeMiddle(BitArray bitArray, int[] iArr, StringBuilder sb) throws NotFoundException;

    public Result decodeRow(int i, BitArray bitArray, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        return decodeRow(i, bitArray, findStartGuardPattern(bitArray), map);
    }

    public Result decodeRow(int i, BitArray bitArray, int[] iArr, Map<DecodeHintType, ?> map) throws NotFoundException, ChecksumException, FormatException {
        int i2 = i;
        BitArray bitArray2 = bitArray;
        int[] iArr2 = iArr;
        Map<DecodeHintType, ?> map2 = map;
        ResultPointCallback resultPointCallback = map2 == null ? null : (ResultPointCallback) map2.get(DecodeHintType.NEED_RESULT_POINT_CALLBACK);
        if (resultPointCallback != null) {
            resultPointCallback.foundPossibleResultPoint(new ResultPoint(((float) (iArr2[0] + iArr2[1])) / 2.0f, (float) i2));
        }
        StringBuilder sb = this.decodeRowStringBuffer;
        sb.setLength(0);
        int decodeMiddle = decodeMiddle(bitArray2, iArr2, sb);
        if (resultPointCallback != null) {
            resultPointCallback.foundPossibleResultPoint(new ResultPoint((float) decodeMiddle, (float) i2));
        }
        int[] decodeEnd = decodeEnd(bitArray2, decodeMiddle);
        if (resultPointCallback != null) {
            resultPointCallback.foundPossibleResultPoint(new ResultPoint(((float) (decodeEnd[0] + decodeEnd[1])) / 2.0f, (float) i2));
        }
        int i3 = decodeEnd[1];
        int i4 = (i3 - decodeEnd[0]) + i3;
        if (i4 >= bitArray.getSize() || !bitArray2.isRange(i3, i4, false)) {
            ResultPointCallback resultPointCallback2 = resultPointCallback;
            StringBuilder sb2 = sb;
            throw NotFoundException.getNotFoundInstance();
        }
        String sb3 = sb.toString();
        if (sb3.length() < 8) {
            ResultPointCallback resultPointCallback3 = resultPointCallback;
            StringBuilder sb4 = sb;
            throw FormatException.getFormatInstance();
        } else if (checkChecksum(sb3)) {
            float f = ((float) (iArr2[1] + iArr2[0])) / 2.0f;
            float f2 = ((float) (decodeEnd[1] + decodeEnd[0])) / 2.0f;
            BarcodeFormat barcodeFormat = getBarcodeFormat();
            ResultPointCallback resultPointCallback4 = resultPointCallback;
            StringBuilder sb5 = sb;
            Result result = new Result(sb3, null, new ResultPoint[]{new ResultPoint(f, (float) i2), new ResultPoint(f2, (float) i2)}, barcodeFormat);
            int i5 = 0;
            try {
                Result decodeRow = this.extensionReader.decodeRow(i2, bitArray2, decodeEnd[1]);
                result.putMetadata(ResultMetadataType.UPC_EAN_EXTENSION, decodeRow.getText());
                result.putAllMetadata(decodeRow.getResultMetadata());
                result.addResultPoints(decodeRow.getResultPoints());
                i5 = decodeRow.getText().length();
            } catch (ReaderException e) {
            }
            int[] iArr3 = map2 == null ? null : (int[]) map2.get(DecodeHintType.ALLOWED_EAN_EXTENSIONS);
            if (iArr3 != null) {
                int length = iArr3.length;
                boolean z = false;
                int i6 = 0;
                while (true) {
                    if (i6 >= length) {
                        break;
                    } else if (i5 == iArr3[i6]) {
                        z = true;
                        break;
                    } else {
                        i6++;
                        BitArray bitArray3 = bitArray;
                    }
                }
                if (!z) {
                    throw NotFoundException.getNotFoundInstance();
                }
            }
            if (barcodeFormat == BarcodeFormat.EAN_13 || barcodeFormat == BarcodeFormat.UPC_A) {
                String lookupCountryIdentifier = this.eanManSupport.lookupCountryIdentifier(sb3);
                if (lookupCountryIdentifier != null) {
                    result.putMetadata(ResultMetadataType.POSSIBLE_COUNTRY, lookupCountryIdentifier);
                }
            }
            return result;
        } else {
            ResultPointCallback resultPointCallback5 = resultPointCallback;
            StringBuilder sb6 = sb;
            throw ChecksumException.getChecksumInstance();
        }
    }

    public abstract BarcodeFormat getBarcodeFormat();
}
