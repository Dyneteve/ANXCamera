package com.ss.android.ugc.effectmanager.common.utils;

import android.os.Environment;
import android.text.TextUtils;
import com.ss.android.ugc.effectmanager.common.exception.UnzipException;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class FileUtils {
    public static boolean checkFileExists(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return new File(str).exists();
    }

    public static String combineFilePath(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        if (TextUtils.isEmpty(str)) {
            str = "";
        }
        sb.append(str);
        if (TextUtils.isEmpty(str2)) {
            str2 = "";
        }
        sb.append(str2);
        return sb.toString();
    }

    public static File createFile(String str, boolean z) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        File file = new File(str);
        if (!file.exists()) {
            if (!z) {
                file.mkdirs();
            } else {
                try {
                    File parentFile = file.getParentFile();
                    if (!parentFile.exists()) {
                        parentFile.mkdirs();
                    }
                    file.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return file;
    }

    public static boolean ensureDirExists(File file) {
        if (!file.exists()) {
            file.mkdirs();
        }
        return file.exists();
    }

    /* JADX WARNING: Removed duplicated region for block: B:32:0x0060 A[SYNTHETIC, Splitter:B:32:0x0060] */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x006a A[SYNTHETIC, Splitter:B:37:0x006a] */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x0072 A[SYNTHETIC, Splitter:B:42:0x0072] */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x007c A[SYNTHETIC, Splitter:B:47:0x007c] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static String getFileContent(String str) {
        FileReader fileReader;
        BufferedReader bufferedReader;
        Exception e;
        File file = new File(str);
        if (!checkFileExists(file.getPath())) {
            return "";
        }
        String str2 = "";
        try {
            fileReader = new FileReader(file);
            try {
                bufferedReader = new BufferedReader(fileReader);
                while (true) {
                    try {
                        String readLine = bufferedReader.readLine();
                        if (readLine != null) {
                            StringBuilder sb = new StringBuilder();
                            sb.append(str2);
                            sb.append(readLine);
                            str2 = sb.toString();
                        } else {
                            try {
                                break;
                            } catch (IOException e2) {
                                e2.printStackTrace();
                            }
                        }
                    } catch (Exception e3) {
                        e = e3;
                        try {
                            e.printStackTrace();
                            if (fileReader != null) {
                            }
                            if (bufferedReader != null) {
                            }
                            return str2;
                        } catch (Throwable th) {
                            th = th;
                            if (fileReader != null) {
                            }
                            if (bufferedReader != null) {
                            }
                            throw th;
                        }
                    }
                }
                fileReader.close();
            } catch (Exception e4) {
                e = e4;
                bufferedReader = null;
                e.printStackTrace();
                if (fileReader != null) {
                    try {
                        fileReader.close();
                    } catch (IOException e5) {
                        e5.printStackTrace();
                    }
                }
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
                return str2;
            } catch (Throwable th2) {
                th = th2;
                bufferedReader = null;
                if (fileReader != null) {
                    try {
                        fileReader.close();
                    } catch (IOException e6) {
                        e6.printStackTrace();
                    }
                }
                if (bufferedReader != null) {
                    try {
                        bufferedReader.close();
                    } catch (IOException e7) {
                        e7.printStackTrace();
                    }
                }
                throw th;
            }
            try {
                bufferedReader.close();
            } catch (IOException e8) {
                e8.printStackTrace();
            }
        } catch (Exception e9) {
            fileReader = null;
            e = e9;
            bufferedReader = null;
            e.printStackTrace();
            if (fileReader != null) {
            }
            if (bufferedReader != null) {
            }
            return str2;
        } catch (Throwable th3) {
            th = th3;
            bufferedReader = null;
            fileReader = null;
            if (fileReader != null) {
            }
            if (bufferedReader != null) {
            }
            throw th;
        }
        return str2;
    }

    public static InputStream getFileStream(String str) {
        InputStream inputStream;
        File file = new File(str);
        if (!checkFileExists(file.getPath())) {
            return null;
        }
        try {
            inputStream = new FileInputStream(file);
        } catch (Exception e) {
            e.printStackTrace();
            inputStream = null;
        }
        return inputStream;
    }

    public static boolean isSdcardAvailable() {
        String externalStorageState = Environment.getExternalStorageState();
        return "mounted".equals(externalStorageState) || "mounted_ro".equals(externalStorageState);
    }

    public static boolean isSdcardWritable() {
        try {
            return "mounted".equals(Environment.getExternalStorageState());
        } catch (Exception e) {
            return false;
        }
    }

    public static void removeDir(File file) {
        if (file != null && file.exists() && file.isDirectory()) {
            File[] listFiles = file.listFiles();
            if (listFiles != null && listFiles.length != 0) {
                for (File file2 : listFiles) {
                    if (file2.isDirectory()) {
                        removeDir(file2);
                    } else {
                        file2.delete();
                    }
                }
                file.delete();
            }
        }
    }

    public static void removeDir(String str) {
        removeDir(new File(str));
    }

    public static boolean removeFile(String str) {
        boolean z = false;
        if (!isSdcardWritable() || TextUtils.isEmpty(str)) {
            return false;
        }
        File file = new File(str);
        if (file.exists() && file.canWrite() && file.delete()) {
            z = true;
        }
        return z;
    }

    /* JADX WARNING: type inference failed for: r0v0 */
    /* JADX WARNING: type inference failed for: r1v0, types: [java.util.zip.ZipInputStream] */
    /* JADX WARNING: type inference failed for: r0v1, types: [java.io.BufferedOutputStream] */
    /* JADX WARNING: type inference failed for: r2v0 */
    /* JADX WARNING: type inference failed for: r1v1 */
    /* JADX WARNING: type inference failed for: r0v2 */
    /* JADX WARNING: type inference failed for: r2v1 */
    /* JADX WARNING: type inference failed for: r0v3 */
    /* JADX WARNING: type inference failed for: r1v2 */
    /* JADX WARNING: type inference failed for: r2v2 */
    /* JADX WARNING: type inference failed for: r1v3 */
    /* JADX WARNING: type inference failed for: r1v4, types: [java.util.zip.ZipInputStream] */
    /* JADX WARNING: type inference failed for: r0v4, types: [java.io.BufferedOutputStream] */
    /* JADX WARNING: type inference failed for: r2v4 */
    /* JADX WARNING: type inference failed for: r0v5 */
    /* JADX WARNING: type inference failed for: r2v5 */
    /* JADX WARNING: type inference failed for: r0v6 */
    /* JADX WARNING: type inference failed for: r2v9, types: [java.io.BufferedOutputStream] */
    /* JADX WARNING: type inference failed for: r0v8 */
    /* JADX WARNING: type inference failed for: r0v9 */
    /* JADX WARNING: type inference failed for: r1v5 */
    /* JADX WARNING: type inference failed for: r2v12 */
    /* JADX WARNING: type inference failed for: r1v6 */
    /* JADX WARNING: type inference failed for: r0v10 */
    /* JADX WARNING: type inference failed for: r2v13 */
    /* JADX WARNING: type inference failed for: r0v11 */
    /* JADX WARNING: type inference failed for: r2v14 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v1
  assigns: []
  uses: []
  mth insns count: 94
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x00c0 A[SYNTHETIC, Splitter:B:47:0x00c0] */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00c8 A[Catch:{ IOException -> 0x00c4 }] */
    /* JADX WARNING: Unknown variable types count: 9 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void unZip(String str, String str2) throws UnzipException {
        ? r1;
        ? r2;
        ? r12;
        ? r22;
        ? r0;
        ? r02 = 0;
        try {
            r1 = new ZipInputStream(new BufferedInputStream(new FileInputStream(str)));
            r02 = r02;
            while (true) {
                try {
                    ZipEntry nextEntry = r1.getNextEntry();
                    if (nextEntry != null) {
                        String name = nextEntry.getName();
                        if (nextEntry.isDirectory()) {
                            StringBuilder sb = new StringBuilder();
                            sb.append(str2);
                            sb.append(File.separator);
                            sb.append(name);
                            new File(sb.toString()).mkdirs();
                            r0 = r02;
                        } else {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append(str2);
                            sb2.append(File.separator);
                            sb2.append(name);
                            File file = new File(sb2.toString());
                            if (file.exists()) {
                                file.delete();
                            } else {
                                file.getParentFile().mkdirs();
                            }
                            file.createNewFile();
                            ? bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(file));
                            try {
                                byte[] bArr = new byte[2048];
                                while (true) {
                                    int read = r1.read(bArr);
                                    if (read == -1) {
                                        break;
                                    }
                                    bufferedOutputStream.write(bArr, 0, read);
                                }
                                bufferedOutputStream.flush();
                                bufferedOutputStream.close();
                                r0 = bufferedOutputStream;
                            } catch (IOException e) {
                                e = e;
                                ? r03 = r1;
                                r22 = r2;
                                try {
                                    throw new UnzipException(e.getMessage());
                                } catch (Throwable th) {
                                    th = th;
                                    r12 = r03;
                                    r2 = r22;
                                    r02 = r2;
                                    r1 = r12;
                                    if (r1 != 0) {
                                    }
                                    if (r02 != 0) {
                                    }
                                    throw th;
                                }
                            } catch (Throwable th2) {
                                th = th2;
                                r12 = r1;
                                r2 = bufferedOutputStream;
                                r02 = r2;
                                r1 = r12;
                                if (r1 != 0) {
                                }
                                if (r02 != 0) {
                                }
                                throw th;
                            }
                        }
                        r02 = r0;
                    } else {
                        try {
                            break;
                        } catch (IOException e2) {
                            e2.printStackTrace();
                            return;
                        }
                    }
                } catch (IOException e3) {
                    e = e3;
                    ? r23 = r02;
                    ? r032 = r1;
                    r22 = r23;
                    throw new UnzipException(e.getMessage());
                } catch (Throwable th3) {
                    th = th3;
                    if (r1 != 0) {
                        try {
                            r1.close();
                        } catch (IOException e4) {
                            e4.printStackTrace();
                            throw th;
                        }
                    }
                    if (r02 != 0) {
                        r02.close();
                    }
                    throw th;
                }
            }
            r1.close();
            if (r02 != 0) {
                r02.close();
            }
        } catch (IOException e5) {
            e = e5;
            r22 = 0;
            throw new UnzipException(e.getMessage());
        } catch (Throwable th4) {
            th = th4;
            r1 = 0;
            if (r1 != 0) {
            }
            if (r02 != 0) {
            }
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:32:0x0045 A[SYNTHETIC, Splitter:B:32:0x0045] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void writeToExternal(String str, String str2) {
        synchronized (FileUtils.class) {
            File file = new File(str2);
            if (!file.exists()) {
                createFile(file.getPath(), true);
            }
            FileOutputStream fileOutputStream = null;
            try {
                FileOutputStream fileOutputStream2 = new FileOutputStream(file);
                try {
                    fileOutputStream2.write(str.getBytes());
                    try {
                        fileOutputStream2.close();
                    } catch (IOException e) {
                        e = e;
                    }
                } catch (Exception e2) {
                    e = e2;
                    fileOutputStream = fileOutputStream2;
                } catch (Throwable th) {
                    th = th;
                    fileOutputStream = fileOutputStream2;
                    if (fileOutputStream != null) {
                    }
                    throw th;
                }
            } catch (Exception e3) {
                e = e3;
                try {
                    e.printStackTrace();
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (IOException e4) {
                            e = e4;
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (IOException e5) {
                            e5.printStackTrace();
                        }
                    }
                    throw th;
                }
            }
        }
        e.printStackTrace();
    }
}
