package com.xiaomi.camera.liveshot;

public class LivePhotoResult {
    boolean isGyroscopeStable;
    int mAEState;
    int mAWBState;
    int mFilterId;
    long mTimpSnap;

    public int getAEState() {
        return this.mAEState;
    }

    public int getAWBState() {
        return this.mAWBState;
    }

    public int getFilterId() {
        return this.mFilterId;
    }

    public long getTimeStamp() {
        return this.mTimpSnap;
    }

    public boolean isGyroScopeStable() {
        return this.isGyroscopeStable;
    }

    public void setAEState(int i) {
        this.mAEState = i;
    }

    public void setAWBState(int i) {
        this.mAWBState = i;
    }

    public void setFilterId(int i) {
        this.mFilterId = i;
    }

    public void setGyroscropStable(boolean z) {
        this.isGyroscopeStable = z;
    }

    public void setTimeStamp(long j) {
        this.mTimpSnap = j;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("LivePhoto AEState is ");
        sb2.append(this.mAEState);
        sb.append(sb2.toString());
        StringBuilder sb3 = new StringBuilder();
        sb3.append(" time stamp is ");
        sb3.append(this.mTimpSnap);
        sb.append(sb3.toString());
        StringBuilder sb4 = new StringBuilder();
        sb4.append(" gryo is ");
        sb4.append(this.isGyroscopeStable);
        sb.append(sb4.toString());
        StringBuilder sb5 = new StringBuilder();
        sb5.append(" filterid is ");
        sb5.append(this.mFilterId);
        sb.append(sb5.toString());
        StringBuilder sb6 = new StringBuilder();
        sb6.append(" awb is ");
        sb6.append(this.mAWBState);
        sb.append(sb6.toString());
        return sb.toString();
    }
}
