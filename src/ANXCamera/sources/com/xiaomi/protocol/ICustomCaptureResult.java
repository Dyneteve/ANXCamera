package com.xiaomi.protocol;

import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.util.Log;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public class ICustomCaptureResult implements Parcelable {
    private static final String CAPTURE_RESULT_EXTRA_CLASS = "android.hardware.camera2.impl.CaptureResultExtras";
    public static final Creator<ICustomCaptureResult> CREATOR = new Creator<ICustomCaptureResult>() {
        public ICustomCaptureResult createFromParcel(Parcel parcel) {
            return new ICustomCaptureResult(parcel);
        }

        public ICustomCaptureResult[] newArray(int i) {
            return new ICustomCaptureResult[i];
        }
    };
    private static final String PHYSICAL_CAPTURE_RESULT_CLASS = "android.hardware.camera2.impl.PhysicalCaptureResultInfo";
    private static final String TAG = ICustomCaptureResult.class.getSimpleName();
    private long mFrameNumber;
    private CaptureRequest mRequest;
    private Parcelable mResults;
    private int mSequenceId;
    private int mSessionId;
    private long mTimeStamp;

    public ICustomCaptureResult() {
    }

    public ICustomCaptureResult(int i, int i2, long j, Parcelable parcelable, CaptureRequest captureRequest) {
        this.mSessionId = i;
        this.mSequenceId = i2;
        this.mFrameNumber = j;
        this.mResults = parcelable;
        this.mRequest = captureRequest;
    }

    protected ICustomCaptureResult(Parcel parcel) {
        this.mSessionId = parcel.readInt();
        this.mSequenceId = parcel.readInt();
        this.mFrameNumber = parcel.readLong();
        this.mTimeStamp = parcel.readLong();
        this.mResults = parcel.readParcelable(Parcelable.class.getClassLoader());
        this.mRequest = (CaptureRequest) parcel.readParcelable(CaptureRequest.class.getClassLoader());
    }

    public static Object getCameraMetaDataCopy(Object obj) {
        try {
            Class cls = Class.forName("android.hardware.camera2.impl.CameraMetadataNative");
            return cls.getDeclaredConstructor(new Class[]{cls}).newInstance(new Object[]{obj});
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e) {
            Log.e(TAG, "getCameraMetaDataCopy: failed: ", e);
            return null;
        }
    }

    public static TotalCaptureResult toTotalCaptureResult(ICustomCaptureResult iCustomCaptureResult, int i) {
        try {
            int sequenceId = iCustomCaptureResult.getSequenceId();
            long frameNumber = iCustomCaptureResult.getFrameNumber();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("toTotalCaptureResult: ");
            sb.append(i);
            sb.append("|");
            sb.append(sequenceId);
            sb.append("|");
            sb.append(frameNumber);
            Log.d(str, sb.toString());
            Constructor declaredConstructor = Class.forName(CAPTURE_RESULT_EXTRA_CLASS).getDeclaredConstructor(new Class[]{Integer.TYPE, Integer.TYPE, Integer.TYPE, Integer.TYPE, Long.TYPE, Integer.TYPE, Integer.TYPE});
            Object newInstance = declaredConstructor.newInstance(new Object[]{Integer.valueOf(sequenceId), Integer.valueOf(0), Integer.valueOf(0), Integer.valueOf(0), Long.valueOf(frameNumber), Integer.valueOf(0), Integer.valueOf(0)});
            Constructor[] declaredConstructors = TotalCaptureResult.class.getDeclaredConstructors();
            int length = declaredConstructors.length;
            int i2 = 0;
            while (true) {
                if (i2 >= length) {
                    break;
                }
                Constructor constructor = declaredConstructors[i2];
                if (constructor.getParameters().length > 2) {
                    declaredConstructor = constructor;
                    break;
                }
                i2++;
            }
            Object cameraMetaDataCopy = getCameraMetaDataCopy(iCustomCaptureResult.getResults());
            if (cameraMetaDataCopy == null) {
                return null;
            }
            if (VERSION.SDK_INT < 28) {
                return (TotalCaptureResult) declaredConstructor.newInstance(new Object[]{cameraMetaDataCopy, iCustomCaptureResult.getRequest(), newInstance, null, Integer.valueOf(i)});
            }
            return (TotalCaptureResult) declaredConstructor.newInstance(new Object[]{cameraMetaDataCopy, iCustomCaptureResult.getRequest(), newInstance, null, Integer.valueOf(i), Array.newInstance(Class.forName(PHYSICAL_CAPTURE_RESULT_CLASS), 0)});
        } catch (Exception e) {
            e.printStackTrace();
            Log.e(TAG, "null capture result!");
            return null;
        }
    }

    public int describeContents() {
        return 0;
    }

    public long getFrameNumber() {
        return this.mFrameNumber;
    }

    public CaptureRequest getRequest() {
        return this.mRequest;
    }

    public Parcelable getResults() {
        return this.mResults;
    }

    public int getSequenceId() {
        return this.mSequenceId;
    }

    public int getSessionId() {
        return this.mSessionId;
    }

    public long getTimeStamp() {
        return this.mTimeStamp;
    }

    public void setFrameNumber(long j) {
        this.mFrameNumber = j;
    }

    public void setRequest(CaptureRequest captureRequest) {
        this.mRequest = captureRequest;
    }

    public void setResults(Parcelable parcelable) {
        this.mResults = parcelable;
    }

    public void setSequenceId(int i) {
        this.mSequenceId = i;
    }

    public void setSessionId(int i) {
        this.mSessionId = i;
    }

    public void setTimeStamp(long j) {
        this.mTimeStamp = j;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ICustomCaptureResult{mSessionId=");
        sb.append(this.mSessionId);
        sb.append(", mSequenceId=");
        sb.append(this.mSequenceId);
        sb.append(", mFrameNumber=");
        sb.append(this.mFrameNumber);
        sb.append(", mResults=");
        sb.append(this.mResults);
        sb.append(", mRequest=");
        sb.append(this.mRequest);
        sb.append('}');
        return sb.toString();
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(this.mSessionId);
        parcel.writeInt(this.mSequenceId);
        parcel.writeLong(this.mFrameNumber);
        parcel.writeLong(this.mTimeStamp);
        parcel.writeParcelable(this.mResults, i);
        parcel.writeParcelable(this.mRequest, i);
    }
}
