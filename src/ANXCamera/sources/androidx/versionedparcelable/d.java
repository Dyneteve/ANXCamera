package androidx.versionedparcelable;

import android.os.Parcelable;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import java.io.InputStream;
import java.io.OutputStream;

@RestrictTo({Scope.LIBRARY_GROUP})
/* compiled from: ParcelUtils */
public class d {
    private d() {
    }

    public static Parcelable a(g gVar) {
        return new ParcelImpl(gVar);
    }

    public static <T extends g> T a(Parcelable parcelable) {
        if (parcelable instanceof ParcelImpl) {
            return ((ParcelImpl) parcelable).o();
        }
        throw new IllegalArgumentException("Invalid parcel");
    }

    public static <T extends g> T a(InputStream inputStream) {
        return new f(inputStream, null).y();
    }

    public static void a(g gVar, OutputStream outputStream) {
        f fVar = new f(null, outputStream);
        fVar.b(gVar);
        fVar.q();
    }
}
