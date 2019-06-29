package com.google.zxing.oned.rss.expanded.decoders;

final class BlockParsedResult {
    private final DecodedInformation decodedInformation;
    private final boolean finished;

    BlockParsedResult(DecodedInformation decodedInformation2, boolean z) {
        this.finished = z;
        this.decodedInformation = decodedInformation2;
    }

    BlockParsedResult(boolean z) {
        this(null, z);
    }

    /* access modifiers changed from: 0000 */
    public DecodedInformation getDecodedInformation() {
        return this.decodedInformation;
    }

    /* access modifiers changed from: 0000 */
    public boolean isFinished() {
        return this.finished;
    }
}
