package android.support.v4.media;

import android.content.ComponentName;
import android.content.Intent;
import android.os.IBinder;
import android.support.annotation.GuardedBy;
import android.support.v4.media.MediaSessionService2.MediaNotification;
import android.util.Log;

class MediaSessionService2ImplBase implements SupportLibraryImpl {
    private static final boolean DEBUG = true;
    private static final String TAG = "MSS2ImplBase";
    private final Object mLock = new Object();
    @GuardedBy("mLock")
    private MediaSession2 mSession;

    MediaSessionService2ImplBase() {
    }

    public MediaSession2 getSession() {
        MediaSession2 mediaSession2;
        synchronized (this.mLock) {
            mediaSession2 = this.mSession;
        }
        return mediaSession2;
    }

    public int getSessionType() {
        return 1;
    }

    public IBinder onBind(Intent intent) {
        if (MediaSessionService2.SERVICE_INTERFACE.equals(intent.getAction())) {
            synchronized (this.mLock) {
                if (this.mSession != null) {
                    IBinder sessionBinder = this.mSession.getSessionBinder();
                    return sessionBinder;
                }
                Log.d(TAG, "Session hasn't created");
            }
        }
        return null;
    }

    public void onCreate(MediaSessionService2 mediaSessionService2) {
        SessionToken2 sessionToken2 = new SessionToken2(mediaSessionService2, new ComponentName(mediaSessionService2, mediaSessionService2.getClass().getName()));
        if (sessionToken2.getType() == getSessionType()) {
            MediaSession2 onCreateSession = mediaSessionService2.onCreateSession(sessionToken2.getId());
            synchronized (this.mLock) {
                this.mSession = onCreateSession;
                if (this.mSession == null || !sessionToken2.getId().equals(this.mSession.getToken().getId()) || this.mSession.getToken().getType() != getSessionType()) {
                    this.mSession = null;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Expected session with id ");
                    sb.append(sessionToken2.getId());
                    sb.append(" and type ");
                    sb.append(sessionToken2.getType());
                    sb.append(", but got ");
                    sb.append(this.mSession);
                    throw new RuntimeException(sb.toString());
                }
            }
            return;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("Expected session type ");
        sb2.append(getSessionType());
        sb2.append(" but was ");
        sb2.append(sessionToken2.getType());
        throw new RuntimeException(sb2.toString());
    }

    public MediaNotification onUpdateNotification() {
        return null;
    }
}
