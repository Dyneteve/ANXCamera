package com.google.zxing.pdf417.decoder.ec;

import com.google.zxing.ChecksumException;

public final class ErrorCorrection {
    private final ModulusGF field = ModulusGF.PDF417_GF;

    private int[] findErrorLocations(ModulusPoly modulusPoly) throws ChecksumException {
        int degree = modulusPoly.getDegree();
        int[] iArr = new int[degree];
        int i = 0;
        for (int i2 = 1; i2 < this.field.getSize() && i < degree; i2++) {
            if (modulusPoly.evaluateAt(i2) == 0) {
                iArr[i] = this.field.inverse(i2);
                i++;
            }
        }
        if (i == degree) {
            return iArr;
        }
        throw ChecksumException.getChecksumInstance();
    }

    private int[] findErrorMagnitudes(ModulusPoly modulusPoly, ModulusPoly modulusPoly2, int[] iArr) {
        int degree = modulusPoly2.getDegree();
        int[] iArr2 = new int[degree];
        for (int i = 1; i <= degree; i++) {
            iArr2[degree - i] = this.field.multiply(i, modulusPoly2.getCoefficient(i));
        }
        ModulusPoly modulusPoly3 = new ModulusPoly(this.field, iArr2);
        int length = iArr.length;
        int[] iArr3 = new int[length];
        for (int i2 = 0; i2 < length; i2++) {
            int inverse = this.field.inverse(iArr[i2]);
            iArr3[i2] = this.field.multiply(this.field.subtract(0, modulusPoly.evaluateAt(inverse)), this.field.inverse(modulusPoly3.evaluateAt(inverse)));
        }
        return iArr3;
    }

    private ModulusPoly[] runEuclideanAlgorithm(ModulusPoly modulusPoly, ModulusPoly modulusPoly2, int i) throws ChecksumException {
        if (modulusPoly.getDegree() < modulusPoly2.getDegree()) {
            ModulusPoly modulusPoly3 = modulusPoly;
            modulusPoly = modulusPoly2;
            modulusPoly2 = modulusPoly3;
        }
        ModulusPoly modulusPoly4 = modulusPoly;
        ModulusPoly modulusPoly5 = modulusPoly2;
        ModulusPoly zero = this.field.getZero();
        ModulusPoly one = this.field.getOne();
        while (modulusPoly5.getDegree() >= i / 2) {
            ModulusPoly modulusPoly6 = modulusPoly4;
            ModulusPoly modulusPoly7 = zero;
            modulusPoly4 = modulusPoly5;
            zero = one;
            if (!modulusPoly4.isZero()) {
                modulusPoly5 = modulusPoly6;
                ModulusPoly zero2 = this.field.getZero();
                int inverse = this.field.inverse(modulusPoly4.getCoefficient(modulusPoly4.getDegree()));
                while (modulusPoly5.getDegree() >= modulusPoly4.getDegree() && !modulusPoly5.isZero()) {
                    int degree = modulusPoly5.getDegree() - modulusPoly4.getDegree();
                    int multiply = this.field.multiply(modulusPoly5.getCoefficient(modulusPoly5.getDegree()), inverse);
                    zero2 = zero2.add(this.field.buildMonomial(degree, multiply));
                    modulusPoly5 = modulusPoly5.subtract(modulusPoly4.multiplyByMonomial(degree, multiply));
                }
                one = zero2.multiply(zero).subtract(modulusPoly7).negative();
            } else {
                throw ChecksumException.getChecksumInstance();
            }
        }
        int coefficient = one.getCoefficient(0);
        if (coefficient != 0) {
            int inverse2 = this.field.inverse(coefficient);
            return new ModulusPoly[]{one.multiply(inverse2), modulusPoly5.multiply(inverse2)};
        }
        throw ChecksumException.getChecksumInstance();
    }

    public int decode(int[] iArr, int i, int[] iArr2) throws ChecksumException {
        int[] iArr3 = iArr;
        int i2 = i;
        int[] iArr4 = iArr2;
        ModulusPoly modulusPoly = new ModulusPoly(this.field, iArr3);
        int[] iArr5 = new int[i2];
        boolean z = false;
        int i3 = i2;
        while (i3 > 0) {
            boolean z2 = z;
            int evaluateAt = modulusPoly.evaluateAt(this.field.exp(i3));
            iArr5[i2 - i3] = evaluateAt;
            z = evaluateAt != 0 ? true : z2;
            i3--;
            iArr4 = iArr2;
        }
        if (!z) {
            return 0;
        }
        ModulusPoly one = this.field.getOne();
        int i4 = 1;
        if (iArr4 != null) {
            int length = iArr4.length;
            ModulusPoly modulusPoly2 = one;
            int i5 = 0;
            while (i5 < length) {
                modulusPoly2 = modulusPoly2.multiply(new ModulusPoly(this.field, new int[]{this.field.subtract(0, this.field.exp((iArr3.length - i4) - iArr4[i5])), 1}));
                i5++;
                iArr4 = iArr2;
                i4 = 1;
            }
        } else {
            ModulusPoly modulusPoly3 = one;
        }
        ModulusPoly modulusPoly4 = new ModulusPoly(this.field, iArr5);
        ModulusPoly[] runEuclideanAlgorithm = runEuclideanAlgorithm(this.field.buildMonomial(i2, 1), modulusPoly4, i2);
        ModulusPoly modulusPoly5 = runEuclideanAlgorithm[0];
        ModulusPoly modulusPoly6 = runEuclideanAlgorithm[1];
        int[] findErrorLocations = findErrorLocations(modulusPoly5);
        int[] findErrorMagnitudes = findErrorMagnitudes(modulusPoly6, modulusPoly5, findErrorLocations);
        int i6 = 0;
        while (i6 < findErrorLocations.length) {
            ModulusPoly modulusPoly7 = modulusPoly4;
            int length2 = (iArr3.length - 1) - this.field.log(findErrorLocations[i6]);
            if (length2 >= 0) {
                boolean z3 = z;
                iArr3[length2] = this.field.subtract(iArr3[length2], findErrorMagnitudes[i6]);
                i6++;
                modulusPoly4 = modulusPoly7;
                z = z3;
            } else {
                boolean z4 = z;
                throw ChecksumException.getChecksumInstance();
            }
        }
        return findErrorLocations.length;
    }
}
