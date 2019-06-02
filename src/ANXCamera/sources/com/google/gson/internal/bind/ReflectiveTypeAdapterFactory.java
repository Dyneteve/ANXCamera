package com.google.gson.internal.bind;

import com.google.gson.FieldNamingStrategy;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.annotations.SerializedName;
import com.google.gson.internal.C$Gson$Types;
import com.google.gson.internal.ConstructorConstructor;
import com.google.gson.internal.Excluder;
import com.google.gson.internal.ObjectConstructor;
import com.google.gson.internal.Primitives;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Type;
import java.util.LinkedHashMap;
import java.util.Map;

public final class ReflectiveTypeAdapterFactory implements TypeAdapterFactory {
    private final ConstructorConstructor constructorConstructor;
    private final Excluder excluder;
    private final FieldNamingStrategy fieldNamingPolicy;

    public static final class Adapter<T> extends TypeAdapter<T> {
        private final Map<String, BoundField> boundFields;
        private final ObjectConstructor<T> constructor;

        private Adapter(ObjectConstructor<T> objectConstructor, Map<String, BoundField> map) {
            this.constructor = objectConstructor;
            this.boundFields = map;
        }

        public T read(JsonReader jsonReader) throws IOException {
            if (jsonReader.peek() == JsonToken.NULL) {
                jsonReader.nextNull();
                return null;
            }
            T construct = this.constructor.construct();
            try {
                jsonReader.beginObject();
                while (jsonReader.hasNext()) {
                    BoundField boundField = (BoundField) this.boundFields.get(jsonReader.nextName());
                    if (boundField != null) {
                        if (boundField.deserialized) {
                            boundField.read(jsonReader, construct);
                        }
                    }
                    jsonReader.skipValue();
                }
                jsonReader.endObject();
                return construct;
            } catch (IllegalStateException e) {
                throw new JsonSyntaxException((Throwable) e);
            } catch (IllegalAccessException e2) {
                throw new AssertionError(e2);
            }
        }

        public void write(JsonWriter jsonWriter, T t) throws IOException {
            if (t == null) {
                jsonWriter.nullValue();
                return;
            }
            jsonWriter.beginObject();
            try {
                for (BoundField boundField : this.boundFields.values()) {
                    if (boundField.serialized) {
                        jsonWriter.name(boundField.name);
                        boundField.write(jsonWriter, t);
                    }
                }
                jsonWriter.endObject();
            } catch (IllegalAccessException e) {
                throw new AssertionError();
            }
        }
    }

    static abstract class BoundField {
        final boolean deserialized;
        final String name;
        final boolean serialized;

        protected BoundField(String str, boolean z, boolean z2) {
            this.name = str;
            this.serialized = z;
            this.deserialized = z2;
        }

        public abstract void read(JsonReader jsonReader, Object obj) throws IOException, IllegalAccessException;

        public abstract void write(JsonWriter jsonWriter, Object obj) throws IOException, IllegalAccessException;
    }

    public ReflectiveTypeAdapterFactory(ConstructorConstructor constructorConstructor2, FieldNamingStrategy fieldNamingStrategy, Excluder excluder2) {
        this.constructorConstructor = constructorConstructor2;
        this.fieldNamingPolicy = fieldNamingStrategy;
        this.excluder = excluder2;
    }

    private BoundField createBoundField(Gson gson, Field field, String str, TypeToken<?> typeToken, boolean z, boolean z2) {
        final Gson gson2 = gson;
        final TypeToken<?> typeToken2 = typeToken;
        final Field field2 = field;
        final boolean isPrimitive = Primitives.isPrimitive(typeToken.getRawType());
        AnonymousClass1 r1 = new BoundField(str, z, z2) {
            final TypeAdapter<?> typeAdapter = gson2.getAdapter(typeToken2);

            /* access modifiers changed from: 0000 */
            public void read(JsonReader jsonReader, Object obj) throws IOException, IllegalAccessException {
                Object read = this.typeAdapter.read(jsonReader);
                if (read != null || !isPrimitive) {
                    field2.set(obj, read);
                }
            }

            /* access modifiers changed from: 0000 */
            public void write(JsonWriter jsonWriter, Object obj) throws IOException, IllegalAccessException {
                new TypeAdapterRuntimeTypeWrapper(gson2, this.typeAdapter, typeToken2.getType()).write(jsonWriter, field2.get(obj));
            }
        };
        return r1;
    }

    private Map<String, BoundField> getBoundFields(Gson gson, TypeToken<?> typeToken, Class<?> cls) {
        int i;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        if (cls.isInterface()) {
            return linkedHashMap;
        }
        Type type = typeToken.getType();
        TypeToken<?> typeToken2 = typeToken;
        Class<?> cls2 = cls;
        while (true) {
            Type type2 = type;
            if (cls2 != Object.class) {
                Field[] declaredFields = cls2.getDeclaredFields();
                int length = declaredFields.length;
                int i2 = 0;
                while (true) {
                    int i3 = i2;
                    if (i3 >= length) {
                        break;
                    }
                    Field field = declaredFields[i3];
                    boolean excludeField = excludeField(field, true);
                    boolean excludeField2 = excludeField(field, false);
                    if (excludeField || excludeField2) {
                        field.setAccessible(true);
                        Type resolve = C$Gson$Types.resolve(typeToken2.getType(), cls2, field.getGenericType());
                        Type type3 = resolve;
                        Field field2 = field;
                        i = i3;
                        BoundField createBoundField = createBoundField(gson, field, getFieldName(field), TypeToken.get(resolve), excludeField, excludeField2);
                        BoundField boundField = (BoundField) linkedHashMap.put(createBoundField.name, createBoundField);
                        if (boundField != null) {
                            StringBuilder sb = new StringBuilder();
                            sb.append(type2);
                            sb.append(" declares multiple JSON fields named ");
                            sb.append(boundField.name);
                            throw new IllegalArgumentException(sb.toString());
                        }
                    } else {
                        i = i3;
                    }
                    i2 = i + 1;
                }
            } else {
                return linkedHashMap;
            }
            typeToken2 = TypeToken.get(C$Gson$Types.resolve(typeToken2.getType(), cls2, cls2.getGenericSuperclass()));
            cls2 = typeToken2.getRawType();
            type = type2;
        }
    }

    private String getFieldName(Field field) {
        SerializedName serializedName = (SerializedName) field.getAnnotation(SerializedName.class);
        return serializedName == null ? this.fieldNamingPolicy.translateName(field) : serializedName.value();
    }

    public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
        Class rawType = typeToken.getRawType();
        if (!Object.class.isAssignableFrom(rawType)) {
            return null;
        }
        return new Adapter(this.constructorConstructor.get(typeToken), getBoundFields(gson, typeToken, rawType));
    }

    public boolean excludeField(Field field, boolean z) {
        return !this.excluder.excludeClass(field.getType(), z) && !this.excluder.excludeField(field, z);
    }
}
