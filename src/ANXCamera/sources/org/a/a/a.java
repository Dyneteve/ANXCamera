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
    public AudioTrack vL = null;
    private long vM = 0;
    private Thread vN = null;
    /* access modifiers changed from: private */
    public b vO = null;

    public a(long j) {
        this.mHandle = j;
    }

    private void iM() {
        iN();
        AudioTrack audioTrack = new AudioTrack(3, 44100, 12, 2, (int) this.vM, 1);
        this.vL = audioTrack;
    }

    private void iN() {
        if (this.vL != null) {
            this.vL.flush();
            if (this.vL.getPlayState() == 1) {
                this.vL.stop();
            }
            this.vL.release();
            this.vL = null;
        }
    }

    private int iO() {
        if (this.mStatus != 2) {
            return -1;
        }
        if (this.vO == null) {
            return -2;
        }
        this.vN = new Thread(new Runnable() {
            public void run() {
                if (a.this.vL != null && a.this.mStatus == 2) {
                    a.this.vL.play();
                }
                while (a.this.mStatus != 4) {
                    byte[] playAudioSamples = a.this.mStatus == 3 ? null : a.this.vO.playAudioSamples(a.this.mHandle);
                    if (playAudioSamples == null || playAudioSamples.length <= 0) {
                        try {
                            Thread.sleep(10);
                        } catch (InterruptedException e) {
                            return;
                        }
                    } else if (a.this.vL != null) {
                        try {
                            a.this.vL.write(playAudioSamples, 0, playAudioSamples.length);
                        } catch (Exception e2) {
                        }
                    }
                }
            }
        });
        this.vN.start();
        return 0;
    }

    public boolean a(b bVar) {
        this.vO = bVar;
        this.vM = (long) AudioTrack.getMinBufferSize(44100, 12, 2);
        if (this.vM <= 0) {
            return false;
        }
        iM();
        if (this.vL.getState() != 1) {
            return false;
        }
        this.mStatus = 1;
        if (this.vO != null) {
            this.vO.setAudioMinSize(this.mHandle, PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM);
        }
        return true;
    }

    public long iI() {
        return this.mHandle;
    }

    public void iJ() {
        this.mStatus = 0;
        iL();
        iN();
    }

    public void iK() {
        if (this.mStatus == 1) {
            this.mStatus = 2;
            iO();
        }
    }

    public void iL() {
        this.mStatus = 4;
        if (this.vO != null) {
            this.vO.stopAudio(this.mHandle);
        }
        if (this.vN != null) {
            try {
                this.vN.join();
            } catch (Exception e) {
            }
        }
        this.vN = null;
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
