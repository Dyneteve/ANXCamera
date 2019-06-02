package com.android.camera.network.net;

import com.android.camera.log.Log;
import com.android.camera.network.net.base.Cacheable;
import com.android.volley.C0018Cache.Entry;
import com.android.volley.toolbox.C0042DiskBasedCache;
import java.io.File;
import java.util.HashMap;

public class GalleryCache extends C0042DiskBasedCache {
    private static final String TAG = "GalleryCache";

    public GalleryCache(File file, int i) {
        super(file, i);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Network cache path: ");
        sb.append(file.getAbsolutePath());
        Log.d(str, sb.toString());
        initialize();
    }

    public synchronized Entry get(String str) {
        Entry entry;
        entry = super.get(str);
        if (entry != null) {
            HashMap hashMap = new HashMap();
            hashMap.put(Cacheable.HEADER_FROM_CACHE, String.valueOf(true));
            entry.responseHeaders = hashMap;
            Log.d(TAG, String.format("get cache: key %s, isExpired: %s", new Object[]{Integer.valueOf(str.hashCode()), Boolean.valueOf(entry.isExpired())}));
            if (!entry.isExpired()) {
                Log.d(TAG, "cache hit.");
            }
        }
        return entry;
    }

    public synchronized boolean isCacheValid(String str) {
        Entry entry = super.get(str);
        return entry != null && !entry.isExpired();
    }

    @Deprecated
    public synchronized void put(String str, Entry entry) {
    }

    public synchronized void put(String str, byte[] bArr, long j, long j2) {
        Entry entry = new Entry();
        entry.data = bArr;
        entry.ttl = j;
        entry.softTtl = j2;
        super.put(str, entry);
        String str2 = TAG;
        String str3 = "put cache. key %s size %s expires %s";
        Object[] objArr = new Object[3];
        int i = 0;
        objArr[0] = Integer.valueOf(str.hashCode());
        if (bArr != null) {
            i = bArr.length;
        }
        objArr[1] = Integer.valueOf(i);
        objArr[2] = Long.valueOf(j);
        Log.d(str2, String.format(str3, objArr));
    }
}
