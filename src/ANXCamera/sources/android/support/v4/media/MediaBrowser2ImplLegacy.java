package android.support.v4.media;

import android.content.Context;
import android.os.BadParcelableException;
import android.os.Bundle;
import android.support.annotation.GuardedBy;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.media.MediaBrowser2.BrowserCallback;
import android.support.v4.media.MediaBrowserCompat.ConnectionCallback;
import android.support.v4.media.MediaBrowserCompat.ItemCallback;
import android.support.v4.media.MediaBrowserCompat.MediaItem;
import android.support.v4.media.MediaBrowserCompat.SearchCallback;
import android.support.v4.media.MediaBrowserCompat.SubscriptionCallback;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.Executor;

class MediaBrowser2ImplLegacy extends MediaController2ImplLegacy implements SupportLibraryImpl {
    public static final String EXTRA_ITEM_COUNT = "android.media.browse.extra.ITEM_COUNT";
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public final HashMap<Bundle, MediaBrowserCompat> mBrowserCompats = new HashMap<>();
    @GuardedBy("mLock")
    private final HashMap<String, List<SubscribeCallback>> mSubscribeCallbacks = new HashMap<>();

    private class GetChildrenCallback extends SubscriptionCallback {
        /* access modifiers changed from: private */
        public final int mPage;
        /* access modifiers changed from: private */
        public final int mPageSize;
        /* access modifiers changed from: private */
        public final String mParentId;

        GetChildrenCallback(String str, int i, int i2) {
            this.mParentId = str;
            this.mPage = i;
            this.mPageSize = i2;
        }

        public void onChildrenLoaded(String str, List<MediaItem> list) {
            onChildrenLoaded(str, list, null);
        }

        public void onChildrenLoaded(final String str, List<MediaItem> list, Bundle bundle) {
            final List list2;
            if (list == null) {
                list2 = null;
            } else {
                ArrayList arrayList = new ArrayList();
                for (int i = 0; i < list.size(); i++) {
                    arrayList.add(MediaUtils2.convertToMediaItem2((MediaItem) list.get(i)));
                }
                list2 = arrayList;
            }
            final Bundle access$300 = MediaBrowser2ImplLegacy.this.getExtrasWithoutPagination(bundle);
            MediaBrowser2ImplLegacy.this.getCallbackExecutor().execute(new Runnable() {
                public void run() {
                    MediaBrowserCompat browserCompat = MediaBrowser2ImplLegacy.this.getBrowserCompat();
                    if (browserCompat != null) {
                        MediaBrowser2ImplLegacy.this.getCallback().onGetChildrenDone(MediaBrowser2ImplLegacy.this.getInstance(), str, GetChildrenCallback.this.mPage, GetChildrenCallback.this.mPageSize, list2, access$300);
                        browserCompat.unsubscribe(GetChildrenCallback.this.mParentId, GetChildrenCallback.this);
                    }
                }
            });
        }

        public void onError(String str) {
            onChildrenLoaded(str, null, null);
        }

        public void onError(String str, Bundle bundle) {
            onChildrenLoaded(str, null, bundle);
        }
    }

    private class GetLibraryRootCallback extends ConnectionCallback {
        /* access modifiers changed from: private */
        public final Bundle mExtras;

        GetLibraryRootCallback(Bundle bundle) {
            this.mExtras = bundle;
        }

        public void onConnected() {
            MediaBrowser2ImplLegacy.this.getCallbackExecutor().execute(new Runnable() {
                public void run() {
                    MediaBrowserCompat mediaBrowserCompat;
                    synchronized (MediaBrowser2ImplLegacy.this.mLock) {
                        mediaBrowserCompat = (MediaBrowserCompat) MediaBrowser2ImplLegacy.this.mBrowserCompats.get(GetLibraryRootCallback.this.mExtras);
                    }
                    if (mediaBrowserCompat != null) {
                        MediaBrowser2ImplLegacy.this.getCallback().onGetLibraryRootDone(MediaBrowser2ImplLegacy.this.getInstance(), GetLibraryRootCallback.this.mExtras, mediaBrowserCompat.getRoot(), mediaBrowserCompat.getExtras());
                    }
                }
            });
        }

        public void onConnectionFailed() {
            MediaBrowser2ImplLegacy.this.close();
        }

        public void onConnectionSuspended() {
            MediaBrowser2ImplLegacy.this.close();
        }
    }

    private class SubscribeCallback extends SubscriptionCallback {
        private SubscribeCallback() {
        }

        public void onChildrenLoaded(String str, List<MediaItem> list) {
            onChildrenLoaded(str, list, null);
        }

        public void onChildrenLoaded(final String str, List<MediaItem> list, Bundle bundle) {
            final int i;
            if (bundle != null && bundle.containsKey(MediaBrowser2ImplLegacy.EXTRA_ITEM_COUNT)) {
                i = bundle.getInt(MediaBrowser2ImplLegacy.EXTRA_ITEM_COUNT);
            } else if (list != null) {
                i = list.size();
            } else {
                return;
            }
            final Bundle notifyChildrenChangedOptions = MediaBrowser2ImplLegacy.this.getBrowserCompat().getNotifyChildrenChangedOptions();
            MediaBrowser2ImplLegacy.this.getCallbackExecutor().execute(new Runnable() {
                public void run() {
                    MediaBrowser2ImplLegacy.this.getCallback().onChildrenChanged(MediaBrowser2ImplLegacy.this.getInstance(), str, i, notifyChildrenChangedOptions);
                }
            });
        }

        public void onError(String str) {
            onChildrenLoaded(str, null, null);
        }

        public void onError(String str, Bundle bundle) {
            onChildrenLoaded(str, null, bundle);
        }
    }

    MediaBrowser2ImplLegacy(@NonNull Context context, MediaBrowser2 mediaBrowser2, @NonNull SessionToken2 sessionToken2, @NonNull Executor executor, @NonNull BrowserCallback browserCallback) {
        super(context, mediaBrowser2, sessionToken2, executor, browserCallback);
    }

    private MediaBrowserCompat getBrowserCompat(Bundle bundle) {
        MediaBrowserCompat mediaBrowserCompat;
        synchronized (this.mLock) {
            mediaBrowserCompat = (MediaBrowserCompat) this.mBrowserCompats.get(bundle);
        }
        return mediaBrowserCompat;
    }

    /* access modifiers changed from: private */
    public Bundle getExtrasWithoutPagination(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        bundle.setClassLoader(getContext().getClassLoader());
        try {
            bundle.remove(MediaBrowserCompat.EXTRA_PAGE);
            bundle.remove(MediaBrowserCompat.EXTRA_PAGE_SIZE);
        } catch (BadParcelableException e) {
        }
        return bundle;
    }

    public void close() {
        synchronized (this.mLock) {
            for (MediaBrowserCompat disconnect : this.mBrowserCompats.values()) {
                disconnect.disconnect();
            }
            this.mBrowserCompats.clear();
            super.close();
        }
    }

    public BrowserCallback getCallback() {
        return (BrowserCallback) super.getCallback();
    }

    public void getChildren(@NonNull String str, int i, int i2, @Nullable Bundle bundle) {
        if (str == null) {
            throw new IllegalArgumentException("parentId shouldn't be null");
        } else if (i < 1 || i2 < 1) {
            throw new IllegalArgumentException("Neither page nor pageSize should be less than 1");
        } else {
            MediaBrowserCompat browserCompat = getBrowserCompat();
            if (browserCompat != null) {
                Bundle createBundle = MediaUtils2.createBundle(bundle);
                createBundle.putInt(MediaBrowserCompat.EXTRA_PAGE, i);
                createBundle.putInt(MediaBrowserCompat.EXTRA_PAGE_SIZE, i2);
                browserCompat.subscribe(str, createBundle, new GetChildrenCallback(str, i, i2));
            }
        }
    }

    public MediaBrowser2 getInstance() {
        return (MediaBrowser2) super.getInstance();
    }

    public void getItem(@NonNull final String str) {
        MediaBrowserCompat browserCompat = getBrowserCompat();
        if (browserCompat != null) {
            browserCompat.getItem(str, new ItemCallback() {
                public void onError(String str) {
                    MediaBrowser2ImplLegacy.this.getCallbackExecutor().execute(new Runnable() {
                        public void run() {
                            MediaBrowser2ImplLegacy.this.getCallback().onGetItemDone(MediaBrowser2ImplLegacy.this.getInstance(), str, null);
                        }
                    });
                }

                public void onItemLoaded(final MediaItem mediaItem) {
                    MediaBrowser2ImplLegacy.this.getCallbackExecutor().execute(new Runnable() {
                        public void run() {
                            MediaBrowser2ImplLegacy.this.getCallback().onGetItemDone(MediaBrowser2ImplLegacy.this.getInstance(), str, MediaUtils2.convertToMediaItem2(mediaItem));
                        }
                    });
                }
            });
        }
    }

    public void getLibraryRoot(@Nullable final Bundle bundle) {
        final MediaBrowserCompat browserCompat = getBrowserCompat(bundle);
        if (browserCompat != null) {
            getCallbackExecutor().execute(new Runnable() {
                public void run() {
                    MediaBrowser2ImplLegacy.this.getCallback().onGetLibraryRootDone(MediaBrowser2ImplLegacy.this.getInstance(), bundle, browserCompat.getRoot(), browserCompat.getExtras());
                }
            });
        } else {
            getCallbackExecutor().execute(new Runnable() {
                public void run() {
                    MediaBrowserCompat mediaBrowserCompat = new MediaBrowserCompat(MediaBrowser2ImplLegacy.this.getContext(), MediaBrowser2ImplLegacy.this.getSessionToken().getComponentName(), new GetLibraryRootCallback(bundle), bundle);
                    synchronized (MediaBrowser2ImplLegacy.this.mLock) {
                        MediaBrowser2ImplLegacy.this.mBrowserCompats.put(bundle, mediaBrowserCompat);
                    }
                    mediaBrowserCompat.connect();
                }
            });
        }
    }

    public void getSearchResult(@NonNull String str, final int i, final int i2, @Nullable final Bundle bundle) {
        MediaBrowserCompat browserCompat = getBrowserCompat();
        if (browserCompat != null) {
            Bundle createBundle = MediaUtils2.createBundle(bundle);
            createBundle.putInt(MediaBrowserCompat.EXTRA_PAGE, i);
            createBundle.putInt(MediaBrowserCompat.EXTRA_PAGE_SIZE, i2);
            browserCompat.search(str, createBundle, new SearchCallback() {
                public void onError(final String str, Bundle bundle) {
                    MediaBrowser2ImplLegacy.this.getCallbackExecutor().execute(new Runnable() {
                        public void run() {
                            MediaBrowser2ImplLegacy.this.getCallback().onGetSearchResultDone(MediaBrowser2ImplLegacy.this.getInstance(), str, i, i2, null, bundle);
                        }
                    });
                }

                public void onSearchResult(final String str, Bundle bundle, final List<MediaItem> list) {
                    MediaBrowser2ImplLegacy.this.getCallbackExecutor().execute(new Runnable() {
                        public void run() {
                            MediaBrowser2ImplLegacy.this.getCallback().onGetSearchResultDone(MediaBrowser2ImplLegacy.this.getInstance(), str, i, i2, MediaUtils2.convertMediaItemListToMediaItem2List(list), bundle);
                        }
                    });
                }
            });
        }
    }

    public void search(@NonNull String str, @Nullable Bundle bundle) {
        MediaBrowserCompat browserCompat = getBrowserCompat();
        if (browserCompat != null) {
            browserCompat.search(str, bundle, new SearchCallback() {
                public void onError(String str, Bundle bundle) {
                }

                public void onSearchResult(final String str, final Bundle bundle, final List<MediaItem> list) {
                    MediaBrowser2ImplLegacy.this.getCallbackExecutor().execute(new Runnable() {
                        public void run() {
                            MediaBrowser2ImplLegacy.this.getCallback().onSearchResultChanged(MediaBrowser2ImplLegacy.this.getInstance(), str, list.size(), bundle);
                        }
                    });
                }
            });
        }
    }

    public void subscribe(@NonNull String str, @Nullable Bundle bundle) {
        if (str != null) {
            MediaBrowserCompat browserCompat = getBrowserCompat();
            if (browserCompat != null) {
                SubscribeCallback subscribeCallback = new SubscribeCallback();
                synchronized (this.mLock) {
                    List list = (List) this.mSubscribeCallbacks.get(str);
                    if (list == null) {
                        list = new ArrayList();
                        this.mSubscribeCallbacks.put(str, list);
                    }
                    list.add(subscribeCallback);
                }
                Bundle bundle2 = new Bundle();
                bundle2.putBundle("android.support.v4.media.argument.EXTRAS", bundle);
                browserCompat.subscribe(str, bundle2, subscribeCallback);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("parentId shouldn't be null");
    }

    public void unsubscribe(@NonNull String str) {
        if (str != null) {
            MediaBrowserCompat browserCompat = getBrowserCompat();
            if (browserCompat != null) {
                synchronized (this.mLock) {
                    List list = (List) this.mSubscribeCallbacks.get(str);
                    if (list != null) {
                        for (int i = 0; i < list.size(); i++) {
                            browserCompat.unsubscribe(str, (SubscriptionCallback) list.get(i));
                        }
                        return;
                    }
                    return;
                }
            }
            return;
        }
        throw new IllegalArgumentException("parentId shouldn't be null");
    }
}
