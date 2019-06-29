package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

public abstract class ResultParser {
    private static final Pattern AMPERSAND = Pattern.compile("&");
    private static final String BYTE_ORDER_MARK = "﻿";
    private static final Pattern DIGITS = Pattern.compile("\\d+");
    private static final Pattern EQUALS = Pattern.compile("=");
    private static final ResultParser[] PARSERS = {new BookmarkDoCoMoResultParser(), new AddressBookDoCoMoResultParser(), new EmailDoCoMoResultParser(), new AddressBookAUResultParser(), new VCardResultParser(), new BizcardResultParser(), new VEventResultParser(), new EmailAddressResultParser(), new SMTPResultParser(), new TelResultParser(), new SMSMMSResultParser(), new SMSTOMMSTOResultParser(), new GeoResultParser(), new WifiResultParser(), new URLTOResultParser(), new URIResultParser(), new ISBNResultParser(), new ProductResultParser(), new ExpandedProductResultParser(), new VINResultParser()};

    private static void appendKeyValue(CharSequence charSequence, Map<String, String> map) {
        String[] split = EQUALS.split(charSequence, 2);
        if (split.length == 2) {
            try {
                map.put(split[0], urlDecode(split[1]));
            } catch (IllegalArgumentException e) {
            }
        }
    }

    protected static String getMassagedText(Result result) {
        String text = result.getText();
        return text.startsWith(BYTE_ORDER_MARK) ? text.substring(1) : text;
    }

    protected static boolean isStringOfDigits(CharSequence charSequence, int i) {
        return charSequence != null && i > 0 && i == charSequence.length() && DIGITS.matcher(charSequence).matches();
    }

    protected static boolean isSubstringOfDigits(CharSequence charSequence, int i, int i2) {
        boolean z = false;
        if (charSequence == null || i2 <= 0) {
            return false;
        }
        int i3 = i + i2;
        if (charSequence.length() >= i3 && DIGITS.matcher(charSequence.subSequence(i, i3)).matches()) {
            z = true;
        }
        return z;
    }

    static String[] matchPrefixedField(String str, String str2, char c, boolean z) {
        List list = null;
        int i = 0;
        int length = str2.length();
        while (i < length) {
            int indexOf = str2.indexOf(str, i);
            if (indexOf < 0) {
                break;
            }
            i = indexOf + str.length();
            int i2 = i;
            boolean z2 = true;
            while (z2) {
                int indexOf2 = str2.indexOf(c, i);
                if (indexOf2 < 0) {
                    i = str2.length();
                    z2 = false;
                } else if (str2.charAt(indexOf2 - 1) == '\\') {
                    i = indexOf2 + 1;
                } else {
                    if (list == null) {
                        list = new ArrayList(3);
                    }
                    String unescapeBackslash = unescapeBackslash(str2.substring(i2, indexOf2));
                    if (z) {
                        unescapeBackslash = unescapeBackslash.trim();
                    }
                    if (!unescapeBackslash.isEmpty()) {
                        list.add(unescapeBackslash);
                    }
                    i = indexOf2 + 1;
                    z2 = false;
                }
            }
        }
        if (list == null || list.isEmpty()) {
            return null;
        }
        return (String[]) list.toArray(new String[list.size()]);
    }

    static String matchSinglePrefixedField(String str, String str2, char c, boolean z) {
        String[] matchPrefixedField = matchPrefixedField(str, str2, c, z);
        if (matchPrefixedField == null) {
            return null;
        }
        return matchPrefixedField[0];
    }

    protected static void maybeAppend(String str, StringBuilder sb) {
        if (str != null) {
            sb.append(10);
            sb.append(str);
        }
    }

    protected static void maybeAppend(String[] strArr, StringBuilder sb) {
        if (strArr != null) {
            for (String str : strArr) {
                sb.append(10);
                sb.append(str);
            }
        }
    }

    protected static String[] maybeWrap(String str) {
        if (str == null) {
            return null;
        }
        return new String[]{str};
    }

    protected static int parseHexDigit(char c) {
        if (c >= '0' && c <= '9') {
            return c - '0';
        }
        if (c >= 'a' && c <= 'f') {
            return 10 + (c - 'a');
        }
        if (c < 'A' || c > 'F') {
            return -1;
        }
        return 10 + (c - 'A');
    }

    static Map<String, String> parseNameValuePairs(String str) {
        int indexOf = str.indexOf(63);
        if (indexOf < 0) {
            return null;
        }
        HashMap hashMap = new HashMap(3);
        for (String appendKeyValue : AMPERSAND.split(str.substring(indexOf + 1))) {
            appendKeyValue(appendKeyValue, hashMap);
        }
        return hashMap;
    }

    public static ParsedResult parseResult(Result result) {
        for (ResultParser parse : PARSERS) {
            ParsedResult parse2 = parse.parse(result);
            if (parse2 != null) {
                return parse2;
            }
        }
        return new TextParsedResult(result.getText(), null);
    }

    protected static String unescapeBackslash(String str) {
        int indexOf = str.indexOf(92);
        if (indexOf < 0) {
            return str;
        }
        int length = str.length();
        StringBuilder sb = new StringBuilder(length - 1);
        sb.append(str.toCharArray(), 0, indexOf);
        boolean z = false;
        for (int i = indexOf; i < length; i++) {
            char charAt = str.charAt(i);
            if (z || charAt != '\\') {
                sb.append(charAt);
                z = false;
            } else {
                z = true;
            }
        }
        return sb.toString();
    }

    static String urlDecode(String str) {
        try {
            return URLDecoder.decode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    public abstract ParsedResult parse(Result result);
}
