package com.ss.android.ugc.effectmanager.common.utils;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

public class GenericsUtils {
    public static Class getSuperClassGenericType(Class cls) {
        return getSuperClassGenericType(cls, 0);
    }

    public static Class getSuperClassGenericType(Class cls, int i) throws IndexOutOfBoundsException {
        Type genericSuperclass = cls.getGenericSuperclass();
        if (!(genericSuperclass instanceof ParameterizedType)) {
            return Object.class;
        }
        Type[] actualTypeArguments = ((ParameterizedType) genericSuperclass).getActualTypeArguments();
        return (i >= actualTypeArguments.length || i < 0) ? Object.class : !(actualTypeArguments[i] instanceof Class) ? Object.class : (Class) actualTypeArguments[i];
    }
}
