package miui.maml.animation.interpolater;

import android.text.TextUtils;
import android.util.Log;
import android.view.animation.Interpolator;

public class InterpolatorFactory {
    public static final String LOG_TAG = "InterpolatorFactory";

    public static Interpolator create(String easeType) {
        if (TextUtils.isEmpty(easeType)) {
            return null;
        }
        int leftBracket = easeType.indexOf(40);
        int rightBracket = easeType.indexOf(41);
        float firstParam = 0.0f;
        float secondParam = 0.0f;
        boolean hasFirstParam = false;
        boolean hasSecondParam = false;
        if (!(leftBracket == -1 || rightBracket == -1)) {
            hasFirstParam = true;
            String params = easeType.substring(leftBracket + 1, rightBracket);
            String firstParamStr = params;
            String secondParamStr = "";
            int comma = params.indexOf(",");
            if (comma != -1) {
                hasSecondParam = true;
                firstParamStr = params.substring(0, comma);
                secondParamStr = params.substring(comma + 1);
            }
            try {
                firstParam = Float.parseFloat(firstParamStr);
                if (hasSecondParam) {
                    secondParam = Float.parseFloat(secondParamStr);
                }
            } catch (NumberFormatException e) {
                String str = LOG_TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("parse error:");
                sb.append(params);
                Log.d(str, sb.toString());
            }
        }
        if ("BackEaseIn".equalsIgnoreCase(easeType)) {
            return new BackEaseInInterpolater();
        }
        if ("BackEaseOut".equalsIgnoreCase(easeType)) {
            return new BackEaseOutInterpolater();
        }
        if ("BackEaseInOut".equalsIgnoreCase(easeType)) {
            return new BackEaseInOutInterpolater();
        }
        if (easeType.startsWith("BackEaseIn") && hasFirstParam) {
            return new BackEaseInInterpolater(firstParam);
        }
        if (easeType.startsWith("BackEaseOut") && hasFirstParam) {
            return new BackEaseOutInterpolater(firstParam);
        }
        if (easeType.startsWith("BackEaseInOut") && hasFirstParam) {
            return new BackEaseInOutInterpolater(firstParam);
        }
        if ("BounceEaseIn".equalsIgnoreCase(easeType)) {
            return new BounceEaseInInterpolater();
        }
        if ("BounceEaseOut".equalsIgnoreCase(easeType)) {
            return new BounceEaseOutInterpolater();
        }
        if ("BounceEaseInOut".equalsIgnoreCase(easeType)) {
            return new BounceEaseInOutInterpolater();
        }
        if ("CircEaseIn".equalsIgnoreCase(easeType)) {
            return new CircEaseInInterpolater();
        }
        if ("CircEaseOut".equalsIgnoreCase(easeType)) {
            return new CircEaseOutInterpolater();
        }
        if ("CircEaseInOut".equalsIgnoreCase(easeType)) {
            return new CircEaseInOutInterpolater();
        }
        if ("CubicEaseIn".equalsIgnoreCase(easeType)) {
            return new CubicEaseInInterpolater();
        }
        if ("CubicEaseOut".equalsIgnoreCase(easeType)) {
            return new CubicEaseOutInterpolater();
        }
        if ("CubicEaseInOut".equalsIgnoreCase(easeType)) {
            return new CubicEaseInOutInterpolater();
        }
        if ("ElasticEaseIn".equalsIgnoreCase(easeType)) {
            return new ElasticEaseInInterpolater();
        }
        if ("ElasticEaseOut".equalsIgnoreCase(easeType)) {
            return new ElasticEaseOutInterpolater();
        }
        if ("ElasticEaseInOut".equalsIgnoreCase(easeType)) {
            return new ElasticEaseInOutInterpolater();
        }
        if (easeType.startsWith("ElasticEaseIn") && hasSecondParam) {
            return new ElasticEaseInInterpolater(firstParam, secondParam);
        }
        if (easeType.startsWith("ElasticEaseOut") && hasSecondParam) {
            return new ElasticEaseOutInterpolater(firstParam, secondParam);
        }
        if (easeType.startsWith("ElasticEaseInOut") && hasSecondParam) {
            return new ElasticEaseInOutInterpolater(firstParam, secondParam);
        }
        if ("ExpoEaseIn".equalsIgnoreCase(easeType)) {
            return new ExpoEaseInInterpolater();
        }
        if ("ExpoEaseOut".equalsIgnoreCase(easeType)) {
            return new ExpoEaseOutInterpolater();
        }
        if ("ExpoEaseInOut".equalsIgnoreCase(easeType)) {
            return new ExpoEaseInOutInterpolater();
        }
        if ("QuadEaseIn".equalsIgnoreCase(easeType)) {
            return new QuadEaseInInterpolater();
        }
        if ("QuadEaseOut".equalsIgnoreCase(easeType)) {
            return new QuadEaseOutInterpolater();
        }
        if ("QuadEaseInOut".equalsIgnoreCase(easeType)) {
            return new QuadEaseInOutInterpolater();
        }
        if ("QuartEaseIn".equalsIgnoreCase(easeType)) {
            return new QuartEaseInInterpolater();
        }
        if ("QuartEaseOut".equalsIgnoreCase(easeType)) {
            return new QuartEaseOutInterpolater();
        }
        if ("QuartEaseInOut".equalsIgnoreCase(easeType)) {
            return new QuartEaseInOutInterpolater();
        }
        if ("QuintEaseIn".equalsIgnoreCase(easeType)) {
            return new QuintEaseInInterpolater();
        }
        if ("QuintEaseOut".equalsIgnoreCase(easeType)) {
            return new QuintEaseOutInterpolater();
        }
        if ("QuintEaseInOut".equalsIgnoreCase(easeType)) {
            return new QuintEaseInOutInterpolater();
        }
        if ("SineEaseIn".equalsIgnoreCase(easeType)) {
            return new SineEaseInInterpolater();
        }
        if ("SineEaseOut".equalsIgnoreCase(easeType)) {
            return new SineEaseOutInterpolater();
        }
        if ("SineEaseInOut".equalsIgnoreCase(easeType)) {
            return new SineEaseInOutInterpolater();
        }
        if ("Linear".equalsIgnoreCase(easeType)) {
            return new LinearInterpolater();
        }
        return null;
    }
}
