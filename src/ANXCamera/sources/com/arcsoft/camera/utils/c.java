package com.arcsoft.camera.utils;

import android.content.Context;
import android.database.sqlite.SQLiteFullException;
import android.media.MediaScannerConnection;
import android.media.MediaScannerConnection.MediaScannerConnectionClient;
import android.net.Uri;
import java.util.ArrayList;
import java.util.List;

/* compiled from: MediaUriManager */
public class c implements MediaScannerConnectionClient {
    private static final int c = 100;
    private Context a;
    private MediaScannerConnection b;
    private List<Uri> d = new ArrayList();
    private String e;

    public c(Context context) {
        this.a = context;
        this.b = new MediaScannerConnection(this.a, this);
    }

    public void addPath(String str) {
        this.e = str;
        this.b.connect();
    }

    public void addUri(Uri uri) {
        if (uri != null) {
            this.d.add(uri);
        }
    }

    public void addUris(List<Uri> list) {
        if (list != null && !list.isEmpty()) {
            this.d.addAll(list);
        }
    }

    public Uri getCurrentMediaUri() {
        if (this.d.isEmpty()) {
            return null;
        }
        return (Uri) this.d.get(0);
    }

    public List<Uri> getUris() {
        return this.d;
    }

    public boolean isEmpty() {
        return this.d == null || this.d.isEmpty();
    }

    public void onMediaScannerConnected() {
        try {
            this.b.scanFile(this.e, null);
        } catch (SQLiteFullException e2) {
        }
    }

    public void onScanCompleted(String str, Uri uri) {
        try {
            if (this.d.size() > 100) {
                this.d.remove(this.d.size() - 1);
            }
            this.d.add(0, uri);
        } finally {
            this.b.disconnect();
        }
    }

    public void release() {
        if (this.b != null && this.b.isConnected()) {
            this.b.disconnect();
        }
    }
}
