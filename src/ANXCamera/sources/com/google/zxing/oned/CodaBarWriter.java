package com.google.zxing.oned;

import java.util.Arrays;

public final class CodaBarWriter extends OneDimensionalCodeWriter {
    private static final char[] ALT_START_END_CHARS = {'T', 'N', '*', 'E'};
    private static final char[] CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED = {'/', ':', '+', '.'};
    private static final char[] START_END_CHARS = {'A', 'B', 'C', 'D'};

    public boolean[] encode(String contents) {
        String str = contents;
        if (contents.length() >= 2) {
            char firstChar = Character.toUpperCase(str.charAt(0));
            char lastChar = Character.toUpperCase(str.charAt(contents.length() - 1));
            boolean startsEndsNormal = CodaBarReader.arrayContains(START_END_CHARS, firstChar) && CodaBarReader.arrayContains(START_END_CHARS, lastChar);
            boolean startsEndsAlt = CodaBarReader.arrayContains(ALT_START_END_CHARS, firstChar) && CodaBarReader.arrayContains(ALT_START_END_CHARS, lastChar);
            if (startsEndsNormal || startsEndsAlt) {
                int resultLength = 20;
                int i = 1;
                while (i < contents.length() - 1) {
                    if (Character.isDigit(str.charAt(i)) || str.charAt(i) == '-' || str.charAt(i) == '$') {
                        resultLength += 9;
                    } else if (CodaBarReader.arrayContains(CHARS_WHICH_ARE_TEN_LENGTH_EACH_AFTER_DECODED, str.charAt(i))) {
                        resultLength += 10;
                    } else {
                        StringBuilder sb = new StringBuilder("Cannot encode : '");
                        sb.append(str.charAt(i));
                        sb.append('\'');
                        throw new IllegalArgumentException(sb.toString());
                    }
                    i++;
                }
                boolean[] result = new boolean[(resultLength + (contents.length() - 1))];
                int position = 0;
                int index = 0;
                while (index < contents.length()) {
                    char c = Character.toUpperCase(str.charAt(index));
                    if (index == 0 || index == contents.length() - 1) {
                        if (c == '*') {
                            c = 'C';
                        } else if (c == 'E') {
                            c = 'D';
                        } else if (c == 'N') {
                            c = 'B';
                        } else if (c == 'T') {
                            c = 'A';
                        }
                    }
                    char c2 = c;
                    int code = 0;
                    int i2 = 0;
                    while (true) {
                        if (i2 >= CodaBarReader.ALPHABET.length) {
                            break;
                        } else if (c2 == CodaBarReader.ALPHABET[i2]) {
                            code = CodaBarReader.CHARACTER_ENCODINGS[i2];
                            break;
                        } else {
                            i2++;
                        }
                    }
                    int code2 = code;
                    boolean color = true;
                    int counter = 0;
                    int bit = 0;
                    while (bit < 7) {
                        result[position] = color;
                        position++;
                        if (((code2 >> (6 - bit)) & 1) == 0 || counter == 1) {
                            color = !color;
                            bit++;
                            counter = 0;
                        } else {
                            counter++;
                        }
                    }
                    if (index < contents.length() - 1) {
                        result[position] = false;
                        position++;
                    }
                    index++;
                }
                return result;
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
