package com.android.camera.network.imageloader;

import android.content.Context;
import android.widget.ImageView;
import com.android.volley.toolbox.C0047ImageLoader;
import com.android.volley.toolbox.C0057Volley;

public class ImageLoaderManager {
    private static ImageLoaderManager sInstance;
    private C0047ImageLoader mImageLoader;

    private ImageLoaderManager() {
    }

    public static ImageLoaderManager getInstance() {
        if (sInstance == null) {
            synchronized (ImageLoaderManager.class) {
                if (sInstance == null) {
                    sInstance = new ImageLoaderManager();
                }
            }
        }
        return sInstance;
    }

    public void initRequestQueue(Context context) {
        this.mImageLoader = new C0047ImageLoader(C0057Volley.newRequestQueue(context.getApplicationContext()), new LruImageCache());
    }

    public void loadImage(ImageView imageView, String str) {
        if (this.mImageLoader == null) {
            initRequestQueue(imageView.getContext());
        }
        this.mImageLoader.get(str, C0047ImageLoader.getImageListener(imageView, 0, 0));
    }
}
