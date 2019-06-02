package com.android.camera;

import com.android.camera.log.Log;

public class Exif {
    private static final String TAG = "CameraExif";

    /* JADX WARNING: Code restructure failed: missing block: B:33:0x006b, code lost:
        r1 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:0x006c, code lost:
        r2 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x006d, code lost:
        if (r2 <= 8) goto L_0x00e0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:0x006f, code lost:
        r3 = pack(r10, r1, 4, false);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x0076, code lost:
        if (r3 == 1229531648) goto L_0x0085;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x007b, code lost:
        if (r3 == 1296891946) goto L_0x0085;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x007d, code lost:
        com.android.camera.log.Log.e(TAG, "Invalid byte order");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x0084, code lost:
        return 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x0085, code lost:
        if (r3 != 1229531648) goto L_0x0089;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x0087, code lost:
        r3 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:44:0x0089, code lost:
        r3 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x008b, code lost:
        r4 = pack(r10, r1 + 4, 4, r3) + 2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:46:0x0094, code lost:
        if (r4 < 10) goto L_0x00d8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x0096, code lost:
        if (r4 <= r2) goto L_0x0099;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x0099, code lost:
        r1 = r1 + r4;
        r2 = r2 - r4;
        r4 = pack(r10, r1 - 2, 2, r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:0x00a1, code lost:
        r8 = r4 - 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x00a3, code lost:
        if (r4 <= 0) goto L_0x00e0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x00a7, code lost:
        if (r2 < 12) goto L_0x00e0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x00af, code lost:
        if (pack(r10, r1, 2, r3) != 274) goto L_0x00d2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x00b1, code lost:
        r10 = pack(r10, r1 + 8, 2, r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x00b6, code lost:
        if (r10 == 1) goto L_0x00d1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x00b9, code lost:
        if (r10 == 3) goto L_0x00ce;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x00bc, code lost:
        if (r10 == 6) goto L_0x00cb;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x00be, code lost:
        if (r10 == 8) goto L_0x00c8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:62:0x00c0, code lost:
        com.android.camera.log.Log.i(TAG, "Unsupported orientation");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:63:0x00c7, code lost:
        return 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:65:0x00ca, code lost:
        return 270;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x00cd, code lost:
        return 90;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:69:0x00d0, code lost:
        return 180;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x00d1, code lost:
        return 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x00d2, code lost:
        r1 = r1 + 12;
        r2 = r2 - 12;
        r4 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x00d8, code lost:
        com.android.camera.log.Log.e(TAG, "Invalid offset");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:73:0x00df, code lost:
        return 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:74:0x00e0, code lost:
        com.android.camera.log.Log.i(TAG, "Orientation not found");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:75:0x00e7, code lost:
        return 0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int getOrientation(byte[] bArr) {
        if (bArr == null) {
            return 0;
        }
        int i = 0;
        while (true) {
            if (i + 3 >= bArr.length) {
                break;
            }
            int i2 = i + 1;
            if ((bArr[i] & -1) != -1) {
                break;
            }
            byte b = bArr[i2] & -1;
            if (b != -1) {
                i2++;
                if (!(b == -40 || b == 1)) {
                    if (b != -39 && b != -38) {
                        int pack = pack(bArr, i2, 2, false);
                        if (pack < 2) {
                            break;
                        }
                        int i3 = i2 + pack;
                        if (i3 <= bArr.length) {
                            if (b == -31 && pack >= 8 && pack(bArr, i2 + 2, 4, false) == 1165519206 && pack(bArr, i2 + 6, 2, false) == 0) {
                                i = i2 + 8;
                                int i4 = pack - 8;
                                break;
                            }
                            i = i3;
                        } else {
                            break;
                        }
                    } else {
                        break;
                    }
                }
            }
            i = i2;
        }
        Log.e(TAG, "Invalid length");
        return 0;
    }

    private static int pack(byte[] bArr, int i, int i2, boolean z) {
        int i3;
        if (z) {
            i += i2 - 1;
            i3 = -1;
        } else {
            i3 = 1;
        }
        byte b = 0;
        while (true) {
            int i4 = i2 - 1;
            if (i2 <= 0) {
                return b;
            }
            b = (bArr[i] & -1) | (b << 8);
            i += i3;
            i2 = i4;
        }
    }
}
