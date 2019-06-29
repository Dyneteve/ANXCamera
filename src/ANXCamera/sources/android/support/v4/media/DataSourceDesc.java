package android.support.v4.media;

import android.content.Context;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.Preconditions;
import java.io.FileDescriptor;
import java.net.CookieHandler;
import java.net.CookieManager;
import java.net.HttpCookie;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class DataSourceDesc {
    public static final long FD_LENGTH_UNKNOWN = 576460752303423487L;
    private static final long LONG_MAX = 576460752303423487L;
    public static final long POSITION_UNKNOWN = 576460752303423487L;
    public static final int TYPE_CALLBACK = 1;
    public static final int TYPE_FD = 2;
    public static final int TYPE_NONE = 0;
    public static final int TYPE_URI = 3;
    /* access modifiers changed from: private */
    public long mEndPositionMs;
    /* access modifiers changed from: private */
    public FileDescriptor mFD;
    /* access modifiers changed from: private */
    public long mFDLength;
    /* access modifiers changed from: private */
    public long mFDOffset;
    /* access modifiers changed from: private */
    public Media2DataSource mMedia2DataSource;
    /* access modifiers changed from: private */
    public String mMediaId;
    /* access modifiers changed from: private */
    public long mStartPositionMs;
    /* access modifiers changed from: private */
    public int mType;
    /* access modifiers changed from: private */
    public Uri mUri;
    /* access modifiers changed from: private */
    public Context mUriContext;
    /* access modifiers changed from: private */
    public List<HttpCookie> mUriCookies;
    /* access modifiers changed from: private */
    public Map<String, String> mUriHeader;

    public static class Builder {
        private long mEndPositionMs = 576460752303423487L;
        private FileDescriptor mFD;
        private long mFDLength = 576460752303423487L;
        private long mFDOffset = 0;
        private Media2DataSource mMedia2DataSource;
        private String mMediaId;
        private long mStartPositionMs = 0;
        private int mType = 0;
        private Uri mUri;
        private Context mUriContext;
        private List<HttpCookie> mUriCookies;
        private Map<String, String> mUriHeader;

        public Builder() {
        }

        public Builder(@NonNull DataSourceDesc dataSourceDesc) {
            this.mType = dataSourceDesc.mType;
            this.mMedia2DataSource = dataSourceDesc.mMedia2DataSource;
            this.mFD = dataSourceDesc.mFD;
            this.mFDOffset = dataSourceDesc.mFDOffset;
            this.mFDLength = dataSourceDesc.mFDLength;
            this.mUri = dataSourceDesc.mUri;
            this.mUriHeader = dataSourceDesc.mUriHeader;
            this.mUriCookies = dataSourceDesc.mUriCookies;
            this.mUriContext = dataSourceDesc.mUriContext;
            this.mMediaId = dataSourceDesc.mMediaId;
            this.mStartPositionMs = dataSourceDesc.mStartPositionMs;
            this.mEndPositionMs = dataSourceDesc.mEndPositionMs;
        }

        private void resetDataSource() {
            this.mType = 0;
            this.mMedia2DataSource = null;
            this.mFD = null;
            this.mFDOffset = 0;
            this.mFDLength = 576460752303423487L;
            this.mUri = null;
            this.mUriHeader = null;
            this.mUriCookies = null;
            this.mUriContext = null;
        }

        @NonNull
        public DataSourceDesc build() {
            if (this.mType != 1 && this.mType != 2 && this.mType != 3) {
                StringBuilder sb = new StringBuilder();
                sb.append("Illegal type: ");
                sb.append(this.mType);
                throw new IllegalStateException(sb.toString());
            } else if (this.mStartPositionMs <= this.mEndPositionMs) {
                DataSourceDesc dataSourceDesc = new DataSourceDesc();
                dataSourceDesc.mType = this.mType;
                dataSourceDesc.mMedia2DataSource = this.mMedia2DataSource;
                dataSourceDesc.mFD = this.mFD;
                dataSourceDesc.mFDOffset = this.mFDOffset;
                dataSourceDesc.mFDLength = this.mFDLength;
                dataSourceDesc.mUri = this.mUri;
                dataSourceDesc.mUriHeader = this.mUriHeader;
                dataSourceDesc.mUriCookies = this.mUriCookies;
                dataSourceDesc.mUriContext = this.mUriContext;
                dataSourceDesc.mMediaId = this.mMediaId;
                dataSourceDesc.mStartPositionMs = this.mStartPositionMs;
                dataSourceDesc.mEndPositionMs = this.mEndPositionMs;
                return dataSourceDesc;
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Illegal start/end position: ");
                sb2.append(this.mStartPositionMs);
                sb2.append(" : ");
                sb2.append(this.mEndPositionMs);
                throw new IllegalStateException(sb2.toString());
            }
        }

        @NonNull
        public Builder setDataSource(@NonNull Context context, @NonNull Uri uri) {
            Preconditions.checkNotNull(context, "context cannot be null");
            Preconditions.checkNotNull(uri, "uri cannot be null");
            resetDataSource();
            this.mType = 3;
            this.mUri = uri;
            this.mUriContext = context;
            return this;
        }

        @NonNull
        public Builder setDataSource(@NonNull Context context, @NonNull Uri uri, @Nullable Map<String, String> map, @Nullable List<HttpCookie> list) {
            Preconditions.checkNotNull(context, "context cannot be null");
            Preconditions.checkNotNull(uri);
            if (list != null) {
                CookieHandler cookieHandler = CookieHandler.getDefault();
                if (cookieHandler != null && !(cookieHandler instanceof CookieManager)) {
                    throw new IllegalArgumentException("The cookie handler has to be of CookieManager type when cookies are provided.");
                }
            }
            resetDataSource();
            this.mType = 3;
            this.mUri = uri;
            if (map != null) {
                this.mUriHeader = new HashMap(map);
            }
            if (list != null) {
                this.mUriCookies = new ArrayList(list);
            }
            this.mUriContext = context;
            return this;
        }

        @NonNull
        public Builder setDataSource(@NonNull Media2DataSource media2DataSource) {
            Preconditions.checkNotNull(media2DataSource);
            resetDataSource();
            this.mType = 1;
            this.mMedia2DataSource = media2DataSource;
            return this;
        }

        @NonNull
        public Builder setDataSource(@NonNull FileDescriptor fileDescriptor) {
            Preconditions.checkNotNull(fileDescriptor);
            resetDataSource();
            this.mType = 2;
            this.mFD = fileDescriptor;
            return this;
        }

        @NonNull
        public Builder setDataSource(@NonNull FileDescriptor fileDescriptor, long j, long j2) {
            Preconditions.checkNotNull(fileDescriptor);
            if (j < 0) {
                j = 0;
            }
            if (j2 < 0) {
                j2 = 576460752303423487L;
            }
            resetDataSource();
            this.mType = 2;
            this.mFD = fileDescriptor;
            this.mFDOffset = j;
            this.mFDLength = j2;
            return this;
        }

        @NonNull
        public Builder setEndPosition(long j) {
            if (j < 0) {
                j = 576460752303423487L;
            }
            this.mEndPositionMs = j;
            return this;
        }

        @NonNull
        public Builder setMediaId(String str) {
            this.mMediaId = str;
            return this;
        }

        @NonNull
        public Builder setStartPosition(long j) {
            if (j < 0) {
                j = 0;
            }
            this.mStartPositionMs = j;
            return this;
        }
    }

    private DataSourceDesc() {
        this.mType = 0;
        this.mFDOffset = 0;
        this.mFDLength = 576460752303423487L;
        this.mStartPositionMs = 0;
        this.mEndPositionMs = 576460752303423487L;
    }

    public long getEndPosition() {
        return this.mEndPositionMs;
    }

    @Nullable
    public FileDescriptor getFileDescriptor() {
        return this.mFD;
    }

    public long getFileDescriptorLength() {
        return this.mFDLength;
    }

    public long getFileDescriptorOffset() {
        return this.mFDOffset;
    }

    @Nullable
    public Media2DataSource getMedia2DataSource() {
        return this.mMedia2DataSource;
    }

    @Nullable
    public String getMediaId() {
        return this.mMediaId;
    }

    public long getStartPosition() {
        return this.mStartPositionMs;
    }

    public int getType() {
        return this.mType;
    }

    @Nullable
    public Uri getUri() {
        return this.mUri;
    }

    @Nullable
    public Context getUriContext() {
        return this.mUriContext;
    }

    @Nullable
    public List<HttpCookie> getUriCookies() {
        if (this.mUriCookies == null) {
            return null;
        }
        return new ArrayList(this.mUriCookies);
    }

    @Nullable
    public Map<String, String> getUriHeaders() {
        if (this.mUriHeader == null) {
            return null;
        }
        return new HashMap(this.mUriHeader);
    }
}
