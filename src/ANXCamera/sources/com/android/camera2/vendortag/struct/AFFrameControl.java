package com.android.camera2.vendortag.struct;

import android.hardware.camera2.marshal.MarshalQueryable;
import android.hardware.camera2.marshal.Marshaler;
import android.hardware.camera2.utils.TypeReference;
import java.nio.ByteBuffer;

public class AFFrameControl {
    private static final int COORDINATE_COUNT = 4;
    private static final int MAX_AFGYRO_SAMPLE_SIZE = 32;
    private static final int MAX_NUM_OF_STEPS = 47;
    /* access modifiers changed from: private */
    public AFGyroData mAFGyroData;
    /* access modifiers changed from: private */
    public int mTargetLensPosition;
    /* access modifiers changed from: private */
    public int mUseDACValue;

    public static class AFGyroData {
        boolean enabled;
        float[] pAngularVelocityX = new float[32];
        float[] pAngularVelocityY = new float[32];
        float[] pAngularVelocityZ = new float[32];
        int sampleCount;
        long[] timeStamp = new long[32];

        public int getSampleCount() {
            return this.sampleCount;
        }

        public long[] getTimeStamp() {
            return this.timeStamp;
        }

        public float[] getpAngularVelocityX() {
            return this.pAngularVelocityX;
        }

        public float[] getpAngularVelocityY() {
            return this.pAngularVelocityY;
        }

        public float[] getpAngularVelocityZ() {
            return this.pAngularVelocityZ;
        }

        public boolean isEnabled() {
            return this.enabled;
        }
    }

    public static class MarshalQueryableAFFrameControl implements MarshalQueryable<AFFrameControl> {
        private static final int SIZE = 920;

        private class MarshalAFFrameControl extends Marshaler<AFFrameControl> {
            protected MarshalAFFrameControl(TypeReference<AFFrameControl> typeReference, int i) {
                super(MarshalQueryableAFFrameControl.this, typeReference, i);
            }

            public int getNativeSize() {
                return MarshalQueryableAFFrameControl.SIZE;
            }

            public void marshal(AFFrameControl aFFrameControl, ByteBuffer byteBuffer) {
                byteBuffer.putInt(aFFrameControl.mTargetLensPosition);
                byteBuffer.putInt(aFFrameControl.mUseDACValue);
                byteBuffer.putInt(aFFrameControl.mAFGyroData.sampleCount);
                for (int i = 0; i < 32; i++) {
                    byteBuffer.putFloat(aFFrameControl.mAFGyroData.pAngularVelocityX[i]);
                }
                for (int i2 = 0; i2 < 32; i2++) {
                    byteBuffer.putFloat(aFFrameControl.mAFGyroData.pAngularVelocityY[i2]);
                }
                for (int i3 = 0; i3 < 32; i3++) {
                    byteBuffer.putFloat(aFFrameControl.mAFGyroData.pAngularVelocityZ[i3]);
                }
                for (int i4 = 0; i4 < 32; i4++) {
                    byteBuffer.putFloat((float) aFFrameControl.mAFGyroData.timeStamp[i4]);
                }
            }

            public AFFrameControl unmarshal(ByteBuffer byteBuffer) {
                AFGyroData aFGyroData = new AFGyroData();
                for (int i = 0; i < 4; i++) {
                    byteBuffer.getInt();
                }
                int i2 = byteBuffer.getInt();
                int i3 = byteBuffer.getInt();
                for (int i4 = 0; i4 < 47; i4++) {
                    byteBuffer.getInt();
                }
                for (int i5 = 0; i5 < 24; i5++) {
                    byteBuffer.getShort();
                }
                byteBuffer.getInt();
                byteBuffer.getFloat();
                aFGyroData.sampleCount = byteBuffer.getInt();
                for (int i6 = 0; i6 < 32; i6++) {
                    aFGyroData.pAngularVelocityX[i6] = byteBuffer.getFloat();
                }
                for (int i7 = 0; i7 < 32; i7++) {
                    aFGyroData.pAngularVelocityY[i7] = byteBuffer.getFloat();
                }
                for (int i8 = 0; i8 < 32; i8++) {
                    aFGyroData.pAngularVelocityZ[i8] = byteBuffer.getFloat();
                }
                byteBuffer.getLong();
                for (int i9 = 0; i9 < 32; i9++) {
                    aFGyroData.timeStamp[i9] = byteBuffer.getLong();
                }
                return new AFFrameControl(i2, i3, aFGyroData);
            }
        }

        public Marshaler<AFFrameControl> createMarshaler(TypeReference<AFFrameControl> typeReference, int i) {
            return new MarshalAFFrameControl(typeReference, i);
        }

        public boolean isTypeMappingSupported(TypeReference<AFFrameControl> typeReference, int i) {
            return i == 0 && AFFrameControl.class.equals(typeReference.getType());
        }
    }

    public AFFrameControl(int i, int i2, AFGyroData aFGyroData) {
        this.mTargetLensPosition = i;
        this.mUseDACValue = i2;
        this.mAFGyroData = aFGyroData;
    }

    public AFGyroData getAFGyroData() {
        return this.mAFGyroData;
    }

    public int getTargetLensPosition() {
        return this.mTargetLensPosition;
    }

    public int getUseDACValue() {
        return this.mUseDACValue;
    }
}
