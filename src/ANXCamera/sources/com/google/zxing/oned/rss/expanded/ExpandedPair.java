package com.google.zxing.oned.rss.expanded;

import com.google.zxing.oned.rss.DataCharacter;
import com.google.zxing.oned.rss.FinderPattern;
import com.ss.android.ttve.common.TEDefine;

final class ExpandedPair {
    private final FinderPattern finderPattern;
    private final DataCharacter leftChar;
    private final boolean mayBeLast;
    private final DataCharacter rightChar;

    ExpandedPair(DataCharacter dataCharacter, DataCharacter dataCharacter2, FinderPattern finderPattern2, boolean z) {
        this.leftChar = dataCharacter;
        this.rightChar = dataCharacter2;
        this.finderPattern = finderPattern2;
        this.mayBeLast = z;
    }

    private static boolean equalsOrNull(Object obj, Object obj2) {
        return obj == null ? obj2 == null : obj.equals(obj2);
    }

    private static int hashNotNull(Object obj) {
        if (obj == null) {
            return 0;
        }
        return obj.hashCode();
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof ExpandedPair)) {
            return false;
        }
        ExpandedPair expandedPair = (ExpandedPair) obj;
        if (equalsOrNull(this.leftChar, expandedPair.leftChar) && equalsOrNull(this.rightChar, expandedPair.rightChar) && equalsOrNull(this.finderPattern, expandedPair.finderPattern)) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public FinderPattern getFinderPattern() {
        return this.finderPattern;
    }

    /* access modifiers changed from: 0000 */
    public DataCharacter getLeftChar() {
        return this.leftChar;
    }

    /* access modifiers changed from: 0000 */
    public DataCharacter getRightChar() {
        return this.rightChar;
    }

    public int hashCode() {
        return (hashNotNull(this.leftChar) ^ hashNotNull(this.rightChar)) ^ hashNotNull(this.finderPattern);
    }

    /* access modifiers changed from: 0000 */
    public boolean mayBeLast() {
        return this.mayBeLast;
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
}
