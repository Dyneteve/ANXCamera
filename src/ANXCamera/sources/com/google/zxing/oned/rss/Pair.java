package com.google.zxing.oned.rss;

final class Pair extends DataCharacter {
    private int count;
    private final FinderPattern finderPattern;

    Pair(int value, int checksumPortion, FinderPattern finderPattern2) {
        super(value, checksumPortion);
        this.finderPattern = finderPattern2;
    }

    /* access modifiers changed from: 0000 */
    public FinderPattern getFinderPattern() {
        return this.finderPattern;
    }

    /* access modifiers changed from: 0000 */
    public int getCount() {
        return this.count;
    }

    /* access modifiers changed from: 0000 */
    public void incrementCount() {
        this.count++;
    }
}
