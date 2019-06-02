package com.google.android.apps.lens.library.base;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.Cursor;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.util.Log;
import com.google.android.apps.lens.library.base.proto.nano.LensSdkParamsProto.LensSdkParams;
import java.lang.ref.SoftReference;
import java.util.ArrayList;
import java.util.List;

public class LensSdkParamsReader {
    public static final String AGSA_AUTHORITY = "com.google.android.googlequicksearchbox.GsaPublicContentProvider";
    private static final LensSdkParams DEFAULT_PARAMS = new LensSdkParams();
    public static final String LENS_AR_STICKERS_ACTIVITY = "com.google.vr.apps.ornament.app.MainActivity";
    public static final String LENS_AR_STICKERS_PACKAGE = "com.google.ar.lens";
    public static final String LENS_AVAILABILITY_PROVIDER_URI = String.format("content://%s/publicvalue/lens_oem_availability", new Object[]{AGSA_AUTHORITY});
    private static final String LENS_SDK_VERSION = "0.1.0";
    private static final int MIN_AR_CORE_VERSION = 24;
    private static final String TAG = "LensSdkParamsReader";
    /* access modifiers changed from: private */
    public final List<LensSdkParamsCallback> callbacks;
    /* access modifiers changed from: private */
    public final Context context;
    /* access modifiers changed from: private */
    public LensSdkParams lensSdkParams;
    /* access modifiers changed from: private */
    public boolean lensSdkParamsReady;
    private final PackageManager packageManager;

    public interface LensSdkParamsCallback {
        void onLensSdkParamsAvailable(LensSdkParams lensSdkParams);
    }

    private static class QueryGsaTask extends AsyncTask<Void, Void, Integer> {
        SoftReference<LensSdkParamsReader> mLensSdkParamsReaderRef;

        private QueryGsaTask(LensSdkParamsReader lensSdkParamsReader) {
            this.mLensSdkParamsReaderRef = new SoftReference<>(lensSdkParamsReader);
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Removed duplicated region for block: B:32:0x0070  */
        /* JADX WARNING: Removed duplicated region for block: B:35:0x0076  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public Integer doInBackground(Void... voidArr) {
            Integer num;
            Cursor cursor = null;
            try {
                LensSdkParamsReader lensSdkParamsReader = (LensSdkParamsReader) this.mLensSdkParamsReaderRef.get();
                if (lensSdkParamsReader == null) {
                    return Integer.valueOf(-1);
                }
                Cursor query = lensSdkParamsReader.context.getContentResolver().query(Uri.parse(LensSdkParamsReader.LENS_AVAILABILITY_PROVIDER_URI), null, null, null, null);
                if (query != null) {
                    try {
                        if (query.getCount() != 0) {
                            query.moveToFirst();
                            int parseInt = Integer.parseInt(query.getString(0));
                            if (parseInt > 6) {
                                parseInt = 6;
                            }
                            Integer valueOf = Integer.valueOf(parseInt);
                            if (query != null) {
                                query.close();
                            }
                            return valueOf;
                        }
                    } catch (Exception e) {
                        cursor = query;
                        try {
                            num = Integer.valueOf(4);
                            if (cursor != null) {
                                cursor.close();
                            }
                            return num;
                        } catch (Throwable th) {
                            th = th;
                            if (cursor != null) {
                                cursor.close();
                            }
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        cursor = query;
                        if (cursor != null) {
                        }
                        throw th;
                    }
                }
                Integer valueOf2 = Integer.valueOf(4);
                if (query != null) {
                    query.close();
                }
                num = valueOf2;
                return num;
            } catch (Exception e2) {
                num = Integer.valueOf(4);
                if (cursor != null) {
                }
                return num;
            }
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Integer num) {
            String valueOf = String.valueOf(num);
            LensSdkParamsReader lensSdkParamsReader = (LensSdkParamsReader) this.mLensSdkParamsReaderRef.get();
            if (lensSdkParamsReader != null) {
                String str = LensSdkParamsReader.TAG;
                StringBuilder sb = new StringBuilder(25 + valueOf.length());
                sb.append("Lens availability result:");
                sb.append(valueOf);
                Log.i(str, sb.toString());
                lensSdkParamsReader.lensSdkParams.lensAvailabilityStatus = num.intValue();
                lensSdkParamsReader.lensSdkParamsReady = true;
                for (LensSdkParamsCallback lensSdkParamsCallback : lensSdkParamsReader.callbacks) {
                    if (lensSdkParamsCallback != null) {
                        lensSdkParamsCallback.onLensSdkParamsAvailable(lensSdkParamsReader.lensSdkParams);
                    }
                }
                lensSdkParamsReader.callbacks.clear();
            }
        }
    }

    static {
        DEFAULT_PARAMS.lensSdkVersion = LENS_SDK_VERSION;
        DEFAULT_PARAMS.agsaVersionName = "";
        DEFAULT_PARAMS.lensAvailabilityStatus = -1;
        DEFAULT_PARAMS.arStickersAvailabilityStatus = -1;
    }

    public LensSdkParamsReader(@NonNull Context context2) {
        this(context2, context2.getPackageManager());
    }

    LensSdkParamsReader(@NonNull Context context2, @NonNull PackageManager packageManager2) {
        this.callbacks = new ArrayList();
        this.context = context2;
        this.packageManager = packageManager2;
        updateParams();
    }

    private void updateParams() {
        this.lensSdkParamsReady = false;
        this.lensSdkParams = DEFAULT_PARAMS.clone();
        try {
            PackageInfo packageInfo = this.packageManager.getPackageInfo("com.google.android.googlequicksearchbox", 0);
            if (packageInfo != null) {
                this.lensSdkParams.agsaVersionName = packageInfo.versionName;
            }
        } catch (NameNotFoundException e) {
            Log.e(TAG, "Unable to find agsa package: com.google.android.googlequicksearchbox");
        }
        this.lensSdkParams.arStickersAvailabilityStatus = 1;
        if (VERSION.SDK_INT >= 24) {
            Intent intent = new Intent();
            intent.setClassName("com.google.ar.lens", LENS_AR_STICKERS_ACTIVITY);
            if (this.packageManager.resolveActivity(intent, 0) != null) {
                this.lensSdkParams.arStickersAvailabilityStatus = 0;
            }
        }
        new QueryGsaTask().execute(new Void[0]);
    }

    public String getAgsaVersionName() {
        return this.lensSdkParams.agsaVersionName;
    }

    public int getArStickersAvailability() {
        return this.lensSdkParams.arStickersAvailabilityStatus;
    }

    public String getLensSdkVersion() {
        return this.lensSdkParams.lensSdkVersion;
    }

    public void getParams(@NonNull LensSdkParamsCallback lensSdkParamsCallback) {
        if (this.lensSdkParamsReady) {
            lensSdkParamsCallback.onLensSdkParamsAvailable(this.lensSdkParams);
        } else {
            this.callbacks.add(lensSdkParamsCallback);
        }
    }
}
