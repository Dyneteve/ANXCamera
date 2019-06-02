package com.google.zxing.client.result;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;
import java.util.regex.Pattern;

public final class VINResultParser extends ResultParser {
    private static final Pattern AZ09 = Pattern.compile("[A-Z0-9]{17}");
    private static final Pattern IOQ = Pattern.compile("[IOQ]");

    private static char checkChar(int i) {
        if (i < 10) {
            return (char) (48 + i);
        }
        if (i == 10) {
            return 'X';
        }
        throw new IllegalArgumentException();
    }

    private static boolean checkChecksum(CharSequence charSequence) {
        int i = 0;
        for (int i2 = 0; i2 < charSequence.length(); i2++) {
            i += vinPositionWeight(i2 + 1) * vinCharValue(charSequence.charAt(i2));
        }
        return charSequence.charAt(8) == checkChar(i % 11);
    }

    private static String countryCode(CharSequence charSequence) {
        char charAt = charSequence.charAt(0);
        char charAt2 = charSequence.charAt(1);
        if (charAt != '9') {
            if (charAt != 'S') {
                if (charAt != 'Z') {
                    switch (charAt) {
                        case '1':
                        case '4':
                        case '5':
                            return "US";
                        case '2':
                            return "CA";
                        case '3':
                            if (charAt2 >= 'A' && charAt2 <= 'W') {
                                return "MX";
                            }
                        default:
                            switch (charAt) {
                                case 'J':
                                    if (charAt2 >= 'A' && charAt2 <= 'T') {
                                        return "JP";
                                    }
                                case 'K':
                                    if (charAt2 >= 'L' && charAt2 <= 'R') {
                                        return "KO";
                                    }
                                case 'L':
                                    return "CN";
                                case 'M':
                                    if (charAt2 >= 'A' && charAt2 <= 'E') {
                                        return "IN";
                                    }
                                default:
                                    switch (charAt) {
                                        case 'V':
                                            if (charAt2 >= 'F' && charAt2 <= 'R') {
                                                return "FR";
                                            }
                                            if (charAt2 >= 'S' && charAt2 <= 'W') {
                                                return "ES";
                                            }
                                            break;
                                        case 'W':
                                            return "DE";
                                        case 'X':
                                            if (charAt2 == '0' || (charAt2 >= '3' && charAt2 <= '9')) {
                                                return "RU";
                                            }
                                    }
                                    break;
                            }
                            break;
                    }
                } else if (charAt2 >= 'A' && charAt2 <= 'R') {
                    return "IT";
                }
            } else if (charAt2 >= 'A' && charAt2 <= 'M') {
                return "UK";
            } else {
                if (charAt2 >= 'N' && charAt2 <= 'T') {
                    return "DE";
                }
            }
        } else if ((charAt2 >= 'A' && charAt2 <= 'E') || (charAt2 >= '3' && charAt2 <= '9')) {
            return "BR";
        }
        return null;
    }

    private static int modelYear(char c) {
        if (c >= 'E' && c <= 'H') {
            return (c - 'E') + 1984;
        }
        if (c >= 'J' && c <= 'N') {
            return (c - 'J') + 1988;
        }
        if (c == 'P') {
            return 1993;
        }
        if (c >= 'R' && c <= 'T') {
            return (c - 'R') + 1994;
        }
        if (c >= 'V' && c <= 'Y') {
            return (c - 'V') + 1997;
        }
        if (c >= '1' && c <= '9') {
            return (c - '1') + 2001;
        }
        if (c >= 'A' && c <= 'D') {
            return (c - 'A') + 2010;
        }
        throw new IllegalArgumentException();
    }

    private static int vinCharValue(char c) {
        if (c >= 'A' && c <= 'I') {
            return (c - 'A') + 1;
        }
        if (c >= 'J' && c <= 'R') {
            return (c - 'J') + 1;
        }
        if (c >= 'S' && c <= 'Z') {
            return (c - 'S') + 2;
        }
        if (c >= '0' && c <= '9') {
            return c - '0';
        }
        throw new IllegalArgumentException();
    }

    private static int vinPositionWeight(int i) {
        if (i >= 1 && i <= 7) {
            return 9 - i;
        }
        if (i == 8) {
            return 10;
        }
        if (i == 9) {
            return 0;
        }
        if (i >= 10 && i <= 17) {
            return 19 - i;
        }
        throw new IllegalArgumentException();
    }

    public VINParsedResult parse(Result result) {
        if (result.getBarcodeFormat() != BarcodeFormat.CODE_39) {
            return null;
        }
        String trim = IOQ.matcher(result.getText()).replaceAll("").trim();
        if (!AZ09.matcher(trim).matches()) {
            return null;
        }
        try {
            if (!checkChecksum(trim)) {
                return null;
            }
            String substring = trim.substring(0, 3);
            VINParsedResult vINParsedResult = new VINParsedResult(trim, substring, trim.substring(3, 9), trim.substring(9, 17), countryCode(substring), trim.substring(3, 8), modelYear(trim.charAt(9)), trim.charAt(10), trim.substring(11));
            return vINParsedResult;
        } catch (IllegalArgumentException e) {
            return null;
        }
    }
}
