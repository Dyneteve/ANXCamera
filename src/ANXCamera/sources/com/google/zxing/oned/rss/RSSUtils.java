package com.google.zxing.oned.rss;

public final class RSSUtils {
    private RSSUtils() {
    }

    private static int combins(int i, int i2) {
        int i3;
        int i4;
        if (i - i2 > i2) {
            i4 = i2;
            i3 = i - i2;
        } else {
            i4 = i - i2;
            i3 = i2;
        }
        int i5 = 1;
        int i6 = 1;
        for (int i7 = i; i7 > i3; i7--) {
            i5 *= i7;
            if (i6 <= i4) {
                i5 /= i6;
                i6++;
            }
        }
        while (i6 <= i4) {
            i5 /= i6;
            i6++;
        }
        return i5;
    }

    public static int getRSSvalue(int[] iArr, int i, boolean z) {
        int length = iArr.length;
        int i2 = 0;
        for (int i3 : iArr) {
            i2 += i3;
        }
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int i7 = i2;
        while (i6 < length - 1) {
            int i8 = 1;
            i5 |= 1 << i6;
            while (i8 < iArr[i6]) {
                int combins = combins((i7 - i8) - 1, (length - i6) - 2);
                if (z && i5 == 0 && (i7 - i8) - ((length - i6) - 1) >= (length - i6) - 1) {
                    combins -= combins((i7 - i8) - (length - i6), (length - i6) - 2);
                }
                if ((length - i6) - 1 > 1) {
                    int i9 = 0;
                    for (int i10 = (i7 - i8) - ((length - i6) - 2); i10 > i; i10--) {
                        i9 += combins(((i7 - i8) - i10) - 1, (length - i6) - 3);
                    }
                    combins -= ((length - 1) - i6) * i9;
                } else if (i7 - i8 > i) {
                    combins--;
                }
                i4 += combins;
                i8++;
                i5 &= ~(1 << i6);
            }
            i7 -= i8;
            i6++;
        }
        return i4;
    }
}
