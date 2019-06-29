package android.support.v4.media;

import android.media.PlaybackParams;
import android.os.Build.VERSION;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public final class PlaybackParams2 {
    public static final int AUDIO_FALLBACK_MODE_DEFAULT = 0;
    public static final int AUDIO_FALLBACK_MODE_FAIL = 2;
    public static final int AUDIO_FALLBACK_MODE_MUTE = 1;
    private Integer mAudioFallbackMode;
    private Float mPitch;
    private PlaybackParams mPlaybackParams;
    private Float mSpeed;

    @RestrictTo({Scope.LIBRARY_GROUP})
    @Retention(RetentionPolicy.SOURCE)
    public @interface AudioFallbackMode {
    }

    public static final class Builder {
        private Integer mAudioFallbackMode;
        private Float mPitch;
        private PlaybackParams mPlaybackParams;
        private Float mSpeed;

        public Builder() {
            if (VERSION.SDK_INT >= 23) {
                this.mPlaybackParams = new PlaybackParams();
            }
        }

        @RequiresApi(23)
        @RestrictTo({Scope.LIBRARY_GROUP})
        public Builder(PlaybackParams playbackParams) {
            this.mPlaybackParams = playbackParams;
        }

        public PlaybackParams2 build() {
            return VERSION.SDK_INT >= 23 ? new PlaybackParams2(this.mPlaybackParams) : new PlaybackParams2(this.mAudioFallbackMode, this.mPitch, this.mSpeed);
        }

        public Builder setAudioFallbackMode(int i) {
            if (VERSION.SDK_INT >= 23) {
                this.mPlaybackParams.setAudioFallbackMode(i);
            } else {
                this.mAudioFallbackMode = Integer.valueOf(i);
            }
            return this;
        }

        public Builder setPitch(float f) {
            if (f >= 0.0f) {
                if (VERSION.SDK_INT >= 23) {
                    this.mPlaybackParams.setPitch(f);
                } else {
                    this.mPitch = Float.valueOf(f);
                }
                return this;
            }
            throw new IllegalArgumentException("pitch must not be negative");
        }

        public Builder setSpeed(float f) {
            if (VERSION.SDK_INT >= 23) {
                this.mPlaybackParams.setSpeed(f);
            } else {
                this.mSpeed = Float.valueOf(f);
            }
            return this;
        }
    }

    @RequiresApi(23)
    private PlaybackParams2(PlaybackParams playbackParams) {
        this.mPlaybackParams = playbackParams;
    }

    private PlaybackParams2(Integer num, Float f, Float f2) {
        this.mAudioFallbackMode = num;
        this.mPitch = f;
        this.mSpeed = f2;
    }

    public Integer getAudioFallbackMode() {
        if (VERSION.SDK_INT < 23) {
            return this.mAudioFallbackMode;
        }
        try {
            return Integer.valueOf(this.mPlaybackParams.getAudioFallbackMode());
        } catch (IllegalStateException e) {
            return null;
        }
    }

    public Float getPitch() {
        if (VERSION.SDK_INT < 23) {
            return this.mPitch;
        }
        try {
            return Float.valueOf(this.mPlaybackParams.getPitch());
        } catch (IllegalStateException e) {
            return null;
        }
    }

    @RequiresApi(23)
    @RestrictTo({Scope.LIBRARY_GROUP})
    public PlaybackParams getPlaybackParams() {
        if (VERSION.SDK_INT >= 23) {
            return this.mPlaybackParams;
        }
        return null;
    }

    public Float getSpeed() {
        if (VERSION.SDK_INT < 23) {
            return this.mPitch;
        }
        try {
            return Float.valueOf(this.mPlaybackParams.getSpeed());
        } catch (IllegalStateException e) {
            return null;
        }
    }
}
