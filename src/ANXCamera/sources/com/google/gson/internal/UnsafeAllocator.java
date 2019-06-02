package com.google.gson.internal;

import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public abstract class UnsafeAllocator {
    public static UnsafeAllocator create() {
        try {
            Class cls = Class.forName("sun.misc.Unsafe");
            Field declaredField = cls.getDeclaredField("theUnsafe");
            declaredField.setAccessible(true);
            final Object obj = declaredField.get(null);
            final Method method = cls.getMethod("allocateInstance", new Class[]{Class.class});
            return new UnsafeAllocator() {
                public <T> T newInstance(Class<T> cls) throws Exception {
                    return method.invoke(obj, new Object[]{cls});
                }
            };
        } catch (Exception e) {
            try {
                final Method declaredMethod = ObjectInputStream.class.getDeclaredMethod("newInstance", new Class[]{Class.class, Class.class});
                declaredMethod.setAccessible(true);
                return new UnsafeAllocator() {
                    public <T> T newInstance(Class<T> cls) throws Exception {
                        return declaredMethod.invoke(null, new Object[]{cls, Object.class});
                    }
                };
            } catch (Exception e2) {
                try {
                    Method declaredMethod2 = ObjectStreamClass.class.getDeclaredMethod("getConstructorId", new Class[]{Class.class});
                    declaredMethod2.setAccessible(true);
                    final int intValue = ((Integer) declaredMethod2.invoke(null, new Object[]{Object.class})).intValue();
                    final Method declaredMethod3 = ObjectStreamClass.class.getDeclaredMethod("newInstance", new Class[]{Class.class, Integer.TYPE});
                    declaredMethod3.setAccessible(true);
                    return new UnsafeAllocator() {
                        public <T> T newInstance(Class<T> cls) throws Exception {
                            return declaredMethod3.invoke(null, new Object[]{cls, Integer.valueOf(intValue)});
                        }
                    };
                } catch (Exception e3) {
                    return new UnsafeAllocator() {
                        public <T> T newInstance(Class<T> cls) {
                            StringBuilder sb = new StringBuilder();
                            sb.append("Cannot allocate ");
                            sb.append(cls);
                            throw new UnsupportedOperationException(sb.toString());
                        }
                    };
                }
            }
        }
    }

    public abstract <T> T newInstance(Class<T> cls) throws Exception;
}
