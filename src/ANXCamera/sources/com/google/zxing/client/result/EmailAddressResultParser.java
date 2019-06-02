package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.Map;

public final class EmailAddressResultParser extends ResultParser {
    public EmailAddressParsedResult parse(Result result) {
        String massagedText = getMassagedText(result);
        if (massagedText.startsWith("mailto:") || massagedText.startsWith("MAILTO:")) {
            String substring = massagedText.substring(7);
            int indexOf = substring.indexOf(63);
            if (indexOf >= 0) {
                substring = substring.substring(0, indexOf);
            }
            String urlDecode = urlDecode(substring);
            Map parseNameValuePairs = parseNameValuePairs(massagedText);
            String str = null;
            String str2 = null;
            if (parseNameValuePairs != null) {
                if (urlDecode.isEmpty()) {
                    urlDecode = (String) parseNameValuePairs.get("to");
                }
                str = (String) parseNameValuePairs.get("subject");
                str2 = (String) parseNameValuePairs.get("body");
            }
            return new EmailAddressParsedResult(urlDecode, str, str2, massagedText);
        } else if (!EmailDoCoMoResultParser.isBasicallyValidEmailAddress(massagedText)) {
            return null;
        } else {
            String str3 = massagedText;
            StringBuilder sb = new StringBuilder("mailto:");
            sb.append(str3);
            return new EmailAddressParsedResult(str3, null, null, sb.toString());
        }
    }
}
