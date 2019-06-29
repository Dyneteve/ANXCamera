package android.support.v4.graphics.drawable;

import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import androidx.a.a.a.a;
import androidx.versionedparcelable.VersionedParcel;

@RestrictTo({Scope.LIBRARY})
public final class IconCompatParcelizer extends a {
    public static IconCompat read(VersionedParcel versionedParcel) {
        return a.read(versionedParcel);
    }

    public static void write(IconCompat iconCompat, VersionedParcel versionedParcel) {
        a.write(iconCompat, versionedParcel);
    }
}
