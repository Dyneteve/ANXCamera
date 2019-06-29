package com.google.zxing.datamatrix.encoder;

final class ASCIIEncoder implements Encoder {
    ASCIIEncoder() {
    }

    private static char encodeASCIIDigits(char c, char c2) {
        if (HighLevelEncoder.isDigit(c) && HighLevelEncoder.isDigit(c2)) {
            return (char) (((c - '0') * 10) + (c2 - '0') + 130);
        }
        StringBuilder sb = new StringBuilder("not digits: ");
        sb.append(c);
        sb.append(c2);
        throw new IllegalArgumentException(sb.toString());
    }

    public void encode(EncoderContext encoderContext) {
        if (HighLevelEncoder.determineConsecutiveDigitCount(encoderContext.getMessage(), encoderContext.pos) >= 2) {
            encoderContext.writeCodeword(encodeASCIIDigits(encoderContext.getMessage().charAt(encoderContext.pos), encoderContext.getMessage().charAt(encoderContext.pos + 1)));
            encoderContext.pos += 2;
        } else {
            char currentChar = encoderContext.getCurrentChar();
            int lookAheadTest = HighLevelEncoder.lookAheadTest(encoderContext.getMessage(), encoderContext.pos, getEncodingMode());
            if (lookAheadTest != getEncodingMode()) {
                switch (lookAheadTest) {
                    case 1:
                        encoderContext.writeCodeword(230);
                        encoderContext.signalEncoderChange(1);
                        return;
                    case 2:
                        encoderContext.writeCodeword(239);
                        encoderContext.signalEncoderChange(2);
                        break;
                    case 3:
                        encoderContext.writeCodeword(238);
                        encoderContext.signalEncoderChange(3);
                        break;
                    case 4:
                        encoderContext.writeCodeword(240);
                        encoderContext.signalEncoderChange(4);
                        break;
                    case 5:
                        encoderContext.writeCodeword(231);
                        encoderContext.signalEncoderChange(5);
                        return;
                    default:
                        StringBuilder sb = new StringBuilder("Illegal mode: ");
                        sb.append(lookAheadTest);
                        throw new IllegalStateException(sb.toString());
                }
            } else if (HighLevelEncoder.isExtendedASCII(currentChar)) {
                encoderContext.writeCodeword(235);
                encoderContext.writeCodeword((char) ((currentChar - 128) + 1));
                encoderContext.pos++;
            } else {
                encoderContext.writeCodeword((char) (currentChar + 1));
                encoderContext.pos++;
            }
        }
    }

    public int getEncodingMode() {
        return 0;
    }
}
