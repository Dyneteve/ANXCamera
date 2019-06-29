package android.support.v4.content.res;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.annotation.AnyRes;
import android.support.annotation.ColorInt;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.annotation.StyleableRes;
import android.util.AttributeSet;
import android.util.TypedValue;
import org.xmlpull.v1.XmlPullParser;

@RestrictTo({Scope.LIBRARY_GROUP})
public class TypedArrayUtils {
    private static final String NAMESPACE = "http://schemas.android.com/apk/res/android";

    private TypedArrayUtils() {
    }

    public static int getAttr(@NonNull Context context, int i, int i2) {
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(i, typedValue, true);
        return typedValue.resourceId != 0 ? i : i2;
    }

    public static boolean getBoolean(@NonNull TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2, boolean z) {
        return typedArray.getBoolean(i, typedArray.getBoolean(i2, z));
    }

    @Nullable
    public static Drawable getDrawable(@NonNull TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2) {
        Drawable drawable = typedArray.getDrawable(i);
        return drawable == null ? typedArray.getDrawable(i2) : drawable;
    }

    public static int getInt(@NonNull TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2, int i3) {
        return typedArray.getInt(i, typedArray.getInt(i2, i3));
    }

    public static boolean getNamedBoolean(@NonNull TypedArray typedArray, @NonNull XmlPullParser xmlPullParser, @NonNull String str, @StyleableRes int i, boolean z) {
        return !hasAttribute(xmlPullParser, str) ? z : typedArray.getBoolean(i, z);
    }

    @ColorInt
    public static int getNamedColor(@NonNull TypedArray typedArray, @NonNull XmlPullParser xmlPullParser, @NonNull String str, @StyleableRes int i, @ColorInt int i2) {
        return !hasAttribute(xmlPullParser, str) ? i2 : typedArray.getColor(i, i2);
    }

    public static float getNamedFloat(@NonNull TypedArray typedArray, @NonNull XmlPullParser xmlPullParser, @NonNull String str, @StyleableRes int i, float f) {
        return !hasAttribute(xmlPullParser, str) ? f : typedArray.getFloat(i, f);
    }

    public static int getNamedInt(@NonNull TypedArray typedArray, @NonNull XmlPullParser xmlPullParser, @NonNull String str, @StyleableRes int i, int i2) {
        return !hasAttribute(xmlPullParser, str) ? i2 : typedArray.getInt(i, i2);
    }

    @AnyRes
    public static int getNamedResourceId(@NonNull TypedArray typedArray, @NonNull XmlPullParser xmlPullParser, @NonNull String str, @StyleableRes int i, @AnyRes int i2) {
        return !hasAttribute(xmlPullParser, str) ? i2 : typedArray.getResourceId(i, i2);
    }

    @Nullable
    public static String getNamedString(@NonNull TypedArray typedArray, @NonNull XmlPullParser xmlPullParser, @NonNull String str, @StyleableRes int i) {
        if (!hasAttribute(xmlPullParser, str)) {
            return null;
        }
        return typedArray.getString(i);
    }

    @AnyRes
    public static int getResourceId(@NonNull TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2, @AnyRes int i3) {
        return typedArray.getResourceId(i, typedArray.getResourceId(i2, i3));
    }

    @Nullable
    public static String getString(@NonNull TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2) {
        String string = typedArray.getString(i);
        return string == null ? typedArray.getString(i2) : string;
    }

    @Nullable
    public static CharSequence getText(@NonNull TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2) {
        CharSequence text = typedArray.getText(i);
        return text == null ? typedArray.getText(i2) : text;
    }

    @Nullable
    public static CharSequence[] getTextArray(@NonNull TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2) {
        CharSequence[] textArray = typedArray.getTextArray(i);
        return textArray == null ? typedArray.getTextArray(i2) : textArray;
    }

    public static boolean hasAttribute(@NonNull XmlPullParser xmlPullParser, @NonNull String str) {
        return xmlPullParser.getAttributeValue(NAMESPACE, str) != null;
    }

    @NonNull
    public static TypedArray obtainAttributes(@NonNull Resources resources, @Nullable Theme theme, @NonNull AttributeSet attributeSet, @NonNull int[] iArr) {
        return theme == null ? resources.obtainAttributes(attributeSet, iArr) : theme.obtainStyledAttributes(attributeSet, iArr, 0, 0);
    }

    @Nullable
    public static TypedValue peekNamedValue(@NonNull TypedArray typedArray, @NonNull XmlPullParser xmlPullParser, @NonNull String str, int i) {
        if (!hasAttribute(xmlPullParser, str)) {
            return null;
        }
        return typedArray.peekValue(i);
    }
}
