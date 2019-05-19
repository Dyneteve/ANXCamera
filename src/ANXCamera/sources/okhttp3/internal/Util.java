package okhttp3.internal;

import android.support.v4.media.session.PlaybackStateCompat;
import java.io.Closeable;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.IDN;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import javax.annotation.Nullable;
import okhttp3.HttpUrl;
import okhttp3.MediaType;
import okhttp3.RequestBody;
import okhttp3.ResponseBody;
import okio.Buffer;
import okio.BufferedSource;
import okio.ByteString;
import okio.Source;
import org.jcodec.platform.Platform;

public final class Util {
    public static final byte[] EMPTY_BYTE_ARRAY = new byte[0];
    public static final RequestBody EMPTY_REQUEST = RequestBody.create((MediaType) null, EMPTY_BYTE_ARRAY);
    public static final ResponseBody EMPTY_RESPONSE = ResponseBody.create((MediaType) null, EMPTY_BYTE_ARRAY);
    public static final String[] EMPTY_STRING_ARRAY = new String[0];
    public static final Charset ISO_8859_1 = Charset.forName("ISO-8859-1");
    public static final Comparator<String> NATURAL_ORDER = new Comparator<String>() {
        public int compare(String str, String str2) {
            return str.compareTo(str2);
        }
    };
    public static final TimeZone UTC = TimeZone.getTimeZone("GMT");
    private static final Charset UTF_16_BE = Charset.forName(Platform.UTF_16BE);
    private static final ByteString UTF_16_BE_BOM = ByteString.decodeHex("feff");
    private static final Charset UTF_16_LE = Charset.forName("UTF-16LE");
    private static final ByteString UTF_16_LE_BOM = ByteString.decodeHex("fffe");
    private static final Charset UTF_32_BE = Charset.forName("UTF-32BE");
    private static final ByteString UTF_32_BE_BOM = ByteString.decodeHex("0000ffff");
    private static final Charset UTF_32_LE = Charset.forName("UTF-32LE");
    private static final ByteString UTF_32_LE_BOM = ByteString.decodeHex("ffff0000");
    public static final Charset UTF_8 = Charset.forName("UTF-8");
    private static final ByteString UTF_8_BOM = ByteString.decodeHex("efbbbf");
    private static final Pattern VERIFY_AS_IP_ADDRESS = Pattern.compile("([0-9a-fA-F]*:[0-9a-fA-F:.]*)|([\\d.]+)");

    private Util() {
    }

    public static AssertionError assertionError(String str, Exception exc) {
        return (AssertionError) new AssertionError(str).initCause(exc);
    }

    public static Charset bomAwareCharset(BufferedSource bufferedSource, Charset charset) throws IOException {
        if (bufferedSource.rangeEquals(0, UTF_8_BOM)) {
            bufferedSource.skip((long) UTF_8_BOM.size());
            return UTF_8;
        } else if (bufferedSource.rangeEquals(0, UTF_16_BE_BOM)) {
            bufferedSource.skip((long) UTF_16_BE_BOM.size());
            return UTF_16_BE;
        } else if (bufferedSource.rangeEquals(0, UTF_16_LE_BOM)) {
            bufferedSource.skip((long) UTF_16_LE_BOM.size());
            return UTF_16_LE;
        } else if (bufferedSource.rangeEquals(0, UTF_32_BE_BOM)) {
            bufferedSource.skip((long) UTF_32_BE_BOM.size());
            return UTF_32_BE;
        } else if (!bufferedSource.rangeEquals(0, UTF_32_LE_BOM)) {
            return charset;
        } else {
            bufferedSource.skip((long) UTF_32_LE_BOM.size());
            return UTF_32_LE;
        }
    }

    public static String canonicalizeHost(String str) {
        if (str.contains(":")) {
            InetAddress decodeIpv6 = (!str.startsWith("[") || !str.endsWith("]")) ? decodeIpv6(str, 0, str.length()) : decodeIpv6(str, 1, str.length() - 1);
            if (decodeIpv6 == null) {
                return null;
            }
            byte[] address = decodeIpv6.getAddress();
            if (address.length == 16) {
                return inet6AddressToAscii(address);
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Invalid IPv6 address: '");
            sb.append(str);
            sb.append("'");
            throw new AssertionError(sb.toString());
        }
        try {
            String lowerCase = IDN.toASCII(str).toLowerCase(Locale.US);
            if (!lowerCase.isEmpty() && !containsInvalidHostnameAsciiCodes(lowerCase)) {
                return lowerCase;
            }
            return null;
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    public static int checkDuration(String str, long j, TimeUnit timeUnit) {
        int i = (j > 0 ? 1 : (j == 0 ? 0 : -1));
        if (i < 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(" < 0");
            throw new IllegalArgumentException(sb.toString());
        } else if (timeUnit != null) {
            long millis = timeUnit.toMillis(j);
            if (millis > 2147483647L) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(str);
                sb2.append(" too large.");
                throw new IllegalArgumentException(sb2.toString());
            } else if (millis != 0 || i <= 0) {
                return (int) millis;
            } else {
                StringBuilder sb3 = new StringBuilder();
                sb3.append(str);
                sb3.append(" too small.");
                throw new IllegalArgumentException(sb3.toString());
            }
        } else {
            throw new NullPointerException("unit == null");
        }
    }

    public static void checkOffsetAndCount(long j, long j2, long j3) {
        if ((j2 | j3) < 0 || j2 > j || j - j2 < j3) {
            throw new ArrayIndexOutOfBoundsException();
        }
    }

    public static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (RuntimeException e) {
                throw e;
            } catch (Exception e2) {
            }
        }
    }

    public static void closeQuietly(ServerSocket serverSocket) {
        if (serverSocket != null) {
            try {
                serverSocket.close();
            } catch (RuntimeException e) {
                throw e;
            } catch (Exception e2) {
            }
        }
    }

    public static void closeQuietly(Socket socket) {
        if (socket != null) {
            try {
                socket.close();
            } catch (AssertionError e) {
                if (!isAndroidGetsocknameError(e)) {
                    throw e;
                }
            } catch (RuntimeException e2) {
                throw e2;
            } catch (Exception e3) {
            }
        }
    }

    public static String[] concat(String[] strArr, String str) {
        String[] strArr2 = new String[(strArr.length + 1)];
        System.arraycopy(strArr, 0, strArr2, 0, strArr.length);
        strArr2[strArr2.length - 1] = str;
        return strArr2;
    }

    private static boolean containsInvalidHostnameAsciiCodes(String str) {
        for (int i = 0; i < str.length(); i++) {
            char charAt = str.charAt(i);
            if (charAt <= 31 || charAt >= 127 || " #%/:?@[\\]".indexOf(charAt) != -1) {
                return true;
            }
        }
        return false;
    }

    public static int decodeHexDigit(char c) {
        if (c >= '0' && c <= '9') {
            return c - '0';
        }
        if (c >= 'a' && c <= 'f') {
            return (c - 'a') + 10;
        }
        if (c < 'A' || c > 'F') {
            return -1;
        }
        return (c - 'A') + 10;
    }

    private static boolean decodeIpv4Suffix(String str, int i, int i2, byte[] bArr, int i3) {
        int i4 = i3;
        while (i < i2) {
            if (i4 == bArr.length) {
                return false;
            }
            if (i4 != i3) {
                if (str.charAt(i) != '.') {
                    return false;
                }
                i++;
            }
            int i5 = i;
            int i6 = 0;
            while (i5 < i2) {
                char charAt = str.charAt(i5);
                if (charAt < '0' || charAt > '9') {
                    break;
                } else if (i6 == 0 && i != i5) {
                    return false;
                } else {
                    i6 = ((i6 * 10) + charAt) - 48;
                    if (i6 > 255) {
                        return false;
                    }
                    i5++;
                }
            }
            if (i5 - i == 0) {
                return false;
            }
            int i7 = i4 + 1;
            bArr[i4] = (byte) i6;
            i4 = i7;
            i = i5;
        }
        return i4 == i3 + 4;
    }

    @Nullable
    private static InetAddress decodeIpv6(String str, int i, int i2) {
        int i3;
        byte[] bArr = new byte[16];
        int i4 = -1;
        int i5 = -1;
        int i6 = 0;
        while (true) {
            if (i >= i2) {
                break;
            } else if (i3 == bArr.length) {
                return null;
            } else {
                int i7 = i + 2;
                if (i7 > i2 || !str.regionMatches(i, "::", 0, 2)) {
                    if (i3 != 0) {
                        if (str.regionMatches(i, ":", 0, 1)) {
                            i++;
                        } else if (!str.regionMatches(i, ".", 0, 1) || !decodeIpv4Suffix(str, i5, i2, bArr, i3 - 2)) {
                            return null;
                        } else {
                            i3 += 2;
                        }
                    }
                    i5 = i;
                } else if (i4 != -1) {
                    return null;
                } else {
                    i3 += 2;
                    if (i7 == i2) {
                        i4 = i3;
                        break;
                    }
                    i4 = i3;
                    i5 = i7;
                }
                int i8 = 0;
                i = i5;
                while (i < i2) {
                    int decodeHexDigit = decodeHexDigit(str.charAt(i));
                    if (decodeHexDigit == -1) {
                        break;
                    }
                    i8 = (i8 << 4) + decodeHexDigit;
                    i++;
                }
                int i9 = i - i5;
                if (i9 == 0 || i9 > 4) {
                    return null;
                }
                int i10 = i3 + 1;
                bArr[i3] = (byte) ((i8 >>> 8) & 255);
                i6 = i10 + 1;
                bArr[i10] = (byte) (i8 & 255);
            }
        }
        if (i3 != bArr.length) {
            if (i4 == -1) {
                return null;
            }
            int i11 = i3 - i4;
            System.arraycopy(bArr, i4, bArr, bArr.length - i11, i11);
            Arrays.fill(bArr, i4, (bArr.length - i3) + i4, 0);
        }
        try {
            return InetAddress.getByAddress(bArr);
        } catch (UnknownHostException e) {
            throw new AssertionError();
        }
    }

    public static int delimiterOffset(String str, int i, int i2, char c) {
        while (i < i2) {
            if (str.charAt(i) == c) {
                return i;
            }
            i++;
        }
        return i2;
    }

    public static int delimiterOffset(String str, int i, int i2, String str2) {
        while (i < i2) {
            if (str2.indexOf(str.charAt(i)) != -1) {
                return i;
            }
            i++;
        }
        return i2;
    }

    public static boolean discard(Source source, int i, TimeUnit timeUnit) {
        try {
            return skipAll(source, i, timeUnit);
        } catch (IOException e) {
            return false;
        }
    }

    public static boolean equal(Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }

    public static String format(String str, Object... objArr) {
        return String.format(Locale.US, str, objArr);
    }

    public static String hostHeader(HttpUrl httpUrl, boolean z) {
        String str;
        if (httpUrl.host().contains(":")) {
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            sb.append(httpUrl.host());
            sb.append("]");
            str = sb.toString();
        } else {
            str = httpUrl.host();
        }
        if (!z && httpUrl.port() == HttpUrl.defaultPort(httpUrl.scheme())) {
            return str;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        sb2.append(":");
        sb2.append(httpUrl.port());
        return sb2.toString();
    }

    public static <T> List<T> immutableList(List<T> list) {
        return Collections.unmodifiableList(new ArrayList(list));
    }

    public static <T> List<T> immutableList(T... tArr) {
        return Collections.unmodifiableList(Arrays.asList((Object[]) tArr.clone()));
    }

    public static int indexOf(Comparator<String> comparator, String[] strArr, String str) {
        int length = strArr.length;
        for (int i = 0; i < length; i++) {
            if (comparator.compare(strArr[i], str) == 0) {
                return i;
            }
        }
        return -1;
    }

    public static int indexOfControlOrNonAscii(String str) {
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            if (charAt <= 31 || charAt >= 127) {
                return i;
            }
        }
        return -1;
    }

    private static String inet6AddressToAscii(byte[] bArr) {
        int i = 0;
        int i2 = 0;
        int i3 = -1;
        int i4 = 0;
        while (i4 < bArr.length) {
            int i5 = i4;
            while (i5 < 16 && bArr[i5] == 0 && bArr[i5 + 1] == 0) {
                i5 += 2;
            }
            int i6 = i5 - i4;
            if (i6 > i2 && i6 >= 4) {
                i3 = i4;
                i2 = i6;
            }
            i4 = i5 + 2;
        }
        Buffer buffer = new Buffer();
        while (i < bArr.length) {
            if (i == i3) {
                buffer.writeByte(58);
                i += i2;
                if (i == 16) {
                    buffer.writeByte(58);
                }
            } else {
                if (i > 0) {
                    buffer.writeByte(58);
                }
                buffer.writeHexadecimalUnsignedLong((long) (((bArr[i] & -1) << 8) | (bArr[i + 1] & -1)));
                i += 2;
            }
        }
        return buffer.readUtf8();
    }

    public static String[] intersect(Comparator<? super String> comparator, String[] strArr, String[] strArr2) {
        ArrayList arrayList = new ArrayList();
        for (String str : strArr) {
            int length = strArr2.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                } else if (comparator.compare(str, strArr2[i]) == 0) {
                    arrayList.add(str);
                    break;
                } else {
                    i++;
                }
            }
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public static boolean isAndroidGetsocknameError(AssertionError assertionError) {
        return (assertionError.getCause() == null || assertionError.getMessage() == null || !assertionError.getMessage().contains("getsockname failed")) ? false : true;
    }

    public static boolean nonEmptyIntersection(Comparator<String> comparator, String[] strArr, String[] strArr2) {
        if (strArr == null || strArr2 == null || strArr.length == 0 || strArr2.length == 0) {
            return false;
        }
        for (String str : strArr) {
            for (String compare : strArr2) {
                if (comparator.compare(str, compare) == 0) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean skipAll(Source source, int i, TimeUnit timeUnit) throws IOException {
        long nanoTime = System.nanoTime();
        long deadlineNanoTime = source.timeout().hasDeadline() ? source.timeout().deadlineNanoTime() - nanoTime : Long.MAX_VALUE;
        source.timeout().deadlineNanoTime(Math.min(deadlineNanoTime, timeUnit.toNanos((long) i)) + nanoTime);
        try {
            Buffer buffer = new Buffer();
            while (source.read(buffer, PlaybackStateCompat.ACTION_PLAY_FROM_URI) != -1) {
                buffer.clear();
            }
            if (deadlineNanoTime == Long.MAX_VALUE) {
                source.timeout().clearDeadline();
            } else {
                source.timeout().deadlineNanoTime(nanoTime + deadlineNanoTime);
            }
            return true;
        } catch (InterruptedIOException e) {
            if (deadlineNanoTime == Long.MAX_VALUE) {
                source.timeout().clearDeadline();
            } else {
                source.timeout().deadlineNanoTime(nanoTime + deadlineNanoTime);
            }
            return false;
        } catch (Throwable th) {
            if (deadlineNanoTime == Long.MAX_VALUE) {
                source.timeout().clearDeadline();
            } else {
                source.timeout().deadlineNanoTime(nanoTime + deadlineNanoTime);
            }
            throw th;
        }
    }

    public static int skipLeadingAsciiWhitespace(String str, int i, int i2) {
        while (i < i2) {
            switch (str.charAt(i)) {
                case 9:
                case 10:
                case 12:
                case 13:
                case ' ':
                    i++;
                default:
                    return i;
            }
        }
        return i2;
    }

    public static int skipTrailingAsciiWhitespace(String str, int i, int i2) {
        int i3 = i2 - 1;
        while (i3 >= i) {
            switch (str.charAt(i3)) {
                case 9:
                case 10:
                case 12:
                case 13:
                case ' ':
                    i3--;
                default:
                    return i3 + 1;
            }
        }
        return i;
    }

    public static ThreadFactory threadFactory(final String str, final boolean z) {
        return new ThreadFactory() {
            public Thread newThread(Runnable runnable) {
                Thread thread = new Thread(runnable, str);
                thread.setDaemon(z);
                return thread;
            }
        };
    }

    public static String toHumanReadableAscii(String str) {
        int length = str.length();
        int i = 0;
        while (i < length) {
            int codePointAt = str.codePointAt(i);
            if (codePointAt <= 31 || codePointAt >= 127) {
                Buffer buffer = new Buffer();
                buffer.writeUtf8(str, 0, i);
                while (i < length) {
                    int codePointAt2 = str.codePointAt(i);
                    int i2 = (codePointAt2 <= 31 || codePointAt2 >= 127) ? 63 : codePointAt2;
                    buffer.writeUtf8CodePoint(i2);
                    i += Character.charCount(codePointAt2);
                }
                return buffer.readUtf8();
            }
            i += Character.charCount(codePointAt);
        }
        return str;
    }

    public static String trimSubstring(String str, int i, int i2) {
        int skipLeadingAsciiWhitespace = skipLeadingAsciiWhitespace(str, i, i2);
        return str.substring(skipLeadingAsciiWhitespace, skipTrailingAsciiWhitespace(str, skipLeadingAsciiWhitespace, i2));
    }

    public static boolean verifyAsIpAddress(String str) {
        return VERIFY_AS_IP_ADDRESS.matcher(str).matches();
    }
}
