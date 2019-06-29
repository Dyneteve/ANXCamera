package android.support.v4.media;

import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.annotation.GuardedBy;
import android.support.v4.media.MediaLibraryService2.LibraryRoot;
import android.support.v4.media.MediaLibraryService2.MediaLibrarySession;
import android.support.v4.media.MediaLibraryService2.MediaLibrarySession.MediaLibrarySessionCallback;
import android.support.v4.media.MediaSession2.ControllerInfo;
import android.support.v4.media.MediaSession2.SessionCallback;
import android.support.v4.util.ArrayMap;
import android.text.TextUtils;
import android.util.Log;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;

@TargetApi(19)
class MediaLibrarySessionImplBase extends MediaSession2ImplBase implements SupportLibraryImpl {
    private final MediaBrowserServiceCompat mBrowserServiceLegacyStub = new MediaLibraryService2LegacyStub(this);
    @GuardedBy("mLock")
    private final ArrayMap<ControllerInfo, Set<String>> mSubscriptions = new ArrayMap<>();

    MediaLibrarySessionImplBase(MediaLibrarySession mediaLibrarySession, Context context, String str, BaseMediaPlayer baseMediaPlayer, MediaPlaylistAgent mediaPlaylistAgent, VolumeProviderCompat volumeProviderCompat, PendingIntent pendingIntent, Executor executor, SessionCallback sessionCallback) {
        super(mediaLibrarySession, context, str, baseMediaPlayer, mediaPlaylistAgent, volumeProviderCompat, pendingIntent, executor, sessionCallback);
        this.mBrowserServiceLegacyStub.attachToBaseContext(context);
        this.mBrowserServiceLegacyStub.onCreate();
    }

    /* access modifiers changed from: private */
    public void dumpSubscription() {
        if (DEBUG) {
            synchronized (this.mLock) {
                String str = "MS2ImplBase";
                StringBuilder sb = new StringBuilder();
                sb.append("Dumping subscription, controller sz=");
                sb.append(this.mSubscriptions.size());
                Log.d(str, sb.toString());
                for (int i = 0; i < this.mSubscriptions.size(); i++) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("  controller ");
                    sb2.append(this.mSubscriptions.valueAt(i));
                    Log.d("MS2ImplBase", sb2.toString());
                    for (String str2 : (Set) this.mSubscriptions.valueAt(i)) {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("  - ");
                        sb3.append(str2);
                        Log.d("MS2ImplBase", sb3.toString());
                    }
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public boolean isSubscribed(ControllerInfo controllerInfo, String str) {
        synchronized (this.mLock) {
            Set set = (Set) this.mSubscriptions.get(controllerInfo);
            if (set != null) {
                if (set.contains(str)) {
                    return true;
                }
            }
            return false;
        }
    }

    public MediaLibrarySessionCallback getCallback() {
        return (MediaLibrarySessionCallback) super.getCallback();
    }

    public MediaLibrarySession getInstance() {
        return (MediaLibrarySession) super.getInstance();
    }

    public IBinder getLegacySessionBinder() {
        return this.mBrowserServiceLegacyStub.onBind(new Intent(MediaBrowserServiceCompat.SERVICE_INTERFACE));
    }

    public void notifyChildrenChanged(ControllerInfo controllerInfo, String str, int i, Bundle bundle) {
        if (controllerInfo == null) {
            throw new IllegalArgumentException("controller shouldn't be null");
        } else if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("query shouldn't be empty");
        } else if (i >= 0) {
            final ControllerInfo controllerInfo2 = controllerInfo;
            final String str2 = str;
            final int i2 = i;
            final Bundle bundle2 = bundle;
            AnonymousClass2 r1 = new NotifyRunnable() {
                public void run(ControllerCb controllerCb) throws RemoteException {
                    if (!MediaLibrarySessionImplBase.this.isSubscribed(controllerInfo2, str2)) {
                        if (MediaSession2ImplBase.DEBUG) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("Skipping notifyChildrenChanged() to ");
                            sb.append(controllerInfo2);
                            sb.append(" because it hasn't subscribed");
                            Log.d("MS2ImplBase", sb.toString());
                            MediaLibrarySessionImplBase.this.dumpSubscription();
                        }
                        return;
                    }
                    controllerCb.onChildrenChanged(str2, i2, bundle2);
                }
            };
            notifyToController(controllerInfo, r1);
        } else {
            throw new IllegalArgumentException("itemCount shouldn't be negative");
        }
    }

    public void notifyChildrenChanged(final String str, final int i, final Bundle bundle) {
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("query shouldn't be empty");
        } else if (i >= 0) {
            List connectedControllers = getConnectedControllers();
            AnonymousClass1 r1 = new NotifyRunnable() {
                public void run(ControllerCb controllerCb) throws RemoteException {
                    controllerCb.onChildrenChanged(str, i, bundle);
                }
            };
            for (int i2 = 0; i2 < connectedControllers.size(); i2++) {
                if (isSubscribed((ControllerInfo) connectedControllers.get(i2), str)) {
                    notifyToController((ControllerInfo) connectedControllers.get(i2), r1);
                }
            }
        } else {
            throw new IllegalArgumentException("itemCount shouldn't be negative");
        }
    }

    public void notifySearchResultChanged(ControllerInfo controllerInfo, final String str, final int i, final Bundle bundle) {
        if (controllerInfo == null) {
            throw new IllegalArgumentException("controller shouldn't be null");
        } else if (!TextUtils.isEmpty(str)) {
            notifyToController(controllerInfo, new NotifyRunnable() {
                public void run(ControllerCb controllerCb) throws RemoteException {
                    controllerCb.onSearchResultChanged(str, i, bundle);
                }
            });
        } else {
            throw new IllegalArgumentException("query shouldn't be empty");
        }
    }

    public void onGetChildrenOnExecutor(ControllerInfo controllerInfo, String str, int i, int i2, Bundle bundle) {
        final List onGetChildren = getCallback().onGetChildren(getInstance(), controllerInfo, str, i, i2, bundle);
        if (onGetChildren == null || onGetChildren.size() <= i2) {
            final String str2 = str;
            final int i3 = i;
            final int i4 = i2;
            final Bundle bundle2 = bundle;
            AnonymousClass6 r2 = new NotifyRunnable() {
                public void run(ControllerCb controllerCb) throws RemoteException {
                    controllerCb.onGetChildrenDone(str2, i3, i4, onGetChildren, bundle2);
                }
            };
            notifyToController(controllerInfo, r2);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("onGetChildren() shouldn't return media items more than pageSize. result.size()=");
        sb.append(onGetChildren.size());
        sb.append(" pageSize=");
        sb.append(i2);
        throw new IllegalArgumentException(sb.toString());
    }

    public void onGetItemOnExecutor(ControllerInfo controllerInfo, final String str) {
        final MediaItem2 onGetItem = getCallback().onGetItem(getInstance(), controllerInfo, str);
        notifyToController(controllerInfo, new NotifyRunnable() {
            public void run(ControllerCb controllerCb) throws RemoteException {
                controllerCb.onGetItemDone(str, onGetItem);
            }
        });
    }

    public void onGetLibraryRootOnExecutor(ControllerInfo controllerInfo, final Bundle bundle) {
        final LibraryRoot onGetLibraryRoot = getCallback().onGetLibraryRoot(getInstance(), controllerInfo, bundle);
        notifyToController(controllerInfo, new NotifyRunnable() {
            public void run(ControllerCb controllerCb) throws RemoteException {
                Bundle bundle = bundle;
                Bundle bundle2 = null;
                String rootId = onGetLibraryRoot == null ? null : onGetLibraryRoot.getRootId();
                if (onGetLibraryRoot != null) {
                    bundle2 = onGetLibraryRoot.getExtras();
                }
                controllerCb.onGetLibraryRootDone(bundle, rootId, bundle2);
            }
        });
    }

    public void onGetSearchResultOnExecutor(ControllerInfo controllerInfo, String str, int i, int i2, Bundle bundle) {
        final List onGetSearchResult = getCallback().onGetSearchResult(getInstance(), controllerInfo, str, i, i2, bundle);
        if (onGetSearchResult == null || onGetSearchResult.size() <= i2) {
            final String str2 = str;
            final int i3 = i;
            final int i4 = i2;
            final Bundle bundle2 = bundle;
            AnonymousClass7 r2 = new NotifyRunnable() {
                public void run(ControllerCb controllerCb) throws RemoteException {
                    controllerCb.onGetSearchResultDone(str2, i3, i4, onGetSearchResult, bundle2);
                }
            };
            notifyToController(controllerInfo, r2);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("onGetSearchResult() shouldn't return media items more than pageSize. result.size()=");
        sb.append(onGetSearchResult.size());
        sb.append(" pageSize=");
        sb.append(i2);
        throw new IllegalArgumentException(sb.toString());
    }

    public void onSearchOnExecutor(ControllerInfo controllerInfo, String str, Bundle bundle) {
        getCallback().onSearch(getInstance(), controllerInfo, str, bundle);
    }

    public void onSubscribeOnExecutor(ControllerInfo controllerInfo, String str, Bundle bundle) {
        synchronized (this.mLock) {
            Set set = (Set) this.mSubscriptions.get(controllerInfo);
            if (set == null) {
                set = new HashSet();
                this.mSubscriptions.put(controllerInfo, set);
            }
            set.add(str);
        }
        getCallback().onSubscribe(getInstance(), controllerInfo, str, bundle);
    }

    public void onUnsubscribeOnExecutor(ControllerInfo controllerInfo, String str) {
        getCallback().onUnsubscribe(getInstance(), controllerInfo, str);
        synchronized (this.mLock) {
            this.mSubscriptions.remove(controllerInfo);
        }
    }
}
