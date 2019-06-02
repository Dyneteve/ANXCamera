package com.google.zxing.common.reedsolomon;

public final class ReedSolomonDecoder {
    private final GenericGF field;

    public ReedSolomonDecoder(GenericGF genericGF) {
        this.field = genericGF;
    }

    private int[] findErrorLocations(GenericGFPoly genericGFPoly) throws ReedSolomonException {
        int degree = genericGFPoly.getDegree();
        if (degree == 1) {
            return new int[]{genericGFPoly.getCoefficient(1)};
        }
        int[] iArr = new int[degree];
        int i = 0;
        for (int i2 = 1; i2 < this.field.getSize() && i < degree; i2++) {
            if (genericGFPoly.evaluateAt(i2) == 0) {
                iArr[i] = this.field.inverse(i2);
                i++;
            }
        }
        if (i == degree) {
            return iArr;
        }
        throw new ReedSolomonException("Error locator degree does not match number of roots");
    }

    private int[] findErrorMagnitudes(GenericGFPoly genericGFPoly, int[] iArr) {
        int length = iArr.length;
        int[] iArr2 = new int[length];
        for (int i = 0; i < length; i++) {
            int inverse = this.field.inverse(iArr[i]);
            int i2 = 1;
            for (int i3 = 0; i3 < length; i3++) {
                if (i != i3) {
                    int multiply = this.field.multiply(iArr[i3], inverse);
                    i2 = this.field.multiply(i2, (multiply & 1) == 0 ? multiply | 1 : multiply & -2);
                }
            }
            iArr2[i] = this.field.multiply(genericGFPoly.evaluateAt(inverse), this.field.inverse(i2));
            if (this.field.getGeneratorBase() != 0) {
                iArr2[i] = this.field.multiply(iArr2[i], inverse);
            }
        }
        return iArr2;
    }

    private GenericGFPoly[] runEuclideanAlgorithm(GenericGFPoly genericGFPoly, GenericGFPoly genericGFPoly2, int i) throws ReedSolomonException {
        if (genericGFPoly.getDegree() < genericGFPoly2.getDegree()) {
            GenericGFPoly genericGFPoly3 = genericGFPoly;
            genericGFPoly = genericGFPoly2;
            genericGFPoly2 = genericGFPoly3;
        }
        GenericGFPoly genericGFPoly4 = genericGFPoly;
        GenericGFPoly genericGFPoly5 = genericGFPoly2;
        GenericGFPoly zero = this.field.getZero();
        GenericGFPoly one = this.field.getOne();
        while (genericGFPoly5.getDegree() >= i / 2) {
            GenericGFPoly genericGFPoly6 = genericGFPoly4;
            GenericGFPoly genericGFPoly7 = zero;
            genericGFPoly4 = genericGFPoly5;
            zero = one;
            if (!genericGFPoly4.isZero()) {
                genericGFPoly5 = genericGFPoly6;
                GenericGFPoly zero2 = this.field.getZero();
                int inverse = this.field.inverse(genericGFPoly4.getCoefficient(genericGFPoly4.getDegree()));
                while (genericGFPoly5.getDegree() >= genericGFPoly4.getDegree() && !genericGFPoly5.isZero()) {
                    int degree = genericGFPoly5.getDegree() - genericGFPoly4.getDegree();
                    int multiply = this.field.multiply(genericGFPoly5.getCoefficient(genericGFPoly5.getDegree()), inverse);
                    zero2 = zero2.addOrSubtract(this.field.buildMonomial(degree, multiply));
                    genericGFPoly5 = genericGFPoly5.addOrSubtract(genericGFPoly4.multiplyByMonomial(degree, multiply));
                }
                one = zero2.multiply(zero).addOrSubtract(genericGFPoly7);
                if (genericGFPoly5.getDegree() >= genericGFPoly4.getDegree()) {
                    throw new IllegalStateException("Division algorithm failed to reduce polynomial?");
                }
            } else {
                throw new ReedSolomonException("r_{i-1} was zero");
            }
        }
        int coefficient = one.getCoefficient(0);
        if (coefficient != 0) {
            int inverse2 = this.field.inverse(coefficient);
            return new GenericGFPoly[]{one.multiply(inverse2), genericGFPoly5.multiply(inverse2)};
        }
        throw new ReedSolomonException("sigmaTilde(0) was zero");
    }

    public void decode(int[] iArr, int i) throws ReedSolomonException {
        int i2;
        int[] iArr2 = iArr;
        int i3 = i;
        GenericGFPoly genericGFPoly = new GenericGFPoly(this.field, iArr2);
        int[] iArr3 = new int[i3];
        boolean z = true;
        int i4 = 0;
        while (true) {
            i2 = 1;
            if (i4 >= i3) {
                break;
            }
            int evaluateAt = genericGFPoly.evaluateAt(this.field.exp(this.field.getGeneratorBase() + i4));
            iArr3[(iArr3.length - 1) - i4] = evaluateAt;
            if (evaluateAt != 0) {
                z = false;
            }
            i4++;
        }
        if (!z) {
            GenericGFPoly[] runEuclideanAlgorithm = runEuclideanAlgorithm(this.field.buildMonomial(i3, 1), new GenericGFPoly(this.field, iArr3), i3);
            GenericGFPoly genericGFPoly2 = runEuclideanAlgorithm[0];
            GenericGFPoly genericGFPoly3 = runEuclideanAlgorithm[1];
            int[] findErrorLocations = findErrorLocations(genericGFPoly2);
            int[] findErrorMagnitudes = findErrorMagnitudes(genericGFPoly3, findErrorLocations);
            int i5 = 0;
            while (i5 < findErrorLocations.length) {
                int length = (iArr2.length - i2) - this.field.log(findErrorLocations[i5]);
                if (length >= 0) {
                    iArr2[length] = GenericGF.addOrSubtract(iArr2[length], findErrorMagnitudes[i5]);
                    i5++;
                    i2 = 1;
                } else {
                    throw new ReedSolomonException("Bad error location");
                }
            }
        }
    }
}
