package com.ss.android.ugc.effectmanager.common.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Utils {
    protected static char[] sHexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    private static String byteArrayToHex(byte[] bArr) {
        if (bArr == null || bArr.length <= 0) {
            return "";
        }
        char[] cArr = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        char[] cArr2 = new char[(bArr.length * 2)];
        int i = 0;
        for (byte b : bArr) {
            int i2 = i + 1;
            cArr2[i] = cArr[(b >>> 4) & 15];
            i = i2 + 1;
            cArr2[i2] = cArr[b & 15];
        }
        return new String(cArr2);
    }

    public static String getFileMD5(File file) {
        if (!file.isFile()) {
            return "";
        }
        byte[] bArr = new byte[1024];
        try {
            MessageDigest instance = MessageDigest.getInstance("MD5");
            BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
            while (true) {
                int read = bufferedInputStream.read(bArr, 0, bArr.length);
                if (read != -1) {
                    instance.update(bArr, 0, read);
                } else {
                    bufferedInputStream.close();
                    return byteArrayToHex(instance.digest());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public static String getMD5String(String str) {
        if (str == null) {
            return null;
        }
        return getMD5String(str.getBytes());
    }

    public static String getMD5String(byte[] bArr) {
        try {
            byte[] digest = MessageDigest.getInstance("MD5").digest(bArr);
            StringBuffer stringBuffer = new StringBuffer();
            for (byte b : digest) {
                stringBuffer.append(sHexDigits[(b & 240) >> 4]);
                stringBuffer.append(sHexDigits[b & 15]);
            }
            return stringBuffer.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
