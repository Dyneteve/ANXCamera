package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.C0014Cache;
import com.android.volley.C0014Cache.Entry;
import com.android.volley.C0032VolleyLog;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/* renamed from: com.android.volley.toolbox.DiskBasedCache reason: case insensitive filesystem */
public class C0038DiskBasedCache implements C0014Cache {
    private static final int CACHE_MAGIC = 538183203;
    private static final int DEFAULT_DISK_USAGE_BYTES = 5242880;
    private static final float HYSTERESIS_FACTOR = 0.9f;
    private final Map<String, CacheHeader> mEntries;
    private final int mMaxCacheSizeInBytes;
    private final File mRootDirectory;
    private long mTotalSize;

    /* renamed from: com.android.volley.toolbox.DiskBasedCache$CacheHeader */
    static class CacheHeader {
        public String etag;
        public String key;
        public Map<String, String> responseHeaders;
        public long serverDate;
        public long size;
        public long softTtl;
        public long ttl;

        private CacheHeader() {
        }

        public CacheHeader(String key2, Entry entry) {
            this.key = key2;
            this.size = (long) entry.data.length;
            this.etag = entry.etag;
            this.serverDate = entry.serverDate;
            this.ttl = entry.ttl;
            this.softTtl = entry.softTtl;
            this.responseHeaders = entry.responseHeaders;
        }

        public static CacheHeader readHeader(InputStream is) throws IOException {
            CacheHeader entry = new CacheHeader();
            if (C0038DiskBasedCache.readInt(is) == C0038DiskBasedCache.CACHE_MAGIC) {
                entry.key = C0038DiskBasedCache.readString(is);
                entry.etag = C0038DiskBasedCache.readString(is);
                if (entry.etag.equals("")) {
                    entry.etag = null;
                }
                entry.serverDate = C0038DiskBasedCache.readLong(is);
                entry.ttl = C0038DiskBasedCache.readLong(is);
                entry.softTtl = C0038DiskBasedCache.readLong(is);
                entry.responseHeaders = C0038DiskBasedCache.readStringStringMap(is);
                return entry;
            }
            throw new IOException();
        }

        public Entry toCacheEntry(byte[] data) {
            Entry e = new Entry();
            e.data = data;
            e.etag = this.etag;
            e.serverDate = this.serverDate;
            e.ttl = this.ttl;
            e.softTtl = this.softTtl;
            e.responseHeaders = this.responseHeaders;
            return e;
        }

        public boolean writeHeader(OutputStream os) {
            try {
                C0038DiskBasedCache.writeInt(os, C0038DiskBasedCache.CACHE_MAGIC);
                C0038DiskBasedCache.writeString(os, this.key);
                C0038DiskBasedCache.writeString(os, this.etag == null ? "" : this.etag);
                C0038DiskBasedCache.writeLong(os, this.serverDate);
                C0038DiskBasedCache.writeLong(os, this.ttl);
                C0038DiskBasedCache.writeLong(os, this.softTtl);
                C0038DiskBasedCache.writeStringStringMap(this.responseHeaders, os);
                os.flush();
                return true;
            } catch (IOException e) {
                C0032VolleyLog.d("%s", e.toString());
                return false;
            }
        }
    }

    /* renamed from: com.android.volley.toolbox.DiskBasedCache$CountingInputStream */
    private static class CountingInputStream extends FilterInputStream {
        private int bytesRead;

        private CountingInputStream(InputStream in) {
            super(in);
            this.bytesRead = 0;
        }

        public int read() throws IOException {
            int result = super.read();
            if (result != -1) {
                this.bytesRead++;
            }
            return result;
        }

        public int read(byte[] buffer, int offset, int count) throws IOException {
            int result = super.read(buffer, offset, count);
            if (result != -1) {
                this.bytesRead += result;
            }
            return result;
        }
    }

    public C0038DiskBasedCache(File rootDirectory, int maxCacheSizeInBytes) {
        this.mEntries = new LinkedHashMap(16, 0.75f, true);
        this.mTotalSize = 0;
        this.mRootDirectory = rootDirectory;
        this.mMaxCacheSizeInBytes = maxCacheSizeInBytes;
    }

    public C0038DiskBasedCache(File rootDirectory) {
        this(rootDirectory, 5242880);
    }

    public synchronized void clear() {
        File[] files = this.mRootDirectory.listFiles();
        if (files != null) {
            for (File file : files) {
                file.delete();
            }
        }
        this.mEntries.clear();
        this.mTotalSize = 0;
        C0032VolleyLog.d("Cache cleared.", new Object[0]);
    }

    /* Debug info: failed to restart local var, previous not found, register: 9 */
    public synchronized Entry get(String key) {
        CacheHeader entry = (CacheHeader) this.mEntries.get(key);
        if (entry == null) {
            return null;
        }
        File file = getFileForKey(key);
        CountingInputStream cis = null;
        try {
            cis = new CountingInputStream(new FileInputStream(file));
            CacheHeader.readHeader(cis);
            Entry cacheEntry = entry.toCacheEntry(streamToBytes(cis, (int) (file.length() - ((long) CountingInputStream.access$100(cis)))));
            try {
                cis.close();
                return cacheEntry;
            } catch (IOException e) {
            }
        } catch (IOException e2) {
            try {
                C0032VolleyLog.d("%s: %s", file.getAbsolutePath(), e2.toString());
                remove(key);
                if (cis != null) {
                    cis.close();
                }
                return null;
            } finally {
                if (cis != null) {
                    try {
                        cis.close();
                    } catch (IOException e3) {
                    }
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:8:0x0023, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void initialize() {
        File[] arr$;
        if (this.mRootDirectory.exists()) {
            File[] files = this.mRootDirectory.listFiles();
            if (files != null) {
                for (File file : files) {
                    FileInputStream fis = null;
                    try {
                        fis = new FileInputStream(file);
                        CacheHeader entry = CacheHeader.readHeader(fis);
                        entry.size = file.length();
                        putEntry(entry.key, entry);
                        try {
                            fis.close();
                        } catch (IOException e) {
                        }
                    } catch (IOException e2) {
                        if (file != null) {
                            try {
                                file.delete();
                            } catch (Throwable th) {
                                if (fis != null) {
                                    try {
                                        fis.close();
                                    } catch (IOException e3) {
                                    }
                                }
                                throw th;
                            }
                        }
                        if (fis != null) {
                            fis.close();
                        }
                    }
                }
                return;
            }
            return;
        } else if (!this.mRootDirectory.mkdirs()) {
            C0032VolleyLog.e("Unable to create cache dir %s", this.mRootDirectory.getAbsolutePath());
        }
    }

    public synchronized void invalidate(String key, boolean fullExpire) {
        Entry entry = get(key);
        if (entry != null) {
            entry.softTtl = 0;
            if (fullExpire) {
                entry.ttl = 0;
            }
            put(key, entry);
        }
    }

    public synchronized void put(String key, Entry entry) {
        pruneIfNeeded(entry.data.length);
        File file = getFileForKey(key);
        try {
            FileOutputStream fos = new FileOutputStream(file);
            CacheHeader e = new CacheHeader(key, entry);
            if (e.writeHeader(fos)) {
                fos.write(entry.data);
                fos.close();
                putEntry(key, e);
            } else {
                fos.close();
                C0032VolleyLog.d("Failed to write header for %s", file.getAbsolutePath());
                throw new IOException();
            }
        } catch (IOException e2) {
            if (!file.delete()) {
                C0032VolleyLog.d("Could not clean up file %s", file.getAbsolutePath());
            }
        }
    }

    public synchronized void remove(String key) {
        boolean deleted = getFileForKey(key).delete();
        removeEntry(key);
        if (!deleted) {
            C0032VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", key, getFilenameForKey(key));
        }
    }

    private String getFilenameForKey(String key) {
        int firstHalfLength = key.length() / 2;
        String localFilename = String.valueOf(key.substring(0, firstHalfLength).hashCode());
        StringBuilder sb = new StringBuilder();
        sb.append(localFilename);
        sb.append(String.valueOf(key.substring(firstHalfLength).hashCode()));
        return sb.toString();
    }

    public File getFileForKey(String key) {
        return new File(this.mRootDirectory, getFilenameForKey(key));
    }

    private void pruneIfNeeded(int neededSpace) {
        long before;
        int i = neededSpace;
        if (this.mTotalSize + ((long) i) >= ((long) this.mMaxCacheSizeInBytes)) {
            if (C0032VolleyLog.DEBUG) {
                C0032VolleyLog.v("Pruning old cache entries.", new Object[0]);
            }
            long before2 = this.mTotalSize;
            int prunedFiles = 0;
            long startTime = SystemClock.elapsedRealtime();
            Iterator<Map.Entry<String, CacheHeader>> iterator = this.mEntries.entrySet().iterator();
            while (true) {
                if (!iterator.hasNext()) {
                    before = before2;
                    break;
                }
                CacheHeader e = (CacheHeader) ((Map.Entry) iterator.next()).getValue();
                if (getFileForKey(e.key).delete()) {
                    before = before2;
                    this.mTotalSize -= e.size;
                } else {
                    before = before2;
                    C0032VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", e.key, getFilenameForKey(e.key));
                }
                iterator.remove();
                prunedFiles++;
                if (((float) (this.mTotalSize + ((long) i))) < ((float) this.mMaxCacheSizeInBytes) * 0.9f) {
                    break;
                }
                before2 = before;
            }
            if (C0032VolleyLog.DEBUG) {
                C0032VolleyLog.v("pruned %d files, %d bytes, %d ms", Integer.valueOf(prunedFiles), Long.valueOf(this.mTotalSize - before), Long.valueOf(SystemClock.elapsedRealtime() - startTime));
            }
        }
    }

    private void putEntry(String key, CacheHeader entry) {
        if (!this.mEntries.containsKey(key)) {
            this.mTotalSize += entry.size;
        } else {
            this.mTotalSize += entry.size - ((CacheHeader) this.mEntries.get(key)).size;
        }
        this.mEntries.put(key, entry);
    }

    private void removeEntry(String key) {
        CacheHeader entry = (CacheHeader) this.mEntries.get(key);
        if (entry != null) {
            this.mTotalSize -= entry.size;
            this.mEntries.remove(key);
        }
    }

    private static byte[] streamToBytes(InputStream in, int length) throws IOException {
        byte[] bytes = new byte[length];
        int pos = 0;
        while (pos < length) {
            int read = in.read(bytes, pos, length - pos);
            int count = read;
            if (read == -1) {
                break;
            }
            pos += count;
        }
        if (pos == length) {
            return bytes;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected ");
        sb.append(length);
        sb.append(" bytes, read ");
        sb.append(pos);
        sb.append(" bytes");
        throw new IOException(sb.toString());
    }

    private static int read(InputStream is) throws IOException {
        int b = is.read();
        if (b != -1) {
            return b;
        }
        throw new EOFException();
    }

    static void writeInt(OutputStream os, int n) throws IOException {
        os.write((n >> 0) & 255);
        os.write((n >> 8) & 255);
        os.write((n >> 16) & 255);
        os.write((n >> 24) & 255);
    }

    static int readInt(InputStream is) throws IOException {
        return 0 | (read(is) << 0) | (read(is) << 8) | (read(is) << 16) | (read(is) << 24);
    }

    static void writeLong(OutputStream os, long n) throws IOException {
        os.write((byte) ((int) (n >>> 0)));
        os.write((byte) ((int) (n >>> 8)));
        os.write((byte) ((int) (n >>> 16)));
        os.write((byte) ((int) (n >>> 24)));
        os.write((byte) ((int) (n >>> 32)));
        os.write((byte) ((int) (n >>> 40)));
        os.write((byte) ((int) (n >>> 48)));
        os.write((byte) ((int) (n >>> 56)));
    }

    static long readLong(InputStream is) throws IOException {
        return 0 | ((((long) read(is)) & 255) << 0) | ((((long) read(is)) & 255) << 8) | ((((long) read(is)) & 255) << 16) | ((((long) read(is)) & 255) << 24) | ((((long) read(is)) & 255) << 32) | ((((long) read(is)) & 255) << 40) | ((((long) read(is)) & 255) << 48) | ((((long) read(is)) & 255) << 56);
    }

    static void writeString(OutputStream os, String s) throws IOException {
        byte[] b = s.getBytes("UTF-8");
        writeLong(os, (long) b.length);
        os.write(b, 0, b.length);
    }

    static String readString(InputStream is) throws IOException {
        return new String(streamToBytes(is, (int) readLong(is)), "UTF-8");
    }

    static void writeStringStringMap(Map<String, String> map, OutputStream os) throws IOException {
        if (map != null) {
            writeInt(os, map.size());
            for (Map.Entry<String, String> entry : map.entrySet()) {
                writeString(os, (String) entry.getKey());
                writeString(os, (String) entry.getValue());
            }
            return;
        }
        writeInt(os, 0);
    }

    static Map<String, String> readStringStringMap(InputStream is) throws IOException {
        int size = readInt(is);
        Map<String, String> result = size == 0 ? Collections.emptyMap() : new HashMap<>(size);
        for (int i = 0; i < size; i++) {
            result.put(readString(is).intern(), readString(is).intern());
        }
        return result;
    }
}
