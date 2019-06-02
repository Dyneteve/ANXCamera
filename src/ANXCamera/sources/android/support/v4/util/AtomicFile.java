package android.support.v4.util;

import android.util.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class AtomicFile {
    private final File mBackupName;
    private final File mBaseName;

    public AtomicFile(File file) {
        this.mBaseName = file;
        StringBuilder sb = new StringBuilder();
        sb.append(file.getPath());
        sb.append(".bak");
        this.mBackupName = new File(sb.toString());
    }

    static boolean sync(FileOutputStream fileOutputStream) {
        if (fileOutputStream != null) {
            try {
                fileOutputStream.getFD().sync();
            } catch (IOException e) {
                return false;
            }
        }
        return true;
    }

    public void delete() {
        this.mBaseName.delete();
        this.mBackupName.delete();
    }

    public void failWrite(FileOutputStream fileOutputStream) {
        if (fileOutputStream != null) {
            sync(fileOutputStream);
            try {
                fileOutputStream.close();
                this.mBaseName.delete();
                this.mBackupName.renameTo(this.mBaseName);
            } catch (IOException e) {
                Log.w("AtomicFile", "failWrite: Got exception:", e);
            }
        }
    }

    public void finishWrite(FileOutputStream fileOutputStream) {
        if (fileOutputStream != null) {
            sync(fileOutputStream);
            try {
                fileOutputStream.close();
                this.mBackupName.delete();
            } catch (IOException e) {
                Log.w("AtomicFile", "finishWrite: Got exception:", e);
            }
        }
    }

    public File getBaseFile() {
        return this.mBaseName;
    }

    public FileInputStream openRead() throws FileNotFoundException {
        if (this.mBackupName.exists()) {
            this.mBaseName.delete();
            this.mBackupName.renameTo(this.mBaseName);
        }
        return new FileInputStream(this.mBaseName);
    }

    public byte[] readFully() throws IOException {
        FileInputStream openRead = openRead();
        int i = 0;
        try {
            byte[] bArr = new byte[openRead.available()];
            while (true) {
                int read = openRead.read(bArr, i, bArr.length - i);
                if (read <= 0) {
                    return bArr;
                }
                i += read;
                int available = openRead.available();
                if (available > bArr.length - i) {
                    byte[] bArr2 = new byte[(i + available)];
                    System.arraycopy(bArr, 0, bArr2, 0, i);
                    bArr = bArr2;
                }
            }
        } finally {
            openRead.close();
        }
    }

    public FileOutputStream startWrite() throws IOException {
        if (this.mBaseName.exists()) {
            if (this.mBackupName.exists()) {
                this.mBaseName.delete();
            } else if (!this.mBaseName.renameTo(this.mBackupName)) {
                StringBuilder sb = new StringBuilder();
                sb.append("Couldn't rename file ");
                sb.append(this.mBaseName);
                sb.append(" to backup file ");
                sb.append(this.mBackupName);
                Log.w("AtomicFile", sb.toString());
            }
        }
        try {
            return new FileOutputStream(this.mBaseName);
        } catch (FileNotFoundException e) {
            if (this.mBaseName.getParentFile().mkdir()) {
                try {
                    return new FileOutputStream(this.mBaseName);
                } catch (FileNotFoundException e2) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Couldn't create ");
                    sb2.append(this.mBaseName);
                    throw new IOException(sb2.toString());
                }
            } else {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Couldn't create directory ");
                sb3.append(this.mBaseName);
                throw new IOException(sb3.toString());
            }
        }
    }
}
