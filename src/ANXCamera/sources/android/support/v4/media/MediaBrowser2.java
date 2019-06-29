package android.support.v4.media;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.media.MediaController2.ControllerCallback;
import android.util.Log;
import java.util.List;
import java.util.concurrent.Executor;

public class MediaBrowser2 extends MediaController2 {
    static final boolean DEBUG = Log.isLoggable(TAG, 3);
    static final String TAG = "MediaBrowser2";

    public static class BrowserCallback extends ControllerCallback {
        public void onChildrenChanged(@NonNull MediaBrowser2 mediaBrowser2, @NonNull String str, int i, @Nullable Bundle bundle) {
        }

        public void onGetChildrenDone(@NonNull MediaBrowser2 mediaBrowser2, @NonNull String str, int i, int i2, @Nullable List<MediaItem2> list, @Nullable Bundle bundle) {
        }

        public void onGetItemDone(@NonNull MediaBrowser2 mediaBrowser2, @NonNull String str, @Nullable MediaItem2 mediaItem2) {
        }

        public void onGetLibraryRootDone(@NonNull MediaBrowser2 mediaBrowser2, @Nullable Bundle bundle, @Nullable String str, @Nullable Bundle bundle2) {
        }

        public void onGetSearchResultDone(@NonNull MediaBrowser2 mediaBrowser2, @NonNull String str, int i, int i2, @Nullable List<MediaItem2> list, @Nullable Bundle bundle) {
        }

        public void onSearchResultChanged(@NonNull MediaBrowser2 mediaBrowser2, @NonNull String str, int i, @Nullable Bundle bundle) {
        }
    }

    interface SupportLibraryImpl extends SupportLibraryImpl {
        void getChildren(@NonNull String str, int i, int i2, @Nullable Bundle bundle);

        void getItem(@NonNull String str);

        void getLibraryRoot(@Nullable Bundle bundle);

        void getSearchResult(@NonNull String str, int i, int i2, @Nullable Bundle bundle);

        void search(@NonNull String str, @Nullable Bundle bundle);

        void subscribe(@NonNull String str, @Nullable Bundle bundle);

        void unsubscribe(@NonNull String str);
    }

    public MediaBrowser2(@NonNull Context context, @NonNull SessionToken2 sessionToken2, @NonNull Executor executor, @NonNull BrowserCallback browserCallback) {
        super(context, sessionToken2, executor, browserCallback);
    }

    /* access modifiers changed from: 0000 */
    public SupportLibraryImpl createImpl(@NonNull Context context, @NonNull SessionToken2 sessionToken2, @NonNull Executor executor, @NonNull ControllerCallback controllerCallback) {
        if (sessionToken2.isLegacySession()) {
            MediaBrowser2ImplLegacy mediaBrowser2ImplLegacy = new MediaBrowser2ImplLegacy(context, this, sessionToken2, executor, (BrowserCallback) controllerCallback);
            return mediaBrowser2ImplLegacy;
        }
        MediaBrowser2ImplBase mediaBrowser2ImplBase = new MediaBrowser2ImplBase(context, this, sessionToken2, executor, (BrowserCallback) controllerCallback);
        return mediaBrowser2ImplBase;
    }

    /* access modifiers changed from: 0000 */
    public BrowserCallback getCallback() {
        return (BrowserCallback) super.getCallback();
    }

    public void getChildren(@NonNull String str, int i, int i2, @Nullable Bundle bundle) {
        getImpl().getChildren(str, i, i2, bundle);
    }

    /* access modifiers changed from: 0000 */
    public SupportLibraryImpl getImpl() {
        return (SupportLibraryImpl) super.getImpl();
    }

    public void getItem(@NonNull String str) {
        getImpl().getItem(str);
    }

    public void getLibraryRoot(@Nullable Bundle bundle) {
        getImpl().getLibraryRoot(bundle);
    }

    public void getSearchResult(@NonNull String str, int i, int i2, @Nullable Bundle bundle) {
        getImpl().getSearchResult(str, i, i2, bundle);
    }

    public void search(@NonNull String str, @Nullable Bundle bundle) {
        getImpl().search(str, bundle);
    }

    public void subscribe(@NonNull String str, @Nullable Bundle bundle) {
        getImpl().subscribe(str, bundle);
    }

    public void unsubscribe(@NonNull String str) {
        getImpl().unsubscribe(str);
    }
}
