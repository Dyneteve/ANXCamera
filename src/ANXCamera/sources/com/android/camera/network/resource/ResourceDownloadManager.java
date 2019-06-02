package com.android.camera.network.resource;

import android.net.Uri;
import android.util.LongSparseArray;
import com.android.camera.log.Log;
import com.android.camera.network.download.GalleryDownloadManager;
import com.android.camera.network.download.GalleryDownloadManager.OnCompleteListener;
import com.android.camera.network.download.Request;
import com.android.camera.network.download.Verifier.Sha1;
import com.android.camera.network.net.BaseGalleryRequest;
import com.android.camera.network.net.base.ErrorCode;
import com.android.camera.network.net.base.ResponseListener;
import com.android.camera.network.resource.RequestContracts.Download;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

public class ResourceDownloadManager {
    private static final String TAG = "ResourceDownloadManager";
    private static ResourceDownloadManager mInstance;
    /* access modifiers changed from: private */
    public LongSparseArray<Integer> mDownloadState = new LongSparseArray<>();
    private List<OnDownloadListener> mListeners = new ArrayList();
    /* access modifiers changed from: private */
    public OnCompleteListener mOnCompleteListener = new OnCompleteListener() {
        public void onRequestComplete(Request request, int i) {
            String str = ResourceDownloadManager.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("download finish ");
            sb.append(i);
            Log.v(str, sb.toString());
            long parseLong = Long.parseLong(request.getTag());
            synchronized (ResourceDownloadManager.this.object) {
                ResourceDownloadManager.this.mDownloadState.remove(parseLong);
            }
            if (i == 0) {
                ResourceDownloadManager.this.dispatchListener(parseLong, 3);
            } else {
                ResourceDownloadManager.this.dispatchListener(parseLong, 4);
            }
        }
    };
    /* access modifiers changed from: private */
    public Object object = new Object();

    private ResourceDownloadManager() {
    }

    /* access modifiers changed from: private */
    public void dispatchListener(long j, int i) {
        for (OnDownloadListener onFinish : this.mListeners) {
            onFinish.onFinish(j, i);
        }
    }

    public static ResourceDownloadManager getInstance() {
        if (mInstance == null) {
            synchronized (ResourceDownloadManager.class) {
                if (mInstance == null) {
                    mInstance = new ResourceDownloadManager();
                }
            }
        }
        return mInstance;
    }

    public void addDownloadListener(OnDownloadListener onDownloadListener) {
        this.mListeners.add(onDownloadListener);
    }

    public void download(Resource resource, DownloadHelper downloadHelper) {
        final long j = resource.id;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("downloading ");
        sb.append(j);
        Log.v(str, sb.toString());
        final File file = new File(downloadHelper.getDownloadPath(resource));
        if (file.exists()) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("file downloaded ");
            sb2.append(file);
            Log.v(str2, sb2.toString());
            dispatchListener(j, 1);
        }
        BaseGalleryRequest baseGalleryRequest = new BaseGalleryRequest(0, Download.URL);
        baseGalleryRequest.addParam("id", String.valueOf(j));
        baseGalleryRequest.execute(new ResponseListener() {
            public void onResponse(Object... objArr) {
                try {
                    JSONObject jSONObject = objArr[0];
                    String string = jSONObject.getString(Download.JSON_KEY_URL);
                    String string2 = jSONObject.getString(Download.JSON_KEY_SHA1);
                    Log.v(ResourceDownloadManager.TAG, String.format("download %s, %s", new Object[]{string, string2}));
                    Request request = new Request(Long.toString(j), Uri.parse(string), file);
                    request.setVerifier(new Sha1(string2));
                    synchronized (this) {
                        ResourceDownloadManager.this.mDownloadState.put(j, Integer.valueOf(2));
                    }
                    GalleryDownloadManager.INSTANCE.enqueue(request, ResourceDownloadManager.this.mOnCompleteListener);
                } catch (JSONException e) {
                    Log.w(ResourceDownloadManager.TAG, (Throwable) e);
                    ResourceDownloadManager.this.dispatchListener(j, 4);
                }
            }

            public void onResponseError(ErrorCode errorCode, String str, Object obj) {
                ResourceDownloadManager.this.dispatchListener(j, 4);
            }
        });
    }

    public int getDownloadState(long j) {
        return ((Integer) this.mDownloadState.get(j, Integer.valueOf(0))).intValue();
    }

    public void removeDownloadListener(OnDownloadListener onDownloadListener) {
        this.mListeners.remove(onDownloadListener);
    }
}
