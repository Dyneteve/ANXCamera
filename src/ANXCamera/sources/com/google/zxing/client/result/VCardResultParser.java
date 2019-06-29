package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class VCardResultParser extends ResultParser {
    private static final Pattern BEGIN_VCARD = Pattern.compile("BEGIN:VCARD", 2);
    private static final Pattern COMMA = Pattern.compile(",");
    private static final Pattern CR_LF_SPACE_TAB = Pattern.compile("\r\n[ \t]");
    private static final Pattern EQUALS = Pattern.compile("=");
    private static final Pattern NEWLINE_ESCAPE = Pattern.compile("\\\\[nN]");
    private static final Pattern SEMICOLON = Pattern.compile(";");
    private static final Pattern SEMICOLON_OR_COMMA = Pattern.compile("[;,]");
    private static final Pattern UNESCAPED_SEMICOLONS = Pattern.compile("(?<!\\\\);+");
    private static final Pattern VCARD_ESCAPES = Pattern.compile("\\\\([,;\\\\])");
    private static final Pattern VCARD_LIKE_DATE = Pattern.compile("\\d{4}-?\\d{2}-?\\d{2}");

    private static String decodeQuotedPrintable(CharSequence charSequence, String str) {
        int length = charSequence.length();
        StringBuilder sb = new StringBuilder(length);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int i = 0;
        while (i < length) {
            char charAt = charSequence.charAt(i);
            if (!(charAt == 10 || charAt == 13)) {
                if (charAt != '=') {
                    maybeAppendFragment(byteArrayOutputStream, str, sb);
                    sb.append(charAt);
                } else if (i < length - 2) {
                    char charAt2 = charSequence.charAt(i + 1);
                    if (!(charAt2 == 13 || charAt2 == 10)) {
                        char charAt3 = charSequence.charAt(i + 2);
                        int parseHexDigit = parseHexDigit(charAt2);
                        int parseHexDigit2 = parseHexDigit(charAt3);
                        if (parseHexDigit >= 0 && parseHexDigit2 >= 0) {
                            byteArrayOutputStream.write((parseHexDigit << 4) + parseHexDigit2);
                        }
                        i += 2;
                    }
                }
            }
            i++;
        }
        maybeAppendFragment(byteArrayOutputStream, str, sb);
        return sb.toString();
    }

    private static void formatNames(Iterable<List<String>> iterable) {
        if (iterable != null) {
            for (List list : iterable) {
                String str = (String) list.get(0);
                String[] strArr = new String[5];
                int i = 0;
                int i2 = 0;
                while (i2 < strArr.length - 1) {
                    int indexOf = str.indexOf(59, i);
                    int i3 = indexOf;
                    if (indexOf < 0) {
                        break;
                    }
                    strArr[i2] = str.substring(i, i3);
                    i2++;
                    i = i3 + 1;
                }
                strArr[i2] = str.substring(i);
                StringBuilder sb = new StringBuilder(100);
                maybeAppendComponent(strArr, 3, sb);
                maybeAppendComponent(strArr, 1, sb);
                maybeAppendComponent(strArr, 2, sb);
                maybeAppendComponent(strArr, 0, sb);
                maybeAppendComponent(strArr, 4, sb);
                list.set(0, sb.toString().trim());
            }
        }
    }

    private static boolean isLikeVCardDate(CharSequence charSequence) {
        return charSequence == null || VCARD_LIKE_DATE.matcher(charSequence).matches();
    }

    static List<String> matchSingleVCardPrefixedField(CharSequence charSequence, String str, boolean z, boolean z2) {
        List matchVCardPrefixedField = matchVCardPrefixedField(charSequence, str, z, z2);
        if (matchVCardPrefixedField == null || matchVCardPrefixedField.isEmpty()) {
            return null;
        }
        return (List) matchVCardPrefixedField.get(0);
    }

    static List<List<String>> matchVCardPrefixedField(CharSequence charSequence, String str, boolean z, boolean z2) {
        int i;
        int i2;
        String str2;
        String str3 = str;
        List<List<String>> list = null;
        int i3 = 0;
        int length = str.length();
        while (true) {
            if (i3 >= length) {
                CharSequence charSequence2 = charSequence;
                break;
            }
            StringBuilder sb = new StringBuilder("(?:^|\n)");
            sb.append(charSequence);
            sb.append("(?:;([^:]*))?:");
            Matcher matcher = Pattern.compile(sb.toString(), 2).matcher(str3);
            if (i3 > 0) {
                i3--;
            }
            if (!matcher.find(i3)) {
                break;
            }
            int end = matcher.end(0);
            int i4 = 1;
            String group = matcher.group(1);
            List list2 = null;
            boolean z3 = false;
            String str4 = null;
            if (group != null) {
                String[] split = SEMICOLON.split(group);
                int length2 = split.length;
                String str5 = null;
                boolean z4 = false;
                List list3 = null;
                int i5 = 0;
                while (i5 < length2) {
                    String str6 = split[i5];
                    if (list3 == null) {
                        list3 = new ArrayList(i4);
                    }
                    list3.add(str6);
                    String[] split2 = EQUALS.split(str6, 2);
                    Matcher matcher2 = matcher;
                    if (split2.length > 1) {
                        String str7 = split2[0];
                        String str8 = split2[1];
                        if ("ENCODING".equalsIgnoreCase(str7) && "QUOTED-PRINTABLE".equalsIgnoreCase(str8)) {
                            z4 = true;
                        } else if ("CHARSET".equalsIgnoreCase(str7)) {
                            str5 = str8;
                        }
                    }
                    i5++;
                    matcher = matcher2;
                    CharSequence charSequence3 = charSequence;
                    i4 = 1;
                }
                Matcher matcher3 = matcher;
                list2 = list3;
                z3 = z4;
                str4 = str5;
            } else {
                Matcher matcher4 = matcher;
            }
            int i6 = end;
            while (true) {
                int indexOf = str3.indexOf(10, end);
                i = indexOf;
                if (indexOf < 0) {
                    break;
                } else if (i < str.length() - 1 && (str3.charAt(i + 1) == ' ' || str3.charAt(i + 1) == 9)) {
                    end = i + 2;
                } else if (!z3) {
                    break;
                } else {
                    if (i < 1 || str3.charAt(i - 1) != '=') {
                        if (i >= 2) {
                            if (str3.charAt(i - 2) != '=') {
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                    end = i + 1;
                }
            }
            if (i < 0) {
                i3 = length;
            } else if (i > i6) {
                if (list == null) {
                    i2 = 1;
                    list = new ArrayList<>(1);
                } else {
                    i2 = 1;
                }
                if (i >= i2 && str3.charAt(i - 1) == 13) {
                    i--;
                }
                String substring = str3.substring(i6, i);
                if (z) {
                    substring = substring.trim();
                }
                if (z3) {
                    str2 = decodeQuotedPrintable(substring, str4);
                    if (z2) {
                        str2 = UNESCAPED_SEMICOLONS.matcher(str2).replaceAll("\n").trim();
                    }
                } else {
                    if (z2) {
                        substring = UNESCAPED_SEMICOLONS.matcher(substring).replaceAll("\n").trim();
                    }
                    str2 = VCARD_ESCAPES.matcher(NEWLINE_ESCAPE.matcher(CR_LF_SPACE_TAB.matcher(substring).replaceAll("")).replaceAll("\n")).replaceAll("$1");
                }
                if (list2 == null) {
                    ArrayList arrayList = new ArrayList(1);
                    arrayList.add(str2);
                    list.add(arrayList);
                } else {
                    list2.add(0, str2);
                    list.add(list2);
                }
                i3 = i + 1;
            } else {
                i3 = i + 1;
            }
        }
        return list;
    }

    private static void maybeAppendComponent(String[] strArr, int i, StringBuilder sb) {
        if (strArr[i] != null && !strArr[i].isEmpty()) {
            if (sb.length() > 0) {
                sb.append(' ');
            }
            sb.append(strArr[i]);
        }
    }

    private static void maybeAppendFragment(ByteArrayOutputStream byteArrayOutputStream, String str, StringBuilder sb) {
        String str2;
        if (byteArrayOutputStream.size() > 0) {
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            if (str == null) {
                str2 = new String(byteArray, Charset.forName("UTF-8"));
            } else {
                try {
                    str2 = new String(byteArray, str);
                } catch (UnsupportedEncodingException e) {
                    str2 = new String(byteArray, Charset.forName("UTF-8"));
                }
            }
            byteArrayOutputStream.reset();
            sb.append(str2);
        }
    }

    private static String toPrimaryValue(List<String> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        return (String) list.get(0);
    }

    private static String[] toPrimaryValues(Collection<List<String>> collection) {
        if (collection == null || collection.isEmpty()) {
            return null;
        }
        ArrayList arrayList = new ArrayList(collection.size());
        for (List list : collection) {
            String str = (String) list.get(0);
            if (str != null && !str.isEmpty()) {
                arrayList.add(str);
            }
        }
        return (String[]) arrayList.toArray(new String[collection.size()]);
    }

    private static String[] toTypes(Collection<List<String>> collection) {
        if (collection == null || collection.isEmpty()) {
            return null;
        }
        ArrayList arrayList = new ArrayList(collection.size());
        for (List list : collection) {
            String str = null;
            int i = 1;
            while (true) {
                if (i >= list.size()) {
                    break;
                }
                String str2 = (String) list.get(i);
                int indexOf = str2.indexOf(61);
                if (indexOf < 0) {
                    str = str2;
                    break;
                } else if ("TYPE".equalsIgnoreCase(str2.substring(0, indexOf))) {
                    str = str2.substring(indexOf + 1);
                    break;
                } else {
                    i++;
                }
            }
            arrayList.add(str);
        }
        return (String[]) arrayList.toArray(new String[collection.size()]);
    }

    public AddressBookParsedResult parse(Result result) {
        String[] strArr;
        String massagedText = getMassagedText(result);
        Matcher matcher = BEGIN_VCARD.matcher(massagedText);
        if (!matcher.find()) {
            String str = massagedText;
            Matcher matcher2 = matcher;
        } else if (matcher.start() != 0) {
            String str2 = massagedText;
            Matcher matcher3 = matcher;
        } else {
            List matchVCardPrefixedField = matchVCardPrefixedField("FN", massagedText, true, false);
            if (matchVCardPrefixedField == null) {
                matchVCardPrefixedField = matchVCardPrefixedField("N", massagedText, true, false);
                formatNames(matchVCardPrefixedField);
            }
            List matchSingleVCardPrefixedField = matchSingleVCardPrefixedField("NICKNAME", massagedText, true, false);
            String[] split = matchSingleVCardPrefixedField == null ? null : COMMA.split((CharSequence) matchSingleVCardPrefixedField.get(0));
            List matchVCardPrefixedField2 = matchVCardPrefixedField("TEL", massagedText, true, false);
            List matchVCardPrefixedField3 = matchVCardPrefixedField("EMAIL", massagedText, true, false);
            List matchSingleVCardPrefixedField2 = matchSingleVCardPrefixedField("NOTE", massagedText, false, false);
            List matchVCardPrefixedField4 = matchVCardPrefixedField("ADR", massagedText, true, true);
            List matchSingleVCardPrefixedField3 = matchSingleVCardPrefixedField("ORG", massagedText, true, true);
            List matchSingleVCardPrefixedField4 = matchSingleVCardPrefixedField("BDAY", massagedText, true, false);
            if (matchSingleVCardPrefixedField4 != null && !isLikeVCardDate((CharSequence) matchSingleVCardPrefixedField4.get(0))) {
                matchSingleVCardPrefixedField4 = null;
            }
            List list = matchSingleVCardPrefixedField4;
            List matchSingleVCardPrefixedField5 = matchSingleVCardPrefixedField("TITLE", massagedText, true, false);
            List matchVCardPrefixedField5 = matchVCardPrefixedField("URL", massagedText, true, false);
            List matchSingleVCardPrefixedField6 = matchSingleVCardPrefixedField("IMPP", massagedText, true, false);
            Matcher matcher4 = matcher;
            List matchSingleVCardPrefixedField7 = matchSingleVCardPrefixedField("GEO", massagedText, true, false);
            String[] split2 = matchSingleVCardPrefixedField7 == null ? null : SEMICOLON_OR_COMMA.split((CharSequence) matchSingleVCardPrefixedField7.get(0));
            if (split2 != null) {
                String str3 = massagedText;
                if (split2.length != 2) {
                    strArr = null;
                    String[] primaryValues = toPrimaryValues(matchVCardPrefixedField);
                    String[] primaryValues2 = toPrimaryValues(matchVCardPrefixedField2);
                    String[] types = toTypes(matchVCardPrefixedField2);
                    String[] primaryValues3 = toPrimaryValues(matchVCardPrefixedField3);
                    String[] types2 = toTypes(matchVCardPrefixedField3);
                    String primaryValue = toPrimaryValue(matchSingleVCardPrefixedField6);
                    String primaryValue2 = toPrimaryValue(matchSingleVCardPrefixedField2);
                    String[] primaryValues4 = toPrimaryValues(matchVCardPrefixedField4);
                    String[] types3 = toTypes(matchVCardPrefixedField4);
                    String primaryValue3 = toPrimaryValue(matchSingleVCardPrefixedField3);
                    String primaryValue4 = toPrimaryValue(list);
                    String primaryValue5 = toPrimaryValue(matchSingleVCardPrefixedField5);
                    List list2 = matchVCardPrefixedField5;
                    List list3 = matchSingleVCardPrefixedField5;
                    String[] strArr2 = primaryValues;
                    List list4 = list;
                    List list5 = matchSingleVCardPrefixedField3;
                    List list6 = matchVCardPrefixedField4;
                    List list7 = matchSingleVCardPrefixedField2;
                    List list8 = matchVCardPrefixedField3;
                    AddressBookParsedResult addressBookParsedResult = new AddressBookParsedResult(strArr2, split, null, primaryValues2, types, primaryValues3, types2, primaryValue, primaryValue2, primaryValues4, types3, primaryValue3, primaryValue4, primaryValue5, toPrimaryValues(matchVCardPrefixedField5), strArr);
                    return addressBookParsedResult;
                }
            } else {
                String str4 = massagedText;
            }
            strArr = split2;
            String[] primaryValues5 = toPrimaryValues(matchVCardPrefixedField);
            String[] primaryValues22 = toPrimaryValues(matchVCardPrefixedField2);
            String[] types4 = toTypes(matchVCardPrefixedField2);
            String[] primaryValues32 = toPrimaryValues(matchVCardPrefixedField3);
            String[] types22 = toTypes(matchVCardPrefixedField3);
            String primaryValue6 = toPrimaryValue(matchSingleVCardPrefixedField6);
            String primaryValue22 = toPrimaryValue(matchSingleVCardPrefixedField2);
            String[] primaryValues42 = toPrimaryValues(matchVCardPrefixedField4);
            String[] types32 = toTypes(matchVCardPrefixedField4);
            String primaryValue32 = toPrimaryValue(matchSingleVCardPrefixedField3);
            String primaryValue42 = toPrimaryValue(list);
            String primaryValue52 = toPrimaryValue(matchSingleVCardPrefixedField5);
            List list22 = matchVCardPrefixedField5;
            List list32 = matchSingleVCardPrefixedField5;
            String[] strArr22 = primaryValues5;
            List list42 = list;
            List list52 = matchSingleVCardPrefixedField3;
            List list62 = matchVCardPrefixedField4;
            List list72 = matchSingleVCardPrefixedField2;
            List list82 = matchVCardPrefixedField3;
            AddressBookParsedResult addressBookParsedResult2 = new AddressBookParsedResult(strArr22, split, null, primaryValues22, types4, primaryValues32, types22, primaryValue6, primaryValue22, primaryValues42, types32, primaryValue32, primaryValue42, primaryValue52, toPrimaryValues(matchVCardPrefixedField5), strArr);
            return addressBookParsedResult2;
        }
        return null;
    }
}
