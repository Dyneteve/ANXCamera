package com.android.camera.module;

import android.content.Context;
import android.location.Location;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.ParcelFileDescriptor;
import com.android.camera.CameraApplicationDelegate;
import com.android.camera.ExifHelper;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.groupshot.GroupShot;
import com.android.camera.log.Log;
import com.android.camera.storage.SaverCallback;
import com.android.camera.storage.Storage;
import java.io.File;
import java.lang.ref.WeakReference;

public class SaveOutputImageTask extends AsyncTask<Void, Integer, Thumbnail> {
    private static final String TAG = "SaveOutputImageTask";
    private GroupShot mGroupShotInternal;
    private int mHeight;
    private Location mLocation;
    private int mOrientation;
    private WeakReference<SaverCallback> mSaverCallbackWeakReference;
    private volatile long mStartTime;
    private long mTimeTaken;
    private String mTitle;
    private int mWidth;

    public SaveOutputImageTask(SaverCallback saverCallback, long j, Location location, int i, int i2, int i3, String str, GroupShot groupShot) {
        this.mSaverCallbackWeakReference = new WeakReference<>(saverCallback);
        this.mTimeTaken = j;
        this.mLocation = location;
        this.mWidth = i;
        this.mHeight = i2;
        this.mOrientation = i3;
        this.mTitle = str;
        this.mGroupShotInternal = groupShot;
    }

    private void finishGroupShot() {
        this.mGroupShotInternal.clearImages();
        this.mGroupShotInternal.finish();
        this.mGroupShotInternal = null;
    }

    private void saveGroupShotImage(String str) {
        ParcelFileDescriptor parcelFileDescriptor;
        if (!Storage.isUseDocumentMode()) {
            this.mGroupShotInternal.getImageAndSaveJpeg(str);
            ExifHelper.writeExifByFilePath(str, this.mOrientation, LocationManager.instance().getCurrentLocation(), this.mTimeTaken);
            return;
        }
        try {
            parcelFileDescriptor = FileCompat.getParcelFileDescriptor(str, true);
            this.mGroupShotInternal.getImageAndSaveJpeg(parcelFileDescriptor.getFileDescriptor());
            if (parcelFileDescriptor != null) {
                parcelFileDescriptor.close();
            }
        } catch (Exception e) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("open file failed, filePath ");
            sb.append(str);
            Log.e(str2, sb.toString(), e);
        } catch (Throwable th) {
            r1.addSuppressed(th);
        }
        return;
        throw th;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x0168  */
    public Thumbnail doInBackground(Void... voidArr) {
        String str;
        Log.v(TAG, "doInBackground start");
        try {
            int attach_end = this.mGroupShotInternal.attach_end();
            Log.v(TAG, String.format("attach_end() = 0x%08x", new Object[]{Integer.valueOf(attach_end)}));
            if (isCancelled()) {
                return null;
            }
            int baseImage = this.mGroupShotInternal.setBaseImage(0);
            Log.v(TAG, String.format("setBaseImage() = 0x%08x", new Object[]{Integer.valueOf(baseImage)}));
            this.mGroupShotInternal.setBestFace();
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("groupshot attach end & setbestface cost ");
            sb.append(System.currentTimeMillis() - this.mStartTime);
            Log.v(str2, sb.toString());
            str = Storage.generateFilepath(this.mTitle);
            try {
                saveGroupShotImage(str);
                String str3 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("groupshot finish group cost ");
                sb2.append(System.currentTimeMillis() - this.mStartTime);
                sb2.append(", path = ");
                sb2.append(str);
                Log.v(str3, sb2.toString());
                if (isCancelled()) {
                    return null;
                }
                if (Util.sIsDumpOrigJpg) {
                    String substring = str.substring(0, str.lastIndexOf(Storage.JPEG_SUFFIX));
                    new File(substring).mkdirs();
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(substring);
                    sb3.append(File.separator);
                    this.mGroupShotInternal.saveInputImages(sb3.toString());
                }
                if (isCancelled() || isCancelled()) {
                    return null;
                }
                Context androidContext = CameraApplicationDelegate.getAndroidContext();
                Uri addImageForGroupOrPanorama = Storage.addImageForGroupOrPanorama(androidContext, str, this.mOrientation, this.mTimeTaken, this.mLocation, this.mWidth, this.mHeight);
                String str4 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("groupshot insert db cost ");
                sb4.append(System.currentTimeMillis() - this.mStartTime);
                sb4.append(", uri = ");
                sb4.append(addImageForGroupOrPanorama);
                Log.v(str4, sb4.toString());
                SaverCallback saverCallback = (SaverCallback) this.mSaverCallbackWeakReference.get();
                if (saverCallback == null || addImageForGroupOrPanorama == null) {
                    return null;
                }
                saverCallback.notifyNewMediaData(addImageForGroupOrPanorama, this.mTitle, 2);
                Thumbnail createThumbnailFromUri = Thumbnail.createThumbnailFromUri(androidContext.getContentResolver(), addImageForGroupOrPanorama, false);
                String str5 = TAG;
                StringBuilder sb5 = new StringBuilder();
                sb5.append("groupshot asynctask cost ");
                sb5.append(System.currentTimeMillis() - this.mStartTime);
                Log.v(str5, sb5.toString());
                return createThumbnailFromUri;
            } catch (Exception e) {
                e = e;
                String str6 = TAG;
                StringBuilder sb6 = new StringBuilder();
                sb6.append("SaveOutputImageTask exception occurs, ");
                sb6.append(e.getMessage());
                Log.e(str6, sb6.toString());
                if (str != null) {
                }
                return null;
            }
        } catch (Exception e2) {
            e = e2;
            str = null;
            String str62 = TAG;
            StringBuilder sb62 = new StringBuilder();
            sb62.append("SaveOutputImageTask exception occurs, ");
            sb62.append(e.getMessage());
            Log.e(str62, sb62.toString());
            if (str != null) {
                new File(str).delete();
            }
            return null;
        }
    }

    /* access modifiers changed from: protected */
    public void onCancelled() {
        Log.v(TAG, "SaveOutputImageTask onCancelled");
        finishGroupShot();
    }

    /* access modifiers changed from: protected */
    public void onPostExecute(Thumbnail thumbnail) {
        Log.v(TAG, "SaveOutputImageTask onPostExecute");
        SaverCallback saverCallback = (SaverCallback) this.mSaverCallbackWeakReference.get();
        if (saverCallback != null) {
            if (thumbnail == null) {
                Log.e(TAG, "onPostExecute thumbnail is null");
                saverCallback.postHideThumbnailProgressing();
            } else {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onPostExecute thumbnail = ");
                sb.append(thumbnail);
                Log.v(str, sb.toString());
                saverCallback.postUpdateThumbnail(thumbnail, false);
            }
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("groupshot image process cost ");
            sb2.append(System.currentTimeMillis() - this.mStartTime);
            Log.v(str2, sb2.toString());
            finishGroupShot();
        }
    }

    /* access modifiers changed from: protected */
    public void onPreExecute() {
        this.mStartTime = System.currentTimeMillis();
    }
}
