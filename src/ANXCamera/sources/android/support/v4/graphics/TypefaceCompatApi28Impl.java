package android.support.v4.graphics;

import android.graphics.Typeface;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

@RequiresApi(28)
@RestrictTo({Scope.LIBRARY_GROUP})
public class TypefaceCompatApi28Impl extends TypefaceCompatApi26Impl {
    private static final String CREATE_FROM_FAMILIES_WITH_DEFAULT_METHOD = "createFromFamiliesWithDefault";
    private static final String DEFAULT_FAMILY = "sans-serif";
    private static final int RESOLVE_BY_FONT_TABLE = -1;
    private static final String TAG = "TypefaceCompatApi28Impl";

    /* access modifiers changed from: protected */
    public Typeface createFromFamiliesWithDefault(Object obj) {
        try {
            Object newInstance = Array.newInstance(this.mFontFamily, 1);
            Array.set(newInstance, 0, obj);
            return (Typeface) this.mCreateFromFamiliesWithDefault.invoke(null, new Object[]{newInstance, DEFAULT_FAMILY, Integer.valueOf(-1), Integer.valueOf(-1)});
        } catch (IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(e);
        }
    }

    /* access modifiers changed from: protected */
    public Method obtainCreateFromFamiliesWithDefaultMethod(Class cls) throws NoSuchMethodException {
        Object newInstance = Array.newInstance(cls, 1);
        Method declaredMethod = Typeface.class.getDeclaredMethod(CREATE_FROM_FAMILIES_WITH_DEFAULT_METHOD, new Class[]{newInstance.getClass(), String.class, Integer.TYPE, Integer.TYPE});
        declaredMethod.setAccessible(true);
        return declaredMethod;
    }
}
