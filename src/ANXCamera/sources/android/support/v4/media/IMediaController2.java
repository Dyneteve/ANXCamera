package android.support.v4.media;

import android.app.PendingIntent;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.ResultReceiver;
import java.util.List;

public interface IMediaController2 extends IInterface {

    public static abstract class Stub extends Binder implements IMediaController2 {
        private static final String DESCRIPTOR = "android.support.v4.media.IMediaController2";
        static final int TRANSACTION_onAllowedCommandsChanged = 16;
        static final int TRANSACTION_onBufferingStateChanged = 4;
        static final int TRANSACTION_onChildrenChanged = 20;
        static final int TRANSACTION_onConnected = 13;
        static final int TRANSACTION_onCurrentMediaItemChanged = 1;
        static final int TRANSACTION_onCustomCommand = 17;
        static final int TRANSACTION_onCustomLayoutChanged = 15;
        static final int TRANSACTION_onDisconnected = 14;
        static final int TRANSACTION_onError = 11;
        static final int TRANSACTION_onGetChildrenDone = 21;
        static final int TRANSACTION_onGetItemDone = 19;
        static final int TRANSACTION_onGetLibraryRootDone = 18;
        static final int TRANSACTION_onGetSearchResultDone = 23;
        static final int TRANSACTION_onPlaybackInfoChanged = 7;
        static final int TRANSACTION_onPlaybackSpeedChanged = 3;
        static final int TRANSACTION_onPlayerStateChanged = 2;
        static final int TRANSACTION_onPlaylistChanged = 5;
        static final int TRANSACTION_onPlaylistMetadataChanged = 6;
        static final int TRANSACTION_onRepeatModeChanged = 8;
        static final int TRANSACTION_onRoutesInfoChanged = 12;
        static final int TRANSACTION_onSearchResultChanged = 22;
        static final int TRANSACTION_onSeekCompleted = 10;
        static final int TRANSACTION_onShuffleModeChanged = 9;

        private static class Proxy implements IMediaController2 {
            private IBinder mRemote;

            Proxy(IBinder iBinder) {
                this.mRemote = iBinder;
            }

            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            public void onAllowedCommandsChanged(Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(16, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onBufferingStateChanged(Bundle bundle, int i, long j) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(i);
                    obtain.writeLong(j);
                    this.mRemote.transact(4, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onChildrenChanged(String str, int i, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(20, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onConnected(IMediaSession2 iMediaSession2, Bundle bundle, int i, Bundle bundle2, long j, long j2, float f, long j3, Bundle bundle3, int i2, int i3, List<Bundle> list, PendingIntent pendingIntent) throws RemoteException {
                Bundle bundle4 = bundle;
                Bundle bundle5 = bundle2;
                Bundle bundle6 = bundle3;
                PendingIntent pendingIntent2 = pendingIntent;
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeStrongBinder(iMediaSession2 != null ? iMediaSession2.asBinder() : null);
                    if (bundle4 != null) {
                        obtain.writeInt(1);
                        bundle4.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(i);
                    if (bundle5 != null) {
                        obtain.writeInt(1);
                        bundle5.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeLong(j);
                    obtain.writeLong(j2);
                    obtain.writeFloat(f);
                    obtain.writeLong(j3);
                    if (bundle6 != null) {
                        obtain.writeInt(1);
                        bundle6.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeInt(i2);
                    obtain.writeInt(i3);
                    obtain.writeTypedList(list);
                    if (pendingIntent2 != null) {
                        obtain.writeInt(1);
                        pendingIntent2.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(13, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onCurrentMediaItemChanged(Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(1, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onCustomCommand(Bundle bundle, Bundle bundle2, ResultReceiver resultReceiver) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (bundle2 != null) {
                        obtain.writeInt(1);
                        bundle2.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    if (resultReceiver != null) {
                        obtain.writeInt(1);
                        resultReceiver.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(17, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onCustomLayoutChanged(List<Bundle> list) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeTypedList(list);
                    this.mRemote.transact(15, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onDisconnected() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(14, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onError(int i, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(i);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(11, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onGetChildrenDone(String str, int i, int i2, List<Bundle> list, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeTypedList(list);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(21, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onGetItemDone(String str, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(19, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onGetLibraryRootDone(Bundle bundle, String str, Bundle bundle2) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    obtain.writeString(str);
                    if (bundle2 != null) {
                        obtain.writeInt(1);
                        bundle2.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(18, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onGetSearchResultDone(String str, int i, int i2, List<Bundle> list, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    obtain.writeInt(i2);
                    obtain.writeTypedList(list);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(23, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onPlaybackInfoChanged(Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(7, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onPlaybackSpeedChanged(long j, long j2, float f) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeLong(j);
                    obtain.writeLong(j2);
                    obtain.writeFloat(f);
                    this.mRemote.transact(3, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onPlayerStateChanged(long j, long j2, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeLong(j);
                    obtain.writeLong(j2);
                    obtain.writeInt(i);
                    this.mRemote.transact(2, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onPlaylistChanged(List<Bundle> list, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeTypedList(list);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(5, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onPlaylistMetadataChanged(Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(6, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onRepeatModeChanged(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(i);
                    this.mRemote.transact(8, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onRoutesInfoChanged(List<Bundle> list) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeTypedList(list);
                    this.mRemote.transact(12, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onSearchResultChanged(String str, int i, Bundle bundle) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeString(str);
                    obtain.writeInt(i);
                    if (bundle != null) {
                        obtain.writeInt(1);
                        bundle.writeToParcel(obtain, 0);
                    } else {
                        obtain.writeInt(0);
                    }
                    this.mRemote.transact(22, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onSeekCompleted(long j, long j2, long j3) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeLong(j);
                    obtain.writeLong(j2);
                    obtain.writeLong(j3);
                    this.mRemote.transact(10, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            public void onShuffleModeChanged(int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeInt(i);
                    this.mRemote.transact(9, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IMediaController2 asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            return (queryLocalInterface == null || !(queryLocalInterface instanceof IMediaController2)) ? new Proxy(iBinder) : (IMediaController2) queryLocalInterface;
        }

        public IBinder asBinder() {
            return this;
        }

        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            int i3 = i;
            Parcel parcel3 = parcel;
            if (i3 != 1598968902) {
                switch (i3) {
                    case 1:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onCurrentMediaItemChanged(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 2:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onPlayerStateChanged(parcel.readLong(), parcel.readLong(), parcel.readInt());
                        return true;
                    case 3:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onPlaybackSpeedChanged(parcel.readLong(), parcel.readLong(), parcel.readFloat());
                        return true;
                    case 4:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onBufferingStateChanged(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null, parcel.readInt(), parcel.readLong());
                        return true;
                    case 5:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onPlaylistChanged(parcel3.createTypedArrayList(Bundle.CREATOR), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 6:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onPlaylistMetadataChanged(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 7:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onPlaybackInfoChanged(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 8:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onRepeatModeChanged(parcel.readInt());
                        return true;
                    case 9:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onShuffleModeChanged(parcel.readInt());
                        return true;
                    case 10:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onSeekCompleted(parcel.readLong(), parcel.readLong(), parcel.readLong());
                        return true;
                    case 11:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onError(parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 12:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onRoutesInfoChanged(parcel3.createTypedArrayList(Bundle.CREATOR));
                        return true;
                    case 13:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onConnected(android.support.v4.media.IMediaSession2.Stub.asInterface(parcel.readStrongBinder()), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null, parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null, parcel.readLong(), parcel.readLong(), parcel.readFloat(), parcel.readLong(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null, parcel.readInt(), parcel.readInt(), parcel3.createTypedArrayList(Bundle.CREATOR), parcel.readInt() != 0 ? (PendingIntent) PendingIntent.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 14:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onDisconnected();
                        return true;
                    case 15:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onCustomLayoutChanged(parcel3.createTypedArrayList(Bundle.CREATOR));
                        return true;
                    case 16:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onAllowedCommandsChanged(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 17:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onCustomCommand(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null, parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null, parcel.readInt() != 0 ? (ResultReceiver) ResultReceiver.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 18:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onGetLibraryRootDone(parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null, parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 19:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onGetItemDone(parcel.readString(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 20:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onChildrenChanged(parcel.readString(), parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 21:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onGetChildrenDone(parcel.readString(), parcel.readInt(), parcel.readInt(), parcel3.createTypedArrayList(Bundle.CREATOR), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 22:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onSearchResultChanged(parcel.readString(), parcel.readInt(), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    case 23:
                        parcel3.enforceInterface(DESCRIPTOR);
                        onGetSearchResultDone(parcel.readString(), parcel.readInt(), parcel.readInt(), parcel3.createTypedArrayList(Bundle.CREATOR), parcel.readInt() != 0 ? (Bundle) Bundle.CREATOR.createFromParcel(parcel3) : null);
                        return true;
                    default:
                        return super.onTransact(i, parcel, parcel2, i2);
                }
            } else {
                parcel2.writeString(DESCRIPTOR);
                return true;
            }
        }
    }

    void onAllowedCommandsChanged(Bundle bundle) throws RemoteException;

    void onBufferingStateChanged(Bundle bundle, int i, long j) throws RemoteException;

    void onChildrenChanged(String str, int i, Bundle bundle) throws RemoteException;

    void onConnected(IMediaSession2 iMediaSession2, Bundle bundle, int i, Bundle bundle2, long j, long j2, float f, long j3, Bundle bundle3, int i2, int i3, List<Bundle> list, PendingIntent pendingIntent) throws RemoteException;

    void onCurrentMediaItemChanged(Bundle bundle) throws RemoteException;

    void onCustomCommand(Bundle bundle, Bundle bundle2, ResultReceiver resultReceiver) throws RemoteException;

    void onCustomLayoutChanged(List<Bundle> list) throws RemoteException;

    void onDisconnected() throws RemoteException;

    void onError(int i, Bundle bundle) throws RemoteException;

    void onGetChildrenDone(String str, int i, int i2, List<Bundle> list, Bundle bundle) throws RemoteException;

    void onGetItemDone(String str, Bundle bundle) throws RemoteException;

    void onGetLibraryRootDone(Bundle bundle, String str, Bundle bundle2) throws RemoteException;

    void onGetSearchResultDone(String str, int i, int i2, List<Bundle> list, Bundle bundle) throws RemoteException;

    void onPlaybackInfoChanged(Bundle bundle) throws RemoteException;

    void onPlaybackSpeedChanged(long j, long j2, float f) throws RemoteException;

    void onPlayerStateChanged(long j, long j2, int i) throws RemoteException;

    void onPlaylistChanged(List<Bundle> list, Bundle bundle) throws RemoteException;

    void onPlaylistMetadataChanged(Bundle bundle) throws RemoteException;

    void onRepeatModeChanged(int i) throws RemoteException;

    void onRoutesInfoChanged(List<Bundle> list) throws RemoteException;

    void onSearchResultChanged(String str, int i, Bundle bundle) throws RemoteException;

    void onSeekCompleted(long j, long j2, long j3) throws RemoteException;

    void onShuffleModeChanged(int i) throws RemoteException;
}
