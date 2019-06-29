package miui.maml.animation.interpolater;

import android.text.TextUtils;
import android.util.Log;
import android.view.animation.Interpolator;

public class InterpolatorFactory {
    public static final String LOG_TAG = "InterpolatorFactory";

    public static Interpolator create(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        int indexOf = str.indexOf(40);
        int indexOf2 = str.indexOf(41);
        float f = 0.0f;
        float f2 = 0.0f;
        boolean z = false;
        boolean z2 = false;
        if (!(indexOf == -1 || indexOf2 == -1)) {
            z = true;
            String substring = str.substring(indexOf + 1, indexOf2);
            String str2 = substring;
            String str3 = "";
            int indexOf3 = substring.indexOf(",");
            if (indexOf3 != -1) {
                z2 = true;
                str2 = substring.substring(0, indexOf3);
                str3 = substring.substring(indexOf3 + 1);
            }
            try {
                f = Float.parseFloat(str2);
                if (z2) {
                    f2 = Float.parseFloat(str3);
                }
            } catch (NumberFormatException e) {
                String str4 = LOG_TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("parse error:");
                sb.append(substring);
                Log.d(str4, sb.toString());
            }
        }
        if ("BackEaseIn".equalsIgnoreCase(str)) {
            return new BackEaseInInterpolater();
        }
        if ("BackEaseOut".equalsIgnoreCase(str)) {
            return new BackEaseOutInterpolater();
        }
        if ("BackEaseInOut".equalsIgnoreCase(str)) {
            return new BackEaseInOutInterpolater();
        }
        if (str.startsWith("BackEaseIn") && z) {
            return new BackEaseInInterpolater(f);
        }
        if (str.startsWith("BackEaseOut") && z) {
            return new BackEaseOutInterpolater(f);
        }
        if (str.startsWith("BackEaseInOut") && z) {
            return new BackEaseInOutInterpolater(f);
        }
        if ("BounceEaseIn".equalsIgnoreCase(str)) {
            return new BounceEaseInInterpolater();
        }
        if ("BounceEaseOut".equalsIgnoreCase(str)) {
            return new BounceEaseOutInterpolater();
        }
        if ("BounceEaseInOut".equalsIgnoreCase(str)) {
            return new BounceEaseInOutInterpolater();
        }
        if ("CircEaseIn".equalsIgnoreCase(str)) {
            return new CircEaseInInterpolater();
        }
        if ("CircEaseOut".equalsIgnoreCase(str)) {
            return new CircEaseOutInterpolater();
        }
        if ("CircEaseInOut".equalsIgnoreCase(str)) {
            return new CircEaseInOutInterpolater();
        }
        if ("CubicEaseIn".equalsIgnoreCase(str)) {
            return new CubicEaseInInterpolater();
        }
        if ("CubicEaseOut".equalsIgnoreCase(str)) {
            return new CubicEaseOutInterpolater();
        }
        if ("CubicEaseInOut".equalsIgnoreCase(str)) {
            return new CubicEaseInOutInterpolater();
        }
        if ("ElasticEaseIn".equalsIgnoreCase(str)) {
            return new ElasticEaseInInterpolater();
        }
        if ("ElasticEaseOut".equalsIgnoreCase(str)) {
            return new ElasticEaseOutInterpolater();
        }
        if ("ElasticEaseInOut".equalsIgnoreCase(str)) {
            return new ElasticEaseInOutInterpolater();
        }
        if (str.startsWith("ElasticEaseIn") && z2) {
            return new ElasticEaseInInterpolater(f, f2);
        }
        if (str.startsWith("ElasticEaseOut") && z2) {
            return new ElasticEaseOutInterpolater(f, f2);
        }
        if (str.startsWith("ElasticEaseInOut") && z2) {
            return new ElasticEaseInOutInterpolater(f, f2);
        }
        if ("ExpoEaseIn".equalsIgnoreCase(str)) {
            return new ExpoEaseInInterpolater();
        }
        if ("ExpoEaseOut".equalsIgnoreCase(str)) {
            return new ExpoEaseOutInterpolater();
        }
        if ("ExpoEaseInOut".equalsIgnoreCase(str)) {
            return new ExpoEaseInOutInterpolater();
        }
        if ("QuadEaseIn".equalsIgnoreCase(str)) {
            return new QuadEaseInInterpolater();
        }
        if ("QuadEaseOut".equalsIgnoreCase(str)) {
            return new QuadEaseOutInterpolater();
        }
        if ("QuadEaseInOut".equalsIgnoreCase(str)) {
            return new QuadEaseInOutInterpolater();
        }
        if ("QuartEaseIn".equalsIgnoreCase(str)) {
            return new QuartEaseInInterpolater();
        }
        if ("QuartEaseOut".equalsIgnoreCase(str)) {
            return new QuartEaseOutInterpolater();
        }
        if ("QuartEaseInOut".equalsIgnoreCase(str)) {
            return new QuartEaseInOutInterpolater();
        }
        if ("QuintEaseIn".equalsIgnoreCase(str)) {
            return new QuintEaseInInterpolater();
        }
        if ("QuintEaseOut".equalsIgnoreCase(str)) {
            return new QuintEaseOutInterpolater();
        }
        if ("QuintEaseInOut".equalsIgnoreCase(str)) {
            return new QuintEaseInOutInterpolater();
        }
        if ("SineEaseIn".equalsIgnoreCase(str)) {
            return new SineEaseInInterpolater();
        }
        if ("SineEaseOut".equalsIgnoreCase(str)) {
            return new SineEaseOutInterpolater();
        }
        if ("SineEaseInOut".equalsIgnoreCase(str)) {
            return new SineEaseInOutInterpolater();
        }
        if ("Linear".equalsIgnoreCase(str)) {
            return new LinearInterpolater();
        }
        return null;
    }
}
