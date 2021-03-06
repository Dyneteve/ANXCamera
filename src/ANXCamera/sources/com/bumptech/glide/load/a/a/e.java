package com.bumptech.glide.load.a.a;

import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.Log;
import com.bumptech.glide.load.ImageHeaderParser;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/* compiled from: ThumbnailStreamOpener */
class e {
    private static final String TAG = "ThumbStreamOpener";
    private static final a ft = new a();
    private final b ff;
    private final ContentResolver fg;
    private final a fu;
    private final d fv;
    private final List<ImageHeaderParser> fw;

    e(List<ImageHeaderParser> list, a aVar, d dVar, b bVar, ContentResolver contentResolver) {
        this.fu = aVar;
        this.fv = dVar;
        this.ff = bVar;
        this.fg = contentResolver;
        this.fw = list;
    }

    e(List<ImageHeaderParser> list, d dVar, b bVar, ContentResolver contentResolver) {
        this(list, ft, dVar, bVar, contentResolver);
    }

    private boolean e(File file) {
        return this.fu.exists(file) && 0 < this.fu.d(file);
    }

    /* JADX INFO: finally extract failed */
    @Nullable
    private String j(@NonNull Uri uri) {
        Cursor g = this.fv.g(uri);
        if (g != null) {
            try {
                if (g.moveToFirst()) {
                    String string = g.getString(0);
                    if (g != null) {
                        g.close();
                    }
                    return string;
                }
            } catch (Throwable th) {
                if (g != null) {
                    g.close();
                }
                throw th;
            }
        }
        if (g != null) {
            g.close();
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x002a A[Catch:{ all -> 0x004a }] */
    /* JADX WARNING: Removed duplicated region for block: B:21:0x0042 A[SYNTHETIC, Splitter:B:21:0x0042] */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x004d A[SYNTHETIC, Splitter:B:28:0x004d] */
    public int h(Uri uri) {
        InputStream inputStream;
        Throwable e;
        try {
            inputStream = this.fg.openInputStream(uri);
            try {
                int b = com.bumptech.glide.load.b.b(this.fw, inputStream, this.ff);
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e2) {
                    }
                }
                return b;
            } catch (IOException | NullPointerException e3) {
                e = e3;
                try {
                    if (Log.isLoggable(TAG, 3)) {
                    }
                    if (inputStream != null) {
                    }
                    return -1;
                } catch (Throwable th) {
                    th = th;
                    if (inputStream != null) {
                    }
                    throw th;
                }
            }
        } catch (IOException | NullPointerException e4) {
            Throwable th2 = e4;
            inputStream = null;
            e = th2;
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Failed to open uri: ");
                sb.append(uri);
                Log.d(str, sb.toString(), e);
            }
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e5) {
                }
            }
            return -1;
        } catch (Throwable th3) {
            th = th3;
            inputStream = null;
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e6) {
                }
            }
            throw th;
        }
    }

    public InputStream i(Uri uri) throws FileNotFoundException {
        String j = j(uri);
        if (TextUtils.isEmpty(j)) {
            return null;
        }
        File r = this.fu.r(j);
        if (!e(r)) {
            return null;
        }
        Uri fromFile = Uri.fromFile(r);
        try {
            return this.fg.openInputStream(fromFile);
        } catch (NullPointerException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("NPE opening uri: ");
            sb.append(uri);
            sb.append(" -> ");
            sb.append(fromFile);
            throw ((FileNotFoundException) new FileNotFoundException(sb.toString()).initCause(e));
        }
    }
}
