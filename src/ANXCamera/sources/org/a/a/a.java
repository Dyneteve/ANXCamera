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
    public AudioTrack vQ = null;
    private long vR = 0;
    private Thread vS = null;
    /* access modifiers changed from: private */
    public b vT = null;

    public a(long j) {
        this.mHandle = j;
    }

    private void iP() {
        iQ();
        AudioTrack audioTrack = new AudioTrack(3, 44100, 12, 2, (int) this.vR, 1);
        this.vQ = audioTrack;
    }

    private void iQ() {
        if (this.vQ != null) {
            this.vQ.flush();
            if (this.vQ.getPlayState() == 1) {
                this.vQ.stop();
            }
            this.vQ.release();
            this.vQ = null;
        }
    }

    private int iR() {
        if (this.mStatus != 2) {
            return -1;
        }
        if (this.vT == null) {
            return -2;
        }
        this.vS = new Thread(new Runnable() {
            public void run() {
                if (a.this.vQ != null && a.this.mStatus == 2) {
                    a.this.vQ.play();
                }
                while (a.this.mStatus != 4) {
                    byte[] playAudioSamples = a.this.mStatus == 3 ? null : a.this.vT.playAudioSamples(a.this.mHandle);
                    if (playAudioSamples == null || playAudioSamples.length <= 0) {
                        try {
                            Thread.sleep(10);
                        } catch (InterruptedException e) {
                            return;
                        }
                    } else if (a.this.vQ != null) {
                        try {
                            a.this.vQ.write(playAudioSamples, 0, playAudioSamples.length);
                        } catch (Exception e2) {
                        }
                    }
                }
            }
        });
        this.vS.start();
        return 0;
    }

    public boolean a(b bVar) {
        this.vT = bVar;
        this.vR = (long) AudioTrack.getMinBufferSize(44100, 12, 2);
        if (this.vR <= 0) {
            return false;
        }
        iP();
        if (this.vQ.getState() != 1) {
            return false;
        }
        this.mStatus = 1;
        if (this.vT != null) {
            this.vT.setAudioMinSize(this.mHandle, PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM);
        }
        return true;
    }

    public long iL() {
        return this.mHandle;
    }

    public void iM() {
        this.mStatus = 0;
        iO();
        iQ();
    }

    public void iN() {
        if (this.mStatus == 1) {
            this.mStatus = 2;
            iR();
        }
    }

    public void iO() {
        this.mStatus = 4;
        if (this.vT != null) {
            this.vT.stopAudio(this.mHandle);
        }
        if (this.vS != null) {
            try {
                this.vS.join();
            } catch (Exception e) {
            }
        }
        this.vS = null;
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
