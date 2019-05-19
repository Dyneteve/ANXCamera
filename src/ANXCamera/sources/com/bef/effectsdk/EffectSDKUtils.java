package com.bef.effectsdk;

import android.content.Context;
import android.text.TextUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class EffectSDKUtils {
    private static List<String> assetFiles = ModelsList.list;
    private static Set<String> localFiles = new HashSet();
    private static Set<String> needRemoveFiles = new HashSet();

    private static void copyAssets(Context context, String str, String[] strArr, boolean z) throws Throwable {
        boolean z2;
        if (!needRemoveFiles.isEmpty()) {
            needRemoveFiles.clear();
        }
        for (String fileName : localFiles) {
            needRemoveFiles.add(getFileName(fileName));
        }
        if (!str.endsWith("/")) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("/");
            str = sb.toString();
        }
        for (String str2 : assetFiles) {
            String fileName2 = getFileName(str2);
            boolean z3 = false;
            if (!needRemoveFiles.contains(fileName2) || !new File(str, getAssetRelativePath(str2)).exists()) {
                z2 = true;
            } else {
                needRemoveFiles.remove(fileName2);
                z2 = false;
            }
            if (z2) {
                if (strArr != null && !TextUtils.isEmpty(fileName2)) {
                    int length = strArr.length;
                    int i = 0;
                    while (true) {
                        if (i >= length) {
                            break;
                        } else if (fileName2.equals(strArr[i])) {
                            z3 = true;
                            break;
                        } else {
                            i++;
                        }
                    }
                }
                if (z3 && z) {
                    copyFile(context, str2, str);
                }
                if (!z3 && !z) {
                    copyFile(context, str2, str);
                }
            }
        }
    }

    private static void copyFile(Context context, String str, String str2) throws Throwable {
        InputStream open = context.getAssets().open(str);
        StringBuilder sb = new StringBuilder();
        sb.append(str2);
        sb.append(str.substring(str.indexOf("model") + 6, str.lastIndexOf("/")));
        String sb2 = sb.toString();
        File file = new File(sb2);
        if (!file.exists()) {
            file.mkdirs();
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append("/");
        sb3.append(getFileName(str));
        FileOutputStream fileOutputStream = new FileOutputStream(new File(sb3.toString()));
        byte[] bArr = new byte[1024];
        while (true) {
            int read = open.read(bArr);
            if (read > 0) {
                fileOutputStream.write(bArr, 0, read);
            } else {
                open.close();
                fileOutputStream.close();
                return;
            }
        }
    }

    private static void deleteNoUseModel() {
        for (String str : localFiles) {
            if (needRemoveFiles.contains(getFileName(str))) {
                File file = new File(str);
                if (file.exists()) {
                    file.delete();
                }
            }
        }
    }

    public static void flushAlgorithmModelFiles(Context context, String str) throws Throwable {
        if (!localFiles.isEmpty()) {
            localFiles.clear();
        }
        scanRecursive(str, localFiles);
        copyAssets(context, str, null, false);
        deleteNoUseModel();
        localFiles.clear();
    }

    public static void flushAlgorithmModelFiles(Context context, String str, String[] strArr, boolean z) throws Throwable {
        if (!localFiles.isEmpty()) {
            localFiles.clear();
        }
        scanRecursive(str, localFiles);
        copyAssets(context, str, strArr, z);
        deleteNoUseModel();
        localFiles.clear();
    }

    private static String getAssetRelativePath(String str) {
        int indexOf = str.indexOf("model/");
        return indexOf >= 0 ? str.substring(indexOf + "model/".length(), str.length()) : str;
    }

    private static String getFileName(String str) {
        int lastIndexOf = str.lastIndexOf("/");
        return lastIndexOf != -1 ? str.substring(lastIndexOf + 1, str.length()) : "";
    }

    public static boolean needUpdate(Context context, String str) {
        if (!localFiles.isEmpty()) {
            localFiles.clear();
        }
        scanNameRecursive(str, localFiles);
        try {
            if (assetFiles.size() > localFiles.size()) {
                return true;
            }
            for (String fileName : assetFiles) {
                if (!localFiles.contains(getFileName(fileName))) {
                    return true;
                }
            }
            return false;
        } catch (Throwable th) {
            th.printStackTrace();
            return true;
        }
    }

    private static void scanNameRecursive(String str, Set<String> set) {
        File file = new File(str);
        if (file.exists()) {
            File[] listFiles = file.listFiles();
            if (listFiles != null) {
                for (File file2 : listFiles) {
                    if (file2.isDirectory()) {
                        scanNameRecursive(file2.getAbsolutePath(), set);
                    } else {
                        set.add(file2.getName());
                    }
                }
            }
        }
    }

    private static void scanRecursive(String str, Set<String> set) {
        File file = new File(str);
        if (file.exists()) {
            File[] listFiles = file.listFiles();
            if (listFiles != null) {
                for (File file2 : listFiles) {
                    if (file2.isDirectory()) {
                        scanRecursive(file2.getAbsolutePath(), set);
                    } else {
                        set.add(file2.getAbsolutePath());
                    }
                }
            }
        }
    }
}
