package com.android.volley.toolbox;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import com.android.volley.C0020DefaultRetryPolicy;
import com.android.volley.C0025NetworkResponse;
import com.android.volley.C0027ParseError;
import com.android.volley.C0028Request;
import com.android.volley.C0028Request.Priority;
import com.android.volley.C0030Response;
import com.android.volley.C0030Response.ErrorListener;
import com.android.volley.C0030Response.Listener;
import com.android.volley.C0036VolleyLog;

/* renamed from: com.android.volley.toolbox.ImageRequest reason: case insensitive filesystem */
public class C0048ImageRequest extends C0028Request<Bitmap> {
    private static final float IMAGE_BACKOFF_MULT = 2.0f;
    private static final int IMAGE_MAX_RETRIES = 2;
    private static final int IMAGE_TIMEOUT_MS = 1000;
    private static final Object sDecodeLock = new Object();
    private final Config mDecodeConfig;
    private final Listener<Bitmap> mListener;
    private final int mMaxHeight;
    private final int mMaxWidth;

    public C0048ImageRequest(String str, Listener<Bitmap> listener, int i, int i2, Config config, ErrorListener errorListener) {
        super(0, str, errorListener);
        setRetryPolicy(new C0020DefaultRetryPolicy(1000, 2, 2.0f));
        this.mListener = listener;
        this.mDecodeConfig = config;
        this.mMaxWidth = i;
        this.mMaxHeight = i2;
    }

    private C0030Response<Bitmap> doParse(C0025NetworkResponse networkResponse) {
        Bitmap bitmap;
        byte[] bArr = networkResponse.data;
        Options options = new Options();
        if (this.mMaxWidth == 0 && this.mMaxHeight == 0) {
            options.inPreferredConfig = this.mDecodeConfig;
            bitmap = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        } else {
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
            int i = options.outWidth;
            int i2 = options.outHeight;
            int resizedDimension = getResizedDimension(this.mMaxWidth, this.mMaxHeight, i, i2);
            int resizedDimension2 = getResizedDimension(this.mMaxHeight, this.mMaxWidth, i2, i);
            options.inJustDecodeBounds = false;
            options.inSampleSize = findBestSampleSize(i, i2, resizedDimension, resizedDimension2);
            Bitmap decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
            if (decodeByteArray == null || (decodeByteArray.getWidth() <= resizedDimension && decodeByteArray.getHeight() <= resizedDimension2)) {
                bitmap = decodeByteArray;
            } else {
                bitmap = Bitmap.createScaledBitmap(decodeByteArray, resizedDimension, resizedDimension2, true);
                decodeByteArray.recycle();
            }
        }
        return bitmap == null ? C0030Response.error(new C0027ParseError(networkResponse)) : C0030Response.success(bitmap, C0044HttpHeaderParser.parseCacheHeaders(networkResponse));
    }

    static int findBestSampleSize(int i, int i2, int i3, int i4) {
        float f = 1.0f;
        while (((double) (f * 2.0f)) <= Math.min(((double) i) / ((double) i3), ((double) i2) / ((double) i4))) {
            f *= 2.0f;
        }
        return (int) f;
    }

    private static int getResizedDimension(int i, int i2, int i3, int i4) {
        if (i == 0 && i2 == 0) {
            return i3;
        }
        if (i == 0) {
            return (int) (((double) i3) * (((double) i2) / ((double) i4)));
        } else if (i2 == 0) {
            return i;
        } else {
            double d = ((double) i4) / ((double) i3);
            int i5 = i;
            if (((double) i5) * d > ((double) i2)) {
                i5 = (int) (((double) i2) / d);
            }
            return i5;
        }
    }

    /* access modifiers changed from: protected */
    public void deliverResponse(Bitmap bitmap) {
        this.mListener.onResponse(bitmap);
    }

    public Priority getPriority() {
        return Priority.LOW;
    }

    /* access modifiers changed from: protected */
    public C0030Response<Bitmap> parseNetworkResponse(C0025NetworkResponse networkResponse) {
        C0030Response<Bitmap> doParse;
        synchronized (sDecodeLock) {
            try {
                doParse = doParse(networkResponse);
            } catch (OutOfMemoryError e) {
                C0036VolleyLog.e("Caught OOM for %d byte image, url=%s", Integer.valueOf(networkResponse.data.length), getUrl());
                return C0030Response.error(new C0027ParseError((Throwable) e));
            } catch (Throwable th) {
                throw th;
            }
        }
        return doParse;
    }
}
