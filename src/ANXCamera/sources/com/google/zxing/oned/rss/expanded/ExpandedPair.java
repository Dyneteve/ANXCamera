package com.google.zxing.oned.rss.expanded;

import com.google.zxing.oned.rss.DataCharacter;
import com.google.zxing.oned.rss.FinderPattern;
import com.ss.android.ttve.common.TEDefine;

final class ExpandedPair {
    private final FinderPattern finderPattern;
    private final DataCharacter leftChar;
    private final boolean mayBeLast;
    private final DataCharacter rightChar;

    ExpandedPair(DataCharacter leftChar2, DataCharacter rightChar2, FinderPattern finderPattern2, boolean mayBeLast2) {
        this.leftChar = leftChar2;
        this.rightChar = rightChar2;
        this.finderPattern = finderPattern2;
        this.mayBeLast = mayBeLast2;
    }

    /* access modifiers changed from: 0000 */
    public boolean mayBeLast() {
        return this.mayBeLast;
    }

    /* access modifiers changed from: 0000 */
    public DataCharacter getLeftChar() {
        return this.leftChar;
    }

    /* access modifiers changed from: 0000 */
    public DataCharacter getRightChar() {
        return this.rightChar;
    }

    /* access modifiers changed from: 0000 */
    public FinderPattern getFinderPattern() {
        return this.finderPattern;
    }

    public boolean mustBeLast() {
        return this.rightChar == null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("[ ");
        sb.append(this.leftChar);
        sb.append(" , ");
        sb.append(this.rightChar);
        sb.append(" : ");
        sb.append(this.finderPattern == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(this.finderPattern.getValue()));
        sb.append(" ]");
        return sb.toString();
    }

    public boolean equals(Object o) {
        boolean z = false;
        if (!(o instanceof ExpandedPair)) {
            return false;
        }
        ExpandedPair that = (ExpandedPair) o;
        if (equalsOrNull(this.leftChar, that.leftChar) && equalsOrNull(this.rightChar, that.rightChar) && equalsOrNull(this.finderPattern, that.finderPattern)) {
            z = true;
        }
        return z;
    }

    private static boolean equalsOrNull(Object o1, Object o2) {
        if (o1 == null) {
            return o2 == null;
        }
        return o1.equals(o2);
    }

    public int hashCode() {
        return (hashNotNull(this.leftChar) ^ hashNotNull(this.rightChar)) ^ hashNotNull(this.finderPattern);
    }

    private static int hashNotNull(Object o) {
        if (o == null) {
            return 0;
        }
        return o.hashCode();
    }
}
