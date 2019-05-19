package com.google.gson.internal;

import com.adobe.xmp.XMPConst;
import com.ss.android.ttve.common.TEDefine;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.GenericDeclaration;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Arrays;
import java.util.Collection;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Properties;

/* renamed from: com.google.gson.internal.$Gson$Types reason: invalid class name */
public final class C$Gson$Types {
    static final Type[] EMPTY_TYPE_ARRAY = new Type[0];

    /* compiled from: $Gson$Types */
    /* renamed from: com.google.gson.internal.$Gson$Types$GenericArrayTypeImpl */
    private static final class GenericArrayTypeImpl implements GenericArrayType, Serializable {
        private static final long serialVersionUID = 0;
        private final Type componentType;

        public GenericArrayTypeImpl(Type componentType2) {
            this.componentType = C$Gson$Types.canonicalize(componentType2);
        }

        public Type getGenericComponentType() {
            return this.componentType;
        }

        public boolean equals(Object o) {
            return (o instanceof GenericArrayType) && C$Gson$Types.equals(this, (GenericArrayType) o);
        }

        public int hashCode() {
            return this.componentType.hashCode();
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(C$Gson$Types.typeToString(this.componentType));
            sb.append(XMPConst.ARRAY_ITEM_NAME);
            return sb.toString();
        }
    }

    /* compiled from: $Gson$Types */
    /* renamed from: com.google.gson.internal.$Gson$Types$ParameterizedTypeImpl */
    private static final class ParameterizedTypeImpl implements ParameterizedType, Serializable {
        private static final long serialVersionUID = 0;
        private final Type ownerType;
        private final Type rawType;
        private final Type[] typeArguments;

        public ParameterizedTypeImpl(Type ownerType2, Type rawType2, Type... typeArguments2) {
            int t = 0;
            if (rawType2 instanceof Class) {
                Class<?> rawTypeAsClass = (Class) rawType2;
                boolean z = true;
                boolean z2 = ownerType2 != null || rawTypeAsClass.getEnclosingClass() == null;
                C$Gson$Preconditions.checkArgument(z2);
                if (ownerType2 != null && rawTypeAsClass.getEnclosingClass() == null) {
                    z = false;
                }
                C$Gson$Preconditions.checkArgument(z);
            }
            this.ownerType = ownerType2 == null ? null : C$Gson$Types.canonicalize(ownerType2);
            this.rawType = C$Gson$Types.canonicalize(rawType2);
            this.typeArguments = (Type[]) typeArguments2.clone();
            while (true) {
                int t2 = t;
                if (t2 < this.typeArguments.length) {
                    C$Gson$Preconditions.checkNotNull(this.typeArguments[t2]);
                    C$Gson$Types.checkNotPrimitive(this.typeArguments[t2]);
                    this.typeArguments[t2] = C$Gson$Types.canonicalize(this.typeArguments[t2]);
                    t = t2 + 1;
                } else {
                    return;
                }
            }
        }

        public Type[] getActualTypeArguments() {
            return (Type[]) this.typeArguments.clone();
        }

        public Type getRawType() {
            return this.rawType;
        }

        public Type getOwnerType() {
            return this.ownerType;
        }

        public boolean equals(Object other) {
            return (other instanceof ParameterizedType) && C$Gson$Types.equals(this, (ParameterizedType) other);
        }

        public int hashCode() {
            return (Arrays.hashCode(this.typeArguments) ^ this.rawType.hashCode()) ^ C$Gson$Types.hashCodeOrZero(this.ownerType);
        }

        public String toString() {
            int i = 1;
            StringBuilder stringBuilder = new StringBuilder(30 * (this.typeArguments.length + 1));
            stringBuilder.append(C$Gson$Types.typeToString(this.rawType));
            if (this.typeArguments.length == 0) {
                return stringBuilder.toString();
            }
            stringBuilder.append("<");
            stringBuilder.append(C$Gson$Types.typeToString(this.typeArguments[0]));
            while (true) {
                int i2 = i;
                if (i2 < this.typeArguments.length) {
                    stringBuilder.append(", ");
                    stringBuilder.append(C$Gson$Types.typeToString(this.typeArguments[i2]));
                    i = i2 + 1;
                } else {
                    stringBuilder.append(">");
                    return stringBuilder.toString();
                }
            }
        }
    }

    /* compiled from: $Gson$Types */
    /* renamed from: com.google.gson.internal.$Gson$Types$WildcardTypeImpl */
    private static final class WildcardTypeImpl implements WildcardType, Serializable {
        private static final long serialVersionUID = 0;
        private final Type lowerBound;
        private final Type upperBound;

        public WildcardTypeImpl(Type[] upperBounds, Type[] lowerBounds) {
            boolean z = true;
            C$Gson$Preconditions.checkArgument(lowerBounds.length <= 1);
            C$Gson$Preconditions.checkArgument(upperBounds.length == 1);
            if (lowerBounds.length == 1) {
                C$Gson$Preconditions.checkNotNull(lowerBounds[0]);
                C$Gson$Types.checkNotPrimitive(lowerBounds[0]);
                if (upperBounds[0] != Object.class) {
                    z = false;
                }
                C$Gson$Preconditions.checkArgument(z);
                this.lowerBound = C$Gson$Types.canonicalize(lowerBounds[0]);
                this.upperBound = Object.class;
                return;
            }
            C$Gson$Preconditions.checkNotNull(upperBounds[0]);
            C$Gson$Types.checkNotPrimitive(upperBounds[0]);
            this.lowerBound = null;
            this.upperBound = C$Gson$Types.canonicalize(upperBounds[0]);
        }

        public Type[] getUpperBounds() {
            return new Type[]{this.upperBound};
        }

        public Type[] getLowerBounds() {
            if (this.lowerBound == null) {
                return C$Gson$Types.EMPTY_TYPE_ARRAY;
            }
            return new Type[]{this.lowerBound};
        }

        public boolean equals(Object other) {
            return (other instanceof WildcardType) && C$Gson$Types.equals(this, (WildcardType) other);
        }

        public int hashCode() {
            return (this.lowerBound != null ? this.lowerBound.hashCode() + 31 : 1) ^ (31 + this.upperBound.hashCode());
        }

        public String toString() {
            if (this.lowerBound != null) {
                StringBuilder sb = new StringBuilder();
                sb.append("? super ");
                sb.append(C$Gson$Types.typeToString(this.lowerBound));
                return sb.toString();
            } else if (this.upperBound == Object.class) {
                return "?";
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("? extends ");
                sb2.append(C$Gson$Types.typeToString(this.upperBound));
                return sb2.toString();
            }
        }
    }

    private C$Gson$Types() {
    }

    public static ParameterizedType newParameterizedTypeWithOwner(Type ownerType, Type rawType, Type... typeArguments) {
        return new ParameterizedTypeImpl(ownerType, rawType, typeArguments);
    }

    public static GenericArrayType arrayOf(Type componentType) {
        return new GenericArrayTypeImpl(componentType);
    }

    public static WildcardType subtypeOf(Type bound) {
        return new WildcardTypeImpl(new Type[]{bound}, EMPTY_TYPE_ARRAY);
    }

    public static WildcardType supertypeOf(Type bound) {
        return new WildcardTypeImpl(new Type[]{Object.class}, new Type[]{bound});
    }

    public static Type canonicalize(Type type) {
        if (type instanceof Class) {
            Class<?> c = (Class) type;
            return (Type) (c.isArray() ? new GenericArrayTypeImpl(canonicalize(c.getComponentType())) : c);
        } else if (type instanceof ParameterizedType) {
            ParameterizedType p = (ParameterizedType) type;
            return new ParameterizedTypeImpl(p.getOwnerType(), p.getRawType(), p.getActualTypeArguments());
        } else if (type instanceof GenericArrayType) {
            return new GenericArrayTypeImpl(((GenericArrayType) type).getGenericComponentType());
        } else {
            if (!(type instanceof WildcardType)) {
                return type;
            }
            WildcardType w = (WildcardType) type;
            return new WildcardTypeImpl(w.getUpperBounds(), w.getLowerBounds());
        }
    }

    public static Class<?> getRawType(Type type) {
        if (type instanceof Class) {
            return (Class) type;
        }
        if (type instanceof ParameterizedType) {
            Type rawType = ((ParameterizedType) type).getRawType();
            C$Gson$Preconditions.checkArgument(rawType instanceof Class);
            return (Class) rawType;
        } else if (type instanceof GenericArrayType) {
            return Array.newInstance(getRawType(((GenericArrayType) type).getGenericComponentType()), 0).getClass();
        } else {
            if (type instanceof TypeVariable) {
                return Object.class;
            }
            if (type instanceof WildcardType) {
                return getRawType(((WildcardType) type).getUpperBounds()[0]);
            }
            String className = type == null ? TEDefine.FACE_BEAUTY_NULL : type.getClass().getName();
            StringBuilder sb = new StringBuilder();
            sb.append("Expected a Class, ParameterizedType, or GenericArrayType, but <");
            sb.append(type);
            sb.append("> is of type ");
            sb.append(className);
            throw new IllegalArgumentException(sb.toString());
        }
    }

    static boolean equal(Object a, Object b) {
        return a == b || (a != null && a.equals(b));
    }

    public static boolean equals(Type a, Type b) {
        boolean z;
        boolean z2 = true;
        if (a == b) {
            return true;
        }
        if (a instanceof Class) {
            return a.equals(b);
        }
        if (a instanceof ParameterizedType) {
            if (!(b instanceof ParameterizedType)) {
                return false;
            }
            ParameterizedType pa = (ParameterizedType) a;
            ParameterizedType pb = (ParameterizedType) b;
            if (!equal(pa.getOwnerType(), pb.getOwnerType()) || !pa.getRawType().equals(pb.getRawType()) || !Arrays.equals(pa.getActualTypeArguments(), pb.getActualTypeArguments())) {
                z2 = false;
            }
            return z2;
        } else if (a instanceof GenericArrayType) {
            if (!(b instanceof GenericArrayType)) {
                return false;
            }
            return equals(((GenericArrayType) a).getGenericComponentType(), ((GenericArrayType) b).getGenericComponentType());
        } else if (a instanceof WildcardType) {
            if (!(b instanceof WildcardType)) {
                return false;
            }
            WildcardType wa = (WildcardType) a;
            WildcardType wb = (WildcardType) b;
            if (!Arrays.equals(wa.getUpperBounds(), wb.getUpperBounds()) || !Arrays.equals(wa.getLowerBounds(), wb.getLowerBounds())) {
                z2 = false;
            }
            return z2;
        } else if (!(a instanceof TypeVariable) || !(b instanceof TypeVariable)) {
            return false;
        } else {
            TypeVariable<?> va = (TypeVariable) a;
            TypeVariable<?> vb = (TypeVariable) b;
            if (va.getGenericDeclaration() != vb.getGenericDeclaration() || !va.getName().equals(vb.getName())) {
                z = false;
            }
            return z;
        }
    }

    /* access modifiers changed from: private */
    public static int hashCodeOrZero(Object o) {
        if (o != null) {
            return o.hashCode();
        }
        return 0;
    }

    public static String typeToString(Type type) {
        return type instanceof Class ? ((Class) type).getName() : type.toString();
    }

    static Type getGenericSupertype(Type context, Class<?> rawType, Class<?> toResolve) {
        if (toResolve == rawType) {
            return context;
        }
        if (toResolve.isInterface()) {
            Class<?>[] interfaces = rawType.getInterfaces();
            int length = interfaces.length;
            for (int i = 0; i < length; i++) {
                if (interfaces[i] == toResolve) {
                    return rawType.getGenericInterfaces()[i];
                }
                if (toResolve.isAssignableFrom(interfaces[i])) {
                    return getGenericSupertype(rawType.getGenericInterfaces()[i], interfaces[i], toResolve);
                }
            }
        }
        if (!rawType.isInterface()) {
            while (rawType != Object.class) {
                Class<?> rawSupertype = rawType.getSuperclass();
                if (rawSupertype == toResolve) {
                    return rawType.getGenericSuperclass();
                }
                if (toResolve.isAssignableFrom(rawSupertype)) {
                    return getGenericSupertype(rawType.getGenericSuperclass(), rawSupertype, toResolve);
                }
                rawType = rawSupertype;
            }
        }
        return toResolve;
    }

    static Type getSupertype(Type context, Class<?> contextRawType, Class<?> supertype) {
        C$Gson$Preconditions.checkArgument(supertype.isAssignableFrom(contextRawType));
        return resolve(context, contextRawType, getGenericSupertype(context, contextRawType, supertype));
    }

    public static Type getArrayComponentType(Type array) {
        return array instanceof GenericArrayType ? ((GenericArrayType) array).getGenericComponentType() : ((Class) array).getComponentType();
    }

    public static Type getCollectionElementType(Type context, Class<?> contextRawType) {
        Type collectionType = getSupertype(context, contextRawType, Collection.class);
        if (collectionType instanceof WildcardType) {
            collectionType = ((WildcardType) collectionType).getUpperBounds()[0];
        }
        if (collectionType instanceof ParameterizedType) {
            return ((ParameterizedType) collectionType).getActualTypeArguments()[0];
        }
        return Object.class;
    }

    public static Type[] getMapKeyAndValueTypes(Type context, Class<?> contextRawType) {
        if (context == Properties.class) {
            return new Type[]{String.class, String.class};
        }
        Type mapType = getSupertype(context, contextRawType, Map.class);
        if (mapType instanceof ParameterizedType) {
            return ((ParameterizedType) mapType).getActualTypeArguments();
        }
        return new Type[]{Object.class, Object.class};
    }

    public static Type resolve(Type context, Class<?> contextRawType, Type toResolve) {
        while (toResolve instanceof TypeVariable) {
            TypeVariable<?> typeVariable = (TypeVariable) toResolve;
            toResolve = resolveTypeVariable(context, contextRawType, typeVariable);
            if (toResolve == typeVariable) {
                return toResolve;
            }
        }
        if ((toResolve instanceof Class) && ((Class) toResolve).isArray()) {
            Class<?> original = (Class) toResolve;
            Type componentType = original.getComponentType();
            Type newComponentType = resolve(context, contextRawType, componentType);
            return componentType == newComponentType ? original : arrayOf(newComponentType);
        } else if (toResolve instanceof GenericArrayType) {
            GenericArrayType original2 = (GenericArrayType) toResolve;
            Type componentType2 = original2.getGenericComponentType();
            Type newComponentType2 = resolve(context, contextRawType, componentType2);
            return componentType2 == newComponentType2 ? original2 : arrayOf(newComponentType2);
        } else {
            boolean changed = true;
            if (toResolve instanceof ParameterizedType) {
                ParameterizedType original3 = (ParameterizedType) toResolve;
                Type ownerType = original3.getOwnerType();
                Type newOwnerType = resolve(context, contextRawType, ownerType);
                if (newOwnerType == ownerType) {
                    changed = false;
                }
                Type[] args = original3.getActualTypeArguments();
                int length = args.length;
                for (int t = 0; t < length; t++) {
                    Type resolvedTypeArgument = resolve(context, contextRawType, args[t]);
                    if (resolvedTypeArgument != args[t]) {
                        if (!changed) {
                            args = (Type[]) args.clone();
                            changed = true;
                        }
                        args[t] = resolvedTypeArgument;
                    }
                }
                return changed ? newParameterizedTypeWithOwner(newOwnerType, original3.getRawType(), args) : original3;
            } else if (!(toResolve instanceof WildcardType)) {
                return toResolve;
            } else {
                WildcardType original4 = (WildcardType) toResolve;
                Type[] originalLowerBound = original4.getLowerBounds();
                Type[] originalUpperBound = original4.getUpperBounds();
                if (originalLowerBound.length == 1) {
                    Type lowerBound = resolve(context, contextRawType, originalLowerBound[0]);
                    if (lowerBound != originalLowerBound[0]) {
                        return supertypeOf(lowerBound);
                    }
                } else if (originalUpperBound.length == 1) {
                    Type upperBound = resolve(context, contextRawType, originalUpperBound[0]);
                    if (upperBound != originalUpperBound[0]) {
                        return subtypeOf(upperBound);
                    }
                }
                return original4;
            }
        }
    }

    static Type resolveTypeVariable(Type context, Class<?> contextRawType, TypeVariable<?> unknown) {
        Class<?> declaredByRaw = declaringClassOf(unknown);
        if (declaredByRaw == null) {
            return unknown;
        }
        Type declaredBy = getGenericSupertype(context, contextRawType, declaredByRaw);
        if (!(declaredBy instanceof ParameterizedType)) {
            return unknown;
        }
        return ((ParameterizedType) declaredBy).getActualTypeArguments()[indexOf(declaredByRaw.getTypeParameters(), unknown)];
    }

    private static int indexOf(Object[] array, Object toFind) {
        for (int i = 0; i < array.length; i++) {
            if (toFind.equals(array[i])) {
                return i;
            }
        }
        throw new NoSuchElementException();
    }

    private static Class<?> declaringClassOf(TypeVariable<?> typeVariable) {
        GenericDeclaration genericDeclaration = typeVariable.getGenericDeclaration();
        if (genericDeclaration instanceof Class) {
            return (Class) genericDeclaration;
        }
        return null;
    }

    /* access modifiers changed from: private */
    public static void checkNotPrimitive(Type type) {
        boolean z = !(type instanceof Class) || !((Class) type).isPrimitive();
        C$Gson$Preconditions.checkArgument(z);
    }
}
