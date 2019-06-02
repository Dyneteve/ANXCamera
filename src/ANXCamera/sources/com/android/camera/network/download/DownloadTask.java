package com.android.camera.network.download;

import android.os.AsyncTask;
import com.android.camera.log.Log;
import com.android.camera.network.net.base.HTTP;
import com.ss.android.vesdk.runtime.cloudconfig.HttpRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.security.MessageDigest;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;

class DownloadTask {
    private static final int BUFFER_SIZE = 8192;
    private static final int CONNECTION_TIMEOUT = 10000;
    private static final int READ_TIMEOUT = 15000;
    private static final long RETRY_INTERVAL_MILLI = TimeUnit.SECONDS.toMillis(10);
    private static final String TAG = "DownloadTask";
    private CoreTask mCoreTask;
    /* access modifiers changed from: private */
    public OnCompleteListener mOnCompleteListener;
    /* access modifiers changed from: private */
    public OnProgressListener mOnProgressListener;
    private TaskInfo mTaskInfo;

    private class CoreTask extends AsyncTask<Void, Integer, Integer> {
        /* access modifiers changed from: private */
        public Request mRequest;

        CoreTask(Request request) {
            this.mRequest = request;
        }

        /* access modifiers changed from: protected */
        public Integer doInBackground(Void... voidArr) {
            return Integer.valueOf(DownloadTask.this.performRequest(this.mRequest));
        }

        /* access modifiers changed from: protected */
        public void onCancelled(Integer num) {
            Log.d(DownloadTask.TAG, String.format("process download finish %d", new Object[]{Integer.valueOf(num != null ? num.intValue() : -2)}));
            if (DownloadTask.this.mOnCompleteListener != null) {
                DownloadTask.this.mOnCompleteListener.onRequestComplete(this.mRequest, 5);
            }
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Integer num) {
            Log.d(DownloadTask.TAG, String.format("process download finish %d", new Object[]{num}));
            if (DownloadTask.this.mOnCompleteListener != null) {
                DownloadTask.this.mOnCompleteListener.onRequestComplete(this.mRequest, num.intValue());
            }
        }

        /* access modifiers changed from: protected */
        public void onProgressUpdate(Integer... numArr) {
            if (DownloadTask.this.mOnProgressListener != null) {
                DownloadTask.this.mOnProgressListener.onProgressUpdate(this.mRequest, numArr[0].intValue());
            }
        }

        /* access modifiers changed from: 0000 */
        public void publishProgress(int i) {
            super.publishProgress(new Integer[]{Integer.valueOf(i)});
        }
    }

    private interface InternalConstants {
        public static final int RESULT_HTTP_TIMEOUT = 12;
        public static final int RESULT_NONE_RESULT = -2;
    }

    interface OnCompleteListener {
        void onRequestComplete(Request request, int i);
    }

    interface OnProgressListener {
        void onProgressUpdate(Request request, int i);
    }

    interface OpenConstants {
        public static final int RESULT_CANCELLED = 5;
        public static final int RESULT_DOWNLOAD_FILE_ERROR = 9;
        public static final int RESULT_HTTP_ERROR = 7;
        public static final int RESULT_HTTP_SERVER_ERROR = 8;
        public static final int RESULT_ILLEGAL_ACTIVE_NETWORK = 3;
        public static final int RESULT_NETWORK_DENIED = 2;
        public static final int RESULT_NO_NETWORK = 1;
        public static final int RESULT_OPEN_FILE_FAILED = 4;
        public static final int RESULT_SUCCESSFUL = 0;
        public static final int RESULT_UNKNOWN = 11;
        public static final int RESULT_VALIDATION_FAILED = 6;
    }

    private static class TaskInfo {
        long mContentLength;
        MessageDigest mDigest;
        long mDownloadSize;

        private TaskInfo() {
        }
    }

    DownloadTask(Request request) {
        this.mCoreTask = new CoreTask(request);
    }

    DownloadTask(Request request, OnCompleteListener onCompleteListener) {
        this.mCoreTask = new CoreTask(request);
        this.mOnCompleteListener = onCompleteListener;
    }

    private void configure(HttpURLConnection httpURLConnection) {
        httpURLConnection.setConnectTimeout(10000);
        httpURLConnection.setReadTimeout(15000);
        httpURLConnection.setRequestProperty(HttpRequest.HEADER_ACCEPT_ENCODING, HTTP.IDENTITY_CODING);
    }

    private static File getTempFile(File file) {
        String parent = file.getParent();
        StringBuilder sb = new StringBuilder();
        sb.append(file.getName());
        sb.append(".download");
        return new File(parent, sb.toString());
    }

    private static boolean isRetryState(int i) {
        return i == 12 || i == 11;
    }

    private static OutputStream openOutputStream(File file) {
        File parentFile = file.getParentFile();
        if (parentFile.exists() || parentFile.mkdirs()) {
            if (file.exists()) {
                if (file.isDirectory()) {
                    Log.d(TAG, String.format("output file is a directory", new Object[0]));
                    return null;
                }
                Log.w(TAG, String.format("output file will be overwritten", new Object[0]));
            }
            File tempFile = getTempFile(file);
            if (tempFile.exists()) {
                Log.w(TAG, String.format("temp file exists, try delete", new Object[0]));
                if (!tempFile.delete()) {
                    Log.w(TAG, String.format("temp file delete failed, will overwrite", new Object[0]));
                }
            }
            try {
                return new FileOutputStream(tempFile);
            } catch (FileNotFoundException e) {
                Log.w(TAG, (Throwable) e);
                return null;
            }
        } else {
            Log.d(TAG, String.format("create folder failed", new Object[0]));
            return null;
        }
    }

    private void performProgressUpdate(byte[] bArr, int i) {
        long j = this.mTaskInfo.mDownloadSize;
        this.mTaskInfo.mDownloadSize += (long) i;
        if (this.mTaskInfo.mDigest != null) {
            this.mTaskInfo.mDigest.update(bArr, 0, i);
        }
        if (this.mOnProgressListener != null && this.mTaskInfo.mContentLength > 0) {
            int i2 = (int) ((((double) this.mTaskInfo.mDownloadSize) / ((double) this.mTaskInfo.mContentLength)) * 100.0d);
            if (((int) ((((double) j) / ((double) this.mTaskInfo.mContentLength)) * 100.0d)) != i2) {
                this.mCoreTask.publishProgress(i2);
            }
        }
    }

    /* access modifiers changed from: private */
    public int performRequest(Request request) {
        int process;
        Log.d(TAG, String.format("start to download request[%s, %s, %s]", new Object[]{request.getTag(), request.getUri(), request.getDestination()}));
        preRequest();
        int maxRetryTimes = request.getMaxRetryTimes();
        int i = 0;
        do {
            process = process(request);
            if (!isRetryState(process)) {
                break;
            }
            Log.d(TAG, String.format("retry for %d", new Object[]{Integer.valueOf(process)}));
            try {
                Thread.sleep(RETRY_INTERVAL_MILLI, 0);
                i++;
            } catch (InterruptedException e) {
                process = 5;
            }
        } while (i <= maxRetryTimes);
        return postRequest(process);
    }

    private int postDownload() {
        if (this.mCoreTask.mRequest.getVerifier() == null || this.mCoreTask.mRequest.getVerifier().verify(this.mTaskInfo.mDigest.digest())) {
            Log.d(TAG, String.format("verify success", new Object[0]));
            return 0;
        }
        Log.d(TAG, String.format("verify fail", new Object[0]));
        return 6;
    }

    private int postRequest(int i) {
        if (i != 0) {
            File tempFile = getTempFile(this.mCoreTask.mRequest.getDestination());
            if (tempFile.exists() && !tempFile.delete()) {
                Log.d(TAG, String.format("delete tmp file failed %s", new Object[]{tempFile}));
            }
        } else {
            File destination = this.mCoreTask.mRequest.getDestination();
            File tempFile2 = getTempFile(destination);
            if (!tempFile2.exists()) {
                Log.w(TAG, String.format("downloaded file missing", new Object[0]));
                return 9;
            } else if (!tempFile2.renameTo(destination)) {
                Log.w(TAG, String.format("downloaded file rename failed", new Object[0]));
                return 9;
            } else {
                Log.w(TAG, String.format("rename tmp file success", new Object[0]));
            }
        }
        return i;
    }

    private void preDownload(Request request) {
        Verifier verifier = request.getVerifier();
        if (verifier != null) {
            Log.d(TAG, String.format("need verify, try to get MessageDigest", new Object[0]));
            this.mTaskInfo.mDigest = verifier.getInstance();
        }
    }

    private void preRequest() {
        this.mTaskInfo = new TaskInfo();
    }

    /* JADX WARNING: Removed duplicated region for block: B:102:0x0157 A[SYNTHETIC, Splitter:B:102:0x0157] */
    /* JADX WARNING: Removed duplicated region for block: B:83:0x012d A[SYNTHETIC, Splitter:B:83:0x012d] */
    /* JADX WARNING: Removed duplicated region for block: B:88:0x0139 A[SYNTHETIC, Splitter:B:88:0x0139] */
    /* JADX WARNING: Removed duplicated region for block: B:97:0x014b A[SYNTHETIC, Splitter:B:97:0x014b] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private int process(Request request) {
        OutputStream outputStream;
        InputStream inputStream;
        Holder open = ConnectionHelper.open(request.getUri(), request.getNetworkType());
        HttpURLConnection httpURLConnection = (HttpURLConnection) open.value;
        if (httpURLConnection == null) {
            Log.d(TAG, String.format("open connection failed", new Object[0]));
            return translateErrorCode(open.reason);
        }
        InputStream inputStream2 = null;
        try {
            configure(httpURLConnection);
            httpURLConnection.connect();
            int translateResponseCode = translateResponseCode(httpURLConnection.getResponseCode());
            if (translateResponseCode != 0) {
                Log.d(TAG, String.format("response code not valid", new Object[0]));
                httpURLConnection.disconnect();
                return translateResponseCode;
            }
            processHeader(httpURLConnection);
            inputStream = httpURLConnection.getInputStream();
            try {
                outputStream = openOutputStream(request.getDestination());
                if (outputStream == null) {
                    try {
                        Log.d(TAG, String.format("open output stream failed", new Object[0]));
                        httpURLConnection.disconnect();
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (IOException e) {
                                Log.w(TAG, (Throwable) e);
                            }
                        }
                        if (outputStream != null) {
                            try {
                                outputStream.close();
                            } catch (IOException e2) {
                                Log.w(TAG, (Throwable) e2);
                            }
                        }
                        return 4;
                    } catch (IOException e3) {
                        e = e3;
                        inputStream2 = inputStream;
                        try {
                            Log.w(TAG, (Throwable) e);
                            httpURLConnection.disconnect();
                            if (inputStream2 != null) {
                            }
                            if (outputStream != null) {
                            }
                            return 11;
                        } catch (Throwable th) {
                            th = th;
                            inputStream = inputStream2;
                            httpURLConnection.disconnect();
                            if (inputStream != null) {
                                try {
                                    inputStream.close();
                                } catch (IOException e4) {
                                    Log.w(TAG, (Throwable) e4);
                                }
                            }
                            if (outputStream != null) {
                                try {
                                    outputStream.close();
                                } catch (IOException e5) {
                                    Log.w(TAG, (Throwable) e5);
                                }
                            }
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        httpURLConnection.disconnect();
                        if (inputStream != null) {
                        }
                        if (outputStream != null) {
                        }
                        throw th;
                    }
                } else {
                    preDownload(request);
                    Log.d(TAG, String.format("start to transfer data", new Object[0]));
                    byte[] bArr = new byte[BUFFER_SIZE];
                    int i = 0;
                    while (!this.mCoreTask.isCancelled()) {
                        i = inputStream.read(bArr);
                        if (i == -1) {
                            break;
                        }
                        outputStream.write(bArr, 0, i);
                        performProgressUpdate(bArr, i);
                    }
                    if (i == -1) {
                        Log.d(TAG, String.format("download success", new Object[0]));
                        int postDownload = postDownload();
                        httpURLConnection.disconnect();
                        if (inputStream != null) {
                            try {
                                inputStream.close();
                            } catch (IOException e6) {
                                Log.w(TAG, (Throwable) e6);
                            }
                        }
                        if (outputStream != null) {
                            try {
                                outputStream.close();
                            } catch (IOException e7) {
                                Log.w(TAG, (Throwable) e7);
                            }
                        }
                        return postDownload;
                    }
                    Log.d(TAG, String.format("cancelled, during download", new Object[0]));
                    httpURLConnection.disconnect();
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e8) {
                            Log.w(TAG, (Throwable) e8);
                        }
                    }
                    if (outputStream != null) {
                        try {
                            outputStream.close();
                        } catch (IOException e9) {
                            Log.w(TAG, (Throwable) e9);
                        }
                    }
                    return 5;
                }
            } catch (IOException e10) {
                e = e10;
                outputStream = null;
                inputStream2 = inputStream;
                Log.w(TAG, (Throwable) e);
                httpURLConnection.disconnect();
                if (inputStream2 != null) {
                }
                if (outputStream != null) {
                }
                return 11;
            } catch (Throwable th3) {
                th = th3;
                outputStream = null;
                httpURLConnection.disconnect();
                if (inputStream != null) {
                }
                if (outputStream != null) {
                }
                throw th;
            }
        } catch (IOException e11) {
            e = e11;
            outputStream = null;
            Log.w(TAG, (Throwable) e);
            httpURLConnection.disconnect();
            if (inputStream2 != null) {
                try {
                    inputStream2.close();
                } catch (IOException e12) {
                    Log.w(TAG, (Throwable) e12);
                }
            }
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e13) {
                    Log.w(TAG, (Throwable) e13);
                }
            }
            return 11;
        } catch (Throwable th4) {
            th = th4;
            inputStream = null;
            outputStream = null;
            httpURLConnection.disconnect();
            if (inputStream != null) {
            }
            if (outputStream != null) {
            }
            throw th;
        }
    }

    private void processHeader(HttpURLConnection httpURLConnection) {
        this.mTaskInfo.mContentLength = (long) httpURLConnection.getContentLength();
        Log.d(TAG, String.format("content length: %d", new Object[]{Long.valueOf(this.mTaskInfo.mContentLength)}));
    }

    private static int translateErrorCode(int i) {
        switch (i) {
            case 0:
                return 0;
            case 1:
                return 1;
            case 2:
                return 2;
            case 3:
                return 3;
            default:
                return 11;
        }
    }

    private static int translateResponseCode(int i) {
        if (i != 200) {
            Log.d(TAG, String.format("processing http code %d", new Object[]{Integer.valueOf(i)}));
            int i2 = i / 100;
            if (i2 == 3) {
                return 7;
            }
            return i2 == 4 ? i == 408 ? 12 : 7 : i2 == 5 ? i == 504 ? 12 : 8 : i2 == 2 ? 7 : 7;
        }
        Log.d(TAG, String.format("http status is ok", new Object[0]));
        return 0;
    }

    /* access modifiers changed from: 0000 */
    public boolean cancel(boolean z) {
        return this.mCoreTask.cancel(z);
    }

    /* access modifiers changed from: 0000 */
    public int execute() {
        return this.mCoreTask.doInBackground(new Void[0]).intValue();
    }

    /* access modifiers changed from: 0000 */
    public void execute(Executor executor) {
        this.mCoreTask.executeOnExecutor(executor, new Void[0]);
    }

    /* access modifiers changed from: 0000 */
    public OnProgressListener getOnProgressListener() {
        return this.mOnProgressListener;
    }

    /* access modifiers changed from: 0000 */
    public void setOnProgressListener(OnProgressListener onProgressListener) {
        this.mOnProgressListener = onProgressListener;
    }
}
