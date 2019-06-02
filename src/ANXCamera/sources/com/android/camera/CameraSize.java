package com.android.camera;

import android.support.annotation.NonNull;
import android.util.Size;

public class CameraSize implements Comparable<CameraSize> {
    public int height;
    public int width;

    public CameraSize() {
    }

    public CameraSize(int i, int i2) {
        this.width = i;
        this.height = i2;
    }

    public CameraSize(Size size) {
        this.width = size.getWidth();
        this.height = size.getHeight();
    }

    public static CameraSize copyFrom(Size size) {
        return new CameraSize(size.getWidth(), size.getHeight());
    }

    public int area() {
        if (isEmpty()) {
            return 0;
        }
        return this.width * this.height;
    }

    public int compareTo(@NonNull CameraSize cameraSize) {
        return (this.width * this.height) - (cameraSize.width * cameraSize.height);
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (obj == null) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CameraSize)) {
            return false;
        }
        CameraSize cameraSize = (CameraSize) obj;
        if (this.width == cameraSize.width && this.height == cameraSize.height) {
            z = true;
        }
        return z;
    }

    public int getHeight() {
        return this.height;
    }

    public float getRatio() {
        return ((float) this.width) / ((float) this.height);
    }

    public int getWidth() {
        return this.width;
    }

    public int hashCode() {
        return this.height ^ ((this.width << 16) | (this.width >>> 16));
    }

    public boolean isEmpty() {
        return this.width * this.height <= 0;
    }

    public CameraSize parseSize(CameraSize cameraSize) {
        this.width = cameraSize.width;
        this.height = cameraSize.height;
        return this;
    }

    public Size toSizeObject() {
        return new Size(this.width, this.height);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.width);
        sb.append("x");
        sb.append(this.height);
        return sb.toString();
    }
}
