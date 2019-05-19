package com.google.zxing.oned;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

public final class Code128Writer extends OneDimensionalCodeWriter {
    private static final int CODE_CODE_B = 100;
    private static final int CODE_CODE_C = 99;
    private static final int CODE_FNC_1 = 102;
    private static final int CODE_FNC_2 = 97;
    private static final int CODE_FNC_3 = 96;
    private static final int CODE_FNC_4_B = 100;
    private static final int CODE_START_B = 104;
    private static final int CODE_START_C = 105;
    private static final int CODE_STOP = 106;
    private static final char ESCAPE_FNC_1 = 'ñ';
    private static final char ESCAPE_FNC_2 = 'ò';
    private static final char ESCAPE_FNC_3 = 'ó';
    private static final char ESCAPE_FNC_4 = 'ô';

    public BitMatrix encode(String contents, BarcodeFormat format, int width, int height, Map<EncodeHintType, ?> hints) throws WriterException {
        if (format == BarcodeFormat.CODE_128) {
            return super.encode(contents, format, width, height, hints);
        }
        StringBuilder sb = new StringBuilder("Can only encode CODE_128, but got ");
        sb.append(format);
        throw new IllegalArgumentException(sb.toString());
    }

    public boolean[] encode(String contents) {
        int newCodeSet;
        int patternIndex;
        int patternIndex2;
        int length = contents.length();
        if (length < 1 || length > 80) {
            StringBuilder sb = new StringBuilder("Contents length should be between 1 and 80 characters, but got ");
            sb.append(length);
            throw new IllegalArgumentException(sb.toString());
        }
        for (int i = 0; i < length; i++) {
            char c = contents.charAt(i);
            if (c < ' ' || c > '~') {
                switch (c) {
                    case 241:
                    case 242:
                    case 243:
                    case 244:
                        break;
                    default:
                        StringBuilder sb2 = new StringBuilder("Bad character in input: ");
                        sb2.append(c);
                        throw new IllegalArgumentException(sb2.toString());
                }
            }
        }
        Collection<int[]> patterns = new ArrayList<>();
        int checkSum = 0;
        int checkWeight = 1;
        int codeSet = 0;
        int position = 0;
        while (position < length) {
            if (isDigits(contents, position, codeSet == 99 ? 2 : 4)) {
                newCodeSet = 99;
            } else {
                newCodeSet = 100;
            }
            if (newCodeSet == codeSet) {
                switch (contents.charAt(position)) {
                    case 241:
                        patternIndex = 102;
                        break;
                    case 242:
                        patternIndex = 97;
                        break;
                    case 243:
                        patternIndex = 96;
                        break;
                    case 244:
                        patternIndex = 100;
                        break;
                    default:
                        if (codeSet != 100) {
                            patternIndex = Integer.parseInt(contents.substring(position, position + 2));
                            position++;
                            break;
                        } else {
                            patternIndex = contents.charAt(position) - ' ';
                            break;
                        }
                }
                position++;
            } else {
                if (codeSet != 0) {
                    patternIndex2 = newCodeSet;
                } else if (newCodeSet == 100) {
                    patternIndex2 = 104;
                } else {
                    patternIndex2 = 105;
                }
                codeSet = newCodeSet;
            }
            patterns.add(Code128Reader.CODE_PATTERNS[patternIndex]);
            checkSum += patternIndex * checkWeight;
            if (position != 0) {
                checkWeight++;
            }
        }
        patterns.add(Code128Reader.CODE_PATTERNS[checkSum % 103]);
        patterns.add(Code128Reader.CODE_PATTERNS[106]);
        int codeWidth = 0;
        for (int[] pattern : patterns) {
            for (int width : (int[]) r9.next()) {
                codeWidth += width;
            }
        }
        boolean[] result = new boolean[codeWidth];
        int pos = 0;
        for (int[] pattern2 : patterns) {
            pos += appendPattern(result, pos, pattern2, true);
        }
        return result;
    }

    private static boolean isDigits(CharSequence value, int start, int length) {
        int end = start + length;
        int last = value.length();
        int i = start;
        while (i < end && i < last) {
            char c = value.charAt(i);
            if (c < '0' || c > '9') {
                if (c != 241) {
                    return false;
                }
                end++;
            }
            i++;
        }
        if (end <= last) {
            return true;
        }
        return false;
    }
}
