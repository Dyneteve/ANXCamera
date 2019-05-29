package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.a;
import com.bumptech.glide.load.engine.a.a.b;
import com.bumptech.glide.load.f;
import java.io.File;

/* compiled from: DataCacheWriter */
class c<DataType> implements b {
    private final DataType data;
    private final a<DataType> eP;
    private final f eQ;

    c(a<DataType> aVar, DataType datatype, f fVar) {
        this.eP = aVar;
        this.data = datatype;
        this.eQ = fVar;
    }

    public boolean f(@NonNull File file) {
        return this.eP.a(this.data, file, this.eQ);
    }
}
