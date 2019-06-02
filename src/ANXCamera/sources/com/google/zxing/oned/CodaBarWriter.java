package com.google.zxing.oned;

import java.util.Arrays;

public final class CodaBarWriter extends OneDimensionalCodeWriter {
    private static final char[] ALT_START_END_CHARS = {'T', 'N', '*', 'E'};
    private static final char[] CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED = {'/', ':', '+', '.'};
    private static final char[] START_END_CHARS = {'A', 'B', 'C', 'D'};

    public boolean[] encode(String str) {
        String str2 = str;
        if (str.length() >= 2) {
            char upperCase = Character.toUpperCase(str2.charAt(0));
            char upperCase2 = Character.toUpperCase(str2.charAt(str.length() - 1));
            boolean z = CodaBarReader.arrayContains(START_END_CHARS, upperCase) && CodaBarReader.arrayContains(START_END_CHARS, upperCase2);
            boolean z2 = CodaBarReader.arrayContains(ALT_START_END_CHARS, upperCase) && CodaBarReader.arrayContains(ALT_START_END_CHARS, upperCase2);
            if (z || z2) {
                int i = 20;
                int i2 = 1;
                while (i2 < str.length() - 1) {
                    if (Character.isDigit(str2.charAt(i2)) || str2.charAt(i2) == '-' || str2.charAt(i2) == '$') {
                        i += 9;
                    } else if (CodaBarReader.arrayContains(CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED, str2.charAt(i2))) {
                        i += 10;
                    } else {
                        StringBuilder sb = new StringBuilder("Cannot encode : '");
                        sb.append(str2.charAt(i2));
                        sb.append('\'');
                        throw new IllegalArgumentException(sb.toString());
                    }
                    i2++;
                }
                boolean[] zArr = new boolean[(i + (str.length() - 1))];
                int i3 = 0;
                int i4 = 0;
                while (i4 < str.length()) {
                    char upperCase3 = Character.toUpperCase(str2.charAt(i4));
                    if (i4 == 0 || i4 == str.length() - 1) {
                        if (upperCase3 == '*') {
                            upperCase3 = 'C';
                        } else if (upperCase3 == 'E') {
                            upperCase3 = 'D';
                        } else if (upperCase3 == 'N') {
                            upperCase3 = 'B';
                        } else if (upperCase3 == 'T') {
                            upperCase3 = 'A';
                        }
                    }
                    char c = upperCase3;
                    int i5 = 0;
                    int i6 = 0;
                    while (true) {
                        if (i6 >= CodaBarReader.ALPHABET.length) {
                            break;
                        } else if (c == CodaBarReader.ALPHABET[i6]) {
                            i5 = CodaBarReader.CHARACTER_ENCODINGS[i6];
                            break;
                        } else {
                            i6++;
                        }
                    }
                    int i7 = i5;
                    boolean z3 = true;
                    int i8 = 0;
                    int i9 = 0;
                    while (i9 < 7) {
                        zArr[i3] = z3;
                        i3++;
                        if (((i7 >> (6 - i9)) & 1) == 0 || i8 == 1) {
                            z3 = !z3;
                            i9++;
                            i8 = 0;
                        } else {
                            i8++;
                        }
                    }
                    if (i4 < str.length() - 1) {
                        zArr[i3] = false;
                        i3++;
                    }
                    i4++;
                }
                return zArr;
            }
            StringBuilder sb2 = new StringBuilder("Codabar should start/end with ");
            sb2.append(Arrays.toString(START_END_CHARS));
            sb2.append(", or start/end with ");
            sb2.append(Arrays.toString(ALT_START_END_CHARS));
            throw new IllegalArgumentException(sb2.toString());
        }
        throw new IllegalArgumentException("Codabar should start/end with start/stop symbols");
    }
}
