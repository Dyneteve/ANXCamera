package com.sensetime.stmobile.model;

public class STMobile106 {
    int ID;
    float eye_dist;
    float pitch;
    STPoint[] points_array = new STPoint[106];
    STRect rect;
    float roll;
    float score;
    float[] visibility_array = new float[106];
    float yaw;

    public STMobile106(STRect sTRect, float f, STPoint[] sTPointArr, float f2, float f3, float f4, float f5, int i) {
        this.rect = sTRect;
        this.score = f;
        this.points_array = sTPointArr;
        this.yaw = f2;
        this.pitch = f3;
        this.roll = f4;
        this.eye_dist = f5;
        this.ID = i;
    }

    public float getEye_dist() {
        return this.eye_dist;
    }

    public int getID() {
        return this.ID;
    }

    public float getPitch() {
        return this.pitch;
    }

    public STPoint[] getPoints_array() {
        return this.points_array;
    }

    public STRect getRect() {
        return this.rect;
    }

    public float getRoll() {
        return this.roll;
    }

    public float getScore() {
        return this.score;
    }

    public float[] getVisibilityArray() {
        return this.visibility_array;
    }

    public float getYaw() {
        return this.yaw;
    }

    public void setEye_dist(float f) {
        this.eye_dist = f;
    }

    public void setID(int i) {
        this.ID = i;
    }

    public void setPitch(float f) {
        this.pitch = f;
    }

    public void setPoints_array(STPoint[] sTPointArr) {
        this.points_array = sTPointArr;
    }

    public void setRect(STRect sTRect) {
        this.rect = sTRect;
    }

    public void setRoll(float f) {
        this.roll = f;
    }

    public void setScore(float f) {
        this.score = f;
    }

    public void setYaw(float f) {
        this.yaw = f;
    }
}
