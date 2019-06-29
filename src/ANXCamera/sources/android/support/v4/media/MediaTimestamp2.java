package android.support.v4.media;

import android.annotation.TargetApi;
import android.media.MediaTimestamp;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;

public final class MediaTimestamp2 {
    public static final MediaTimestamp2 TIMESTAMP_UNKNOWN;
    private final float mClockRate;
    private final long mMediaTimeUs;
    private final long mNanoTime;

    static {
        MediaTimestamp2 mediaTimestamp2 = new MediaTimestamp2(-1, -1, 0.0f);
        TIMESTAMP_UNKNOWN = mediaTimestamp2;
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    MediaTimestamp2() {
        this.mMediaTimeUs = 0;
        this.mNanoTime = 0;
        this.mClockRate = 1.0f;
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    MediaTimestamp2(long j, long j2, float f) {
        this.mMediaTimeUs = j;
        this.mNanoTime = j2;
        this.mClockRate = f;
    }

    @TargetApi(23)
    @RestrictTo({Scope.LIBRARY_GROUP})
    MediaTimestamp2(MediaTimestamp mediaTimestamp) {
        this.mMediaTimeUs = mediaTimestamp.getAnchorMediaTimeUs();
        this.mNanoTime = mediaTimestamp.getAnchorSytemNanoTime();
        this.mClockRate = mediaTimestamp.getMediaClockRate();
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        MediaTimestamp2 mediaTimestamp2 = (MediaTimestamp2) obj;
        if (!(this.mMediaTimeUs == mediaTimestamp2.mMediaTimeUs && this.mNanoTime == mediaTimestamp2.mNanoTime && this.mClockRate == mediaTimestamp2.mClockRate)) {
            z = false;
        }
        return z;
    }

    public long getAnchorMediaTimeUs() {
        return this.mMediaTimeUs;
    }

    public long getAnchorSytemNanoTime() {
        return this.mNanoTime;
    }

    public float getMediaClockRate() {
        return this.mClockRate;
    }

    public int hashCode() {
        return (int) (((float) (31 * ((int) (((long) (Long.valueOf(this.mMediaTimeUs).hashCode() * 31)) + this.mNanoTime)))) + this.mClockRate);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getName());
        sb.append("{AnchorMediaTimeUs=");
        sb.append(this.mMediaTimeUs);
        sb.append(" AnchorSystemNanoTime=");
        sb.append(this.mNanoTime);
        sb.append(" ClockRate=");
        sb.append(this.mClockRate);
        sb.append("}");
        return sb.toString();
    }
}
