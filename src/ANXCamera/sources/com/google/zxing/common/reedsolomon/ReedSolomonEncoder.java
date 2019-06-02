package com.google.zxing.common.reedsolomon;

import java.util.ArrayList;
import java.util.List;

public final class ReedSolomonEncoder {
    private final List<GenericGFPoly> cachedGenerators = new ArrayList();
    private final GenericGF field;

    public ReedSolomonEncoder(GenericGF genericGF) {
        this.field = genericGF;
        this.cachedGenerators.add(new GenericGFPoly(genericGF, new int[]{1}));
    }

    private GenericGFPoly buildGenerator(int i) {
        if (i >= this.cachedGenerators.size()) {
            GenericGFPoly genericGFPoly = (GenericGFPoly) this.cachedGenerators.get(this.cachedGenerators.size() - 1);
            for (int size = this.cachedGenerators.size(); size <= i; size++) {
                GenericGFPoly multiply = genericGFPoly.multiply(new GenericGFPoly(this.field, new int[]{1, this.field.exp((size - 1) + this.field.getGeneratorBase())}));
                this.cachedGenerators.add(multiply);
                genericGFPoly = multiply;
            }
        }
        return (GenericGFPoly) this.cachedGenerators.get(i);
    }

    public void encode(int[] iArr, int i) {
        if (i != 0) {
            int length = iArr.length - i;
            if (length > 0) {
                GenericGFPoly buildGenerator = buildGenerator(i);
                int[] iArr2 = new int[length];
                System.arraycopy(iArr, 0, iArr2, 0, length);
                int[] coefficients = new GenericGFPoly(this.field, iArr2).multiplyByMonomial(i, 1).divide(buildGenerator)[1].getCoefficients();
                int length2 = i - coefficients.length;
                for (int i2 = 0; i2 < length2; i2++) {
                    iArr[length + i2] = 0;
                }
                System.arraycopy(coefficients, 0, iArr, length + length2, coefficients.length);
                return;
            }
            throw new IllegalArgumentException("No data bytes provided");
        }
        throw new IllegalArgumentException("No error correction bytes");
    }
}
