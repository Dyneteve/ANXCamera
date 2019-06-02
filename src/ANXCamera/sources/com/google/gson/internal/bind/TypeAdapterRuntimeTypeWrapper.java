package com.google.gson.internal.bind;

import com.google.gson.Gson;
import com.google.gson.TypeAdapter;
import com.google.gson.internal.bind.ReflectiveTypeAdapterFactory.Adapter;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;

final class TypeAdapterRuntimeTypeWrapper<T> extends TypeAdapter<T> {
    private final Gson context;
    private final TypeAdapter<T> delegate;
    private final Type type;

    TypeAdapterRuntimeTypeWrapper(Gson gson, TypeAdapter<T> typeAdapter, Type type2) {
        this.context = gson;
        this.delegate = typeAdapter;
        this.type = type2;
    }

    private Type getRuntimeTypeIfMoreSpecific(Type type2, Object obj) {
        return obj != null ? (type2 == Object.class || (type2 instanceof TypeVariable) || (type2 instanceof Class)) ? obj.getClass() : type2 : type2;
    }

    public T read(JsonReader jsonReader) throws IOException {
        return this.delegate.read(jsonReader);
    }

    public void write(JsonWriter jsonWriter, T t) throws IOException {
        TypeAdapter<T> typeAdapter = this.delegate;
        Type runtimeTypeIfMoreSpecific = getRuntimeTypeIfMoreSpecific(this.type, t);
        if (runtimeTypeIfMoreSpecific != this.type) {
            TypeAdapter<T> adapter = this.context.getAdapter(TypeToken.get(runtimeTypeIfMoreSpecific));
            typeAdapter = !(adapter instanceof Adapter) ? adapter : !(this.delegate instanceof Adapter) ? this.delegate : adapter;
        }
        typeAdapter.write(jsonWriter, t);
    }
}
