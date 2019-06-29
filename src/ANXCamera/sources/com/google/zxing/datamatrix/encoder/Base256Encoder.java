package com.google.zxing.datamatrix.encoder;

import android.support.v4.view.InputDeviceCompat;

final class Base256Encoder implements Encoder {
    Base256Encoder() {
    }

    private static char randomize255State(char c, int i) {
        int i2 = c + ((149 * i) % 255) + 1;
        return i2 <= 255 ? (char) i2 : (char) (i2 + InputDeviceCompat.SOURCE_ANY);
    }

    public void encode(EncoderContext encoderContext) {
        StringBuilder sb = new StringBuilder();
        sb.append(0);
        while (true) {
            if (encoderContext.hasMoreCharacters()) {
                sb.append(encoderContext.getCurrentChar());
                encoderContext.pos++;
                int lookAheadTest = HighLevelEncoder.lookAheadTest(encoderContext.getMessage(), encoderContext.pos, getEncodingMode());
                if (lookAheadTest != getEncodingMode()) {
                    encoderContext.signalEncoderChange(lookAheadTest);
                    break;
                }
            } else {
                break;
            }
        }
        int length = sb.length() - 1;
        int codewordCount = encoderContext.getCodewordCount() + length + 1;
        encoderContext.updateSymbolInfo(codewordCount);
        boolean z = encoderContext.getSymbolInfo().getDataCapacity() - codewordCount > 0;
        if (encoderContext.hasMoreCharacters() || z) {
            if (length <= 249) {
                sb.setCharAt(0, (char) length);
            } else if (length <= 249 || length > 1555) {
                StringBuilder sb2 = new StringBuilder("Message length not in valid ranges: ");
                sb2.append(length);
                throw new IllegalStateException(sb2.toString());
            } else {
                sb.setCharAt(0, (char) ((length / 250) + 249));
                sb.insert(1, (char) (length % 250));
            }
        }
        int length2 = sb.length();
        for (int i = 0; i < length2; i++) {
            encoderContext.writeCodeword(randomize255State(sb.charAt(i), encoderContext.getCodewordCount() + 1));
        }
    }

    public int getEncodingMode() {
        return 5;
    }
}
