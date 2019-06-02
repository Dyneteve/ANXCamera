package com.ss.android.vesdk;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.NonNull;

public class VEAudioEncodeSettings implements Parcelable {
    public static final Creator<VEAudioEncodeSettings> CREATOR = new Creator<VEAudioEncodeSettings>() {
        public VEAudioEncodeSettings createFromParcel(Parcel parcel) {
            return new VEAudioEncodeSettings(parcel);
        }

        public VEAudioEncodeSettings[] newArray(int i) {
            return new VEAudioEncodeSettings[i];
        }
    };
    private int mBps;
    private int mChannelCount;
    private ENCODE_STANDARD mCodec;
    private boolean mHwEnc;
    private int mSampleRate;

    public static final class Builder {
        /* access modifiers changed from: private */
        public int mBps = 131072;
        /* access modifiers changed from: private */
        public int mChannelCount = 2;
        /* access modifiers changed from: private */
        public ENCODE_STANDARD mCodec = ENCODE_STANDARD.ENCODE_STANDARD_WAV;
        /* access modifiers changed from: private */
        public boolean mHwEnc = false;
        /* access modifiers changed from: private */
        public int mSampleRate = 44100;

        public VEAudioEncodeSettings Build() {
            return new VEAudioEncodeSettings(this);
        }

        public Builder setBps(int i) {
            this.mBps = i;
            return this;
        }

        public Builder setChannelCount(int i) {
            this.mChannelCount = i;
            return this;
        }

        public Builder setCodec(@NonNull ENCODE_STANDARD encode_standard) {
            this.mCodec = encode_standard;
            return this;
        }

        public Builder setHwEnc(boolean z) {
            this.mHwEnc = z;
            return this;
        }

        public Builder setSampleRate(int i) {
            this.mSampleRate = i;
            return this;
        }
    }

    public enum ENCODE_STANDARD implements Parcelable {
        ENCODE_STANDARD_WAV,
        ENCODE_STANDARD_PCM,
        ENCODE_STANDARD_AAC;
        
        public static final Creator<ENCODE_STANDARD> CREATOR = null;

        static {
            CREATOR = new Creator<ENCODE_STANDARD>() {
                public ENCODE_STANDARD createFromParcel(Parcel parcel) {
                    return ENCODE_STANDARD.values()[parcel.readInt()];
                }

                public ENCODE_STANDARD[] newArray(int i) {
                    return new ENCODE_STANDARD[i];
                }
            };
        }

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(ordinal());
        }
    }

    @Deprecated
    public VEAudioEncodeSettings() {
        this.mSampleRate = 44100;
        this.mBps = 131072;
        this.mChannelCount = 2;
        this.mHwEnc = false;
        this.mSampleRate = 44100;
        this.mBps = 131072;
        this.mChannelCount = 2;
        this.mHwEnc = false;
    }

    protected VEAudioEncodeSettings(Parcel parcel) {
        this.mSampleRate = 44100;
        this.mBps = 131072;
        this.mChannelCount = 2;
        boolean z = false;
        this.mHwEnc = false;
        this.mCodec = (ENCODE_STANDARD) parcel.readParcelable(ENCODE_STANDARD.class.getClassLoader());
        this.mSampleRate = parcel.readInt();
        this.mBps = parcel.readInt();
        this.mChannelCount = parcel.readInt();
        if (parcel.readByte() != 0) {
            z = true;
        }
        this.mHwEnc = z;
    }

    private VEAudioEncodeSettings(Builder builder) {
        this.mSampleRate = 44100;
        this.mBps = 131072;
        this.mChannelCount = 2;
        this.mHwEnc = false;
        this.mCodec = builder.mCodec;
        this.mSampleRate = builder.mSampleRate;
        this.mBps = builder.mBps;
        this.mChannelCount = builder.mChannelCount;
        this.mHwEnc = builder.mHwEnc;
    }

    public int describeContents() {
        return 0;
    }

    public int getBps() {
        return this.mBps;
    }

    public int getChannelCount() {
        return this.mChannelCount;
    }

    public ENCODE_STANDARD getCodec() {
        return this.mCodec;
    }

    public int getSampleRate() {
        return this.mSampleRate;
    }

    public boolean isHwEnc() {
        return this.mHwEnc;
    }

    @Deprecated
    public void setBps(int i) {
        this.mBps = i;
    }

    @Deprecated
    public void setChannelCount(int i) {
        this.mChannelCount = i;
    }

    @Deprecated
    public void setCodec(ENCODE_STANDARD encode_standard) {
        this.mCodec = encode_standard;
    }

    @Deprecated
    public void setHwEnc(boolean z) {
        this.mHwEnc = z;
    }

    @Deprecated
    public void setSampleRate(int i) {
        this.mSampleRate = i;
    }

    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.mCodec, i);
        parcel.writeInt(this.mSampleRate);
        parcel.writeInt(this.mBps);
        parcel.writeInt(this.mChannelCount);
        parcel.writeByte(this.mHwEnc ? (byte) 1 : 0);
    }
}
