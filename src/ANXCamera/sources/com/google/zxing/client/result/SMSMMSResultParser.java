package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

public final class SMSMMSResultParser extends ResultParser {
    private static void addNumberVia(Collection<String> collection, Collection<String> collection2, String str) {
        int indexOf = str.indexOf(59);
        String str2 = null;
        if (indexOf < 0) {
            collection.add(str);
            collection2.add(null);
            return;
        }
        collection.add(str.substring(0, indexOf));
        String substring = str.substring(indexOf + 1);
        if (substring.startsWith("via=")) {
            str2 = substring.substring(4);
        }
        collection2.add(str2);
    }

    public SMSParsedResult parse(Result result) {
        String massagedText = getMassagedText(result);
        if (!massagedText.startsWith("sms:") && !massagedText.startsWith("SMS:") && !massagedText.startsWith("mms:") && !massagedText.startsWith("MMS:")) {
            return null;
        }
        Map parseNameValuePairs = parseNameValuePairs(massagedText);
        String str = null;
        String str2 = null;
        boolean z = false;
        if (parseNameValuePairs != null && !parseNameValuePairs.isEmpty()) {
            str = (String) parseNameValuePairs.get("subject");
            str2 = (String) parseNameValuePairs.get("body");
            z = true;
        }
        int indexOf = massagedText.indexOf(63, 4);
        String substring = (indexOf < 0 || !z) ? massagedText.substring(4) : massagedText.substring(4, indexOf);
        int i = -1;
        ArrayList arrayList = new ArrayList(1);
        ArrayList arrayList2 = new ArrayList(1);
        while (true) {
            int indexOf2 = substring.indexOf(44, i + 1);
            int i2 = indexOf2;
            if (indexOf2 <= i) {
                addNumberVia(arrayList, arrayList2, substring.substring(i + 1));
                return new SMSParsedResult((String[]) arrayList.toArray(new String[arrayList.size()]), (String[]) arrayList2.toArray(new String[arrayList2.size()]), str, str2);
            }
            addNumberVia(arrayList, arrayList2, substring.substring(i + 1, i2));
            i = i2;
        }
    }
}
