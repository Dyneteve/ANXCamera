package com.google.zxing.client.result;

import com.google.zxing.Result;

public final class SMTPResultParser extends ResultParser {
    public EmailAddressParsedResult parse(Result result) {
        String massagedText = getMassagedText(result);
        if (!massagedText.startsWith("smtp:") && !massagedText.startsWith("SMTP:")) {
            return null;
        }
        String substring = massagedText.substring(5);
        String str = null;
        String str2 = null;
        int indexOf = substring.indexOf(58);
        if (indexOf >= 0) {
            str = substring.substring(indexOf + 1);
            substring = substring.substring(0, indexOf);
            int indexOf2 = str.indexOf(58);
            if (indexOf2 >= 0) {
                str2 = str.substring(indexOf2 + 1);
                str = str.substring(0, indexOf2);
            }
        }
        StringBuilder sb = new StringBuilder("mailto:");
        sb.append(substring);
        return new EmailAddressParsedResult(substring, str, str2, sb.toString());
    }
}
