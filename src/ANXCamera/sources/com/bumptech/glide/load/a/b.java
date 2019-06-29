package com.bumptech.glide.load.a;

import android.content.res.AssetManager;
import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d.a;
import java.io.IOException;

/* compiled from: AssetPathFetcher */
public abstract class b<T> implements d<T> {
    private static final String TAG = "AssetPathFetcher";
    private T data;
    private final String eO;
    private final AssetManager eP;

    public b(AssetManager assetManager, String str) {
        this.eP = assetManager;
        this.eO = str;
    }

    /* access modifiers changed from: protected */
    public abstract T a(AssetManager assetManager, String str) throws IOException;

    public void a(@NonNull Priority priority, @NonNull a<? super T> aVar) {
        try {
            this.data = a(this.eP, this.eO);
            aVar.n(this.data);
        } catch (IOException e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to load data from asset manager", e);
            }
            aVar.b(e);
        }
    }

    @NonNull
    public DataSource aK() {
        return DataSource.LOCAL;
    }

    public void cancel() {
    }

    public void cleanup() {
        if (this.data != null) {
            try {
                m(this.data);
            } catch (IOException e) {
            }
        }
    }

    /* access modifiers changed from: protected */
    public abstract void m(T t) throws IOException;
}
