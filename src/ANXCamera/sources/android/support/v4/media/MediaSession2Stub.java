package android.support.v4.media;

import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.os.SystemClock;
import android.support.annotation.GuardedBy;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.mediacompat.Rating2;
import android.support.v4.media.IMediaSession2.Stub;
import android.support.v4.media.MediaController2.PlaybackInfo;
import android.support.v4.media.MediaSession2.CommandButton;
import android.support.v4.media.MediaSession2.ControllerInfo;
import android.support.v4.media.session.MediaSessionCompat;
import android.support.v4.util.ArrayMap;
import android.text.TextUtils;
import android.util.Log;
import android.util.SparseArray;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;

@TargetApi(19)
class MediaSession2Stub extends Stub {
    private static final boolean DEBUG = true;
    private static final String TAG = "MediaSession2Stub";
    /* access modifiers changed from: private */
    public static final SparseArray<SessionCommand2> sCommandsForOnCommandRequest = new SparseArray<>();
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public final ArrayMap<ControllerInfo, SessionCommandGroup2> mAllowedCommandGroupMap = new ArrayMap<>();
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public final Set<IBinder> mConnectingControllers = new HashSet();
    final Context mContext;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public final ArrayMap<IBinder, ControllerInfo> mControllers = new ArrayMap<>();
    /* access modifiers changed from: private */
    public final Object mLock = new Object();
    final SupportLibraryImpl mSession;

    static final class Controller2Cb extends ControllerCb {
        private final IMediaController2 mIControllerCallback;

        Controller2Cb(@NonNull IMediaController2 iMediaController2) {
            this.mIControllerCallback = iMediaController2;
        }

        /* access modifiers changed from: 0000 */
        @NonNull
        public IBinder getId() {
            return this.mIControllerCallback.asBinder();
        }

        /* access modifiers changed from: 0000 */
        public void onAllowedCommandsChanged(SessionCommandGroup2 sessionCommandGroup2) throws RemoteException {
            this.mIControllerCallback.onAllowedCommandsChanged(sessionCommandGroup2.toBundle());
        }

        /* access modifiers changed from: 0000 */
        public void onBufferingStateChanged(MediaItem2 mediaItem2, int i, long j) throws RemoteException {
            this.mIControllerCallback.onBufferingStateChanged(mediaItem2 == null ? null : mediaItem2.toBundle(), i, j);
        }

        /* access modifiers changed from: 0000 */
        public void onChildrenChanged(String str, int i, Bundle bundle) throws RemoteException {
            this.mIControllerCallback.onChildrenChanged(str, i, bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onCurrentMediaItemChanged(MediaItem2 mediaItem2) throws RemoteException {
            this.mIControllerCallback.onCurrentMediaItemChanged(mediaItem2 == null ? null : mediaItem2.toBundle());
        }

        /* access modifiers changed from: 0000 */
        public void onCustomCommand(SessionCommand2 sessionCommand2, Bundle bundle, ResultReceiver resultReceiver) throws RemoteException {
            this.mIControllerCallback.onCustomCommand(sessionCommand2.toBundle(), bundle, resultReceiver);
        }

        /* access modifiers changed from: 0000 */
        public void onCustomLayoutChanged(List<CommandButton> list) throws RemoteException {
            this.mIControllerCallback.onCustomLayoutChanged(MediaUtils2.convertCommandButtonListToBundleList(list));
        }

        /* access modifiers changed from: 0000 */
        public void onDisconnected() throws RemoteException {
            this.mIControllerCallback.onDisconnected();
        }

        /* access modifiers changed from: 0000 */
        public void onError(int i, Bundle bundle) throws RemoteException {
            this.mIControllerCallback.onError(i, bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onGetChildrenDone(String str, int i, int i2, List<MediaItem2> list, Bundle bundle) throws RemoteException {
            this.mIControllerCallback.onGetChildrenDone(str, i, i2, MediaUtils2.convertMediaItem2ListToBundleList(list), bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onGetItemDone(String str, MediaItem2 mediaItem2) throws RemoteException {
            this.mIControllerCallback.onGetItemDone(str, mediaItem2 == null ? null : mediaItem2.toBundle());
        }

        /* access modifiers changed from: 0000 */
        public void onGetLibraryRootDone(Bundle bundle, String str, Bundle bundle2) throws RemoteException {
            this.mIControllerCallback.onGetLibraryRootDone(bundle, str, bundle2);
        }

        /* access modifiers changed from: 0000 */
        public void onGetSearchResultDone(String str, int i, int i2, List<MediaItem2> list, Bundle bundle) throws RemoteException {
            this.mIControllerCallback.onGetSearchResultDone(str, i, i2, MediaUtils2.convertMediaItem2ListToBundleList(list), bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onPlaybackInfoChanged(PlaybackInfo playbackInfo) throws RemoteException {
            this.mIControllerCallback.onPlaybackInfoChanged(playbackInfo.toBundle());
        }

        /* access modifiers changed from: 0000 */
        public void onPlaybackSpeedChanged(long j, long j2, float f) throws RemoteException {
            this.mIControllerCallback.onPlaybackSpeedChanged(j, j2, f);
        }

        /* access modifiers changed from: 0000 */
        public void onPlayerStateChanged(long j, long j2, int i) throws RemoteException {
            this.mIControllerCallback.onPlayerStateChanged(j, j2, i);
        }

        /* access modifiers changed from: 0000 */
        public void onPlaylistChanged(List<MediaItem2> list, MediaMetadata2 mediaMetadata2) throws RemoteException {
            this.mIControllerCallback.onPlaylistChanged(MediaUtils2.convertMediaItem2ListToBundleList(list), mediaMetadata2 == null ? null : mediaMetadata2.toBundle());
        }

        /* access modifiers changed from: 0000 */
        public void onPlaylistMetadataChanged(MediaMetadata2 mediaMetadata2) throws RemoteException {
            this.mIControllerCallback.onPlaylistMetadataChanged(mediaMetadata2.toBundle());
        }

        /* access modifiers changed from: 0000 */
        public void onRepeatModeChanged(int i) throws RemoteException {
            this.mIControllerCallback.onRepeatModeChanged(i);
        }

        /* access modifiers changed from: 0000 */
        public void onRoutesInfoChanged(List<Bundle> list) throws RemoteException {
            this.mIControllerCallback.onRoutesInfoChanged(list);
        }

        /* access modifiers changed from: 0000 */
        public void onSearchResultChanged(String str, int i, Bundle bundle) throws RemoteException {
            this.mIControllerCallback.onSearchResultChanged(str, i, bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onSeekCompleted(long j, long j2, long j3) throws RemoteException {
            this.mIControllerCallback.onSeekCompleted(j, j2, j3);
        }

        /* access modifiers changed from: 0000 */
        public void onShuffleModeChanged(int i) throws RemoteException {
            this.mIControllerCallback.onShuffleModeChanged(i);
        }
    }

    @FunctionalInterface
    private interface SessionRunnable {
        void run(ControllerInfo controllerInfo) throws RemoteException;
    }

    static {
        SessionCommandGroup2 sessionCommandGroup2 = new SessionCommandGroup2();
        sessionCommandGroup2.addAllPlaybackCommands();
        sessionCommandGroup2.addAllPlaylistCommands();
        sessionCommandGroup2.addAllVolumeCommands();
        for (SessionCommand2 sessionCommand2 : sessionCommandGroup2.getCommands()) {
            sCommandsForOnCommandRequest.append(sessionCommand2.getCommandCode(), sessionCommand2);
        }
    }

    MediaSession2Stub(SupportLibraryImpl supportLibraryImpl) {
        this.mSession = supportLibraryImpl;
        this.mContext = this.mSession.getContext();
    }

    /* access modifiers changed from: private */
    public SupportLibraryImpl getLibrarySession() {
        if (this.mSession instanceof SupportLibraryImpl) {
            return (SupportLibraryImpl) this.mSession;
        }
        throw new RuntimeException("Session cannot be casted to library session");
    }

    /* access modifiers changed from: private */
    public boolean isAllowedCommand(ControllerInfo controllerInfo, int i) {
        SessionCommandGroup2 sessionCommandGroup2;
        synchronized (this.mLock) {
            sessionCommandGroup2 = (SessionCommandGroup2) this.mAllowedCommandGroupMap.get(controllerInfo);
        }
        return sessionCommandGroup2 != null && sessionCommandGroup2.hasCommand(i);
    }

    /* access modifiers changed from: private */
    public boolean isAllowedCommand(ControllerInfo controllerInfo, SessionCommand2 sessionCommand2) {
        SessionCommandGroup2 sessionCommandGroup2;
        synchronized (this.mLock) {
            sessionCommandGroup2 = (SessionCommandGroup2) this.mAllowedCommandGroupMap.get(controllerInfo);
        }
        return sessionCommandGroup2 != null && sessionCommandGroup2.hasCommand(sessionCommand2);
    }

    private void onBrowserCommand(@NonNull IMediaController2 iMediaController2, int i, @NonNull SessionRunnable sessionRunnable) {
        if (this.mSession instanceof SupportLibraryImpl) {
            onSessionCommandInternal(iMediaController2, null, i, sessionRunnable);
            return;
        }
        throw new RuntimeException("MediaSession2 cannot handle MediaLibrarySession command");
    }

    private void onSessionCommand(@NonNull IMediaController2 iMediaController2, int i, @NonNull SessionRunnable sessionRunnable) {
        onSessionCommandInternal(iMediaController2, null, i, sessionRunnable);
    }

    private void onSessionCommand(@NonNull IMediaController2 iMediaController2, @NonNull SessionCommand2 sessionCommand2, @NonNull SessionRunnable sessionRunnable) {
        onSessionCommandInternal(iMediaController2, sessionCommand2, 0, sessionRunnable);
    }

    private void onSessionCommandInternal(@NonNull IMediaController2 iMediaController2, @Nullable SessionCommand2 sessionCommand2, int i, @NonNull SessionRunnable sessionRunnable) {
        final ControllerInfo controllerInfo;
        synchronized (this.mLock) {
            controllerInfo = iMediaController2 == null ? null : (ControllerInfo) this.mControllers.get(iMediaController2.asBinder());
        }
        if (!this.mSession.isClosed() && controllerInfo != null) {
            Executor callbackExecutor = this.mSession.getCallbackExecutor();
            final SessionCommand2 sessionCommand22 = sessionCommand2;
            final int i2 = i;
            final SessionRunnable sessionRunnable2 = sessionRunnable;
            AnonymousClass1 r1 = new Runnable() {
                /* JADX WARNING: Code restructure failed: missing block: B:11:0x0026, code lost:
                    if (android.support.v4.media.MediaSession2Stub.access$200(r4.this$0, r3, r4) != false) goto L_0x0029;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:12:0x0028, code lost:
                    return;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:13:0x0029, code lost:
                    r0 = (android.support.v4.media.SessionCommand2) android.support.v4.media.MediaSession2Stub.access$300().get(r4.getCommandCode());
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:15:0x0044, code lost:
                    if (android.support.v4.media.MediaSession2Stub.access$400(r4.this$0, r3, r5) != false) goto L_0x0047;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:16:0x0046, code lost:
                    return;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:17:0x0047, code lost:
                    r0 = (android.support.v4.media.SessionCommand2) android.support.v4.media.MediaSession2Stub.access$300().get(r5);
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:18:0x0053, code lost:
                    if (r0 == null) goto L_0x009a;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:20:0x006b, code lost:
                    if (r4.this$0.mSession.getCallback().onCommandRequest(r4.this$0.mSession.getInstance(), r3, r0) != false) goto L_0x009a;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:21:0x006d, code lost:
                    r1 = android.support.v4.media.MediaSession2Stub.TAG;
                    r2 = new java.lang.StringBuilder();
                    r2.append("Command (");
                    r2.append(r0);
                    r2.append(") from ");
                    r2.append(r3);
                    r2.append(" was rejected by ");
                    r2.append(r4.this$0.mSession);
                    android.util.Log.d(r1, r2.toString());
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:22:0x0099, code lost:
                    return;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:24:?, code lost:
                    r6.run(r3);
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:25:0x00a2, code lost:
                    r0 = move-exception;
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:26:0x00a3, code lost:
                    r1 = android.support.v4.media.MediaSession2Stub.TAG;
                    r2 = new java.lang.StringBuilder();
                    r2.append("Exception in ");
                    r2.append(r3.toString());
                    android.util.Log.w(r1, r2.toString(), r0);
                 */
                /* JADX WARNING: Code restructure failed: missing block: B:9:0x001a, code lost:
                    if (r4 == null) goto L_0x003a;
                 */
                public void run() {
                    synchronized (MediaSession2Stub.this.mLock) {
                        if (!MediaSession2Stub.this.mControllers.containsValue(controllerInfo)) {
                        }
                    }
                }
            };
            callbackExecutor.execute(r1);
        }
    }

    private void releaseController(IMediaController2 iMediaController2) {
        final ControllerInfo controllerInfo;
        synchronized (this.mLock) {
            controllerInfo = (ControllerInfo) this.mControllers.remove(iMediaController2.asBinder());
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("releasing ");
            sb.append(controllerInfo);
            Log.d(str, sb.toString());
        }
        if (!this.mSession.isClosed() && controllerInfo != null) {
            this.mSession.getCallbackExecutor().execute(new Runnable() {
                public void run() {
                    MediaSession2Stub.this.mSession.getCallback().onDisconnected(MediaSession2Stub.this.mSession.getInstance(), controllerInfo);
                }
            });
        }
    }

    public void addPlaylistItem(IMediaController2 iMediaController2, final int i, final Bundle bundle) {
        onSessionCommand(iMediaController2, 15, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getInstance().addPlaylistItem(i, MediaItem2.fromBundle(bundle, null));
            }
        });
    }

    public void adjustVolume(IMediaController2 iMediaController2, final int i, final int i2) throws RuntimeException {
        onSessionCommand(iMediaController2, 11, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                VolumeProviderCompat volumeProvider = MediaSession2Stub.this.mSession.getVolumeProvider();
                if (volumeProvider == null) {
                    MediaSessionCompat sessionCompat = MediaSession2Stub.this.mSession.getSessionCompat();
                    if (sessionCompat != null) {
                        sessionCompat.getController().adjustVolume(i, i2);
                        return;
                    }
                    return;
                }
                volumeProvider.onAdjustVolume(i);
            }
        });
    }

    public void connect(final IMediaController2 iMediaController2, String str) throws RuntimeException {
        final ControllerInfo controllerInfo = new ControllerInfo(str, Binder.getCallingPid(), Binder.getCallingUid(), new Controller2Cb(iMediaController2));
        this.mSession.getCallbackExecutor().execute(new Runnable() {
            public void run() {
                if (!MediaSession2Stub.this.mSession.isClosed()) {
                    synchronized (MediaSession2Stub.this.mLock) {
                        MediaSession2Stub.this.mConnectingControllers.add(controllerInfo.getId());
                    }
                    SessionCommandGroup2 onConnect = MediaSession2Stub.this.mSession.getCallback().onConnect(MediaSession2Stub.this.mSession.getInstance(), controllerInfo);
                    if (onConnect != null || controllerInfo.isTrusted()) {
                        String str = MediaSession2Stub.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("Accepting connection, controllerInfo=");
                        sb.append(controllerInfo);
                        sb.append(" allowedCommands=");
                        sb.append(onConnect);
                        Log.d(str, sb.toString());
                        if (onConnect == null) {
                            onConnect = new SessionCommandGroup2();
                        }
                        synchronized (MediaSession2Stub.this.mLock) {
                            MediaSession2Stub.this.mConnectingControllers.remove(controllerInfo.getId());
                            MediaSession2Stub.this.mControllers.put(controllerInfo.getId(), controllerInfo);
                            MediaSession2Stub.this.mAllowedCommandGroupMap.put(controllerInfo, onConnect);
                        }
                        int playerState = MediaSession2Stub.this.mSession.getPlayerState();
                        List list = null;
                        Bundle bundle = MediaSession2Stub.this.mSession.getCurrentMediaItem() == null ? null : MediaSession2Stub.this.mSession.getCurrentMediaItem().toBundle();
                        long elapsedRealtime = SystemClock.elapsedRealtime();
                        long currentPosition = MediaSession2Stub.this.mSession.getCurrentPosition();
                        float playbackSpeed = MediaSession2Stub.this.mSession.getPlaybackSpeed();
                        long bufferedPosition = MediaSession2Stub.this.mSession.getBufferedPosition();
                        Bundle bundle2 = MediaSession2Stub.this.mSession.getPlaybackInfo().toBundle();
                        int repeatMode = MediaSession2Stub.this.mSession.getRepeatMode();
                        int shuffleMode = MediaSession2Stub.this.mSession.getShuffleMode();
                        PendingIntent sessionActivity = MediaSession2Stub.this.mSession.getSessionActivity();
                        if (onConnect.hasCommand(18)) {
                            list = MediaSession2Stub.this.mSession.getPlaylist();
                        }
                        List convertMediaItem2ListToBundleList = MediaUtils2.convertMediaItem2ListToBundleList(list);
                        if (!MediaSession2Stub.this.mSession.isClosed()) {
                            try {
                                iMediaController2.onConnected(MediaSession2Stub.this, onConnect.toBundle(), playerState, bundle, elapsedRealtime, currentPosition, playbackSpeed, bufferedPosition, bundle2, repeatMode, shuffleMode, convertMediaItem2ListToBundleList, sessionActivity);
                            } catch (RemoteException e) {
                            }
                        }
                    } else {
                        synchronized (MediaSession2Stub.this.mLock) {
                            MediaSession2Stub.this.mConnectingControllers.remove(controllerInfo.getId());
                        }
                        String str2 = MediaSession2Stub.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Rejecting connection, controllerInfo=");
                        sb2.append(controllerInfo);
                        Log.d(str2, sb2.toString());
                        try {
                            iMediaController2.onDisconnected();
                        } catch (RemoteException e2) {
                        }
                    }
                }
            }
        });
    }

    public void fastForward(IMediaController2 iMediaController2) {
        onSessionCommand(iMediaController2, 7, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getCallback().onFastForward(MediaSession2Stub.this.mSession.getInstance(), controllerInfo);
            }
        });
    }

    public void getChildren(IMediaController2 iMediaController2, String str, int i, int i2, Bundle bundle) throws RuntimeException {
        final String str2 = str;
        final int i3 = i;
        final int i4 = i2;
        final Bundle bundle2 = bundle;
        AnonymousClass37 r0 = new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (str2 == null) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("getChildren(): Ignoring null parentId from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                } else if (i3 < 1 || i4 < 1) {
                    String str2 = MediaSession2Stub.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("getChildren(): Ignoring page nor pageSize less than 1 from ");
                    sb2.append(controllerInfo);
                    Log.w(str2, sb2.toString());
                } else {
                    MediaSession2Stub.this.getLibrarySession().onGetChildrenOnExecutor(controllerInfo, str2, i3, i4, bundle2);
                }
            }
        };
        onBrowserCommand(iMediaController2, 29, r0);
    }

    /* access modifiers changed from: 0000 */
    public List<ControllerInfo> getConnectedControllers() {
        ArrayList arrayList = new ArrayList();
        synchronized (this.mLock) {
            for (int i = 0; i < this.mControllers.size(); i++) {
                arrayList.add(this.mControllers.valueAt(i));
            }
        }
        return arrayList;
    }

    public void getItem(IMediaController2 iMediaController2, final String str) throws RuntimeException {
        onBrowserCommand(iMediaController2, 30, new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (str == null) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("getItem(): Ignoring null mediaId from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                    return;
                }
                MediaSession2Stub.this.getLibrarySession().onGetItemOnExecutor(controllerInfo, str);
            }
        });
    }

    public void getLibraryRoot(IMediaController2 iMediaController2, final Bundle bundle) throws RuntimeException {
        onBrowserCommand(iMediaController2, 31, new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.getLibrarySession().onGetLibraryRootOnExecutor(controllerInfo, bundle);
            }
        });
    }

    public void getSearchResult(IMediaController2 iMediaController2, String str, int i, int i2, Bundle bundle) {
        final String str2 = str;
        final int i3 = i;
        final int i4 = i2;
        final Bundle bundle2 = bundle;
        AnonymousClass39 r0 = new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (TextUtils.isEmpty(str2)) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("getSearchResult(): Ignoring empty query from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                } else if (i3 < 1 || i4 < 1) {
                    String str2 = MediaSession2Stub.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("getSearchResult(): Ignoring page nor pageSize less than 1  from ");
                    sb2.append(controllerInfo);
                    Log.w(str2, sb2.toString());
                } else {
                    MediaSession2Stub.this.getLibrarySession().onGetSearchResultOnExecutor(controllerInfo, str2, i3, i4, bundle2);
                }
            }
        };
        onBrowserCommand(iMediaController2, 32, r0);
    }

    public void pause(IMediaController2 iMediaController2) throws RuntimeException {
        onSessionCommand(iMediaController2, 2, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.pause();
            }
        });
    }

    public void play(IMediaController2 iMediaController2) throws RuntimeException {
        onSessionCommand(iMediaController2, 1, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.play();
            }
        });
    }

    public void playFromMediaId(IMediaController2 iMediaController2, final String str, final Bundle bundle) {
        onSessionCommand(iMediaController2, 22, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (str == null) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("playFromMediaId(): Ignoring null mediaId from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                    return;
                }
                MediaSession2Stub.this.mSession.getCallback().onPlayFromMediaId(MediaSession2Stub.this.mSession.getInstance(), controllerInfo, str, bundle);
            }
        });
    }

    public void playFromSearch(IMediaController2 iMediaController2, final String str, final Bundle bundle) {
        onSessionCommand(iMediaController2, 24, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (TextUtils.isEmpty(str)) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("playFromSearch(): Ignoring empty query from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                    return;
                }
                MediaSession2Stub.this.mSession.getCallback().onPlayFromSearch(MediaSession2Stub.this.mSession.getInstance(), controllerInfo, str, bundle);
            }
        });
    }

    public void playFromUri(IMediaController2 iMediaController2, final Uri uri, final Bundle bundle) {
        onSessionCommand(iMediaController2, 23, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (uri == null) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("playFromUri(): Ignoring null uri from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                    return;
                }
                MediaSession2Stub.this.mSession.getCallback().onPlayFromUri(MediaSession2Stub.this.mSession.getInstance(), controllerInfo, uri, bundle);
            }
        });
    }

    public void prepare(IMediaController2 iMediaController2) throws RuntimeException {
        onSessionCommand(iMediaController2, 6, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.prepare();
            }
        });
    }

    public void prepareFromMediaId(IMediaController2 iMediaController2, final String str, final Bundle bundle) {
        onSessionCommand(iMediaController2, 25, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (str == null) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("prepareFromMediaId(): Ignoring null mediaId from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                    return;
                }
                MediaSession2Stub.this.mSession.getCallback().onPrepareFromMediaId(MediaSession2Stub.this.mSession.getInstance(), controllerInfo, str, bundle);
            }
        });
    }

    public void prepareFromSearch(IMediaController2 iMediaController2, final String str, final Bundle bundle) {
        onSessionCommand(iMediaController2, 27, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (TextUtils.isEmpty(str)) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("prepareFromSearch(): Ignoring empty query from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                    return;
                }
                MediaSession2Stub.this.mSession.getCallback().onPrepareFromSearch(MediaSession2Stub.this.mSession.getInstance(), controllerInfo, str, bundle);
            }
        });
    }

    public void prepareFromUri(IMediaController2 iMediaController2, final Uri uri, final Bundle bundle) {
        onSessionCommand(iMediaController2, 26, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (uri == null) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("prepareFromUri(): Ignoring null uri from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                    return;
                }
                MediaSession2Stub.this.mSession.getCallback().onPrepareFromUri(MediaSession2Stub.this.mSession.getInstance(), controllerInfo, uri, bundle);
            }
        });
    }

    public void release(IMediaController2 iMediaController2) throws RemoteException {
        releaseController(iMediaController2);
    }

    /* access modifiers changed from: 0000 */
    public void removeControllerInfo(ControllerInfo controllerInfo) {
        synchronized (this.mLock) {
            ControllerInfo controllerInfo2 = (ControllerInfo) this.mControllers.remove(controllerInfo.getId());
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("releasing ");
            sb.append(controllerInfo2);
            Log.d(str, sb.toString());
        }
    }

    public void removePlaylistItem(IMediaController2 iMediaController2, final Bundle bundle) {
        onSessionCommand(iMediaController2, 16, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getInstance().removePlaylistItem(MediaItem2.fromBundle(bundle));
            }
        });
    }

    public void replacePlaylistItem(IMediaController2 iMediaController2, final int i, final Bundle bundle) {
        onSessionCommand(iMediaController2, 17, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getInstance().replacePlaylistItem(i, MediaItem2.fromBundle(bundle, null));
            }
        });
    }

    public void reset(IMediaController2 iMediaController2) throws RuntimeException {
        onSessionCommand(iMediaController2, 3, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.reset();
            }
        });
    }

    public void rewind(IMediaController2 iMediaController2) {
        onSessionCommand(iMediaController2, 8, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getCallback().onRewind(MediaSession2Stub.this.mSession.getInstance(), controllerInfo);
            }
        });
    }

    public void search(IMediaController2 iMediaController2, final String str, final Bundle bundle) {
        onBrowserCommand(iMediaController2, 33, new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (TextUtils.isEmpty(str)) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("search(): Ignoring empty query from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                    return;
                }
                MediaSession2Stub.this.getLibrarySession().onSearchOnExecutor(controllerInfo, str, bundle);
            }
        });
    }

    public void seekTo(IMediaController2 iMediaController2, final long j) throws RuntimeException {
        onSessionCommand(iMediaController2, 9, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.seekTo(j);
            }
        });
    }

    public void selectRoute(IMediaController2 iMediaController2, final Bundle bundle) {
        onSessionCommand(iMediaController2, 37, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getCallback().onSelectRoute(MediaSession2Stub.this.mSession.getInstance(), controllerInfo, bundle);
            }
        });
    }

    public void sendCustomCommand(IMediaController2 iMediaController2, Bundle bundle, final Bundle bundle2, final ResultReceiver resultReceiver) {
        final SessionCommand2 fromBundle = SessionCommand2.fromBundle(bundle);
        onSessionCommand(iMediaController2, SessionCommand2.fromBundle(bundle), (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getCallback().onCustomCommand(MediaSession2Stub.this.mSession.getInstance(), controllerInfo, fromBundle, bundle2, resultReceiver);
            }
        });
    }

    /* access modifiers changed from: 0000 */
    public void setAllowedCommands(ControllerInfo controllerInfo, SessionCommandGroup2 sessionCommandGroup2) {
        synchronized (this.mLock) {
            this.mAllowedCommandGroupMap.put(controllerInfo, sessionCommandGroup2);
        }
    }

    public void setPlaybackSpeed(IMediaController2 iMediaController2, final float f) {
        onSessionCommand(iMediaController2, 39, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getInstance().setPlaybackSpeed(f);
            }
        });
    }

    public void setPlaylist(IMediaController2 iMediaController2, final List<Bundle> list, final Bundle bundle) {
        onSessionCommand(iMediaController2, 19, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (list == null) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("setPlaylist(): Ignoring null playlist from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                    return;
                }
                MediaSession2Stub.this.mSession.getInstance().setPlaylist(MediaUtils2.convertBundleListToMediaItem2List(list), MediaMetadata2.fromBundle(bundle));
            }
        });
    }

    public void setRating(IMediaController2 iMediaController2, final String str, final Bundle bundle) {
        onSessionCommand(iMediaController2, 28, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (str == null) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("setRating(): Ignoring null mediaId from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                } else if (bundle == null) {
                    String str2 = MediaSession2Stub.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("setRating(): Ignoring null ratingBundle from ");
                    sb2.append(controllerInfo);
                    Log.w(str2, sb2.toString());
                } else {
                    Rating2 fromBundle = Rating2.fromBundle(bundle);
                    if (fromBundle != null) {
                        MediaSession2Stub.this.mSession.getCallback().onSetRating(MediaSession2Stub.this.mSession.getInstance(), controllerInfo, str, fromBundle);
                    } else if (bundle == null) {
                        String str3 = MediaSession2Stub.TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("setRating(): Ignoring null rating from ");
                        sb3.append(controllerInfo);
                        Log.w(str3, sb3.toString());
                    }
                }
            }
        });
    }

    public void setRepeatMode(IMediaController2 iMediaController2, final int i) {
        onSessionCommand(iMediaController2, 14, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getInstance().setRepeatMode(i);
            }
        });
    }

    public void setShuffleMode(IMediaController2 iMediaController2, final int i) {
        onSessionCommand(iMediaController2, 13, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getInstance().setShuffleMode(i);
            }
        });
    }

    public void setVolumeTo(IMediaController2 iMediaController2, final int i, final int i2) throws RuntimeException {
        onSessionCommand(iMediaController2, 10, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                VolumeProviderCompat volumeProvider = MediaSession2Stub.this.mSession.getVolumeProvider();
                if (volumeProvider == null) {
                    MediaSessionCompat sessionCompat = MediaSession2Stub.this.mSession.getSessionCompat();
                    if (sessionCompat != null) {
                        sessionCompat.getController().setVolumeTo(i, i2);
                        return;
                    }
                    return;
                }
                volumeProvider.onSetVolumeTo(i);
            }
        });
    }

    public void skipToNextItem(IMediaController2 iMediaController2) {
        onSessionCommand(iMediaController2, 4, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getInstance().skipToNextItem();
            }
        });
    }

    public void skipToPlaylistItem(IMediaController2 iMediaController2, final Bundle bundle) {
        onSessionCommand(iMediaController2, 12, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (bundle == null) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("skipToPlaylistItem(): Ignoring null mediaItem from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                }
                MediaSession2Stub.this.mSession.getInstance().skipToPlaylistItem(MediaItem2.fromBundle(bundle));
            }
        });
    }

    public void skipToPreviousItem(IMediaController2 iMediaController2) {
        onSessionCommand(iMediaController2, 5, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getInstance().skipToPreviousItem();
            }
        });
    }

    public void subscribe(IMediaController2 iMediaController2, final String str, final Bundle bundle) {
        onBrowserCommand(iMediaController2, 34, new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (str == null) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("subscribe(): Ignoring null parentId from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                    return;
                }
                MediaSession2Stub.this.getLibrarySession().onSubscribeOnExecutor(controllerInfo, str, bundle);
            }
        });
    }

    public void subscribeRoutesInfo(IMediaController2 iMediaController2) {
        onSessionCommand(iMediaController2, 36, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getCallback().onSubscribeRoutesInfo(MediaSession2Stub.this.mSession.getInstance(), controllerInfo);
            }
        });
    }

    public void unsubscribe(IMediaController2 iMediaController2, final String str) {
        onBrowserCommand(iMediaController2, 35, new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                if (str == null) {
                    String str = MediaSession2Stub.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("unsubscribe(): Ignoring null parentId from ");
                    sb.append(controllerInfo);
                    Log.w(str, sb.toString());
                    return;
                }
                MediaSession2Stub.this.getLibrarySession().onUnsubscribeOnExecutor(controllerInfo, str);
            }
        });
    }

    public void unsubscribeRoutesInfo(IMediaController2 iMediaController2) {
        onSessionCommand(iMediaController2, 37, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getCallback().onUnsubscribeRoutesInfo(MediaSession2Stub.this.mSession.getInstance(), controllerInfo);
            }
        });
    }

    public void updatePlaylistMetadata(IMediaController2 iMediaController2, final Bundle bundle) {
        onSessionCommand(iMediaController2, 21, (SessionRunnable) new SessionRunnable() {
            public void run(ControllerInfo controllerInfo) throws RemoteException {
                MediaSession2Stub.this.mSession.getInstance().updatePlaylistMetadata(MediaMetadata2.fromBundle(bundle));
            }
        });
    }
}
