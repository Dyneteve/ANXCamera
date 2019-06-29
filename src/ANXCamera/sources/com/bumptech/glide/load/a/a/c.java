package com.bumptech.glide.load.a.a;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.MediaStore.Images.Thumbnails;
import android.provider.MediaStore.Video;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.a.g;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: ThumbFetcher */
public class c implements d<InputStream> {
    private static final String TAG = "MediaStoreThumbFetcher";
    private final Uri fp;
    private final e fq;
    private InputStream inputStream;

    /* compiled from: ThumbFetcher */
    static class a implements d {
        private static final String[] fr = {"_data"};
        private static final String fs = "kind = 1 AND image_id = ?";
        private final ContentResolver fg;

        a(ContentResolver contentResolver) {
            this.fg = contentResolver;
        }

        public Cursor g(Uri uri) {
            String lastPathSegment = uri.getLastPathSegment();
            return this.fg.query(Thumbnails.EXTERNAL_CONTENT_URI, fr, fs, new String[]{lastPathSegment}, null);
        }
    }

    /* compiled from: ThumbFetcher */
    static class b implements d {
        private static final String[] fr = {"_data"};
        private static final String fs = "kind = 1 AND video_id = ?";
        private final ContentResolver fg;

        b(ContentResolver contentResolver) {
            this.fg = contentResolver;
        }

        public Cursor g(Uri uri) {
            String lastPathSegment = uri.getLastPathSegment();
            return this.fg.query(Video.Thumbnails.EXTERNAL_CONTENT_URI, fr, fs, new String[]{lastPathSegment}, null);
        }
    }

    @VisibleForTesting
    c(Uri uri, e eVar) {
        this.fp = uri;
        this.fq = eVar;
    }

    private static c a(Context context, Uri uri, d dVar) {
        return new c(uri, new e(com.bumptech.glide.c.c(context).R().W(), dVar, com.bumptech.glide.c.c(context).L(), context.getContentResolver()));
    }

    private InputStream aO() throws FileNotFoundException {
        InputStream i = this.fq.i(this.fp);
        int h = i != null ? this.fq.h(this.fp) : -1;
        return h != -1 ? new g(i, h) : i;
    }

    public static c b(Context context, Uri uri) {
        return a(context, uri, new a(context.getContentResolver()));
    }

    public static c c(Context context, Uri uri) {
        return a(context, uri, new b(context.getContentResolver()));
    }

    public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super InputStream> aVar) {
        try {
            this.inputStream = aO();
            aVar.n(this.inputStream);
        } catch (FileNotFoundException e) {
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "Failed to find thumbnail file", e);
            }
            aVar.b(e);
        }
    }

    @NonNull
    public Class<InputStream> aJ() {
        return InputStream.class;
    }

    @NonNull
    public DataSource aK() {
        return DataSource.LOCAL;
    }

    public void cancel() {
    }

    public void cleanup() {
        if (this.inputStream != null) {
            try {
                this.inputStream.close();
            } catch (IOException e) {
            }
        }
    }
}
