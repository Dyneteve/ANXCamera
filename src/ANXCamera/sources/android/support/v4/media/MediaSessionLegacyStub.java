package android.support.v4.media;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcelable;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.support.annotation.GuardedBy;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.BundleCompat;
import android.support.v4.media.MediaController2.PlaybackInfo;
import android.support.v4.media.MediaSession2.CommandButton;
import android.support.v4.media.MediaSession2.ControllerInfo;
import android.support.v4.media.session.IMediaControllerCallback;
import android.support.v4.media.session.IMediaControllerCallback.Stub;
import android.support.v4.media.session.MediaSessionCompat.Callback;
import android.support.v4.util.ArrayMap;
import android.util.Log;
import android.util.SparseArray;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Executor;

@TargetApi(19)
class MediaSessionLegacyStub extends Callback {
    /* access modifiers changed from: private */
    public static final boolean DEBUG = Log.isLoggable(TAG, 3);
    private static final String TAG = "MediaSessionLegacyStub";
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

    final class ControllerLegacyCb extends ControllerCb {
        private final IMediaControllerCallback mIControllerCallback;

        ControllerLegacyCb(IMediaControllerCallback iMediaControllerCallback) {
            this.mIControllerCallback = iMediaControllerCallback;
        }

        /* access modifiers changed from: 0000 */
        @NonNull
        public IBinder getId() {
            return this.mIControllerCallback.asBinder();
        }

        /* access modifiers changed from: 0000 */
        public void onAllowedCommandsChanged(SessionCommandGroup2 sessionCommandGroup2) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putBundle("android.support.v4.media.argument.ALLOWED_COMMANDS", sessionCommandGroup2.toBundle());
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_ALLOWED_COMMANDS_CHANGED", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onBufferingStateChanged(MediaItem2 mediaItem2, int i, long j) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putBundle("android.support.v4.media.argument.MEDIA_ITEM", mediaItem2.toBundle());
            bundle.putInt("android.support.v4.media.argument.BUFFERING_STATE", i);
            bundle.putParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT", MediaSessionLegacyStub.this.mSession.getPlaybackStateCompat());
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_BUFFERING_STATE_CHANGED", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onChildrenChanged(String str, int i, Bundle bundle) throws RemoteException {
        }

        /* access modifiers changed from: 0000 */
        public void onCurrentMediaItemChanged(MediaItem2 mediaItem2) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putBundle("android.support.v4.media.argument.MEDIA_ITEM", mediaItem2 == null ? null : mediaItem2.toBundle());
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_CURRENT_MEDIA_ITEM_CHANGED", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onCustomCommand(SessionCommand2 sessionCommand2, Bundle bundle, ResultReceiver resultReceiver) throws RemoteException {
            Bundle bundle2 = new Bundle();
            bundle2.putBundle("android.support.v4.media.argument.CUSTOM_COMMAND", sessionCommand2.toBundle());
            bundle2.putBundle("android.support.v4.media.argument.ARGUMENTS", bundle);
            bundle2.putParcelable("android.support.v4.media.argument.RESULT_RECEIVER", resultReceiver);
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.SEND_CUSTOM_COMMAND", bundle2);
        }

        /* access modifiers changed from: 0000 */
        public void onCustomLayoutChanged(List<CommandButton> list) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putParcelableArray("android.support.v4.media.argument.COMMAND_BUTTONS", MediaUtils2.convertCommandButtonListToParcelableArray(list));
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.SET_CUSTOM_LAYOUT", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onDisconnected() throws RemoteException {
            this.mIControllerCallback.onSessionDestroyed();
        }

        /* access modifiers changed from: 0000 */
        public void onError(int i, Bundle bundle) throws RemoteException {
            Bundle bundle2 = new Bundle();
            bundle2.putInt("android.support.v4.media.argument.ERROR_CODE", i);
            bundle2.putBundle("android.support.v4.media.argument.EXTRAS", bundle);
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_ERROR", bundle2);
        }

        /* access modifiers changed from: 0000 */
        public void onGetChildrenDone(String str, int i, int i2, List<MediaItem2> list, Bundle bundle) throws RemoteException {
        }

        /* access modifiers changed from: 0000 */
        public void onGetItemDone(String str, MediaItem2 mediaItem2) throws RemoteException {
        }

        /* access modifiers changed from: 0000 */
        public void onGetLibraryRootDone(Bundle bundle, String str, Bundle bundle2) throws RemoteException {
        }

        /* access modifiers changed from: 0000 */
        public void onGetSearchResultDone(String str, int i, int i2, List<MediaItem2> list, Bundle bundle) throws RemoteException {
        }

        /* access modifiers changed from: 0000 */
        public void onPlaybackInfoChanged(PlaybackInfo playbackInfo) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putBundle("android.support.v4.media.argument.PLAYBACK_INFO", playbackInfo.toBundle());
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_PLAYBACK_INFO_CHANGED", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onPlaybackSpeedChanged(long j, long j2, float f) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT", MediaSessionLegacyStub.this.mSession.getPlaybackStateCompat());
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_PLAYBACK_SPEED_CHANGED", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onPlayerStateChanged(long j, long j2, int i) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putInt("android.support.v4.media.argument.PLAYER_STATE", i);
            bundle.putParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT", MediaSessionLegacyStub.this.mSession.getPlaybackStateCompat());
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_PLAYER_STATE_CHANGED", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onPlaylistChanged(List<MediaItem2> list, MediaMetadata2 mediaMetadata2) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putParcelableArray("android.support.v4.media.argument.PLAYLIST", MediaUtils2.convertMediaItem2ListToParcelableArray(list));
            bundle.putBundle("android.support.v4.media.argument.PLAYLIST_METADATA", mediaMetadata2 == null ? null : mediaMetadata2.toBundle());
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_PLAYLIST_CHANGED", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onPlaylistMetadataChanged(MediaMetadata2 mediaMetadata2) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putBundle("android.support.v4.media.argument.PLAYLIST_METADATA", mediaMetadata2 == null ? null : mediaMetadata2.toBundle());
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_PLAYLIST_METADATA_CHANGED", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onRepeatModeChanged(int i) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putInt("android.support.v4.media.argument.REPEAT_MODE", i);
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_REPEAT_MODE_CHANGED", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onRoutesInfoChanged(List<Bundle> list) throws RemoteException {
            Bundle bundle;
            if (list != null) {
                bundle = new Bundle();
                bundle.putParcelableArray("android.support.v4.media.argument.ROUTE_BUNDLE", (Parcelable[]) list.toArray(new Bundle[0]));
            } else {
                bundle = null;
            }
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_ROUTES_INFO_CHANGED", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onSearchResultChanged(String str, int i, Bundle bundle) throws RemoteException {
        }

        /* access modifiers changed from: 0000 */
        public void onSeekCompleted(long j, long j2, long j3) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putLong("android.support.v4.media.argument.SEEK_POSITION", j3);
            bundle.putParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT", MediaSessionLegacyStub.this.mSession.getPlaybackStateCompat());
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_SEEK_COMPLETED", bundle);
        }

        /* access modifiers changed from: 0000 */
        public void onShuffleModeChanged(int i) throws RemoteException {
            Bundle bundle = new Bundle();
            bundle.putInt("android.support.v4.media.argument.SHUFFLE_MODE", i);
            this.mIControllerCallback.onEvent("android.support.v4.media.session.event.ON_SHUFFLE_MODE_CHANGED", bundle);
        }
    }

    @FunctionalInterface
    private interface Session2Runnable {
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

    MediaSessionLegacyStub(SupportLibraryImpl supportLibraryImpl) {
        this.mSession = supportLibraryImpl;
        this.mContext = this.mSession.getContext();
    }

    private void connect(Bundle bundle, final ResultReceiver resultReceiver) {
        final ControllerInfo createControllerInfo = createControllerInfo(bundle);
        this.mSession.getCallbackExecutor().execute(new Runnable() {
            public void run() {
                if (!MediaSessionLegacyStub.this.mSession.isClosed()) {
                    synchronized (MediaSessionLegacyStub.this.mLock) {
                        MediaSessionLegacyStub.this.mConnectingControllers.add(createControllerInfo.getId());
                    }
                    SessionCommandGroup2 onConnect = MediaSessionLegacyStub.this.mSession.getCallback().onConnect(MediaSessionLegacyStub.this.mSession.getInstance(), createControllerInfo);
                    MediaItem2 mediaItem2 = null;
                    if (onConnect != null || createControllerInfo.isTrusted()) {
                        if (MediaSessionLegacyStub.DEBUG) {
                            String str = MediaSessionLegacyStub.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("Accepting connection, controllerInfo=");
                            sb.append(createControllerInfo);
                            sb.append(" allowedCommands=");
                            sb.append(onConnect);
                            Log.d(str, sb.toString());
                        }
                        if (onConnect == null) {
                            onConnect = new SessionCommandGroup2();
                        }
                        synchronized (MediaSessionLegacyStub.this.mLock) {
                            MediaSessionLegacyStub.this.mConnectingControllers.remove(createControllerInfo.getId());
                            MediaSessionLegacyStub.this.mControllers.put(createControllerInfo.getId(), createControllerInfo);
                            MediaSessionLegacyStub.this.mAllowedCommandGroupMap.put(createControllerInfo, onConnect);
                        }
                        Bundle bundle = new Bundle();
                        bundle.putBundle("android.support.v4.media.argument.ALLOWED_COMMANDS", onConnect.toBundle());
                        bundle.putInt("android.support.v4.media.argument.PLAYER_STATE", MediaSessionLegacyStub.this.mSession.getPlayerState());
                        bundle.putInt("android.support.v4.media.argument.BUFFERING_STATE", MediaSessionLegacyStub.this.mSession.getBufferingState());
                        bundle.putParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT", MediaSessionLegacyStub.this.mSession.getPlaybackStateCompat());
                        bundle.putInt("android.support.v4.media.argument.REPEAT_MODE", MediaSessionLegacyStub.this.mSession.getRepeatMode());
                        bundle.putInt("android.support.v4.media.argument.SHUFFLE_MODE", MediaSessionLegacyStub.this.mSession.getShuffleMode());
                        List playlist = onConnect.hasCommand(18) ? MediaSessionLegacyStub.this.mSession.getPlaylist() : null;
                        if (playlist != null) {
                            bundle.putParcelableArray("android.support.v4.media.argument.PLAYLIST", MediaUtils2.convertMediaItem2ListToParcelableArray(playlist));
                        }
                        if (onConnect.hasCommand(20)) {
                            mediaItem2 = MediaSessionLegacyStub.this.mSession.getCurrentMediaItem();
                        }
                        if (mediaItem2 != null) {
                            bundle.putBundle("android.support.v4.media.argument.MEDIA_ITEM", mediaItem2.toBundle());
                        }
                        bundle.putBundle("android.support.v4.media.argument.PLAYBACK_INFO", MediaSessionLegacyStub.this.mSession.getPlaybackInfo().toBundle());
                        MediaMetadata2 playlistMetadata = MediaSessionLegacyStub.this.mSession.getPlaylistMetadata();
                        if (playlistMetadata != null) {
                            bundle.putBundle("android.support.v4.media.argument.PLAYLIST_METADATA", playlistMetadata.toBundle());
                        }
                        if (!MediaSessionLegacyStub.this.mSession.isClosed()) {
                            resultReceiver.send(0, bundle);
                        }
                    } else {
                        synchronized (MediaSessionLegacyStub.this.mLock) {
                            MediaSessionLegacyStub.this.mConnectingControllers.remove(createControllerInfo.getId());
                        }
                        if (MediaSessionLegacyStub.DEBUG) {
                            String str2 = MediaSessionLegacyStub.TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Rejecting connection, controllerInfo=");
                            sb2.append(createControllerInfo);
                            Log.d(str2, sb2.toString());
                        }
                        resultReceiver.send(-1, null);
                    }
                }
            }
        });
    }

    private ControllerInfo createControllerInfo(Bundle bundle) {
        IMediaControllerCallback asInterface = Stub.asInterface(BundleCompat.getBinder(bundle, "android.support.v4.media.argument.ICONTROLLER_CALLBACK"));
        return new ControllerInfo(bundle.getString("android.support.v4.media.argument.PACKAGE_NAME"), bundle.getInt("android.support.v4.media.argument.PID"), bundle.getInt("android.support.v4.media.argument.UID"), new ControllerLegacyCb(asInterface));
    }

    private void disconnect(Bundle bundle) {
        final ControllerInfo createControllerInfo = createControllerInfo(bundle);
        this.mSession.getCallbackExecutor().execute(new Runnable() {
            public void run() {
                if (!MediaSessionLegacyStub.this.mSession.isClosed()) {
                    MediaSessionLegacyStub.this.mSession.getCallback().onDisconnected(MediaSessionLegacyStub.this.mSession.getInstance(), createControllerInfo);
                }
            }
        });
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

    private void onCommand2(@NonNull IBinder iBinder, int i, @NonNull Session2Runnable session2Runnable) {
        onCommand2Internal(iBinder, null, i, session2Runnable);
    }

    private void onCommand2(@NonNull IBinder iBinder, @NonNull SessionCommand2 sessionCommand2, @NonNull Session2Runnable session2Runnable) {
        onCommand2Internal(iBinder, sessionCommand2, 0, session2Runnable);
    }

    private void onCommand2Internal(@NonNull IBinder iBinder, @Nullable SessionCommand2 sessionCommand2, int i, @NonNull Session2Runnable session2Runnable) {
        final ControllerInfo controllerInfo;
        synchronized (this.mLock) {
            controllerInfo = (ControllerInfo) this.mControllers.get(iBinder);
        }
        if (this.mSession != null && controllerInfo != null) {
            Executor callbackExecutor = this.mSession.getCallbackExecutor();
            final SessionCommand2 sessionCommand22 = sessionCommand2;
            final int i2 = i;
            final Session2Runnable session2Runnable2 = session2Runnable;
            AnonymousClass6 r1 = new Runnable() {
                public void run() {
                    SessionCommand2 sessionCommand2;
                    if (sessionCommand22 != null) {
                        if (MediaSessionLegacyStub.this.isAllowedCommand(controllerInfo, sessionCommand22)) {
                            sessionCommand2 = (SessionCommand2) MediaSessionLegacyStub.sCommandsForOnCommandRequest.get(sessionCommand22.getCommandCode());
                        } else {
                            return;
                        }
                    } else if (MediaSessionLegacyStub.this.isAllowedCommand(controllerInfo, i2)) {
                        sessionCommand2 = (SessionCommand2) MediaSessionLegacyStub.sCommandsForOnCommandRequest.get(i2);
                    } else {
                        return;
                    }
                    if (sessionCommand2 == null || MediaSessionLegacyStub.this.mSession.getCallback().onCommandRequest(MediaSessionLegacyStub.this.mSession.getInstance(), controllerInfo, sessionCommand2)) {
                        try {
                            session2Runnable2.run(controllerInfo);
                        } catch (RemoteException e) {
                            String str = MediaSessionLegacyStub.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("Exception in ");
                            sb.append(controllerInfo.toString());
                            Log.w(str, sb.toString(), e);
                        }
                        return;
                    }
                    if (MediaSessionLegacyStub.DEBUG) {
                        String str2 = MediaSessionLegacyStub.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Command (");
                        sb2.append(sessionCommand2);
                        sb2.append(") from ");
                        sb2.append(controllerInfo);
                        sb2.append(" was rejected by ");
                        sb2.append(MediaSessionLegacyStub.this.mSession);
                        Log.d(str2, sb2.toString());
                    }
                }
            };
            callbackExecutor.execute(r1);
        }
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

    public void onPause() {
        this.mSession.getCallbackExecutor().execute(new Runnable() {
            public void run() {
                if (!MediaSessionLegacyStub.this.mSession.isClosed()) {
                    MediaSessionLegacyStub.this.mSession.pause();
                }
            }
        });
    }

    public void onPlay() {
        this.mSession.getCallbackExecutor().execute(new Runnable() {
            public void run() {
                if (!MediaSessionLegacyStub.this.mSession.isClosed()) {
                    MediaSessionLegacyStub.this.mSession.play();
                }
            }
        });
    }

    public void onPrepare() {
        this.mSession.getCallbackExecutor().execute(new Runnable() {
            public void run() {
                if (!MediaSessionLegacyStub.this.mSession.isClosed()) {
                    MediaSessionLegacyStub.this.mSession.prepare();
                }
            }
        });
    }

    public void onSeekTo(final long j) {
        this.mSession.getCallbackExecutor().execute(new Runnable() {
            public void run() {
                if (!MediaSessionLegacyStub.this.mSession.isClosed()) {
                    MediaSessionLegacyStub.this.mSession.seekTo(j);
                }
            }
        });
    }

    public void onStop() {
        this.mSession.getCallbackExecutor().execute(new Runnable() {
            public void run() {
                if (!MediaSessionLegacyStub.this.mSession.isClosed()) {
                    MediaSessionLegacyStub.this.mSession.reset();
                }
            }
        });
    }

    /* access modifiers changed from: 0000 */
    public void removeControllerInfo(ControllerInfo controllerInfo) {
        synchronized (this.mLock) {
            ControllerInfo controllerInfo2 = (ControllerInfo) this.mControllers.remove(controllerInfo.getId());
            if (DEBUG) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("releasing ");
                sb.append(controllerInfo2);
                Log.d(str, sb.toString());
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void setAllowedCommands(ControllerInfo controllerInfo, SessionCommandGroup2 sessionCommandGroup2) {
        synchronized (this.mLock) {
            this.mAllowedCommandGroupMap.put(controllerInfo, sessionCommandGroup2);
        }
    }
}
