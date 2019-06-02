package com.google.zxing.aztec.encoder;

import com.google.zxing.common.BitArray;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.reedsolomon.GenericGF;
import com.google.zxing.common.reedsolomon.ReedSolomonEncoder;

public final class Encoder {
    public static final int DEFAULT_AZTEC_LAYERS = 0;
    public static final int DEFAULT_EC_PERCENT = 33;
    private static final int MAX_NB_BITS = 32;
    private static final int MAX_NB_BITS_COMPACT = 4;
    private static final int[] WORD_SIZE = {4, 6, 6, 8, 8, 8, 8, 8, 8, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12};

    private Encoder() {
    }

    private static int[] bitsToWords(BitArray bitArray, int i, int i2) {
        int[] iArr = new int[i2];
        int size = bitArray.getSize() / i;
        for (int i3 = 0; i3 < size; i3++) {
            int i4 = 0;
            for (int i5 = 0; i5 < i; i5++) {
                i4 |= bitArray.get((i3 * i) + i5) ? 1 << ((i - i5) - 1) : 0;
            }
            iArr[i3] = i4;
        }
        return iArr;
    }

    private static void drawBullsEye(BitMatrix bitMatrix, int i, int i2) {
        for (int i3 = 0; i3 < i2; i3 += 2) {
            for (int i4 = i - i3; i4 <= i + i3; i4++) {
                bitMatrix.set(i4, i - i3);
                bitMatrix.set(i4, i + i3);
                bitMatrix.set(i - i3, i4);
                bitMatrix.set(i + i3, i4);
            }
        }
        bitMatrix.set(i - i2, i - i2);
        bitMatrix.set((i - i2) + 1, i - i2);
        bitMatrix.set(i - i2, (i - i2) + 1);
        bitMatrix.set(i + i2, i - i2);
        bitMatrix.set(i + i2, (i - i2) + 1);
        bitMatrix.set(i + i2, (i + i2) - 1);
    }

    private static void drawModeMessage(BitMatrix bitMatrix, boolean z, int i, BitArray bitArray) {
        int i2 = i / 2;
        if (z) {
            for (int i3 = 0; i3 < 7; i3++) {
                int i4 = (i2 - 3) + i3;
                if (bitArray.get(i3)) {
                    bitMatrix.set(i4, i2 - 5);
                }
                if (bitArray.get(i3 + 7)) {
                    bitMatrix.set(i2 + 5, i4);
                }
                if (bitArray.get(20 - i3)) {
                    bitMatrix.set(i4, i2 + 5);
                }
                if (bitArray.get(27 - i3)) {
                    bitMatrix.set(i2 - 5, i4);
                }
            }
            return;
        }
        for (int i5 = 0; i5 < 10; i5++) {
            int i6 = (i2 - 5) + i5 + (i5 / 5);
            if (bitArray.get(i5)) {
                bitMatrix.set(i6, i2 - 7);
            }
            if (bitArray.get(i5 + 10)) {
                bitMatrix.set(i2 + 7, i6);
            }
            if (bitArray.get(29 - i5)) {
                bitMatrix.set(i6, i2 + 7);
            }
            if (bitArray.get(39 - i5)) {
                bitMatrix.set(i2 - 7, i6);
            }
        }
    }

    public static AztecCode encode(byte[] bArr) {
        return encode(bArr, 33, 0);
    }

    public static AztecCode encode(byte[] bArr, int i, int i2) {
        int i3;
        int i4;
        boolean z;
        int i5;
        BitArray bitArray;
        int i6;
        int i7;
        BitArray bitArray2;
        int i8;
        int i9;
        BitArray bitArray3;
        boolean z2;
        BitArray encode = new HighLevelEncoder(bArr).encode();
        int i10 = 11;
        int size = ((encode.getSize() * i) / 100) + 11;
        int size2 = encode.getSize() + size;
        int i11 = 32;
        boolean z3 = false;
        boolean z4 = true;
        if (i2 != 0) {
            z = i2 < 0;
            i4 = Math.abs(i2);
            if (z) {
                i11 = 4;
            }
            if (i4 <= i11) {
                int i12 = totalBitsInLayer(i4, z);
                i5 = WORD_SIZE[i4];
                int i13 = i12 - (i12 % i5);
                BitArray stuffBits = stuffBits(encode, i5);
                if (stuffBits.getSize() + size > i13) {
                    throw new IllegalArgumentException("Data to large for user specified layer");
                } else if (!z || stuffBits.getSize() <= i5 * 64) {
                    i3 = i12;
                    bitArray = stuffBits;
                } else {
                    throw new IllegalArgumentException("Data to large for user specified layer");
                }
            } else {
                throw new IllegalArgumentException(String.format("Illegal value %s for layers", new Object[]{Integer.valueOf(i2)}));
            }
        } else {
            BitArray bitArray4 = null;
            int i14 = 0;
            int i15 = 0;
            while (i15 <= i11) {
                boolean z5 = i15 <= 3 ? z4 : z3;
                int i16 = z5 ? i15 + 1 : i15;
                i3 = totalBitsInLayer(i16, z5);
                if (size2 > i3) {
                    bitArray3 = encode;
                    i9 = size;
                    i8 = size2;
                    z2 = z4;
                } else {
                    if (i14 != WORD_SIZE[i16]) {
                        int i17 = WORD_SIZE[i16];
                        bitArray4 = stuffBits(encode, i17);
                        i14 = i17;
                    }
                    int i18 = i3 - (i3 % i14);
                    if (z5 && bitArray4.getSize() > i14 * 64) {
                        bitArray3 = encode;
                        i9 = size;
                        i8 = size2;
                        z2 = true;
                    } else if (bitArray4.getSize() + size <= i18) {
                        bitArray = bitArray4;
                        i5 = i14;
                        z = z5;
                        i4 = i16;
                    } else {
                        bitArray3 = encode;
                        i9 = size;
                        i8 = size2;
                        z2 = true;
                    }
                }
                i15++;
                z4 = z2;
                encode = bitArray3;
                size = i9;
                size2 = i8;
                byte[] bArr2 = bArr;
                i11 = 32;
                z3 = false;
            }
            BitArray bitArray5 = encode;
            int i19 = size;
            int i20 = size2;
            throw new IllegalArgumentException("Data too large for an Aztec code");
        }
        boolean z6 = z;
        int i21 = i4;
        BitArray generateCheckWords = generateCheckWords(bitArray, i3, i5);
        int size3 = bitArray.getSize() / i5;
        BitArray generateModeMessage = generateModeMessage(z6, i21, size3);
        if (!z6) {
            i10 = 14;
        }
        int i22 = i10 + (i21 * 4);
        int[] iArr = new int[i22];
        if (z6) {
            i6 = i22;
            int i23 = 0;
            while (true) {
                BitArray bitArray6 = encode;
                if (i23 >= iArr.length) {
                    break;
                }
                iArr[i23] = i23;
                i23++;
                encode = bitArray6;
            }
        } else {
            BitArray bitArray7 = encode;
            i6 = i22 + 1 + ((((i22 / 2) - 1) / 15) * 2);
            int i24 = i22 / 2;
            int i25 = i6 / 2;
            int i26 = 0;
            while (i26 < i24) {
                int i27 = size;
                int i28 = size2;
                BitArray bitArray8 = bitArray;
                int i29 = (i26 / 15) + i26;
                iArr[(i24 - i26) - 1] = (i25 - i29) - 1;
                iArr[i24 + i26] = i25 + i29 + 1;
                i26++;
                int i30 = i27;
                int i31 = i28;
                BitArray bitArray9 = bitArray8;
            }
        }
        int i32 = i6;
        BitMatrix bitMatrix = new BitMatrix(i32);
        int i33 = 0;
        int i34 = 0;
        while (i33 < i21) {
            int i35 = size;
            int i36 = z6 ? ((i21 - i33) * 4) + 9 : ((i21 - i33) * 4) + 12;
            int i37 = 0;
            while (i37 < i36) {
                int i38 = i37 * 2;
                int i39 = i32;
                int i40 = 0;
                while (true) {
                    i7 = size2;
                    if (i40 >= 2) {
                        break;
                    }
                    if (generateCheckWords.get(i34 + i38 + i40)) {
                        bitArray2 = bitArray;
                        bitMatrix.set(iArr[(i33 * 2) + i40], iArr[(i33 * 2) + i37]);
                    } else {
                        bitArray2 = bitArray;
                    }
                    if (generateCheckWords.get(i34 + (i36 * 2) + i38 + i40)) {
                        bitMatrix.set(iArr[(i33 * 2) + i37], iArr[((i22 - 1) - (i33 * 2)) - i40]);
                    }
                    if (generateCheckWords.get(i34 + (i36 * 4) + i38 + i40)) {
                        bitMatrix.set(iArr[((i22 - 1) - (i33 * 2)) - i40], iArr[((i22 - 1) - (i33 * 2)) - i37]);
                    }
                    if (generateCheckWords.get(i34 + (i36 * 6) + i38 + i40)) {
                        bitMatrix.set(iArr[((i22 - 1) - (i33 * 2)) - i37], iArr[(i33 * 2) + i40]);
                    }
                    i40++;
                    size2 = i7;
                    bitArray = bitArray2;
                }
                i37++;
                i32 = i39;
                size2 = i7;
            }
            i34 += i36 * 8;
            i33++;
            size = i35;
        }
        drawModeMessage(bitMatrix, z6, i32, generateModeMessage);
        if (z6) {
            int i41 = size;
            drawBullsEye(bitMatrix, i32 / 2, 5);
        } else {
            int i42 = size;
            drawBullsEye(bitMatrix, i32 / 2, 7);
            int i43 = 0;
            int i44 = 0;
            while (i44 < (i22 / 2) - 1) {
                int i45 = (i32 / 2) & 1;
                while (i45 < i32) {
                    int i46 = i44;
                    bitMatrix.set((i32 / 2) - i43, i45);
                    bitMatrix.set((i32 / 2) + i43, i45);
                    bitMatrix.set(i45, (i32 / 2) - i43);
                    bitMatrix.set(i45, (i32 / 2) + i43);
                    i45 += 2;
                    i44 = i46;
                }
                i44 += 15;
                i43 += 16;
            }
        }
        AztecCode aztecCode = new AztecCode();
        aztecCode.setCompact(z6);
        aztecCode.setSize(i32);
        aztecCode.setLayers(i21);
        aztecCode.setCodeWords(size3);
        aztecCode.setMatrix(bitMatrix);
        return aztecCode;
    }

    private static BitArray generateCheckWords(BitArray bitArray, int i, int i2) {
        int size = bitArray.getSize() / i2;
        ReedSolomonEncoder reedSolomonEncoder = new ReedSolomonEncoder(getGF(i2));
        int i3 = i / i2;
        int[] bitsToWords = bitsToWords(bitArray, i2, i3);
        reedSolomonEncoder.encode(bitsToWords, i3 - size);
        int i4 = i % i2;
        BitArray bitArray2 = new BitArray();
        bitArray2.appendBits(0, i4);
        for (int appendBits : bitsToWords) {
            bitArray2.appendBits(appendBits, i2);
        }
        return bitArray2;
    }

    static BitArray generateModeMessage(boolean z, int i, int i2) {
        BitArray bitArray = new BitArray();
        if (z) {
            bitArray.appendBits(i - 1, 2);
            bitArray.appendBits(i2 - 1, 6);
            return generateCheckWords(bitArray, 28, 4);
        }
        bitArray.appendBits(i - 1, 5);
        bitArray.appendBits(i2 - 1, 11);
        return generateCheckWords(bitArray, 40, 4);
    }

    private static GenericGF getGF(int i) {
        if (i == 4) {
            return GenericGF.AZTEC_PARAM;
        }
        if (i == 6) {
            return GenericGF.AZTEC_DATA_6;
        }
        if (i == 8) {
            return GenericGF.AZTEC_DATA_8;
        }
        if (i == 10) {
            return GenericGF.AZTEC_DATA_10;
        }
        if (i != 12) {
            return null;
        }
        return GenericGF.AZTEC_DATA_12;
    }

    static BitArray stuffBits(BitArray bitArray, int i) {
        BitArray bitArray2 = new BitArray();
        int size = bitArray.getSize();
        int i2 = (1 << i) - 2;
        int i3 = 0;
        while (i3 < size) {
            int i4 = 0;
            int i5 = 0;
            while (i5 < i) {
                if (i3 + i5 >= size || bitArray.get(i3 + i5)) {
                    i4 |= 1 << ((i - 1) - i5);
                }
                i5++;
            }
            if ((i4 & i2) == i2) {
                bitArray2.appendBits(i4 & i2, i);
                i3--;
            } else if ((i4 & i2) == 0) {
                bitArray2.appendBits(i4 | 1, i);
                i3--;
            } else {
                bitArray2.appendBits(i4, i);
            }
            i3 += i;
        }
        return bitArray2;
    }

    private static int totalBitsInLayer(int i, boolean z) {
        return ((z ? 88 : 112) + (16 * i)) * i;
    }
}
