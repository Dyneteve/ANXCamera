package com.bytedance.frameworks.baselib.log;

import android.content.Context;
import java.io.UnsupportedEncodingException;

public final class LogLib {
    public static final String CHARSET_NAME = "UTF-8";
    private static boolean sInited;
    private static ILogDelegate sLogDelegateImpl = new DefaultLogDelegateImpl();

    public static class DefaultLogDelegateImpl implements ILogDelegate {
        public boolean isNetworkAvailable(Context context) {
            return false;
        }
    }

    public interface ILogDelegate {
        boolean isNetworkAvailable(Context context);
    }

    public static void init(ILogDelegate iLogDelegate) {
        if (!sInited) {
            if (iLogDelegate != null) {
                sLogDelegateImpl = iLogDelegate;
            }
            sInited = true;
        }
    }

    static boolean isNetworkAvailable(Context context) {
        return sLogDelegateImpl.isNetworkAvailable(context);
    }

    public static byte[] safeGetBytes(String str) {
        byte[] bArr;
        if (str != null) {
            try {
                if (str.length() > 0) {
                    bArr = str.getBytes("UTF-8");
                    return bArr;
                }
            } catch (UnsupportedEncodingException e) {
                return str.getBytes();
            }
        }
        bArr = null;
        return bArr;
    }
}
