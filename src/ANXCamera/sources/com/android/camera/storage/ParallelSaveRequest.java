package com.android.camera.storage;

import android.content.ContentUris;
import android.content.Context;
import android.location.Location;
import android.net.Uri;
import android.provider.MediaStore.Images.Media;
import com.android.camera.Exif;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.db.DbRepository;
import com.android.camera.db.element.SaveTask;
import com.android.camera.log.Log;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.PictureInfo;
import com.xiaomi.camera.parallelservice.util.ParallelUtil;

public final class ParallelSaveRequest implements SaveRequest {
    private static final String TAG = ParallelSaveRequest.class.getSimpleName();
    private String mAlgorithmName;
    private Context mContext;
    private byte[] mData;
    private int mImageHeight;
    private int mImageWidth;
    private PictureInfo mInfo;
    private int mJpegRotation;
    private Location mLocation;
    private boolean mNeedThumbnail;
    private String mSavePath;
    private SaverCallback mSaverCallback;
    private int mSize;
    private long mStartTime;

    public ParallelSaveRequest(byte[] bArr, long j, Location location, int i, String str, int i2, int i3, boolean z, String str2, PictureInfo pictureInfo) {
        this.mData = bArr;
        this.mStartTime = j;
        this.mSize = bArr.length;
        this.mLocation = location == null ? null : new Location(location);
        this.mJpegRotation = i;
        this.mSavePath = str;
        this.mImageWidth = i2;
        this.mImageHeight = i3;
        this.mNeedThumbnail = z;
        this.mAlgorithmName = str2;
        this.mInfo = pictureInfo;
    }

    public int getSize() {
        return this.mSize;
    }

    public boolean isFinal() {
        return true;
    }

    public void onFinish() {
        PerformanceTracker.trackImageSaver(this.mData, 1);
        this.mData = null;
        this.mSaverCallback.onSaveFinish(this.mSize);
    }

    public void run() {
        save();
        onFinish();
    }

    public void save() {
        boolean z;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("save: ");
        sb.append(this.mSavePath);
        sb.append(" | ");
        sb.append(this.mStartTime);
        Log.d(str, sb.toString());
        int i = this.mImageWidth;
        int i2 = this.mImageHeight;
        int orientation = Exif.getOrientation(this.mData);
        if ((this.mJpegRotation + orientation) % 180 != 0) {
            int i3 = i2;
            i2 = i;
            i = i3;
        }
        SaveTask itemByPath = DbRepository.dbItemSaveTask().getItemByPath(this.mSavePath);
        if (itemByPath == null || !itemByPath.isValid()) {
            SaveTask saveTask = itemByPath;
            int i4 = i2;
            SaveTask saveTask2 = saveTask;
            long currentTimeMillis = System.currentTimeMillis();
            String fileTitleFromPath = this.mSavePath != null ? Util.getFileTitleFromPath(this.mSavePath) : Util.createJpegName(currentTimeMillis);
            String str2 = fileTitleFromPath;
            int i5 = i4;
            Uri addImage = Storage.addImage(this.mContext, fileTitleFromPath, currentTimeMillis, this.mLocation, orientation, this.mData, i, i4, false, false, false, false, saveTask2 != null, this.mAlgorithmName, this.mInfo);
            if (addImage != null) {
                if (this.mNeedThumbnail) {
                    z = false;
                    Thumbnail createThumbnail = Thumbnail.createThumbnail(this.mData, orientation, Integer.highestOneBit((int) Math.ceil(Math.max((double) i, (double) i5) / 512.0d)), addImage, false);
                    if (createThumbnail != null) {
                        this.mSaverCallback.postUpdateThumbnail(createThumbnail, true);
                    } else {
                        this.mSaverCallback.postHideThumbnailProgressing();
                    }
                } else {
                    z = false;
                }
                this.mSaverCallback.notifyNewMediaData(addImage, str2, 2);
                if (saveTask2 != null) {
                    String str3 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("algo mark: ");
                    sb2.append(addImage.toString());
                    Log.d(str3, sb2.toString());
                    saveTask2.setMediaStoreId(Long.valueOf(ContentUris.parseId(addImage)));
                    ParallelUtil.markTaskFinish(this.mContext, saveTask2, z);
                    return;
                }
                return;
            }
            return;
        }
        String fileTitleFromPath2 = Util.getFileTitleFromPath(this.mSavePath);
        Uri resultUri = ParallelUtil.getResultUri(itemByPath.getMediaStoreId().longValue());
        String str4 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("algo mark: uri: ");
        sb3.append(resultUri.toString());
        sb3.append(" | ");
        sb3.append(itemByPath.getPath());
        Log.d(str4, sb3.toString());
        String str5 = TAG;
        StringBuilder sb4 = new StringBuilder();
        sb4.append("algo mark: ");
        sb4.append(this.mJpegRotation);
        sb4.append(" | ");
        sb4.append(i);
        sb4.append(" | ");
        sb4.append(i2);
        sb4.append(" | ");
        sb4.append(orientation);
        Log.d(str5, sb4.toString());
        Uri withAppendedId = ContentUris.withAppendedId(Media.EXTERNAL_CONTENT_URI, itemByPath.getMediaStoreId().longValue());
        int i6 = i2;
        SaveTask saveTask3 = itemByPath;
        Storage.updateImageWithExtraExif(this.mContext, this.mData, null, withAppendedId, fileTitleFromPath2, this.mLocation, orientation, i, i6, null, false, false, this.mAlgorithmName, this.mInfo);
        ParallelUtil.markTaskFinish(this.mContext, saveTask3, false);
    }

    public void setContextAndCallback(Context context, SaverCallback saverCallback) {
        this.mContext = context;
        this.mSaverCallback = saverCallback;
    }
}
