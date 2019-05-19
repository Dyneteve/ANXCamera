package com.google.zxing.client.result;

import com.google.zxing.Result;

public final class AddressBookDoCoMoResultParser extends AbstractDoCoMoResultParser {
    public AddressBookParsedResult parse(Result result) {
        String rawText = getMassagedText(result);
        if (!rawText.startsWith("MECARD:")) {
            return null;
        }
        String[] rawName = matchDoCoMoPrefixedField("N:", rawText, true);
        if (rawName == null) {
            return null;
        }
        String name = parseName(rawName[0]);
        String pronunciation = matchSingleDoCoMoPrefixedField("SOUND:", rawText, true);
        String[] phoneNumbers = matchDoCoMoPrefixedField("TEL:", rawText, true);
        String[] emails = matchDoCoMoPrefixedField("EMAIL:", rawText, true);
        String note = matchSingleDoCoMoPrefixedField("NOTE:", rawText, false);
        String[] addresses = matchDoCoMoPrefixedField("ADR:", rawText, true);
        String birthday = matchSingleDoCoMoPrefixedField("BDAY:", rawText, true);
        if (!isStringOfDigits(birthday, 8)) {
            birthday = null;
        }
        String birthday2 = birthday;
        String[] urls = matchDoCoMoPrefixedField("URL:", rawText, true);
        AddressBookParsedResult addressBookParsedResult = new AddressBookParsedResult(maybeWrap(name), null, pronunciation, phoneNumbers, null, emails, null, null, note, addresses, null, matchSingleDoCoMoPrefixedField("ORG:", rawText, true), birthday2, null, urls, null);
        return addressBookParsedResult;
    }

    private static String parseName(String name) {
        int comma = name.indexOf(44);
        if (comma < 0) {
            return name;
        }
        StringBuilder sb = new StringBuilder(String.valueOf(name.substring(comma + 1)));
        sb.append(' ');
        sb.append(name.substring(0, comma));
        return sb.toString();
    }
}
