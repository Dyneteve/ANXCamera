package com.arcsoft.camera.utils;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.YuvImage;
import android.text.format.DateFormat;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: FileUtil */
public class a {
    private a() {
    }

    public static String a(String str, String str2, String str3, int i, int i2) {
        if (str == null) {
            return null;
        }
        if (!str.endsWith(File.separator)) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(File.separator);
            str = sb.toString();
        }
        String charSequence = DateFormat.format("yyyyMMdd", System.currentTimeMillis()).toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("_");
        sb2.append(String.format("%03d", new Object[]{Integer.valueOf(i2)}));
        sb2.append("_");
        sb2.append(i);
        String sb3 = sb2.toString();
        StringBuilder sb4 = new StringBuilder();
        sb4.append(str);
        sb4.append(str2);
        sb4.append(charSequence);
        sb4.append(sb3);
        sb4.append(str3);
        String sb5 = sb4.toString();
        File file = new File(sb5);
        if (file.exists()) {
            file.delete();
        }
        return sb5;
    }

    public static boolean a(Context context, String str, String str2) {
        boolean z;
        if (context == null || str == null || str2 == null) {
            return false;
        }
        try {
            z = a(context.getAssets().open(str), str2);
        } catch (IOException e) {
            e.printStackTrace();
            z = false;
        }
        return z;
    }

    public static boolean a(InputStream inputStream, String str) {
        if (inputStream == null || str == null) {
            return false;
        }
        File file = new File(str);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        if (file.exists()) {
            file.delete();
        }
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(str);
            byte[] bArr = new byte[1024];
            while (true) {
                int read = inputStream.read(bArr);
                if (read == -1) {
                    break;
                }
                fileOutputStream.write(bArr, 0, read);
            }
            inputStream.close();
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static boolean a(byte[] bArr, int i, int i2, int i3, String str) {
        if (str != null) {
            File file = new File(str);
            int i4 = 0;
            while (file.exists()) {
                i4++;
                StringBuilder sb = new StringBuilder();
                sb.append(str);
                sb.append(i4);
                file = new File(sb.toString());
            }
            file.getParentFile().mkdirs();
            try {
                FileOutputStream fileOutputStream = new FileOutputStream(str);
                YuvImage yuvImage = new YuvImage(bArr, 17, i, i2, null);
                yuvImage.compressToJpeg(new Rect(0, 0, yuvImage.getWidth(), yuvImage.getHeight()), i3, fileOutputStream);
                fileOutputStream.flush();
                fileOutputStream.close();
                return true;
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
        return false;
    }

    public static String f(String str, String str2) {
        if (str == null || str2 == null) {
            return null;
        }
        if (!str.isEmpty() && !str.endsWith(File.separator)) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(File.separator);
            str = sb.toString();
        }
        if (!str2.isEmpty() && str2.startsWith(File.separator)) {
            str2.substring(str2.indexOf(File.separator) + 1);
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str);
        sb2.append(str2);
        return sb2.toString();
    }

    public static boolean f(String str) {
        boolean z = false;
        if (str == null) {
            return false;
        }
        if (new File(str).exists()) {
            z = true;
        }
        return z;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0033, code lost:
        r3 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0034, code lost:
        r0 = r3;
        r3 = r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0037, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0038, code lost:
        r2 = r1;
        r1 = null;
        r3 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x003c, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x003d, code lost:
        r2 = r1;
        r1 = null;
        r3 = r2;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x0033 A[ExcHandler: all (r3v10 'th' java.lang.Throwable A[CUSTOM_DECLARE]), Splitter:B:3:0x000d] */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x004a A[SYNTHETIC, Splitter:B:30:0x004a] */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x0061 A[SYNTHETIC, Splitter:B:42:0x0061] */
    /* JADX WARNING: Removed duplicated region for block: B:48:? A[RETURN, SYNTHETIC] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:27:0x0045=Splitter:B:27:0x0045, B:36:0x0055=Splitter:B:36:0x0055} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static byte[] g(String str) {
        byte[] bArr;
        byte[] bArr2;
        byte[] bArr3;
        File file = new File(str);
        FileInputStream fileInputStream = null;
        try {
            FileInputStream fileInputStream2 = new FileInputStream(file);
            try {
                bArr3 = new byte[fileInputStream2.available()];
                while (fileInputStream2.read(bArr3) > 0) {
                }
                try {
                    fileInputStream2.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return bArr3;
            } catch (FileNotFoundException e2) {
                byte[] bArr4 = bArr3;
                e = e2;
                fileInputStream = fileInputStream2;
                bArr2 = bArr4;
            } catch (IOException e3) {
                byte[] bArr5 = bArr3;
                e = e3;
                fileInputStream = fileInputStream2;
                bArr = bArr5;
                try {
                    e.printStackTrace();
                    if (fileInputStream == null) {
                    }
                } catch (Throwable th) {
                    th = th;
                    if (fileInputStream != null) {
                        try {
                            fileInputStream.close();
                        } catch (IOException e4) {
                            e4.printStackTrace();
                        }
                    }
                    throw th;
                }
            } catch (Throwable th2) {
            }
        } catch (FileNotFoundException e5) {
            e = e5;
            bArr2 = null;
            e.printStackTrace();
            if (fileInputStream == null) {
                return bArr;
            }
            fileInputStream.close();
            return bArr;
        } catch (IOException e6) {
            e = e6;
            bArr = null;
            e.printStackTrace();
            if (fileInputStream == null) {
                return bArr;
            }
            try {
                fileInputStream.close();
                return bArr;
            } catch (IOException e7) {
                e7.printStackTrace();
                return bArr;
            }
        }
    }

    public static String getExtension(String str) {
        if (str == null || str.isEmpty()) {
            return null;
        }
        int lastIndexOf = str.lastIndexOf(46);
        if (lastIndexOf < 0 || lastIndexOf >= str.length() - 1) {
            return null;
        }
        return str.substring(lastIndexOf + 1);
    }

    public static boolean isVideoFile(String str) {
        if (str == null) {
            return false;
        }
        String substring = str.substring(str.lastIndexOf(46));
        return ".3gp".equals(substring) || ".mp4".equals(substring);
    }
}
