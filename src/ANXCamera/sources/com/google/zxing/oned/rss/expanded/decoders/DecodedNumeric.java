package com.google.zxing.oned.rss.expanded.decoders;

import com.google.zxing.FormatException;

final class DecodedNumeric extends DecodedObject {
    static final int FNC1 = 10;
    private final int firstDigit;
    private final int secondDigit;

    DecodedNumeric(int newPosition, int firstDigit2, int secondDigit2) throws FormatException {
        super(newPosition);
        if (firstDigit2 < 0 || firstDigit2 > 10 || secondDigit2 < 0 || secondDigit2 > 10) {
            throw FormatException.getFormatInstance();
        }
        this.firstDigit = firstDigit2;
        this.secondDigit = secondDigit2;
    }

    /* access modifiers changed from: 0000 */
    public int getFirstDigit() {
        return this.firstDigit;
    }

    /* access modifiers changed from: 0000 */
    public int getSecondDigit() {
        return this.secondDigit;
    }

    /* access modifiers changed from: 0000 */
    public int getValue() {
        return (this.firstDigit * 10) + this.secondDigit;
    }

    /* access modifiers changed from: 0000 */
    public boolean isFirstDigitFNC1() {
        return this.firstDigit == 10;
    }

    /* access modifiers changed from: 0000 */
    public boolean isSecondDigitFNC1() {
        return this.secondDigit == 10;
    }

    /* access modifiers changed from: 0000 */
    public boolean isAnyFNC1() {
        return this.firstDigit == 10 || this.secondDigit == 10;
    }
}
