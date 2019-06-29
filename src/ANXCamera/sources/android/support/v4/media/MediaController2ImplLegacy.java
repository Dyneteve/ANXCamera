package android.support.v4.media;

import android.annotation.TargetApi;
import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Process;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.os.SystemClock;
import android.support.annotation.GuardedBy;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.mediacompat.Rating2;
import android.support.v4.app.BundleCompat;
import android.support.v4.media.MediaController2.ControllerCallback;
import android.support.v4.media.MediaController2.PlaybackInfo;
import android.support.v4.media.session.MediaControllerCompat;
import android.support.v4.media.session.MediaControllerCompat.Callback;
import android.support.v4.media.session.MediaSessionCompat.Token;
import android.support.v4.media.session.PlaybackStateCompat;
import android.util.Log;
import java.util.List;
import java.util.concurrent.Executor;

@TargetApi(16)
class MediaController2ImplLegacy implements SupportLibraryImpl {
    /* access modifiers changed from: private */
    public static final boolean DEBUG = Log.isLoggable(TAG, 3);
    private static final String TAG = "MC2ImplLegacy";
    static final Bundle sDefaultRootExtras = new Bundle();
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public SessionCommandGroup2 mAllowedCommands;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public MediaBrowserCompat mBrowserCompat;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public int mBufferingState;
    /* access modifiers changed from: private */
    public final ControllerCallback mCallback;
    /* access modifiers changed from: private */
    public final Executor mCallbackExecutor;
    @GuardedBy("mLock")
    private volatile boolean mConnected;
    /* access modifiers changed from: private */
    public final Context mContext;
    @GuardedBy("mLock")
    private MediaControllerCompat mControllerCompat;
    @GuardedBy("mLock")
    private ControllerCompatCallback mControllerCompatCallback;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public MediaItem2 mCurrentMediaItem;
    /* access modifiers changed from: private */
    public final Handler mHandler;
    /* access modifiers changed from: private */
    public final HandlerThread mHandlerThread;
    /* access modifiers changed from: private */
    public MediaController2 mInstance;
    @GuardedBy("mLock")
    private boolean mIsReleased;
    final Object mLock = new Object();
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public MediaMetadataCompat mMediaMetadataCompat;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public PlaybackInfo mPlaybackInfo;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public PlaybackStateCompat mPlaybackStateCompat;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public int mPlayerState;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public List<MediaItem2> mPlaylist;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public MediaMetadata2 mPlaylistMetadata;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public int mRepeatMode;
    /* access modifiers changed from: private */
    @GuardedBy("mLock")
    public int mShuffleMode;
    /* access modifiers changed from: private */
    public final SessionToken2 mToken;

    private class ConnectionCallback extends android.support.v4.media.MediaBrowserCompat.ConnectionCallback {
        private ConnectionCallback() {
        }

        public void onConnected() {
            MediaBrowserCompat browserCompat = MediaController2ImplLegacy.this.getBrowserCompat();
            if (browserCompat != null) {
                MediaController2ImplLegacy.this.connectToSession(browserCompat.getSessionToken());
            } else if (MediaController2ImplLegacy.DEBUG) {
                Log.d(MediaController2ImplLegacy.TAG, "Controller is closed prematually", new IllegalStateException());
            }
        }

        public void onConnectionFailed() {
            MediaController2ImplLegacy.this.close();
        }

        public void onConnectionSuspended() {
            MediaController2ImplLegacy.this.close();
        }
    }

    private final class ControllerCompatCallback extends Callback {
        private ControllerCompatCallback() {
        }

        public void onMetadataChanged(MediaMetadataCompat mediaMetadataCompat) {
            synchronized (MediaController2ImplLegacy.this.mLock) {
                MediaController2ImplLegacy.this.mMediaMetadataCompat = mediaMetadataCompat;
            }
        }

        public void onPlaybackStateChanged(PlaybackStateCompat playbackStateCompat) {
            synchronized (MediaController2ImplLegacy.this.mLock) {
                MediaController2ImplLegacy.this.mPlaybackStateCompat = playbackStateCompat;
            }
        }

        public void onSessionDestroyed() {
            MediaController2ImplLegacy.this.close();
        }

        public void onSessionEvent(String str, Bundle bundle) {
            if (bundle != null) {
                bundle.setClassLoader(MediaSession2.class.getClassLoader());
            }
            char c = 65535;
            switch (str.hashCode()) {
                case -2076894204:
                    if (str.equals("android.support.v4.media.session.event.ON_BUFFERING_STATE_CHANGED")) {
                        c = 13;
                        break;
                    }
                    break;
                case -2060536131:
                    if (str.equals("android.support.v4.media.session.event.ON_PLAYBACK_SPEED_CHANGED")) {
                        c = 12;
                        break;
                    }
                    break;
                case -1588811870:
                    if (str.equals("android.support.v4.media.session.event.ON_PLAYBACK_INFO_CHANGED")) {
                        c = 11;
                        break;
                    }
                    break;
                case -1471144819:
                    if (str.equals("android.support.v4.media.session.event.ON_PLAYER_STATE_CHANGED")) {
                        c = 1;
                        break;
                    }
                    break;
                case -1021916189:
                    if (str.equals("android.support.v4.media.session.event.ON_ERROR")) {
                        c = 3;
                        break;
                    }
                    break;
                case -617184370:
                    if (str.equals("android.support.v4.media.session.event.ON_CURRENT_MEDIA_ITEM_CHANGED")) {
                        c = 2;
                        break;
                    }
                    break;
                case -92092013:
                    if (str.equals("android.support.v4.media.session.event.ON_ROUTES_INFO_CHANGED")) {
                        c = 4;
                        break;
                    }
                    break;
                case -53555497:
                    if (str.equals("android.support.v4.media.session.event.ON_REPEAT_MODE_CHANGED")) {
                        c = 7;
                        break;
                    }
                    break;
                case 229988025:
                    if (str.equals("android.support.v4.media.session.event.SEND_CUSTOM_COMMAND")) {
                        c = 9;
                        break;
                    }
                    break;
                case 306321100:
                    if (str.equals("android.support.v4.media.session.event.ON_PLAYLIST_METADATA_CHANGED")) {
                        c = 6;
                        break;
                    }
                    break;
                case 408969344:
                    if (str.equals("android.support.v4.media.session.event.SET_CUSTOM_LAYOUT")) {
                        c = 10;
                        break;
                    }
                    break;
                case 806201420:
                    if (str.equals("android.support.v4.media.session.event.ON_PLAYLIST_CHANGED")) {
                        c = 5;
                        break;
                    }
                    break;
                case 896576579:
                    if (str.equals("android.support.v4.media.session.event.ON_SHUFFLE_MODE_CHANGED")) {
                        c = 8;
                        break;
                    }
                    break;
                case 1696119769:
                    if (str.equals("android.support.v4.media.session.event.ON_ALLOWED_COMMANDS_CHANGED")) {
                        c = 0;
                        break;
                    }
                    break;
                case 1871849865:
                    if (str.equals("android.support.v4.media.session.event.ON_SEEK_COMPLETED")) {
                        c = 14;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    final SessionCommandGroup2 fromBundle = SessionCommandGroup2.fromBundle(bundle.getBundle("android.support.v4.media.argument.ALLOWED_COMMANDS"));
                    synchronized (MediaController2ImplLegacy.this.mLock) {
                        MediaController2ImplLegacy.this.mAllowedCommands = fromBundle;
                    }
                    MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                        public void run() {
                            MediaController2ImplLegacy.this.mCallback.onAllowedCommandsChanged(MediaController2ImplLegacy.this.mInstance, fromBundle);
                        }
                    });
                    break;
                case 1:
                    final int i = bundle.getInt("android.support.v4.media.argument.PLAYER_STATE");
                    PlaybackStateCompat playbackStateCompat = (PlaybackStateCompat) bundle.getParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT");
                    if (playbackStateCompat != null) {
                        synchronized (MediaController2ImplLegacy.this.mLock) {
                            MediaController2ImplLegacy.this.mPlayerState = i;
                            MediaController2ImplLegacy.this.mPlaybackStateCompat = playbackStateCompat;
                        }
                        MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                            public void run() {
                                MediaController2ImplLegacy.this.mCallback.onPlayerStateChanged(MediaController2ImplLegacy.this.mInstance, i);
                            }
                        });
                        break;
                    } else {
                        return;
                    }
                case 2:
                    final MediaItem2 fromBundle2 = MediaItem2.fromBundle(bundle.getBundle("android.support.v4.media.argument.MEDIA_ITEM"));
                    synchronized (MediaController2ImplLegacy.this.mLock) {
                        MediaController2ImplLegacy.this.mCurrentMediaItem = fromBundle2;
                    }
                    MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                        public void run() {
                            MediaController2ImplLegacy.this.mCallback.onCurrentMediaItemChanged(MediaController2ImplLegacy.this.mInstance, fromBundle2);
                        }
                    });
                    break;
                case 3:
                    final int i2 = bundle.getInt("android.support.v4.media.argument.ERROR_CODE");
                    final Bundle bundle2 = bundle.getBundle("android.support.v4.media.argument.EXTRAS");
                    MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                        public void run() {
                            MediaController2ImplLegacy.this.mCallback.onError(MediaController2ImplLegacy.this.mInstance, i2, bundle2);
                        }
                    });
                    break;
                case 4:
                    final List convertToBundleList = MediaUtils2.convertToBundleList(bundle.getParcelableArray("android.support.v4.media.argument.ROUTE_BUNDLE"));
                    MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                        public void run() {
                            MediaController2ImplLegacy.this.mCallback.onRoutesInfoChanged(MediaController2ImplLegacy.this.mInstance, convertToBundleList);
                        }
                    });
                    break;
                case 5:
                    final MediaMetadata2 fromBundle3 = MediaMetadata2.fromBundle(bundle.getBundle("android.support.v4.media.argument.PLAYLIST_METADATA"));
                    final List convertToMediaItem2List = MediaUtils2.convertToMediaItem2List(bundle.getParcelableArray("android.support.v4.media.argument.PLAYLIST"));
                    synchronized (MediaController2ImplLegacy.this.mLock) {
                        MediaController2ImplLegacy.this.mPlaylist = convertToMediaItem2List;
                        MediaController2ImplLegacy.this.mPlaylistMetadata = fromBundle3;
                    }
                    MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                        public void run() {
                            MediaController2ImplLegacy.this.mCallback.onPlaylistChanged(MediaController2ImplLegacy.this.mInstance, convertToMediaItem2List, fromBundle3);
                        }
                    });
                    break;
                case 6:
                    final MediaMetadata2 fromBundle4 = MediaMetadata2.fromBundle(bundle.getBundle("android.support.v4.media.argument.PLAYLIST_METADATA"));
                    synchronized (MediaController2ImplLegacy.this.mLock) {
                        MediaController2ImplLegacy.this.mPlaylistMetadata = fromBundle4;
                    }
                    MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                        public void run() {
                            MediaController2ImplLegacy.this.mCallback.onPlaylistMetadataChanged(MediaController2ImplLegacy.this.mInstance, fromBundle4);
                        }
                    });
                    break;
                case 7:
                    final int i3 = bundle.getInt("android.support.v4.media.argument.REPEAT_MODE");
                    synchronized (MediaController2ImplLegacy.this.mLock) {
                        MediaController2ImplLegacy.this.mRepeatMode = i3;
                    }
                    MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                        public void run() {
                            MediaController2ImplLegacy.this.mCallback.onRepeatModeChanged(MediaController2ImplLegacy.this.mInstance, i3);
                        }
                    });
                    break;
                case 8:
                    final int i4 = bundle.getInt("android.support.v4.media.argument.SHUFFLE_MODE");
                    synchronized (MediaController2ImplLegacy.this.mLock) {
                        MediaController2ImplLegacy.this.mShuffleMode = i4;
                    }
                    MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                        public void run() {
                            MediaController2ImplLegacy.this.mCallback.onShuffleModeChanged(MediaController2ImplLegacy.this.mInstance, i4);
                        }
                    });
                    break;
                case 9:
                    Bundle bundle3 = bundle.getBundle("android.support.v4.media.argument.CUSTOM_COMMAND");
                    if (bundle3 != null) {
                        final SessionCommand2 fromBundle5 = SessionCommand2.fromBundle(bundle3);
                        final Bundle bundle4 = bundle.getBundle("android.support.v4.media.argument.ARGUMENTS");
                        final ResultReceiver resultReceiver = (ResultReceiver) bundle.getParcelable("android.support.v4.media.argument.RESULT_RECEIVER");
                        MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                            public void run() {
                                MediaController2ImplLegacy.this.mCallback.onCustomCommand(MediaController2ImplLegacy.this.mInstance, fromBundle5, bundle4, resultReceiver);
                            }
                        });
                        break;
                    } else {
                        return;
                    }
                case 10:
                    final List convertToCommandButtonList = MediaUtils2.convertToCommandButtonList(bundle.getParcelableArray("android.support.v4.media.argument.COMMAND_BUTTONS"));
                    if (convertToCommandButtonList != null) {
                        MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                            public void run() {
                                MediaController2ImplLegacy.this.mCallback.onCustomLayoutChanged(MediaController2ImplLegacy.this.mInstance, convertToCommandButtonList);
                            }
                        });
                        break;
                    } else {
                        return;
                    }
                case 11:
                    final PlaybackInfo fromBundle6 = PlaybackInfo.fromBundle(bundle.getBundle("android.support.v4.media.argument.PLAYBACK_INFO"));
                    if (fromBundle6 != null) {
                        synchronized (MediaController2ImplLegacy.this.mLock) {
                            MediaController2ImplLegacy.this.mPlaybackInfo = fromBundle6;
                        }
                        MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                            public void run() {
                                MediaController2ImplLegacy.this.mCallback.onPlaybackInfoChanged(MediaController2ImplLegacy.this.mInstance, fromBundle6);
                            }
                        });
                        break;
                    } else {
                        return;
                    }
                case 12:
                    final PlaybackStateCompat playbackStateCompat2 = (PlaybackStateCompat) bundle.getParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT");
                    if (playbackStateCompat2 != null) {
                        synchronized (MediaController2ImplLegacy.this.mLock) {
                            MediaController2ImplLegacy.this.mPlaybackStateCompat = playbackStateCompat2;
                        }
                        MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                            public void run() {
                                MediaController2ImplLegacy.this.mCallback.onPlaybackSpeedChanged(MediaController2ImplLegacy.this.mInstance, playbackStateCompat2.getPlaybackSpeed());
                            }
                        });
                        break;
                    } else {
                        return;
                    }
                case 13:
                    final MediaItem2 fromBundle7 = MediaItem2.fromBundle(bundle.getBundle("android.support.v4.media.argument.MEDIA_ITEM"));
                    final int i5 = bundle.getInt("android.support.v4.media.argument.BUFFERING_STATE");
                    PlaybackStateCompat playbackStateCompat3 = (PlaybackStateCompat) bundle.getParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT");
                    if (fromBundle7 != null && playbackStateCompat3 != null) {
                        synchronized (MediaController2ImplLegacy.this.mLock) {
                            MediaController2ImplLegacy.this.mBufferingState = i5;
                            MediaController2ImplLegacy.this.mPlaybackStateCompat = playbackStateCompat3;
                        }
                        MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                            public void run() {
                                MediaController2ImplLegacy.this.mCallback.onBufferingStateChanged(MediaController2ImplLegacy.this.mInstance, fromBundle7, i5);
                            }
                        });
                        break;
                    } else {
                        return;
                    }
                case 14:
                    final long j = bundle.getLong("android.support.v4.media.argument.SEEK_POSITION");
                    PlaybackStateCompat playbackStateCompat4 = (PlaybackStateCompat) bundle.getParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT");
                    if (playbackStateCompat4 != null) {
                        synchronized (MediaController2ImplLegacy.this.mLock) {
                            MediaController2ImplLegacy.this.mPlaybackStateCompat = playbackStateCompat4;
                        }
                        MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                            public void run() {
                                MediaController2ImplLegacy.this.mCallback.onSeekCompleted(MediaController2ImplLegacy.this.mInstance, j);
                            }
                        });
                        break;
                    } else {
                        return;
                    }
            }
        }

        public void onSessionReady() {
            MediaController2ImplLegacy.this.sendCommand("android.support.v4.media.controller.command.CONNECT", (ResultReceiver) new ResultReceiver(MediaController2ImplLegacy.this.mHandler) {
                /* access modifiers changed from: protected */
                public void onReceiveResult(int i, Bundle bundle) {
                    if (MediaController2ImplLegacy.this.mHandlerThread.isAlive()) {
                        switch (i) {
                            case -1:
                                MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                                    public void run() {
                                        MediaController2ImplLegacy.this.mCallback.onDisconnected(MediaController2ImplLegacy.this.mInstance);
                                    }
                                });
                                MediaController2ImplLegacy.this.close();
                                break;
                            case 0:
                                MediaController2ImplLegacy.this.onConnectedNotLocked(bundle);
                                break;
                        }
                    }
                }
            });
        }
    }

    static {
        sDefaultRootExtras.putBoolean("android.support.v4.media.root_default_root", true);
    }

    MediaController2ImplLegacy(@NonNull Context context, @NonNull MediaController2 mediaController2, @NonNull SessionToken2 sessionToken2, @NonNull Executor executor, @NonNull ControllerCallback controllerCallback) {
        this.mContext = context;
        this.mInstance = mediaController2;
        this.mHandlerThread = new HandlerThread("MediaController2_Thread");
        this.mHandlerThread.start();
        this.mHandler = new Handler(this.mHandlerThread.getLooper());
        this.mToken = sessionToken2;
        this.mCallback = controllerCallback;
        this.mCallbackExecutor = executor;
        if (this.mToken.getType() == 0) {
            synchronized (this.mLock) {
                this.mBrowserCompat = null;
            }
            connectToSession((Token) this.mToken.getBinder());
            return;
        }
        connectToService();
    }

    private void connectToService() {
        this.mCallbackExecutor.execute(new Runnable() {
            public void run() {
                synchronized (MediaController2ImplLegacy.this.mLock) {
                    MediaController2ImplLegacy.this.mBrowserCompat = new MediaBrowserCompat(MediaController2ImplLegacy.this.mContext, MediaController2ImplLegacy.this.mToken.getComponentName(), new ConnectionCallback(), MediaController2ImplLegacy.sDefaultRootExtras);
                    MediaController2ImplLegacy.this.mBrowserCompat.connect();
                }
            }
        });
    }

    /* access modifiers changed from: private */
    public void connectToSession(Token token) {
        MediaControllerCompat mediaControllerCompat;
        try {
            mediaControllerCompat = new MediaControllerCompat(this.mContext, token);
        } catch (RemoteException e) {
            e.printStackTrace();
            mediaControllerCompat = null;
        }
        synchronized (this.mLock) {
            this.mControllerCompat = mediaControllerCompat;
            this.mControllerCompatCallback = new ControllerCompatCallback();
            this.mControllerCompat.registerCallback(this.mControllerCompatCallback, this.mHandler);
        }
        if (mediaControllerCompat.isSessionReady()) {
            sendCommand("android.support.v4.media.controller.command.CONNECT", (ResultReceiver) new ResultReceiver(this.mHandler) {
                /* access modifiers changed from: protected */
                public void onReceiveResult(int i, Bundle bundle) {
                    if (MediaController2ImplLegacy.this.mHandlerThread.isAlive()) {
                        switch (i) {
                            case -1:
                                MediaController2ImplLegacy.this.mCallbackExecutor.execute(new Runnable() {
                                    public void run() {
                                        MediaController2ImplLegacy.this.mCallback.onDisconnected(MediaController2ImplLegacy.this.mInstance);
                                    }
                                });
                                MediaController2ImplLegacy.this.close();
                                break;
                            case 0:
                                MediaController2ImplLegacy.this.onConnectedNotLocked(bundle);
                                break;
                        }
                    }
                }
            });
        }
    }

    private void sendCommand(int i) {
        sendCommand(i, (Bundle) null);
    }

    private void sendCommand(int i, Bundle bundle) {
        if (bundle == null) {
            bundle = new Bundle();
        }
        bundle.putInt("android.support.v4.media.argument.COMMAND_CODE", i);
        sendCommand("android.support.v4.media.controller.command.BY_COMMAND_CODE", bundle, null);
    }

    private void sendCommand(String str) {
        sendCommand(str, null, null);
    }

    private void sendCommand(String str, Bundle bundle, ResultReceiver resultReceiver) {
        MediaControllerCompat mediaControllerCompat;
        ControllerCompatCallback controllerCompatCallback;
        if (bundle == null) {
            bundle = new Bundle();
        }
        synchronized (this.mLock) {
            mediaControllerCompat = this.mControllerCompat;
            controllerCompatCallback = this.mControllerCompatCallback;
        }
        BundleCompat.putBinder(bundle, "android.support.v4.media.argument.ICONTROLLER_CALLBACK", controllerCompatCallback.getIControllerCallback().asBinder());
        bundle.putString("android.support.v4.media.argument.PACKAGE_NAME", this.mContext.getPackageName());
        bundle.putInt("android.support.v4.media.argument.UID", Process.myUid());
        bundle.putInt("android.support.v4.media.argument.PID", Process.myPid());
        mediaControllerCompat.sendCommand(str, bundle, resultReceiver);
    }

    /* access modifiers changed from: private */
    public void sendCommand(String str, ResultReceiver resultReceiver) {
        sendCommand(str, null, resultReceiver);
    }

    public void addPlaylistItem(int i, @NonNull MediaItem2 mediaItem2) {
        Bundle bundle = new Bundle();
        bundle.putInt("android.support.v4.media.argument.PLAYLIST_INDEX", i);
        bundle.putBundle("android.support.v4.media.argument.MEDIA_ITEM", mediaItem2.toBundle());
        sendCommand(15, bundle);
    }

    public void adjustVolume(int i, int i2) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle = new Bundle();
            bundle.putInt("android.support.v4.media.argument.VOLUME_DIRECTION", i);
            bundle.putInt("android.support.v4.media.argument.VOLUME_FLAGS", i2);
            sendCommand(11, bundle);
        }
    }

    public void close() {
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("release from ");
            sb.append(this.mToken);
            Log.d(str, sb.toString());
        }
        synchronized (this.mLock) {
            if (!this.mIsReleased) {
                this.mHandler.removeCallbacksAndMessages(null);
                if (VERSION.SDK_INT >= 18) {
                    this.mHandlerThread.quitSafely();
                } else {
                    this.mHandlerThread.quit();
                }
                this.mIsReleased = true;
                sendCommand("android.support.v4.media.controller.command.DISCONNECT");
                if (this.mControllerCompat != null) {
                    this.mControllerCompat.unregisterCallback(this.mControllerCompatCallback);
                }
                if (this.mBrowserCompat != null) {
                    this.mBrowserCompat.disconnect();
                    this.mBrowserCompat = null;
                }
                if (this.mControllerCompat != null) {
                    this.mControllerCompat.unregisterCallback(this.mControllerCompatCallback);
                    this.mControllerCompat = null;
                }
                this.mConnected = false;
                this.mCallbackExecutor.execute(new Runnable() {
                    public void run() {
                        MediaController2ImplLegacy.this.mCallback.onDisconnected(MediaController2ImplLegacy.this.mInstance);
                    }
                });
            }
        }
    }

    public void fastForward() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(7);
            }
        }
    }

    @Nullable
    public MediaBrowserCompat getBrowserCompat() {
        MediaBrowserCompat mediaBrowserCompat;
        synchronized (this.mLock) {
            mediaBrowserCompat = this.mBrowserCompat;
        }
        return mediaBrowserCompat;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0023, code lost:
        return r2;
     */
    public long getBufferedPosition() {
        synchronized (this.mLock) {
            long j = -1;
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return -1;
            } else if (this.mPlaybackStateCompat != null) {
                j = this.mPlaybackStateCompat.getBufferedPosition();
            }
        }
    }

    public int getBufferingState() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return 0;
            }
            int i = this.mBufferingState;
            return i;
        }
    }

    @NonNull
    public ControllerCallback getCallback() {
        return this.mCallback;
    }

    @NonNull
    public Executor getCallbackExecutor() {
        return this.mCallbackExecutor;
    }

    @NonNull
    public Context getContext() {
        return this.mContext;
    }

    public MediaItem2 getCurrentMediaItem() {
        MediaItem2 mediaItem2;
        synchronized (this.mLock) {
            mediaItem2 = this.mCurrentMediaItem;
        }
        return mediaItem2;
    }

    public long getCurrentPosition() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return -1;
            } else if (this.mPlaybackStateCompat == null) {
                return -1;
            } else {
                long max = Math.max(0, this.mPlaybackStateCompat.getPosition() + ((long) (this.mPlaybackStateCompat.getPlaybackSpeed() * ((float) (this.mInstance.mTimeDiff != null ? this.mInstance.mTimeDiff.longValue() : SystemClock.elapsedRealtime() - this.mPlaybackStateCompat.getLastPositionUpdateTime())))));
                return max;
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x001e, code lost:
        return -1;
     */
    public long getDuration() {
        synchronized (this.mLock) {
            if (this.mMediaMetadataCompat != null && this.mMediaMetadataCompat.containsKey("android.media.metadata.DURATION")) {
                long j = this.mMediaMetadataCompat.getLong("android.media.metadata.DURATION");
                return j;
            }
        }
    }

    @NonNull
    public MediaController2 getInstance() {
        return this.mInstance;
    }

    @Nullable
    public PlaybackInfo getPlaybackInfo() {
        PlaybackInfo playbackInfo;
        synchronized (this.mLock) {
            playbackInfo = this.mPlaybackInfo;
        }
        return playbackInfo;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0022, code lost:
        return r2;
     */
    public float getPlaybackSpeed() {
        synchronized (this.mLock) {
            float f = 0.0f;
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return 0.0f;
            } else if (this.mPlaybackStateCompat != null) {
                f = this.mPlaybackStateCompat.getPlaybackSpeed();
            }
        }
    }

    public int getPlayerState() {
        int i;
        synchronized (this.mLock) {
            i = this.mPlayerState;
        }
        return i;
    }

    @Nullable
    public List<MediaItem2> getPlaylist() {
        List<MediaItem2> list;
        synchronized (this.mLock) {
            list = this.mPlaylist;
        }
        return list;
    }

    @Nullable
    public MediaMetadata2 getPlaylistMetadata() {
        MediaMetadata2 mediaMetadata2;
        synchronized (this.mLock) {
            mediaMetadata2 = this.mPlaylistMetadata;
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

    @Nullable
    public PendingIntent getSessionActivity() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return null;
            }
            PendingIntent sessionActivity = this.mControllerCompat.getSessionActivity();
            return sessionActivity;
        }
    }

    @NonNull
    public SessionToken2 getSessionToken() {
        return this.mToken;
    }

    public int getShuffleMode() {
        int i;
        synchronized (this.mLock) {
            i = this.mShuffleMode;
        }
        return i;
    }

    public boolean isConnected() {
        boolean z;
        synchronized (this.mLock) {
            z = this.mConnected;
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public void onConnectedNotLocked(Bundle bundle) {
        bundle.setClassLoader(MediaSession2.class.getClassLoader());
        final SessionCommandGroup2 fromBundle = SessionCommandGroup2.fromBundle(bundle.getBundle("android.support.v4.media.argument.ALLOWED_COMMANDS"));
        int i = bundle.getInt("android.support.v4.media.argument.PLAYER_STATE");
        MediaItem2 fromBundle2 = MediaItem2.fromBundle(bundle.getBundle("android.support.v4.media.argument.MEDIA_ITEM"));
        int i2 = bundle.getInt("android.support.v4.media.argument.BUFFERING_STATE");
        PlaybackStateCompat playbackStateCompat = (PlaybackStateCompat) bundle.getParcelable("android.support.v4.media.argument.PLAYBACK_STATE_COMPAT");
        int i3 = bundle.getInt("android.support.v4.media.argument.REPEAT_MODE");
        int i4 = bundle.getInt("android.support.v4.media.argument.SHUFFLE_MODE");
        List<MediaItem2> convertToMediaItem2List = MediaUtils2.convertToMediaItem2List(bundle.getParcelableArray("android.support.v4.media.argument.PLAYLIST"));
        PlaybackInfo fromBundle3 = PlaybackInfo.fromBundle(bundle.getBundle("android.support.v4.media.argument.PLAYBACK_INFO"));
        MediaMetadata2 fromBundle4 = MediaMetadata2.fromBundle(bundle.getBundle("android.support.v4.media.argument.PLAYLIST_METADATA"));
        if (DEBUG) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onConnectedNotLocked token=");
            sb.append(this.mToken);
            sb.append(", allowedCommands=");
            sb.append(fromBundle);
            Log.d(str, sb.toString());
        }
        boolean z = false;
        try {
            synchronized (this.mLock) {
                try {
                    if (!this.mIsReleased) {
                        if (this.mConnected) {
                            Log.e(TAG, "Cannot be notified about the connection result many times. Probably a bug or malicious app.");
                            try {
                                close();
                            } catch (Throwable th) {
                                th = th;
                                z = true;
                                throw th;
                            }
                        } else {
                            this.mAllowedCommands = fromBundle;
                            this.mPlayerState = i;
                            this.mCurrentMediaItem = fromBundle2;
                            this.mBufferingState = i2;
                            this.mPlaybackStateCompat = playbackStateCompat;
                            this.mRepeatMode = i3;
                            this.mShuffleMode = i4;
                            this.mPlaylist = convertToMediaItem2List;
                            this.mPlaylistMetadata = fromBundle4;
                            this.mConnected = true;
                            this.mPlaybackInfo = fromBundle3;
                            this.mCallbackExecutor.execute(new Runnable() {
                                public void run() {
                                    MediaController2ImplLegacy.this.mCallback.onConnected(MediaController2ImplLegacy.this.mInstance, fromBundle);
                                }
                            });
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            }
        } catch (Throwable th3) {
            if (z) {
                close();
            }
            throw th3;
        }
    }

    public void pause() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(2);
            }
        }
    }

    public void play() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(1);
            }
        }
    }

    public void playFromMediaId(@NonNull String str, @Nullable Bundle bundle) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle2 = new Bundle();
            bundle2.putString("android.support.v4.media.argument.MEDIA_ID", str);
            bundle2.putBundle("android.support.v4.media.argument.EXTRAS", bundle);
            sendCommand(22, bundle2);
        }
    }

    public void playFromSearch(@NonNull String str, @Nullable Bundle bundle) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle2 = new Bundle();
            bundle2.putString("android.support.v4.media.argument.QUERY", str);
            bundle2.putBundle("android.support.v4.media.argument.EXTRAS", bundle);
            sendCommand(24, bundle2);
        }
    }

    public void playFromUri(@NonNull Uri uri, @Nullable Bundle bundle) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle2 = new Bundle();
            bundle2.putParcelable("android.support.v4.media.argument.URI", uri);
            bundle2.putBundle("android.support.v4.media.argument.EXTRAS", bundle);
            sendCommand(23, bundle2);
        }
    }

    public void prepare() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(6);
            }
        }
    }

    public void prepareFromMediaId(@NonNull String str, @Nullable Bundle bundle) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle2 = new Bundle();
            bundle2.putString("android.support.v4.media.argument.MEDIA_ID", str);
            bundle2.putBundle("android.support.v4.media.argument.EXTRAS", bundle);
            sendCommand(25, bundle2);
        }
    }

    public void prepareFromSearch(@NonNull String str, @Nullable Bundle bundle) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle2 = new Bundle();
            bundle2.putString("android.support.v4.media.argument.QUERY", str);
            bundle2.putBundle("android.support.v4.media.argument.EXTRAS", bundle);
            sendCommand(27, bundle2);
        }
    }

    public void prepareFromUri(@NonNull Uri uri, @Nullable Bundle bundle) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle2 = new Bundle();
            bundle2.putParcelable("android.support.v4.media.argument.URI", uri);
            bundle2.putBundle("android.support.v4.media.argument.EXTRAS", bundle);
            sendCommand(26, bundle2);
        }
    }

    public void removePlaylistItem(@NonNull MediaItem2 mediaItem2) {
        Bundle bundle = new Bundle();
        bundle.putBundle("android.support.v4.media.argument.MEDIA_ITEM", mediaItem2.toBundle());
        sendCommand(16, bundle);
    }

    public void replacePlaylistItem(int i, @NonNull MediaItem2 mediaItem2) {
        Bundle bundle = new Bundle();
        bundle.putInt("android.support.v4.media.argument.PLAYLIST_INDEX", i);
        bundle.putBundle("android.support.v4.media.argument.MEDIA_ITEM", mediaItem2.toBundle());
        sendCommand(17, bundle);
    }

    public void reset() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(3);
            }
        }
    }

    public void rewind() {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
            } else {
                sendCommand(8);
            }
        }
    }

    public void seekTo(long j) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle = new Bundle();
            bundle.putLong("android.support.v4.media.argument.SEEK_POSITION", j);
            sendCommand(9, bundle);
        }
    }

    public void selectRoute(@NonNull Bundle bundle) {
        Bundle bundle2 = new Bundle();
        bundle2.putBundle("android.support.v4.media.argument.ROUTE_BUNDLE", bundle);
        sendCommand(38, bundle2);
    }

    public void sendCustomCommand(@NonNull SessionCommand2 sessionCommand2, @Nullable Bundle bundle, @Nullable ResultReceiver resultReceiver) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle2 = new Bundle();
            bundle2.putBundle("android.support.v4.media.argument.CUSTOM_COMMAND", sessionCommand2.toBundle());
            bundle2.putBundle("android.support.v4.media.argument.ARGUMENTS", bundle);
            sendCommand("android.support.v4.media.controller.command.BY_CUSTOM_COMMAND", bundle2, resultReceiver);
        }
    }

    public void setPlaybackSpeed(float f) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle = new Bundle();
            bundle.putFloat("android.support.v4.media.argument.PLAYBACK_SPEED", f);
            sendCommand(39, bundle);
        }
    }

    public void setPlaylist(@NonNull List<MediaItem2> list, @Nullable MediaMetadata2 mediaMetadata2) {
        Bundle bundle = new Bundle();
        bundle.putParcelableArray("android.support.v4.media.argument.PLAYLIST", MediaUtils2.convertMediaItem2ListToParcelableArray(list));
        bundle.putBundle("android.support.v4.media.argument.PLAYLIST_METADATA", mediaMetadata2 == null ? null : mediaMetadata2.toBundle());
        sendCommand(19, bundle);
    }

    public void setRating(@NonNull String str, @NonNull Rating2 rating2) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle = new Bundle();
            bundle.putString("android.support.v4.media.argument.MEDIA_ID", str);
            bundle.putBundle("android.support.v4.media.argument.RATING", rating2.toBundle());
            sendCommand(28, bundle);
        }
    }

    public void setRepeatMode(int i) {
        Bundle bundle = new Bundle();
        bundle.putInt("android.support.v4.media.argument.REPEAT_MODE", i);
        sendCommand(14, bundle);
    }

    public void setShuffleMode(int i) {
        Bundle bundle = new Bundle();
        bundle.putInt("android.support.v4.media.argument.SHUFFLE_MODE", i);
        sendCommand(13, bundle);
    }

    public void setVolumeTo(int i, int i2) {
        synchronized (this.mLock) {
            if (!this.mConnected) {
                Log.w(TAG, "Session isn't active", new IllegalStateException());
                return;
            }
            Bundle bundle = new Bundle();
            bundle.putInt("android.support.v4.media.argument.VOLUME", i);
            bundle.putInt("android.support.v4.media.argument.VOLUME_FLAGS", i2);
            sendCommand(10, bundle);
        }
    }

    public void skipBackward() {
    }

    public void skipForward() {
    }

    public void skipToNextItem() {
        sendCommand(4);
    }

    public void skipToPlaylistItem(@NonNull MediaItem2 mediaItem2) {
        Bundle bundle = new Bundle();
        bundle.putBundle("android.support.v4.media.argument.MEDIA_ITEM", mediaItem2.toBundle());
        sendCommand(12, bundle);
    }

    public void skipToPreviousItem() {
        sendCommand(5);
    }

    public void subscribeRoutesInfo() {
        sendCommand(36);
    }

    public void unsubscribeRoutesInfo() {
        sendCommand(37);
    }

    public void updatePlaylistMetadata(@Nullable MediaMetadata2 mediaMetadata2) {
        Bundle bundle = new Bundle();
        bundle.putBundle("android.support.v4.media.argument.PLAYLIST_METADATA", mediaMetadata2 == null ? null : mediaMetadata2.toBundle());
        sendCommand(21, bundle);
    }
}
