package androidx.a.a.a;

import android.content.res.ColorStateList;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.v4.graphics.drawable.IconCompat;
import androidx.versionedparcelable.VersionedParcel;

@RestrictTo({Scope.LIBRARY})
/* compiled from: IconCompatParcelizer */
public class a {
    public static IconCompat read(VersionedParcel versionedParcel) {
        IconCompat iconCompat = new IconCompat();
        iconCompat.mType = versionedParcel.readInt(iconCompat.mType, 1);
        iconCompat.mData = versionedParcel.b(iconCompat.mData, 2);
        iconCompat.mParcelable = versionedParcel.a(iconCompat.mParcelable, 3);
        iconCompat.mInt1 = versionedParcel.readInt(iconCompat.mInt1, 4);
        iconCompat.mInt2 = versionedParcel.readInt(iconCompat.mInt2, 5);
        iconCompat.mTintList = (ColorStateList) versionedParcel.a(iconCompat.mTintList, 6);
        iconCompat.mTintModeStr = versionedParcel.b(iconCompat.mTintModeStr, 7);
        iconCompat.onPostParceling();
        return iconCompat;
    }

    public static void write(IconCompat iconCompat, VersionedParcel versionedParcel) {
        versionedParcel.a(true, true);
        iconCompat.onPreParceling(versionedParcel.p());
        versionedParcel.a(iconCompat.mType, 1);
        versionedParcel.a(iconCompat.mData, 2);
        versionedParcel.writeParcelable(iconCompat.mParcelable, 3);
        versionedParcel.a(iconCompat.mInt1, 4);
        versionedParcel.a(iconCompat.mInt2, 5);
        versionedParcel.writeParcelable(iconCompat.mTintList, 6);
        versionedParcel.a(iconCompat.mTintModeStr, 7);
    }
}
