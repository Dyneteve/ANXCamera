package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class GeoResultParser extends ResultParser {
    private static final Pattern GEO_URL_PATTERN = Pattern.compile("geo:([\\-0-9.]+),([\\-0-9.]+)(?:,([\\-0-9.]+))?(?:\\?(.*))?", 2);

    public GeoParsedResult parse(Result result) {
        double d;
        Matcher matcher = GEO_URL_PATTERN.matcher(getMassagedText(result));
        if (!matcher.matches()) {
            return null;
        }
        String group = matcher.group(4);
        try {
            double parseDouble = Double.parseDouble(matcher.group(1));
            if (parseDouble <= 90.0d) {
                if (parseDouble >= -90.0d) {
                    double parseDouble2 = Double.parseDouble(matcher.group(2));
                    if (parseDouble2 <= 180.0d) {
                        if (parseDouble2 >= -180.0d) {
                            if (matcher.group(3) == null) {
                                d = 0.0d;
                            } else {
                                d = Double.parseDouble(matcher.group(3));
                                if (d < 0.0d) {
                                    return null;
                                }
                            }
                            GeoParsedResult geoParsedResult = new GeoParsedResult(parseDouble, parseDouble2, d, group);
                            return geoParsedResult;
                        }
                    }
                    return null;
                }
            }
            return null;
        } catch (NumberFormatException e) {
            return null;
        }
    }
}
