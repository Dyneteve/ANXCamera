package com.ss.android.ugc.effectmanager.common.utils;

import android.accounts.NetworkErrorException;
import com.ss.android.ugc.effectmanager.EffectConfiguration;
import com.ss.android.ugc.effectmanager.common.EffectRequest;
import com.ss.android.ugc.effectmanager.common.ErrorConstants;
import com.ss.android.ugc.effectmanager.common.exception.MD5Exception;
import com.ss.android.ugc.effectmanager.common.exception.UrlNotExistException;
import com.ss.android.ugc.effectmanager.common.model.UrlModel;
import com.ss.android.ugc.effectmanager.effect.model.Effect;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

public class EffectUtils {
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0045 A[SYNTHETIC, Splitter:B:29:0x0045] */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x004f A[SYNTHETIC, Splitter:B:34:0x004f] */
    public static File convertStreamToFile(InputStream inputStream, String str) throws IOException {
        OutputStream outputStream = null;
        try {
            File file = new File(str);
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            try {
                byte[] bArr = new byte[4096];
                while (true) {
                    int read = inputStream.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    fileOutputStream.write(bArr, 0, read);
                }
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                try {
                    fileOutputStream.close();
                } catch (IOException e2) {
                    e2.printStackTrace();
                }
                return file;
            } catch (IOException e3) {
                e = e3;
                outputStream = fileOutputStream;
                try {
                    e.printStackTrace();
                    FileUtils.removeFile(str);
                    throw e;
                } catch (Throwable th) {
                    th = th;
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e4) {
                            e4.printStackTrace();
                        }
                    }
                    if (outputStream != null) {
                        try {
                            outputStream.close();
                        } catch (IOException e5) {
                            e5.printStackTrace();
                        }
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                outputStream = fileOutputStream;
                if (inputStream != null) {
                }
                if (outputStream != null) {
                }
                throw th;
            }
        } catch (IOException e6) {
            e = e6;
            e.printStackTrace();
            FileUtils.removeFile(str);
            throw e;
        }
    }

    public static String convertStreamToString(InputStream inputStream) {
        StringBuilder sb = new StringBuilder();
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine != null) {
                    sb.append(readLine);
                } else {
                    try {
                        break;
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (IOException e2) {
            e2.printStackTrace();
        } finally {
            try {
                inputStream.close();
            } catch (IOException e3) {
                e3.printStackTrace();
            }
        }
        return sb.toString();
    }

    static File download(EffectConfiguration effectConfiguration, String str, String str2) throws Exception {
        InputStream execute = effectConfiguration.getEffectNetWorker().execute(new EffectRequest("GET", str));
        if (execute != null) {
            return convertStreamToFile(execute, str2);
        }
        throw new NetworkErrorException(ErrorConstants.EXCEPTION_DOWNLOAD_ERROR);
    }

    public static void downloadEffect(EffectConfiguration effectConfiguration, Effect effect) throws Exception {
        List url = getUrl(effect.getFileUrl());
        if (url == null || url.isEmpty()) {
            throw new UrlNotExistException(ErrorConstants.EXCEPTION_DOWNLOAD_URL_ERROR);
        }
        int i = 0;
        while (i < url.size()) {
            try {
                String fileMD5 = MD5Utils.getFileMD5(download(effectConfiguration, (String) url.get(i), effect.getZipPath()));
                if (fileMD5.equals(effect.getFileUrl().getUri())) {
                    FileUtils.unZip(effect.getZipPath(), effect.getUnzipPath());
                    return;
                }
                FileUtils.removeFile(effect.getZipPath());
                if (i != url.size() - 1) {
                    i++;
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("downloadMD5: ");
                    sb.append(fileMD5);
                    sb.append(" expectMD5:");
                    sb.append(effect.getFileUrl().getUri());
                    throw new MD5Exception(sb.toString());
                }
            } catch (Exception e) {
                e.printStackTrace();
                if (i == url.size() - 1) {
                    FileUtils.removeDir(effect.getUnzipPath());
                    throw e;
                }
            }
        }
    }

    public static List<String> getUrl(UrlModel urlModel) {
        return (urlModel == null || isUrlModelEmpty(urlModel)) ? new ArrayList() : urlModel.getUrlList();
    }

    public static boolean isEffectValid(Effect effect) {
        if (effect == null) {
            return false;
        }
        return !isUrlModelEmpty(effect.getFileUrl());
    }

    public static boolean isUrlModelEmpty(UrlModel urlModel) {
        return urlModel == null || urlModel.getUrlList() == null || urlModel.getUrlList().isEmpty();
    }

    public static void throwIllegalNullException(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" should not null");
        throw new IllegalArgumentException(sb.toString());
    }
}
