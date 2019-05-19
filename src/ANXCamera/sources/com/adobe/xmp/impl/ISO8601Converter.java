package com.adobe.xmp.impl;

import com.adobe.xmp.XMPDateTime;
import com.adobe.xmp.XMPException;
import com.ss.android.ugc.effectmanager.link.model.configuration.LinkSelectorConfiguration;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;
import java.util.SimpleTimeZone;

public final class ISO8601Converter {
    private ISO8601Converter() {
    }

    public static XMPDateTime parse(String str) throws XMPException {
        return parse(str, new XMPDateTimeImpl());
    }

    /* JADX WARNING: Removed duplicated region for block: B:118:0x0210 A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:119:0x0211  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static XMPDateTime parse(String str, XMPDateTime xMPDateTime) throws XMPException {
        int i;
        int i2;
        int i3;
        ParameterAsserts.assertNotNull(str);
        ParseState parseState = new ParseState(str);
        int i4 = 0;
        boolean z = parseState.ch(0) == 'T' || (parseState.length() >= 2 && parseState.ch(1) == ':') || (parseState.length() >= 3 && parseState.ch(2) == ':');
        if (!z) {
            if (parseState.ch(0) == '-') {
                parseState.skip();
            }
            int gatherInt = parseState.gatherInt("Invalid year in date string", 9999);
            if (!parseState.hasNext() || parseState.ch() == '-') {
                if (parseState.ch(0) == '-') {
                    gatherInt = -gatherInt;
                }
                xMPDateTime.setYear(gatherInt);
                if (!parseState.hasNext()) {
                    return xMPDateTime;
                }
                parseState.skip();
                int gatherInt2 = parseState.gatherInt("Invalid month in date string", 12);
                if (!parseState.hasNext() || parseState.ch() == '-') {
                    xMPDateTime.setMonth(gatherInt2);
                    if (!parseState.hasNext()) {
                        return xMPDateTime;
                    }
                    parseState.skip();
                    int gatherInt3 = parseState.gatherInt("Invalid day in date string", 31);
                    if (!parseState.hasNext() || parseState.ch() == 'T') {
                        xMPDateTime.setDay(gatherInt3);
                        if (!parseState.hasNext()) {
                            return xMPDateTime;
                        }
                    } else {
                        throw new XMPException("Invalid date string, after day", 5);
                    }
                } else {
                    throw new XMPException("Invalid date string, after month", 5);
                }
            } else {
                throw new XMPException("Invalid date string, after year", 5);
            }
        } else {
            xMPDateTime.setMonth(1);
            xMPDateTime.setDay(1);
        }
        if (parseState.ch() == 'T') {
            parseState.skip();
        } else if (!z) {
            throw new XMPException("Invalid date string, missing 'T' after date", 5);
        }
        int gatherInt4 = parseState.gatherInt("Invalid hour in date string", 23);
        if (parseState.ch() == ':') {
            xMPDateTime.setHour(gatherInt4);
            parseState.skip();
            int gatherInt5 = parseState.gatherInt("Invalid minute in date string", 59);
            if (!parseState.hasNext() || parseState.ch() == ':' || parseState.ch() == 'Z' || parseState.ch() == '+' || parseState.ch() == '-') {
                xMPDateTime.setMinute(gatherInt5);
                if (parseState.ch() == ':') {
                    parseState.skip();
                    int gatherInt6 = parseState.gatherInt("Invalid whole seconds in date string", 59);
                    if (!parseState.hasNext() || parseState.ch() == '.' || parseState.ch() == 'Z' || parseState.ch() == '+' || parseState.ch() == '-') {
                        xMPDateTime.setSecond(gatherInt6);
                        if (parseState.ch() == '.') {
                            parseState.skip();
                            int pos = parseState.pos();
                            int gatherInt7 = parseState.gatherInt("Invalid fractional seconds in date string", 999999999);
                            if (parseState.ch() == 'Z' || parseState.ch() == '+' || parseState.ch() == '-') {
                                int pos2 = parseState.pos() - pos;
                                while (pos2 > 9) {
                                    gatherInt7 /= 10;
                                    pos2--;
                                }
                                while (pos2 < 9) {
                                    gatherInt7 *= 10;
                                    pos2++;
                                }
                                xMPDateTime.setNanoSecond(gatherInt7);
                            } else {
                                throw new XMPException("Invalid date string, after fractional second", 5);
                            }
                        }
                    } else {
                        throw new XMPException("Invalid date string, after whole seconds", 5);
                    }
                }
                if (parseState.ch() == 'Z') {
                    parseState.skip();
                } else if (parseState.hasNext()) {
                    if (parseState.ch() == '+') {
                        i3 = 1;
                    } else if (parseState.ch() == '-') {
                        i3 = -1;
                    } else {
                        throw new XMPException("Time zone must begin with 'Z', '+', or '-'", 5);
                    }
                    parseState.skip();
                    int gatherInt8 = parseState.gatherInt("Invalid time zone hour in date string", 23);
                    if (parseState.ch() == ':') {
                        parseState.skip();
                        i = parseState.gatherInt("Invalid time zone minute in date string", 59);
                        int i5 = gatherInt8;
                        i2 = i3;
                        i4 = i5;
                        xMPDateTime.setTimeZone(new SimpleTimeZone(((i4 * 3600 * 1000) + (i * 60 * 1000)) * i2, ""));
                        if (parseState.hasNext()) {
                            return xMPDateTime;
                        }
                        throw new XMPException("Invalid date string, extra chars at end", 5);
                    }
                    throw new XMPException("Invalid date string, after time zone hour", 5);
                }
                i2 = 0;
                i = 0;
                xMPDateTime.setTimeZone(new SimpleTimeZone(((i4 * 3600 * 1000) + (i * 60 * 1000)) * i2, ""));
                if (parseState.hasNext()) {
                }
            } else {
                throw new XMPException("Invalid date string, after minute", 5);
            }
        } else {
            throw new XMPException("Invalid date string, after hour", 5);
        }
    }

    public static String render(XMPDateTime xMPDateTime) {
        StringBuffer stringBuffer = new StringBuffer();
        DecimalFormat decimalFormat = new DecimalFormat("0000", new DecimalFormatSymbols(Locale.ENGLISH));
        stringBuffer.append(decimalFormat.format((long) xMPDateTime.getYear()));
        if (xMPDateTime.getMonth() == 0) {
            return stringBuffer.toString();
        }
        decimalFormat.applyPattern("'-'00");
        stringBuffer.append(decimalFormat.format((long) xMPDateTime.getMonth()));
        if (xMPDateTime.getDay() == 0) {
            return stringBuffer.toString();
        }
        stringBuffer.append(decimalFormat.format((long) xMPDateTime.getDay()));
        if (!(xMPDateTime.getHour() == 0 && xMPDateTime.getMinute() == 0 && xMPDateTime.getSecond() == 0 && xMPDateTime.getNanoSecond() == 0 && (xMPDateTime.getTimeZone() == null || xMPDateTime.getTimeZone().getRawOffset() == 0))) {
            stringBuffer.append('T');
            decimalFormat.applyPattern("00");
            stringBuffer.append(decimalFormat.format((long) xMPDateTime.getHour()));
            stringBuffer.append(':');
            stringBuffer.append(decimalFormat.format((long) xMPDateTime.getMinute()));
            if (!(xMPDateTime.getSecond() == 0 && xMPDateTime.getNanoSecond() == 0)) {
                double second = ((double) xMPDateTime.getSecond()) + (((double) xMPDateTime.getNanoSecond()) / 1.0E9d);
                decimalFormat.applyPattern(":00.#########");
                stringBuffer.append(decimalFormat.format(second));
            }
            if (xMPDateTime.getTimeZone() != null) {
                int offset = xMPDateTime.getTimeZone().getOffset(xMPDateTime.getCalendar().getTimeInMillis());
                if (offset == 0) {
                    stringBuffer.append('Z');
                } else {
                    int i = offset / 3600000;
                    int abs = Math.abs((offset % 3600000) / LinkSelectorConfiguration.MS_OF_ONE_MIN);
                    decimalFormat.applyPattern("+00;-00");
                    stringBuffer.append(decimalFormat.format((long) i));
                    decimalFormat.applyPattern(":00");
                    stringBuffer.append(decimalFormat.format((long) abs));
                }
            }
        }
        return stringBuffer.toString();
    }
}
