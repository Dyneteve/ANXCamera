package com.google.zxing.oned.rss.expanded.decoders;

abstract class DecodedObject {
    private final int newPosition;

    DecodedObject(int newPosition2) {
        this.newPosition = newPosition2;
    }

    /* access modifiers changed from: 0000 */
    public final int getNewPosition() {
        return this.newPosition;
    }
}
