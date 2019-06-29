package androidx.versionedparcelable;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;

@RestrictTo({Scope.LIBRARY})
public class ParcelImpl implements Parcelable {
    public static final Creator<ParcelImpl> CREATOR = new Creator<ParcelImpl>() {
        /* renamed from: a */
        public ParcelImpl createFromParcel(Parcel parcel) {
            return new ParcelImpl(parcel);
        }

        /* renamed from: c */
        public ParcelImpl[] newArray(int i) {
            return new ParcelImpl[i];
        }
    };
    private final g an;

    protected ParcelImpl(Parcel parcel) {
        this.an = new e(parcel).y();
    }

    public ParcelImpl(g gVar) {
        this.an = gVar;
    }

    public int describeContents() {
        return 0;
    }

    public <T extends g> T o() {
        return this.an;
    }

    public void writeToParcel(Parcel parcel, int i) {
        new e(parcel).b(this.an);
    }
}
