package com.android.volley.toolbox;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.android.volley.C0035VolleyError;
import com.android.volley.toolbox.C0047ImageLoader.ImageContainer;
import com.android.volley.toolbox.C0047ImageLoader.ImageListener;

/* renamed from: com.android.volley.toolbox.NetworkImageView reason: case insensitive filesystem */
public class C0052NetworkImageView extends ImageView {
    private int mDefaultImageId;
    private int mErrorImageId;
    private ImageContainer mImageContainer;
    private C0047ImageLoader mImageLoader;
    private String mUrl;

    public C0052NetworkImageView(Context context) {
        this(context, null);
    }

    public C0052NetworkImageView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public C0052NetworkImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    private void setDefaultImageOrNull() {
        if (this.mDefaultImageId != 0) {
            setImageResource(this.mDefaultImageId);
        } else {
            setImageBitmap(null);
        }
    }

    /* access modifiers changed from: protected */
    public void drawableStateChanged() {
        super.drawableStateChanged();
        invalidate();
    }

    /* access modifiers changed from: 0000 */
    public void loadImageIfNecessary(final boolean z) {
        int width = getWidth();
        int height = getHeight();
        boolean z2 = false;
        boolean z3 = false;
        boolean z4 = true;
        int i = 0;
        if (getLayoutParams() != null) {
            z2 = getLayoutParams().width == -2;
            z3 = getLayoutParams().height == -2;
        }
        if (!z2 || !z3) {
            z4 = false;
        }
        boolean z5 = z4;
        if (width != 0 || height != 0 || z5) {
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
            int i2 = z2 ? 0 : width;
            if (!z3) {
                i = height;
            }
            this.mImageContainer = this.mImageLoader.get(this.mUrl, new ImageListener() {
                public void onErrorResponse(C0035VolleyError volleyError) {
                    if (C0052NetworkImageView.this.mErrorImageId != 0) {
                        C0052NetworkImageView.this.setImageResource(C0052NetworkImageView.this.mErrorImageId);
                    }
                }

                public void onResponse(final ImageContainer imageContainer, boolean z) {
                    if (!z || !z) {
                        if (imageContainer.getBitmap() != null) {
                            C0052NetworkImageView.this.setImageBitmap(imageContainer.getBitmap());
                        } else if (C0052NetworkImageView.this.mDefaultImageId != 0) {
                            C0052NetworkImageView.this.setImageResource(C0052NetworkImageView.this.mDefaultImageId);
                        }
                        return;
                    }
                    C0052NetworkImageView.this.post(new Runnable() {
                        public void run() {
                            AnonymousClass1.this.onResponse(imageContainer, false);
                        }
                    });
                }
            }, i2, i);
        }
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
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        loadImageIfNecessary(true);
    }

    public void setDefaultImageResId(int i) {
        this.mDefaultImageId = i;
    }

    public void setErrorImageResId(int i) {
        this.mErrorImageId = i;
    }

    public void setImageUrl(String str, C0047ImageLoader imageLoader) {
        this.mUrl = str;
        this.mImageLoader = imageLoader;
        loadImageIfNecessary(false);
    }
}
