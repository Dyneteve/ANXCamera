package android.support.v4.util;

import java.io.PrintWriter;

public class TimeUtils {
    public static final int HUNDRED_DAY_FIELD_LEN = 19;
    private static final int SECONDS_PER_DAY = 86400;
    private static final int SECONDS_PER_HOUR = 3600;
    private static final int SECONDS_PER_MINUTE = 60;
    private static char[] sFormatStr = new char[24];
    private static final Object sFormatSync = new Object();

    private static int accumField(int i, int i2, boolean z, int i3) {
        if (i > 99 || (z && i3 >= 3)) {
            return 3 + i2;
        }
        if (i > 9 || (z && i3 >= 2)) {
            return 2 + i2;
        }
        if (z || i > 0) {
            return 1 + i2;
        }
        return 0;
    }

    public static void formatDuration(long j, long j2, PrintWriter printWriter) {
        if (j == 0) {
            printWriter.print("--");
        } else {
            formatDuration(j - j2, printWriter, 0);
        }
    }

    public static void formatDuration(long j, PrintWriter printWriter) {
        formatDuration(j, printWriter, 0);
    }

    public static void formatDuration(long j, PrintWriter printWriter, int i) {
        synchronized (sFormatSync) {
            printWriter.print(new String(sFormatStr, 0, formatDurationLocked(j, i)));
        }
    }

    public static void formatDuration(long j, StringBuilder sb) {
        synchronized (sFormatSync) {
            sb.append(sFormatStr, 0, formatDurationLocked(j, 0));
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:72:0x0132, code lost:
        if (r9 != r7) goto L_0x0139;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static int formatDurationLocked(long j, int i) {
        char c;
        int i2;
        int i3;
        int i4;
        int i5;
        long j2 = j;
        int i6 = i;
        if (sFormatStr.length < i6) {
            sFormatStr = new char[i6];
        }
        char[] cArr = sFormatStr;
        if (j2 == 0) {
            int i7 = i6 - 1;
            while (0 < i7) {
                cArr[0] = ' ';
            }
            cArr[0] = '0';
            return 0 + 1;
        }
        if (j2 > 0) {
            c = '+';
        } else {
            c = '-';
            j2 = -j2;
        }
        char c2 = c;
        int i8 = (int) (j2 % 1000);
        int floor = (int) Math.floor((double) (j2 / 1000));
        int i9 = 0;
        if (floor > SECONDS_PER_DAY) {
            i9 = floor / SECONDS_PER_DAY;
            floor -= SECONDS_PER_DAY * i9;
        }
        int i10 = i9;
        if (floor > SECONDS_PER_HOUR) {
            int i11 = floor / SECONDS_PER_HOUR;
            floor -= i11 * SECONDS_PER_HOUR;
            i2 = i11;
        } else {
            i2 = 0;
        }
        if (floor > 60) {
            int i12 = floor / 60;
            i3 = floor - (i12 * 60);
            i4 = i12;
        } else {
            i3 = floor;
            i4 = 0;
        }
        int i13 = 0;
        int i14 = 3;
        boolean z = false;
        if (i6 != 0) {
            int accumField = accumField(i10, 1, false, 0);
            if (accumField > 0) {
                z = true;
            }
            int accumField2 = accumField + accumField(i2, 1, z, 2);
            int accumField3 = accumField2 + accumField(i4, 1, accumField2 > 0, 2);
            int accumField4 = accumField3 + accumField(i3, 1, accumField3 > 0, 2);
            for (int accumField5 = accumField4 + accumField(i8, 2, true, accumField4 > 0 ? 3 : 0) + 1; accumField5 < i6; accumField5++) {
                cArr[i13] = ' ';
                i13++;
            }
        }
        cArr[i13] = c2;
        int i15 = i13 + 1;
        boolean z2 = i6 != 0;
        boolean z3 = true;
        int i16 = i15;
        int i17 = 2;
        int printField = printField(cArr, i10, 'd', i15, false, 0);
        int i18 = i16;
        int i19 = i18;
        int i20 = printField;
        int printField2 = printField(cArr, i2, 'h', printField, printField != i18, z2 ? 2 : 0);
        int i21 = i19;
        int i22 = i21;
        boolean z4 = printField2 != i21;
        int i23 = printField2;
        int printField3 = printField(cArr, i4, 'm', printField2, z4, z2 ? 2 : 0);
        int i24 = i22;
        if (printField3 == i24) {
            z3 = false;
        }
        if (!z2) {
            i17 = 0;
        }
        int i25 = i24;
        int i26 = printField3;
        int printField4 = printField(cArr, i3, 's', printField3, z3, i17);
        if (z2) {
            i5 = i25;
        } else {
            i5 = i25;
        }
        i14 = 0;
        int i27 = i5;
        int i28 = printField4;
        int printField5 = printField(cArr, i8, 'm', printField4, true, i14);
        cArr[printField5] = 's';
        return printField5 + 1;
    }

    private static int printField(char[] cArr, int i, char c, int i2, boolean z, int i3) {
        if (!z && i <= 0) {
            return i2;
        }
        int i4 = i2;
        if ((z && i3 >= 3) || i > 99) {
            int i5 = i / 100;
            cArr[i2] = (char) (i5 + 48);
            i2++;
            i -= i5 * 100;
        }
        if ((z && i3 >= 2) || i > 9 || i4 != i2) {
            int i6 = i / 10;
            cArr[i2] = (char) (i6 + 48);
            i2++;
            i -= i6 * 10;
        }
        cArr[i2] = (char) (i + 48);
        int i7 = i2 + 1;
        cArr[i7] = c;
        return i7 + 1;
    }
}
