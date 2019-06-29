package android.support.v4.media;

import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.mediacompat.Rating2;
import android.support.v4.util.ArrayMap;
import android.util.Log;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.Set;

public final class MediaMetadata2 {
    public static final long BT_FOLDER_TYPE_ALBUMS = 2;
    public static final long BT_FOLDER_TYPE_ARTISTS = 3;
    public static final long BT_FOLDER_TYPE_GENRES = 4;
    public static final long BT_FOLDER_TYPE_MIXED = 0;
    public static final long BT_FOLDER_TYPE_PLAYLISTS = 5;
    public static final long BT_FOLDER_TYPE_TITLES = 1;
    public static final long BT_FOLDER_TYPE_YEARS = 6;
    static final ArrayMap<String, Integer> METADATA_KEYS_TYPE = new ArrayMap<>();
    public static final String METADATA_KEY_ADVERTISEMENT = "android.media.metadata.ADVERTISEMENT";
    public static final String METADATA_KEY_ALBUM = "android.media.metadata.ALBUM";
    public static final String METADATA_KEY_ALBUM_ART = "android.media.metadata.ALBUM_ART";
    public static final String METADATA_KEY_ALBUM_ARTIST = "android.media.metadata.ALBUM_ARTIST";
    public static final String METADATA_KEY_ALBUM_ART_URI = "android.media.metadata.ALBUM_ART_URI";
    public static final String METADATA_KEY_ART = "android.media.metadata.ART";
    public static final String METADATA_KEY_ARTIST = "android.media.metadata.ARTIST";
    public static final String METADATA_KEY_ART_URI = "android.media.metadata.ART_URI";
    public static final String METADATA_KEY_AUTHOR = "android.media.metadata.AUTHOR";
    public static final String METADATA_KEY_BT_FOLDER_TYPE = "android.media.metadata.BT_FOLDER_TYPE";
    public static final String METADATA_KEY_COMPILATION = "android.media.metadata.COMPILATION";
    public static final String METADATA_KEY_COMPOSER = "android.media.metadata.COMPOSER";
    public static final String METADATA_KEY_DATE = "android.media.metadata.DATE";
    public static final String METADATA_KEY_DISC_NUMBER = "android.media.metadata.DISC_NUMBER";
    public static final String METADATA_KEY_DISPLAY_DESCRIPTION = "android.media.metadata.DISPLAY_DESCRIPTION";
    public static final String METADATA_KEY_DISPLAY_ICON = "android.media.metadata.DISPLAY_ICON";
    public static final String METADATA_KEY_DISPLAY_ICON_URI = "android.media.metadata.DISPLAY_ICON_URI";
    public static final String METADATA_KEY_DISPLAY_SUBTITLE = "android.media.metadata.DISPLAY_SUBTITLE";
    public static final String METADATA_KEY_DISPLAY_TITLE = "android.media.metadata.DISPLAY_TITLE";
    public static final String METADATA_KEY_DOWNLOAD_STATUS = "android.media.metadata.DOWNLOAD_STATUS";
    public static final String METADATA_KEY_DURATION = "android.media.metadata.DURATION";
    public static final String METADATA_KEY_EXTRAS = "android.media.metadata.EXTRAS";
    public static final String METADATA_KEY_GENRE = "android.media.metadata.GENRE";
    public static final String METADATA_KEY_MEDIA_ID = "android.media.metadata.MEDIA_ID";
    public static final String METADATA_KEY_MEDIA_URI = "android.media.metadata.MEDIA_URI";
    public static final String METADATA_KEY_NUM_TRACKS = "android.media.metadata.NUM_TRACKS";
    @RestrictTo({Scope.LIBRARY_GROUP})
    public static final String METADATA_KEY_RADIO_FREQUENCY = "android.media.metadata.RADIO_FREQUENCY";
    @RestrictTo({Scope.LIBRARY_GROUP})
    public static final String METADATA_KEY_RADIO_PROGRAM_NAME = "android.media.metadata.RADIO_PROGRAM_NAME";
    public static final String METADATA_KEY_RATING = "android.media.metadata.RATING";
    public static final String METADATA_KEY_TITLE = "android.media.metadata.TITLE";
    public static final String METADATA_KEY_TRACK_NUMBER = "android.media.metadata.TRACK_NUMBER";
    public static final String METADATA_KEY_USER_RATING = "android.media.metadata.USER_RATING";
    public static final String METADATA_KEY_WRITER = "android.media.metadata.WRITER";
    public static final String METADATA_KEY_YEAR = "android.media.metadata.YEAR";
    static final int METADATA_TYPE_BITMAP = 2;
    static final int METADATA_TYPE_FLOAT = 4;
    static final int METADATA_TYPE_LONG = 0;
    static final int METADATA_TYPE_RATING = 3;
    static final int METADATA_TYPE_TEXT = 1;
    private static final String[] PREFERRED_BITMAP_ORDER = {"android.media.metadata.DISPLAY_ICON", "android.media.metadata.ART", "android.media.metadata.ALBUM_ART"};
    private static final String[] PREFERRED_DESCRIPTION_ORDER = {"android.media.metadata.TITLE", "android.media.metadata.ARTIST", "android.media.metadata.ALBUM", "android.media.metadata.ALBUM_ARTIST", "android.media.metadata.WRITER", "android.media.metadata.AUTHOR", "android.media.metadata.COMPOSER"};
    private static final String[] PREFERRED_URI_ORDER = {"android.media.metadata.DISPLAY_ICON_URI", "android.media.metadata.ART_URI", "android.media.metadata.ALBUM_ART_URI"};
    public static final long STATUS_DOWNLOADED = 2;
    public static final long STATUS_DOWNLOADING = 1;
    public static final long STATUS_NOT_DOWNLOADED = 0;
    private static final String TAG = "MediaMetadata2";
    final Bundle mBundle;

    @RestrictTo({Scope.LIBRARY_GROUP})
    @Retention(RetentionPolicy.SOURCE)
    public @interface BitmapKey {
    }

    public static final class Builder {
        final Bundle mBundle;

        public Builder() {
            this.mBundle = new Bundle();
        }

        public Builder(@NonNull MediaMetadata2 mediaMetadata2) {
            this.mBundle = new Bundle(mediaMetadata2.toBundle());
        }

        @RestrictTo({Scope.LIBRARY_GROUP})
        public Builder(MediaMetadata2 mediaMetadata2, int i) {
            this(mediaMetadata2);
            for (String str : this.mBundle.keySet()) {
                Object obj = this.mBundle.get(str);
                if (obj instanceof Bitmap) {
                    Bitmap bitmap = (Bitmap) obj;
                    if (bitmap.getHeight() > i || bitmap.getWidth() > i) {
                        putBitmap(str, scaleBitmap(bitmap, i));
                    }
                }
            }
        }

        private Bitmap scaleBitmap(Bitmap bitmap, int i) {
            float f = (float) i;
            float min = Math.min(f / ((float) bitmap.getWidth()), f / ((float) bitmap.getHeight()));
            return Bitmap.createScaledBitmap(bitmap, (int) (((float) bitmap.getWidth()) * min), (int) (((float) bitmap.getHeight()) * min), true);
        }

        @NonNull
        public MediaMetadata2 build() {
            return new MediaMetadata2(this.mBundle);
        }

        @NonNull
        public Builder putBitmap(@NonNull String str, @Nullable Bitmap bitmap) {
            if (str == null) {
                throw new IllegalArgumentException("key shouldn't be null");
            } else if (!MediaMetadata2.METADATA_KEYS_TYPE.containsKey(str) || ((Integer) MediaMetadata2.METADATA_KEYS_TYPE.get(str)).intValue() == 2) {
                this.mBundle.putParcelable(str, bitmap);
                return this;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("The ");
                sb.append(str);
                sb.append(" key cannot be used to put a Bitmap");
                throw new IllegalArgumentException(sb.toString());
            }
        }

        @NonNull
        public Builder putFloat(@NonNull String str, float f) {
            if (str == null) {
                throw new IllegalArgumentException("key shouldn't be null");
            } else if (!MediaMetadata2.METADATA_KEYS_TYPE.containsKey(str) || ((Integer) MediaMetadata2.METADATA_KEYS_TYPE.get(str)).intValue() == 4) {
                this.mBundle.putFloat(str, f);
                return this;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("The ");
                sb.append(str);
                sb.append(" key cannot be used to put a float");
                throw new IllegalArgumentException(sb.toString());
            }
        }

        @NonNull
        public Builder putLong(@NonNull String str, long j) {
            if (str == null) {
                throw new IllegalArgumentException("key shouldn't be null");
            } else if (!MediaMetadata2.METADATA_KEYS_TYPE.containsKey(str) || ((Integer) MediaMetadata2.METADATA_KEYS_TYPE.get(str)).intValue() == 0) {
                this.mBundle.putLong(str, j);
                return this;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("The ");
                sb.append(str);
                sb.append(" key cannot be used to put a long");
                throw new IllegalArgumentException(sb.toString());
            }
        }

        @NonNull
        public Builder putRating(@NonNull String str, @Nullable Rating2 rating2) {
            if (str == null) {
                throw new IllegalArgumentException("key shouldn't be null");
            } else if (!MediaMetadata2.METADATA_KEYS_TYPE.containsKey(str) || ((Integer) MediaMetadata2.METADATA_KEYS_TYPE.get(str)).intValue() == 3) {
                this.mBundle.putBundle(str, rating2 == null ? null : rating2.toBundle());
                return this;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("The ");
                sb.append(str);
                sb.append(" key cannot be used to put a Rating");
                throw new IllegalArgumentException(sb.toString());
            }
        }

        @NonNull
        public Builder putString(@NonNull String str, @Nullable String str2) {
            if (str == null) {
                throw new IllegalArgumentException("key shouldn't be null");
            } else if (!MediaMetadata2.METADATA_KEYS_TYPE.containsKey(str) || ((Integer) MediaMetadata2.METADATA_KEYS_TYPE.get(str)).intValue() == 1) {
                this.mBundle.putCharSequence(str, str2);
                return this;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("The ");
                sb.append(str);
                sb.append(" key cannot be used to put a String");
                throw new IllegalArgumentException(sb.toString());
            }
        }

        @NonNull
        public Builder putText(@NonNull String str, @Nullable CharSequence charSequence) {
            if (str == null) {
                throw new IllegalArgumentException("key shouldn't be null");
            } else if (!MediaMetadata2.METADATA_KEYS_TYPE.containsKey(str) || ((Integer) MediaMetadata2.METADATA_KEYS_TYPE.get(str)).intValue() == 1) {
                this.mBundle.putCharSequence(str, charSequence);
                return this;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("The ");
                sb.append(str);
                sb.append(" key cannot be used to put a CharSequence");
                throw new IllegalArgumentException(sb.toString());
            }
        }

        public Builder setExtras(@Nullable Bundle bundle) {
            this.mBundle.putBundle(MediaMetadata2.METADATA_KEY_EXTRAS, bundle);
            return this;
        }
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    @Retention(RetentionPolicy.SOURCE)
    public @interface FloatKey {
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    @Retention(RetentionPolicy.SOURCE)
    public @interface LongKey {
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    @Retention(RetentionPolicy.SOURCE)
    public @interface RatingKey {
    }

    @RestrictTo({Scope.LIBRARY_GROUP})
    @Retention(RetentionPolicy.SOURCE)
    public @interface TextKey {
    }

    static {
        METADATA_KEYS_TYPE.put("android.media.metadata.TITLE", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.ARTIST", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.DURATION", Integer.valueOf(0));
        METADATA_KEYS_TYPE.put("android.media.metadata.ALBUM", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.AUTHOR", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.WRITER", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.COMPOSER", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.COMPILATION", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.DATE", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.YEAR", Integer.valueOf(0));
        METADATA_KEYS_TYPE.put("android.media.metadata.GENRE", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.TRACK_NUMBER", Integer.valueOf(0));
        METADATA_KEYS_TYPE.put("android.media.metadata.NUM_TRACKS", Integer.valueOf(0));
        METADATA_KEYS_TYPE.put("android.media.metadata.DISC_NUMBER", Integer.valueOf(0));
        METADATA_KEYS_TYPE.put("android.media.metadata.ALBUM_ARTIST", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.ART", Integer.valueOf(2));
        METADATA_KEYS_TYPE.put("android.media.metadata.ART_URI", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.ALBUM_ART", Integer.valueOf(2));
        METADATA_KEYS_TYPE.put("android.media.metadata.ALBUM_ART_URI", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.USER_RATING", Integer.valueOf(3));
        METADATA_KEYS_TYPE.put("android.media.metadata.RATING", Integer.valueOf(3));
        METADATA_KEYS_TYPE.put("android.media.metadata.DISPLAY_TITLE", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.DISPLAY_SUBTITLE", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.DISPLAY_DESCRIPTION", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.DISPLAY_ICON", Integer.valueOf(2));
        METADATA_KEYS_TYPE.put("android.media.metadata.DISPLAY_ICON_URI", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.MEDIA_ID", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.MEDIA_URI", Integer.valueOf(1));
        METADATA_KEYS_TYPE.put(METADATA_KEY_RADIO_FREQUENCY, Integer.valueOf(4));
        METADATA_KEYS_TYPE.put(METADATA_KEY_RADIO_PROGRAM_NAME, Integer.valueOf(1));
        METADATA_KEYS_TYPE.put("android.media.metadata.BT_FOLDER_TYPE", Integer.valueOf(0));
        METADATA_KEYS_TYPE.put("android.media.metadata.ADVERTISEMENT", Integer.valueOf(0));
        METADATA_KEYS_TYPE.put("android.media.metadata.DOWNLOAD_STATUS", Integer.valueOf(0));
    }

    MediaMetadata2(Bundle bundle) {
        this.mBundle = new Bundle(bundle);
        this.mBundle.setClassLoader(MediaMetadata2.class.getClassLoader());
    }

    @NonNull
    public static MediaMetadata2 fromBundle(@Nullable Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        return new MediaMetadata2(bundle);
    }

    public boolean containsKey(@NonNull String str) {
        if (str != null) {
            return this.mBundle.containsKey(str);
        }
        throw new IllegalArgumentException("key shouldn't be null");
    }

    @Nullable
    public Bitmap getBitmap(@NonNull String str) {
        if (str != null) {
            try {
                return (Bitmap) this.mBundle.getParcelable(str);
            } catch (Exception e) {
                Log.w(TAG, "Failed to retrieve a key as Bitmap.", e);
                return null;
            }
        } else {
            throw new IllegalArgumentException("key shouldn't be null");
        }
    }

    @Nullable
    public Bundle getExtras() {
        try {
            return this.mBundle.getBundle(METADATA_KEY_EXTRAS);
        } catch (Exception e) {
            Log.w(TAG, "Failed to retrieve an extra");
            return null;
        }
    }

    public float getFloat(@NonNull String str) {
        if (str != null) {
            return this.mBundle.getFloat(str);
        }
        throw new IllegalArgumentException("key shouldn't be null");
    }

    public long getLong(@NonNull String str) {
        if (str != null) {
            return this.mBundle.getLong(str, 0);
        }
        throw new IllegalArgumentException("key shouldn't be null");
    }

    @Nullable
    public String getMediaId() {
        return getString("android.media.metadata.MEDIA_ID");
    }

    @Nullable
    public Rating2 getRating(@NonNull String str) {
        if (str != null) {
            try {
                return Rating2.fromBundle(this.mBundle.getBundle(str));
            } catch (Exception e) {
                Log.w(TAG, "Failed to retrieve a key as Rating.", e);
                return null;
            }
        } else {
            throw new IllegalArgumentException("key shouldn't be null");
        }
    }

    @Nullable
    public String getString(@NonNull String str) {
        if (str != null) {
            CharSequence charSequence = this.mBundle.getCharSequence(str);
            if (charSequence != null) {
                return charSequence.toString();
            }
            return null;
        }
        throw new IllegalArgumentException("key shouldn't be null");
    }

    @Nullable
    public CharSequence getText(@NonNull String str) {
        if (str != null) {
            return this.mBundle.getCharSequence(str);
        }
        throw new IllegalArgumentException("key shouldn't be null");
    }

    @NonNull
    public Set<String> keySet() {
        return this.mBundle.keySet();
    }

    public int size() {
        return this.mBundle.size();
    }

    @NonNull
    public Bundle toBundle() {
        return this.mBundle;
    }
}
