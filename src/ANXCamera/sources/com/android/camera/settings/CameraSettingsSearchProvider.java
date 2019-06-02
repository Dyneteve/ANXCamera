package com.android.camera.settings;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import com.android.camera.CameraSettings;
import com.android.camera.ProximitySensorLock;
import com.android.camera.R;
import com.android.camera.log.Log;
import com.android.camera.settings.SearchContract.SearchResultColumn;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CameraSettingsSearchProvider extends ContentProvider {
    private static final String TAG = "CameraSettingsSearchProvider";

    class RawData {
        String intentAction;
        String intentTargetClass;
        String intentTargetPackage;
        String title;

        public RawData(String str, String str2, String str3, String str4) {
            this.title = str;
            this.intentAction = str2;
            this.intentTargetPackage = str3;
            this.intentTargetClass = str4;
        }
    }

    public int delete(Uri uri, String str, String[] strArr) {
        return 0;
    }

    public String getType(Uri uri) {
        return null;
    }

    public Uri insert(Uri uri, ContentValues contentValues) {
        return null;
    }

    public boolean onCreate() {
        return false;
    }

    public List<RawData> prepareData() {
        Log.d(TAG, "prepare data.");
        ArrayList arrayList = new ArrayList(25);
        if (b.gW()) {
            arrayList.add(Integer.valueOf(R.string.pref_camera_recordlocation_title));
        }
        if (b.gR()) {
            arrayList.add(Integer.valueOf(R.string.pref_camera_sound_title));
        }
        if (ProximitySensorLock.supported()) {
            arrayList.add(Integer.valueOf(R.string.pref_camera_proximity_lock_title));
        }
        arrayList.add(Integer.valueOf(R.string.pref_retain_camera_mode_title));
        if (b.gY()) {
            arrayList.add(Integer.valueOf(R.string.pref_camera_watermark_title));
        }
        if (CameraSettings.isSupportedDualCameraWaterMark()) {
            arrayList.add(Integer.valueOf(R.string.pref_camera_device_watermark_title));
        }
        arrayList.add(Integer.valueOf(R.string.pref_camera_referenceline_title));
        arrayList.add(Integer.valueOf(R.string.pref_camera_focus_shoot_title));
        if (!b.fZ()) {
            arrayList.add(Integer.valueOf(R.string.pref_scan_qrcode_title));
        }
        if (b.gT()) {
            arrayList.add(Integer.valueOf(R.string.pref_camera_long_press_shutter_feature_title));
        }
        if (!b.isPad()) {
            arrayList.add(Integer.valueOf(R.string.pref_camera_picturesize_title_simple_mode));
        }
        arrayList.add(Integer.valueOf(R.string.pref_camera_jpegquality_title));
        arrayList.add(Integer.valueOf(R.string.pref_video_quality_title));
        arrayList.add(Integer.valueOf(R.string.pref_video_encoder_title));
        arrayList.add(Integer.valueOf(R.string.pref_video_time_lapse_frame_interval_title));
        if (b.iu()) {
            arrayList.add(Integer.valueOf(R.string.pref_fingerprint_capture_title));
        }
        arrayList.add(Integer.valueOf(R.string.pref_camera_volumekey_function_title));
        arrayList.add(Integer.valueOf(R.string.pref_camera_antibanding_title));
        arrayList.add(Integer.valueOf(R.string.pref_camera_autoexposure_title));
        arrayList.add(Integer.valueOf(R.string.confirm_restore_title));
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            RawData rawData = new RawData(getContext().getString(((Integer) it.next()).intValue()), "miui.intent.action.CAMERA_SETTINGS", getContext().getPackageName(), "com.android.camera.CameraPreferenceActivity");
            arrayList2.add(rawData);
        }
        return arrayList2;
    }

    public Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        MatrixCursor matrixCursor = new MatrixCursor(SearchContract.SEARCH_RESULT_COLUMNS);
        for (RawData rawData : prepareData()) {
            matrixCursor.newRow().add("title", rawData.title).add(SearchResultColumn.COLUMN_INTENT_ACTION, rawData.intentAction).add(SearchResultColumn.COLUMN_INTENT_TARGET_PACKAGE, rawData.intentTargetPackage).add(SearchResultColumn.COLUMN_INTENT_TARGET_CLASS, rawData.intentTargetClass);
        }
        return matrixCursor;
    }

    public int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        return 0;
    }
}
