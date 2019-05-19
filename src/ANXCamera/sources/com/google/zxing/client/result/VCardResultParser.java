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

    public AddressBookParsedResult parse(Result result) {
        String[] geo;
        String rawText = getMassagedText(result);
        Matcher m = BEGIN_VCARD.matcher(rawText);
        if (!m.find()) {
            Matcher matcher = m;
        } else if (m.start() != 0) {
            String str = rawText;
            Matcher matcher2 = m;
        } else {
            List<List<String>> names = matchVCardPrefixedField("FN", rawText, true, false);
            if (names == null) {
                names = matchVCardPrefixedField("N", rawText, true, false);
                formatNames(names);
            }
            List<String> nicknameString = matchSingleVCardPrefixedField("NICKNAME", rawText, true, false);
            String[] nicknames = nicknameString == null ? null : COMMA.split((CharSequence) nicknameString.get(0));
            List<List<String>> phoneNumbers = matchVCardPrefixedField("TEL", rawText, true, false);
            List<List<String>> emails = matchVCardPrefixedField("EMAIL", rawText, true, false);
            List<String> note = matchSingleVCardPrefixedField("NOTE", rawText, false, false);
            List<List<String>> addresses = matchVCardPrefixedField("ADR", rawText, true, true);
            List<String> org2 = matchSingleVCardPrefixedField("ORG", rawText, true, true);
            List<String> birthday = matchSingleVCardPrefixedField("BDAY", rawText, true, false);
            if (birthday != null && !isLikeVCardDate((CharSequence) birthday.get(0))) {
                birthday = null;
            }
            List<String> birthday2 = birthday;
            List<String> title = matchSingleVCardPrefixedField("TITLE", rawText, true, false);
            List<List<String>> urls = matchVCardPrefixedField("URL", rawText, true, false);
            List<String> instantMessenger = matchSingleVCardPrefixedField("IMPP", rawText, true, false);
            Matcher matcher3 = m;
            List<String> geoString = matchSingleVCardPrefixedField("GEO", rawText, true, false);
            String[] geo2 = geoString == null ? null : SEMICOLON_OR_COMMA.split((CharSequence) geoString.get(0));
            if (geo2 != null) {
                String str2 = rawText;
                if (geo2.length != 2) {
                    geo = null;
                    String[] primaryValues = toPrimaryValues(names);
                    String[] primaryValues2 = toPrimaryValues(phoneNumbers);
                    String[] types = toTypes(phoneNumbers);
                    String[] primaryValues3 = toPrimaryValues(emails);
                    String[] types2 = toTypes(emails);
                    String primaryValue = toPrimaryValue(instantMessenger);
                    String primaryValue2 = toPrimaryValue(note);
                    String[] primaryValues4 = toPrimaryValues(addresses);
                    String[] types3 = toTypes(addresses);
                    String primaryValue3 = toPrimaryValue(org2);
                    String primaryValue4 = toPrimaryValue(birthday2);
                    String primaryValue5 = toPrimaryValue(title);
                    List list = urls;
                    List list2 = title;
                    String[] strArr = primaryValues;
                    List list3 = birthday2;
                    List list4 = org2;
                    List list5 = addresses;
                    List list6 = note;
                    List list7 = emails;
                    AddressBookParsedResult addressBookParsedResult = new AddressBookParsedResult(strArr, nicknames, null, primaryValues2, types, primaryValues3, types2, primaryValue, primaryValue2, primaryValues4, types3, primaryValue3, primaryValue4, primaryValue5, toPrimaryValues(urls), geo);
                    return addressBookParsedResult;
                }
            }
            geo = geo2;
            String[] primaryValues5 = toPrimaryValues(names);
            String[] primaryValues22 = toPrimaryValues(phoneNumbers);
            String[] types4 = toTypes(phoneNumbers);
            String[] primaryValues32 = toPrimaryValues(emails);
            String[] types22 = toTypes(emails);
            String primaryValue6 = toPrimaryValue(instantMessenger);
            String primaryValue22 = toPrimaryValue(note);
            String[] primaryValues42 = toPrimaryValues(addresses);
            String[] types32 = toTypes(addresses);
            String primaryValue32 = toPrimaryValue(org2);
            String primaryValue42 = toPrimaryValue(birthday2);
            String primaryValue52 = toPrimaryValue(title);
            List list8 = urls;
            List list22 = title;
            String[] strArr2 = primaryValues5;
            List list32 = birthday2;
            List list42 = org2;
            List list52 = addresses;
            List list62 = note;
            List list72 = emails;
            AddressBookParsedResult addressBookParsedResult2 = new AddressBookParsedResult(strArr2, nicknames, null, primaryValues22, types4, primaryValues32, types22, primaryValue6, primaryValue22, primaryValues42, types32, primaryValue32, primaryValue42, primaryValue52, toPrimaryValues(urls), geo);
            return addressBookParsedResult2;
        }
        return null;
    }

    static List<List<String>> matchVCardPrefixedField(CharSequence prefix, String rawText, boolean trim, boolean parseFieldDivider) {
        int i;
        int i2;
        String element;
        String str = rawText;
        List<List<String>> matches = null;
        int i3 = 0;
        int max = rawText.length();
        while (true) {
            if (i3 >= max) {
                CharSequence charSequence = prefix;
                break;
            }
            StringBuilder sb = new StringBuilder("(?:^|\n)");
            sb.append(prefix);
            sb.append("(?:;([^:]*))?:");
            Matcher matcher = Pattern.compile(sb.toString(), 2).matcher(str);
            if (i3 > 0) {
                i3--;
            }
            if (!matcher.find(i3)) {
                break;
            }
            int i4 = matcher.end(0);
            int i5 = 1;
            String metadataString = matcher.group(1);
            List list = null;
            boolean quotedPrintable = false;
            String quotedPrintableCharset = null;
            if (metadataString != null) {
                String[] split = SEMICOLON.split(metadataString);
                int length = split.length;
                String quotedPrintableCharset2 = null;
                boolean quotedPrintable2 = false;
                List<String> metadata = null;
                int i6 = 0;
                while (i6 < length) {
                    String metadatum = split[i6];
                    if (metadata == null) {
                        metadata = new ArrayList<>(i5);
                    }
                    metadata.add(metadatum);
                    String[] metadatumTokens = EQUALS.split(metadatum, 2);
                    Matcher matcher2 = matcher;
                    if (metadatumTokens.length > 1) {
                        String key = metadatumTokens[0];
                        String value = metadatumTokens[1];
                        if ("ENCODING".equalsIgnoreCase(key) && "QUOTED-PRINTABLE".equalsIgnoreCase(value)) {
                            quotedPrintable2 = true;
                        } else if ("CHARSET".equalsIgnoreCase(key)) {
                            quotedPrintableCharset2 = value;
                        }
                    }
                    i6++;
                    matcher = matcher2;
                    CharSequence charSequence2 = prefix;
                    i5 = 1;
                }
                Matcher matcher3 = matcher;
                list = metadata;
                quotedPrintable = quotedPrintable2;
                quotedPrintableCharset = quotedPrintableCharset2;
            }
            int matchStart = i4;
            while (true) {
                int indexOf = str.indexOf(10, i4);
                i = indexOf;
                if (indexOf < 0) {
                    break;
                } else if (i < rawText.length() - 1 && (str.charAt(i + 1) == ' ' || str.charAt(i + 1) == 9)) {
                    i4 = i + 2;
                } else if (!quotedPrintable) {
                    break;
                } else {
                    if (i < 1 || str.charAt(i - 1) != '=') {
                        if (i >= 2) {
                            if (str.charAt(i - 2) != '=') {
                                break;
                            }
                        } else {
                            break;
                        }
                    }
                    i4 = i + 1;
                }
            }
            if (i < 0) {
                i3 = max;
            } else if (i > matchStart) {
                if (matches == null) {
                    i2 = 1;
                    matches = new ArrayList<>(1);
                } else {
                    i2 = 1;
                }
                if (i >= i2 && str.charAt(i - 1) == 13) {
                    i--;
                }
                String element2 = str.substring(matchStart, i);
                if (trim) {
                    element2 = element2.trim();
                }
                if (quotedPrintable) {
                    element = decodeQuotedPrintable(element2, quotedPrintableCharset);
                    if (parseFieldDivider) {
                        element = UNESCAPED_SEMICOLONS.matcher(element).replaceAll("\n").trim();
                    }
                } else {
                    if (parseFieldDivider) {
                        element2 = UNESCAPED_SEMICOLONS.matcher(element2).replaceAll("\n").trim();
                    }
                    element = VCARD_ESCAPES.matcher(NEWLINE_ESCAPE.matcher(CR_LF_SPACE_TAB.matcher(element2).replaceAll("")).replaceAll("\n")).replaceAll("$1");
                }
                if (list == null) {
                    List<String> match = new ArrayList<>(1);
                    match.add(element);
                    matches.add(match);
                } else {
                    list.add(0, element);
                    matches.add(list);
                }
                i3 = i + 1;
            } else {
                i3 = i + 1;
            }
        }
        return matches;
    }

    private static String decodeQuotedPrintable(CharSequence value, String charset) {
        int length = value.length();
        StringBuilder result = new StringBuilder(length);
        ByteArrayOutputStream fragmentBuffer = new ByteArrayOutputStream();
        int i = 0;
        while (i < length) {
            char c = value.charAt(i);
            if (!(c == 10 || c == 13)) {
                if (c != '=') {
                    maybeAppendFragment(fragmentBuffer, charset, result);
                    result.append(c);
                } else if (i < length - 2) {
                    char nextChar = value.charAt(i + 1);
                    if (!(nextChar == 13 || nextChar == 10)) {
                        char nextNextChar = value.charAt(i + 2);
                        int firstDigit = parseHexDigit(nextChar);
                        int secondDigit = parseHexDigit(nextNextChar);
                        if (firstDigit >= 0 && secondDigit >= 0) {
                            fragmentBuffer.write((firstDigit << 4) + secondDigit);
                        }
                        i += 2;
                    }
                }
            }
            i++;
        }
        maybeAppendFragment(fragmentBuffer, charset, result);
        return result.toString();
    }

    private static void maybeAppendFragment(ByteArrayOutputStream fragmentBuffer, String charset, StringBuilder result) {
        String fragment;
        if (fragmentBuffer.size() > 0) {
            byte[] fragmentBytes = fragmentBuffer.toByteArray();
            if (charset == null) {
                fragment = new String(fragmentBytes, Charset.forName("UTF-8"));
            } else {
                try {
                    fragment = new String(fragmentBytes, charset);
                } catch (UnsupportedEncodingException e) {
                    fragment = new String(fragmentBytes, Charset.forName("UTF-8"));
                }
            }
            fragmentBuffer.reset();
            result.append(fragment);
        }
    }

    static List<String> matchSingleVCardPrefixedField(CharSequence prefix, String rawText, boolean trim, boolean parseFieldDivider) {
        List<List<String>> values = matchVCardPrefixedField(prefix, rawText, trim, parseFieldDivider);
        if (values == null || values.isEmpty()) {
            return null;
        }
        return (List) values.get(0);
    }

    private static String toPrimaryValue(List<String> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        return (String) list.get(0);
    }

    private static String[] toPrimaryValues(Collection<List<String>> lists) {
        if (lists == null || lists.isEmpty()) {
            return null;
        }
        List<String> result = new ArrayList<>(lists.size());
        for (List<String> list : lists) {
            String value = (String) list.get(0);
            if (value != null && !value.isEmpty()) {
                result.add(value);
            }
        }
        return (String[]) result.toArray(new String[lists.size()]);
    }

    private static String[] toTypes(Collection<List<String>> lists) {
        if (lists == null || lists.isEmpty()) {
            return null;
        }
        List<String> result = new ArrayList<>(lists.size());
        for (List<String> list : lists) {
            String type = null;
            int i = 1;
            while (true) {
                if (i >= list.size()) {
                    break;
                }
                String metadatum = (String) list.get(i);
                int equals = metadatum.indexOf(61);
                if (equals < 0) {
                    type = metadatum;
                    break;
                } else if ("TYPE".equalsIgnoreCase(metadatum.substring(0, equals))) {
                    type = metadatum.substring(equals + 1);
                    break;
                } else {
                    i++;
                }
            }
            result.add(type);
        }
        return (String[]) result.toArray(new String[lists.size()]);
    }

    private static boolean isLikeVCardDate(CharSequence value) {
        return value == null || VCARD_LIKE_DATE.matcher(value).matches();
    }

    private static void formatNames(Iterable<List<String>> names) {
        if (names != null) {
            for (List<String> list : names) {
                String name = (String) list.get(0);
                String[] components = new String[5];
                int start = 0;
                int componentIndex = 0;
                while (componentIndex < components.length - 1) {
                    int indexOf = name.indexOf(59, start);
                    int end = indexOf;
                    if (indexOf < 0) {
                        break;
                    }
                    components[componentIndex] = name.substring(start, end);
                    componentIndex++;
                    start = end + 1;
                }
                components[componentIndex] = name.substring(start);
                StringBuilder newName = new StringBuilder(100);
                maybeAppendComponent(components, 3, newName);
                maybeAppendComponent(components, 1, newName);
                maybeAppendComponent(components, 2, newName);
                maybeAppendComponent(components, 0, newName);
                maybeAppendComponent(components, 4, newName);
                list.set(0, newName.toString().trim());
            }
        }
    }

    private static void maybeAppendComponent(String[] components, int i, StringBuilder newName) {
        if (components[i] != null && !components[i].isEmpty()) {
            if (newName.length() > 0) {
                newName.append(' ');
            }
            newName.append(components[i]);
        }
    }
}
