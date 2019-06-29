package android.support.v4.media;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.text.TextUtils;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.UUID;

public class MediaItem2 {
    public static final int FLAG_BROWSABLE = 1;
    public static final int FLAG_PLAYABLE = 2;
    private static final String KEY_FLAGS = "android.media.mediaitem2.flags";
    private static final String KEY_ID = "android.media.mediaitem2.id";
    private static final String KEY_METADATA = "android.media.mediaitem2.metadata";
    private static final String KEY_UUID = "android.media.mediaitem2.uuid";
    private DataSourceDesc mDataSourceDesc;
    private final int mFlags;
    private final String mId;
    private MediaMetadata2 mMetadata;
    private final UUID mUUID;

    public static final class Builder {
        private DataSourceDesc mDataSourceDesc;
        private int mFlags;
        private String mMediaId;
        private MediaMetadata2 mMetadata;

        public Builder(int i) {
            this.mFlags = i;
        }

        public MediaItem2 build() {
            String string = this.mMetadata != null ? this.mMetadata.getString("android.media.metadata.MEDIA_ID") : null;
            if (string == null) {
                string = this.mMediaId != null ? this.mMediaId : toString();
            }
            MediaItem2 mediaItem2 = new MediaItem2(string, this.mDataSourceDesc, this.mMetadata, this.mFlags);
            return mediaItem2;
        }

        public Builder setDataSourceDesc(@Nullable DataSourceDesc dataSourceDesc) {
            this.mDataSourceDesc = dataSourceDesc;
            return this;
        }

        public Builder setMediaId(@Nullable String str) {
            this.mMediaId = str;
            return this;
        }

        public Builder setMetadata(@Nullable MediaMetadata2 mediaMetadata2) {
            this.mMetadata = mediaMetadata2;
            return this;
        }
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    @Retention(RetentionPolicy.SOURCE)
    public @interface Flags {
    }

    private MediaItem2(@NonNull String str, @Nullable DataSourceDesc dataSourceDesc, @Nullable MediaMetadata2 mediaMetadata2, int i) {
        this(str, dataSourceDesc, mediaMetadata2, i, (UUID) null);
    }

    private MediaItem2(@NonNull String str, @Nullable DataSourceDesc dataSourceDesc, @Nullable MediaMetadata2 mediaMetadata2, int i, @Nullable UUID uuid) {
        if (str == null) {
            throw new IllegalArgumentException("mediaId shouldn't be null");
        } else if (mediaMetadata2 == null || TextUtils.equals(str, mediaMetadata2.getMediaId())) {
            this.mId = str;
            this.mDataSourceDesc = dataSourceDesc;
            this.mMetadata = mediaMetadata2;
            this.mFlags = i;
            if (uuid == null) {
                uuid = UUID.randomUUID();
            }
            this.mUUID = uuid;
        } else {
            throw new IllegalArgumentException("metadata's id should be matched with the mediaid");
        }
    }

    public static MediaItem2 fromBundle(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        return fromBundle(bundle, UUID.fromString(bundle.getString(KEY_UUID)));
    }

    static MediaItem2 fromBundle(@NonNull Bundle bundle, @Nullable UUID uuid) {
        MediaMetadata2 mediaMetadata2 = null;
        if (bundle == null) {
            return null;
        }
        String string = bundle.getString(KEY_ID);
        Bundle bundle2 = bundle.getBundle(KEY_METADATA);
        if (bundle2 != null) {
            mediaMetadata2 = MediaMetadata2.fromBundle(bundle2);
        }
        MediaItem2 mediaItem2 = new MediaItem2(string, (DataSourceDesc) null, mediaMetadata2, bundle.getInt(KEY_FLAGS), uuid);
        return mediaItem2;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof MediaItem2)) {
            return false;
        }
        return this.mUUID.equals(((MediaItem2) obj).mUUID);
    }

    @Nullable
    public DataSourceDesc getDataSourceDesc() {
        return this.mDataSourceDesc;
    }

    public int getFlags() {
        return this.mFlags;
    }

    public String getMediaId() {
        return this.mId;
    }

    @Nullable
    public MediaMetadata2 getMetadata() {
        return this.mMetadata;
    }

    public int hashCode() {
        return this.mUUID.hashCode();
    }

    public boolean isBrowsable() {
        return (this.mFlags & 1) != 0;
    }

    public boolean isPlayable() {
        return (this.mFlags & 2) != 0;
    }

    public void setMetadata(@Nullable MediaMetadata2 mediaMetadata2) {
        if (mediaMetadata2 == null || TextUtils.equals(this.mId, mediaMetadata2.getMediaId())) {
            this.mMetadata = mediaMetadata2;
            return;
        }
        throw new IllegalArgumentException("metadata's id should be matched with the mediaId");
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putString(KEY_ID, this.mId);
        bundle.putInt(KEY_FLAGS, this.mFlags);
        if (this.mMetadata != null) {
            bundle.putBundle(KEY_METADATA, this.mMetadata.toBundle());
        }
        bundle.putString(KEY_UUID, this.mUUID.toString());
        return bundle;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("MediaItem2{");
        sb.append("mFlags=");
        sb.append(this.mFlags);
        sb.append(", mMetadata=");
        sb.append(this.mMetadata);
        sb.append('}');
        return sb.toString();
    }
}
