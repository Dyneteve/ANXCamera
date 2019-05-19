package com.android.camera2.autozoom;

import android.hardware.camera2.CaptureRequest.Key;
import android.hardware.camera2.CaptureResult;
import android.util.Log;
import java.lang.reflect.Constructor;

public class RequestKeyCreator {
    private static Constructor<Key> requestConstructor;
    private static Constructor<CaptureResult.Key> resultConstructor;

    public static <T> Key<T> requestKey(String str, Class<T> cls) {
        try {
            if (requestConstructor == null) {
                requestConstructor = Key.class.getConstructor(new Class[]{String.class, cls.getClass()});
                requestConstructor.setAccessible(true);
            }
            try {
                return (Key) requestConstructor.newInstance(new Object[]{str, cls});
            } catch (Exception e) {
                String simpleName = RequestKeyCreator.class.getSimpleName();
                StringBuilder sb = new StringBuilder();
                sb.append("cannot call captureRequest.Key constructor: ");
                sb.append(e.getMessage());
                Log.d(simpleName, sb.toString());
                return null;
            }
        } catch (NoSuchMethodException e2) {
            String simpleName2 = RequestKeyCreator.class.getSimpleName();
            StringBuilder sb2 = new StringBuilder();
            sb2.append("cannot find captureRequest.Key constructor: ");
            sb2.append(e2.getMessage());
            Log.d(simpleName2, sb2.toString());
        }
    }

    public static <T> CaptureResult.Key<T> resultKey(String str, Class<T> cls) {
        try {
            if (resultConstructor == null) {
                resultConstructor = CaptureResult.Key.class.getConstructor(new Class[]{String.class, cls.getClass()});
                resultConstructor.setAccessible(true);
            }
            try {
                return (CaptureResult.Key) resultConstructor.newInstance(new Object[]{str, cls});
            } catch (Exception e) {
                String simpleName = RequestKeyCreator.class.getSimpleName();
                StringBuilder sb = new StringBuilder();
                sb.append("cannot call captureResult.Key constructor: ");
                sb.append(e.getMessage());
                Log.d(simpleName, sb.toString());
                return null;
            }
        } catch (NoSuchMethodException e2) {
            String simpleName2 = RequestKeyCreator.class.getSimpleName();
            StringBuilder sb2 = new StringBuilder();
            sb2.append("cannot find captureResult.Key constructor: ");
            sb2.append(e2.getMessage());
            Log.d(simpleName2, sb2.toString());
        }
    }
}
