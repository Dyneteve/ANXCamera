package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.regex.Pattern;

public final class EmailDoCoMoResultParser extends AbstractDoCoMoResultParser {
    private static final Pattern ATEXT_ALPHANUMERIC = Pattern.compile("[a-zA-Z0-9@.!#$%&'*+\\-/=?^_`{|}~]+");

    static boolean isBasicallyValidEmailAddress(String str) {
        return str != null && ATEXT_ALPHANUMERIC.matcher(str).matches() && str.indexOf(64) >= 0;
    }

    public EmailAddressParsedResult parse(Result result) {
        String massagedText = getMassagedText(result);
        if (!massagedText.startsWith("MATMSG:")) {
            return null;
        }
        String[] matchDoCoMoPrefixedField = matchDoCoMoPrefixedField("TO:", massagedText, true);
        if (matchDoCoMoPrefixedField == null) {
            return null;
        }
        String str = matchDoCoMoPrefixedField[0];
        if (!isBasicallyValidEmailAddress(str)) {
            return null;
        }
        String matchSingleDoCoMoPrefixedField = matchSingleDoCoMoPrefixedField("SUB:", massagedText, false);
        String matchSingleDoCoMoPrefixedField2 = matchSingleDoCoMoPrefixedField("BODY:", massagedText, false);
        StringBuilder sb = new StringBuilder("mailto:");
        sb.append(str);
        return new EmailAddressParsedResult(str, matchSingleDoCoMoPrefixedField, matchSingleDoCoMoPrefixedField2, sb.toString());
    }
}
