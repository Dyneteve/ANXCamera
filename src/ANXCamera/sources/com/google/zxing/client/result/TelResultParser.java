package com.google.zxing.client.result;

import com.google.zxing.Result;

public final class TelResultParser extends ResultParser {
    public TelParsedResult parse(Result result) {
        String telURI;
        String rawText = getMassagedText(result);
        if (!rawText.startsWith("tel:") && !rawText.startsWith("TEL:")) {
            return null;
        }
        if (rawText.startsWith("TEL:")) {
            StringBuilder sb = new StringBuilder("tel:");
            sb.append(rawText.substring(4));
            telURI = sb.toString();
        } else {
            telURI = rawText;
        }
        int queryStart = rawText.indexOf(63, 4);
        return new TelParsedResult(queryStart < 0 ? rawText.substring(4) : rawText.substring(4, queryStart), telURI, null);
    }
}
