package android.support.v4.util;

import java.io.PrintWriter;

public class TimeUtils {
    public static final int HUNDRED_DAY_FIELD_LEN = 19;
    private static final int SECONDS_PER_DAY = 86400;
    private static final int SECONDS_PER_HOUR = 3600;
    private static final int SECONDS_PER_MINUTE = 60;
    private static char[] sFormatStr = new char[24];
    private static final Object sFormatSync = new Object();

    private static int accumField(int amt, int suffix, boolean always, int zeropad) {
        if (amt > 99 || (always && zeropad >= 3)) {
            return 3 + suffix;
        }
        if (amt > 9 || (always && zeropad >= 2)) {
            return 2 + suffix;
        }
        if (always || amt > 0) {
            return 1 + suffix;
        }
        return 0;
    }

    private static int printField(char[] formatStr, int amt, char suffix, int pos, boolean always, int zeropad) {
        if (!always && amt <= 0) {
            return pos;
        }
        int startPos = pos;
        if ((always && zeropad >= 3) || amt > 99) {
            int dig = amt / 100;
            formatStr[pos] = (char) (dig + 48);
            pos++;
            amt -= dig * 100;
        }
        if ((always && zeropad >= 2) || amt > 9 || startPos != pos) {
            int dig2 = amt / 10;
            formatStr[pos] = (char) (dig2 + 48);
            pos++;
            amt -= dig2 * 10;
        }
        formatStr[pos] = (char) (amt + 48);
        int pos2 = pos + 1;
        formatStr[pos2] = suffix;
        return pos2 + 1;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:72:0x0132, code lost:
        if (r9 != r7) goto L_0x0139;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static int formatDurationLocked(long duration, int fieldLen) {
        char c;
        int hours;
        int seconds;
        int minutes;
        int start;
        long duration2 = duration;
        int i = fieldLen;
        if (sFormatStr.length < i) {
            sFormatStr = new char[i];
        }
        char[] formatStr = sFormatStr;
        if (duration2 == 0) {
            int fieldLen2 = i - 1;
            while (0 < fieldLen2) {
                formatStr[0] = ' ';
            }
            formatStr[0] = '0';
            return 0 + 1;
        }
        if (duration2 > 0) {
            c = '+';
        } else {
            c = '-';
            duration2 = -duration2;
        }
        char prefix = c;
        int millis = (int) (duration2 % 1000);
        int seconds2 = (int) Math.floor((double) (duration2 / 1000));
        int days = 0;
        if (seconds2 > SECONDS_PER_DAY) {
            days = seconds2 / SECONDS_PER_DAY;
            seconds2 -= SECONDS_PER_DAY * days;
        }
        int days2 = days;
        if (seconds2 > SECONDS_PER_HOUR) {
            int hours2 = seconds2 / SECONDS_PER_HOUR;
            seconds2 -= hours2 * SECONDS_PER_HOUR;
            hours = hours2;
        } else {
            hours = 0;
        }
        if (seconds2 > 60) {
            int minutes2 = seconds2 / 60;
            seconds = seconds2 - (minutes2 * 60);
            minutes = minutes2;
        } else {
            seconds = seconds2;
            minutes = 0;
        }
        int pos = 0;
        int i2 = 3;
        boolean z = false;
        if (i != 0) {
            int myLen = accumField(days2, 1, false, 0);
            if (myLen > 0) {
                z = true;
            }
            int myLen2 = myLen + accumField(hours, 1, z, 2);
            int myLen3 = myLen2 + accumField(minutes, 1, myLen2 > 0, 2);
            int myLen4 = myLen3 + accumField(seconds, 1, myLen3 > 0, 2);
            for (int myLen5 = myLen4 + accumField(millis, 2, true, myLen4 > 0 ? 3 : 0) + 1; myLen5 < i; myLen5++) {
                formatStr[pos] = ' ';
                pos++;
            }
        }
        formatStr[pos] = prefix;
        int pos2 = pos + 1;
        boolean zeropad = i != 0;
        boolean z2 = true;
        int start2 = pos2;
        int i3 = 2;
        int pos3 = printField(formatStr, days2, 'd', pos2, false, 0);
        int start3 = start2;
        int start4 = start3;
        int i4 = pos3;
        int pos4 = printField(formatStr, hours, 'h', pos3, pos3 != start3, zeropad ? 2 : 0);
        int start5 = start4;
        int start6 = start5;
        boolean z3 = pos4 != start5;
        int i5 = pos4;
        int pos5 = printField(formatStr, minutes, 'm', pos4, z3, zeropad ? 2 : 0);
        int start7 = start6;
        if (pos5 == start7) {
            z2 = false;
        }
        if (!zeropad) {
            i3 = 0;
        }
        int start8 = start7;
        int i6 = pos5;
        int pos6 = printField(formatStr, seconds, 's', pos5, z2, i3);
        if (zeropad) {
            start = start8;
        } else {
            start = start8;
        }
        i2 = 0;
        int i7 = start;
        int i8 = pos6;
        int pos7 = printField(formatStr, millis, 'm', pos6, true, i2);
        formatStr[pos7] = 's';
        return pos7 + 1;
    }

    public static void formatDuration(long duration, StringBuilder builder) {
        synchronized (sFormatSync) {
            builder.append(sFormatStr, 0, formatDurationLocked(duration, 0));
        }
    }

    public static void formatDuration(long duration, PrintWriter pw, int fieldLen) {
        synchronized (sFormatSync) {
            pw.print(new String(sFormatStr, 0, formatDurationLocked(duration, fieldLen)));
        }
    }

    public static void formatDuration(long duration, PrintWriter pw) {
        formatDuration(duration, pw, 0);
    }

    public static void formatDuration(long time, long now, PrintWriter pw) {
        if (time == 0) {
            pw.print("--");
        } else {
            formatDuration(time - now, pw, 0);
        }
    }
}
