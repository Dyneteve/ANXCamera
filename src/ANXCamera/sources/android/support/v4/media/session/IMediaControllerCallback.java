package android.support.v4.media.session;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.session.MediaSessionCompat.QueueItem;
import android.text.TextUtils;
import java.util.List;

public interface IMediaControllerCallback extends IInterface {

    public static abstract class Stub extends Binder implements IMediaControllerCallback {
        private static final String DESCRIPTOR = "android.support.v4.media.session.IMediaControllerCallback";
        static final int TRANSACTION_onEvent = 1;
        static final int TRANSACTION_onExtrasChanged = 7;
        static final int TRANSACTION_onMetadataChanged = 4;
        static final int TRANSACTION_onPlaybackStateChanged = 3;
        static final int TRANSACTION_onQueueChanged = 5;
        static final int TRANSACTION_onQueueTitleChanged = 6;
        static final int TRANSACTION_onSessionDestroyed = 2;
        static final int TRANSACTION_onVolumeInfoChanged = 8;

        private static class Proxy implements IMediaControllerCallback {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                this.mRemote = remote;
            }

            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            public void onEvent(String event, Bundle extras) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeString(event);
                    if (extras != null) {
                        _data.writeInt(1);
                        extras.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(1, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void onSessionDestroyed() throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(2, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void onPlaybackStateChanged(PlaybackStateCompat state) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (state != null) {
                        _data.writeInt(1);
                        state.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(3, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void onMetadataChanged(MediaMetadataCompat metadata) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (metadata != null) {
                        _data.writeInt(1);
                        metadata.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(4, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void onQueueChanged(List<QueueItem> queue) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    _data.writeTypedList(queue);
                    this.mRemote.transact(5, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void onQueueTitleChanged(CharSequence title) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (title != null) {
                        _data.writeInt(1);
                        TextUtils.writeToParcel(title, _data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(6, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void onExtrasChanged(Bundle extras) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (extras != null) {
                        _data.writeInt(1);
                        extras.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(7, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }

            public void onVolumeInfoChanged(ParcelableVolumeInfo info) throws RemoteException {
                Parcel _data = Parcel.obtain();
                try {
                    _data.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (info != null) {
                        _data.writeInt(1);
                        info.writeToParcel(_data, 0);
                    } else {
                        _data.writeInt(0);
                    }
                    this.mRemote.transact(8, _data, null, 1);
                } finally {
                    _data.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IMediaControllerCallback asInterface(IBinder obj) {
            if (obj == null) {
                return null;
            }
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin == null || !(iin instanceof IMediaControllerCallback)) {
                return new Proxy(obj);
            }
            return (IMediaControllerCallback) iin;
        }

        public IBinder asBinder() {
            return this;
        }

        /* JADX WARNING: type inference failed for: r0v2 */
        /* JADX WARNING: type inference failed for: r0v3, types: [android.os.Bundle] */
        /* JADX WARNING: type inference failed for: r0v6, types: [android.os.Bundle] */
        /* JADX WARNING: type inference failed for: r0v8, types: [android.support.v4.media.session.PlaybackStateCompat] */
        /* JADX WARNING: type inference failed for: r0v11, types: [android.support.v4.media.session.PlaybackStateCompat] */
        /* JADX WARNING: type inference failed for: r0v12, types: [android.support.v4.media.MediaMetadataCompat] */
        /* JADX WARNING: type inference failed for: r0v15, types: [android.support.v4.media.MediaMetadataCompat] */
        /* JADX WARNING: type inference failed for: r0v19, types: [java.lang.CharSequence] */
        /* JADX WARNING: type inference failed for: r0v22, types: [java.lang.CharSequence] */
        /* JADX WARNING: type inference failed for: r0v23, types: [android.os.Bundle] */
        /* JADX WARNING: type inference failed for: r0v26, types: [android.os.Bundle] */
        /* JADX WARNING: type inference failed for: r0v27, types: [android.support.v4.media.session.ParcelableVolumeInfo] */
        /* JADX WARNING: type inference failed for: r0v30, types: [android.support.v4.media.session.ParcelableVolumeInfo] */
        /* JADX WARNING: type inference failed for: r0v32 */
        /* JADX WARNING: type inference failed for: r0v33 */
        /* JADX WARNING: type inference failed for: r0v34 */
        /* JADX WARNING: type inference failed for: r0v35 */
        /* JADX WARNING: type inference failed for: r0v36 */
        /* JADX WARNING: type inference failed for: r0v37 */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v32
  assigns: [?[int, float, boolean, short, byte, char, OBJECT, ARRAY], android.support.v4.media.session.ParcelableVolumeInfo]
  uses: [android.os.Bundle, android.support.v4.media.session.ParcelableVolumeInfo]
  mth insns count: 79
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 11 */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            ? r0;
            ? r02;
            ? r03;
            ? r04;
            ? r05;
            if (code != 1598968902) {
                ? r06 = 0;
                switch (code) {
                    case 1:
                        data.enforceInterface(DESCRIPTOR);
                        String _arg0 = data.readString();
                        if (data.readInt() != 0) {
                            r0 = (Bundle) Bundle.CREATOR.createFromParcel(data);
                        }
                        onEvent(_arg0, r0);
                        return true;
                    case 2:
                        data.enforceInterface(DESCRIPTOR);
                        onSessionDestroyed();
                        return true;
                    case 3:
                        data.enforceInterface(DESCRIPTOR);
                        if (data.readInt() != 0) {
                            r02 = (PlaybackStateCompat) PlaybackStateCompat.CREATOR.createFromParcel(data);
                        }
                        onPlaybackStateChanged(r02);
                        return true;
                    case 4:
                        data.enforceInterface(DESCRIPTOR);
                        if (data.readInt() != 0) {
                            r03 = (MediaMetadataCompat) MediaMetadataCompat.CREATOR.createFromParcel(data);
                        }
                        onMetadataChanged(r03);
                        return true;
                    case 5:
                        data.enforceInterface(DESCRIPTOR);
                        onQueueChanged(data.createTypedArrayList(QueueItem.CREATOR));
                        return true;
                    case 6:
                        data.enforceInterface(DESCRIPTOR);
                        if (data.readInt() != 0) {
                            r04 = (CharSequence) TextUtils.CHAR_SEQUENCE_CREATOR.createFromParcel(data);
                        }
                        onQueueTitleChanged(r04);
                        return true;
                    case 7:
                        data.enforceInterface(DESCRIPTOR);
                        if (data.readInt() != 0) {
                            r05 = (Bundle) Bundle.CREATOR.createFromParcel(data);
                        }
                        onExtrasChanged(r05);
                        return true;
                    case 8:
                        data.enforceInterface(DESCRIPTOR);
                        if (data.readInt() != 0) {
                            r06 = (ParcelableVolumeInfo) ParcelableVolumeInfo.CREATOR.createFromParcel(data);
                        }
                        onVolumeInfoChanged(r06);
                        return true;
                    default:
                        return super.onTransact(code, data, reply, flags);
                }
            } else {
                reply.writeString(DESCRIPTOR);
                return true;
            }
        }
    }

    void onEvent(String str, Bundle bundle) throws RemoteException;

    void onExtrasChanged(Bundle bundle) throws RemoteException;

    void onMetadataChanged(MediaMetadataCompat mediaMetadataCompat) throws RemoteException;

    void onPlaybackStateChanged(PlaybackStateCompat playbackStateCompat) throws RemoteException;

    void onQueueChanged(List<QueueItem> list) throws RemoteException;

    void onQueueTitleChanged(CharSequence charSequence) throws RemoteException;

    void onSessionDestroyed() throws RemoteException;

    void onVolumeInfoChanged(ParcelableVolumeInfo parcelableVolumeInfo) throws RemoteException;
}
