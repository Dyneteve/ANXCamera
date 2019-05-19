package com.android.camera.storage;

import android.content.ContentValues;
import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.provider.MediaStore.Video.Media;
import com.android.camera.FileCompat;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.log.Log;
import java.io.File;

public class VideoSaveRequest implements SaveRequest {
    private static final String TAG = "VideoSaveRequest";
    private Context context;
    private ContentValues mContentValues;
    private boolean mIsFinal;
    public Uri mUri;
    private String mVideoPath;
    private SaverCallback saverCallback;

    public VideoSaveRequest(String str, ContentValues contentValues, boolean z) {
        this.mVideoPath = str;
        this.mContentValues = contentValues;
        this.mIsFinal = z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x006a  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private Uri addVideoToMediaStore(String str, ContentValues contentValues) {
        long j;
        Uri uri;
        ParcelFileDescriptor parcelFileDescriptor;
        Uri uri2 = null;
        if (!Storage.isUseDocumentMode()) {
            j = Util.getDuration(str);
            if (0 == j) {
                boolean delete = new File(str).delete();
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("delete invalid video: ");
                sb.append(str);
                sb.append(", deleted : ");
                sb.append(delete);
                Log.e(str2, sb.toString());
                return null;
            }
        } else {
            try {
                parcelFileDescriptor = FileCompat.getParcelFileDescriptor(str, false);
                try {
                    j = Util.getDuration(parcelFileDescriptor.getFileDescriptor());
                    Util.closeSafely(parcelFileDescriptor);
                    FileCompat.removeDocumentFileForPath(str);
                } catch (Exception e) {
                    Util.closeSafely(parcelFileDescriptor);
                    FileCompat.removeDocumentFileForPath(str);
                    j = 0;
                    if (0 == j) {
                    }
                    contentValues.put("_size", Long.valueOf(new File(str).length()));
                    contentValues.put("duration", Long.valueOf(j));
                    long currentTimeMillis = System.currentTimeMillis();
                    uri = this.context.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, contentValues);
                    String str3 = TAG;
                    try {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("addVideoToMediaStore: insert video cost: ");
                        sb2.append(System.currentTimeMillis() - currentTimeMillis);
                        sb2.append("ms");
                        Log.d(str3, sb2.toString());
                        String str4 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("Current video URI: ");
                        sb3.append(uri);
                        Log.d(str4, sb3.toString());
                    } catch (Exception e2) {
                        e = e2;
                        uri2 = uri;
                        try {
                            Log.e(TAG, "failed to add video to media store", e);
                            String str5 = TAG;
                            StringBuilder sb4 = new StringBuilder();
                            sb4.append("Current video URI: ");
                            sb4.append(uri2);
                            Log.d(str5, sb4.toString());
                            uri = uri2;
                            return uri;
                        } catch (Throwable th) {
                            th = th;
                            uri = uri2;
                            StringBuilder sb5 = new StringBuilder();
                            sb5.append("Current video URI: ");
                            sb5.append(uri);
                            Log.d(TAG, sb5.toString());
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        StringBuilder sb52 = new StringBuilder();
                        sb52.append("Current video URI: ");
                        sb52.append(uri);
                        Log.d(TAG, sb52.toString());
                        throw th;
                    }
                    return uri;
                } catch (Throwable th3) {
                    th = th3;
                    Util.closeSafely(parcelFileDescriptor);
                    FileCompat.removeDocumentFileForPath(str);
                    throw th;
                }
            } catch (Exception e3) {
                parcelFileDescriptor = null;
                Util.closeSafely(parcelFileDescriptor);
                FileCompat.removeDocumentFileForPath(str);
                j = 0;
                if (0 == j) {
                }
                contentValues.put("_size", Long.valueOf(new File(str).length()));
                contentValues.put("duration", Long.valueOf(j));
                long currentTimeMillis2 = System.currentTimeMillis();
                uri = this.context.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, contentValues);
                String str32 = TAG;
                StringBuilder sb22 = new StringBuilder();
                sb22.append("addVideoToMediaStore: insert video cost: ");
                sb22.append(System.currentTimeMillis() - currentTimeMillis2);
                sb22.append("ms");
                Log.d(str32, sb22.toString());
                String str42 = TAG;
                StringBuilder sb32 = new StringBuilder();
                sb32.append("Current video URI: ");
                sb32.append(uri);
                Log.d(str42, sb32.toString());
                return uri;
            } catch (Throwable th4) {
                th = th4;
                parcelFileDescriptor = null;
                Util.closeSafely(parcelFileDescriptor);
                FileCompat.removeDocumentFileForPath(str);
                throw th;
            }
            if (0 == j) {
                String str6 = TAG;
                StringBuilder sb6 = new StringBuilder();
                sb6.append("delete invalid video: ");
                sb6.append(str);
                Log.e(str6, sb6.toString());
                FileCompat.deleteFile(str);
                return null;
            }
        }
        contentValues.put("_size", Long.valueOf(new File(str).length()));
        contentValues.put("duration", Long.valueOf(j));
        try {
            long currentTimeMillis22 = System.currentTimeMillis();
            uri = this.context.getContentResolver().insert(Media.EXTERNAL_CONTENT_URI, contentValues);
            String str322 = TAG;
            StringBuilder sb222 = new StringBuilder();
            sb222.append("addVideoToMediaStore: insert video cost: ");
            sb222.append(System.currentTimeMillis() - currentTimeMillis22);
            sb222.append("ms");
            Log.d(str322, sb222.toString());
            String str422 = TAG;
            StringBuilder sb322 = new StringBuilder();
            sb322.append("Current video URI: ");
            sb322.append(uri);
            Log.d(str422, sb322.toString());
        } catch (Exception e4) {
            e = e4;
            Log.e(TAG, "failed to add video to media store", e);
            String str52 = TAG;
            StringBuilder sb42 = new StringBuilder();
            sb42.append("Current video URI: ");
            sb42.append(uri2);
            Log.d(str52, sb42.toString());
            uri = uri2;
            return uri;
        }
        return uri;
    }

    public int getSize() {
        return 0;
    }

    public boolean isFinal() {
        return this.mIsFinal;
    }

    public void onFinish() {
        Log.d(TAG, "onFinish: runnable process finished");
        this.saverCallback.onSaveFinish(getSize());
    }

    public void run() {
        save();
        onFinish();
    }

    public void save() {
        Log.d(TAG, "save video: start");
        String asString = this.mContentValues.getAsString("_data");
        if (!asString.equals(this.mVideoPath)) {
            if (new File(this.mVideoPath).renameTo(new File(asString))) {
                this.mVideoPath = asString;
            } else {
                this.mContentValues.put("_data", this.mVideoPath);
            }
        }
        boolean needThumbnail = this.saverCallback.needThumbnail(isFinal());
        this.mUri = addVideoToMediaStore(this.mVideoPath, this.mContentValues);
        if (this.mUri == null) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("insert MediaProvider failed, attempt to find uri by path, ");
            sb.append(this.mVideoPath);
            Log.w(str, sb.toString());
            this.mUri = MediaProviderUtil.getContentUriFromPath(this.context, this.mVideoPath);
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("save video: media has been stored, Uri: ");
        sb2.append(this.mUri);
        sb2.append(", has thumbnail: ");
        sb2.append(needThumbnail);
        Log.d(str2, sb2.toString());
        if (this.mUri != null) {
            boolean z = true;
            if (needThumbnail) {
                Bitmap createVideoThumbnailBitmap = Thumbnail.createVideoThumbnailBitmap(this.mVideoPath, 512);
                if (createVideoThumbnailBitmap != null) {
                    this.saverCallback.postUpdateThumbnail(Thumbnail.createThumbnail(this.mUri, createVideoThumbnailBitmap, 0, false), true);
                } else {
                    this.saverCallback.postHideThumbnailProgressing();
                }
            }
            this.saverCallback.notifyNewMediaData(this.mUri, this.mContentValues.getAsString("title"), 21);
            Context context2 = this.context;
            String str3 = this.mVideoPath;
            if (!(this.mContentValues.get("latitude") == null && this.mContentValues.get("longitude") == null)) {
                z = false;
            }
            Storage.saveToCloudAlbum(context2, str3, -1, z);
        } else if (needThumbnail) {
            this.saverCallback.postHideThumbnailProgressing();
        }
        Log.d(TAG, "save video: end");
    }

    public void setContextAndCallback(Context context2, SaverCallback saverCallback2) {
        this.context = context2;
        this.saverCallback = saverCallback2;
    }
}
