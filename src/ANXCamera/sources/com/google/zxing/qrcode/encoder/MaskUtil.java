package com.google.zxing.qrcode.encoder;

final class MaskUtil {
    private static final int N1 = 3;
    private static final int N2 = 3;
    private static final int N3 = 40;
    private static final int N4 = 10;

    private MaskUtil() {
    }

    static int applyMaskPenaltyRule1(ByteMatrix byteMatrix) {
        return applyMaskPenaltyRule1Internal(byteMatrix, true) + applyMaskPenaltyRule1Internal(byteMatrix, false);
    }

    private static int applyMaskPenaltyRule1Internal(ByteMatrix byteMatrix, boolean z) {
        int i;
        int i2 = 0;
        int height = z ? byteMatrix.getHeight() : byteMatrix.getWidth();
        int width = z ? byteMatrix.getWidth() : byteMatrix.getHeight();
        byte[][] array = byteMatrix.getArray();
        int i3 = 0;
        while (i3 < height) {
            int i4 = 0;
            byte b = -1;
            int i5 = 0;
            while (i5 < width) {
                byte b2 = z ? array[i3][i5] : array[i5][i3];
                if (b2 == b) {
                    i4++;
                } else {
                    if (i4 >= 5) {
                        i += 3 + (i4 - 5);
                    }
                    i4 = 1;
                    b = b2;
                }
                i5++;
            }
            if (i4 >= 5) {
                i2 = i + 3 + (i4 - 5);
            }
            i3++;
        }
        return i;
    }

    static int applyMaskPenaltyRule2(ByteMatrix byteMatrix) {
        int i = 0;
        byte[][] array = byteMatrix.getArray();
        int width = byteMatrix.getWidth();
        int height = byteMatrix.getHeight();
        int i2 = 0;
        while (i2 < height - 1) {
            int i3 = 0;
            while (i3 < width - 1) {
                byte b = array[i2][i3];
                if (b == array[i2][i3 + 1] && b == array[i2 + 1][i3] && b == array[i2 + 1][i3 + 1]) {
                    i++;
                }
                i3++;
            }
            i2++;
        }
        return 3 * i;
    }

    static int applyMaskPenaltyRule3(ByteMatrix byteMatrix) {
        int i = 0;
        byte[][] array = byteMatrix.getArray();
        int width = byteMatrix.getWidth();
        int height = byteMatrix.getHeight();
        int i2 = 0;
        while (i2 < height) {
            int i3 = 0;
            while (i3 < width) {
                byte[] bArr = array[i2];
                if (i3 + 6 < width && bArr[i3] == 1 && bArr[i3 + 1] == 0 && bArr[i3 + 2] == 1 && bArr[i3 + 3] == 1 && bArr[i3 + 4] == 1 && bArr[i3 + 5] == 0 && bArr[i3 + 6] == 1 && (isWhiteHorizontal(bArr, i3 - 4, i3) || isWhiteHorizontal(bArr, i3 + 7, i3 + 11))) {
                    i++;
                }
                if (i2 + 6 < height && array[i2][i3] == 1 && array[i2 + 1][i3] == 0 && array[i2 + 2][i3] == 1 && array[i2 + 3][i3] == 1 && array[i2 + 4][i3] == 1 && array[i2 + 5][i3] == 0 && array[i2 + 6][i3] == 1 && (isWhiteVertical(array, i3, i2 - 4, i2) || isWhiteVertical(array, i3, i2 + 7, i2 + 11))) {
                    i++;
                }
                i3++;
            }
            i2++;
        }
        return i * 40;
    }

    static int applyMaskPenaltyRule4(ByteMatrix byteMatrix) {
        int i = 0;
        byte[][] array = byteMatrix.getArray();
        int width = byteMatrix.getWidth();
        int height = byteMatrix.getHeight();
        for (int i2 = 0; i2 < height; i2++) {
            byte[] bArr = array[i2];
            for (int i3 = 0; i3 < width; i3++) {
                if (bArr[i3] == 1) {
                    i++;
                }
            }
        }
        int height2 = byteMatrix.getHeight() * byteMatrix.getWidth();
        return ((Math.abs((i * 2) - height2) * 10) / height2) * 10;
    }

    static boolean getDataMaskBit(int i, int i2, int i3) {
        int i4;
        switch (i) {
            case 0:
                i4 = (i3 + i2) & 1;
                break;
            case 1:
                i4 = i3 & 1;
                break;
            case 2:
                i4 = i2 % 3;
                break;
            case 3:
                i4 = (i3 + i2) % 3;
                break;
            case 4:
                i4 = ((i3 / 2) + (i2 / 3)) & 1;
                break;
            case 5:
                int i5 = i3 * i2;
                i4 = (i5 & 1) + (i5 % 3);
                break;
            case 6:
                int i6 = i3 * i2;
                i4 = ((i6 & 1) + (i6 % 3)) & 1;
                break;
            case 7:
                i4 = (((i3 * i2) % 3) + ((i3 + i2) & 1)) & 1;
                break;
            default:
                StringBuilder sb = new StringBuilder("Invalid mask pattern: ");
                sb.append(i);
                throw new IllegalArgumentException(sb.toString());
        }
        return i4 == 0;
    }

    private static boolean isWhiteHorizontal(byte[] bArr, int i, int i2) {
        int i3 = i;
        while (i3 < i2) {
            if (i3 >= 0 && i3 < bArr.length && bArr[i3] == 1) {
                return false;
            }
            i3++;
        }
        return true;
    }

    private static boolean isWhiteVertical(byte[][] bArr, int i, int i2, int i3) {
        int i4 = i2;
        while (i4 < i3) {
            if (i4 >= 0 && i4 < bArr.length && bArr[i4][i] == 1) {
                return false;
            }
            i4++;
        }
        return true;
    }
}
