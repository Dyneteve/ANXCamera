package com.google.zxing.qrcode.decoder;

import com.google.zxing.common.BitMatrix;

abstract class DataMask {
    private static final DataMask[] DATA_MASKS = {new DataMask000(null), new DataMask001(null), new DataMask010(null), new DataMask011(null), new DataMask100(null), new DataMask101(null), new DataMask110(null), new DataMask111(null)};

    private static final class DataMask000 extends DataMask {
        private DataMask000() {
            super(null);
        }

        /* synthetic */ DataMask000(DataMask000 dataMask000) {
            this();
        }

        /* access modifiers changed from: 0000 */
        public boolean isMasked(int i, int i2) {
            return ((i + i2) & 1) == 0;
        }
    }

    private static final class DataMask001 extends DataMask {
        private DataMask001() {
            super(null);
        }

        /* synthetic */ DataMask001(DataMask001 dataMask001) {
            this();
        }

        /* access modifiers changed from: 0000 */
        public boolean isMasked(int i, int i2) {
            return (i & 1) == 0;
        }
    }

    private static final class DataMask010 extends DataMask {
        private DataMask010() {
            super(null);
        }

        /* synthetic */ DataMask010(DataMask010 dataMask010) {
            this();
        }

        /* access modifiers changed from: 0000 */
        public boolean isMasked(int i, int i2) {
            return i2 % 3 == 0;
        }
    }

    private static final class DataMask011 extends DataMask {
        private DataMask011() {
            super(null);
        }

        /* synthetic */ DataMask011(DataMask011 dataMask011) {
            this();
        }

        /* access modifiers changed from: 0000 */
        public boolean isMasked(int i, int i2) {
            return (i + i2) % 3 == 0;
        }
    }

    private static final class DataMask100 extends DataMask {
        private DataMask100() {
            super(null);
        }

        /* synthetic */ DataMask100(DataMask100 dataMask100) {
            this();
        }

        /* access modifiers changed from: 0000 */
        public boolean isMasked(int i, int i2) {
            return (((i / 2) + (i2 / 3)) & 1) == 0;
        }
    }

    private static final class DataMask101 extends DataMask {
        private DataMask101() {
            super(null);
        }

        /* synthetic */ DataMask101(DataMask101 dataMask101) {
            this();
        }

        /* access modifiers changed from: 0000 */
        public boolean isMasked(int i, int i2) {
            int i3 = i * i2;
            return (i3 & 1) + (i3 % 3) == 0;
        }
    }

    private static final class DataMask110 extends DataMask {
        private DataMask110() {
            super(null);
        }

        /* synthetic */ DataMask110(DataMask110 dataMask110) {
            this();
        }

        /* access modifiers changed from: 0000 */
        public boolean isMasked(int i, int i2) {
            int i3 = i * i2;
            return (((i3 & 1) + (i3 % 3)) & 1) == 0;
        }
    }

    private static final class DataMask111 extends DataMask {
        private DataMask111() {
            super(null);
        }

        /* synthetic */ DataMask111(DataMask111 dataMask111) {
            this();
        }

        /* access modifiers changed from: 0000 */
        public boolean isMasked(int i, int i2) {
            return ((((i + i2) & 1) + ((i * i2) % 3)) & 1) == 0;
        }
    }

    private DataMask() {
    }

    /* synthetic */ DataMask(DataMask dataMask) {
        this();
    }

    static DataMask forReference(int i) {
        if (i >= 0 && i <= 7) {
            return DATA_MASKS[i];
        }
        throw new IllegalArgumentException();
    }

    public abstract boolean isMasked(int i, int i2);

    /* access modifiers changed from: 0000 */
    public final void unmaskBitMatrix(BitMatrix bitMatrix, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            for (int i3 = 0; i3 < i; i3++) {
                if (isMasked(i2, i3)) {
                    bitMatrix.flip(i3, i2);
                }
            }
        }
    }
}
