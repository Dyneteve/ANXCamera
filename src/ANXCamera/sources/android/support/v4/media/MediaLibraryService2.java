package android.support.v4.media;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.media.MediaSession2.ControllerInfo;
import android.support.v4.media.MediaSession2.SessionCallback;
import java.util.List;
import java.util.concurrent.Executor;

public abstract class MediaLibraryService2 extends MediaSessionService2 {
    public static final String SERVICE_INTERFACE = "android.media.MediaLibraryService2";

    public static final class LibraryRoot {
        public static final String EXTRA_OFFLINE = "android.media.extra.OFFLINE";
        public static final String EXTRA_RECENT = "android.media.extra.RECENT";
        public static final String EXTRA_SUGGESTED = "android.media.extra.SUGGESTED";
        private final Bundle mExtras;
        private final String mRootId;

        public LibraryRoot(@NonNull String str, @Nullable Bundle bundle) {
            if (str != null) {
                this.mRootId = str;
                this.mExtras = bundle;
                return;
            }
            throw new IllegalArgumentException("rootId shouldn't be null");
        }

        public Bundle getExtras() {
            return this.mExtras;
        }

        public String getRootId() {
            return this.mRootId;
        }
    }

    public static final class MediaLibrarySession extends MediaSession2 {

        public static final class Builder extends BuilderBase<MediaLibrarySession, Builder, MediaLibrarySessionCallback> {
            public Builder(@NonNull MediaLibraryService2 mediaLibraryService2, @NonNull Executor executor, @NonNull MediaLibrarySessionCallback mediaLibrarySessionCallback) {
                super(mediaLibraryService2);
                setSessionCallback(executor, mediaLibrarySessionCallback);
            }

            @NonNull
            public MediaLibrarySession build() {
                if (this.mCallbackExecutor == null) {
                    this.mCallbackExecutor = new MainHandlerExecutor(this.mContext);
                }
                if (this.mCallback == null) {
                    this.mCallback = new MediaLibrarySessionCallback() {
                    };
                }
                MediaLibrarySession mediaLibrarySession = new MediaLibrarySession(this.mContext, this.mId, this.mPlayer, this.mPlaylistAgent, this.mVolumeProvider, this.mSessionActivity, this.mCallbackExecutor, this.mCallback);
                return mediaLibrarySession;
            }

            @NonNull
            public Builder setId(@NonNull String str) {
                return (Builder) super.setId(str);
            }

            @NonNull
            public Builder setPlayer(@NonNull BaseMediaPlayer baseMediaPlayer) {
                return (Builder) super.setPlayer(baseMediaPlayer);
            }

            @NonNull
            public Builder setPlaylistAgent(@NonNull MediaPlaylistAgent mediaPlaylistAgent) {
                return (Builder) super.setPlaylistAgent(mediaPlaylistAgent);
            }

            @NonNull
            public Builder setSessionActivity(@Nullable PendingIntent pendingIntent) {
                return (Builder) super.setSessionActivity(pendingIntent);
            }

            @NonNull
            public Builder setVolumeProvider(@Nullable VolumeProviderCompat volumeProviderCompat) {
                return (Builder) super.setVolumeProvider(volumeProviderCompat);
            }
        }

        public static class MediaLibrarySessionCallback extends SessionCallback {
            @Nullable
            public List<MediaItem2> onGetChildren(@NonNull MediaLibrarySession mediaLibrarySession, @NonNull ControllerInfo controllerInfo, @NonNull String str, int i, int i2, @Nullable Bundle bundle) {
                return null;
            }

            @Nullable
            public MediaItem2 onGetItem(@NonNull MediaLibrarySession mediaLibrarySession, @NonNull ControllerInfo controllerInfo, @NonNull String str) {
                return null;
            }

            @Nullable
            public LibraryRoot onGetLibraryRoot(@NonNull MediaLibrarySession mediaLibrarySession, @NonNull ControllerInfo controllerInfo, @Nullable Bundle bundle) {
                return null;
            }

            @Nullable
            public List<MediaItem2> onGetSearchResult(@NonNull MediaLibrarySession mediaLibrarySession, @NonNull ControllerInfo controllerInfo, @NonNull String str, int i, int i2, @Nullable Bundle bundle) {
                return null;
            }

            public void onSearch(@NonNull MediaLibrarySession mediaLibrarySession, @NonNull ControllerInfo controllerInfo, @NonNull String str, @Nullable Bundle bundle) {
            }

            public void onSubscribe(@NonNull MediaLibrarySession mediaLibrarySession, @NonNull ControllerInfo controllerInfo, @NonNull String str, @Nullable Bundle bundle) {
            }

            public void onUnsubscribe(@NonNull MediaLibrarySession mediaLibrarySession, @NonNull ControllerInfo controllerInfo, @NonNull String str) {
            }
        }

        interface SupportLibraryImpl extends SupportLibraryImpl {
            MediaLibrarySessionCallback getCallback();

            MediaLibrarySession getInstance();

            IBinder getLegacySessionBinder();

            void notifyChildrenChanged(@NonNull ControllerInfo controllerInfo, @NonNull String str, int i, @Nullable Bundle bundle);

            void notifyChildrenChanged(@NonNull String str, int i, @Nullable Bundle bundle);

            void notifySearchResultChanged(@NonNull ControllerInfo controllerInfo, @NonNull String str, int i, @Nullable Bundle bundle);

            void onGetChildrenOnExecutor(@NonNull ControllerInfo controllerInfo, @NonNull String str, int i, int i2, @Nullable Bundle bundle);

            void onGetItemOnExecutor(@NonNull ControllerInfo controllerInfo, @NonNull String str);

            void onGetLibraryRootOnExecutor(@NonNull ControllerInfo controllerInfo, @Nullable Bundle bundle);

            void onGetSearchResultOnExecutor(@NonNull ControllerInfo controllerInfo, @NonNull String str, int i, int i2, @Nullable Bundle bundle);

            void onSearchOnExecutor(@NonNull ControllerInfo controllerInfo, @NonNull String str, @Nullable Bundle bundle);

            void onSubscribeOnExecutor(@NonNull ControllerInfo controllerInfo, @NonNull String str, @Nullable Bundle bundle);

            void onUnsubscribeOnExecutor(@NonNull ControllerInfo controllerInfo, @NonNull String str);
        }

        MediaLibrarySession(Context context, String str, BaseMediaPlayer baseMediaPlayer, MediaPlaylistAgent mediaPlaylistAgent, VolumeProviderCompat volumeProviderCompat, PendingIntent pendingIntent, Executor executor, SessionCallback sessionCallback) {
            super(context, str, baseMediaPlayer, mediaPlaylistAgent, volumeProviderCompat, pendingIntent, executor, sessionCallback);
        }

        /* access modifiers changed from: 0000 */
        public SupportLibraryImpl createImpl(Context context, String str, BaseMediaPlayer baseMediaPlayer, MediaPlaylistAgent mediaPlaylistAgent, VolumeProviderCompat volumeProviderCompat, PendingIntent pendingIntent, Executor executor, SessionCallback sessionCallback) {
            MediaLibrarySessionImplBase mediaLibrarySessionImplBase = new MediaLibrarySessionImplBase(this, context, str, baseMediaPlayer, mediaPlaylistAgent, volumeProviderCompat, pendingIntent, executor, sessionCallback);
            return mediaLibrarySessionImplBase;
        }

        /* access modifiers changed from: 0000 */
        public MediaLibrarySessionCallback getCallback() {
            return (MediaLibrarySessionCallback) super.getCallback();
        }

        /* access modifiers changed from: 0000 */
        public SupportLibraryImpl getImpl() {
            return (SupportLibraryImpl) super.getImpl();
        }

        public void notifyChildrenChanged(@NonNull ControllerInfo controllerInfo, @NonNull String str, int i, @Nullable Bundle bundle) {
            getImpl().notifyChildrenChanged(controllerInfo, str, i, bundle);
        }

        public void notifyChildrenChanged(@NonNull String str, int i, @Nullable Bundle bundle) {
            getImpl().notifyChildrenChanged(str, i, bundle);
        }

        public void notifySearchResultChanged(@NonNull ControllerInfo controllerInfo, @NonNull String str, int i, @Nullable Bundle bundle) {
            getImpl().notifySearchResultChanged(controllerInfo, str, i, bundle);
        }
    }

    /* access modifiers changed from: 0000 */
    public SupportLibraryImpl createImpl() {
        return new MediaLibraryService2ImplBase();
    }

    public IBinder onBind(Intent intent) {
        return super.onBind(intent);
    }

    public void onCreate() {
        super.onCreate();
        if (!(getSession() instanceof MediaLibrarySession)) {
            throw new RuntimeException("Expected MediaLibrarySession, but returned MediaSession2");
        }
    }

    @NonNull
    public abstract MediaLibrarySession onCreateSession(String str);
}
