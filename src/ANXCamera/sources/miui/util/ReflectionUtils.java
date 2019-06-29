package miui.util;

import android.util.Log;
import com.ss.android.ttve.common.TEDefine;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import org.apache.miui.commons.lang3.ClassUtils;
import org.apache.miui.commons.lang3.reflect.MemberUtils;

public class ReflectionUtils {
    public static final ClassLoader BOOTCLASSLOADER = ClassLoader.getSystemClassLoader();
    private static final String TAG = "ReflectionUtils";
    private static final HashMap<String, Constructor<?>> constructorCache = new HashMap<>();
    private static final HashMap<String, Field> fieldCache = new HashMap<>();
    private static final HashMap<String, Method> methodCache = new HashMap<>();

    public static <T> T callMethod(Object obj, String str, Class<T> cls, Object... objArr) throws NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        return checkMethodReturnValue(findMethodBestMatch(obj.getClass(), str, objArr).invoke(obj, objArr), cls);
    }

    public static <T> T callStaticMethod(Class<?> cls, String str, Class<T> cls2, Object... objArr) throws NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        try {
            return checkMethodReturnValue(findMethodBestMatch(cls, str, objArr).invoke(null, objArr), cls2);
        } catch (NullPointerException e) {
            Log.w(TAG, "", e);
            throw new IllegalArgumentException(e);
        }
    }

    private static Object checkFieldValue(Object obj, Class<?> cls) throws IllegalArgumentException {
        if (cls == Void.class) {
            throw new IllegalArgumentException("fieldClazz");
        } else if (obj == null) {
            return null;
        } else {
            if (cls == null || ClassUtils.isAssignable(obj.getClass(), cls, true)) {
                return obj;
            }
            throw new IllegalArgumentException("fieldClazz");
        }
    }

    private static Object checkMethodReturnValue(Object obj, Class<?> cls) throws IllegalArgumentException {
        if (obj == null) {
            return null;
        }
        if (cls == null) {
            return obj;
        }
        if (cls == Void.class) {
            return null;
        }
        if (ClassUtils.isAssignable(obj.getClass(), cls, true)) {
            return obj;
        }
        throw new IllegalArgumentException("returnValueClazz");
    }

    public static Class<?> findClass(String str, ClassLoader classLoader) throws ClassNotFoundException {
        if (classLoader == null) {
            classLoader = BOOTCLASSLOADER;
        }
        return ClassUtils.getClass(classLoader, str, false);
    }

    public static Constructor<?> findConstructorBestMatch(Class<?> cls, Class<?>... clsArr) throws NoSuchMethodException {
        Constructor[] declaredConstructors;
        StringBuilder sb = new StringBuilder(cls.getName());
        sb.append(getParametersString(clsArr));
        sb.append("#bestmatch");
        String sb2 = sb.toString();
        synchronized (constructorCache) {
            if (constructorCache.containsKey(sb2)) {
                Constructor<?> constructor = (Constructor) constructorCache.get(sb2);
                if (constructor != null) {
                    return constructor;
                }
                throw new NoSuchMethodException(sb2);
            }
            try {
                Constructor<?> findConstructorExact = findConstructorExact(cls, clsArr);
                synchronized (constructorCache) {
                    constructorCache.put(sb2, findConstructorExact);
                }
                return findConstructorExact;
            } catch (NoSuchMethodException e) {
                Constructor constructor2 = null;
                for (Constructor constructor3 : cls.getDeclaredConstructors()) {
                    if (ClassUtils.isAssignable(clsArr, constructor3.getParameterTypes(), true) && (constructor2 == null || MemberUtils.compareParameterTypes(constructor3.getParameterTypes(), constructor2.getParameterTypes(), clsArr) < 0)) {
                        constructor2 = constructor3;
                    }
                }
                if (constructor2 != null) {
                    constructor2.setAccessible(true);
                    synchronized (constructorCache) {
                        constructorCache.put(sb2, constructor2);
                        return constructor2;
                    }
                }
                NoSuchMethodException noSuchMethodException = new NoSuchMethodException(sb2);
                synchronized (constructorCache) {
                    constructorCache.put(sb2, null);
                    throw noSuchMethodException;
                }
            }
        }
    }

    public static Constructor<?> findConstructorBestMatch(Class<?> cls, Object... objArr) throws NoSuchMethodException {
        return findConstructorBestMatch(cls, (Class<?>[]) getParameterTypes(objArr));
    }

    public static Constructor<?> findConstructorExact(Class<?> cls, Class<?>... clsArr) throws NoSuchMethodException {
        StringBuilder sb = new StringBuilder(cls.getName());
        sb.append(getParametersString(clsArr));
        sb.append("#exact");
        String sb2 = sb.toString();
        synchronized (constructorCache) {
            if (constructorCache.containsKey(sb2)) {
                Constructor<?> constructor = (Constructor) constructorCache.get(sb2);
                if (constructor != null) {
                    return constructor;
                }
                throw new NoSuchMethodException(sb2);
            }
            try {
                Constructor<?> declaredConstructor = cls.getDeclaredConstructor(clsArr);
                declaredConstructor.setAccessible(true);
                synchronized (constructorCache) {
                    constructorCache.put(sb2, declaredConstructor);
                }
                return declaredConstructor;
            } catch (NoSuchMethodException e) {
                NoSuchMethodException noSuchMethodException = e;
                synchronized (constructorCache) {
                    constructorCache.put(sb2, null);
                    throw noSuchMethodException;
                }
            }
        }
    }

    public static Field findField(Class<?> cls, String str) throws NoSuchFieldException {
        StringBuilder sb = new StringBuilder(cls.getName());
        sb.append('#');
        sb.append(str);
        String sb2 = sb.toString();
        synchronized (fieldCache) {
            if (fieldCache.containsKey(sb2)) {
                Field field = (Field) fieldCache.get(sb2);
                if (field != null) {
                    return field;
                }
                throw new NoSuchFieldException(sb2);
            }
            try {
                Field findFieldRecursiveImpl = findFieldRecursiveImpl(cls, str);
                findFieldRecursiveImpl.setAccessible(true);
                synchronized (fieldCache) {
                    fieldCache.put(sb2, findFieldRecursiveImpl);
                }
                return findFieldRecursiveImpl;
            } catch (NoSuchFieldException e) {
                NoSuchFieldException noSuchFieldException = e;
                synchronized (fieldCache) {
                    fieldCache.put(sb2, null);
                    throw noSuchFieldException;
                }
            }
        }
    }

    private static Field findFieldRecursiveImpl(Class<?> cls, String str) throws NoSuchFieldException {
        try {
            return cls.getDeclaredField(str);
        } catch (NoSuchFieldException e) {
            while (true) {
                cls = cls.getSuperclass();
                if (cls == null || cls.equals(Object.class)) {
                    throw e;
                }
                try {
                    return cls.getDeclaredField(str);
                } catch (NoSuchFieldException e2) {
                }
            }
            throw e;
        }
    }

    public static Method findMethodBestMatch(Class<?> cls, String str, Class<?>... clsArr) throws NoSuchMethodException {
        Method[] declaredMethods;
        StringBuilder sb = new StringBuilder(cls.getName());
        sb.append('#');
        sb.append(str);
        sb.append(getParametersString(clsArr));
        sb.append("#bestmatch");
        String sb2 = sb.toString();
        synchronized (methodCache) {
            if (methodCache.containsKey(sb2)) {
                Method method = (Method) methodCache.get(sb2);
                if (method != null) {
                    return method;
                }
                throw new NoSuchMethodException(sb2);
            }
            try {
                Method findMethodExact = findMethodExact(cls, str, clsArr);
                synchronized (methodCache) {
                    methodCache.put(sb2, findMethodExact);
                }
                return findMethodExact;
            } catch (NoSuchMethodException e) {
                Method method2 = null;
                for (Method method3 : cls.getDeclaredMethods()) {
                    if (method3.getName().equals(str) && ClassUtils.isAssignable(clsArr, method3.getParameterTypes(), true) && (method2 == null || MemberUtils.compareParameterTypes(method3.getParameterTypes(), method2.getParameterTypes(), clsArr) < 0)) {
                        method2 = method3;
                    }
                }
                if (method2 != null) {
                    method2.setAccessible(true);
                    synchronized (methodCache) {
                        methodCache.put(sb2, method2);
                        return method2;
                    }
                }
                NoSuchMethodException noSuchMethodException = new NoSuchMethodException(sb2);
                synchronized (methodCache) {
                    methodCache.put(sb2, null);
                    throw noSuchMethodException;
                }
            }
        }
    }

    public static Method findMethodBestMatch(Class<?> cls, String str, Object... objArr) throws NoSuchMethodException {
        return findMethodBestMatch(cls, str, (Class<?>[]) getParameterTypes(objArr));
    }

    public static Method findMethodExact(Class<?> cls, String str, Class<?>... clsArr) throws NoSuchMethodException {
        StringBuilder sb = new StringBuilder(cls.getName());
        sb.append('#');
        sb.append(str);
        sb.append(getParametersString(clsArr));
        sb.append("#exact");
        String sb2 = sb.toString();
        synchronized (methodCache) {
            if (methodCache.containsKey(sb2)) {
                Method method = (Method) methodCache.get(sb2);
                if (method != null) {
                    return method;
                }
                throw new NoSuchMethodException(sb2);
            }
            try {
                Method declaredMethod = cls.getDeclaredMethod(str, clsArr);
                declaredMethod.setAccessible(true);
                synchronized (methodCache) {
                    methodCache.put(sb2, declaredMethod);
                }
                return declaredMethod;
            } catch (NoSuchMethodException e) {
                NoSuchMethodException noSuchMethodException = e;
                synchronized (methodCache) {
                    methodCache.put(sb2, null);
                    throw noSuchMethodException;
                }
            }
        }
    }

    public static Method findMethodExact(Class<?> cls, String str, Object... objArr) throws ClassNotFoundException, NoSuchMethodException {
        Class[] clsArr = null;
        int length = objArr.length - 1;
        while (length >= 0) {
            Object obj = objArr[length];
            if (obj != null) {
                if (clsArr == null) {
                    clsArr = new Class[(length + 1)];
                }
                if (obj instanceof Class) {
                    clsArr[length] = (Class) obj;
                } else if (obj instanceof String) {
                    clsArr[length] = findClass((String) obj, cls.getClassLoader());
                } else {
                    throw new IllegalArgumentException("parameter type must either be specified as Class or String", null);
                }
                length--;
            } else {
                throw new NullPointerException("parameter type must not be null");
            }
        }
        if (clsArr == null) {
            clsArr = new Class[0];
        }
        return findMethodExact(cls, str, (Class<?>[]) clsArr);
    }

    public static Class<?>[] getClassesAsArray(Class<?>... clsArr) {
        return clsArr;
    }

    public static <T> T getObjectField(Object obj, String str, Class<T> cls) throws NoSuchFieldException, IllegalAccessException, IllegalArgumentException {
        return checkFieldValue(findField(obj.getClass(), str).get(obj), cls);
    }

    public static Class<?>[] getParameterTypes(Object... objArr) {
        Class<?>[] clsArr = new Class[objArr.length];
        for (int i = 0; i < objArr.length; i++) {
            clsArr[i] = objArr[i] != null ? objArr[i].getClass() : null;
        }
        return clsArr;
    }

    private static String getParametersString(Class<?>... clsArr) {
        StringBuilder sb = new StringBuilder("(");
        boolean z = true;
        for (Class<?> cls : clsArr) {
            if (z) {
                z = false;
            } else {
                sb.append(",");
            }
            if (cls != null) {
                sb.append(cls.getCanonicalName());
            } else {
                sb.append(TEDefine.FACE_BEAUTY_NULL);
            }
        }
        sb.append(")");
        return sb.toString();
    }

    public static <T> T getStaticObjectField(Class<?> cls, String str, Class<T> cls2) throws NoSuchFieldException, IllegalAccessException, IllegalArgumentException {
        try {
            return checkFieldValue(findField(cls, str).get(null), cls2);
        } catch (NullPointerException e) {
            Log.w(TAG, "", e);
            throw new IllegalArgumentException(e);
        }
    }

    public static <T> T getSurroundingThis(Object obj, Class<T> cls) throws NoSuchFieldException, IllegalAccessException, IllegalArgumentException {
        return getObjectField(obj, "this$0", cls);
    }

    public static Object newInstance(Class<?> cls, Object... objArr) throws NoSuchMethodException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        return findConstructorBestMatch(cls, objArr).newInstance(objArr);
    }

    public static void setObjectField(Object obj, String str, Object obj2) throws NoSuchFieldException, IllegalAccessException, IllegalArgumentException {
        findField(obj.getClass(), str).set(obj, obj2);
    }

    public static void setStaticObjectField(Class<?> cls, String str, Object obj) throws NoSuchFieldException, IllegalAccessException, IllegalArgumentException {
        try {
            findField(cls, str).set(null, obj);
        } catch (NullPointerException e) {
            Log.w(TAG, "", e);
            throw new IllegalArgumentException(e);
        }
    }

    public static <T> ObjectReference<T> tryCallMethod(Object obj, String str, Class<T> cls, Object... objArr) {
        try {
            return new ObjectReference<>(callMethod(obj, str, cls, objArr));
        } catch (NoSuchMethodException e) {
            Log.w(TAG, "", e);
            return null;
        } catch (IllegalAccessException e2) {
            Log.w(TAG, "", e2);
            return null;
        } catch (IllegalArgumentException e3) {
            Log.w(TAG, "", e3);
            return null;
        } catch (InvocationTargetException e4) {
            Log.w(TAG, "", e4);
            return null;
        }
    }

    public static <T> ObjectReference<T> tryCallStaticMethod(Class<?> cls, String str, Class<T> cls2, Object... objArr) {
        try {
            return new ObjectReference<>(callStaticMethod(cls, str, cls2, objArr));
        } catch (NoSuchMethodException e) {
            Log.w(TAG, "", e);
            return null;
        } catch (IllegalAccessException e2) {
            Log.w(TAG, "", e2);
            return null;
        } catch (IllegalArgumentException e3) {
            Log.w(TAG, "", e3);
            return null;
        } catch (InvocationTargetException e4) {
            Log.w(TAG, "", e4);
            return null;
        }
    }

    public static Class<?> tryFindClass(String str, ClassLoader classLoader) {
        try {
            return findClass(str, classLoader);
        } catch (ClassNotFoundException e) {
            Log.w(TAG, "", e);
            return null;
        }
    }

    public static Constructor<?> tryFindConstructorBestMatch(Class<?> cls, Class<?>... clsArr) {
        try {
            return findConstructorBestMatch(cls, clsArr);
        } catch (NoSuchMethodException e) {
            Log.w(TAG, "", e);
            return null;
        }
    }

    public static Constructor<?> tryFindConstructorBestMatch(Class<?> cls, Object... objArr) {
        try {
            return findConstructorBestMatch(cls, objArr);
        } catch (NoSuchMethodException e) {
            Log.w(TAG, "", e);
            return null;
        }
    }

    public static Constructor<?> tryFindConstructorExact(Class<?> cls, Class<?>... clsArr) {
        try {
            return findConstructorExact(cls, clsArr);
        } catch (NoSuchMethodException e) {
            Log.w(TAG, "", e);
            return null;
        }
    }

    public static Field tryFindField(Class<?> cls, String str) {
        try {
            return findField(cls, str);
        } catch (NoSuchFieldException e) {
            Log.w(TAG, "", e);
            return null;
        }
    }

    public static Method tryFindMethodBestMatch(Class<?> cls, String str, Class<?>... clsArr) {
        try {
            return findMethodBestMatch(cls, str, clsArr);
        } catch (NoSuchMethodException e) {
            Log.w(TAG, "", e);
            return null;
        }
    }

    public static Method tryFindMethodBestMatch(Class<?> cls, String str, Object... objArr) {
        try {
            return findMethodBestMatch(cls, str, objArr);
        } catch (NoSuchMethodException e) {
            Log.w(TAG, "", e);
            return null;
        }
    }

    public static Method tryFindMethodExact(Class<?> cls, String str, Class<?>... clsArr) {
        try {
            return findMethodExact(cls, str, clsArr);
        } catch (NoSuchMethodException e) {
            Log.w(TAG, "", e);
            return null;
        }
    }

    public static Method tryFindMethodExact(Class<?> cls, String str, Object... objArr) {
        try {
            return findMethodExact(cls, str, objArr);
        } catch (ClassNotFoundException e) {
            Log.w(TAG, "", e);
            return null;
        } catch (NoSuchMethodException e2) {
            Log.w(TAG, "", e2);
            return null;
        }
    }

    public static <T> ObjectReference<T> tryGetObjectField(Object obj, String str, Class<T> cls) {
        try {
            return new ObjectReference<>(getObjectField(obj, str, cls));
        } catch (NoSuchFieldException e) {
            Log.w(TAG, "", e);
            return null;
        } catch (IllegalAccessException e2) {
            Log.w(TAG, "", e2);
            return null;
        } catch (IllegalArgumentException e3) {
            Log.w(TAG, "", e3);
            return null;
        }
    }

    public static <T> ObjectReference<T> tryGetStaticObjectField(Class<?> cls, String str, Class<T> cls2) {
        try {
            return new ObjectReference<>(getStaticObjectField(cls, str, cls2));
        } catch (NoSuchFieldException e) {
            Log.w(TAG, "", e);
            return null;
        } catch (IllegalAccessException e2) {
            Log.w(TAG, "", e2);
            return null;
        } catch (IllegalArgumentException e3) {
            Log.w(TAG, "", e3);
            return null;
        }
    }

    public static <T> ObjectReference<T> tryGetSurroundingThis(Object obj, Class<T> cls) {
        try {
            return new ObjectReference<>(getSurroundingThis(obj, cls));
        } catch (NoSuchFieldException e) {
            Log.w(TAG, "", e);
            return null;
        } catch (IllegalAccessException e2) {
            Log.w(TAG, "", e2);
            return null;
        } catch (IllegalArgumentException e3) {
            Log.w(TAG, "", e3);
            return null;
        }
    }

    public static Object tryNewInstance(Class<?> cls, Object... objArr) {
        try {
            return newInstance(cls, objArr);
        } catch (NoSuchMethodException e) {
            Log.w(TAG, "", e);
            return null;
        } catch (InstantiationException e2) {
            Log.w(TAG, "", e2);
            return null;
        } catch (IllegalAccessException e3) {
            Log.w(TAG, "", e3);
            return null;
        } catch (IllegalArgumentException e4) {
            Log.w(TAG, "", e4);
            return null;
        } catch (InvocationTargetException e5) {
            Log.w(TAG, "", e5);
            return null;
        }
    }

    public static void trySetObjectField(Object obj, String str, Object obj2) {
        try {
            setObjectField(obj, str, obj2);
        } catch (NoSuchFieldException e) {
            Log.w(TAG, "", e);
        } catch (IllegalAccessException e2) {
            Log.w(TAG, "", e2);
        } catch (IllegalArgumentException e3) {
            Log.w(TAG, "", e3);
        }
    }

    public static void trySetStaticObjectField(Class<?> cls, String str, Object obj) {
        try {
            setStaticObjectField(cls, str, obj);
        } catch (NoSuchFieldException e) {
            Log.w(TAG, "", e);
        } catch (IllegalAccessException e2) {
            Log.w(TAG, "", e2);
        } catch (IllegalArgumentException e3) {
            Log.w(TAG, "", e3);
        }
    }
}
