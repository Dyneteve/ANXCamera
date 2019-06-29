package android.support.v4.media;

import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import android.support.v4.media.MediaBrowser2.BrowserCallback;
import android.util.Log;
import java.util.concurrent.Executor;

class MediaBrowser2ImplBase extends MediaController2ImplBase implements SupportLibraryImpl {
    MediaBrowser2ImplBase(Context context, MediaController2 mediaController2, SessionToken2 sessionToken2, Executor executor, BrowserCallback browserCallback) {
        super(context, mediaController2, sessionToken2, executor, browserCallback);
    }

    public BrowserCallback getCallback() {
        return (BrowserCallback) super.getCallback();
    }

    public void getChildren(String str, int i, int i2, Bundle bundle) {
        IMediaSession2 sessionInterfaceIfAble = getSessionInterfaceIfAble(29);
        if (sessionInterfaceIfAble != null) {
            try {
                sessionInterfaceIfAble.getChildren(this.mControllerStub, str, i, i2, bundle);
            } catch (RemoteException e) {
                Log.w("MC2ImplBase", "Cannot connect to the service or the session is gone", e);
            }
        }
    }

    public void getItem(String str) {
        IMediaSession2 sessionInterfaceIfAble = getSessionInterfaceIfAble(30);
        if (sessionInterfaceIfAble != null) {
            try {
                sessionInterfaceIfAble.getItem(this.mControllerStub, str);
            } catch (RemoteException e) {
                Log.w("MC2ImplBase", "Cannot connect to the service or the session is gone", e);
            }
        }
    }

    public void getLibraryRoot(Bundle bundle) {
        IMediaSession2 sessionInterfaceIfAble = getSessionInterfaceIfAble(31);
        if (sessionInterfaceIfAble != null) {
            try {
                sessionInterfaceIfAble.getLibraryRoot(this.mControllerStub, bundle);
            } catch (RemoteException e) {
                Log.w("MC2ImplBase", "Cannot connect to the service or the session is gone", e);
            }
        }
    }

    public void getSearchResult(String str, int i, int i2, Bundle bundle) {
        IMediaSession2 sessionInterfaceIfAble = getSessionInterfaceIfAble(32);
        if (sessionInterfaceIfAble != null) {
            try {
                sessionInterfaceIfAble.getSearchResult(this.mControllerStub, str, i, i2, bundle);
            } catch (RemoteException e) {
                Log.w("MC2ImplBase", "Cannot connect to the service or the session is gone", e);
            }
        }
    }

    public void search(String str, Bundle bundle) {
        IMediaSession2 sessionInterfaceIfAble = getSessionInterfaceIfAble(33);
        if (sessionInterfaceIfAble != null) {
            try {
                sessionInterfaceIfAble.search(this.mControllerStub, str, bundle);
            } catch (RemoteException e) {
                Log.w("MC2ImplBase", "Cannot connect to the service or the session is gone", e);
            }
        }
    }

    public void subscribe(String str, Bundle bundle) {
        IMediaSession2 sessionInterfaceIfAble = getSessionInterfaceIfAble(34);
        if (sessionInterfaceIfAble != null) {
            try {
                sessionInterfaceIfAble.subscribe(this.mControllerStub, str, bundle);
            } catch (RemoteException e) {
                Log.w("MC2ImplBase", "Cannot connect to the service or the session is gone", e);
            }
        }
    }

    public void unsubscribe(String str) {
        IMediaSession2 sessionInterfaceIfAble = getSessionInterfaceIfAble(35);
        if (sessionInterfaceIfAble != null) {
            try {
                sessionInterfaceIfAble.unsubscribe(this.mControllerStub, str);
            } catch (RemoteException e) {
                Log.w("MC2ImplBase", "Cannot connect to the service or the session is gone", e);
            }
        }
    }
}
