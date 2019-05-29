package com.bumptech.glide.load.model;

import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.util.Log;
import com.arcsoft.camera.wideselfie.WideSelfieEngine;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: FileLoader */
public class f<Data> implements m<File, Data> {
    private static final String TAG = "FileLoader";
    private final d<Data> jE;

    /* compiled from: FileLoader */
    public static class a<Data> implements n<File, Data> {
        private final d<Data> jF;

        public a(d<Data> dVar) {
            this.jF = dVar;
        }

        @NonNull
        public final m<File, Data> a(@NonNull q qVar) {
            return new f(this.jF);
        }

        public final void bX() {
        }
    }

    /* compiled from: FileLoader */
    public static class b extends a<ParcelFileDescriptor> {
        public b() {
            super(new d<ParcelFileDescriptor>() {
                /* renamed from: a */
                public void j(ParcelFileDescriptor parcelFileDescriptor) throws IOException {
                    parcelFileDescriptor.close();
                }

                public Class<ParcelFileDescriptor> aj() {
                    return ParcelFileDescriptor.class;
                }

                /* renamed from: i */
                public ParcelFileDescriptor j(File file) throws FileNotFoundException {
                    return ParcelFileDescriptor.open(file, WideSelfieEngine.MPAF_RGB_BASE);
                }
            });
        }
    }

    /* compiled from: FileLoader */
    private static final class c<Data> implements com.bumptech.glide.load.a.d<Data> {
        private Data data;
        private final File file;
        private final d<Data> jF;

        c(File file2, d<Data> dVar) {
            this.file = file2;
            this.jF = dVar;
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super Data> aVar) {
            try {
                this.data = this.jF.j(this.file);
                aVar.k(this.data);
            } catch (FileNotFoundException e) {
                if (Log.isLoggable(f.TAG, 3)) {
                    Log.d(f.TAG, "Failed to open file", e);
                }
                aVar.b(e);
            }
        }

        @NonNull
        public Class<Data> aj() {
            return this.jF.aj();
        }

        @NonNull
        public DataSource ak() {
            return DataSource.LOCAL;
        }

        public void cancel() {
        }

        public void cleanup() {
            if (this.data != null) {
                try {
                    this.jF.j(this.data);
                } catch (IOException e) {
                }
            }
        }
    }

    /* compiled from: FileLoader */
    public interface d<Data> {
        Class<Data> aj();

        Data j(File file) throws FileNotFoundException;

        void j(Data data) throws IOException;
    }

    /* compiled from: FileLoader */
    public static class e extends a<InputStream> {
        public e() {
            super(new d<InputStream>() {
                public Class<InputStream> aj() {
                    return InputStream.class;
                }

                /* renamed from: d */
                public void j(InputStream inputStream) throws IOException {
                    inputStream.close();
                }

                /* renamed from: k */
                public InputStream j(File file) throws FileNotFoundException {
                    return new FileInputStream(file);
                }
            });
        }
    }

    public f(d<Data> dVar) {
        this.jE = dVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull File file, int i, int i2, @NonNull com.bumptech.glide.load.f fVar) {
        return new com.bumptech.glide.load.model.m.a<>(new com.bumptech.glide.e.d(file), new c(file, this.jE));
    }

    /* renamed from: h */
    public boolean q(@NonNull File file) {
        return true;
    }
}
