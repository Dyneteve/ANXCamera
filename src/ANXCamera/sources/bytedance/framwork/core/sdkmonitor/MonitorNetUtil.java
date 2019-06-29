package bytedance.framwork.core.sdkmonitor;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Pair;
import com.bytedance.frameworks.core.encrypt.RequestEncryptUtils;
import com.bytedance.frameworks.core.encrypt.TTEncryptUtils;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.LinkedList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;
import java.util.zip.Deflater;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

public class MonitorNetUtil {
    private static final boolean DEBUG_MOBILE = false;
    private static IRequestIntercept sRequestIntercept;

    public enum CompressType {
        NONE(0),
        GZIP(1),
        DEFLATER(2);
        
        final int nativeInt;

        private CompressType(int i) {
            this.nativeInt = i;
        }
    }

    public interface IRequestIntercept {
        String addRequestVerifyParams(String str, byte[] bArr);
    }

    public enum NetworkType {
        NONE(0),
        MOBILE(1),
        MOBILE_2G(2),
        MOBILE_3G(3),
        WIFI(4),
        MOBILE_4G(5);
        
        final int nativeInt;

        private NetworkType(int i) {
            this.nativeInt = i;
        }

        public int getValue() {
            return this.nativeInt;
        }
    }

    public static byte[] excutePost(long j, String str, byte[] bArr, CompressType compressType, String str2, boolean z) throws Throwable {
        String str3;
        byte[] bArr2;
        String str4;
        String str5 = null;
        if (str == null) {
            return null;
        }
        if (bArr == null) {
            bArr = new byte[0];
        }
        int length = bArr.length;
        if (CompressType.GZIP == compressType && length > 128) {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(8192);
            GZIPOutputStream gZIPOutputStream = new GZIPOutputStream(byteArrayOutputStream);
            try {
                gZIPOutputStream.write(bArr);
                gZIPOutputStream.close();
                bArr = byteArrayOutputStream.toByteArray();
                str5 = HttpRequest.ENCODING_GZIP;
            } catch (Throwable th) {
                gZIPOutputStream.close();
                throw th;
            }
        } else if (CompressType.DEFLATER == compressType && length > 128) {
            ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream(8192);
            Deflater deflater = new Deflater();
            deflater.setInput(bArr);
            deflater.finish();
            byte[] bArr3 = new byte[8192];
            while (!deflater.finished()) {
                byteArrayOutputStream2.write(bArr3, 0, deflater.deflate(bArr3));
            }
            deflater.end();
            bArr = byteArrayOutputStream2.toByteArray();
            str5 = "deflate";
        }
        byte[] bArr4 = bArr;
        String str6 = str5;
        if (z) {
            byte[] encrypt = TTEncryptUtils.encrypt(bArr4, bArr4.length);
            if (encrypt != null) {
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append("&tt_data=a");
                String sb2 = sb.toString();
                bArr2 = encrypt;
                str4 = sb2;
                str3 = "application/octet-stream;tt-data=a";
            } else {
                str4 = str;
                str3 = str2;
                bArr2 = bArr4;
            }
            return excuteRequest(str4, bArr2, str3, str6, "POST", true, true);
        }
        return excuteRequest(str, bArr4, str2, str6, "POST", true, false);
    }

    public static byte[] excuteRequest(String str, byte[] bArr, String str2, String str3, String str4, boolean z, boolean z2) throws Throwable {
        byte[] bArr2;
        if (sRequestIntercept != null) {
            str = sRequestIntercept.addRequestVerifyParams(str, bArr);
        }
        LinkedList<Pair> linkedList = new LinkedList<>();
        HttpURLConnection httpURLConnection = (HttpURLConnection) (z2 ? new URL(RequestEncryptUtils.tryEncryptRequest(str, linkedList)) : new URL(str)).openConnection();
        if (z2 && !linkedList.isEmpty()) {
            for (Pair pair : linkedList) {
                if (pair != null) {
                    httpURLConnection.setRequestProperty((String) pair.first, (String) pair.second);
                }
            }
        }
        if (z) {
            httpURLConnection.setDoOutput(true);
        } else {
            httpURLConnection.setDoOutput(false);
        }
        if (str2 != null) {
            httpURLConnection.setRequestProperty("Content-Type", str2);
        }
        if (str3 != null) {
            httpURLConnection.setRequestProperty("Content-Encoding", str3);
        }
        httpURLConnection.setRequestProperty(HttpRequest.HEADER_ACCEPT_ENCODING, HttpRequest.ENCODING_GZIP);
        if (str4 != null) {
            httpURLConnection.setRequestMethod(str4);
            if (bArr != null && bArr.length > 0) {
                DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
                dataOutputStream.write(bArr);
                dataOutputStream.flush();
                dataOutputStream.close();
            }
            int responseCode = httpURLConnection.getResponseCode();
            if (responseCode == 200) {
                InputStream inputStream = httpURLConnection.getInputStream();
                String contentEncoding = httpURLConnection.getContentEncoding();
                if (TextUtils.isEmpty(contentEncoding) || !contentEncoding.equalsIgnoreCase(HttpRequest.ENCODING_GZIP)) {
                    bArr2 = toByteArray(inputStream);
                } else {
                    GZIPInputStream gZIPInputStream = new GZIPInputStream(inputStream);
                    bArr2 = toByteArray(gZIPInputStream);
                    gZIPInputStream.close();
                }
                if (inputStream != null) {
                    inputStream.close();
                }
                return bArr2;
            }
            throw new HttpResponseException(responseCode, httpURLConnection.getResponseMessage());
        }
        throw new IllegalArgumentException("request method is not null");
    }

    public static String getNetWorkType(Context context) {
        if (context == null) {
            return null;
        }
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo != null) {
                if (activeNetworkInfo.isAvailable()) {
                    return activeNetworkInfo.getTypeName();
                }
            }
            return null;
        } catch (Throwable th) {
            return null;
        }
    }

    public static NetworkType getNetworkType(Context context) {
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo != null) {
                if (activeNetworkInfo.isAvailable()) {
                    int type = activeNetworkInfo.getType();
                    if (1 == type) {
                        return NetworkType.WIFI;
                    }
                    if (type != 0) {
                        return NetworkType.MOBILE;
                    }
                    switch (((TelephonyManager) context.getSystemService("phone")).getNetworkType()) {
                        case 3:
                        case 5:
                        case 6:
                        case 8:
                        case 9:
                        case 10:
                        case 12:
                        case 14:
                        case 15:
                            return NetworkType.MOBILE_3G;
                        case 13:
                            return NetworkType.MOBILE_4G;
                        default:
                            return NetworkType.MOBILE;
                    }
                }
            }
            return NetworkType.NONE;
        } catch (Throwable th) {
            return NetworkType.MOBILE;
        }
    }

    public static byte[] getRequest(String str, String str2, boolean z) throws Throwable {
        if (TextUtils.isDigitsOnly(str)) {
            return null;
        }
        return excuteRequest(str, null, str2, null, "GET", false, z);
    }

    public static boolean isNetworkAvailable(Context context) {
        boolean z = false;
        if (context == null) {
            return false;
        }
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo != null && activeNetworkInfo.isConnected()) {
                z = true;
            }
            return z;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean isWifi(Context context) {
        boolean z = false;
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo != null) {
                if (activeNetworkInfo.isAvailable()) {
                    if (1 == activeNetworkInfo.getType()) {
                        z = true;
                    }
                    return z;
                }
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    public static void setRequestIntercept(IRequestIntercept iRequestIntercept) {
        sRequestIntercept = iRequestIntercept;
    }

    public static byte[] toByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] bArr = new byte[8192];
        while (true) {
            int read = inputStream.read(bArr);
            if (-1 == read) {
                break;
            }
            byteArrayOutputStream.write(bArr, 0, read);
        }
        if (inputStream != null) {
            inputStream.close();
        }
        return byteArrayOutputStream.toByteArray();
    }

    public static String uploadFile(String str, File file, Map<String, String> map, String str2, boolean z) throws Throwable {
        FileInputStream fileInputStream;
        byte[] bArr;
        if (TextUtils.isEmpty(str) || file == null || !file.exists()) {
            throw new IllegalArgumentException("url and file not be null ");
        }
        StringBuilder sb = new StringBuilder();
        sb.append("tt_file_upload");
        sb.append(UUID.randomUUID().toString());
        String sb2 = sb.toString();
        String str3 = "--";
        String str4 = "\r\n";
        String str5 = "multipart/form-data";
        File file2 = null;
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            httpURLConnection.setReadTimeout(30000);
            httpURLConnection.setConnectTimeout(30000);
            httpURLConnection.setDoInput(true);
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setUseCaches(false);
            httpURLConnection.setRequestMethod("POST");
            httpURLConnection.setRequestProperty("Charset", str2);
            httpURLConnection.setRequestProperty("connection", "keep-alive");
            StringBuilder sb3 = new StringBuilder();
            sb3.append(str5);
            sb3.append(";boundary=");
            sb3.append(sb2);
            httpURLConnection.setRequestProperty("Content-Type", sb3.toString());
            if (z) {
                httpURLConnection.setRequestProperty("Content-Encoding", HttpRequest.ENCODING_GZIP);
            }
            if (map != null && !map.isEmpty()) {
                for (Entry entry : map.entrySet()) {
                    String str6 = (String) entry.getKey();
                    String str7 = (String) entry.getValue();
                    if (!TextUtils.isEmpty(str6)) {
                        if (!TextUtils.isEmpty(str7)) {
                            httpURLConnection.setRequestProperty(str6, str7);
                        }
                    }
                }
            }
            DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream());
            if (file == null) {
                return null;
            }
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append(str3);
            stringBuffer.append(sb2);
            stringBuffer.append(str4);
            if (z) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("Content-Disposition: form-data; name=\"file\"; filename=\"");
                sb4.append(file.getName());
                sb4.append(".zip\"");
                sb4.append(str4);
                stringBuffer.append(sb4.toString());
            }
            StringBuilder sb5 = new StringBuilder();
            sb5.append("Content-Type: application/octet-stream; charset=");
            sb5.append(str2);
            sb5.append(str4);
            stringBuffer.append(sb5.toString());
            stringBuffer.append(str4);
            dataOutputStream.write(stringBuffer.toString().getBytes());
            if (z) {
                StringBuilder sb6 = new StringBuilder();
                sb6.append(file.getAbsolutePath());
                sb6.append("_tmp.zip");
                File file3 = new File(sb6.toString());
                try {
                    if (file3.exists()) {
                        file3.delete();
                    }
                    zipFile(file, file3);
                    fileInputStream = new FileInputStream(file3);
                    file2 = file3;
                } catch (Throwable th) {
                    th = th;
                    file2 = file3;
                    if (file2 != null && file2.exists()) {
                        file2.delete();
                    }
                    throw th;
                }
            } else {
                fileInputStream = new FileInputStream(file);
            }
            byte[] bArr2 = new byte[1024];
            while (true) {
                int read = fileInputStream.read(bArr2);
                if (read == -1) {
                    break;
                }
                dataOutputStream.write(bArr2, 0, read);
            }
            fileInputStream.close();
            dataOutputStream.write(str4.getBytes());
            StringBuilder sb7 = new StringBuilder();
            sb7.append(str3);
            sb7.append(sb2);
            sb7.append(str3);
            sb7.append(str4);
            dataOutputStream.write(sb7.toString().getBytes());
            dataOutputStream.flush();
            dataOutputStream.close();
            int responseCode = httpURLConnection.getResponseCode();
            if (responseCode == 200) {
                InputStream inputStream = httpURLConnection.getInputStream();
                String contentEncoding = httpURLConnection.getContentEncoding();
                if (TextUtils.isEmpty(contentEncoding) || !contentEncoding.equalsIgnoreCase(HttpRequest.ENCODING_GZIP)) {
                    bArr = toByteArray(inputStream);
                } else {
                    GZIPInputStream gZIPInputStream = new GZIPInputStream(inputStream);
                    bArr = toByteArray(gZIPInputStream);
                    gZIPInputStream.close();
                }
                if (inputStream != null) {
                    inputStream.close();
                }
                String str8 = new String(bArr);
                if (file2 != null && file2.exists()) {
                    file2.delete();
                }
                return str8;
            }
            throw new HttpResponseException(responseCode, httpURLConnection.getResponseMessage());
        } catch (Throwable th2) {
            th = th2;
            th.printStackTrace();
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x0043  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0048  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x004d  */
    public static void zipFile(File file, File file2) throws IOException {
        FileOutputStream fileOutputStream;
        FileInputStream fileInputStream;
        GZIPOutputStream gZIPOutputStream;
        GZIPOutputStream gZIPOutputStream2 = null;
        try {
            fileInputStream = new FileInputStream(file);
            try {
                FileOutputStream fileOutputStream2 = new FileOutputStream(file2);
                try {
                    gZIPOutputStream = new GZIPOutputStream(fileOutputStream2);
                } catch (Throwable th) {
                    Throwable th2 = th;
                    fileOutputStream = fileOutputStream2;
                    th = th2;
                    if (gZIPOutputStream2 != null) {
                    }
                    if (fileOutputStream != null) {
                    }
                    if (fileInputStream != null) {
                    }
                    throw th;
                }
                try {
                    byte[] bArr = new byte[1024];
                    while (true) {
                        int read = fileInputStream.read(bArr);
                        if (read != -1) {
                            gZIPOutputStream.write(bArr, 0, read);
                        } else {
                            gZIPOutputStream.close();
                            fileOutputStream2.close();
                            fileInputStream.close();
                            return;
                        }
                    }
                } catch (Throwable th3) {
                    GZIPOutputStream gZIPOutputStream3 = gZIPOutputStream;
                    fileOutputStream = fileOutputStream2;
                    th = th3;
                    gZIPOutputStream2 = gZIPOutputStream3;
                    if (gZIPOutputStream2 != null) {
                        gZIPOutputStream2.close();
                    }
                    if (fileOutputStream != null) {
                        fileOutputStream.close();
                    }
                    if (fileInputStream != null) {
                        fileInputStream.close();
                    }
                    throw th;
                }
            } catch (Throwable th4) {
                th = th4;
                fileOutputStream = null;
                if (gZIPOutputStream2 != null) {
                }
                if (fileOutputStream != null) {
                }
                if (fileInputStream != null) {
                }
                throw th;
            }
        } catch (Throwable th5) {
            th = th5;
            fileOutputStream = null;
            fileInputStream = null;
            if (gZIPOutputStream2 != null) {
            }
            if (fileOutputStream != null) {
            }
            if (fileInputStream != null) {
            }
            throw th;
        }
    }
}
