package com.android.camera;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Environment;
import android.os.ParcelFileDescriptor;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;
import android.support.v4.provider.DocumentFile;
import android.text.TextUtils;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

public class FileCompat {
    static final FileCompatCommonImpl IMPL_COMMON;
    static final FileCompatOperateImpl IMPL_OPERATE;
    public static final int REQUEST_CODE_OPEN_EXTERNAL_DOCUMENT_PERMISSION = 161;
    public static final String TAG = "FileCompat";

    static class BaseFileCompatImpl implements FileCompatOperateImpl {
        HashMap<String, DocumentFile> mDocumentFileHashMap = new HashMap<>(1);

        BaseFileCompatImpl() {
        }

        /* JADX WARNING: Removed duplicated region for block: B:47:0x0066 A[SYNTHETIC, Splitter:B:47:0x0066] */
        /* JADX WARNING: Removed duplicated region for block: B:51:0x006d A[SYNTHETIC, Splitter:B:51:0x006d] */
        /* JADX WARNING: Removed duplicated region for block: B:58:0x007d A[SYNTHETIC, Splitter:B:58:0x007d] */
        /* JADX WARNING: Removed duplicated region for block: B:62:0x0084 A[SYNTHETIC, Splitter:B:62:0x0084] */
        public boolean copyFile(String str, String str2) {
            OutputStream outputStream;
            FileInputStream fileInputStream = null;
            try {
                FileInputStream fileInputStream2 = new FileInputStream(str);
                try {
                    outputStream = getFileOutputStream(str2, false);
                    if (outputStream == null) {
                        try {
                            fileInputStream2.close();
                        } catch (Exception e) {
                        }
                        if (outputStream != null) {
                            try {
                                outputStream.close();
                            } catch (Exception e2) {
                                Log.w(FileCompat.TAG, "copyFile error", e2);
                            }
                        }
                        return false;
                    }
                    try {
                        byte[] bArr = new byte[4096];
                        while (true) {
                            int read = fileInputStream2.read(bArr);
                            if (read != -1) {
                                outputStream.write(bArr, 0, read);
                            } else {
                                try {
                                    break;
                                } catch (Exception e3) {
                                }
                            }
                        }
                        fileInputStream2.close();
                        if (outputStream != null) {
                            try {
                                outputStream.close();
                            } catch (Exception e4) {
                                Log.w(FileCompat.TAG, "copyFile error", e4);
                            }
                        }
                        return true;
                    } catch (Exception e5) {
                        e = e5;
                        fileInputStream = fileInputStream2;
                        try {
                            Log.w(FileCompat.TAG, "copyFile error", e);
                            if (fileInputStream != null) {
                            }
                            if (outputStream != null) {
                            }
                            return false;
                        } catch (Throwable th) {
                            th = th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        fileInputStream = fileInputStream2;
                        if (fileInputStream != null) {
                        }
                        if (outputStream != null) {
                        }
                        throw th;
                    }
                } catch (Exception e6) {
                    e = e6;
                    outputStream = null;
                    fileInputStream = fileInputStream2;
                    Log.w(FileCompat.TAG, "copyFile error", e);
                    if (fileInputStream != null) {
                    }
                    if (outputStream != null) {
                    }
                    return false;
                } catch (Throwable th3) {
                    th = th3;
                    outputStream = null;
                    fileInputStream = fileInputStream2;
                    if (fileInputStream != null) {
                    }
                    if (outputStream != null) {
                    }
                    throw th;
                }
            } catch (Exception e7) {
                e = e7;
                outputStream = null;
                Log.w(FileCompat.TAG, "copyFile error", e);
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (Exception e8) {
                    }
                }
                if (outputStream != null) {
                    try {
                        outputStream.close();
                    } catch (Exception e9) {
                        Log.w(FileCompat.TAG, "copyFile error", e9);
                    }
                }
                return false;
            } catch (Throwable th4) {
                th = th4;
                outputStream = null;
                if (fileInputStream != null) {
                    try {
                        fileInputStream.close();
                    } catch (Exception e10) {
                    }
                }
                if (outputStream != null) {
                    try {
                        outputStream.close();
                    } catch (Exception e11) {
                        Log.w(FileCompat.TAG, "copyFile error", e11);
                    }
                }
                throw th;
            }
        }

        public boolean createNewFile(String str) {
            try {
                return new File(str).createNewFile();
            } catch (IOException e) {
                Log.w(FileCompat.TAG, "createNewFile error", e);
                return false;
            }
        }

        public String createNewFileFixPath(String str) {
            if (createNewFile(str)) {
                return str;
            }
            return null;
        }

        public FileWrapper createNewFileWrapper(String str) {
            return null;
        }

        public boolean deleteFile(String str) {
            return new File(str).delete();
        }

        public boolean exists(String str) {
            return new File(str).exists();
        }

        public OutputStream getFileOutputStream(String str, boolean z) {
            if (!z && !exists(str)) {
                return null;
            }
            try {
                return new FileOutputStream(new File(str));
            } catch (Exception e) {
                String str2 = FileCompat.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("getFileOutputStream error, path = ");
                sb.append(str);
                Log.w(str2, sb.toString());
                return null;
            }
        }

        public ParcelFileDescriptor getParcelFileDescriptor(String str, boolean z) throws IOException {
            return CameraAppImpl.getAndroidContext().getContentResolver().openFileDescriptor(Uri.fromFile(new File(str)), "rw");
        }

        public boolean mkdirs(String str) {
            return new File(str).mkdirs();
        }

        public void removeDocumentFileForPath(String str) {
            this.mDocumentFileHashMap.remove(str);
        }

        public boolean renameFile(String str, String str2) throws IOException {
            return new File(str).renameTo(new File(str2));
        }
    }

    interface FileCompatCommonImpl {
        String getSDPath(String str);

        boolean getStorageAccessForLOLLIPOP(Activity activity, String str);

        Uri getTreeUri(String str);

        boolean handleActivityResult(Activity activity, int i, int i2, Intent intent);

        boolean hasStoragePermission(String str);

        boolean isExternalSDFile(String str);

        void updateSDPath();
    }

    interface FileCompatOperateImpl {
        boolean copyFile(String str, String str2);

        boolean createNewFile(String str);

        String createNewFileFixPath(String str);

        FileWrapper createNewFileWrapper(String str);

        boolean deleteFile(String str);

        boolean exists(String str);

        OutputStream getFileOutputStream(String str, boolean z);

        ParcelFileDescriptor getParcelFileDescriptor(String str, boolean z) throws IOException;

        boolean mkdirs(String str);

        void removeDocumentFileForPath(String str);

        boolean renameFile(String str, String str2) throws IOException;
    }

    static class FileWrapper {
        DocumentFile documentFile;
        File legacyFile;

        FileWrapper() {
        }

        public long getLength() {
            return this.legacyFile.length();
        }
    }

    static class KitKatFileCompatCommonImpl implements FileCompatCommonImpl {
        protected String accessSDPath;
        protected String[] sdPaths;

        public KitKatFileCompatCommonImpl() {
            update();
        }

        /* access modifiers changed from: protected */
        @TargetApi(19)
        public String[] getExtSDCardPaths() {
            String[] strArr = new String[0];
            ArrayList arrayList = new ArrayList();
            String sdcardPath = CompatibilityUtils.getSdcardPath(CameraAppImpl.getAndroidContext());
            String str = FileCompat.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getExtSDCardPaths: activePath = ");
            sb.append(sdcardPath);
            Log.d(str, sb.toString());
            if (!TextUtils.isEmpty(sdcardPath)) {
                arrayList.add(sdcardPath);
            }
            return !arrayList.isEmpty() ? (String[]) arrayList.toArray(new String[arrayList.size()]) : strArr;
        }

        public String getSDPath(String str) {
            String[] strArr;
            if (this.sdPaths == null) {
                return null;
            }
            for (String str2 : this.sdPaths) {
                if (str.startsWith(str2)) {
                    return str2;
                }
            }
            return null;
        }

        public boolean getStorageAccessForLOLLIPOP(Activity activity, String str) {
            return false;
        }

        public Uri getTreeUri(String str) {
            return null;
        }

        public boolean handleActivityResult(Activity activity, int i, int i2, Intent intent) {
            return false;
        }

        public boolean hasStoragePermission(String str) {
            return true;
        }

        public boolean isExternalSDFile(String str) {
            if (this.sdPaths == null) {
                return false;
            }
            for (String startsWith : this.sdPaths) {
                if (str.startsWith(startsWith)) {
                    return true;
                }
            }
            return false;
        }

        /* access modifiers changed from: protected */
        public void update() {
            this.sdPaths = getExtSDCardPaths();
        }

        public void updateSDPath() {
            update();
        }
    }

    static class LollipopFileCompatCommonImpl extends KitKatFileCompatCommonImpl {
        private static final String SD_PATH_TREE_URI = "sd_path_tree_uri";

        public LollipopFileCompatCommonImpl() {
            update();
        }

        @TargetApi(21)
        public boolean getStorageAccessForLOLLIPOP(Activity activity, String str) {
            String[] extSDCardPaths = getExtSDCardPaths();
            if (extSDCardPaths == null || extSDCardPaths.length == 0) {
                return false;
            }
            int length = extSDCardPaths.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    break;
                }
                String str2 = extSDCardPaths[i];
                if (str.startsWith(str2)) {
                    this.accessSDPath = str2;
                    break;
                }
                i++;
            }
            List storageVolumes = ((StorageManager) activity.getSystemService("storage")).getStorageVolumes();
            if (storageVolumes.size() > 1) {
                Intent createAccessIntent = ((StorageVolume) storageVolumes.get(1)).createAccessIntent(Environment.DIRECTORY_DCIM);
                if (createAccessIntent == null) {
                    Log.w(FileCompat.TAG, "getStorageAccessForLOLLIPOP error, intent is null");
                    return false;
                }
                try {
                    activity.startActivityForResult(createAccessIntent, 161);
                } catch (Exception e) {
                    Log.w(FileCompat.TAG, "getStorageAccessForLOLLIPOP error", e);
                }
            }
            return true;
        }

        public Uri getTreeUri(String str) {
            String string = CameraAppImpl.getAndroidContext().getSharedPreferences(SD_PATH_TREE_URI, 0).getString(str, null);
            if (string == null) {
                return null;
            }
            return Uri.parse(string);
        }

        @TargetApi(19)
        public boolean handleActivityResult(Activity activity, int i, int i2, Intent intent) {
            if (i == 161 && i2 == -1) {
                Uri data = intent.getData();
                if (data == null) {
                    Log.d(FileCompat.TAG, "handleActivityResult: uri is null, documents permission is Failed!");
                    return false;
                } else if (!DocumentFile.fromTreeUri(activity, data).exists()) {
                    Log.d(FileCompat.TAG, "handleActivityResult: documentFile is not exist, documents permission is Failed!");
                    return false;
                } else {
                    try {
                        activity.getContentResolver().takePersistableUriPermission(data, intent.getFlags() & 3);
                        activity.getSharedPreferences(SD_PATH_TREE_URI, 0).edit().putString(this.accessSDPath, data.toString()).apply();
                        return true;
                    } catch (Exception e) {
                        String str = FileCompat.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("cacheUri failed, uri = ");
                        sb.append(data);
                        Log.w(str, sb.toString(), e);
                        update();
                    }
                }
            }
            return false;
        }

        public boolean hasStoragePermission(String str) {
            if (!isExternalSDFile(str)) {
                return true;
            }
            String sDPath = super.getSDPath(str);
            boolean z = false;
            if (sDPath == null || getTreeUri(sDPath) == null) {
                return false;
            }
            DocumentFile fromTreeUri = DocumentFile.fromTreeUri(CameraAppImpl.getAndroidContext(), getTreeUri(sDPath));
            String str2 = FileCompat.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("hasStoragePermission document = ");
            sb.append(fromTreeUri);
            Log.d(str2, sb.toString());
            if (fromTreeUri == null) {
                return false;
            }
            String str3 = FileCompat.TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("hasStoragePermission document = ");
            sb2.append(fromTreeUri.exists());
            sb2.append(", ");
            sb2.append(fromTreeUri.canRead());
            sb2.append(", ");
            sb2.append(fromTreeUri.canWrite());
            Log.d(str3, sb2.toString());
            if (fromTreeUri.exists() && fromTreeUri.canRead() && fromTreeUri.canWrite()) {
                z = true;
            }
            return z;
        }
    }

    static class LollipopFileCompatImpl extends BaseFileCompatImpl {
        LollipopFileCompatImpl() {
        }

        public boolean copyFile(String str, String str2) {
            return super.copyFile(str, str2);
        }

        public boolean createNewFile(String str) {
            boolean z = true;
            if (super.createNewFile(str)) {
                return true;
            }
            if (!FileCompat.isSDFile(str)) {
                return false;
            }
            if (getDocumentFileByPath(str, true, null, false) == null) {
                z = false;
            }
            return z;
        }

        public String createNewFileFixPath(String str) {
            if (super.createNewFile(str)) {
                return str;
            }
            if (!FileCompat.isSDFile(str)) {
                return null;
            }
            DocumentFile documentFileByPath = getDocumentFileByPath(str, true, null, false);
            if (documentFileByPath == null) {
                return null;
            }
            String substring = str.substring(0, str.lastIndexOf(File.separator));
            StringBuilder sb = new StringBuilder();
            sb.append(substring);
            sb.append(File.separator);
            sb.append(documentFileByPath.getName());
            return sb.toString();
        }

        public boolean deleteFile(String str) {
            boolean z = true;
            if (super.deleteFile(str)) {
                return true;
            }
            if (!FileCompat.isSDFile(str)) {
                return false;
            }
            DocumentFile documentFileByPath = getDocumentFileByPath(str, false, null, false);
            if (documentFileByPath != null) {
                z = documentFileByPath.delete();
            }
            removeDocumentFileForPath(str);
            return z;
        }

        public boolean exists(String str) {
            boolean z = true;
            if (super.exists(str)) {
                return true;
            }
            if (!FileCompat.isSDFile(str)) {
                return false;
            }
            if (getDocumentFileByPath(str, false, null, false) == null) {
                z = false;
            }
            return z;
        }

        /* JADX WARNING: Removed duplicated region for block: B:63:0x0180  */
        public DocumentFile getDocumentFileByPath(String str, boolean z, String str2, boolean z2) {
            DocumentFile documentFile;
            String str3;
            DocumentFile documentFile2;
            String str4 = str;
            boolean z3 = z;
            Log.d(FileCompat.TAG, "getDocumentFileByPath start>>");
            String access$000 = FileCompat.getSDPath(str);
            String str5 = null;
            if (access$000 == null) {
                String str6 = FileCompat.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("getDocumentFileByPath: no sd path for ");
                sb.append(str4);
                Log.w(str6, sb.toString());
                return null;
            }
            DocumentFile documentFile3 = (DocumentFile) this.mDocumentFileHashMap.get(str4);
            if (documentFile3 != null) {
                return documentFile3;
            }
            Uri access$100 = FileCompat.getTreeUri(access$000);
            if (access$100 == null) {
                String str7 = FileCompat.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("getDocumentFileByPath: no tree uri for ");
                sb2.append(access$000);
                Log.w(str7, sb2.toString());
                return null;
            }
            DocumentFile fromTreeUri = DocumentFile.fromTreeUri(CameraAppImpl.getAndroidContext(), access$100);
            StringBuilder sb3 = new StringBuilder();
            sb3.append(access$000);
            sb3.append(File.separator);
            sb3.append(Environment.DIRECTORY_DCIM);
            String sb4 = sb3.toString();
            if (str4.equals(sb4)) {
                return fromTreeUri;
            }
            String substring = str4.substring(sb4.length() + 1);
            if (TextUtils.isEmpty(substring)) {
                Log.w(FileCompat.TAG, "getDocumentFileByPath: empty relative path");
                return null;
            }
            StringBuilder sb5 = new StringBuilder();
            sb5.append("\\");
            sb5.append(File.separator);
            String[] split = substring.split(sb5.toString());
            String[] strArr = new String[(split.length - 1)];
            System.arraycopy(split, 0, strArr, 0, split.length - 1);
            DocumentFile documentFile4 = fromTreeUri;
            boolean z4 = false;
            for (String str8 : strArr) {
                if (documentFile4 == null) {
                    break;
                }
                if (z4) {
                    documentFile4 = documentFile4.createDirectory(str8);
                } else {
                    DocumentFile findFile = documentFile4.findFile(str8);
                    if (findFile != null) {
                        documentFile4 = findFile;
                    } else if (z3) {
                        documentFile4 = documentFile4.createDirectory(str8);
                        z4 = true;
                    } else {
                        String str9 = FileCompat.TAG;
                        StringBuilder sb6 = new StringBuilder();
                        sb6.append("getDocumentFileByPath: no document for ");
                        sb6.append(str8);
                        Log.d(str9, sb6.toString());
                        return null;
                    }
                }
            }
            if (documentFile4 == null) {
                String str10 = FileCompat.TAG;
                StringBuilder sb7 = new StringBuilder();
                sb7.append("getDocumentFileByPath: no document for ");
                sb7.append(substring);
                Log.d(str10, sb7.toString());
                return null;
            }
            String str11 = split[split.length - 1];
            String str12 = FileCompat.TAG;
            StringBuilder sb8 = new StringBuilder();
            sb8.append("getDocumentFileByPath: createIfNotFound = ");
            sb8.append(z3);
            Log.d(str12, sb8.toString());
            long currentTimeMillis = System.currentTimeMillis();
            if (!z3) {
                documentFile = documentFile4.findFile(str11);
            } else if (z2) {
                try {
                    documentFile2 = documentFile4.findFile(str11);
                    if (documentFile2 == null) {
                        try {
                            documentFile = documentFile4.createDirectory(str11);
                        } catch (Exception e) {
                            e = e;
                            Log.w(FileCompat.TAG, "createFile error", e);
                            documentFile = documentFile2;
                            if (documentFile != null) {
                            }
                            String str13 = FileCompat.TAG;
                            StringBuilder sb9 = new StringBuilder();
                            sb9.append("getDocumentFileByPath end<< cost time = ");
                            sb9.append(System.currentTimeMillis() - currentTimeMillis);
                            sb9.append(" ms");
                            Log.d(str13, sb9.toString());
                            return documentFile;
                        }
                    } else {
                        documentFile = documentFile2;
                    }
                } catch (Exception e2) {
                    e = e2;
                    documentFile2 = documentFile3;
                    Log.w(FileCompat.TAG, "createFile error", e);
                    documentFile = documentFile2;
                    if (documentFile != null) {
                    }
                    String str132 = FileCompat.TAG;
                    StringBuilder sb92 = new StringBuilder();
                    sb92.append("getDocumentFileByPath end<< cost time = ");
                    sb92.append(System.currentTimeMillis() - currentTimeMillis);
                    sb92.append(" ms");
                    Log.d(str132, sb92.toString());
                    return documentFile;
                }
            } else {
                int indexOf = str11.indexOf(".");
                if (!TextUtils.isEmpty(str2) || indexOf <= 0) {
                    str3 = str2;
                } else {
                    str3 = FileCompat.getMimeTypeFromPath(str11);
                    if (!TextUtils.isEmpty(str3)) {
                        str5 = str11.substring(0, indexOf);
                    }
                }
                if (str5 != null) {
                    str11 = str5;
                }
                try {
                    documentFile = documentFile4.createFile(str3, str11);
                } catch (Exception e3) {
                    Log.w(FileCompat.TAG, "createFile error", e3);
                    documentFile = documentFile3;
                }
            }
            if (documentFile != null) {
                this.mDocumentFileHashMap.put(str4, documentFile);
            }
            String str1322 = FileCompat.TAG;
            StringBuilder sb922 = new StringBuilder();
            sb922.append("getDocumentFileByPath end<< cost time = ");
            sb922.append(System.currentTimeMillis() - currentTimeMillis);
            sb922.append(" ms");
            Log.d(str1322, sb922.toString());
            return documentFile;
        }

        public OutputStream getFileOutputStream(String str, boolean z) {
            OutputStream outputStream;
            if (VERSION.SDK_INT < 28 || !FileCompat.isSDFile(str)) {
                OutputStream fileOutputStream = super.getFileOutputStream(str, z);
                if (fileOutputStream != null) {
                    return fileOutputStream;
                }
            }
            if (!FileCompat.isSDFile(str)) {
                return null;
            }
            DocumentFile documentFileByPath = getDocumentFileByPath(str, z, null, false);
            if (documentFileByPath != null) {
                try {
                    outputStream = CameraAppImpl.getAndroidContext().getContentResolver().openOutputStream(documentFileByPath.getUri());
                } catch (FileNotFoundException e) {
                    Log.w(FileCompat.TAG, "getFileOutputStream error", e);
                    return null;
                }
            } else {
                outputStream = null;
            }
            return outputStream;
        }

        public ParcelFileDescriptor getParcelFileDescriptor(String str, boolean z) throws IOException {
            if (!FileCompat.isSDFile(str)) {
                return super.getParcelFileDescriptor(str, z);
            }
            return CameraAppImpl.getAndroidContext().getContentResolver().openFileDescriptor(getDocumentFileByPath(str, z, FileCompat.getMimeTypeFromPath(str), false).getUri(), "rw");
        }

        public boolean mkdirs(String str) {
            boolean z = true;
            if (super.mkdirs(str)) {
                return true;
            }
            if (!FileCompat.isSDFile(str)) {
                return false;
            }
            if (getDocumentFileByPath(str, true, null, true) == null) {
                z = false;
            }
            return z;
        }

        public boolean renameFile(String str, String str2) throws IOException {
            if (super.renameFile(str, str2)) {
                return true;
            }
            if (!new File(str).getParent().equalsIgnoreCase(new File(str2).getParent())) {
                Log.w(FileCompat.TAG, "only support rename to the same folder");
                return false;
            }
            String name = new File(str2).getName();
            DocumentFile documentFileByPath = getDocumentFileByPath(str, false, null, false);
            if (documentFileByPath == null) {
                Log.w(FileCompat.TAG, "renameFile: null document");
                return false;
            }
            try {
                return documentFileByPath.renameTo(name);
            } catch (Exception e) {
                StringBuilder sb = new StringBuilder();
                sb.append("renameFile error, path = ");
                sb.append(str);
                throw new IOException(sb.toString(), e);
            }
        }
    }

    static class MarshmallowFileCompatImpl extends LollipopFileCompatImpl {
        MarshmallowFileCompatImpl() {
        }
    }

    static {
        if (VERSION.SDK_INT >= 28) {
            IMPL_COMMON = new LollipopFileCompatCommonImpl();
            IMPL_OPERATE = new MarshmallowFileCompatImpl();
            return;
        }
        IMPL_COMMON = new KitKatFileCompatCommonImpl();
        IMPL_OPERATE = new BaseFileCompatImpl();
    }

    public static boolean copyFile(String str, String str2) {
        return IMPL_OPERATE.copyFile(str, str2);
    }

    public static boolean createNewFile(String str) {
        return IMPL_OPERATE.createNewFile(str);
    }

    public static String createNewFileFixPath(String str) {
        return IMPL_OPERATE.createNewFileFixPath(str);
    }

    public static boolean deleteFile(String str) {
        return IMPL_OPERATE.deleteFile(str);
    }

    public static boolean exists(String str) {
        return IMPL_OPERATE.exists(str);
    }

    public static OutputStream getFileOutputStream(String str, boolean z) {
        return IMPL_OPERATE.getFileOutputStream(str, z);
    }

    /* access modifiers changed from: private */
    public static String getMimeTypeFromPath(String str) {
        int lastIndexOf = str.lastIndexOf(".");
        if (lastIndexOf < 0) {
            return null;
        }
        String lowerCase = str.substring(lastIndexOf + 1).toLowerCase(Locale.ENGLISH);
        if ("jpg".equals(lowerCase) || "jpeg".equals(lowerCase)) {
            return "image/jpeg";
        }
        if ("png".equals(lowerCase)) {
            return "image/png";
        }
        if ("mp4".equals(lowerCase)) {
            return "video/mp4";
        }
        return null;
    }

    public static ParcelFileDescriptor getParcelFileDescriptor(String str, boolean z) throws IOException {
        return IMPL_OPERATE.getParcelFileDescriptor(str, z);
    }

    /* access modifiers changed from: private */
    public static String getSDPath(String str) {
        return IMPL_COMMON.getSDPath(str);
    }

    @TargetApi(21)
    public static boolean getStorageAccessForLOLLIPOP(Activity activity, String str) {
        return IMPL_COMMON.getStorageAccessForLOLLIPOP(activity, str);
    }

    /* access modifiers changed from: private */
    public static Uri getTreeUri(String str) {
        return IMPL_COMMON.getTreeUri(str);
    }

    @TargetApi(21)
    public static boolean handleActivityResult(Activity activity, int i, int i2, Intent intent) {
        return IMPL_COMMON.handleActivityResult(activity, i, i2, intent);
    }

    @TargetApi(21)
    public static boolean hasStoragePermission(String str) {
        return IMPL_COMMON.hasStoragePermission(str);
    }

    @TargetApi(19)
    public static boolean isSDFile(String str) {
        return IMPL_COMMON.isExternalSDFile(str);
    }

    public static boolean mkdirs(String str) {
        return IMPL_OPERATE.mkdirs(str);
    }

    public static void removeDocumentFileForPath(String str) {
        IMPL_OPERATE.removeDocumentFileForPath(str);
    }

    public static boolean renameFile(String str, String str2) throws IOException {
        return IMPL_OPERATE.renameFile(str, str2);
    }

    @TargetApi(21)
    public static void updateSDPath() {
        IMPL_COMMON.updateSDPath();
    }
}
