package com.google.gson.internal.bind;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSyntaxException;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.internal.C$Gson$Types;
import com.google.gson.internal.ConstructorConstructor;
import com.google.gson.internal.JsonReaderInternalAccess;
import com.google.gson.internal.ObjectConstructor;
import com.google.gson.internal.Streams;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import com.ss.android.ttve.common.TEDefine;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public final class MapTypeAdapterFactory implements TypeAdapterFactory {
    /* access modifiers changed from: private */
    public final boolean complexMapKeySerialization;
    private final ConstructorConstructor constructorConstructor;

    private final class Adapter<K, V> extends TypeAdapter<Map<K, V>> {
        private final ObjectConstructor<? extends Map<K, V>> constructor;
        private final TypeAdapter<K> keyTypeAdapter;
        private final TypeAdapter<V> valueTypeAdapter;

        public Adapter(Gson gson, Type type, TypeAdapter<K> typeAdapter, Type type2, TypeAdapter<V> typeAdapter2, ObjectConstructor<? extends Map<K, V>> objectConstructor) {
            this.keyTypeAdapter = new TypeAdapterRuntimeTypeWrapper(gson, typeAdapter, type);
            this.valueTypeAdapter = new TypeAdapterRuntimeTypeWrapper(gson, typeAdapter2, type2);
            this.constructor = objectConstructor;
        }

        private String keyToString(JsonElement jsonElement) {
            if (jsonElement.isJsonPrimitive()) {
                JsonPrimitive asJsonPrimitive = jsonElement.getAsJsonPrimitive();
                if (asJsonPrimitive.isNumber()) {
                    return String.valueOf(asJsonPrimitive.getAsNumber());
                }
                if (asJsonPrimitive.isBoolean()) {
                    return Boolean.toString(asJsonPrimitive.getAsBoolean());
                }
                if (asJsonPrimitive.isString()) {
                    return asJsonPrimitive.getAsString();
                }
                throw new AssertionError();
            } else if (jsonElement.isJsonNull()) {
                return TEDefine.FACE_BEAUTY_NULL;
            } else {
                throw new AssertionError();
            }
        }

        public Map<K, V> read(JsonReader jsonReader) throws IOException {
            JsonToken peek = jsonReader.peek();
            if (peek == JsonToken.NULL) {
                jsonReader.nextNull();
                return null;
            }
            Map<K, V> map = (Map) this.constructor.construct();
            if (peek == JsonToken.BEGIN_ARRAY) {
                jsonReader.beginArray();
                while (jsonReader.hasNext()) {
                    jsonReader.beginArray();
                    Object read = this.keyTypeAdapter.read(jsonReader);
                    if (map.put(read, this.valueTypeAdapter.read(jsonReader)) == null) {
                        jsonReader.endArray();
                    } else {
                        StringBuilder sb = new StringBuilder();
                        sb.append("duplicate key: ");
                        sb.append(read);
                        throw new JsonSyntaxException(sb.toString());
                    }
                }
                jsonReader.endArray();
            } else {
                jsonReader.beginObject();
                while (jsonReader.hasNext()) {
                    JsonReaderInternalAccess.INSTANCE.promoteNameToValue(jsonReader);
                    Object read2 = this.keyTypeAdapter.read(jsonReader);
                    if (map.put(read2, this.valueTypeAdapter.read(jsonReader)) != null) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("duplicate key: ");
                        sb2.append(read2);
                        throw new JsonSyntaxException(sb2.toString());
                    }
                }
                jsonReader.endObject();
            }
            return map;
        }

        public void write(JsonWriter jsonWriter, Map<K, V> map) throws IOException {
            int i;
            int i2;
            if (map == null) {
                jsonWriter.nullValue();
            } else if (!MapTypeAdapterFactory.this.complexMapKeySerialization) {
                jsonWriter.beginObject();
                for (Entry entry : map.entrySet()) {
                    jsonWriter.name(String.valueOf(entry.getKey()));
                    this.valueTypeAdapter.write(jsonWriter, entry.getValue());
                }
                jsonWriter.endObject();
            } else {
                int i3 = 0;
                ArrayList arrayList = new ArrayList(map.size());
                ArrayList arrayList2 = new ArrayList(map.size());
                Iterator it = map.entrySet().iterator();
                while (true) {
                    i = 0;
                    if (!it.hasNext()) {
                        break;
                    }
                    Entry entry2 = (Entry) it.next();
                    JsonElement jsonTree = this.keyTypeAdapter.toJsonTree(entry2.getKey());
                    arrayList.add(jsonTree);
                    arrayList2.add(entry2.getValue());
                    if (jsonTree.isJsonArray() || jsonTree.isJsonObject()) {
                        i = 1;
                    }
                    i3 |= i;
                }
                if (i3 != 0) {
                    jsonWriter.beginArray();
                    while (true) {
                        int i4 = i;
                        if (i4 >= arrayList.size()) {
                            break;
                        }
                        jsonWriter.beginArray();
                        Streams.write((JsonElement) arrayList.get(i4), jsonWriter);
                        this.valueTypeAdapter.write(jsonWriter, arrayList2.get(i4));
                        jsonWriter.endArray();
                        i = i4 + 1;
                    }
                    jsonWriter.endArray();
                } else {
                    jsonWriter.beginObject();
                    while (true) {
                        int i5 = i2;
                        if (i5 >= arrayList.size()) {
                            break;
                        }
                        jsonWriter.name(keyToString((JsonElement) arrayList.get(i5)));
                        this.valueTypeAdapter.write(jsonWriter, arrayList2.get(i5));
                        i2 = i5 + 1;
                    }
                    jsonWriter.endObject();
                }
            }
        }
    }

    public MapTypeAdapterFactory(ConstructorConstructor constructorConstructor2, boolean z) {
        this.constructorConstructor = constructorConstructor2;
        this.complexMapKeySerialization = z;
    }

    private TypeAdapter<?> getKeyAdapter(Gson gson, Type type) {
        return (type == Boolean.TYPE || type == Boolean.class) ? TypeAdapters.BOOLEAN_AS_STRING : gson.getAdapter(TypeToken.get(type));
    }

    public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
        Gson gson2 = gson;
        Type type = typeToken.getType();
        if (!Map.class.isAssignableFrom(typeToken.getRawType())) {
            return null;
        }
        Type[] mapKeyAndValueTypes = C$Gson$Types.getMapKeyAndValueTypes(type, C$Gson$Types.getRawType(type));
        TypeAdapter keyAdapter = getKeyAdapter(gson2, mapKeyAndValueTypes[0]);
        Gson gson3 = gson2;
        TypeAdapter typeAdapter = keyAdapter;
        Adapter adapter = new Adapter(gson3, mapKeyAndValueTypes[0], typeAdapter, mapKeyAndValueTypes[1], gson2.getAdapter(TypeToken.get(mapKeyAndValueTypes[1])), this.constructorConstructor.get(typeToken));
        return adapter;
    }
}
