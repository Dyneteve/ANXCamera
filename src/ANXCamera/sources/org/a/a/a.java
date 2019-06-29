package org.a.a;

import android.media.AudioTrack;
import android.support.v4.media.session.PlaybackStateCompat;

/* compiled from: AudioPlayer */
public class a {
    /* access modifiers changed from: private */
    public long mHandle;
    /* access modifiers changed from: private */
    public int mStatus = 0;
    /* access modifiers changed from: private */
    public AudioTrack xl = null;
    private long xm = 0;
    private Thread xn = null;
    /* access modifiers changed from: private */
    public b xo = null;

    public a(long j) {
        this.mHandle = j;
    }

    private void jE() {
        jF();
        AudioTrack audioTrack = new AudioTrack(3, 44100, 12, 2, (int) this.xm, 1);
        this.xl = audioTrack;
    }

    private void jF() {
        if (this.xl != null) {
            this.xl.flush();
            if (this.xl.getPlayState() == 1) {
                this.xl.stop();
            }
            this.xl.release();
            this.xl = null;
        }
    }

    private int jG() {
        if (this.mStatus != 2) {
            return -1;
        }
        if (this.xo == null) {
            return -2;
        }
        this.xn = new Thread(new Runnable() {
            public void run() {
                if (a.this.xl != null && a.this.mStatus == 2) {
                    a.this.xl.play();
                }
                while (a.this.mStatus != 4) {
                    byte[] playAudioSamples = a.this.mStatus == 3 ? null : a.this.xo.playAudioSamples(a.this.mHandle);
                    if (playAudioSamples == null || playAudioSamples.length <= 0) {
                        try {
                            Thread.sleep(10);
                        } catch (InterruptedException e) {
                            return;
                        }
                    } else if (a.this.xl != null) {
                        try {
                            a.this.xl.write(playAudioSamples, 0, playAudioSamples.length);
                        } catch (Exception e2) {
                        }
                    }
                }
            }
        });
        this.xn.start();
        return 0;
    }

    public boolean a(b bVar) {
        this.xo = bVar;
        this.xm = (long) AudioTrack.getMinBufferSize(44100, 12, 2);
        if (this.xm <= 0) {
            return false;
        }
        jE();
        if (this.xl.getState() != 1) {
            return false;
        }
        this.mStatus = 1;
        if (this.xo != null) {
            this.xo.setAudioMinSize(this.mHandle, PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM);
        }
        return true;
    }

    public long jA() {
        return this.mHandle;
    }

    public void jB() {
        this.mStatus = 0;
        jD();
        jF();
    }

    public void jC() {
        if (this.mStatus == 1) {
            this.mStatus = 2;
            jG();
        }
    }

    public void jD() {
        this.mStatus = 4;
        if (this.xo != null) {
            this.xo.stopAudio(this.mHandle);
        }
        if (this.xn != null) {
            try {
                this.xn.join();
            } catch (Exception e) {
            }
        }
        this.xn = null;
    }

    public void pause() {
        if (this.mStatus == 2) {
            this.mStatus = 3;
        }
    }

    public void resume() {
        if (this.mStatus == 3) {
            this.mStatus = 2;
        }
    }
}
