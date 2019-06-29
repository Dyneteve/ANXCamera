package android.support.v4.media;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.media.AudioManager;
import android.media.AudioManager.OnAudioFocusChangeListener;
import android.support.annotation.GuardedBy;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.annotation.VisibleForTesting;
import android.support.v4.util.ObjectsCompat;
import android.util.Log;

@VisibleForTesting(otherwise = 3)
@RestrictTo({Scope.LIBRARY})
public class AudioFocusHandler {
    private static final boolean DEBUG = false;
    private static final String TAG = "AudioFocusHandler";
    private final AudioFocusHandlerImpl mImpl;

    interface AudioFocusHandlerImpl {
        void close();

        boolean onPauseRequested();

        boolean onPlayRequested();

        void onPlayerStateChanged(int i);

        void sendIntent(Intent intent);
    }

    private static class AudioFocusHandlerImplBase implements AudioFocusHandlerImpl {
        private static final float VOLUME_DUCK_FACTOR = 0.2f;
        /* access modifiers changed from: private */
        @GuardedBy("mLock")
        public AudioAttributesCompat mAudioAttributes;
        private final OnAudioFocusChangeListener mAudioFocusListener = new AudioFocusListener();
        private final AudioManager mAudioManager;
        private final BroadcastReceiver mBecomingNoisyIntentReceiver = new NoisyIntentReceiver();
        @GuardedBy("mLock")
        private boolean mHasAudioFocus;
        /* access modifiers changed from: private */
        @GuardedBy("mLock")
        public boolean mHasRegisteredReceiver;
        private final IntentFilter mIntentFilter = new IntentFilter("android.media.AUDIO_BECOMING_NOISY");
        /* access modifiers changed from: private */
        public final Object mLock = new Object();
        /* access modifiers changed from: private */
        @GuardedBy("mLock")
        public boolean mResumeWhenAudioFocusGain;
        /* access modifiers changed from: private */
        public final MediaSession2 mSession;

        private class AudioFocusListener implements OnAudioFocusChangeListener {
            private float mPlayerDuckingVolume;
            private float mPlayerVolumeBeforeDucking;

            private AudioFocusListener() {
            }

            /* JADX WARNING: Code restructure failed: missing block: B:92:?, code lost:
                return;
             */
            public void onAudioFocusChange(int i) {
                if (i != 1) {
                    switch (i) {
                        case -3:
                            synchronized (AudioFocusHandlerImplBase.this.mLock) {
                                if (AudioFocusHandlerImplBase.this.mAudioAttributes != null) {
                                    if (AudioFocusHandlerImplBase.this.mAudioAttributes.getContentType() != 1) {
                                        BaseMediaPlayer player = AudioFocusHandlerImplBase.this.mSession.getPlayer();
                                        if (player != null) {
                                            float playerVolume = player.getPlayerVolume();
                                            float f = AudioFocusHandlerImplBase.VOLUME_DUCK_FACTOR * playerVolume;
                                            synchronized (AudioFocusHandlerImplBase.this.mLock) {
                                                this.mPlayerVolumeBeforeDucking = playerVolume;
                                                this.mPlayerDuckingVolume = f;
                                            }
                                            player.setPlayerVolume(f);
                                            break;
                                        }
                                    } else {
                                        AudioFocusHandlerImplBase.this.mSession.pause();
                                        break;
                                    }
                                } else {
                                    return;
                                }
                            }
                            break;
                        case -2:
                            AudioFocusHandlerImplBase.this.mSession.pause();
                            synchronized (AudioFocusHandlerImplBase.this.mLock) {
                                AudioFocusHandlerImplBase.this.mResumeWhenAudioFocusGain = true;
                            }
                            return;
                        case -1:
                            AudioFocusHandlerImplBase.this.mSession.pause();
                            synchronized (AudioFocusHandlerImplBase.this.mLock) {
                                AudioFocusHandlerImplBase.this.mResumeWhenAudioFocusGain = false;
                            }
                            return;
                        default:
                            return;
                    }
                } else if (AudioFocusHandlerImplBase.this.mSession.getPlayerState() == 1) {
                    synchronized (AudioFocusHandlerImplBase.this.mLock) {
                        if (AudioFocusHandlerImplBase.this.mResumeWhenAudioFocusGain) {
                            AudioFocusHandlerImplBase.this.mSession.play();
                        }
                    }
                } else {
                    BaseMediaPlayer player2 = AudioFocusHandlerImplBase.this.mSession.getPlayer();
                    if (player2 != null) {
                        float playerVolume2 = player2.getPlayerVolume();
                        synchronized (AudioFocusHandlerImplBase.this.mLock) {
                            if (playerVolume2 == this.mPlayerDuckingVolume) {
                                float f2 = this.mPlayerVolumeBeforeDucking;
                                player2.setPlayerVolume(f2);
                            }
                        }
                    }
                }
            }
        }

        private class NoisyIntentReceiver extends BroadcastReceiver {
            private NoisyIntentReceiver() {
            }

            /* JADX WARNING: Code restructure failed: missing block: B:10:0x001e, code lost:
                r2 = android.support.v4.media.AudioFocusHandler.AudioFocusHandlerImplBase.access$200(r1.this$0);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:11:0x0024, code lost:
                monitor-enter(r2);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:14:0x002b, code lost:
                if (android.support.v4.media.AudioFocusHandler.AudioFocusHandlerImplBase.access$400(r1.this$0) != null) goto L_0x002f;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:15:0x002d, code lost:
                monitor-exit(r2);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:16:0x002e, code lost:
                return;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:17:0x002f, code lost:
                r3 = android.support.v4.media.AudioFocusHandler.AudioFocusHandlerImplBase.access$400(r1.this$0).getUsage();
             */
            /* JADX WARNING: Code restructure failed: missing block: B:18:0x0039, code lost:
                monitor-exit(r2);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:20:0x003b, code lost:
                if (r3 == 1) goto L_0x005a;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:22:0x003f, code lost:
                if (r3 == 14) goto L_0x0042;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:23:0x0042, code lost:
                r2 = android.support.v4.media.AudioFocusHandler.AudioFocusHandlerImplBase.access$500(r1.this$0).getPlayer();
             */
            /* JADX WARNING: Code restructure failed: missing block: B:24:0x004c, code lost:
                if (r2 == null) goto L_0x0067;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:25:0x004e, code lost:
                r2.setPlayerVolume(r2.getPlayerVolume() * android.support.v4.media.AudioFocusHandler.AudioFocusHandlerImplBase.VOLUME_DUCK_FACTOR);
             */
            /* JADX WARNING: Code restructure failed: missing block: B:26:0x005a, code lost:
                android.support.v4.media.AudioFocusHandler.AudioFocusHandlerImplBase.access$500(r1.this$0).pause();
             */
            /* JADX WARNING: Code restructure failed: missing block: B:31:0x0067, code lost:
                return;
             */
            /* JADX WARNING: Code restructure failed: missing block: B:9:0x001c, code lost:
                if ("android.media.AUDIO_BECOMING_NOISY".equals(r3.getAction()) == false) goto L_0x0067;
             */
            public void onReceive(Context context, Intent intent) {
                synchronized (AudioFocusHandlerImplBase.this.mLock) {
                    if (!AudioFocusHandlerImplBase.this.mHasRegisteredReceiver) {
                    }
                }
            }
        }

        AudioFocusHandlerImplBase(Context context, MediaSession2 mediaSession2) {
            this.mSession = mediaSession2;
            this.mAudioManager = (AudioManager) context.getSystemService("audio");
        }

        @GuardedBy("mLock")
        private void abandonAudioFocusLocked() {
            if (this.mHasAudioFocus) {
                this.mAudioManager.abandonAudioFocus(this.mAudioFocusListener);
                this.mHasAudioFocus = false;
                this.mResumeWhenAudioFocusGain = false;
            }
        }

        @GuardedBy("mLock")
        private int convertAudioAttributesToFocusGainLocked() {
            AudioAttributesCompat audioAttributesCompat = this.mAudioAttributes;
            if (audioAttributesCompat == null) {
                return 0;
            }
            switch (audioAttributesCompat.getUsage()) {
                case 0:
                case 5:
                case 6:
                case 7:
                case 8:
                case 9:
                case 10:
                case 11:
                case 12:
                case 13:
                case 16:
                    return 3;
                case 1:
                case 14:
                    return 1;
                case 2:
                case 3:
                case 4:
                    return 2;
                default:
                    return 0;
            }
        }

        @GuardedBy("mLock")
        private void registerReceiverLocked() {
            if (!this.mHasRegisteredReceiver) {
                this.mSession.getContext().registerReceiver(this.mBecomingNoisyIntentReceiver, this.mIntentFilter);
                this.mHasRegisteredReceiver = true;
            }
        }

        @GuardedBy("mLock")
        private boolean requestAudioFocusLocked() {
            int convertAudioAttributesToFocusGainLocked = convertAudioAttributesToFocusGainLocked();
            if (convertAudioAttributesToFocusGainLocked == 0) {
                return true;
            }
            int requestAudioFocus = this.mAudioManager.requestAudioFocus(this.mAudioFocusListener, this.mAudioAttributes.getVolumeControlStream(), convertAudioAttributesToFocusGainLocked);
            if (requestAudioFocus == 1) {
                this.mHasAudioFocus = true;
            } else {
                String str = AudioFocusHandler.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("requestAudioFocus(");
                sb.append(convertAudioAttributesToFocusGainLocked);
                sb.append(") failed (return=");
                sb.append(requestAudioFocus);
                sb.append(") playback wouldn't start.");
                Log.w(str, sb.toString());
                this.mHasAudioFocus = false;
            }
            this.mResumeWhenAudioFocusGain = false;
            return this.mHasAudioFocus;
        }

        @GuardedBy("mLock")
        private void unregisterReceiverLocked() {
            if (this.mHasRegisteredReceiver) {
                this.mSession.getContext().unregisterReceiver(this.mBecomingNoisyIntentReceiver);
                this.mHasRegisteredReceiver = false;
            }
        }

        /* JADX WARNING: Code restructure failed: missing block: B:18:0x003d, code lost:
            return;
         */
        private void updateAudioAttributesIfNeeded() {
            AudioAttributesCompat audioAttributesCompat = null;
            if (this.mSession.getVolumeProvider() == null) {
                BaseMediaPlayer player = this.mSession.getPlayer();
                if (player != null) {
                    audioAttributesCompat = player.getAudioAttributes();
                }
            }
            synchronized (this.mLock) {
                if (!ObjectsCompat.equals(audioAttributesCompat, this.mAudioAttributes)) {
                    this.mAudioAttributes = audioAttributesCompat;
                    if (this.mHasAudioFocus) {
                        this.mHasAudioFocus = requestAudioFocusLocked();
                        if (!this.mHasAudioFocus) {
                            Log.w(AudioFocusHandler.TAG, "Failed to regain audio focus.");
                        }
                    }
                }
            }
        }

        public void close() {
            synchronized (this.mLock) {
                unregisterReceiverLocked();
                abandonAudioFocusLocked();
            }
        }

        public boolean onPauseRequested() {
            synchronized (this.mLock) {
                this.mResumeWhenAudioFocusGain = false;
            }
            return true;
        }

        public boolean onPlayRequested() {
            updateAudioAttributesIfNeeded();
            synchronized (this.mLock) {
                return requestAudioFocusLocked();
            }
        }

        public void onPlayerStateChanged(int i) {
            synchronized (this.mLock) {
                switch (i) {
                    case 0:
                        abandonAudioFocusLocked();
                        break;
                    case 1:
                        updateAudioAttributesIfNeeded();
                        unregisterReceiverLocked();
                        break;
                    case 2:
                        updateAudioAttributesIfNeeded();
                        registerReceiverLocked();
                        break;
                    case 3:
                        abandonAudioFocusLocked();
                        unregisterReceiverLocked();
                        break;
                }
            }
        }

        public void sendIntent(Intent intent) {
            this.mBecomingNoisyIntentReceiver.onReceive(this.mSession.getContext(), intent);
        }
    }

    AudioFocusHandler(Context context, MediaSession2 mediaSession2) {
        this.mImpl = new AudioFocusHandlerImplBase(context, mediaSession2);
    }

    public void close() {
        this.mImpl.close();
    }

    public boolean onPauseRequested() {
        return this.mImpl.onPauseRequested();
    }

    public boolean onPlayRequested() {
        return this.mImpl.onPlayRequested();
    }

    public void onPlayerStateChanged(int i) {
        this.mImpl.onPlayerStateChanged(i);
    }

    public void sendIntent(Intent intent) {
        this.mImpl.sendIntent(intent);
    }
}
