package android.support.v4.media;

import android.os.BadParcelableException;
import android.os.Bundle;
import android.support.v4.media.MediaBrowserCompat.MediaItem;
import android.support.v4.media.MediaBrowserServiceCompat.BrowserRoot;
import android.support.v4.media.MediaBrowserServiceCompat.Result;
import android.support.v4.media.MediaLibraryService2.LibraryRoot;
import android.support.v4.media.MediaSession2.ControllerInfo;
import android.support.v4.media.MediaSessionManager.RemoteUserInfo;
import java.util.List;
import java.util.concurrent.Executor;

class MediaLibraryService2LegacyStub extends MediaBrowserServiceCompat {
    /* access modifiers changed from: private */
    public final SupportLibraryImpl mLibrarySession;

    MediaLibraryService2LegacyStub(SupportLibraryImpl supportLibraryImpl) {
        this.mLibrarySession = supportLibraryImpl;
    }

    private ControllerInfo getController() {
        List connectedControllers = this.mLibrarySession.getConnectedControllers();
        RemoteUserInfo currentBrowserInfo = getCurrentBrowserInfo();
        if (currentBrowserInfo == null) {
            return null;
        }
        for (int i = 0; i < connectedControllers.size(); i++) {
            ControllerInfo controllerInfo = (ControllerInfo) connectedControllers.get(i);
            if (controllerInfo.getPackageName().equals(currentBrowserInfo.getPackageName()) && controllerInfo.getUid() == currentBrowserInfo.getUid()) {
                return controllerInfo;
            }
        }
        return null;
    }

    public void onCustomAction(String str, Bundle bundle, Result<Bundle> result) {
    }

    public BrowserRoot onGetRoot(String str, int i, Bundle bundle) {
        if (MediaUtils2.isDefaultLibraryRootHint(bundle)) {
            return MediaUtils2.sDefaultBrowserRoot;
        }
        LibraryRoot onGetLibraryRoot = this.mLibrarySession.getCallback().onGetLibraryRoot(this.mLibrarySession.getInstance(), getController(), bundle);
        if (onGetLibraryRoot == null) {
            return null;
        }
        return new BrowserRoot(onGetLibraryRoot.getRootId(), onGetLibraryRoot.getExtras());
    }

    public void onLoadChildren(String str, Result<List<MediaItem>> result) {
        onLoadChildren(str, result, null);
    }

    public void onLoadChildren(String str, Result<List<MediaItem>> result, Bundle bundle) {
        result.detach();
        final ControllerInfo controller = getController();
        Executor callbackExecutor = this.mLibrarySession.getCallbackExecutor();
        final Bundle bundle2 = bundle;
        final String str2 = str;
        final Result<List<MediaItem>> result2 = result;
        AnonymousClass1 r0 = new Runnable() {
            public void run() {
                if (bundle2 != null) {
                    bundle2.setClassLoader(MediaLibraryService2LegacyStub.this.mLibrarySession.getContext().getClassLoader());
                    try {
                        int i = bundle2.getInt(MediaBrowserCompat.EXTRA_PAGE);
                        int i2 = bundle2.getInt(MediaBrowserCompat.EXTRA_PAGE_SIZE);
                        if (i > 0 && i2 > 0) {
                            result2.sendResult(MediaUtils2.convertToMediaItemList(MediaLibraryService2LegacyStub.this.mLibrarySession.getCallback().onGetChildren(MediaLibraryService2LegacyStub.this.mLibrarySession.getInstance(), controller, str2, i, i2, bundle2)));
                            return;
                        }
                    } catch (BadParcelableException e) {
                    }
                }
                result2.sendResult(MediaUtils2.convertToMediaItemList(MediaLibraryService2LegacyStub.this.mLibrarySession.getCallback().onGetChildren(MediaLibraryService2LegacyStub.this.mLibrarySession.getInstance(), controller, str2, 1, Integer.MAX_VALUE, null)));
            }
        };
        callbackExecutor.execute(r0);
    }

    public void onLoadItem(final String str, final Result<MediaItem> result) {
        result.detach();
        final ControllerInfo controller = getController();
        this.mLibrarySession.getCallbackExecutor().execute(new Runnable() {
            public void run() {
                MediaItem2 onGetItem = MediaLibraryService2LegacyStub.this.mLibrarySession.getCallback().onGetItem(MediaLibraryService2LegacyStub.this.mLibrarySession.getInstance(), controller, str);
                if (onGetItem == null) {
                    result.sendResult(null);
                } else {
                    result.sendResult(MediaUtils2.convertToMediaItem(onGetItem));
                }
            }
        });
    }

    public void onSearch(final String str, final Bundle bundle, Result<List<MediaItem>> result) {
        result.detach();
        final ControllerInfo controller = getController();
        bundle.setClassLoader(this.mLibrarySession.getContext().getClassLoader());
        try {
            final int i = bundle.getInt(MediaBrowserCompat.EXTRA_PAGE);
            final int i2 = bundle.getInt(MediaBrowserCompat.EXTRA_PAGE_SIZE);
            if (i <= 0 || i2 <= 0) {
                this.mLibrarySession.getCallbackExecutor().execute(new Runnable() {
                    public void run() {
                        MediaLibraryService2LegacyStub.this.mLibrarySession.getCallback().onSearch(MediaLibraryService2LegacyStub.this.mLibrarySession.getInstance(), controller, str, bundle);
                    }
                });
                return;
            }
            Executor callbackExecutor = this.mLibrarySession.getCallbackExecutor();
            final String str2 = str;
            final Bundle bundle2 = bundle;
            final Result<List<MediaItem>> result2 = result;
            AnonymousClass3 r0 = new Runnable() {
                public void run() {
                    List onGetSearchResult = MediaLibraryService2LegacyStub.this.mLibrarySession.getCallback().onGetSearchResult(MediaLibraryService2LegacyStub.this.mLibrarySession.getInstance(), controller, str2, i, i2, bundle2);
                    if (onGetSearchResult == null) {
                        result2.sendResult(null);
                    } else {
                        result2.sendResult(MediaUtils2.convertToMediaItemList(onGetSearchResult));
                    }
                }
            };
            callbackExecutor.execute(r0);
        } catch (BadParcelableException e) {
        }
    }
}
