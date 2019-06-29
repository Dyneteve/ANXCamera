package android.support.v4.media;

import android.annotation.TargetApi;
import android.support.annotation.GuardedBy;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v4.media.BaseMediaPlayer.PlayerEventCallback;
import android.support.v4.media.MediaSession2.OnDataSourceMissingHelper;
import android.support.v4.util.ArrayMap;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@TargetApi(19)
class SessionPlaylistAgentImplBase extends MediaPlaylistAgent {
    @VisibleForTesting
    static final int END_OF_PLAYLIST = -1;
    @VisibleForTesting
    static final int NO_VALID_ITEMS = -2;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public PlayItem mCurrent;
    @GuardedBy("mLock")
    private OnDataSourceMissingHelper mDsmHelper;
    /* access modifiers changed from: private */
    public final PlayItem mEopPlayItem = new PlayItem(-1, null);
    @GuardedBy("mLock")
    private Map<MediaItem2, DataSourceDesc> mItemDsdMap = new ArrayMap();
    /* access modifiers changed from: private */
    public final Object mLock = new Object();
    @GuardedBy("mLock")
    private MediaMetadata2 mMetadata;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public BaseMediaPlayer mPlayer;
    private final MyPlayerEventCallback mPlayerCallback;
    @GuardedBy("mLock")
    private ArrayList<MediaItem2> mPlaylist = new ArrayList<>();
    @GuardedBy("mLock")
    private int mRepeatMode;
    private final MediaSession2ImplBase mSession;
    @GuardedBy("mLock")
    private int mShuffleMode;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public ArrayList<MediaItem2> mShuffledList = new ArrayList<>();

    private class MyPlayerEventCallback extends PlayerEventCallback {
        private MyPlayerEventCallback() {
        }

        /* JADX WARNING: Code restructure failed: missing block: B:12:0x0035, code lost:
            return;
         */
        public void onCurrentDataSourceChanged(@NonNull BaseMediaPlayer baseMediaPlayer, @Nullable DataSourceDesc dataSourceDesc) {
            synchronized (SessionPlaylistAgentImplBase.this.mLock) {
                if (SessionPlaylistAgentImplBase.this.mPlayer == baseMediaPlayer) {
                    if (dataSourceDesc == null && SessionPlaylistAgentImplBase.this.mCurrent != null) {
                        SessionPlaylistAgentImplBase.this.mCurrent = SessionPlaylistAgentImplBase.this.getNextValidPlayItemLocked(SessionPlaylistAgentImplBase.this.mCurrent.shuffledIdx, 1);
                        SessionPlaylistAgentImplBase.this.updateCurrentIfNeededLocked();
                    }
                }
            }
        }
    }

    private class PlayItem {
        public DataSourceDesc dsd;
        public MediaItem2 mediaItem;
        public int shuffledIdx;

        PlayItem(SessionPlaylistAgentImplBase sessionPlaylistAgentImplBase, int i) {
            this(i, null);
        }

        PlayItem(int i, DataSourceDesc dataSourceDesc) {
            this.shuffledIdx = i;
            if (i >= 0) {
                this.mediaItem = (MediaItem2) SessionPlaylistAgentImplBase.this.mShuffledList.get(i);
                if (dataSourceDesc == null) {
                    synchronized (SessionPlaylistAgentImplBase.this.mLock) {
                        this.dsd = SessionPlaylistAgentImplBase.this.retrieveDataSourceDescLocked(this.mediaItem);
                    }
                    return;
                }
                this.dsd = dataSourceDesc;
            }
        }

        /* access modifiers changed from: 0000 */
        public boolean isValid() {
            if (this == SessionPlaylistAgentImplBase.this.mEopPlayItem) {
                return true;
            }
            if (this.mediaItem == null || this.dsd == null) {
                return false;
            }
            if (this.mediaItem.getDataSourceDesc() != null && !this.mediaItem.getDataSourceDesc().equals(this.dsd)) {
                return false;
            }
            synchronized (SessionPlaylistAgentImplBase.this.mLock) {
                if (this.shuffledIdx >= SessionPlaylistAgentImplBase.this.mShuffledList.size()) {
                    return false;
                }
                return this.mediaItem == SessionPlaylistAgentImplBase.this.mShuffledList.get(this.shuffledIdx);
            }
        }
    }

    SessionPlaylistAgentImplBase(@NonNull MediaSession2ImplBase mediaSession2ImplBase, @NonNull BaseMediaPlayer baseMediaPlayer) {
        if (mediaSession2ImplBase == null) {
            throw new IllegalArgumentException("sessionImpl shouldn't be null");
        } else if (baseMediaPlayer != null) {
            this.mSession = mediaSession2ImplBase;
            this.mPlayer = baseMediaPlayer;
            this.mPlayerCallback = new MyPlayerEventCallback();
            this.mPlayer.registerPlayerEventCallback(this.mSession.getCallbackExecutor(), this.mPlayerCallback);
        } else {
            throw new IllegalArgumentException("player shouldn't be null");
        }
    }

    private void applyShuffleModeLocked() {
        this.mShuffledList.clear();
        this.mShuffledList.addAll(this.mPlaylist);
        if (this.mShuffleMode == 1 || this.mShuffleMode == 2) {
            Collections.shuffle(this.mShuffledList);
        }
    }

    private static int clamp(int i, int i2) {
        if (i < 0) {
            return 0;
        }
        if (i > i2) {
            i = i2;
        }
        return i;
    }

    /* access modifiers changed from: private */
    public PlayItem getNextValidPlayItemLocked(int i, int i2) {
        int size = this.mPlaylist.size();
        if (i == -1) {
            i = i2 > 0 ? -1 : size;
        }
        int i3 = i;
        int i4 = 0;
        while (true) {
            PlayItem playItem = null;
            if (i4 >= size) {
                return null;
            }
            i3 += i2;
            if (i3 < 0 || i3 >= this.mPlaylist.size()) {
                if (this.mRepeatMode == 0) {
                    if (i4 != size - 1) {
                        playItem = this.mEopPlayItem;
                    }
                    return playItem;
                }
                i3 = i3 < 0 ? this.mPlaylist.size() - 1 : 0;
            }
            DataSourceDesc retrieveDataSourceDescLocked = retrieveDataSourceDescLocked((MediaItem2) this.mShuffledList.get(i3));
            if (retrieveDataSourceDescLocked != null) {
                return new PlayItem(i3, retrieveDataSourceDescLocked);
            }
            i4++;
        }
    }

    private boolean hasValidItem() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mCurrent != null;
        }
        return z;
    }

    /* access modifiers changed from: private */
    public DataSourceDesc retrieveDataSourceDescLocked(MediaItem2 mediaItem2) {
        DataSourceDesc dataSourceDesc = mediaItem2.getDataSourceDesc();
        if (dataSourceDesc != null) {
            this.mItemDsdMap.put(mediaItem2, dataSourceDesc);
            return dataSourceDesc;
        }
        DataSourceDesc dataSourceDesc2 = (DataSourceDesc) this.mItemDsdMap.get(mediaItem2);
        if (dataSourceDesc2 != null) {
            return dataSourceDesc2;
        }
        OnDataSourceMissingHelper onDataSourceMissingHelper = this.mDsmHelper;
        if (onDataSourceMissingHelper != null) {
            dataSourceDesc2 = onDataSourceMissingHelper.onDataSourceMissing(this.mSession.getInstance(), mediaItem2);
            if (dataSourceDesc2 != null) {
                this.mItemDsdMap.put(mediaItem2, dataSourceDesc2);
            }
        }
        return dataSourceDesc2;
    }

    /* access modifiers changed from: private */
    public void updateCurrentIfNeededLocked() {
        if (hasValidItem() && !this.mCurrent.isValid()) {
            int indexOf = this.mShuffledList.indexOf(this.mCurrent.mediaItem);
            if (indexOf >= 0) {
                this.mCurrent.shuffledIdx = indexOf;
                return;
            }
            if (this.mCurrent.shuffledIdx >= this.mShuffledList.size()) {
                this.mCurrent = getNextValidPlayItemLocked(this.mShuffledList.size() - 1, 1);
            } else {
                this.mCurrent.mediaItem = (MediaItem2) this.mShuffledList.get(this.mCurrent.shuffledIdx);
                if (retrieveDataSourceDescLocked(this.mCurrent.mediaItem) == null) {
                    this.mCurrent = getNextValidPlayItemLocked(this.mCurrent.shuffledIdx, 1);
                }
            }
            updatePlayerDataSourceLocked();
        }
    }

    private void updatePlayerDataSourceLocked() {
        if (!(this.mCurrent == null || this.mCurrent == this.mEopPlayItem || this.mPlayer.getCurrentDataSource() == this.mCurrent.dsd)) {
            this.mPlayer.setDataSource(this.mCurrent.dsd);
            BaseMediaPlayer baseMediaPlayer = this.mPlayer;
            boolean z = true;
            if (this.mRepeatMode != 1) {
                z = false;
            }
            baseMediaPlayer.loopCurrent(z);
        }
    }

    public void addPlaylistItem(int i, @NonNull MediaItem2 mediaItem2) {
        if (mediaItem2 != null) {
            synchronized (this.mLock) {
                int clamp = clamp(i, this.mPlaylist.size());
                this.mPlaylist.add(clamp, mediaItem2);
                if (this.mShuffleMode == 0) {
                    this.mShuffledList.add(clamp, mediaItem2);
                } else {
                    this.mShuffledList.add((int) (Math.random() * ((double) (this.mShuffledList.size() + 1))), mediaItem2);
                }
                if (!hasValidItem()) {
                    this.mCurrent = getNextValidPlayItemLocked(-1, 1);
                    updatePlayerDataSourceLocked();
                } else {
                    updateCurrentIfNeededLocked();
                }
            }
            notifyPlaylistChanged();
            return;
        }
        throw new IllegalArgumentException("item shouldn't be null");
    }

    public void clearOnDataSourceMissingHelper() {
        synchronized (this.mLock) {
            this.mDsmHelper = null;
        }
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public int getCurShuffledIndex() {
        int i;
        synchronized (this.mLock) {
            i = hasValidItem() ? this.mCurrent.shuffledIdx : -2;
        }
        return i;
    }

    public MediaItem2 getCurrentMediaItem() {
        MediaItem2 mediaItem2;
        synchronized (this.mLock) {
            mediaItem2 = this.mCurrent == null ? null : this.mCurrent.mediaItem;
        }
        return mediaItem2;
    }

    public MediaItem2 getMediaItem(DataSourceDesc dataSourceDesc) {
        return null;
    }

    @Nullable
    public List<MediaItem2> getPlaylist() {
        List<MediaItem2> unmodifiableList;
        synchronized (this.mLock) {
            unmodifiableList = Collections.unmodifiableList(this.mPlaylist);
        }
        return unmodifiableList;
    }

    @Nullable
    public MediaMetadata2 getPlaylistMetadata() {
        MediaMetadata2 mediaMetadata2;
        synchronized (this.mLock) {
            mediaMetadata2 = this.mMetadata;
        }
        return mediaMetadata2;
    }

    public int getRepeatMode() {
        int i;
        synchronized (this.mLock) {
            i = this.mRepeatMode;
        }
        return i;
    }

    public int getShuffleMode() {
        int i;
        synchronized (this.mLock) {
            i = this.mShuffleMode;
        }
        return i;
    }

    public void removePlaylistItem(@NonNull MediaItem2 mediaItem2) {
        if (mediaItem2 != null) {
            synchronized (this.mLock) {
                if (this.mPlaylist.remove(mediaItem2)) {
                    this.mShuffledList.remove(mediaItem2);
                    this.mItemDsdMap.remove(mediaItem2);
                    updateCurrentIfNeededLocked();
                    notifyPlaylistChanged();
                    return;
                }
                return;
            }
        }
        throw new IllegalArgumentException("item shouldn't be null");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0051, code lost:
        notifyPlaylistChanged();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0054, code lost:
        return;
     */
    public void replacePlaylistItem(int i, @NonNull MediaItem2 mediaItem2) {
        if (mediaItem2 != null) {
            synchronized (this.mLock) {
                if (this.mPlaylist.size() > 0) {
                    int clamp = clamp(i, this.mPlaylist.size() - 1);
                    int indexOf = this.mShuffledList.indexOf(this.mPlaylist.get(clamp));
                    this.mItemDsdMap.remove(this.mShuffledList.get(indexOf));
                    this.mShuffledList.set(indexOf, mediaItem2);
                    this.mPlaylist.set(clamp, mediaItem2);
                    if (!hasValidItem()) {
                        this.mCurrent = getNextValidPlayItemLocked(-1, 1);
                        updatePlayerDataSourceLocked();
                    } else {
                        updateCurrentIfNeededLocked();
                    }
                }
            }
        } else {
            throw new IllegalArgumentException("item shouldn't be null");
        }
    }

    public void setOnDataSourceMissingHelper(OnDataSourceMissingHelper onDataSourceMissingHelper) {
        synchronized (this.mLock) {
            this.mDsmHelper = onDataSourceMissingHelper;
        }
    }

    public void setPlayer(@NonNull BaseMediaPlayer baseMediaPlayer) {
        if (baseMediaPlayer != null) {
            synchronized (this.mLock) {
                if (baseMediaPlayer != this.mPlayer) {
                    this.mPlayer.unregisterPlayerEventCallback(this.mPlayerCallback);
                    this.mPlayer = baseMediaPlayer;
                    this.mPlayer.registerPlayerEventCallback(this.mSession.getCallbackExecutor(), this.mPlayerCallback);
                    updatePlayerDataSourceLocked();
                    return;
                }
                return;
            }
        }
        throw new IllegalArgumentException("player shouldn't be null");
    }

    public void setPlaylist(@NonNull List<MediaItem2> list, @Nullable MediaMetadata2 mediaMetadata2) {
        if (list != null) {
            synchronized (this.mLock) {
                this.mItemDsdMap.clear();
                this.mPlaylist.clear();
                this.mPlaylist.addAll(list);
                applyShuffleModeLocked();
                this.mMetadata = mediaMetadata2;
                this.mCurrent = getNextValidPlayItemLocked(-1, 1);
                updatePlayerDataSourceLocked();
            }
            notifyPlaylistChanged();
            return;
        }
        throw new IllegalArgumentException("list shouldn't be null");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:23:0x003e, code lost:
        notifyRepeatModeChanged();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x0041, code lost:
        return;
     */
    public void setRepeatMode(int i) {
        if (i >= 0 && i <= 3) {
            synchronized (this.mLock) {
                if (this.mRepeatMode != i) {
                    this.mRepeatMode = i;
                    switch (i) {
                        case 0:
                            break;
                        case 1:
                            if (!(this.mCurrent == null || this.mCurrent == this.mEopPlayItem)) {
                                this.mPlayer.loopCurrent(true);
                                break;
                            }
                        case 2:
                        case 3:
                            if (this.mCurrent == this.mEopPlayItem) {
                                this.mCurrent = getNextValidPlayItemLocked(-1, 1);
                                updatePlayerDataSourceLocked();
                                break;
                            }
                            break;
                    }
                    this.mPlayer.loopCurrent(false);
                }
            }
        }
    }

    public void setShuffleMode(int i) {
        if (i >= 0 && i <= 2) {
            synchronized (this.mLock) {
                if (this.mShuffleMode != i) {
                    this.mShuffleMode = i;
                    applyShuffleModeLocked();
                    updateCurrentIfNeededLocked();
                    notifyShuffleModeChanged();
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0025, code lost:
        return;
     */
    public void skipToNextItem() {
        synchronized (this.mLock) {
            if (hasValidItem()) {
                if (this.mCurrent != this.mEopPlayItem) {
                    PlayItem nextValidPlayItemLocked = getNextValidPlayItemLocked(this.mCurrent.shuffledIdx, 1);
                    if (nextValidPlayItemLocked != this.mEopPlayItem) {
                        this.mCurrent = nextValidPlayItemLocked;
                    }
                    updateCurrentIfNeededLocked();
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:17:0x002d, code lost:
        return;
     */
    public void skipToPlaylistItem(@NonNull MediaItem2 mediaItem2) {
        if (mediaItem2 != null) {
            synchronized (this.mLock) {
                if (hasValidItem()) {
                    if (!mediaItem2.equals(this.mCurrent.mediaItem)) {
                        int indexOf = this.mShuffledList.indexOf(mediaItem2);
                        if (indexOf >= 0) {
                            this.mCurrent = new PlayItem(this, indexOf);
                            updateCurrentIfNeededLocked();
                        }
                    }
                }
            }
        } else {
            throw new IllegalArgumentException("item shouldn't be null");
        }
    }

    public void skipToPreviousItem() {
        synchronized (this.mLock) {
            if (hasValidItem()) {
                PlayItem nextValidPlayItemLocked = getNextValidPlayItemLocked(this.mCurrent.shuffledIdx, -1);
                if (nextValidPlayItemLocked != this.mEopPlayItem) {
                    this.mCurrent = nextValidPlayItemLocked;
                }
                updateCurrentIfNeededLocked();
            }
        }
    }

    public void updatePlaylistMetadata(@Nullable MediaMetadata2 mediaMetadata2) {
        synchronized (this.mLock) {
            if (mediaMetadata2 != this.mMetadata) {
                this.mMetadata = mediaMetadata2;
                notifyPlaylistMetadataChanged();
            }
        }
    }
}
