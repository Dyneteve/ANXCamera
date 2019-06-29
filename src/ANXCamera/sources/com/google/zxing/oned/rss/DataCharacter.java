package com.google.zxing.oned.rss;

public class DataCharacter {
    private final int checksumPortion;
    private final int value;

    public DataCharacter(int i, int i2) {
        this.value = i;
        this.checksumPortion = i2;
    }

    public final boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof DataCharacter)) {
            return false;
        }
        DataCharacter dataCharacter = (DataCharacter) obj;
        if (this.value == dataCharacter.value && this.checksumPortion == dataCharacter.checksumPortion) {
            z = true;
        }
        return z;
    }

    public final int getChecksumPortion() {
        return this.checksumPortion;
    }

    public final int getValue() {
        return this.value;
    }

    public final int hashCode() {
        return this.value ^ this.checksumPortion;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(String.valueOf(this.value));
        sb.append("(");
        sb.append(this.checksumPortion);
        sb.append(')');
        return sb.toString();
    }
}
