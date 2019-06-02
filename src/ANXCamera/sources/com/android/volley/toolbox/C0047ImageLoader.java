package com.android.volley.toolbox;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Handler;
import android.os.Looper;
import android.widget.ImageView;
import com.android.volley.C0028Request;
import com.android.volley.C0029RequestQueue;
import com.android.volley.C0030Response.ErrorListener;
import com.android.volley.C0030Response.Listener;
import com.android.volley.C0035VolleyError;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;

/* renamed from: com.android.volley.toolbox.ImageLoader reason: case insensitive filesystem */
public class C0047ImageLoader {
    private int mBatchResponseDelayMs = 100;
    private final HashMap<String, BatchedImageRequest> mBatchedResponses = new HashMap<>();
    private final ImageCache mCache;
    private final Handler mHandler = new Handler(Looper.getMainLooper());
    private final HashMap<String, BatchedImageRequest> mInFlightRequests = new HashMap<>();
    private final C0029RequestQueue mRequestQueue;
    private Runnable mRunnable;

    /* renamed from: com.android.volley.toolbox.ImageLoader$BatchedImageRequest */
    private class BatchedImageRequest {
        private final LinkedList<ImageContainer> mContainers = new LinkedList<>();
        private C0035VolleyError mError;
        private final C0028Request<?> mRequest;
        private Bitmap mResponseBitmap;

        public BatchedImageRequest(C0028Request<?> request, ImageContainer imageContainer) {
            this.mRequest = request;
            this.mContainers.add(imageContainer);
        }

        public void addContainer(ImageContainer imageContainer) {
            this.mContainers.add(imageContainer);
        }

        public C0035VolleyError getError() {
            return this.mError;
        }

        public boolean removeContainerAndCancelIfNecessary(ImageContainer imageContainer) {
            this.mContainers.remove(imageContainer);
            if (this.mContainers.size() != 0) {
                return false;
            }
            this.mRequest.cancel();
            return true;
        }

        public void setError(C0035VolleyError volleyError) {
            this.mError = volleyError;
        }
    }

    /* renamed from: com.android.volley.toolbox.ImageLoader$ImageCache */
    public interface ImageCache {
        Bitmap getBitmap(String str);

        void putBitmap(String str, Bitmap bitmap);
    }

    /* renamed from: com.android.volley.toolbox.ImageLoader$ImageContainer */
    public class ImageContainer {
        private Bitmap mBitmap;
        private final String mCacheKey;
        private final ImageListener mListener;
        private final String mRequestUrl;

        public ImageContainer(Bitmap bitmap, String str, String str2, ImageListener imageListener) {
            this.mBitmap = bitmap;
            this.mRequestUrl = str;
            this.mCacheKey = str2;
            this.mListener = imageListener;
        }

        public void cancelRequest() {
            if (this.mListener != null) {
                BatchedImageRequest batchedImageRequest = (BatchedImageRequest) C0047ImageLoader.access$300(C0047ImageLoader.this).get(this.mCacheKey);
                if (batchedImageRequest == null) {
                    BatchedImageRequest batchedImageRequest2 = (BatchedImageRequest) C0047ImageLoader.access$400(C0047ImageLoader.this).get(this.mCacheKey);
                    if (batchedImageRequest2 != null) {
                        batchedImageRequest2.removeContainerAndCancelIfNecessary(this);
                        if (BatchedImageRequest.access$500(batchedImageRequest2).size() == 0) {
                            C0047ImageLoader.access$400(C0047ImageLoader.this).remove(this.mCacheKey);
                        }
                    }
                } else if (batchedImageRequest.removeContainerAndCancelIfNecessary(this)) {
                    C0047ImageLoader.access$300(C0047ImageLoader.this).remove(this.mCacheKey);
                }
            }
        }

        public Bitmap getBitmap() {
            return this.mBitmap;
        }

        public String getRequestUrl() {
            return this.mRequestUrl;
        }
    }

    /* renamed from: com.android.volley.toolbox.ImageLoader$ImageListener */
    public interface ImageListener extends ErrorListener {
        void onResponse(ImageContainer imageContainer, boolean z);
    }

    public C0047ImageLoader(C0029RequestQueue requestQueue, ImageCache imageCache) {
        this.mRequestQueue = requestQueue;
        this.mCache = imageCache;
    }

    private void batchResponse(String str, BatchedImageRequest batchedImageRequest) {
        this.mBatchedResponses.put(str, batchedImageRequest);
        if (this.mRunnable == null) {
            this.mRunnable = new Runnable() {
                public void run() {
                    for (BatchedImageRequest batchedImageRequest : C0047ImageLoader.access$400(C0047ImageLoader.this).values()) {
                        Iterator it = BatchedImageRequest.access$500(batchedImageRequest).iterator();
                        while (it.hasNext()) {
                            ImageContainer imageContainer = (ImageContainer) it.next();
                            if (ImageContainer.access$600(imageContainer) != null) {
                                if (batchedImageRequest.getError() == null) {
                                    ImageContainer.access$702(imageContainer, BatchedImageRequest.access$200(batchedImageRequest));
                                    ImageContainer.access$600(imageContainer).onResponse(imageContainer, false);
                                } else {
                                    ImageContainer.access$600(imageContainer).onErrorResponse(batchedImageRequest.getError());
                                }
                            }
                        }
                    }
                    C0047ImageLoader.access$400(C0047ImageLoader.this).clear();
                    C0047ImageLoader.access$802(C0047ImageLoader.this, null);
                }
            };
            this.mHandler.postDelayed(this.mRunnable, (long) this.mBatchResponseDelayMs);
        }
    }

    private static String getCacheKey(String str, int i, int i2) {
        StringBuilder sb = new StringBuilder(str.length() + 12);
        sb.append("#W");
        sb.append(i);
        sb.append("#H");
        sb.append(i2);
        sb.append(str);
        return sb.toString();
    }

    public static ImageListener getImageListener(final ImageView imageView, final int i, final int i2) {
        return new ImageListener() {
            public void onErrorResponse(C0035VolleyError volleyError) {
                if (i2 != 0) {
                    imageView.setImageResource(i2);
                }
            }

            public void onResponse(ImageContainer imageContainer, boolean z) {
                if (imageContainer.getBitmap() != null) {
                    imageView.setImageBitmap(imageContainer.getBitmap());
                } else if (i != 0) {
                    imageView.setImageResource(i);
                }
            }
        };
    }

    private void onGetImageError(String str, C0035VolleyError volleyError) {
        BatchedImageRequest batchedImageRequest = (BatchedImageRequest) this.mInFlightRequests.remove(str);
        if (batchedImageRequest != null) {
            batchedImageRequest.setError(volleyError);
            batchResponse(str, batchedImageRequest);
        }
    }

    private void onGetImageSuccess(String str, Bitmap bitmap) {
        this.mCache.putBitmap(str, bitmap);
        BatchedImageRequest batchedImageRequest = (BatchedImageRequest) this.mInFlightRequests.remove(str);
        if (batchedImageRequest != null) {
            BatchedImageRequest.access$202(batchedImageRequest, bitmap);
            batchResponse(str, batchedImageRequest);
        }
    }

    private void throwIfNotOnMainThread() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new IllegalStateException("ImageLoader must be invoked from the main thread.");
        }
    }

    public ImageContainer get(String str, ImageListener imageListener) {
        return get(str, imageListener, 0, 0);
    }

    public ImageContainer get(String str, ImageListener imageListener, int i, int i2) {
        ImageListener imageListener2 = imageListener;
        throwIfNotOnMainThread();
        String str2 = str;
        int i3 = i;
        int i4 = i2;
        final String cacheKey = getCacheKey(str2, i3, i4);
        Bitmap bitmap = this.mCache.getBitmap(cacheKey);
        if (bitmap != null) {
            ImageContainer imageContainer = new ImageContainer(bitmap, str2, null, null);
            imageListener2.onResponse(imageContainer, true);
            return imageContainer;
        }
        ImageContainer imageContainer2 = new ImageContainer(null, str2, cacheKey, imageListener2);
        imageListener2.onResponse(imageContainer2, true);
        BatchedImageRequest batchedImageRequest = (BatchedImageRequest) this.mInFlightRequests.get(cacheKey);
        if (batchedImageRequest != null) {
            batchedImageRequest.addContainer(imageContainer2);
            return imageContainer2;
        }
        String str3 = cacheKey;
        C0048ImageRequest imageRequest = new C0048ImageRequest(str2, new Listener<Bitmap>() {
            public void onResponse(Bitmap bitmap) {
                C0047ImageLoader.access$000(C0047ImageLoader.this, str2, bitmap);
            }
        }, i3, i4, Config.RGB_565, new ErrorListener() {
            public void onErrorResponse(C0035VolleyError volleyError) {
                C0047ImageLoader.access$100(C0047ImageLoader.this, str2, volleyError);
            }
        });
        this.mRequestQueue.add(imageRequest);
        this.mInFlightRequests.put(str3, new BatchedImageRequest(imageRequest, imageContainer2));
        return imageContainer2;
    }

    public boolean isCached(String str, int i, int i2) {
        throwIfNotOnMainThread();
        return this.mCache.getBitmap(getCacheKey(str, i, i2)) != null;
    }

    public void setBatchedResponseDelay(int i) {
        this.mBatchResponseDelayMs = i;
    }
}
