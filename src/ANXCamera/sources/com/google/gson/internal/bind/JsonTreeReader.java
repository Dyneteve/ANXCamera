package com.google.gson.internal.bind;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

public final class JsonTreeReader extends JsonReader {
    private static final Object SENTINEL_CLOSED = new Object();
    private static final Reader UNREADABLE_READER = new Reader() {
        public void close() throws IOException {
            throw new AssertionError();
        }

        public int read(char[] cArr, int i, int i2) throws IOException {
            throw new AssertionError();
        }
    };
    private final List<Object> stack = new ArrayList();

    public JsonTreeReader(JsonElement jsonElement) {
        super(UNREADABLE_READER);
        this.stack.add(jsonElement);
    }

    private void expect(JsonToken jsonToken) throws IOException {
        if (peek() != jsonToken) {
            StringBuilder sb = new StringBuilder();
            sb.append("Expected ");
            sb.append(jsonToken);
            sb.append(" but was ");
            sb.append(peek());
            throw new IllegalStateException(sb.toString());
        }
    }

    private Object peekStack() {
        return this.stack.get(this.stack.size() - 1);
    }

    private Object popStack() {
        return this.stack.remove(this.stack.size() - 1);
    }

    public void beginArray() throws IOException {
        expect(JsonToken.BEGIN_ARRAY);
        this.stack.add(((JsonArray) peekStack()).iterator());
    }

    public void beginObject() throws IOException {
        expect(JsonToken.BEGIN_OBJECT);
        this.stack.add(((JsonObject) peekStack()).entrySet().iterator());
    }

    public void close() throws IOException {
        this.stack.clear();
        this.stack.add(SENTINEL_CLOSED);
    }

    public void endArray() throws IOException {
        expect(JsonToken.END_ARRAY);
        popStack();
        popStack();
    }

    public void endObject() throws IOException {
        expect(JsonToken.END_OBJECT);
        popStack();
        popStack();
    }

    public boolean hasNext() throws IOException {
        JsonToken peek = peek();
        return (peek == JsonToken.END_OBJECT || peek == JsonToken.END_ARRAY) ? false : true;
    }

    public boolean nextBoolean() throws IOException {
        expect(JsonToken.BOOLEAN);
        return ((JsonPrimitive) popStack()).getAsBoolean();
    }

    public double nextDouble() throws IOException {
        JsonToken peek = peek();
        if (peek == JsonToken.NUMBER || peek == JsonToken.STRING) {
            double asDouble = ((JsonPrimitive) peekStack()).getAsDouble();
            if (isLenient() || (!Double.isNaN(asDouble) && !Double.isInfinite(asDouble))) {
                popStack();
                return asDouble;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("JSON forbids NaN and infinities: ");
            sb.append(asDouble);
            throw new NumberFormatException(sb.toString());
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("Expected ");
        sb2.append(JsonToken.NUMBER);
        sb2.append(" but was ");
        sb2.append(peek);
        throw new IllegalStateException(sb2.toString());
    }

    public int nextInt() throws IOException {
        JsonToken peek = peek();
        if (peek == JsonToken.NUMBER || peek == JsonToken.STRING) {
            int asInt = ((JsonPrimitive) peekStack()).getAsInt();
            popStack();
            return asInt;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected ");
        sb.append(JsonToken.NUMBER);
        sb.append(" but was ");
        sb.append(peek);
        throw new IllegalStateException(sb.toString());
    }

    public long nextLong() throws IOException {
        JsonToken peek = peek();
        if (peek == JsonToken.NUMBER || peek == JsonToken.STRING) {
            long asLong = ((JsonPrimitive) peekStack()).getAsLong();
            popStack();
            return asLong;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected ");
        sb.append(JsonToken.NUMBER);
        sb.append(" but was ");
        sb.append(peek);
        throw new IllegalStateException(sb.toString());
    }

    public String nextName() throws IOException {
        expect(JsonToken.NAME);
        Entry entry = (Entry) ((Iterator) peekStack()).next();
        this.stack.add(entry.getValue());
        return (String) entry.getKey();
    }

    public void nextNull() throws IOException {
        expect(JsonToken.NULL);
        popStack();
    }

    public String nextString() throws IOException {
        JsonToken peek = peek();
        if (peek == JsonToken.STRING || peek == JsonToken.NUMBER) {
            return ((JsonPrimitive) popStack()).getAsString();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected ");
        sb.append(JsonToken.STRING);
        sb.append(" but was ");
        sb.append(peek);
        throw new IllegalStateException(sb.toString());
    }

    public JsonToken peek() throws IOException {
        if (this.stack.isEmpty()) {
            return JsonToken.END_DOCUMENT;
        }
        Object peekStack = peekStack();
        if (peekStack instanceof Iterator) {
            boolean z = this.stack.get(this.stack.size() - 2) instanceof JsonObject;
            Iterator it = (Iterator) peekStack;
            if (!it.hasNext()) {
                return z ? JsonToken.END_OBJECT : JsonToken.END_ARRAY;
            } else if (z) {
                return JsonToken.NAME;
            } else {
                this.stack.add(it.next());
                return peek();
            }
        } else if (peekStack instanceof JsonObject) {
            return JsonToken.BEGIN_OBJECT;
        } else {
            if (peekStack instanceof JsonArray) {
                return JsonToken.BEGIN_ARRAY;
            }
            if (peekStack instanceof JsonPrimitive) {
                JsonPrimitive jsonPrimitive = (JsonPrimitive) peekStack;
                if (jsonPrimitive.isString()) {
                    return JsonToken.STRING;
                }
                if (jsonPrimitive.isBoolean()) {
                    return JsonToken.BOOLEAN;
                }
                if (jsonPrimitive.isNumber()) {
                    return JsonToken.NUMBER;
                }
                throw new AssertionError();
            } else if (peekStack instanceof JsonNull) {
                return JsonToken.NULL;
            } else {
                if (peekStack == SENTINEL_CLOSED) {
                    throw new IllegalStateException("JsonReader is closed");
                }
                throw new AssertionError();
            }
        }
    }

    public void promoteNameToValue() throws IOException {
        expect(JsonToken.NAME);
        Entry entry = (Entry) ((Iterator) peekStack()).next();
        this.stack.add(entry.getValue());
        this.stack.add(new JsonPrimitive((String) entry.getKey()));
    }

    public void skipValue() throws IOException {
        if (peek() == JsonToken.NAME) {
            nextName();
        } else {
            popStack();
        }
    }

    public String toString() {
        return getClass().getSimpleName();
    }
}
