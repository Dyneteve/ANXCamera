package android.support.v4.graphics;

import android.graphics.Color;

public class ColorUtils {
    private static final int MIN_ALPHA_SEARCH_MAX_ITERATIONS = 10;
    private static final int MIN_ALPHA_SEARCH_PRECISION = 10;

    private ColorUtils() {
    }

    public static int HSLToColor(float[] fArr) {
        float f = fArr[0];
        float f2 = fArr[1];
        float f3 = fArr[2];
        float abs = (1.0f - Math.abs((2.0f * f3) - 1.0f)) * f2;
        float f4 = f3 - (0.5f * abs);
        float abs2 = (1.0f - Math.abs(((f / 60.0f) % 2.0f) - 1.0f)) * abs;
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        switch (((int) f) / 60) {
            case 0:
                i = Math.round((abs + f4) * 255.0f);
                i2 = Math.round((abs2 + f4) * 255.0f);
                i3 = Math.round(255.0f * f4);
                break;
            case 1:
                i = Math.round((abs2 + f4) * 255.0f);
                i2 = Math.round((abs + f4) * 255.0f);
                i3 = Math.round(255.0f * f4);
                break;
            case 2:
                i = Math.round(255.0f * f4);
                i2 = Math.round((abs + f4) * 255.0f);
                i3 = Math.round(255.0f * (abs2 + f4));
                break;
            case 3:
                i = Math.round(255.0f * f4);
                i2 = Math.round((abs2 + f4) * 255.0f);
                i3 = Math.round(255.0f * (abs + f4));
                break;
            case 4:
                i = Math.round((abs2 + f4) * 255.0f);
                i2 = Math.round(255.0f * f4);
                i3 = Math.round(255.0f * (abs + f4));
                break;
            case 5:
            case 6:
                i = Math.round((abs + f4) * 255.0f);
                i2 = Math.round(255.0f * f4);
                i3 = Math.round(255.0f * (abs2 + f4));
                break;
        }
        return Color.rgb(constrain(i, 0, 255), constrain(i2, 0, 255), constrain(i3, 0, 255));
    }

    public static void RGBToHSL(int i, int i2, int i3, float[] fArr) {
        float f;
        float f2;
        float f3 = ((float) i) / 255.0f;
        float f4 = ((float) i2) / 255.0f;
        float f5 = ((float) i3) / 255.0f;
        float max = Math.max(f3, Math.max(f4, f5));
        float min = Math.min(f3, Math.min(f4, f5));
        float f6 = max - min;
        float f7 = (max + min) / 2.0f;
        if (max == min) {
            f2 = 0.0f;
            f = 0.0f;
        } else {
            f = max == f3 ? ((f4 - f5) / f6) % 6.0f : max == f4 ? ((f5 - f3) / f6) + 2.0f : ((f3 - f4) / f6) + 4.0f;
            f2 = f6 / (1.0f - Math.abs((2.0f * f7) - 1.0f));
        }
        float f8 = (60.0f * f) % 360.0f;
        if (f8 < 0.0f) {
            f8 += 360.0f;
        }
        fArr[0] = constrain(f8, 0.0f, 360.0f);
        fArr[1] = constrain(f2, 0.0f, 1.0f);
        fArr[2] = constrain(f7, 0.0f, 1.0f);
    }

    public static double calculateContrast(int i, int i2) {
        if (Color.alpha(i2) == 255) {
            if (Color.alpha(i) < 255) {
                i = compositeColors(i, i2);
            }
            double calculateLuminance = calculateLuminance(i) + 0.05d;
            double calculateLuminance2 = calculateLuminance(i2) + 0.05d;
            return Math.max(calculateLuminance, calculateLuminance2) / Math.min(calculateLuminance, calculateLuminance2);
        }
        throw new IllegalArgumentException("background can not be translucent");
    }

    public static double calculateLuminance(int i) {
        double red = ((double) Color.red(i)) / 255.0d;
        double green = ((double) Color.green(i)) / 255.0d;
        double blue = ((double) Color.blue(i)) / 255.0d;
        return (0.2126d * (red < 0.03928d ? red / 12.92d : Math.pow((red + 0.055d) / 1.055d, 2.4d))) + (0.7152d * (green < 0.03928d ? green / 12.92d : Math.pow((green + 0.055d) / 1.055d, 2.4d))) + (0.0722d * (blue < 0.03928d ? blue / 12.92d : Math.pow((0.055d + blue) / 1.055d, 2.4d)));
    }

    public static int calculateMinimumAlpha(int i, int i2, float f) {
        int i3 = 255;
        if (Color.alpha(i2) != 255) {
            throw new IllegalArgumentException("background can not be translucent");
        } else if (calculateContrast(setAlphaComponent(i, 255), i2) < ((double) f)) {
            return -1;
        } else {
            int i4 = 0;
            for (int i5 = 0; i5 <= 10 && i3 - i4 > 10; i5++) {
                int i6 = (i4 + i3) / 2;
                if (calculateContrast(setAlphaComponent(i, i6), i2) < ((double) f)) {
                    i4 = i6;
                } else {
                    i3 = i6;
                }
            }
            return i3;
        }
    }

    public static void colorToHSL(int i, float[] fArr) {
        RGBToHSL(Color.red(i), Color.green(i), Color.blue(i), fArr);
    }

    private static int compositeAlpha(int i, int i2) {
        return 255 - (((255 - i2) * (255 - i)) / 255);
    }

    public static int compositeColors(int i, int i2) {
        int alpha = Color.alpha(i2);
        int alpha2 = Color.alpha(i);
        int compositeAlpha = compositeAlpha(alpha2, alpha);
        return Color.argb(compositeAlpha, compositeComponent(Color.red(i), alpha2, Color.red(i2), alpha, compositeAlpha), compositeComponent(Color.green(i), alpha2, Color.green(i2), alpha, compositeAlpha), compositeComponent(Color.blue(i), alpha2, Color.blue(i2), alpha, compositeAlpha));
    }

    private static int compositeComponent(int i, int i2, int i3, int i4, int i5) {
        if (i5 == 0) {
            return 0;
        }
        return (((255 * i) * i2) + ((i3 * i4) * (255 - i2))) / (i5 * 255);
    }

    private static float constrain(float f, float f2, float f3) {
        return f < f2 ? f2 : f > f3 ? f3 : f;
    }

    private static int constrain(int i, int i2, int i3) {
        return i < i2 ? i2 : i > i3 ? i3 : i;
    }

    public static int setAlphaComponent(int i, int i2) {
        if (i2 >= 0 && i2 <= 255) {
            return (16777215 & i) | (i2 << 24);
        }
        throw new IllegalArgumentException("alpha must be between 0 and 255.");
    }
}
