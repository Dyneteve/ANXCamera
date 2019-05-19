package com.bumptech.glide.a;

import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map.Entry;
import java.util.concurrent.Callable;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* compiled from: DiskLruCache */
public final class a implements Closeable {
    static final long ANY_SEQUENCE_NUMBER = -1;
    private static final String CLEAN = "CLEAN";
    private static final String DIRTY = "DIRTY";
    static final String JOURNAL_FILE = "journal";
    static final String JOURNAL_FILE_BACKUP = "journal.bkp";
    static final String JOURNAL_FILE_TEMP = "journal.tmp";
    static final String MAGIC = "libcore.io.DiskLruCache";
    private static final String READ = "READ";
    private static final String REMOVE = "REMOVE";
    static final String VERSION_1 = "1";
    private final int appVersion;
    /* access modifiers changed from: private */
    public Writer bQ;
    final ThreadPoolExecutor bR;
    private final Callable<Void> bS;
    /* access modifiers changed from: private */
    public final File directory;
    private final File journalFile;
    private final File journalFileBackup;
    private final File journalFileTmp;
    private final LinkedHashMap<String, c> lruEntries = new LinkedHashMap<>(0, 0.75f, true);
    private long maxSize;
    private long nextSequenceNumber = 0;
    /* access modifiers changed from: private */
    public int redundantOpCount;
    private long size = 0;
    /* access modifiers changed from: private */
    public final int valueCount;

    /* compiled from: DiskLruCache */
    /* renamed from: com.bumptech.glide.a.a$a reason: collision with other inner class name */
    private static final class C0000a implements ThreadFactory {
        private C0000a() {
        }

        public synchronized Thread newThread(Runnable runnable) {
            Thread thread;
            thread = new Thread(runnable, "glide-disk-lru-cache-thread");
            thread.setPriority(1);
            return thread;
        }
    }

    /* compiled from: DiskLruCache */
    public final class b {
        /* access modifiers changed from: private */
        public final c bU;
        private boolean bV;
        /* access modifiers changed from: private */
        public final boolean[] written;

        private b(c cVar) {
            this.bU = cVar;
            this.written = cVar.readable ? null : new boolean[a.this.valueCount];
        }

        private InputStream i(int i) throws IOException {
            synchronized (a.this) {
                if (this.bU.bW != this) {
                    throw new IllegalStateException();
                } else if (!this.bU.readable) {
                    return null;
                } else {
                    try {
                        FileInputStream fileInputStream = new FileInputStream(this.bU.k(i));
                        return fileInputStream;
                    } catch (FileNotFoundException e) {
                        return null;
                    }
                }
            }
        }

        public void abort() throws IOException {
            a.this.a(this, false);
        }

        public void abortUnlessCommitted() {
            if (!this.bV) {
                try {
                    abort();
                } catch (IOException e) {
                }
            }
        }

        public void commit() throws IOException {
            a.this.a(this, true);
            this.bV = true;
        }

        public String getString(int i) throws IOException {
            InputStream i2 = i(i);
            if (i2 != null) {
                return a.inputStreamToString(i2);
            }
            return null;
        }

        public File j(int i) throws IOException {
            File l;
            synchronized (a.this) {
                if (this.bU.bW == this) {
                    if (!this.bU.readable) {
                        this.written[i] = true;
                    }
                    l = this.bU.l(i);
                    if (!a.this.directory.exists()) {
                        a.this.directory.mkdirs();
                    }
                } else {
                    throw new IllegalStateException();
                }
            }
            return l;
        }

        public void set(int i, String str) throws IOException {
            OutputStreamWriter outputStreamWriter = null;
            try {
                OutputStreamWriter outputStreamWriter2 = new OutputStreamWriter(new FileOutputStream(j(i)), c.UTF_8);
                try {
                    outputStreamWriter2.write(str);
                    c.closeQuietly(outputStreamWriter2);
                } catch (Throwable th) {
                    th = th;
                    outputStreamWriter = outputStreamWriter2;
                    c.closeQuietly(outputStreamWriter);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                c.closeQuietly(outputStreamWriter);
                throw th;
            }
        }
    }

    /* compiled from: DiskLruCache */
    private final class c {
        /* access modifiers changed from: private */
        public b bW;
        File[] cleanFiles;
        File[] dirtyFiles;
        /* access modifiers changed from: private */
        public final String key;
        /* access modifiers changed from: private */
        public final long[] lengths;
        /* access modifiers changed from: private */
        public boolean readable;
        /* access modifiers changed from: private */
        public long sequenceNumber;

        private c(String str) {
            this.key = str;
            this.lengths = new long[a.this.valueCount];
            this.cleanFiles = new File[a.this.valueCount];
            this.dirtyFiles = new File[a.this.valueCount];
            StringBuilder sb = new StringBuilder(str);
            sb.append('.');
            int length = sb.length();
            for (int i = 0; i < a.this.valueCount; i++) {
                sb.append(i);
                this.cleanFiles[i] = new File(a.this.directory, sb.toString());
                sb.append(".tmp");
                this.dirtyFiles[i] = new File(a.this.directory, sb.toString());
                sb.setLength(length);
            }
        }

        private IOException invalidLengths(String[] strArr) throws IOException {
            StringBuilder sb = new StringBuilder();
            sb.append("unexpected journal line: ");
            sb.append(Arrays.toString(strArr));
            throw new IOException(sb.toString());
        }

        /* access modifiers changed from: private */
        public void setLengths(String[] strArr) throws IOException {
            if (strArr.length == a.this.valueCount) {
                int i = 0;
                while (i < strArr.length) {
                    try {
                        this.lengths[i] = Long.parseLong(strArr[i]);
                        i++;
                    } catch (NumberFormatException e) {
                        throw invalidLengths(strArr);
                    }
                }
                return;
            }
            throw invalidLengths(strArr);
        }

        public String Q() throws IOException {
            long[] jArr;
            StringBuilder sb = new StringBuilder();
            for (long j : this.lengths) {
                sb.append(' ');
                sb.append(j);
            }
            return sb.toString();
        }

        public File k(int i) {
            return this.cleanFiles[i];
        }

        public File l(int i) {
            return this.dirtyFiles[i];
        }
    }

    /* compiled from: DiskLruCache */
    public final class d {
        private final File[] bX;
        private final String key;
        private final long[] lengths;
        private final long sequenceNumber;

        private d(String str, long j, File[] fileArr, long[] jArr) {
            this.key = str;
            this.sequenceNumber = j;
            this.bX = fileArr;
            this.lengths = jArr;
        }

        public b R() throws IOException {
            return a.this.a(this.key, this.sequenceNumber);
        }

        public long getLength(int i) {
            return this.lengths[i];
        }

        public String getString(int i) throws IOException {
            return a.inputStreamToString(new FileInputStream(this.bX[i]));
        }

        public File j(int i) {
            return this.bX[i];
        }
    }

    private a(File file, int i, int i2, long j) {
        File file2 = file;
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, 1, 60, TimeUnit.SECONDS, new LinkedBlockingQueue(), new C0000a());
        this.bR = threadPoolExecutor;
        this.bS = new Callable<Void>() {
            /* JADX WARNING: Code restructure failed: missing block: B:11:0x0027, code lost:
                return null;
             */
            /* Code decompiled incorrectly, please refer to instructions dump. */
            public Void call() throws Exception {
                synchronized (a.this) {
                    if (a.this.bQ == null) {
                        return null;
                    }
                    a.this.trimToSize();
                    if (a.this.journalRebuildRequired()) {
                        a.this.rebuildJournal();
                        a.this.redundantOpCount = 0;
                    }
                }
            }
        };
        this.directory = file2;
        this.appVersion = i;
        this.journalFile = new File(file2, JOURNAL_FILE);
        this.journalFileTmp = new File(file2, JOURNAL_FILE_TEMP);
        this.journalFileBackup = new File(file2, JOURNAL_FILE_BACKUP);
        this.valueCount = i2;
        this.maxSize = j;
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x001e, code lost:
        return null;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized b a(String str, long j) throws IOException {
        checkNotClosed();
        c cVar = (c) this.lruEntries.get(str);
        if (j == -1 || (cVar != null && cVar.sequenceNumber == j)) {
            if (cVar == null) {
                cVar = new c(str);
                this.lruEntries.put(str, cVar);
            } else if (cVar.bW != null) {
                return null;
            }
            b bVar = new b(cVar);
            cVar.bW = bVar;
            this.bQ.append(DIRTY);
            this.bQ.append(' ');
            this.bQ.append(str);
            this.bQ.append(10);
            this.bQ.flush();
            return bVar;
        }
    }

    public static a a(File file, int i, int i2, long j) throws IOException {
        if (j <= 0) {
            throw new IllegalArgumentException("maxSize <= 0");
        } else if (i2 > 0) {
            File file2 = new File(file, JOURNAL_FILE_BACKUP);
            if (file2.exists()) {
                File file3 = new File(file, JOURNAL_FILE);
                if (file3.exists()) {
                    file2.delete();
                } else {
                    a(file2, file3, false);
                }
            }
            a aVar = new a(file, i, i2, j);
            if (aVar.journalFile.exists()) {
                try {
                    aVar.readJournal();
                    aVar.processJournal();
                    return aVar;
                } catch (IOException e) {
                    PrintStream printStream = System.out;
                    StringBuilder sb = new StringBuilder();
                    sb.append("DiskLruCache ");
                    sb.append(file);
                    sb.append(" is corrupt: ");
                    sb.append(e.getMessage());
                    sb.append(", removing");
                    printStream.println(sb.toString());
                    aVar.delete();
                }
            }
            file.mkdirs();
            a aVar2 = new a(file, i, i2, j);
            aVar2.rebuildJournal();
            return aVar2;
        } else {
            throw new IllegalArgumentException("valueCount <= 0");
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:43:0x0107, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void a(b bVar, boolean z) throws IOException {
        c a = bVar.bU;
        if (a.bW == bVar) {
            if (z && !a.readable) {
                int i = 0;
                while (i < this.valueCount) {
                    if (!bVar.written[i]) {
                        bVar.abort();
                        StringBuilder sb = new StringBuilder();
                        sb.append("Newly created entry didn't create value for index ");
                        sb.append(i);
                        throw new IllegalStateException(sb.toString());
                    } else if (!a.l(i).exists()) {
                        bVar.abort();
                        return;
                    } else {
                        i++;
                    }
                }
            }
            for (int i2 = 0; i2 < this.valueCount; i2++) {
                File l = a.l(i2);
                if (!z) {
                    c(l);
                } else if (l.exists()) {
                    File k = a.k(i2);
                    l.renameTo(k);
                    long j = a.lengths[i2];
                    long length = k.length();
                    a.lengths[i2] = length;
                    this.size = (this.size - j) + length;
                }
            }
            this.redundantOpCount++;
            a.bW = null;
            if (a.readable || z) {
                a.readable = true;
                this.bQ.append(CLEAN);
                this.bQ.append(' ');
                this.bQ.append(a.key);
                this.bQ.append(a.Q());
                this.bQ.append(10);
                if (z) {
                    long j2 = this.nextSequenceNumber;
                    this.nextSequenceNumber = 1 + j2;
                    a.sequenceNumber = j2;
                }
            } else {
                this.lruEntries.remove(a.key);
                this.bQ.append(REMOVE);
                this.bQ.append(' ');
                this.bQ.append(a.key);
                this.bQ.append(10);
            }
            this.bQ.flush();
            if (this.size > this.maxSize || journalRebuildRequired()) {
                this.bR.submit(this.bS);
            }
        } else {
            throw new IllegalStateException();
        }
    }

    private static void a(File file, File file2, boolean z) throws IOException {
        if (z) {
            c(file2);
        }
        if (!file.renameTo(file2)) {
            throw new IOException();
        }
    }

    private static void c(File file) throws IOException {
        if (file.exists() && !file.delete()) {
            throw new IOException();
        }
    }

    private void checkNotClosed() {
        if (this.bQ == null) {
            throw new IllegalStateException("cache is closed");
        }
    }

    /* access modifiers changed from: private */
    public static String inputStreamToString(InputStream inputStream) throws IOException {
        return c.readFully(new InputStreamReader(inputStream, c.UTF_8));
    }

    /* access modifiers changed from: private */
    public boolean journalRebuildRequired() {
        return this.redundantOpCount >= 2000 && this.redundantOpCount >= this.lruEntries.size();
    }

    private void processJournal() throws IOException {
        c(this.journalFileTmp);
        Iterator it = this.lruEntries.values().iterator();
        while (it.hasNext()) {
            c cVar = (c) it.next();
            int i = 0;
            if (cVar.bW == null) {
                while (i < this.valueCount) {
                    this.size += cVar.lengths[i];
                    i++;
                }
            } else {
                cVar.bW = null;
                while (i < this.valueCount) {
                    c(cVar.k(i));
                    c(cVar.l(i));
                    i++;
                }
                it.remove();
            }
        }
    }

    private void readJournal() throws IOException {
        int i;
        b bVar = new b(new FileInputStream(this.journalFile), c.US_ASCII);
        try {
            String readLine = bVar.readLine();
            String readLine2 = bVar.readLine();
            String readLine3 = bVar.readLine();
            String readLine4 = bVar.readLine();
            String readLine5 = bVar.readLine();
            if (!MAGIC.equals(readLine) || !"1".equals(readLine2) || !Integer.toString(this.appVersion).equals(readLine3) || !Integer.toString(this.valueCount).equals(readLine4) || !"".equals(readLine5)) {
                StringBuilder sb = new StringBuilder();
                sb.append("unexpected journal header: [");
                sb.append(readLine);
                sb.append(", ");
                sb.append(readLine2);
                sb.append(", ");
                sb.append(readLine4);
                sb.append(", ");
                sb.append(readLine5);
                sb.append("]");
                throw new IOException(sb.toString());
            }
            i = 0;
            while (true) {
                readJournalLine(bVar.readLine());
                i++;
            }
        } catch (EOFException e) {
            this.redundantOpCount = i - this.lruEntries.size();
            if (bVar.S()) {
                rebuildJournal();
            } else {
                this.bQ = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.journalFile, true), c.US_ASCII));
            }
            c.closeQuietly(bVar);
        } catch (Throwable th) {
            c.closeQuietly(bVar);
            throw th;
        }
    }

    private void readJournalLine(String str) throws IOException {
        String str2;
        int indexOf = str.indexOf(32);
        if (indexOf != -1) {
            int i = indexOf + 1;
            int indexOf2 = str.indexOf(32, i);
            if (indexOf2 == -1) {
                str2 = str.substring(i);
                if (indexOf == REMOVE.length() && str.startsWith(REMOVE)) {
                    this.lruEntries.remove(str2);
                    return;
                }
            } else {
                str2 = str.substring(i, indexOf2);
            }
            c cVar = (c) this.lruEntries.get(str2);
            if (cVar == null) {
                cVar = new c(str2);
                this.lruEntries.put(str2, cVar);
            }
            if (indexOf2 != -1 && indexOf == CLEAN.length() && str.startsWith(CLEAN)) {
                String[] split = str.substring(indexOf2 + 1).split(" ");
                cVar.readable = true;
                cVar.bW = null;
                cVar.setLengths(split);
            } else if (indexOf2 == -1 && indexOf == DIRTY.length() && str.startsWith(DIRTY)) {
                cVar.bW = new b(cVar);
            } else if (!(indexOf2 == -1 && indexOf == READ.length() && str.startsWith(READ))) {
                StringBuilder sb = new StringBuilder();
                sb.append("unexpected journal line: ");
                sb.append(str);
                throw new IOException(sb.toString());
            }
            return;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("unexpected journal line: ");
        sb2.append(str);
        throw new IOException(sb2.toString());
    }

    /* JADX INFO: finally extract failed */
    /* access modifiers changed from: private */
    public synchronized void rebuildJournal() throws IOException {
        if (this.bQ != null) {
            this.bQ.close();
        }
        BufferedWriter bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.journalFileTmp), c.US_ASCII));
        try {
            bufferedWriter.write(MAGIC);
            bufferedWriter.write("\n");
            bufferedWriter.write("1");
            bufferedWriter.write("\n");
            bufferedWriter.write(Integer.toString(this.appVersion));
            bufferedWriter.write("\n");
            bufferedWriter.write(Integer.toString(this.valueCount));
            bufferedWriter.write("\n");
            bufferedWriter.write("\n");
            for (c cVar : this.lruEntries.values()) {
                if (cVar.bW != null) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("DIRTY ");
                    sb.append(cVar.key);
                    sb.append(10);
                    bufferedWriter.write(sb.toString());
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("CLEAN ");
                    sb2.append(cVar.key);
                    sb2.append(cVar.Q());
                    sb2.append(10);
                    bufferedWriter.write(sb2.toString());
                }
            }
            bufferedWriter.close();
            if (this.journalFile.exists()) {
                a(this.journalFile, this.journalFileBackup, true);
            }
            a(this.journalFileTmp, this.journalFile, false);
            this.journalFileBackup.delete();
            this.bQ = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.journalFile, true), c.US_ASCII));
        } catch (Throwable th) {
            bufferedWriter.close();
            throw th;
        }
    }

    /* access modifiers changed from: private */
    public void trimToSize() throws IOException {
        while (this.size > this.maxSize) {
            remove((String) ((Entry) this.lruEntries.entrySet().iterator().next()).getKey());
        }
    }

    public synchronized void close() throws IOException {
        if (this.bQ != null) {
            Iterator it = new ArrayList(this.lruEntries.values()).iterator();
            while (it.hasNext()) {
                c cVar = (c) it.next();
                if (cVar.bW != null) {
                    cVar.bW.abort();
                }
            }
            trimToSize();
            this.bQ.close();
            this.bQ = null;
        }
    }

    public void delete() throws IOException {
        close();
        c.deleteContents(this.directory);
    }

    public synchronized void flush() throws IOException {
        checkNotClosed();
        trimToSize();
        this.bQ.flush();
    }

    public File getDirectory() {
        return this.directory;
    }

    public synchronized long getMaxSize() {
        return this.maxSize;
    }

    public synchronized boolean isClosed() {
        return this.bQ == null;
    }

    public synchronized d n(String str) throws IOException {
        checkNotClosed();
        c cVar = (c) this.lruEntries.get(str);
        if (cVar == null) {
            return null;
        }
        if (!cVar.readable) {
            return null;
        }
        for (File exists : cVar.cleanFiles) {
            if (!exists.exists()) {
                return null;
            }
        }
        this.redundantOpCount++;
        this.bQ.append(READ);
        this.bQ.append(' ');
        this.bQ.append(str);
        this.bQ.append(10);
        if (journalRebuildRequired()) {
            this.bR.submit(this.bS);
        }
        d dVar = new d(str, cVar.sequenceNumber, cVar.cleanFiles, cVar.lengths);
        return dVar;
    }

    public b o(String str) throws IOException {
        return a(str, -1);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:21:0x008c, code lost:
        return true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x008e, code lost:
        return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean remove(String str) throws IOException {
        checkNotClosed();
        c cVar = (c) this.lruEntries.get(str);
        if (cVar != null) {
            if (cVar.bW == null) {
                for (int i = 0; i < this.valueCount; i++) {
                    File k = cVar.k(i);
                    if (k.exists()) {
                        if (!k.delete()) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("failed to delete ");
                            sb.append(k);
                            throw new IOException(sb.toString());
                        }
                    }
                    this.size -= cVar.lengths[i];
                    cVar.lengths[i] = 0;
                }
                this.redundantOpCount++;
                this.bQ.append(REMOVE);
                this.bQ.append(' ');
                this.bQ.append(str);
                this.bQ.append(10);
                this.lruEntries.remove(str);
                if (journalRebuildRequired()) {
                    this.bR.submit(this.bS);
                }
            }
        }
    }

    public synchronized void setMaxSize(long j) {
        this.maxSize = j;
        this.bR.submit(this.bS);
    }

    public synchronized long size() {
        return this.size;
    }
}
