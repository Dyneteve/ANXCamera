package android.support.v4.media.session;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.RemoteCallbackList;
import android.os.RemoteException;
import android.os.ResultReceiver;
import android.support.v4.media.MediaDescriptionCompat;
import android.support.v4.media.MediaMetadataCompat;
import android.support.v4.media.RatingCompat;
import android.support.v4.media.VolumeProviderCompat;
import android.support.v4.media.session.IMediaSession.Stub;
import android.text.TextUtils;
import android.view.KeyEvent;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MediaSessionCompat {
    public static final int FLAG_HANDLES_MEDIA_BUTTONS = 1;
    public static final int FLAG_HANDLES_TRANSPORT_CONTROLS = 2;
    private final ArrayList<OnActiveChangeListener> mActiveListeners = new ArrayList<>();
    private final MediaControllerCompat mController;
    private final MediaSessionImpl mImpl;

    public static abstract class Callback {
        final Object mCallbackObj;

        private class StubApi21 implements android.support.v4.media.session.MediaSessionCompatApi21.Callback {
            private StubApi21() {
            }

            public void onCommand(String str, Bundle bundle, ResultReceiver resultReceiver) {
                Callback.this.onCommand(str, bundle, resultReceiver);
            }

            public void onCustomAction(String str, Bundle bundle) {
                Callback.this.onCustomAction(str, bundle);
            }

            public void onFastForward() {
                Callback.this.onFastForward();
            }

            public boolean onMediaButtonEvent(Intent intent) {
                return Callback.this.onMediaButtonEvent(intent);
            }

            public void onPause() {
                Callback.this.onPause();
            }

            public void onPlay() {
                Callback.this.onPlay();
            }

            public void onPlayFromMediaId(String str, Bundle bundle) {
                Callback.this.onPlayFromMediaId(str, bundle);
            }

            public void onPlayFromSearch(String str, Bundle bundle) {
                Callback.this.onPlayFromSearch(str, bundle);
            }

            public void onRewind() {
                Callback.this.onRewind();
            }

            public void onSeekTo(long j) {
                Callback.this.onSeekTo(j);
            }

            public void onSetRating(Object obj) {
                Callback.this.onSetRating(RatingCompat.fromRating(obj));
            }

            public void onSkipToNext() {
                Callback.this.onSkipToNext();
            }

            public void onSkipToPrevious() {
                Callback.this.onSkipToPrevious();
            }

            public void onSkipToQueueItem(long j) {
                Callback.this.onSkipToQueueItem(j);
            }

            public void onStop() {
                Callback.this.onStop();
            }
        }

        private class StubApi23 extends StubApi21 implements android.support.v4.media.session.MediaSessionCompatApi23.Callback {
            private StubApi23() {
                super();
            }

            public void onPlayFromUri(Uri uri, Bundle bundle) {
                Callback.this.onPlayFromUri(uri, bundle);
            }
        }

        public Callback() {
            if (VERSION.SDK_INT >= 23) {
                this.mCallbackObj = MediaSessionCompatApi23.createCallback(new StubApi23());
            } else if (VERSION.SDK_INT >= 21) {
                this.mCallbackObj = MediaSessionCompatApi21.createCallback(new StubApi21());
            } else {
                this.mCallbackObj = null;
            }
        }

        public void onCommand(String str, Bundle bundle, ResultReceiver resultReceiver) {
        }

        public void onCustomAction(String str, Bundle bundle) {
        }

        public void onFastForward() {
        }

        public boolean onMediaButtonEvent(Intent intent) {
            return false;
        }

        public void onPause() {
        }

        public void onPlay() {
        }

        public void onPlayFromMediaId(String str, Bundle bundle) {
        }

        public void onPlayFromSearch(String str, Bundle bundle) {
        }

        public void onPlayFromUri(Uri uri, Bundle bundle) {
        }

        public void onRewind() {
        }

        public void onSeekTo(long j) {
        }

        public void onSetRating(RatingCompat ratingCompat) {
        }

        public void onSkipToNext() {
        }

        public void onSkipToPrevious() {
        }

        public void onSkipToQueueItem(long j) {
        }

        public void onStop() {
        }
    }

    interface MediaSessionImpl {
        Object getMediaSession();

        Object getRemoteControlClient();

        Token getSessionToken();

        boolean isActive();

        void release();

        void sendSessionEvent(String str, Bundle bundle);

        void setActive(boolean z);

        void setCallback(Callback callback, Handler handler);

        void setExtras(Bundle bundle);

        void setFlags(int i);

        void setMediaButtonReceiver(PendingIntent pendingIntent);

        void setMetadata(MediaMetadataCompat mediaMetadataCompat);

        void setPlaybackState(PlaybackStateCompat playbackStateCompat);

        void setPlaybackToLocal(int i);

        void setPlaybackToRemote(VolumeProviderCompat volumeProviderCompat);

        void setQueue(List<QueueItem> list);

        void setQueueTitle(CharSequence charSequence);

        void setRatingType(int i);

        void setSessionActivity(PendingIntent pendingIntent);
    }

    static class MediaSessionImplApi21 implements MediaSessionImpl {
        private PendingIntent mMediaButtonIntent;
        private final Object mSessionObj;
        private final Token mToken = new Token(MediaSessionCompatApi21.getSessionToken(this.mSessionObj));

        public MediaSessionImplApi21(Context context, String str) {
            this.mSessionObj = MediaSessionCompatApi21.createSession(context, str);
        }

        public MediaSessionImplApi21(Object obj) {
            this.mSessionObj = MediaSessionCompatApi21.verifySession(obj);
        }

        public Object getMediaSession() {
            return this.mSessionObj;
        }

        public Object getRemoteControlClient() {
            return null;
        }

        public Token getSessionToken() {
            return this.mToken;
        }

        public boolean isActive() {
            return MediaSessionCompatApi21.isActive(this.mSessionObj);
        }

        public void release() {
            MediaSessionCompatApi21.release(this.mSessionObj);
        }

        public void sendSessionEvent(String str, Bundle bundle) {
            MediaSessionCompatApi21.sendSessionEvent(this.mSessionObj, str, bundle);
        }

        public void setActive(boolean z) {
            MediaSessionCompatApi21.setActive(this.mSessionObj, z);
        }

        public void setCallback(Callback callback, Handler handler) {
            MediaSessionCompatApi21.setCallback(this.mSessionObj, callback.mCallbackObj, handler);
        }

        public void setExtras(Bundle bundle) {
            MediaSessionCompatApi21.setExtras(this.mSessionObj, bundle);
        }

        public void setFlags(int i) {
            MediaSessionCompatApi21.setFlags(this.mSessionObj, i);
        }

        public void setMediaButtonReceiver(PendingIntent pendingIntent) {
            this.mMediaButtonIntent = pendingIntent;
            MediaSessionCompatApi21.setMediaButtonReceiver(this.mSessionObj, pendingIntent);
        }

        public void setMetadata(MediaMetadataCompat mediaMetadataCompat) {
            MediaSessionCompatApi21.setMetadata(this.mSessionObj, mediaMetadataCompat.getMediaMetadata());
        }

        public void setPlaybackState(PlaybackStateCompat playbackStateCompat) {
            MediaSessionCompatApi21.setPlaybackState(this.mSessionObj, playbackStateCompat.getPlaybackState());
        }

        public void setPlaybackToLocal(int i) {
            MediaSessionCompatApi21.setPlaybackToLocal(this.mSessionObj, i);
        }

        public void setPlaybackToRemote(VolumeProviderCompat volumeProviderCompat) {
            MediaSessionCompatApi21.setPlaybackToRemote(this.mSessionObj, volumeProviderCompat.getVolumeProvider());
        }

        public void setQueue(List<QueueItem> list) {
            List list2 = null;
            if (list != null) {
                list2 = new ArrayList();
                for (QueueItem queueItem : list) {
                    list2.add(queueItem.getQueueItem());
                }
            }
            MediaSessionCompatApi21.setQueue(this.mSessionObj, list2);
        }

        public void setQueueTitle(CharSequence charSequence) {
            MediaSessionCompatApi21.setQueueTitle(this.mSessionObj, charSequence);
        }

        public void setRatingType(int i) {
            if (VERSION.SDK_INT >= 22) {
                MediaSessionCompatApi22.setRatingType(this.mSessionObj, i);
            }
        }

        public void setSessionActivity(PendingIntent pendingIntent) {
            MediaSessionCompatApi21.setSessionActivity(this.mSessionObj, pendingIntent);
        }
    }

    static class MediaSessionImplBase implements MediaSessionImpl {
        /* access modifiers changed from: private */
        public final AudioManager mAudioManager;
        /* access modifiers changed from: private */
        public Callback mCallback;
        private final ComponentName mComponentName;
        private final Context mContext;
        /* access modifiers changed from: private */
        public final RemoteCallbackList<IMediaControllerCallback> mControllerCallbacks = new RemoteCallbackList<>();
        /* access modifiers changed from: private */
        public boolean mDestroyed = false;
        /* access modifiers changed from: private */
        public Bundle mExtras;
        /* access modifiers changed from: private */
        public int mFlags;
        /* access modifiers changed from: private */
        public final MessageHandler mHandler;
        private boolean mIsActive = false;
        private boolean mIsMbrRegistered = false;
        private boolean mIsRccRegistered = false;
        /* access modifiers changed from: private */
        public int mLocalStream;
        /* access modifiers changed from: private */
        public final Object mLock = new Object();
        private final PendingIntent mMediaButtonEventReceiver;
        /* access modifiers changed from: private */
        public MediaMetadataCompat mMetadata;
        /* access modifiers changed from: private */
        public final String mPackageName;
        /* access modifiers changed from: private */
        public List<QueueItem> mQueue;
        /* access modifiers changed from: private */
        public CharSequence mQueueTitle;
        /* access modifiers changed from: private */
        public int mRatingType;
        private final Object mRccObj;
        /* access modifiers changed from: private */
        public PendingIntent mSessionActivity;
        /* access modifiers changed from: private */
        public PlaybackStateCompat mState;
        private final MediaSessionStub mStub;
        /* access modifiers changed from: private */
        public final String mTag;
        private final Token mToken;
        private android.support.v4.media.VolumeProviderCompat.Callback mVolumeCallback = new android.support.v4.media.VolumeProviderCompat.Callback() {
            public void onVolumeChanged(VolumeProviderCompat volumeProviderCompat) {
                if (MediaSessionImplBase.this.mVolumeProvider == volumeProviderCompat) {
                    ParcelableVolumeInfo parcelableVolumeInfo = new ParcelableVolumeInfo(MediaSessionImplBase.this.mVolumeType, MediaSessionImplBase.this.mLocalStream, volumeProviderCompat.getVolumeControl(), volumeProviderCompat.getMaxVolume(), volumeProviderCompat.getCurrentVolume());
                    MediaSessionImplBase.this.sendVolumeInfoChanged(parcelableVolumeInfo);
                }
            }
        };
        /* access modifiers changed from: private */
        public VolumeProviderCompat mVolumeProvider;
        /* access modifiers changed from: private */
        public int mVolumeType;

        private static final class Command {
            public final String command;
            public final Bundle extras;
            public final ResultReceiver stub;

            public Command(String str, Bundle bundle, ResultReceiver resultReceiver) {
                this.command = str;
                this.extras = bundle;
                this.stub = resultReceiver;
            }
        }

        class MediaSessionStub extends Stub {
            MediaSessionStub() {
            }

            public void adjustVolume(int i, int i2, String str) {
                MediaSessionImplBase.this.adjustVolume(i, i2);
            }

            public void fastForward() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(9);
            }

            public Bundle getExtras() {
                Bundle access$2300;
                synchronized (MediaSessionImplBase.this.mLock) {
                    access$2300 = MediaSessionImplBase.this.mExtras;
                }
                return access$2300;
            }

            public long getFlags() {
                long access$900;
                synchronized (MediaSessionImplBase.this.mLock) {
                    access$900 = (long) MediaSessionImplBase.this.mFlags;
                }
                return access$900;
            }

            public PendingIntent getLaunchPendingIntent() {
                PendingIntent access$1500;
                synchronized (MediaSessionImplBase.this.mLock) {
                    access$1500 = MediaSessionImplBase.this.mSessionActivity;
                }
                return access$1500;
            }

            public MediaMetadataCompat getMetadata() {
                return MediaSessionImplBase.this.mMetadata;
            }

            public String getPackageName() {
                return MediaSessionImplBase.this.mPackageName;
            }

            public PlaybackStateCompat getPlaybackState() {
                return MediaSessionImplBase.this.getStateWithUpdatedPosition();
            }

            public List<QueueItem> getQueue() {
                List<QueueItem> access$2100;
                synchronized (MediaSessionImplBase.this.mLock) {
                    access$2100 = MediaSessionImplBase.this.mQueue;
                }
                return access$2100;
            }

            public CharSequence getQueueTitle() {
                return MediaSessionImplBase.this.mQueueTitle;
            }

            public int getRatingType() {
                return MediaSessionImplBase.this.mRatingType;
            }

            public String getTag() {
                return MediaSessionImplBase.this.mTag;
            }

            public ParcelableVolumeInfo getVolumeAttributes() {
                boolean z;
                int access$500;
                int i;
                int i2;
                int i3;
                int i4;
                synchronized (MediaSessionImplBase.this.mLock) {
                    try {
                        int access$400 = MediaSessionImplBase.this.mVolumeType;
                        try {
                            access$500 = MediaSessionImplBase.this.mLocalStream;
                        } catch (Throwable th) {
                            th = th;
                            z = false;
                            boolean z2 = z;
                            while (true) {
                                try {
                                    break;
                                } catch (Throwable th2) {
                                    th = th2;
                                }
                            }
                            throw th;
                        }
                        try {
                            VolumeProviderCompat access$300 = MediaSessionImplBase.this.mVolumeProvider;
                            if (access$400 == 2) {
                                i = access$300.getVolumeControl();
                                try {
                                    try {
                                        i3 = access$300.getCurrentVolume();
                                        i4 = i;
                                        i2 = access$300.getMaxVolume();
                                    } catch (Throwable th3) {
                                        th = th3;
                                        int i5 = i;
                                        while (true) {
                                            break;
                                        }
                                        throw th;
                                    }
                                } catch (Throwable th4) {
                                    th = th4;
                                    int i52 = i;
                                    while (true) {
                                        break;
                                    }
                                    throw th;
                                }
                            } else {
                                i = 2;
                                i4 = 2;
                                i2 = MediaSessionImplBase.this.mAudioManager.getStreamMaxVolume(access$500);
                                i3 = MediaSessionImplBase.this.mAudioManager.getStreamVolume(access$500);
                            }
                            try {
                                ParcelableVolumeInfo parcelableVolumeInfo = new ParcelableVolumeInfo(access$400, access$500, i4, i2, i3);
                                return parcelableVolumeInfo;
                            } catch (Throwable th5) {
                                th = th5;
                                int i6 = i2;
                                while (true) {
                                    break;
                                }
                                throw th;
                            }
                        } catch (Throwable th6) {
                            th = th6;
                            while (true) {
                                break;
                            }
                            throw th;
                        }
                    } catch (Throwable th7) {
                        th = th7;
                        z = false;
                        boolean z22 = z;
                        while (true) {
                            break;
                        }
                        throw th;
                    }
                }
            }

            public boolean isTransportControlEnabled() {
                return (MediaSessionImplBase.this.mFlags & 2) != 0;
            }

            public void next() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(7);
            }

            public void pause() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(5);
            }

            public void play() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(1);
            }

            public void playFromMediaId(String str, Bundle bundle) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(2, (Object) str, bundle);
            }

            public void playFromSearch(String str, Bundle bundle) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(3, (Object) str, bundle);
            }

            public void playFromUri(Uri uri, Bundle bundle) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(18, (Object) uri, bundle);
            }

            public void previous() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(8);
            }

            public void rate(RatingCompat ratingCompat) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(12, ratingCompat);
            }

            public void registerCallbackListener(IMediaControllerCallback iMediaControllerCallback) {
                if (MediaSessionImplBase.this.mDestroyed) {
                    try {
                        iMediaControllerCallback.onSessionDestroyed();
                    } catch (Exception e) {
                    }
                } else {
                    MediaSessionImplBase.this.mControllerCallbacks.register(iMediaControllerCallback);
                }
            }

            public void rewind() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(10);
            }

            public void seekTo(long j) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(11, Long.valueOf(j));
            }

            public void sendCommand(String str, Bundle bundle, ResultReceiverWrapper resultReceiverWrapper) {
                MediaSessionImplBase.this.mHandler.post(15, new Command(str, bundle, resultReceiverWrapper.mResultReceiver));
            }

            public void sendCustomAction(String str, Bundle bundle) throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(13, (Object) str, bundle);
            }

            public boolean sendMediaButton(KeyEvent keyEvent) {
                boolean z = true;
                if ((MediaSessionImplBase.this.mFlags & 1) == 0) {
                    z = false;
                }
                boolean z2 = z;
                if (z2) {
                    MediaSessionImplBase.this.mHandler.post(14, keyEvent);
                }
                return z2;
            }

            public void setVolumeTo(int i, int i2, String str) {
                MediaSessionImplBase.this.setVolumeTo(i, i2);
            }

            public void skipToQueueItem(long j) {
                MediaSessionImplBase.this.mHandler.post(4, Long.valueOf(j));
            }

            public void stop() throws RemoteException {
                MediaSessionImplBase.this.mHandler.post(6);
            }

            public void unregisterCallbackListener(IMediaControllerCallback iMediaControllerCallback) {
                MediaSessionImplBase.this.mControllerCallbacks.unregister(iMediaControllerCallback);
            }
        }

        private class MessageHandler extends Handler {
            private static final int KEYCODE_MEDIA_PAUSE = 127;
            private static final int KEYCODE_MEDIA_PLAY = 126;
            private static final int MSG_ADJUST_VOLUME = 16;
            private static final int MSG_COMMAND = 15;
            private static final int MSG_CUSTOM_ACTION = 13;
            private static final int MSG_FAST_FORWARD = 9;
            private static final int MSG_MEDIA_BUTTON = 14;
            private static final int MSG_NEXT = 7;
            private static final int MSG_PAUSE = 5;
            private static final int MSG_PLAY = 1;
            private static final int MSG_PLAY_MEDIA_ID = 2;
            private static final int MSG_PLAY_SEARCH = 3;
            private static final int MSG_PLAY_URI = 18;
            private static final int MSG_PREVIOUS = 8;
            private static final int MSG_RATE = 12;
            private static final int MSG_REWIND = 10;
            private static final int MSG_SEEK_TO = 11;
            private static final int MSG_SET_VOLUME = 17;
            private static final int MSG_SKIP_TO_ITEM = 4;
            private static final int MSG_STOP = 6;

            public MessageHandler(Looper looper) {
                super(looper);
            }

            private void onMediaButtonEvent(KeyEvent keyEvent) {
                if (keyEvent != null && keyEvent.getAction() == 0) {
                    long actions = MediaSessionImplBase.this.mState == null ? 0 : MediaSessionImplBase.this.mState.getActions();
                    int keyCode = keyEvent.getKeyCode();
                    if (keyCode != 79) {
                        switch (keyCode) {
                            case 85:
                                break;
                            case 86:
                                if ((1 & actions) != 0) {
                                    MediaSessionImplBase.this.mCallback.onStop();
                                    break;
                                }
                                break;
                            case 87:
                                if ((32 & actions) != 0) {
                                    MediaSessionImplBase.this.mCallback.onSkipToNext();
                                    break;
                                }
                                break;
                            case 88:
                                if ((16 & actions) != 0) {
                                    MediaSessionImplBase.this.mCallback.onSkipToPrevious();
                                    break;
                                }
                                break;
                            case 89:
                                if ((8 & actions) != 0) {
                                    MediaSessionImplBase.this.mCallback.onRewind();
                                    break;
                                }
                                break;
                            case 90:
                                if ((64 & actions) != 0) {
                                    MediaSessionImplBase.this.mCallback.onFastForward();
                                    break;
                                }
                                break;
                            default:
                                switch (keyCode) {
                                    case 126:
                                        if ((4 & actions) != 0) {
                                            MediaSessionImplBase.this.mCallback.onPlay();
                                            break;
                                        }
                                        break;
                                    case 127:
                                        if ((2 & actions) != 0) {
                                            MediaSessionImplBase.this.mCallback.onPause();
                                            break;
                                        }
                                        break;
                                }
                        }
                    }
                    boolean z = false;
                    boolean z2 = MediaSessionImplBase.this.mState != null && MediaSessionImplBase.this.mState.getState() == 3;
                    boolean z3 = (516 & actions) != 0;
                    if ((514 & actions) != 0) {
                        z = true;
                    }
                    boolean z4 = z;
                    if (!z2 || !z4) {
                        if (!z2 && z3) {
                            MediaSessionImplBase.this.mCallback.onPlay();
                        }
                    }
                    MediaSessionImplBase.this.mCallback.onPause();
                }
            }

            public void handleMessage(Message message) {
                if (MediaSessionImplBase.this.mCallback != null) {
                    switch (message.what) {
                        case 1:
                            MediaSessionImplBase.this.mCallback.onPlay();
                            break;
                        case 2:
                            MediaSessionImplBase.this.mCallback.onPlayFromMediaId((String) message.obj, message.getData());
                            break;
                        case 3:
                            MediaSessionImplBase.this.mCallback.onPlayFromSearch((String) message.obj, message.getData());
                            break;
                        case 4:
                            MediaSessionImplBase.this.mCallback.onSkipToQueueItem(((Long) message.obj).longValue());
                            break;
                        case 5:
                            MediaSessionImplBase.this.mCallback.onPause();
                            break;
                        case 6:
                            MediaSessionImplBase.this.mCallback.onStop();
                            break;
                        case 7:
                            MediaSessionImplBase.this.mCallback.onSkipToNext();
                            break;
                        case 8:
                            MediaSessionImplBase.this.mCallback.onSkipToPrevious();
                            break;
                        case 9:
                            MediaSessionImplBase.this.mCallback.onFastForward();
                            break;
                        case 10:
                            MediaSessionImplBase.this.mCallback.onRewind();
                            break;
                        case 11:
                            MediaSessionImplBase.this.mCallback.onSeekTo(((Long) message.obj).longValue());
                            break;
                        case 12:
                            MediaSessionImplBase.this.mCallback.onSetRating((RatingCompat) message.obj);
                            break;
                        case 13:
                            MediaSessionImplBase.this.mCallback.onCustomAction((String) message.obj, message.getData());
                            break;
                        case 14:
                            KeyEvent keyEvent = (KeyEvent) message.obj;
                            Intent intent = new Intent("android.intent.action.MEDIA_BUTTON");
                            intent.putExtra("android.intent.extra.KEY_EVENT", keyEvent);
                            if (!MediaSessionImplBase.this.mCallback.onMediaButtonEvent(intent)) {
                                onMediaButtonEvent(keyEvent);
                                break;
                            }
                            break;
                        case 15:
                            Command command = (Command) message.obj;
                            MediaSessionImplBase.this.mCallback.onCommand(command.command, command.extras, command.stub);
                            break;
                        case 16:
                            MediaSessionImplBase.this.adjustVolume(((Integer) message.obj).intValue(), 0);
                            break;
                        case 17:
                            MediaSessionImplBase.this.setVolumeTo(((Integer) message.obj).intValue(), 0);
                            break;
                        case 18:
                            MediaSessionImplBase.this.mCallback.onPlayFromUri((Uri) message.obj, message.getData());
                            break;
                    }
                }
            }

            public void post(int i) {
                post(i, null);
            }

            public void post(int i, Object obj) {
                obtainMessage(i, obj).sendToTarget();
            }

            public void post(int i, Object obj, int i2) {
                obtainMessage(i, i2, 0, obj).sendToTarget();
            }

            public void post(int i, Object obj, Bundle bundle) {
                Message obtainMessage = obtainMessage(i, obj);
                obtainMessage.setData(bundle);
                obtainMessage.sendToTarget();
            }
        }

        public MediaSessionImplBase(Context context, String str, ComponentName componentName, PendingIntent pendingIntent) {
            if (componentName != null) {
                this.mContext = context;
                this.mPackageName = context.getPackageName();
                this.mAudioManager = (AudioManager) context.getSystemService("audio");
                this.mTag = str;
                this.mComponentName = componentName;
                this.mMediaButtonEventReceiver = pendingIntent;
                this.mStub = new MediaSessionStub();
                this.mToken = new Token(this.mStub);
                this.mHandler = new MessageHandler(Looper.myLooper());
                this.mRatingType = 0;
                this.mVolumeType = 1;
                this.mLocalStream = 3;
                if (VERSION.SDK_INT >= 14) {
                    this.mRccObj = MediaSessionCompatApi14.createRemoteControlClient(pendingIntent);
                } else {
                    this.mRccObj = null;
                }
            } else {
                throw new IllegalArgumentException("MediaButtonReceiver component may not be null.");
            }
        }

        /* access modifiers changed from: private */
        public void adjustVolume(int i, int i2) {
            if (this.mVolumeType != 2) {
                this.mAudioManager.adjustStreamVolume(i, this.mLocalStream, i2);
            } else if (this.mVolumeProvider != null) {
                this.mVolumeProvider.onAdjustVolume(i);
            }
        }

        /* access modifiers changed from: private */
        /* JADX WARNING: Code restructure failed: missing block: B:12:0x0022, code lost:
            r0 = null;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:13:0x0023, code lost:
            if (r5 == null) goto L_0x0083;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:15:0x002a, code lost:
            if (r5.getState() == 3) goto L_0x003a;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:17:0x0031, code lost:
            if (r5.getState() == 4) goto L_0x003a;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:19:0x0038, code lost:
            if (r5.getState() != 5) goto L_0x0083;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:20:0x003a, code lost:
            r6 = r5.getLastPositionUpdateTime();
            r15 = android.os.SystemClock.elapsedRealtime();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:21:0x0046, code lost:
            if (r6 <= 0) goto L_0x0083;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:22:0x0048, code lost:
            r10 = ((long) (r5.getPlaybackSpeed() * ((float) (r15 - r6)))) + r5.getPosition();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:23:0x0058, code lost:
            if (r2 < 0) goto L_0x0062;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:25:0x005c, code lost:
            if (r10 <= r2) goto L_0x0062;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:26:0x005e, code lost:
            r8 = r2;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:27:0x005f, code lost:
            r17 = r8;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:29:0x0064, code lost:
            if (r10 >= 0) goto L_0x0069;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:30:0x0066, code lost:
            r8 = 0;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:31:0x0069, code lost:
            r17 = r10;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:32:0x006b, code lost:
            r4 = new android.support.v4.media.session.PlaybackStateCompat.Builder(r5);
            r4.setState(r5.getState(), r17, r5.getPlaybackSpeed(), r15);
            r0 = r4.build();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:33:0x0083, code lost:
            if (r0 != null) goto L_0x0087;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:42:?, code lost:
            return r0;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:43:?, code lost:
            return r5;
         */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public PlaybackStateCompat getStateWithUpdatedPosition() {
            long j = -1;
            synchronized (this.mLock) {
                try {
                    PlaybackStateCompat playbackStateCompat = this.mState;
                    try {
                        if (this.mMetadata != null && this.mMetadata.containsKey(MediaMetadataCompat.METADATA_KEY_DURATION)) {
                            j = this.mMetadata.getLong(MediaMetadataCompat.METADATA_KEY_DURATION);
                        }
                    } catch (Throwable th) {
                        th = th;
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            }
        }

        private void sendEvent(String str, Bundle bundle) {
            for (int beginBroadcast = this.mControllerCallbacks.beginBroadcast() - 1; beginBroadcast >= 0; beginBroadcast--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(beginBroadcast)).onEvent(str, bundle);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }

        private void sendMetadata(MediaMetadataCompat mediaMetadataCompat) {
            for (int beginBroadcast = this.mControllerCallbacks.beginBroadcast() - 1; beginBroadcast >= 0; beginBroadcast--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(beginBroadcast)).onMetadataChanged(mediaMetadataCompat);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }

        private void sendQueue(List<QueueItem> list) {
            for (int beginBroadcast = this.mControllerCallbacks.beginBroadcast() - 1; beginBroadcast >= 0; beginBroadcast--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(beginBroadcast)).onQueueChanged(list);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }

        private void sendQueueTitle(CharSequence charSequence) {
            for (int beginBroadcast = this.mControllerCallbacks.beginBroadcast() - 1; beginBroadcast >= 0; beginBroadcast--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(beginBroadcast)).onQueueTitleChanged(charSequence);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }

        private void sendSessionDestroyed() {
            for (int beginBroadcast = this.mControllerCallbacks.beginBroadcast() - 1; beginBroadcast >= 0; beginBroadcast--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(beginBroadcast)).onSessionDestroyed();
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
            this.mControllerCallbacks.kill();
        }

        private void sendState(PlaybackStateCompat playbackStateCompat) {
            for (int beginBroadcast = this.mControllerCallbacks.beginBroadcast() - 1; beginBroadcast >= 0; beginBroadcast--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(beginBroadcast)).onPlaybackStateChanged(playbackStateCompat);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }

        /* access modifiers changed from: private */
        public void sendVolumeInfoChanged(ParcelableVolumeInfo parcelableVolumeInfo) {
            for (int beginBroadcast = this.mControllerCallbacks.beginBroadcast() - 1; beginBroadcast >= 0; beginBroadcast--) {
                try {
                    ((IMediaControllerCallback) this.mControllerCallbacks.getBroadcastItem(beginBroadcast)).onVolumeInfoChanged(parcelableVolumeInfo);
                } catch (RemoteException e) {
                }
            }
            this.mControllerCallbacks.finishBroadcast();
        }

        /* access modifiers changed from: private */
        public void setVolumeTo(int i, int i2) {
            if (this.mVolumeType != 2) {
                this.mAudioManager.setStreamVolume(this.mLocalStream, i, i2);
            } else if (this.mVolumeProvider != null) {
                this.mVolumeProvider.onSetVolumeTo(i);
            }
        }

        private boolean update() {
            if (this.mIsActive) {
                if (VERSION.SDK_INT >= 8) {
                    if (!this.mIsMbrRegistered && (this.mFlags & 1) != 0) {
                        if (VERSION.SDK_INT >= 18) {
                            MediaSessionCompatApi18.registerMediaButtonEventReceiver(this.mContext, this.mMediaButtonEventReceiver);
                        } else {
                            MediaSessionCompatApi8.registerMediaButtonEventReceiver(this.mContext, this.mComponentName);
                        }
                        this.mIsMbrRegistered = true;
                    } else if (this.mIsMbrRegistered && (this.mFlags & 1) == 0) {
                        if (VERSION.SDK_INT >= 18) {
                            MediaSessionCompatApi18.unregisterMediaButtonEventReceiver(this.mContext, this.mMediaButtonEventReceiver);
                        } else {
                            MediaSessionCompatApi8.unregisterMediaButtonEventReceiver(this.mContext, this.mComponentName);
                        }
                        this.mIsMbrRegistered = false;
                    }
                }
                if (VERSION.SDK_INT < 14) {
                    return false;
                }
                if (!this.mIsRccRegistered && (this.mFlags & 2) != 0) {
                    MediaSessionCompatApi14.registerRemoteControlClient(this.mContext, this.mRccObj);
                    this.mIsRccRegistered = true;
                    return true;
                } else if (!this.mIsRccRegistered || (this.mFlags & 2) != 0) {
                    return false;
                } else {
                    MediaSessionCompatApi14.setState(this.mRccObj, 0);
                    MediaSessionCompatApi14.unregisterRemoteControlClient(this.mContext, this.mRccObj);
                    this.mIsRccRegistered = false;
                    return false;
                }
            } else {
                if (this.mIsMbrRegistered) {
                    if (VERSION.SDK_INT >= 18) {
                        MediaSessionCompatApi18.unregisterMediaButtonEventReceiver(this.mContext, this.mMediaButtonEventReceiver);
                    } else {
                        MediaSessionCompatApi8.unregisterMediaButtonEventReceiver(this.mContext, this.mComponentName);
                    }
                    this.mIsMbrRegistered = false;
                }
                if (!this.mIsRccRegistered) {
                    return false;
                }
                MediaSessionCompatApi14.setState(this.mRccObj, 0);
                MediaSessionCompatApi14.unregisterRemoteControlClient(this.mContext, this.mRccObj);
                this.mIsRccRegistered = false;
                return false;
            }
        }

        public Object getMediaSession() {
            return null;
        }

        public Object getRemoteControlClient() {
            return this.mRccObj;
        }

        public Token getSessionToken() {
            return this.mToken;
        }

        public boolean isActive() {
            return this.mIsActive;
        }

        public void release() {
            this.mIsActive = false;
            this.mDestroyed = true;
            update();
            sendSessionDestroyed();
        }

        public void sendSessionEvent(String str, Bundle bundle) {
            sendEvent(str, bundle);
        }

        public void setActive(boolean z) {
            if (z != this.mIsActive) {
                this.mIsActive = z;
                if (update()) {
                    setMetadata(this.mMetadata);
                    setPlaybackState(this.mState);
                }
            }
        }

        public void setCallback(final Callback callback, Handler handler) {
            if (callback != this.mCallback) {
                if (callback == null || VERSION.SDK_INT < 18) {
                    if (VERSION.SDK_INT >= 18) {
                        MediaSessionCompatApi18.setOnPlaybackPositionUpdateListener(this.mRccObj, null);
                    }
                    if (VERSION.SDK_INT >= 19) {
                        MediaSessionCompatApi19.setOnMetadataUpdateListener(this.mRccObj, null);
                    }
                } else {
                    if (handler == null) {
                        new Handler();
                    }
                    AnonymousClass2 r2 = new android.support.v4.media.session.MediaSessionCompatApi14.Callback() {
                        public void onCommand(String str, Bundle bundle, ResultReceiver resultReceiver) {
                            callback.onCommand(str, bundle, resultReceiver);
                        }

                        public void onFastForward() {
                            callback.onFastForward();
                        }

                        public boolean onMediaButtonEvent(Intent intent) {
                            return callback.onMediaButtonEvent(intent);
                        }

                        public void onPause() {
                            callback.onPause();
                        }

                        public void onPlay() {
                            callback.onPlay();
                        }

                        public void onRewind() {
                            callback.onRewind();
                        }

                        public void onSeekTo(long j) {
                            callback.onSeekTo(j);
                        }

                        public void onSetRating(Object obj) {
                            callback.onSetRating(RatingCompat.fromRating(obj));
                        }

                        public void onSkipToNext() {
                            callback.onSkipToNext();
                        }

                        public void onSkipToPrevious() {
                            callback.onSkipToPrevious();
                        }

                        public void onStop() {
                            callback.onStop();
                        }
                    };
                    if (VERSION.SDK_INT >= 18) {
                        MediaSessionCompatApi18.setOnPlaybackPositionUpdateListener(this.mRccObj, MediaSessionCompatApi18.createPlaybackPositionUpdateListener(r2));
                    }
                    if (VERSION.SDK_INT >= 19) {
                        MediaSessionCompatApi19.setOnMetadataUpdateListener(this.mRccObj, MediaSessionCompatApi19.createMetadataUpdateListener(r2));
                    }
                }
                this.mCallback = callback;
            }
        }

        public void setExtras(Bundle bundle) {
            this.mExtras = bundle;
        }

        public void setFlags(int i) {
            synchronized (this.mLock) {
                this.mFlags = i;
            }
            update();
        }

        public void setMediaButtonReceiver(PendingIntent pendingIntent) {
        }

        public void setMetadata(MediaMetadataCompat mediaMetadataCompat) {
            synchronized (this.mLock) {
                this.mMetadata = mediaMetadataCompat;
            }
            sendMetadata(mediaMetadataCompat);
            if (this.mIsActive) {
                Bundle bundle = null;
                if (VERSION.SDK_INT >= 19) {
                    Object obj = this.mRccObj;
                    if (mediaMetadataCompat != null) {
                        bundle = mediaMetadataCompat.getBundle();
                    }
                    MediaSessionCompatApi19.setMetadata(obj, bundle, this.mState == null ? 0 : this.mState.getActions());
                } else if (VERSION.SDK_INT >= 14) {
                    Object obj2 = this.mRccObj;
                    if (mediaMetadataCompat != null) {
                        bundle = mediaMetadataCompat.getBundle();
                    }
                    MediaSessionCompatApi14.setMetadata(obj2, bundle);
                }
            }
        }

        public void setPlaybackState(PlaybackStateCompat playbackStateCompat) {
            synchronized (this.mLock) {
                this.mState = playbackStateCompat;
            }
            sendState(playbackStateCompat);
            if (this.mIsActive) {
                if (playbackStateCompat != null) {
                    if (VERSION.SDK_INT >= 18) {
                        MediaSessionCompatApi18.setState(this.mRccObj, playbackStateCompat.getState(), playbackStateCompat.getPosition(), playbackStateCompat.getPlaybackSpeed(), playbackStateCompat.getLastPositionUpdateTime());
                    } else if (VERSION.SDK_INT >= 14) {
                        MediaSessionCompatApi14.setState(this.mRccObj, playbackStateCompat.getState());
                    }
                    if (VERSION.SDK_INT >= 19) {
                        MediaSessionCompatApi19.setTransportControlFlags(this.mRccObj, playbackStateCompat.getActions());
                    } else if (VERSION.SDK_INT >= 18) {
                        MediaSessionCompatApi18.setTransportControlFlags(this.mRccObj, playbackStateCompat.getActions());
                    } else if (VERSION.SDK_INT >= 14) {
                        MediaSessionCompatApi14.setTransportControlFlags(this.mRccObj, playbackStateCompat.getActions());
                    }
                } else if (VERSION.SDK_INT >= 14) {
                    MediaSessionCompatApi14.setState(this.mRccObj, 0);
                    MediaSessionCompatApi14.setTransportControlFlags(this.mRccObj, 0);
                }
            }
        }

        public void setPlaybackToLocal(int i) {
            if (this.mVolumeProvider != null) {
                this.mVolumeProvider.setCallback(null);
            }
            this.mVolumeType = 1;
            ParcelableVolumeInfo parcelableVolumeInfo = new ParcelableVolumeInfo(this.mVolumeType, this.mLocalStream, 2, this.mAudioManager.getStreamMaxVolume(this.mLocalStream), this.mAudioManager.getStreamVolume(this.mLocalStream));
            sendVolumeInfoChanged(parcelableVolumeInfo);
        }

        public void setPlaybackToRemote(VolumeProviderCompat volumeProviderCompat) {
            if (volumeProviderCompat != null) {
                if (this.mVolumeProvider != null) {
                    this.mVolumeProvider.setCallback(null);
                }
                this.mVolumeType = 2;
                this.mVolumeProvider = volumeProviderCompat;
                ParcelableVolumeInfo parcelableVolumeInfo = new ParcelableVolumeInfo(this.mVolumeType, this.mLocalStream, this.mVolumeProvider.getVolumeControl(), this.mVolumeProvider.getMaxVolume(), this.mVolumeProvider.getCurrentVolume());
                sendVolumeInfoChanged(parcelableVolumeInfo);
                volumeProviderCompat.setCallback(this.mVolumeCallback);
                return;
            }
            throw new IllegalArgumentException("volumeProvider may not be null");
        }

        public void setQueue(List<QueueItem> list) {
            this.mQueue = list;
            sendQueue(list);
        }

        public void setQueueTitle(CharSequence charSequence) {
            this.mQueueTitle = charSequence;
            sendQueueTitle(charSequence);
        }

        public void setRatingType(int i) {
            this.mRatingType = i;
        }

        public void setSessionActivity(PendingIntent pendingIntent) {
            synchronized (this.mLock) {
                this.mSessionActivity = pendingIntent;
            }
        }
    }

    public interface OnActiveChangeListener {
        void onActiveChanged();
    }

    public static final class QueueItem implements Parcelable {
        public static final Creator<QueueItem> CREATOR = new Creator<QueueItem>() {
            public QueueItem createFromParcel(Parcel parcel) {
                return new QueueItem(parcel);
            }

            public QueueItem[] newArray(int i) {
                return new QueueItem[i];
            }
        };
        public static final int UNKNOWN_ID = -1;
        private final MediaDescriptionCompat mDescription;
        private final long mId;
        private Object mItem;

        private QueueItem(Parcel parcel) {
            this.mDescription = (MediaDescriptionCompat) MediaDescriptionCompat.CREATOR.createFromParcel(parcel);
            this.mId = parcel.readLong();
        }

        public QueueItem(MediaDescriptionCompat mediaDescriptionCompat, long j) {
            this(null, mediaDescriptionCompat, j);
        }

        private QueueItem(Object obj, MediaDescriptionCompat mediaDescriptionCompat, long j) {
            if (mediaDescriptionCompat == null) {
                throw new IllegalArgumentException("Description cannot be null.");
            } else if (j != -1) {
                this.mDescription = mediaDescriptionCompat;
                this.mId = j;
                this.mItem = obj;
            } else {
                throw new IllegalArgumentException("Id cannot be QueueItem.UNKNOWN_ID");
            }
        }

        public static QueueItem obtain(Object obj) {
            return new QueueItem(obj, MediaDescriptionCompat.fromMediaDescription(QueueItem.getDescription(obj)), QueueItem.getQueueId(obj));
        }

        public int describeContents() {
            return 0;
        }

        public MediaDescriptionCompat getDescription() {
            return this.mDescription;
        }

        public long getQueueId() {
            return this.mId;
        }

        public Object getQueueItem() {
            if (this.mItem != null || VERSION.SDK_INT < 21) {
                return this.mItem;
            }
            this.mItem = QueueItem.createItem(this.mDescription.getMediaDescription(), this.mId);
            return this.mItem;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("MediaSession.QueueItem {Description=");
            sb.append(this.mDescription);
            sb.append(", Id=");
            sb.append(this.mId);
            sb.append(" }");
            return sb.toString();
        }

        public void writeToParcel(Parcel parcel, int i) {
            this.mDescription.writeToParcel(parcel, i);
            parcel.writeLong(this.mId);
        }
    }

    static final class ResultReceiverWrapper implements Parcelable {
        public static final Creator<ResultReceiverWrapper> CREATOR = new Creator<ResultReceiverWrapper>() {
            public ResultReceiverWrapper createFromParcel(Parcel parcel) {
                return new ResultReceiverWrapper(parcel);
            }

            public ResultReceiverWrapper[] newArray(int i) {
                return new ResultReceiverWrapper[i];
            }
        };
        /* access modifiers changed from: private */
        public ResultReceiver mResultReceiver;

        ResultReceiverWrapper(Parcel parcel) {
            this.mResultReceiver = (ResultReceiver) ResultReceiver.CREATOR.createFromParcel(parcel);
        }

        public ResultReceiverWrapper(ResultReceiver resultReceiver) {
            this.mResultReceiver = resultReceiver;
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            this.mResultReceiver.writeToParcel(parcel, i);
        }
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface SessionFlags {
    }

    public static final class Token implements Parcelable {
        public static final Creator<Token> CREATOR = new Creator<Token>() {
            public Token createFromParcel(Parcel parcel) {
                return new Token(VERSION.SDK_INT >= 21 ? parcel.readParcelable(null) : parcel.readStrongBinder());
            }

            public Token[] newArray(int i) {
                return new Token[i];
            }
        };
        private final Object mInner;

        Token(Object obj) {
            this.mInner = obj;
        }

        public static Token fromToken(Object obj) {
            if (obj == null || VERSION.SDK_INT < 21) {
                return null;
            }
            return new Token(MediaSessionCompatApi21.verifyToken(obj));
        }

        public int describeContents() {
            return 0;
        }

        public Object getToken() {
            return this.mInner;
        }

        public void writeToParcel(Parcel parcel, int i) {
            if (VERSION.SDK_INT >= 21) {
                parcel.writeParcelable((Parcelable) this.mInner, i);
            } else {
                parcel.writeStrongBinder((IBinder) this.mInner);
            }
        }
    }

    private MediaSessionCompat(Context context, MediaSessionImpl mediaSessionImpl) {
        this.mImpl = mediaSessionImpl;
        this.mController = new MediaControllerCompat(context, this);
    }

    public MediaSessionCompat(Context context, String str, ComponentName componentName, PendingIntent pendingIntent) {
        if (context == null) {
            throw new IllegalArgumentException("context must not be null");
        } else if (!TextUtils.isEmpty(str)) {
            if (componentName != null && pendingIntent == null) {
                Intent intent = new Intent("android.intent.action.MEDIA_BUTTON");
                intent.setComponent(componentName);
                pendingIntent = PendingIntent.getBroadcast(context, 0, intent, 0);
            }
            if (VERSION.SDK_INT >= 21) {
                this.mImpl = new MediaSessionImplApi21(context, str);
                this.mImpl.setMediaButtonReceiver(pendingIntent);
            } else {
                this.mImpl = new MediaSessionImplBase(context, str, componentName, pendingIntent);
            }
            this.mController = new MediaControllerCompat(context, this);
        } else {
            throw new IllegalArgumentException("tag must not be null or empty");
        }
    }

    public static MediaSessionCompat obtain(Context context, Object obj) {
        return new MediaSessionCompat(context, new MediaSessionImplApi21(obj));
    }

    public void addOnActiveChangeListener(OnActiveChangeListener onActiveChangeListener) {
        if (onActiveChangeListener != null) {
            this.mActiveListeners.add(onActiveChangeListener);
            return;
        }
        throw new IllegalArgumentException("Listener may not be null");
    }

    public MediaControllerCompat getController() {
        return this.mController;
    }

    public Object getMediaSession() {
        return this.mImpl.getMediaSession();
    }

    public Object getRemoteControlClient() {
        return this.mImpl.getRemoteControlClient();
    }

    public Token getSessionToken() {
        return this.mImpl.getSessionToken();
    }

    public boolean isActive() {
        return this.mImpl.isActive();
    }

    public void release() {
        this.mImpl.release();
    }

    public void removeOnActiveChangeListener(OnActiveChangeListener onActiveChangeListener) {
        if (onActiveChangeListener != null) {
            this.mActiveListeners.remove(onActiveChangeListener);
            return;
        }
        throw new IllegalArgumentException("Listener may not be null");
    }

    public void sendSessionEvent(String str, Bundle bundle) {
        if (!TextUtils.isEmpty(str)) {
            this.mImpl.sendSessionEvent(str, bundle);
            return;
        }
        throw new IllegalArgumentException("event cannot be null or empty");
    }

    public void setActive(boolean z) {
        this.mImpl.setActive(z);
        Iterator it = this.mActiveListeners.iterator();
        while (it.hasNext()) {
            ((OnActiveChangeListener) it.next()).onActiveChanged();
        }
    }

    public void setCallback(Callback callback) {
        setCallback(callback, null);
    }

    public void setCallback(Callback callback, Handler handler) {
        this.mImpl.setCallback(callback, handler != null ? handler : new Handler());
    }

    public void setExtras(Bundle bundle) {
        this.mImpl.setExtras(bundle);
    }

    public void setFlags(int i) {
        this.mImpl.setFlags(i);
    }

    public void setMediaButtonReceiver(PendingIntent pendingIntent) {
        this.mImpl.setMediaButtonReceiver(pendingIntent);
    }

    public void setMetadata(MediaMetadataCompat mediaMetadataCompat) {
        this.mImpl.setMetadata(mediaMetadataCompat);
    }

    public void setPlaybackState(PlaybackStateCompat playbackStateCompat) {
        this.mImpl.setPlaybackState(playbackStateCompat);
    }

    public void setPlaybackToLocal(int i) {
        this.mImpl.setPlaybackToLocal(i);
    }

    public void setPlaybackToRemote(VolumeProviderCompat volumeProviderCompat) {
        if (volumeProviderCompat != null) {
            this.mImpl.setPlaybackToRemote(volumeProviderCompat);
            return;
        }
        throw new IllegalArgumentException("volumeProvider may not be null!");
    }

    public void setQueue(List<QueueItem> list) {
        this.mImpl.setQueue(list);
    }

    public void setQueueTitle(CharSequence charSequence) {
        this.mImpl.setQueueTitle(charSequence);
    }

    public void setRatingType(int i) {
        this.mImpl.setRatingType(i);
    }

    public void setSessionActivity(PendingIntent pendingIntent) {
        this.mImpl.setSessionActivity(pendingIntent);
    }
}
