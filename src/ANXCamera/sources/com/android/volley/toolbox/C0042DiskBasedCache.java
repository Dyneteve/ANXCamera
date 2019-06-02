package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.C0018Cache;
import com.android.volley.C0018Cache.Entry;
import com.android.volley.C0036VolleyLog;
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
public class C0042DiskBasedCache implements C0018Cache {
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

        public CacheHeader(String str, Entry entry) {
            this.key = str;
            this.size = (long) entry.data.length;
            this.etag = entry.etag;
            this.serverDate = entry.serverDate;
            this.ttl = entry.ttl;
            this.softTtl = entry.softTtl;
            this.responseHeaders = entry.responseHeaders;
        }

        public static CacheHeader readHeader(InputStream inputStream) throws IOException {
            CacheHeader cacheHeader = new CacheHeader();
            if (C0042DiskBasedCache.readInt(inputStream) == C0042DiskBasedCache.CACHE_MAGIC) {
                cacheHeader.key = C0042DiskBasedCache.readString(inputStream);
                cacheHeader.etag = C0042DiskBasedCache.readString(inputStream);
                if (cacheHeader.etag.equals("")) {
                    cacheHeader.etag = null;
                }
                cacheHeader.serverDate = C0042DiskBasedCache.readLong(inputStream);
                cacheHeader.ttl = C0042DiskBasedCache.readLong(inputStream);
                cacheHeader.softTtl = C0042DiskBasedCache.readLong(inputStream);
                cacheHeader.responseHeaders = C0042DiskBasedCache.readStringStringMap(inputStream);
                return cacheHeader;
            }
            throw new IOException();
        }

        public Entry toCacheEntry(byte[] bArr) {
            Entry entry = new Entry();
            entry.data = bArr;
            entry.etag = this.etag;
            entry.serverDate = this.serverDate;
            entry.ttl = this.ttl;
            entry.softTtl = this.softTtl;
            entry.responseHeaders = this.responseHeaders;
            return entry;
        }

        public boolean writeHeader(OutputStream outputStream) {
            try {
                C0042DiskBasedCache.writeInt(outputStream, C0042DiskBasedCache.CACHE_MAGIC);
                C0042DiskBasedCache.writeString(outputStream, this.key);
                C0042DiskBasedCache.writeString(outputStream, this.etag == null ? "" : this.etag);
                C0042DiskBasedCache.writeLong(outputStream, this.serverDate);
                C0042DiskBasedCache.writeLong(outputStream, this.ttl);
                C0042DiskBasedCache.writeLong(outputStream, this.softTtl);
                C0042DiskBasedCache.writeStringStringMap(this.responseHeaders, outputStream);
                outputStream.flush();
                return true;
            } catch (IOException e) {
                C0036VolleyLog.d("%s", e.toString());
                return false;
            }
        }
    }

    /* renamed from: com.android.volley.toolbox.DiskBasedCache$CountingInputStream */
    private static class CountingInputStream extends FilterInputStream {
        private int bytesRead;

        private CountingInputStream(InputStream inputStream) {
            super(inputStream);
            this.bytesRead = 0;
        }

        public int read() throws IOException {
            int read = super.read();
            if (read != -1) {
                this.bytesRead++;
            }
            return read;
        }

        public int read(byte[] bArr, int i, int i2) throws IOException {
            int read = super.read(bArr, i, i2);
            if (read != -1) {
                this.bytesRead += read;
            }
            return read;
        }
    }

    public C0042DiskBasedCache(File file) {
        this(file, 5242880);
    }

    public C0042DiskBasedCache(File file, int i) {
        this.mEntries = new LinkedHashMap(16, 0.75f, true);
        this.mTotalSize = 0;
        this.mRootDirectory = file;
        this.mMaxCacheSizeInBytes = i;
    }

    private String getFilenameForKey(String str) {
        int length = str.length() / 2;
        String valueOf = String.valueOf(str.substring(0, length).hashCode());
        StringBuilder sb = new StringBuilder();
        sb.append(valueOf);
        sb.append(String.valueOf(str.substring(length).hashCode()));
        return sb.toString();
    }

    private void pruneIfNeeded(int i) {
        long j;
        int i2 = i;
        if (this.mTotalSize + ((long) i2) >= ((long) this.mMaxCacheSizeInBytes)) {
            if (C0036VolleyLog.DEBUG) {
                C0036VolleyLog.v("Pruning old cache entries.", new Object[0]);
            }
            long j2 = this.mTotalSize;
            int i3 = 0;
            long elapsedRealtime = SystemClock.elapsedRealtime();
            Iterator it = this.mEntries.entrySet().iterator();
            while (true) {
                if (!it.hasNext()) {
                    j = j2;
                    break;
                }
                CacheHeader cacheHeader = (CacheHeader) ((Map.Entry) it.next()).getValue();
                if (getFileForKey(cacheHeader.key).delete()) {
                    j = j2;
                    this.mTotalSize -= cacheHeader.size;
                } else {
                    j = j2;
                    C0036VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", cacheHeader.key, getFilenameForKey(cacheHeader.key));
                }
                it.remove();
                i3++;
                if (((float) (this.mTotalSize + ((long) i2))) < ((float) this.mMaxCacheSizeInBytes) * 0.9f) {
                    break;
                }
                j2 = j;
            }
            if (C0036VolleyLog.DEBUG) {
                C0036VolleyLog.v("pruned %d files, %d bytes, %d ms", Integer.valueOf(i3), Long.valueOf(this.mTotalSize - j), Long.valueOf(SystemClock.elapsedRealtime() - elapsedRealtime));
            }
        }
    }

    private void putEntry(String str, CacheHeader cacheHeader) {
        if (!this.mEntries.containsKey(str)) {
            this.mTotalSize += cacheHeader.size;
        } else {
            this.mTotalSize += cacheHeader.size - ((CacheHeader) this.mEntries.get(str)).size;
        }
        this.mEntries.put(str, cacheHeader);
    }

    private static int read(InputStream inputStream) throws IOException {
        int read = inputStream.read();
        if (read != -1) {
            return read;
        }
        throw new EOFException();
    }

    static int readInt(InputStream inputStream) throws IOException {
        return 0 | (read(inputStream) << 0) | (read(inputStream) << 8) | (read(inputStream) << 16) | (read(inputStream) << 24);
    }

    static long readLong(InputStream inputStream) throws IOException {
        return 0 | ((((long) read(inputStream)) & 255) << 0) | ((((long) read(inputStream)) & 255) << 8) | ((((long) read(inputStream)) & 255) << 16) | ((((long) read(inputStream)) & 255) << 24) | ((((long) read(inputStream)) & 255) << 32) | ((((long) read(inputStream)) & 255) << 40) | ((((long) read(inputStream)) & 255) << 48) | ((((long) read(inputStream)) & 255) << 56);
    }

    static String readString(InputStream inputStream) throws IOException {
        return new String(streamToBytes(inputStream, (int) readLong(inputStream)), "UTF-8");
    }

    static Map<String, String> readStringStringMap(InputStream inputStream) throws IOException {
        int readInt = readInt(inputStream);
        Map<String, String> emptyMap = readInt == 0 ? Collections.emptyMap() : new HashMap<>(readInt);
        for (int i = 0; i < readInt; i++) {
            emptyMap.put(readString(inputStream).intern(), readString(inputStream).intern());
        }
        return emptyMap;
    }

    private void removeEntry(String str) {
        CacheHeader cacheHeader = (CacheHeader) this.mEntries.get(str);
        if (cacheHeader != null) {
            this.mTotalSize -= cacheHeader.size;
            this.mEntries.remove(str);
        }
    }

    private static byte[] streamToBytes(InputStream inputStream, int i) throws IOException {
        byte[] bArr = new byte[i];
        int i2 = 0;
        while (i2 < i) {
            int read = inputStream.read(bArr, i2, i - i2);
            int i3 = read;
            if (read == -1) {
                break;
            }
            i2 += i3;
        }
        if (i2 == i) {
            return bArr;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected ");
        sb.append(i);
        sb.append(" bytes, read ");
        sb.append(i2);
        sb.append(" bytes");
        throw new IOException(sb.toString());
    }

    static void writeInt(OutputStream outputStream, int i) throws IOException {
        outputStream.write((i >> 0) & 255);
        outputStream.write((i >> 8) & 255);
        outputStream.write((i >> 16) & 255);
        outputStream.write((i >> 24) & 255);
    }

    static void writeLong(OutputStream outputStream, long j) throws IOException {
        outputStream.write((byte) ((int) (j >>> 0)));
        outputStream.write((byte) ((int) (j >>> 8)));
        outputStream.write((byte) ((int) (j >>> 16)));
        outputStream.write((byte) ((int) (j >>> 24)));
        outputStream.write((byte) ((int) (j >>> 32)));
        outputStream.write((byte) ((int) (j >>> 40)));
        outputStream.write((byte) ((int) (j >>> 48)));
        outputStream.write((byte) ((int) (j >>> 56)));
    }

    static void writeString(OutputStream outputStream, String str) throws IOException {
        byte[] bytes = str.getBytes("UTF-8");
        writeLong(outputStream, (long) bytes.length);
        outputStream.write(bytes, 0, bytes.length);
    }

    static void writeStringStringMap(Map<String, String> map, OutputStream outputStream) throws IOException {
        if (map != null) {
            writeInt(outputStream, map.size());
            for (Map.Entry entry : map.entrySet()) {
                writeString(outputStream, (String) entry.getKey());
                writeString(outputStream, (String) entry.getValue());
            }
            return;
        }
        writeInt(outputStream, 0);
    }

    public synchronized void clear() {
        File[] listFiles = this.mRootDirectory.listFiles();
        if (listFiles != null) {
            for (File delete : listFiles) {
                delete.delete();
            }
        }
        this.mEntries.clear();
        this.mTotalSize = 0;
        C0036VolleyLog.d("Cache cleared.", new Object[0]);
    }

    public synchronized Entry get(String str) {
        CacheHeader cacheHeader = (CacheHeader) this.mEntries.get(str);
        if (cacheHeader == null) {
            return null;
        }
        File fileForKey = getFileForKey(str);
        CountingInputStream countingInputStream = null;
        try {
            countingInputStream = new CountingInputStream(new FileInputStream(fileForKey));
            CacheHeader.readHeader(countingInputStream);
            Entry cacheEntry = cacheHeader.toCacheEntry(streamToBytes(countingInputStream, (int) (fileForKey.length() - ((long) CountingInputStream.access$100(countingInputStream)))));
            try {
                countingInputStream.close();
                return cacheEntry;
            } catch (IOException e) {
            }
        } catch (IOException e2) {
            try {
                C0036VolleyLog.d("%s: %s", fileForKey.getAbsolutePath(), e2.toString());
                remove(str);
                if (countingInputStream != null) {
                    countingInputStream.close();
                }
                return null;
            } finally {
                if (countingInputStream != null) {
                    try {
                        countingInputStream.close();
                    } catch (IOException e3) {
                    }
                }
            }
        }
    }

    public File getFileForKey(String str) {
        return new File(this.mRootDirectory, getFilenameForKey(str));
    }

    /* JADX WARNING: Code restructure failed: missing block: B:8:0x0023, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void initialize() {
        File[] fileArr;
        if (this.mRootDirectory.exists()) {
            File[] listFiles = this.mRootDirectory.listFiles();
            if (listFiles != null) {
                for (File file : listFiles) {
                    FileInputStream fileInputStream = null;
                    try {
                        fileInputStream = new FileInputStream(file);
                        CacheHeader readHeader = CacheHeader.readHeader(fileInputStream);
                        readHeader.size = file.length();
                        putEntry(readHeader.key, readHeader);
                        try {
                            fileInputStream.close();
                        } catch (IOException e) {
                        }
                    } catch (IOException e2) {
                        if (file != null) {
                            try {
                                file.delete();
                            } catch (Throwable th) {
                                if (fileInputStream != null) {
                                    try {
                                        fileInputStream.close();
                                    } catch (IOException e3) {
                                    }
                                }
                                throw th;
                            }
                        }
                        if (fileInputStream != null) {
                            fileInputStream.close();
                        }
                    }
                }
                return;
            }
            return;
        } else if (!this.mRootDirectory.mkdirs()) {
            C0036VolleyLog.e("Unable to create cache dir %s", this.mRootDirectory.getAbsolutePath());
        }
    }

    public synchronized void invalidate(String str, boolean z) {
        Entry entry = get(str);
        if (entry != null) {
            entry.softTtl = 0;
            if (z) {
                entry.ttl = 0;
            }
            put(str, entry);
        }
    }

    public synchronized void put(String str, Entry entry) {
        pruneIfNeeded(entry.data.length);
        File fileForKey = getFileForKey(str);
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(fileForKey);
            CacheHeader cacheHeader = new CacheHeader(str, entry);
            if (cacheHeader.writeHeader(fileOutputStream)) {
                fileOutputStream.write(entry.data);
                fileOutputStream.close();
                putEntry(str, cacheHeader);
            } else {
                fileOutputStream.close();
                C0036VolleyLog.d("Failed to write header for %s", fileForKey.getAbsolutePath());
                throw new IOException();
            }
        } catch (IOException e) {
            if (!fileForKey.delete()) {
                C0036VolleyLog.d("Could not clean up file %s", fileForKey.getAbsolutePath());
            }
        }
    }

    public synchronized void remove(String str) {
        boolean delete = getFileForKey(str).delete();
        removeEntry(str);
        if (!delete) {
            C0036VolleyLog.d("Could not delete cache entry for key=%s, filename=%s", str, getFilenameForKey(str));
        }
    }
}
