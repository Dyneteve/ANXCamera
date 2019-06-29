package com.google.zxing.client.result;

import com.android.camera.data.data.runing.ComponentRunningShine;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;
import java.util.HashMap;

public final class ExpandedProductResultParser extends ResultParser {
    private static String findAIvalue(int i, String str) {
        if (str.charAt(i) != '(') {
            return null;
        }
        String substring = str.substring(i + 1);
        StringBuilder sb = new StringBuilder();
        for (int i2 = 0; i2 < substring.length(); i2++) {
            char charAt = substring.charAt(i2);
            if (charAt == ')') {
                return sb.toString();
            }
            if (charAt < '0' || charAt > '9') {
                return null;
            }
            sb.append(charAt);
        }
        return sb.toString();
    }

    private static String findValue(int i, String str) {
        StringBuilder sb = new StringBuilder();
        String substring = str.substring(i);
        for (int i2 = 0; i2 < substring.length(); i2++) {
            char charAt = substring.charAt(i2);
            if (charAt == '(') {
                if (findAIvalue(i2, substring) != null) {
                    break;
                }
                sb.append('(');
            } else {
                sb.append(charAt);
            }
        }
        return sb.toString();
    }

    public ExpandedProductParsedResult parse(Result result) {
        BarcodeFormat barcodeFormat = result.getBarcodeFormat();
        if (barcodeFormat != BarcodeFormat.RSS_EXPANDED) {
            return null;
        }
        String massagedText = getMassagedText(result);
        HashMap hashMap = new HashMap();
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        String str7 = null;
        String str8 = null;
        String str9 = null;
        String str10 = null;
        String str11 = null;
        String str12 = null;
        String str13 = null;
        int i = 0;
        while (i < massagedText.length()) {
            BarcodeFormat barcodeFormat2 = barcodeFormat;
            int i2 = i;
            String findAIvalue = findAIvalue(i2, massagedText);
            if (findAIvalue == null) {
                return null;
            }
            int length = i2 + findAIvalue.length() + 2;
            String findValue = findValue(length, massagedText);
            i = length + findValue.length();
            if (findAIvalue == "00") {
                str2 = findValue;
            } else if (findAIvalue == "01") {
                str = findValue;
            } else if (findAIvalue == "10") {
                str3 = findValue;
            } else if (findAIvalue == ComponentRunningShine.SHINE_LIVE_BEAUTY) {
                str4 = findValue;
            } else if (findAIvalue == "13") {
                str5 = findValue;
            } else if (findAIvalue == "15") {
                str6 = findValue;
            } else if (findAIvalue == "17") {
                str7 = findValue;
            } else if (findAIvalue == "3100" || findAIvalue == "3101" || findAIvalue == "3102" || findAIvalue == "3103" || findAIvalue == "3104" || findAIvalue == "3105" || findAIvalue == "3106" || findAIvalue == "3107" || findAIvalue == "3108" || findAIvalue == "3109") {
                str8 = findValue;
                str9 = ExpandedProductParsedResult.KILOGRAM;
                str10 = findAIvalue.substring(3);
            } else if (findAIvalue == "3200" || findAIvalue == "3201" || findAIvalue == "3202" || findAIvalue == "3203" || findAIvalue == "3204" || findAIvalue == "3205" || findAIvalue == "3206" || findAIvalue == "3207" || findAIvalue == "3208" || findAIvalue == "3209") {
                str8 = findValue;
                str9 = ExpandedProductParsedResult.POUND;
                str10 = findAIvalue.substring(3);
            } else if (findAIvalue == "3920" || findAIvalue == "3921" || findAIvalue == "3922" || findAIvalue == "3923") {
                str11 = findValue;
                str12 = findAIvalue.substring(3);
            } else if (findAIvalue != "3930" && findAIvalue != "3931" && findAIvalue != "3932" && findAIvalue != "3933") {
                hashMap.put(findAIvalue, findValue);
            } else if (findValue.length() < 4) {
                return null;
            } else {
                str11 = findValue.substring(3);
                str13 = findValue.substring(0, 3);
                str12 = findAIvalue.substring(3);
            }
            barcodeFormat = barcodeFormat2;
        }
        BarcodeFormat barcodeFormat3 = barcodeFormat;
        int i3 = i;
        ExpandedProductParsedResult expandedProductParsedResult = new ExpandedProductParsedResult(massagedText, str, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11, str12, str13, hashMap);
        return expandedProductParsedResult;
    }
}
