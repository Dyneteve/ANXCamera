package android.support.v4.media;

import android.support.annotation.GuardedBy;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.v4.util.SimpleArrayMap;
import android.util.Log;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;
import java.util.concurrent.Executor;

public abstract class MediaPlaylistAgent {
    public static final int REPEAT_MODE_ALL = 2;
    public static final int REPEAT_MODE_GROUP = 3;
    public static final int REPEAT_MODE_NONE = 0;
    public static final int REPEAT_MODE_ONE = 1;
    public static final int SHUFFLE_MODE_ALL = 1;
    public static final int SHUFFLE_MODE_GROUP = 2;
    public static final int SHUFFLE_MODE_NONE = 0;
    private static final String TAG = "MediaPlaylistAgent";
    @GuardedBy("mLock")
    private final SimpleArrayMap<PlaylistEventCallback, Executor> mCallbacks = new SimpleArrayMap<>();
    private final Object mLock = new Object();

    public static abstract class PlaylistEventCallback {
        public void onPlaylistChanged(@NonNull MediaPlaylistAgent mediaPlaylistAgent, @NonNull List<MediaItem2> list, @Nullable MediaMetadata2 mediaMetadata2) {
        }

        public void onPlaylistMetadataChanged(@NonNull MediaPlaylistAgent mediaPlaylistAgent, @Nullable MediaMetadata2 mediaMetadata2) {
        }

        public void onRepeatModeChanged(@NonNull MediaPlaylistAgent mediaPlaylistAgent, int i) {
        }

        public void onShuffleModeChanged(@NonNull MediaPlaylistAgent mediaPlaylistAgent, int i) {
        }
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    @Retention(RetentionPolicy.SOURCE)
    public @interface RepeatMode {
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    @Retention(RetentionPolicy.SOURCE)
    public @interface ShuffleMode {
    }

    private SimpleArrayMap<PlaylistEventCallback, Executor> getCallbacks() {
        SimpleArrayMap<PlaylistEventCallback, Executor> simpleArrayMap = new SimpleArrayMap<>();
        synchronized (this.mLock) {
            simpleArrayMap.putAll(this.mCallbacks);
        }
        return simpleArrayMap;
    }

    public abstract void addPlaylistItem(int i, @NonNull MediaItem2 mediaItem2);

    public abstract MediaItem2 getCurrentMediaItem();

    @Nullable
    public MediaItem2 getMediaItem(@NonNull DataSourceDesc dataSourceDesc) {
        if (dataSourceDesc != null) {
            List playlist = getPlaylist();
            if (playlist == null) {
                return null;
            }
            for (int i = 0; i < playlist.size(); i++) {
                MediaItem2 mediaItem2 = (MediaItem2) playlist.get(i);
                if (mediaItem2 != null && mediaItem2.getDataSourceDesc().equals(dataSourceDesc)) {
                    return mediaItem2;
                }
            }
            return null;
        }
        throw new IllegalArgumentException("dsd shouldn't be null");
    }

    @Nullable
    public abstract List<MediaItem2> getPlaylist();

    @Nullable
    public abstract MediaMetadata2 getPlaylistMetadata();

    public abstract int getRepeatMode();

    public abstract int getShuffleMode();

    public final void notifyPlaylistChanged() {
        SimpleArrayMap callbacks = getCallbacks();
        final List playlist = getPlaylist();
        final MediaMetadata2 playlistMetadata = getPlaylistMetadata();
        for (int i = 0; i < callbacks.size(); i++) {
            final PlaylistEventCallback playlistEventCallback = (PlaylistEventCallback) callbacks.keyAt(i);
            ((Executor) callbacks.valueAt(i)).execute(new Runnable() {
                public void run() {
                    playlistEventCallback.onPlaylistChanged(MediaPlaylistAgent.this, playlist, playlistMetadata);
                }
            });
        }
    }

    public final void notifyPlaylistMetadataChanged() {
        SimpleArrayMap callbacks = getCallbacks();
        for (int i = 0; i < callbacks.size(); i++) {
            final PlaylistEventCallback playlistEventCallback = (PlaylistEventCallback) callbacks.keyAt(i);
            ((Executor) callbacks.valueAt(i)).execute(new Runnable() {
                public void run() {
                    playlistEventCallback.onPlaylistMetadataChanged(MediaPlaylistAgent.this, MediaPlaylistAgent.this.getPlaylistMetadata());
                }
            });
        }
    }

    public final void notifyRepeatModeChanged() {
        SimpleArrayMap callbacks = getCallbacks();
        for (int i = 0; i < callbacks.size(); i++) {
            final PlaylistEventCallback playlistEventCallback = (PlaylistEventCallback) callbacks.keyAt(i);
            ((Executor) callbacks.valueAt(i)).execute(new Runnable() {
                public void run() {
                    playlistEventCallback.onRepeatModeChanged(MediaPlaylistAgent.this, MediaPlaylistAgent.this.getRepeatMode());
                }
            });
        }
    }

    public final void notifyShuffleModeChanged() {
        SimpleArrayMap callbacks = getCallbacks();
        for (int i = 0; i < callbacks.size(); i++) {
            final PlaylistEventCallback playlistEventCallback = (PlaylistEventCallback) callbacks.keyAt(i);
            ((Executor) callbacks.valueAt(i)).execute(new Runnable() {
                public void run() {
                    playlistEventCallback.onShuffleModeChanged(MediaPlaylistAgent.this, MediaPlaylistAgent.this.getShuffleMode());
                }
            });
        }
    }

    public final void registerPlaylistEventCallback(@NonNull Executor executor, @NonNull PlaylistEventCallback playlistEventCallback) {
        if (executor == null) {
            throw new IllegalArgumentException("executor shouldn't be null");
        } else if (playlistEventCallback != null) {
            synchronized (this.mLock) {
                if (this.mCallbacks.get(playlistEventCallback) != null) {
                    Log.w(TAG, "callback is already added. Ignoring.");
                } else {
                    this.mCallbacks.put(playlistEventCallback, executor);
                }
            }
        } else {
            throw new IllegalArgumentException("callback shouldn't be null");
        }
    }

    public abstract void removePlaylistItem(@NonNull MediaItem2 mediaItem2);

    public abstract void replacePlaylistItem(int i, @NonNull MediaItem2 mediaItem2);

    public abstract void setPlaylist(@NonNull List<MediaItem2> list, @Nullable MediaMetadata2 mediaMetadata2);

    public abstract void setRepeatMode(int i);

    public abstract void setShuffleMode(int i);

    public abstract void skipToNextItem();

    public abstract void skipToPlaylistItem(@NonNull MediaItem2 mediaItem2);

    public abstract void skipToPreviousItem();

    public final void unregisterPlaylistEventCallback(@NonNull PlaylistEventCallback playlistEventCallback) {
        if (playlistEventCallback != null) {
            synchronized (this.mLock) {
                this.mCallbacks.remove(playlistEventCallback);
            }
            return;
        }
        throw new IllegalArgumentException("callback shouldn't be null");
    }

    public abstract void updatePlaylistMetadata(@Nullable MediaMetadata2 mediaMetadata2);
}
