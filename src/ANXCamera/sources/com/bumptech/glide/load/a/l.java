package com.bumptech.glide.load.a;

import android.content.ContentResolver;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d.a;
import java.io.FileNotFoundException;
import java.io.IOException;

/* compiled from: LocalUriFetcher */
public abstract class l<T> implements d<T> {
    private static final String TAG = "LocalUriFetcher";
    private T data;
    private final ContentResolver eg;
    private final Uri uri;

    public l(ContentResolver contentResolver, Uri uri2) {
        this.eg = contentResolver;
        this.uri = uri2;
    }

    public final void a(@NonNull Priority priority, @NonNull a<? super T> aVar) {
        try {
            this.data = b(this.uri, this.eg);
            aVar.k(this.data);
        } catch (FileNotFoundException e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to open Uri", e);
            }
            aVar.b(e);
        }
    }

    @NonNull
    public DataSource ak() {
        return DataSource.LOCAL;
    }

    public abstract T b(Uri uri2, ContentResolver contentResolver) throws FileNotFoundException;

    public void cancel() {
    }

    public void cleanup() {
        if (this.data != null) {
            try {
                j(this.data);
            } catch (IOException e) {
            }
        }
    }

    public abstract void j(T t) throws IOException;
}
