package com.android.camera.sensitive;

import android.text.TextUtils;
import android.util.Base64;
import com.android.camera.log.Log;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.NavigableSet;
import java.util.zip.ZipException;
import miui.util.IOUtils;

public class SensitiveFilter implements Serializable {
    public static final String CLOUD_FILE_PATH = "/data/data/com.android.camera/sensi_words";
    static final int DEFAULT_INITIAL_CAPACITY = 8388608;
    public static final String LOCAL_FILE_PATH = "/data/data/com.android.camera/";
    private static SensitiveFilter sensitiveFilter = null;
    private static final long serialVersionUID = 1;
    protected SensitiveNode[] nodes = new SensitiveNode[8388608];

    /* JADX WARNING: Removed duplicated region for block: B:45:0x00bc A[SYNTHETIC, Splitter:B:45:0x00bc] */
    /* JADX WARNING: Removed duplicated region for block: B:50:0x00c4 A[Catch:{ IOException -> 0x00c0 }] */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00c9 A[Catch:{ IOException -> 0x00c0 }] */
    /* JADX WARNING: Removed duplicated region for block: B:54:0x00ce A[Catch:{ IOException -> 0x00c0 }] */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x00e0 A[SYNTHETIC, Splitter:B:58:0x00e0] */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x00e8 A[Catch:{ IOException -> 0x00e4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x00ed A[Catch:{ IOException -> 0x00e4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:67:0x00f2 A[Catch:{ IOException -> 0x00e4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:73:? A[RETURN, SYNTHETIC] */
    private SensitiveFilter() {
        InputStream inputStream;
        InputStreamReader inputStreamReader;
        InputStream inputStream2;
        BufferedReader bufferedReader = null;
        try {
            File file = new File(CLOUD_FILE_PATH);
            InputStream fileInputStream = file.exists() ? new FileInputStream(file) : getClass().getResourceAsStream("/assets/sensi/sensi_words.txt");
            try {
                inputStream2 = new ByteArrayInputStream(new String(Base64.decode(IOUtils.toString(fileInputStream), 0)).getBytes());
            } catch (IOException e) {
                inputStreamReader = null;
                inputStream = fileInputStream;
                e = e;
                inputStream2 = null;
                try {
                    Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor", e);
                    if (bufferedReader != null) {
                    }
                    if (inputStreamReader != null) {
                    }
                    if (inputStream2 != null) {
                    }
                    if (inputStream != null) {
                    }
                } catch (Throwable th) {
                    th = th;
                    if (bufferedReader != null) {
                    }
                    if (inputStreamReader != null) {
                    }
                    if (inputStream2 != null) {
                    }
                    if (inputStream != null) {
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                inputStreamReader = null;
                inputStream = fileInputStream;
                th = th2;
                inputStream2 = null;
                if (bufferedReader != null) {
                }
                if (inputStreamReader != null) {
                }
                if (inputStream2 != null) {
                }
                if (inputStream != null) {
                }
                throw th;
            }
            try {
                inputStreamReader = new InputStreamReader(inputStream2, StandardCharsets.UTF_8);
                try {
                    BufferedReader bufferedReader2 = new BufferedReader(inputStreamReader);
                    try {
                        String readLine = bufferedReader2.readLine();
                        while (readLine != null) {
                            readLine = bufferedReader2.readLine();
                            put(readLine);
                        }
                        bufferedReader2.close();
                        inputStreamReader.close();
                        inputStream2.close();
                        fileInputStream.close();
                    } catch (IOException e2) {
                        InputStream inputStream3 = fileInputStream;
                        e = e2;
                        bufferedReader = bufferedReader2;
                        inputStream = inputStream3;
                        Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor", e);
                        if (bufferedReader != null) {
                            bufferedReader.close();
                        }
                        if (inputStreamReader != null) {
                            inputStreamReader.close();
                        }
                        if (inputStream2 != null) {
                            inputStream2.close();
                        }
                        if (inputStream != null) {
                            inputStream.close();
                            return;
                        }
                        return;
                    } catch (Throwable th3) {
                        InputStream inputStream4 = fileInputStream;
                        th = th3;
                        bufferedReader = bufferedReader2;
                        inputStream = inputStream4;
                        if (bufferedReader != null) {
                            try {
                                bufferedReader.close();
                            } catch (IOException e3) {
                                Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor finally", e3);
                                throw th;
                            }
                        }
                        if (inputStreamReader != null) {
                            inputStreamReader.close();
                        }
                        if (inputStream2 != null) {
                            inputStream2.close();
                        }
                        if (inputStream != null) {
                            inputStream.close();
                        }
                        throw th;
                    }
                    try {
                        bufferedReader2.close();
                        inputStreamReader.close();
                        inputStream2.close();
                        if (fileInputStream != null) {
                            fileInputStream.close();
                        }
                    } catch (IOException e4) {
                        Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor finally", e4);
                    }
                } catch (IOException e5) {
                    Throwable th4 = e5;
                    inputStream = fileInputStream;
                    e = th4;
                    Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor", e);
                    if (bufferedReader != null) {
                    }
                    if (inputStreamReader != null) {
                    }
                    if (inputStream2 != null) {
                    }
                    if (inputStream != null) {
                    }
                } catch (Throwable th5) {
                    Throwable th6 = th5;
                    inputStream = fileInputStream;
                    th = th6;
                    if (bufferedReader != null) {
                    }
                    if (inputStreamReader != null) {
                    }
                    if (inputStream2 != null) {
                    }
                    if (inputStream != null) {
                    }
                    throw th;
                }
            } catch (IOException e6) {
                inputStream = fileInputStream;
                e = e6;
                inputStreamReader = null;
                Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor", e);
                if (bufferedReader != null) {
                }
                if (inputStreamReader != null) {
                }
                if (inputStream2 != null) {
                }
                if (inputStream != null) {
                }
            } catch (Throwable th7) {
                inputStream = fileInputStream;
                th = th7;
                inputStreamReader = null;
                if (bufferedReader != null) {
                }
                if (inputStreamReader != null) {
                }
                if (inputStream2 != null) {
                }
                if (inputStream != null) {
                }
                throw th;
            }
        } catch (IOException e7) {
            e = e7;
            inputStream2 = null;
            inputStreamReader = null;
            inputStream = null;
            Log.e("SensitiveFilter", "IOException in SensitiveFilter constructor", e);
            if (bufferedReader != null) {
            }
            if (inputStreamReader != null) {
            }
            if (inputStream2 != null) {
            }
            if (inputStream != null) {
            }
        } catch (Throwable th8) {
            th = th8;
            inputStream2 = null;
            inputStreamReader = null;
            inputStream = null;
            if (bufferedReader != null) {
            }
            if (inputStreamReader != null) {
            }
            if (inputStream2 != null) {
            }
            if (inputStream != null) {
            }
            throw th;
        }
    }

    public static synchronized SensitiveFilter getInstance() {
        SensitiveFilter sensitiveFilter2;
        synchronized (SensitiveFilter.class) {
            if (sensitiveFilter == null) {
                sensitiveFilter = new SensitiveFilter();
            }
            sensitiveFilter2 = sensitiveFilter;
        }
        return sensitiveFilter2;
    }

    /* JADX WARNING: Removed duplicated region for block: B:57:0x00a5  */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x00aa A[SYNTHETIC, Splitter:B:59:0x00aa] */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x00b3 A[SYNTHETIC, Splitter:B:63:0x00b3] */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x00bf  */
    /* JADX WARNING: Removed duplicated region for block: B:72:0x00c4 A[SYNTHETIC, Splitter:B:72:0x00c4] */
    /* JADX WARNING: Removed duplicated region for block: B:76:0x00cd A[SYNTHETIC, Splitter:B:76:0x00cd] */
    /* JADX WARNING: Removed duplicated region for block: B:81:0x00d6  */
    /* JADX WARNING: Removed duplicated region for block: B:83:0x00db A[SYNTHETIC, Splitter:B:83:0x00db] */
    /* JADX WARNING: Removed duplicated region for block: B:87:0x00e4 A[SYNTHETIC, Splitter:B:87:0x00e4] */
    /* JADX WARNING: Removed duplicated region for block: B:92:0x00ed  */
    /* JADX WARNING: Removed duplicated region for block: B:94:0x00f2 A[SYNTHETIC, Splitter:B:94:0x00f2] */
    /* JADX WARNING: Removed duplicated region for block: B:98:0x00fb A[SYNTHETIC, Splitter:B:98:0x00fb] */
    public static boolean loadSensitiveWords(String str, String str2) {
        FileOutputStream fileOutputStream;
        HttpURLConnection httpURLConnection;
        FileOutputStream fileOutputStream2;
        boolean z = false;
        InputStream inputStream = null;
        try {
            httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
            try {
                httpURLConnection.setConnectTimeout(20000);
                httpURLConnection.setReadTimeout(20000);
                httpURLConnection.setRequestMethod("GET");
                httpURLConnection.setDoOutput(false);
                httpURLConnection.connect();
                if (httpURLConnection.getResponseCode() == 200) {
                    InputStream inputStream2 = httpURLConnection.getInputStream();
                    try {
                        File file = new File(str2, "sensi_words");
                        if (!file.exists()) {
                            file.createNewFile();
                        }
                        fileOutputStream = new FileOutputStream(file);
                        while (true) {
                            try {
                                int read = inputStream2.read();
                                if (read == -1) {
                                    break;
                                }
                                fileOutputStream.write(read);
                            } catch (MalformedURLException e) {
                                inputStream = inputStream2;
                                if (httpURLConnection != null) {
                                }
                                if (inputStream != null) {
                                }
                                if (fileOutputStream != null) {
                                }
                                return z;
                            } catch (ZipException e2) {
                                inputStream = inputStream2;
                                if (httpURLConnection != null) {
                                }
                                if (inputStream != null) {
                                }
                                if (fileOutputStream != null) {
                                }
                                return z;
                            } catch (Exception e3) {
                                inputStream = inputStream2;
                                if (httpURLConnection != null) {
                                }
                                if (inputStream != null) {
                                }
                                if (fileOutputStream != null) {
                                }
                                return z;
                            } catch (Throwable th) {
                                inputStream = inputStream2;
                                Throwable th2 = th;
                                fileOutputStream2 = fileOutputStream;
                                th = th2;
                                if (httpURLConnection != null) {
                                }
                                if (inputStream != null) {
                                }
                                if (fileOutputStream2 != null) {
                                }
                                throw th;
                            }
                        }
                        inputStream2.close();
                        fileOutputStream.close();
                        z = true;
                        inputStream = inputStream2;
                    } catch (MalformedURLException e4) {
                        fileOutputStream = null;
                        inputStream = inputStream2;
                        if (httpURLConnection != null) {
                            httpURLConnection.disconnect();
                        }
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (IOException e5) {
                            }
                        }
                        if (fileOutputStream != null) {
                            fileOutputStream.close();
                        }
                        return z;
                    } catch (ZipException e6) {
                        fileOutputStream = null;
                        inputStream = inputStream2;
                        if (httpURLConnection != null) {
                            httpURLConnection.disconnect();
                        }
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (IOException e7) {
                            }
                        }
                        if (fileOutputStream != null) {
                            fileOutputStream.close();
                        }
                        return z;
                    } catch (Exception e8) {
                        fileOutputStream = null;
                        inputStream = inputStream2;
                        if (httpURLConnection != null) {
                            httpURLConnection.disconnect();
                        }
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (IOException e9) {
                            }
                        }
                        if (fileOutputStream != null) {
                            fileOutputStream.close();
                        }
                        return z;
                    } catch (Throwable th3) {
                        th = th3;
                        fileOutputStream2 = null;
                        inputStream = inputStream2;
                        if (httpURLConnection != null) {
                            httpURLConnection.disconnect();
                        }
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (IOException e10) {
                            }
                        }
                        if (fileOutputStream2 != null) {
                            try {
                                fileOutputStream2.close();
                            } catch (IOException e11) {
                            }
                        }
                        throw th;
                    }
                } else {
                    fileOutputStream = null;
                }
                if (httpURLConnection != null) {
                    httpURLConnection.disconnect();
                }
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException e12) {
                    }
                }
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (IOException e13) {
                    }
                }
            } catch (MalformedURLException e14) {
                fileOutputStream = null;
                if (httpURLConnection != null) {
                }
                if (inputStream != null) {
                }
                if (fileOutputStream != null) {
                }
                return z;
            } catch (ZipException e15) {
                fileOutputStream = null;
                if (httpURLConnection != null) {
                }
                if (inputStream != null) {
                }
                if (fileOutputStream != null) {
                }
                return z;
            } catch (Exception e16) {
                fileOutputStream = null;
                if (httpURLConnection != null) {
                }
                if (inputStream != null) {
                }
                if (fileOutputStream != null) {
                }
                return z;
            } catch (Throwable th4) {
                th = th4;
                fileOutputStream2 = null;
                if (httpURLConnection != null) {
                }
                if (inputStream != null) {
                }
                if (fileOutputStream2 != null) {
                }
                throw th;
            }
        } catch (MalformedURLException e17) {
            httpURLConnection = null;
            fileOutputStream = null;
            if (httpURLConnection != null) {
            }
            if (inputStream != null) {
            }
            if (fileOutputStream != null) {
            }
            return z;
        } catch (ZipException e18) {
            httpURLConnection = null;
            fileOutputStream = null;
            if (httpURLConnection != null) {
            }
            if (inputStream != null) {
            }
            if (fileOutputStream != null) {
            }
            return z;
        } catch (Exception e19) {
            httpURLConnection = null;
            fileOutputStream = null;
            if (httpURLConnection != null) {
            }
            if (inputStream != null) {
            }
            if (fileOutputStream != null) {
            }
            return z;
        } catch (Throwable th5) {
            th = th5;
            httpURLConnection = null;
            fileOutputStream2 = null;
            if (httpURLConnection != null) {
            }
            if (inputStream != null) {
            }
            if (fileOutputStream2 != null) {
            }
            throw th;
        }
        return z;
    }

    public String getSensitiveWord(String str) {
        String str2 = "";
        if (TextUtils.isEmpty(str)) {
            return "";
        }
        StringPointer stringPointer = new StringPointer(str);
        int i = 0;
        while (true) {
            int i2 = 1;
            if (i >= stringPointer.length - 1) {
                return str2;
            }
            SensitiveNode sensitiveNode = this.nodes[stringPointer.nextTwoCharHash(i) & (this.nodes.length - 1)];
            if (sensitiveNode != null) {
                int nextTwoCharMix = stringPointer.nextTwoCharMix(i);
                while (true) {
                    if (sensitiveNode == null) {
                        break;
                    }
                    if (sensitiveNode.headTwoCharMix == nextTwoCharMix) {
                        NavigableSet headSet = sensitiveNode.words.headSet(stringPointer.substring(i), true);
                        if (headSet != null) {
                            for (StringPointer stringPointer2 : headSet.descendingSet()) {
                                if (stringPointer.nextStartsWith(i, stringPointer2)) {
                                    str2 = new String(stringPointer2.value);
                                    i2 = stringPointer2.length;
                                    break;
                                }
                            }
                            continue;
                        } else {
                            continue;
                        }
                    }
                    sensitiveNode = sensitiveNode.next;
                }
            }
            i += i2;
        }
    }

    public boolean put(String str) {
        if (this.nodes == null || str == null || str.trim().length() < 2) {
            return false;
        }
        StringPointer stringPointer = new StringPointer(str.trim());
        int nextTwoCharHash = stringPointer.nextTwoCharHash(0);
        int nextTwoCharMix = stringPointer.nextTwoCharMix(0);
        int length = nextTwoCharHash & (this.nodes.length - 1);
        SensitiveNode sensitiveNode = this.nodes[length];
        if (sensitiveNode == null) {
            SensitiveNode sensitiveNode2 = new SensitiveNode(nextTwoCharMix);
            sensitiveNode2.words.add(stringPointer);
            this.nodes[length] = sensitiveNode2;
        } else {
            while (sensitiveNode != null) {
                if (sensitiveNode.headTwoCharMix == nextTwoCharMix) {
                    sensitiveNode.words.add(stringPointer);
                    return true;
                } else if (sensitiveNode.next == null) {
                    new SensitiveNode(nextTwoCharMix, sensitiveNode).words.add(stringPointer);
                    return true;
                } else {
                    sensitiveNode = sensitiveNode.next;
                }
            }
        }
        return true;
    }

    public String replaceSensitiveWord(String str, char c) {
        int i;
        StringPointer stringPointer = new StringPointer(str);
        int i2 = 0;
        boolean z = false;
        while (true) {
            boolean z2 = true;
            if (i2 >= stringPointer.length - 1) {
                break;
            }
            SensitiveNode sensitiveNode = this.nodes[stringPointer.nextTwoCharHash(i2) & (this.nodes.length - 1)];
            if (sensitiveNode != null) {
                int nextTwoCharMix = stringPointer.nextTwoCharMix(i2);
                while (true) {
                    if (sensitiveNode == null) {
                        break;
                    }
                    if (sensitiveNode.headTwoCharMix == nextTwoCharMix) {
                        NavigableSet headSet = sensitiveNode.words.headSet(stringPointer.substring(i2), true);
                        if (headSet != null) {
                            for (StringPointer stringPointer2 : headSet.descendingSet()) {
                                if (stringPointer.nextStartsWith(i2, stringPointer2)) {
                                    stringPointer.fill(i2, stringPointer2.length + i2, c);
                                    i = stringPointer2.length;
                                    break;
                                }
                            }
                            continue;
                        } else {
                            continue;
                        }
                    }
                    sensitiveNode = sensitiveNode.next;
                }
                i2 += i;
                z = z2;
            }
            z2 = z;
            i = 1;
            i2 += i;
            z = z2;
        }
        return z ? stringPointer.toString() : str;
    }
}
