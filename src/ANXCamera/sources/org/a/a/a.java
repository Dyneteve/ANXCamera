package org.a.a;

import android.media.AudioTrack;

/* compiled from: AudioPlayer */
public class a {
    /* access modifiers changed from: private */
    public long mHandle;
    /* access modifiers changed from: private */
    public int mStatus = 0;
    /* access modifiers changed from: private */
    public AudioTrack vZ = null;
    private long wa = 0;
    private Thread wb = null;
    /* access modifiers changed from: private */
    public b wc = null;

    public a(long j) {
        this.mHandle = j;
    }

    private void iQ() {
        iR();
        AudioTrack audioTrack = new AudioTrack(3, 44100, 12, 2, (int) this.wa, 1);
        this.vZ = audioTrack;
    }

    private void iR() {
        if (this.vZ != null) {
            this.vZ.flush();
            if (this.vZ.getPlayState() == 1) {
                this.vZ.stop();
            }
            this.vZ.release();
            this.vZ = null;
        }
    }

    private int iS() {
        if (this.mStatus != 2) {
            return -1;
        }
        if (this.wc == null) {
            return -2;
        }
        this.wb = new Thread(new Runnable() {
            public void run() {
                if (a.this.vZ != null && a.this.mStatus == 2) {
                    a.this.vZ.play();
                }
                while (a.this.mStatus != 4) {
                    byte[] playAudioSamples = a.this.mStatus == 3 ? null : a.this.wc.playAudioSamples(a.this.mHandle);
                    if (playAudioSamples == null || playAudioSamples.length <= 0) {
                        try {
                            Thread.sleep(10);
                        } catch (InterruptedException e) {
                            return;
                        }
                    } else if (a.this.vZ != null) {
                        try {
                            a.this.vZ.write(playAudioSamples, 0, playAudioSamples.length);
                        } catch (Exception e2) {
                        }
                    }
                }
            }
        });
        this.wb.start();
        return 0;
    }

    public boolean a(b bVar) {
        this.wc = bVar;
        this.wa = (long) AudioTrack.getMinBufferSize(44100, 12, 2);
        if (this.wa <= 0) {
            return false;
        }
        iQ();
        if (this.vZ.getState() != 1) {
            return false;
        }
        this.mStatus = 1;
        if (this.wc != null) {
            this.wc.setAudioMinSize(this.mHandle, 4096);
        }
        return true;
    }

    public long iM() {
        return this.mHandle;
    }

    public void iN() {
        this.mStatus = 0;
        iP();
        iR();
    }

    public void iO() {
        if (this.mStatus == 1) {
            this.mStatus = 2;
            iS();
        }
    }

    public void iP() {
        this.mStatus = 4;
        if (this.wc != null) {
            this.wc.stopAudio(this.mHandle);
        }
        if (this.wb != null) {
            try {
                this.wb.join();
            } catch (Exception e) {
            }
        }
        this.wb = null;
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
