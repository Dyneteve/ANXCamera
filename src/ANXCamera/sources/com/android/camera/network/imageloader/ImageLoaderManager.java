package com.android.camera.network.imageloader;

import android.content.Context;
import android.widget.ImageView;
import com.android.volley.toolbox.C0043ImageLoader;
import com.android.volley.toolbox.C0053Volley;

public class ImageLoaderManager {
    private static ImageLoaderManager sInstance;
    private C0043ImageLoader mImageLoader;

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
        this.mImageLoader = new C0043ImageLoader(C0053Volley.newRequestQueue(context.getApplicationContext()), new LruImageCache());
    }

    public void loadImage(ImageView imageView, String str) {
        if (this.mImageLoader == null) {
            initRequestQueue(imageView.getContext());
        }
        this.mImageLoader.get(str, C0043ImageLoader.getImageListener(imageView, 0, 0));
    }
}
