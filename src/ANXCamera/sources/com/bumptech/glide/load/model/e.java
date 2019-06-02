package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.util.Base64;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.f;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: DataUrlLoader */
public final class e<Model, Data> implements m<Model, Data> {
    private static final String jy = "data:image";
    private static final String jz = ";base64";
    private final a<Data> jA;

    /* compiled from: DataUrlLoader */
    public interface a<Data> {
        Class<Data> aj();

        void j(Data data) throws IOException;

        Data x(String str) throws IllegalArgumentException;
    }

    /* compiled from: DataUrlLoader */
    private static final class b<Data> implements d<Data> {
        private Data data;
        private final String jB;
        private final a<Data> jC;

        b(String str, a<Data> aVar) {
            this.jB = str;
            this.jC = aVar;
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super Data> aVar) {
            try {
                this.data = this.jC.x(this.jB);
                aVar.k(this.data);
            } catch (IllegalArgumentException e) {
                aVar.b(e);
            }
        }

        @NonNull
        public Class<Data> aj() {
            return this.jC.aj();
        }

        @NonNull
        public DataSource ak() {
            return DataSource.LOCAL;
        }

        public void cancel() {
        }

        public void cleanup() {
            try {
                this.jC.j(this.data);
            } catch (IOException e) {
            }
        }
    }

    /* compiled from: DataUrlLoader */
    public static final class c<Model> implements n<Model, InputStream> {
        private final a<InputStream> jD = new a<InputStream>() {
            public Class<InputStream> aj() {
                return InputStream.class;
            }

            /* renamed from: d */
            public void j(InputStream inputStream) throws IOException {
                inputStream.close();
            }

            /* renamed from: y */
            public InputStream x(String str) {
                if (str.startsWith(e.jy)) {
                    int indexOf = str.indexOf(44);
                    if (indexOf == -1) {
                        throw new IllegalArgumentException("Missing comma in data URL.");
                    } else if (str.substring(0, indexOf).endsWith(e.jz)) {
                        return new ByteArrayInputStream(Base64.decode(str.substring(indexOf + 1), 0));
                    } else {
                        throw new IllegalArgumentException("Not a base64 image data URL.");
                    }
                } else {
                    throw new IllegalArgumentException("Not a valid image data URL.");
                }
            }
        };

        @NonNull
        public m<Model, InputStream> a(@NonNull q qVar) {
            return new e(this.jD);
        }

        public void bX() {
        }
    }

    public e(a<Data> aVar) {
        this.jA = aVar;
    }

    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Model model, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a<>(new com.bumptech.glide.e.d(model), new b(model.toString(), this.jA));
    }

    public boolean q(@NonNull Model model) {
        return model.toString().startsWith(jy);
    }
}
