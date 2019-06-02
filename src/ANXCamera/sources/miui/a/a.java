package miui.a;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/* compiled from: IPopupCameraManager */
public interface a extends IInterface {

    /* compiled from: IPopupCameraManager */
    /* renamed from: miui.a.a$a reason: collision with other inner class name */
    public static abstract class C0014a extends Binder implements a {
        private static final String DESCRIPTOR = "miui.popupcamera.IPopupCameraManager";
        static final int vU = 1;
        static final int vV = 2;
        static final int vW = 3;
        static final int vX = 4;
        static final int vY = 5;

        /* compiled from: IPopupCameraManager */
        /* renamed from: miui.a.a$a$a reason: collision with other inner class name */
        private static class C0015a implements a {
            private IBinder mRemote;

            C0015a(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            public boolean a(int i, int i2, String str) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(C0014a.DESCRIPTOR);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeString(str);
                    boolean z = false;
                    this.mRemote.transact(1, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return C0014a.DESCRIPTOR;
            }

            public int getMotorStatus() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(C0014a.DESCRIPTOR);
                    this.mRemote.transact(4, obtain, obtain2, 0);
                    obtain2.readException();
                    return obtain2.readInt();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public void iL() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(C0014a.DESCRIPTOR);
                    this.mRemote.transact(5, obtain, obtain2, 0);
                    obtain2.readException();
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public boolean popupMotor() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(C0014a.DESCRIPTOR);
                    boolean z = false;
                    this.mRemote.transact(2, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }

            public boolean takebackMotor() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel obtain2 = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(C0014a.DESCRIPTOR);
                    boolean z = false;
                    this.mRemote.transact(3, obtain, obtain2, 0);
                    obtain2.readException();
                    if (obtain2.readInt() != 0) {
                        z = true;
                    }
                    return z;
                } finally {
                    obtain2.recycle();
                    obtain.recycle();
                }
            }
        }

        public C0014a() {
            attachInterface(this, DESCRIPTOR);
        }

        public static a b(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            return (queryLocalInterface == null || !(queryLocalInterface instanceof a)) ? new C0015a(iBinder) : (a) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            String str = DESCRIPTOR;
            if (i != 1598968902) {
                switch (i) {
                    case 1:
                        parcel.enforceInterface(str);
                        boolean a = a(parcel.readInt(), parcel.readInt(), parcel.readString());
                        parcel2.writeNoException();
                        parcel2.writeInt(a ? 1 : 0);
                        return true;
                    case 2:
                        parcel.enforceInterface(str);
                        boolean popupMotor = popupMotor();
                        parcel2.writeNoException();
                        parcel2.writeInt(popupMotor ? 1 : 0);
                        return true;
                    case 3:
                        parcel.enforceInterface(str);
                        boolean takebackMotor = takebackMotor();
                        parcel2.writeNoException();
                        parcel2.writeInt(takebackMotor ? 1 : 0);
                        return true;
                    case 4:
                        parcel.enforceInterface(str);
                        int motorStatus = getMotorStatus();
                        parcel2.writeNoException();
                        parcel2.writeInt(motorStatus);
                        return true;
                    case 5:
                        parcel.enforceInterface(str);
                        iL();
                        parcel2.writeNoException();
                        return true;
                    default:
                        return super.onTransact(i, parcel, parcel2, i2);
                }
            } else {
                parcel2.writeString(str);
                return true;
            }
        }
    }

    boolean a(int i, int i2, String str) throws RemoteException;

    int getMotorStatus() throws RemoteException;

    void iL() throws RemoteException;

    boolean popupMotor() throws RemoteException;

    boolean takebackMotor() throws RemoteException;
}
