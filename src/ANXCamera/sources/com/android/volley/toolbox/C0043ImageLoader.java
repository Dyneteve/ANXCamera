package com.android.volley.toolbox;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Handler;
import android.os.Looper;
import android.widget.ImageView;
import com.android.volley.C0024Request;
import com.android.volley.C0025RequestQueue;
import com.android.volley.C0026Response.ErrorListener;
import com.android.volley.C0026Response.Listener;
import com.android.volley.C0031VolleyError;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;

/* renamed from: com.android.volley.toolbox.ImageLoader reason: case insensitive filesystem */
public class C0043ImageLoader {
    private int mBatchResponseDelayMs = 100;
    private final HashMap<String, BatchedImageRequest> mBatchedResponses = new HashMap<>();
    private final ImageCache mCache;
    private final Handler mHandler = new Handler(Looper.getMainLooper());
    private final HashMap<String, BatchedImageRequest> mInFlightRequests = new HashMap<>();
    private final C0025RequestQueue mRequestQueue;
    private Runnable mRunnable;

    /* renamed from: com.android.volley.toolbox.ImageLoader$BatchedImageRequest */
    private class BatchedImageRequest {
        private final LinkedList<ImageContainer> mContainers = new LinkedList<>();
        private C0031VolleyError mError;
        private final C0024Request<?> mRequest;
        private Bitmap mResponseBitmap;

        public BatchedImageRequest(C0024Request<?> request, ImageContainer container) {
            this.mRequest = request;
            this.mContainers.add(container);
        }

        public void setError(C0031VolleyError error) {
            this.mError = error;
        }

        public C0031VolleyError getError() {
            return this.mError;
        }

        public void addContainer(ImageContainer container) {
            this.mContainers.add(container);
        }

        public boolean removeContainerAndCancelIfNecessary(ImageContainer container) {
            this.mContainers.remove(container);
            if (this.mContainers.size() != 0) {
                return false;
            }
            this.mRequest.cancel();
            return true;
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

        public ImageContainer(Bitmap bitmap, String requestUrl, String cacheKey, ImageListener listener) {
            this.mBitmap = bitmap;
            this.mRequestUrl = requestUrl;
            this.mCacheKey = cacheKey;
            this.mListener = listener;
        }

        public void cancelRequest() {
            if (this.mListener != null) {
                BatchedImageRequest request = (BatchedImageRequest) C0043ImageLoader.access$300(C0043ImageLoader.this).get(this.mCacheKey);
                if (request == null) {
                    BatchedImageRequest request2 = (BatchedImageRequest) C0043ImageLoader.access$400(C0043ImageLoader.this).get(this.mCacheKey);
                    if (request2 != null) {
                        request2.removeContainerAndCancelIfNecessary(this);
                        if (BatchedImageRequest.access$500(request2).size() == 0) {
                            C0043ImageLoader.access$400(C0043ImageLoader.this).remove(this.mCacheKey);
                        }
                    }
                } else if (request.removeContainerAndCancelIfNecessary(this)) {
                    C0043ImageLoader.access$300(C0043ImageLoader.this).remove(this.mCacheKey);
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

    public C0043ImageLoader(C0025RequestQueue queue, ImageCache imageCache) {
        this.mRequestQueue = queue;
        this.mCache = imageCache;
    }

    public static ImageListener getImageListener(final ImageView view, final int defaultImageResId, final int errorImageResId) {
        return new ImageListener() {
            public void onErrorResponse(C0031VolleyError error) {
                if (i2 != 0) {
                    imageView.setImageResource(i2);
                }
            }

            public void onResponse(ImageContainer response, boolean isImmediate) {
                if (response.getBitmap() != null) {
                    imageView.setImageBitmap(response.getBitmap());
                } else if (i != 0) {
                    imageView.setImageResource(i);
                }
            }
        };
    }

    public boolean isCached(String requestUrl, int maxWidth, int maxHeight) {
        throwIfNotOnMainThread();
        return this.mCache.getBitmap(getCacheKey(requestUrl, maxWidth, maxHeight)) != null;
    }

    public ImageContainer get(String requestUrl, ImageListener listener) {
        return get(requestUrl, listener, 0, 0);
    }

    public ImageContainer get(String requestUrl, ImageListener imageListener, int maxWidth, int maxHeight) {
        ImageListener imageListener2 = imageListener;
        throwIfNotOnMainThread();
        String str = requestUrl;
        int i = maxWidth;
        int i2 = maxHeight;
        final String cacheKey = getCacheKey(str, i, i2);
        Bitmap cachedBitmap = this.mCache.getBitmap(cacheKey);
        if (cachedBitmap != null) {
            ImageContainer container = new ImageContainer(cachedBitmap, str, null, null);
            imageListener2.onResponse(container, true);
            return container;
        }
        ImageContainer imageContainer = new ImageContainer(null, str, cacheKey, imageListener2);
        imageListener2.onResponse(imageContainer, true);
        BatchedImageRequest request = (BatchedImageRequest) this.mInFlightRequests.get(cacheKey);
        if (request != null) {
            request.addContainer(imageContainer);
            return imageContainer;
        }
        String cacheKey2 = cacheKey;
        C0044ImageRequest imageRequest = new C0044ImageRequest(str, new Listener<Bitmap>() {
            public void onResponse(Bitmap response) {
                C0043ImageLoader.access$000(C0043ImageLoader.this, str2, response);
            }
        }, i, i2, Config.RGB_565, new ErrorListener() {
            public void onErrorResponse(C0031VolleyError error) {
                C0043ImageLoader.access$100(C0043ImageLoader.this, str2, error);
            }
        });
        this.mRequestQueue.add(imageRequest);
        this.mInFlightRequests.put(cacheKey2, new BatchedImageRequest(imageRequest, imageContainer));
        return imageContainer;
    }

    public void setBatchedResponseDelay(int newBatchedResponseDelayMs) {
        this.mBatchResponseDelayMs = newBatchedResponseDelayMs;
    }

    private void onGetImageSuccess(String cacheKey, Bitmap response) {
        this.mCache.putBitmap(cacheKey, response);
        BatchedImageRequest request = (BatchedImageRequest) this.mInFlightRequests.remove(cacheKey);
        if (request != null) {
            BatchedImageRequest.access$202(request, response);
            batchResponse(cacheKey, request);
        }
    }

    private void onGetImageError(String cacheKey, C0031VolleyError error) {
        BatchedImageRequest request = (BatchedImageRequest) this.mInFlightRequests.remove(cacheKey);
        if (request != null) {
            request.setError(error);
            batchResponse(cacheKey, request);
        }
    }

    private void batchResponse(String cacheKey, BatchedImageRequest request) {
        this.mBatchedResponses.put(cacheKey, request);
        if (this.mRunnable == null) {
            this.mRunnable = new Runnable() {
                public void run() {
                    for (BatchedImageRequest bir : C0043ImageLoader.access$400(C0043ImageLoader.this).values()) {
                        Iterator i$ = BatchedImageRequest.access$500(bir).iterator();
                        while (i$.hasNext()) {
                            ImageContainer container = (ImageContainer) i$.next();
                            if (ImageContainer.access$600(container) != null) {
                                if (bir.getError() == null) {
                                    ImageContainer.access$702(container, BatchedImageRequest.access$200(bir));
                                    ImageContainer.access$600(container).onResponse(container, false);
                                } else {
                                    ImageContainer.access$600(container).onErrorResponse(bir.getError());
                                }
                            }
                        }
                    }
                    C0043ImageLoader.access$400(C0043ImageLoader.this).clear();
                    C0043ImageLoader.access$802(C0043ImageLoader.this, null);
                }
            };
            this.mHandler.postDelayed(this.mRunnable, (long) this.mBatchResponseDelayMs);
        }
    }

    private void throwIfNotOnMainThread() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new IllegalStateException("ImageLoader must be invoked from the main thread.");
        }
    }

    private static String getCacheKey(String url, int maxWidth, int maxHeight) {
        StringBuilder sb = new StringBuilder(url.length() + 12);
        sb.append("#W");
        sb.append(maxWidth);
        sb.append("#H");
        sb.append(maxHeight);
        sb.append(url);
        return sb.toString();
    }
}
