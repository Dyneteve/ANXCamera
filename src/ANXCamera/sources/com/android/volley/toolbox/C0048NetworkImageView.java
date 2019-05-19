package com.android.volley.toolbox;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.android.volley.C0031VolleyError;
import com.android.volley.toolbox.C0043ImageLoader.ImageContainer;
import com.android.volley.toolbox.C0043ImageLoader.ImageListener;

/* renamed from: com.android.volley.toolbox.NetworkImageView reason: case insensitive filesystem */
public class C0048NetworkImageView extends ImageView {
    private int mDefaultImageId;
    private int mErrorImageId;
    private ImageContainer mImageContainer;
    private C0043ImageLoader mImageLoader;
    private String mUrl;

    public C0048NetworkImageView(Context context) {
        this(context, null);
    }

    public C0048NetworkImageView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public C0048NetworkImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    public void setImageUrl(String url, C0043ImageLoader imageLoader) {
        this.mUrl = url;
        this.mImageLoader = imageLoader;
        loadImageIfNecessary(false);
    }

    public void setDefaultImageResId(int defaultImage) {
        this.mDefaultImageId = defaultImage;
    }

    public void setErrorImageResId(int errorImage) {
        this.mErrorImageId = errorImage;
    }

    /* access modifiers changed from: 0000 */
    public void loadImageIfNecessary(final boolean isInLayoutPass) {
        int width = getWidth();
        int height = getHeight();
        boolean wrapWidth = false;
        boolean wrapHeight = false;
        boolean z = true;
        int maxHeight = 0;
        if (getLayoutParams() != null) {
            wrapWidth = getLayoutParams().width == -2;
            wrapHeight = getLayoutParams().height == -2;
        }
        if (!wrapWidth || !wrapHeight) {
            z = false;
        }
        boolean isFullyWrapContent = z;
        if (width != 0 || height != 0 || isFullyWrapContent) {
            if (TextUtils.isEmpty(this.mUrl)) {
                if (this.mImageContainer != null) {
                    this.mImageContainer.cancelRequest();
                    this.mImageContainer = null;
                }
                setDefaultImageOrNull();
                return;
            }
            if (!(this.mImageContainer == null || this.mImageContainer.getRequestUrl() == null)) {
                if (!this.mImageContainer.getRequestUrl().equals(this.mUrl)) {
                    this.mImageContainer.cancelRequest();
                    setDefaultImageOrNull();
                } else {
                    return;
                }
            }
            int maxWidth = wrapWidth ? 0 : width;
            if (!wrapHeight) {
                maxHeight = height;
            }
            this.mImageContainer = this.mImageLoader.get(this.mUrl, new ImageListener() {
                public void onErrorResponse(C0031VolleyError error) {
                    if (C0048NetworkImageView.this.mErrorImageId != 0) {
                        C0048NetworkImageView.this.setImageResource(C0048NetworkImageView.this.mErrorImageId);
                    }
                }

                public void onResponse(final ImageContainer response, boolean isImmediate) {
                    if (!isImmediate || !z) {
                        if (response.getBitmap() != null) {
                            C0048NetworkImageView.this.setImageBitmap(response.getBitmap());
                        } else if (C0048NetworkImageView.this.mDefaultImageId != 0) {
                            C0048NetworkImageView.this.setImageResource(C0048NetworkImageView.this.mDefaultImageId);
                        }
                        return;
                    }
                    C0048NetworkImageView.this.post(new Runnable() {
                        public void run() {
                            AnonymousClass1.this.onResponse(imageContainer, false);
                        }
                    });
                }
            }, maxWidth, maxHeight);
        }
    }

    private void setDefaultImageOrNull() {
        if (this.mDefaultImageId != 0) {
            setImageResource(this.mDefaultImageId);
        } else {
            setImageBitmap(null);
        }
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        loadImageIfNecessary(true);
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        if (this.mImageContainer != null) {
            this.mImageContainer.cancelRequest();
            setImageBitmap(null);
            this.mImageContainer = null;
        }
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: protected */
    public void drawableStateChanged() {
        super.drawableStateChanged();
        invalidate();
    }
}
