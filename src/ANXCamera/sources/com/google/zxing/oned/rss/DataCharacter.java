package com.google.zxing.oned.rss;

public class DataCharacter {
    private final int checksumPortion;
    private final int value;

    public DataCharacter(int value2, int checksumPortion2) {
        this.value = value2;
        this.checksumPortion = checksumPortion2;
    }

    public final int getValue() {
        return this.value;
    }

    public final int getChecksumPortion() {
        return this.checksumPortion;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(String.valueOf(this.value));
        sb.append("(");
        sb.append(this.checksumPortion);
        sb.append(')');
        return sb.toString();
    }

    public final boolean equals(Object o) {
        boolean z = false;
        if (!(o instanceof DataCharacter)) {
            return false;
        }
        DataCharacter that = (DataCharacter) o;
        if (this.value == that.value && this.checksumPortion == that.checksumPortion) {
            z = true;
        }
        return z;
    }

    public final int hashCode() {
        return this.value ^ this.checksumPortion;
    }
}
