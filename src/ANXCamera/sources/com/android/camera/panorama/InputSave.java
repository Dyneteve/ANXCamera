package com.android.camera.panorama;

import android.media.Image;
import android.os.Environment;
import com.android.camera.log.Log;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class InputSave {
    public static final String TAG = "InputSave";
    private String FOLDER_PATH;
    private ExecutorService mExecutor = Executors.newSingleThreadExecutor();
    private String mFileNamePrefix;
    private int mIndex;

    private class InputSaveRunnable implements Runnable {
        final String imageFormat;
        byte[] mImageBytes;

        public InputSaveRunnable(CaptureImage captureImage, String str) {
            this.imageFormat = str;
            Image image = captureImage.mImage;
            if (image == null) {
                Log.w(InputSave.TAG, "save failed, image is null");
                return;
            }
            String str2 = InputSave.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append(image.getWidth());
            sb.append("X");
            sb.append(image.getHeight());
            sb.append(", imageFormat = ");
            sb.append(this.imageFormat);
            Log.d(str2, sb.toString());
            if (PanoramaGP3ImageFormat.YUV420_PLANAR.equals(this.imageFormat)) {
                this.mImageBytes = new ConvertFromYuv420Planar().image2bytes(image);
            } else if (PanoramaGP3ImageFormat.YUV420_SEMIPLANAR.equals(this.imageFormat)) {
                this.mImageBytes = new ConvertFromYuv420SemiPlanar().image2bytes(image);
            } else if (PanoramaGP3ImageFormat.YVU420_SEMIPLANAR.equals(this.imageFormat)) {
                this.mImageBytes = new ConvertFromYvu420SemiPlanar().image2bytes(image);
            } else {
                this.mImageBytes = null;
                Log.e(InputSave.TAG, "Image format error.");
            }
        }

        public void run() {
            if (this.mImageBytes != null) {
                InputSave.this.saveImage(this.mImageBytes, this.imageFormat);
            }
        }
    }

    public InputSave() {
        StringBuilder sb = new StringBuilder();
        sb.append(Environment.getExternalStorageDirectory());
        sb.append("/Panorama/");
        this.FOLDER_PATH = sb.toString();
        this.mFileNamePrefix = new SimpleDateFormat("yyyymmddhhmmss").format(new Date());
    }

    /* access modifiers changed from: private */
    public void saveImage(byte[] bArr, String str) {
        FileOutputStream fileOutputStream;
        Throwable th;
        this.mIndex++;
        String format = String.format(Locale.US, "%06d.yuv", new Object[]{Integer.valueOf(this.mIndex)});
        StringBuilder sb = new StringBuilder();
        sb.append(this.FOLDER_PATH);
        sb.append(this.mFileNamePrefix);
        String generalFileName = generalFileName(sb.toString(), format);
        if (generalFileName == null) {
            Log.e("InputSaveState", "saveImage() error.");
        }
        try {
            fileOutputStream = new FileOutputStream(new File(generalFileName));
            fileOutputStream.write(bArr);
            fileOutputStream.flush();
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("write file success,  ");
            sb2.append(generalFileName);
            Log.d(str2, sb2.toString());
            fileOutputStream.close();
            return;
        } catch (Exception e) {
            Log.e("InputSaveState", "saveImage() error.", e);
            return;
        } catch (Throwable th2) {
            th.addSuppressed(th2);
        }
        throw th;
    }

    public String generalFileName(String str, String str2) {
        File file = new File(str);
        if (!file.exists() && !file.mkdirs()) {
            return null;
        }
        File file2 = new File(str, str2);
        int i = 0;
        while (file2.exists()) {
            i++;
            String[] split = str2.split("\\.");
            String num = Integer.toString(i);
            StringBuilder sb = new StringBuilder();
            sb.append(split[0]);
            sb.append("-");
            sb.append(num);
            sb.append(".");
            sb.append(split[1]);
            String sb2 = sb.toString();
            File file3 = new File(str, sb2);
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("NewFilename:");
            sb3.append(sb2);
            Log.d(str3, sb3.toString());
            if (i >= 1000) {
                Log.e(TAG, "NewFilename 1000 count over!!");
                return null;
            }
            file2 = file3;
        }
        return file2.getAbsolutePath();
    }

    public void onSaveImage(CaptureImage captureImage, String str) {
        this.mExecutor.submit(new InputSaveRunnable(captureImage, str));
    }
}
