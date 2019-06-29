package androidx.versionedparcelable;

import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcelable;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.v4.internal.view.SupportMenu;
import android.util.SparseArray;
import androidx.versionedparcelable.VersionedParcel.ParcelException;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.util.Set;

@RestrictTo({Scope.LIBRARY})
/* compiled from: VersionedParcelStream */
class f extends VersionedParcel {
    private static final int TYPE_BOOLEAN = 5;
    private static final int TYPE_DOUBLE = 7;
    private static final int TYPE_FLOAT = 13;
    private static final int TYPE_INT = 9;
    private static final int TYPE_LONG = 11;
    private static final int TYPE_NULL = 0;
    private static final int TYPE_STRING = 3;
    private static final int TYPE_STRING_ARRAY = 4;
    private static final Charset UTF_16 = Charset.forName("UTF-16");
    private static final int aE = 1;
    private static final int aF = 2;
    private static final int aG = 6;
    private static final int aH = 8;
    private static final int aI = 10;
    private static final int aJ = 12;
    private static final int aK = 14;
    private final DataInputStream aL;
    private final DataOutputStream aM;
    private final SparseArray<b> aN = new SparseArray<>();
    private DataInputStream aO;
    private DataOutputStream aP;
    private a aQ;
    private boolean aR;

    /* compiled from: VersionedParcelStream */
    private static class a {
        /* access modifiers changed from: private */
        public final ByteArrayOutputStream aS = new ByteArrayOutputStream();
        /* access modifiers changed from: private */
        public final DataOutputStream aT = new DataOutputStream(this.aS);
        private final int aU;
        private final DataOutputStream aV;

        a(int i, DataOutputStream dataOutputStream) {
            this.aU = i;
            this.aV = dataOutputStream;
        }

        /* access modifiers changed from: 0000 */
        public void z() throws IOException {
            this.aT.flush();
            int size = this.aS.size();
            this.aV.writeInt((this.aU << 16) | (size >= 65535 ? 65535 : size));
            if (size >= 65535) {
                this.aV.writeInt(size);
            }
            this.aS.writeTo(this.aV);
        }
    }

    /* compiled from: VersionedParcelStream */
    private static class b {
        /* access modifiers changed from: private */
        public final int aU;
        /* access modifiers changed from: private */
        public final DataInputStream aW;
        private final int mSize;

        b(int i, int i2, DataInputStream dataInputStream) throws IOException {
            this.mSize = i2;
            this.aU = i;
            byte[] bArr = new byte[this.mSize];
            dataInputStream.readFully(bArr);
            this.aW = new DataInputStream(new ByteArrayInputStream(bArr));
        }
    }

    public f(InputStream inputStream, OutputStream outputStream) {
        DataOutputStream dataOutputStream = null;
        this.aL = inputStream != null ? new DataInputStream(inputStream) : null;
        if (outputStream != null) {
            dataOutputStream = new DataOutputStream(outputStream);
        }
        this.aM = dataOutputStream;
        this.aO = this.aL;
        this.aP = this.aM;
    }

    private void a(int i, String str, Bundle bundle) {
        switch (i) {
            case 0:
                bundle.putParcelable(str, null);
                return;
            case 1:
                bundle.putBundle(str, readBundle());
                return;
            case 2:
                bundle.putBundle(str, readBundle());
                return;
            case 3:
                bundle.putString(str, readString());
                return;
            case 4:
                bundle.putStringArray(str, (String[]) a((T[]) new String[0]));
                return;
            case 5:
                bundle.putBoolean(str, readBoolean());
                return;
            case 6:
                bundle.putBooleanArray(str, t());
                return;
            case 7:
                bundle.putDouble(str, readDouble());
                return;
            case 8:
                bundle.putDoubleArray(str, x());
                return;
            case 9:
                bundle.putInt(str, readInt());
                return;
            case 10:
                bundle.putIntArray(str, u());
                return;
            case 11:
                bundle.putLong(str, readLong());
                return;
            case 12:
                bundle.putLongArray(str, v());
                return;
            case 13:
                bundle.putFloat(str, readFloat());
                return;
            case 14:
                bundle.putFloatArray(str, w());
                return;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unknown type ");
                sb.append(i);
                throw new RuntimeException(sb.toString());
        }
    }

    private void writeObject(Object obj) {
        if (obj == null) {
            writeInt(0);
        } else if (obj instanceof Bundle) {
            writeInt(1);
            writeBundle((Bundle) obj);
        } else if (obj instanceof String) {
            writeInt(3);
            writeString((String) obj);
        } else if (obj instanceof String[]) {
            writeInt(4);
            writeArray((String[]) obj);
        } else if (obj instanceof Boolean) {
            writeInt(5);
            writeBoolean(((Boolean) obj).booleanValue());
        } else if (obj instanceof boolean[]) {
            writeInt(6);
            writeBooleanArray((boolean[]) obj);
        } else if (obj instanceof Double) {
            writeInt(7);
            writeDouble(((Double) obj).doubleValue());
        } else if (obj instanceof double[]) {
            writeInt(8);
            writeDoubleArray((double[]) obj);
        } else if (obj instanceof Integer) {
            writeInt(9);
            writeInt(((Integer) obj).intValue());
        } else if (obj instanceof int[]) {
            writeInt(10);
            writeIntArray((int[]) obj);
        } else if (obj instanceof Long) {
            writeInt(11);
            writeLong(((Long) obj).longValue());
        } else if (obj instanceof long[]) {
            writeInt(12);
            writeLongArray((long[]) obj);
        } else if (obj instanceof Float) {
            writeInt(13);
            writeFloat(((Float) obj).floatValue());
        } else if (obj instanceof float[]) {
            writeInt(14);
            writeFloatArray((float[]) obj);
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Unsupported type ");
            sb.append(obj.getClass());
            throw new IllegalArgumentException(sb.toString());
        }
    }

    public void a(boolean z, boolean z2) {
        if (z) {
            this.aR = z2;
            return;
        }
        throw new RuntimeException("Serialization of this object is not allowed");
    }

    public void b(Parcelable parcelable) {
        if (!this.aR) {
            throw new RuntimeException("Parcelables cannot be written to an OutputStream");
        }
    }

    public boolean d(int i) {
        b bVar = (b) this.aN.get(i);
        if (bVar != null) {
            this.aN.remove(i);
            this.aO = bVar.aW;
            return true;
        }
        while (true) {
            try {
                int readInt = this.aL.readInt();
                int i2 = readInt & SupportMenu.USER_MASK;
                if (i2 == 65535) {
                    i2 = this.aL.readInt();
                }
                b bVar2 = new b((readInt >> 16) & SupportMenu.USER_MASK, i2, this.aL);
                if (bVar2.aU == i) {
                    this.aO = bVar2.aW;
                    return true;
                }
                this.aN.put(bVar2.aU, bVar2);
            } catch (IOException e) {
                return false;
            }
        }
    }

    public void e(int i) {
        q();
        this.aQ = new a(i, this.aM);
        this.aP = this.aQ.aT;
    }

    public boolean p() {
        return true;
    }

    public void q() {
        if (this.aQ != null) {
            try {
                if (this.aQ.aS.size() != 0) {
                    this.aQ.z();
                }
                this.aQ = null;
            } catch (IOException e) {
                throw new ParcelException(e);
            }
        }
    }

    /* access modifiers changed from: protected */
    public VersionedParcel r() {
        return new f(this.aO, this.aP);
    }

    public boolean readBoolean() {
        try {
            return this.aO.readBoolean();
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public Bundle readBundle() {
        int readInt = readInt();
        if (readInt < 0) {
            return null;
        }
        Bundle bundle = new Bundle();
        for (int i = 0; i < readInt; i++) {
            a(readInt(), readString(), bundle);
        }
        return bundle;
    }

    public byte[] readByteArray() {
        try {
            int readInt = this.aO.readInt();
            if (readInt <= 0) {
                return null;
            }
            byte[] bArr = new byte[readInt];
            this.aO.readFully(bArr);
            return bArr;
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public double readDouble() {
        try {
            return this.aO.readDouble();
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public float readFloat() {
        try {
            return this.aO.readFloat();
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public int readInt() {
        try {
            return this.aO.readInt();
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public long readLong() {
        try {
            return this.aO.readLong();
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public String readString() {
        try {
            int readInt = this.aO.readInt();
            if (readInt <= 0) {
                return null;
            }
            byte[] bArr = new byte[readInt];
            this.aO.readFully(bArr);
            return new String(bArr, UTF_16);
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public IBinder readStrongBinder() {
        return null;
    }

    public <T extends Parcelable> T s() {
        return null;
    }

    public void writeBoolean(boolean z) {
        try {
            this.aP.writeBoolean(z);
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public void writeBundle(Bundle bundle) {
        if (bundle != null) {
            try {
                Set<String> keySet = bundle.keySet();
                this.aP.writeInt(keySet.size());
                for (String str : keySet) {
                    writeString(str);
                    writeObject(bundle.get(str));
                }
            } catch (IOException e) {
                throw new ParcelException(e);
            }
        } else {
            this.aP.writeInt(-1);
        }
    }

    public void writeByteArray(byte[] bArr) {
        if (bArr != null) {
            try {
                this.aP.writeInt(bArr.length);
                this.aP.write(bArr);
            } catch (IOException e) {
                throw new ParcelException(e);
            }
        } else {
            this.aP.writeInt(-1);
        }
    }

    public void writeByteArray(byte[] bArr, int i, int i2) {
        if (bArr != null) {
            try {
                this.aP.writeInt(i2);
                this.aP.write(bArr, i, i2);
            } catch (IOException e) {
                throw new ParcelException(e);
            }
        } else {
            this.aP.writeInt(-1);
        }
    }

    public void writeDouble(double d) {
        try {
            this.aP.writeDouble(d);
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public void writeFloat(float f) {
        try {
            this.aP.writeFloat(f);
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public void writeInt(int i) {
        try {
            this.aP.writeInt(i);
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public void writeLong(long j) {
        try {
            this.aP.writeLong(j);
        } catch (IOException e) {
            throw new ParcelException(e);
        }
    }

    public void writeString(String str) {
        if (str != null) {
            try {
                byte[] bytes = str.getBytes(UTF_16);
                this.aP.writeInt(bytes.length);
                this.aP.write(bytes);
            } catch (IOException e) {
                throw new ParcelException(e);
            }
        } else {
            this.aP.writeInt(-1);
        }
    }

    public void writeStrongBinder(IBinder iBinder) {
        if (!this.aR) {
            throw new RuntimeException("Binders cannot be written to an OutputStream");
        }
    }

    public void writeStrongInterface(IInterface iInterface) {
        if (!this.aR) {
            throw new RuntimeException("Binders cannot be written to an OutputStream");
        }
    }
}
