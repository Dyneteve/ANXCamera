package android.a.a;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* compiled from: IPackageInstallObserver */
public interface a extends IInterface {

    /* compiled from: IPackageInstallObserver */
    /* renamed from: android.a.a.a$a reason: collision with other inner class name */
    public static abstract class C0000a extends Binder implements a {
        private static final String DESCRIPTOR = "android.content.pm.IPackageInstallObserver";
        static final int TRANSACTION_onPackageInstalled = 1;

        /* compiled from: IPackageInstallObserver */
        /* renamed from: android.a.a.a$a$a reason: collision with other inner class name */
        private static class C0001a implements a {
            private IBinder mRemote;

            C0001a(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            public void a(String str, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(C0000a.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    this.mRemote.transact(1, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return C0000a.DESCRIPTOR;
            }
        }

        public C0000a() {
            attachInterface(this, DESCRIPTOR);
        }

        public static a a(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            return (queryLocalInterface == null || !(queryLocalInterface instanceof a)) ? new C0001a(iBinder) : (a) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            String str = DESCRIPTOR;
            if (i == 1) {
                parcel.enforceInterface(str);
                a(parcel.readString(), parcel.readInt());
                return true;
            } else if (i != 1598968902) {
                return super.onTransact(i, parcel, parcel2, i2);
            } else {
                parcel2.writeString(str);
                return true;
            }
        }
    }

    void a(String str, int i) throws RemoteException;
}
