package com.google.zxing;

public final class Dimension {
    private final int height;
    private final int width;

    public Dimension(int i, int i2) {
        if (i < 0 || i2 < 0) {
            throw new IllegalArgumentException();
        }
        this.width = i;
        this.height = i2;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof Dimension)) {
            return false;
        }
        Dimension dimension = (Dimension) obj;
        if (this.width == dimension.width && this.height == dimension.height) {
            z = true;
        }
        return z;
    }

    public int getHeight() {
        return this.height;
    }

    public int getWidth() {
        return this.width;
    }

    public int hashCode() {
        return (this.width * 32713) + this.height;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(String.valueOf(this.width));
        sb.append("x");
        sb.append(this.height);
        return sb.toString();
    }
}
