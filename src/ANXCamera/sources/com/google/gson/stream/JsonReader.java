package com.google.gson.stream;

import com.google.gson.internal.JsonReaderInternalAccess;
import com.google.gson.internal.bind.JsonTreeReader;
import com.ss.android.ttve.common.TEDefine;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;

public class JsonReader implements Closeable {
    private static final long MIN_INCOMPLETE_INTEGER = -922337203685477580L;
    private static final char[] NON_EXECUTE_PREFIX = ")]}'\n".toCharArray();
    private static final int NUMBER_CHAR_DECIMAL = 3;
    private static final int NUMBER_CHAR_DIGIT = 2;
    private static final int NUMBER_CHAR_EXP_DIGIT = 7;
    private static final int NUMBER_CHAR_EXP_E = 5;
    private static final int NUMBER_CHAR_EXP_SIGN = 6;
    private static final int NUMBER_CHAR_FRACTION_DIGIT = 4;
    private static final int NUMBER_CHAR_NONE = 0;
    private static final int NUMBER_CHAR_SIGN = 1;
    private static final int PEEKED_BEGIN_ARRAY = 3;
    private static final int PEEKED_BEGIN_OBJECT = 1;
    private static final int PEEKED_BUFFERED = 11;
    private static final int PEEKED_DOUBLE_QUOTED = 9;
    private static final int PEEKED_DOUBLE_QUOTED_NAME = 13;
    private static final int PEEKED_END_ARRAY = 4;
    private static final int PEEKED_END_OBJECT = 2;
    private static final int PEEKED_EOF = 17;
    private static final int PEEKED_FALSE = 6;
    private static final int PEEKED_LONG = 15;
    private static final int PEEKED_NONE = 0;
    private static final int PEEKED_NULL = 7;
    private static final int PEEKED_NUMBER = 16;
    private static final int PEEKED_SINGLE_QUOTED = 8;
    private static final int PEEKED_SINGLE_QUOTED_NAME = 12;
    private static final int PEEKED_TRUE = 5;
    private static final int PEEKED_UNQUOTED = 10;
    private static final int PEEKED_UNQUOTED_NAME = 14;
    private final char[] buffer = new char[1024];
    private final Reader in;
    private boolean lenient = false;
    private int limit = 0;
    private int lineNumber = 0;
    private int lineStart = 0;
    /* access modifiers changed from: private */
    public int peeked = 0;
    private long peekedLong;
    private int peekedNumberLength;
    private String peekedString;
    private int pos = 0;
    private int[] stack = new int[32];
    private int stackSize = 0;

    static {
        JsonReaderInternalAccess.INSTANCE = new JsonReaderInternalAccess() {
            public void promoteNameToValue(JsonReader jsonReader) throws IOException {
                if (jsonReader instanceof JsonTreeReader) {
                    ((JsonTreeReader) jsonReader).promoteNameToValue();
                    return;
                }
                int access$000 = jsonReader.peeked;
                if (access$000 == 0) {
                    access$000 = jsonReader.doPeek();
                }
                if (access$000 == 13) {
                    jsonReader.peeked = 9;
                } else if (access$000 == 12) {
                    jsonReader.peeked = 8;
                } else if (access$000 == 14) {
                    jsonReader.peeked = 10;
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Expected a name but was ");
                    sb.append(jsonReader.peek());
                    sb.append(" ");
                    sb.append(" at line ");
                    sb.append(jsonReader.getLineNumber());
                    sb.append(" column ");
                    sb.append(jsonReader.getColumnNumber());
                    throw new IllegalStateException(sb.toString());
                }
            }
        };
    }

    public JsonReader(Reader reader) {
        int[] iArr = this.stack;
        int i = this.stackSize;
        this.stackSize = i + 1;
        iArr[i] = 6;
        if (reader != null) {
            this.in = reader;
            return;
        }
        throw new NullPointerException("in == null");
    }

    private void checkLenient() throws IOException {
        if (!this.lenient) {
            throw syntaxError("Use JsonReader.setLenient(true) to accept malformed JSON");
        }
    }

    private void consumeNonExecutePrefix() throws IOException {
        nextNonWhitespace(true);
        this.pos--;
        if (this.pos + NON_EXECUTE_PREFIX.length <= this.limit || fillBuffer(NON_EXECUTE_PREFIX.length)) {
            int i = 0;
            while (i < NON_EXECUTE_PREFIX.length) {
                if (this.buffer[this.pos + i] == NON_EXECUTE_PREFIX[i]) {
                    i++;
                } else {
                    return;
                }
            }
            this.pos += NON_EXECUTE_PREFIX.length;
        }
    }

    /* access modifiers changed from: private */
    public int doPeek() throws IOException {
        int i = this.stack[this.stackSize - 1];
        if (i == 1) {
            this.stack[this.stackSize - 1] = 2;
        } else if (i == 2) {
            int nextNonWhitespace = nextNonWhitespace(true);
            if (nextNonWhitespace != 44) {
                if (nextNonWhitespace == 59) {
                    checkLenient();
                } else if (nextNonWhitespace == 93) {
                    this.peeked = 4;
                    return 4;
                } else {
                    throw syntaxError("Unterminated array");
                }
            }
        } else if (i == 3 || i == 5) {
            this.stack[this.stackSize - 1] = 4;
            if (i == 5) {
                int nextNonWhitespace2 = nextNonWhitespace(true);
                if (nextNonWhitespace2 != 44) {
                    if (nextNonWhitespace2 == 59) {
                        checkLenient();
                    } else if (nextNonWhitespace2 == 125) {
                        this.peeked = 2;
                        return 2;
                    } else {
                        throw syntaxError("Unterminated object");
                    }
                }
            }
            int nextNonWhitespace3 = nextNonWhitespace(true);
            if (nextNonWhitespace3 == 34) {
                this.peeked = 13;
                return 13;
            } else if (nextNonWhitespace3 == 39) {
                checkLenient();
                this.peeked = 12;
                return 12;
            } else if (nextNonWhitespace3 != 125) {
                checkLenient();
                this.pos--;
                if (isLiteral((char) nextNonWhitespace3)) {
                    this.peeked = 14;
                    return 14;
                }
                throw syntaxError("Expected name");
            } else if (i != 5) {
                this.peeked = 2;
                return 2;
            } else {
                throw syntaxError("Expected name");
            }
        } else if (i == 4) {
            this.stack[this.stackSize - 1] = 5;
            int nextNonWhitespace4 = nextNonWhitespace(true);
            if (nextNonWhitespace4 != 58) {
                if (nextNonWhitespace4 == 61) {
                    checkLenient();
                    if ((this.pos < this.limit || fillBuffer(1)) && this.buffer[this.pos] == '>') {
                        this.pos++;
                    }
                } else {
                    throw syntaxError("Expected ':'");
                }
            }
        } else if (i == 6) {
            if (this.lenient) {
                consumeNonExecutePrefix();
            }
            this.stack[this.stackSize - 1] = 7;
        } else if (i == 7) {
            if (nextNonWhitespace(false) == -1) {
                this.peeked = 17;
                return 17;
            }
            checkLenient();
            this.pos--;
        } else if (i == 8) {
            throw new IllegalStateException("JsonReader is closed");
        }
        int nextNonWhitespace5 = nextNonWhitespace(true);
        if (nextNonWhitespace5 == 34) {
            if (this.stackSize == 1) {
                checkLenient();
            }
            this.peeked = 9;
            return 9;
        } else if (nextNonWhitespace5 != 39) {
            if (!(nextNonWhitespace5 == 44 || nextNonWhitespace5 == 59)) {
                if (nextNonWhitespace5 == 91) {
                    this.peeked = 3;
                    return 3;
                } else if (nextNonWhitespace5 != 93) {
                    if (nextNonWhitespace5 != 123) {
                        this.pos--;
                        if (this.stackSize == 1) {
                            checkLenient();
                        }
                        int peekKeyword = peekKeyword();
                        if (peekKeyword != 0) {
                            return peekKeyword;
                        }
                        int peekNumber = peekNumber();
                        if (peekNumber != 0) {
                            return peekNumber;
                        }
                        if (isLiteral(this.buffer[this.pos])) {
                            checkLenient();
                            this.peeked = 10;
                            return 10;
                        }
                        throw syntaxError("Expected value");
                    }
                    this.peeked = 1;
                    return 1;
                } else if (i == 1) {
                    this.peeked = 4;
                    return 4;
                }
            }
            if (i == 1 || i == 2) {
                checkLenient();
                this.pos--;
                this.peeked = 7;
                return 7;
            }
            throw syntaxError("Unexpected value");
        } else {
            checkLenient();
            this.peeked = 8;
            return 8;
        }
    }

    private boolean fillBuffer(int i) throws IOException {
        char[] cArr = this.buffer;
        this.lineStart -= this.pos;
        if (this.limit != this.pos) {
            this.limit -= this.pos;
            System.arraycopy(cArr, this.pos, cArr, 0, this.limit);
        } else {
            this.limit = 0;
        }
        this.pos = 0;
        do {
            int read = this.in.read(cArr, this.limit, cArr.length - this.limit);
            int i2 = read;
            if (read == -1) {
                return false;
            }
            this.limit += i2;
            if (this.lineNumber == 0 && this.lineStart == 0 && this.limit > 0 && cArr[0] == 65279) {
                this.pos++;
                this.lineStart++;
                i++;
            }
        } while (this.limit < i);
        return true;
    }

    /* access modifiers changed from: private */
    public int getColumnNumber() {
        return (this.pos - this.lineStart) + 1;
    }

    /* access modifiers changed from: private */
    public int getLineNumber() {
        return this.lineNumber + 1;
    }

    private boolean isLiteral(char c) throws IOException {
        switch (c) {
            case 9:
            case 10:
            case 12:
            case 13:
            case ' ':
            case ',':
            case ':':
            case '[':
            case ']':
            case '{':
            case '}':
                break;
            case '#':
            case '/':
            case ';':
            case '=':
            case '\\':
                checkLenient();
                break;
            default:
                return true;
        }
        return false;
    }

    private int nextNonWhitespace(boolean z) throws IOException {
        int i;
        char[] cArr = this.buffer;
        int i2 = this.pos;
        int i3 = this.limit;
        while (true) {
            if (i2 == i3) {
                this.pos = i2;
                if (fillBuffer(1)) {
                    i2 = this.pos;
                    i3 = this.limit;
                } else if (!z) {
                    return -1;
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("End of input at line ");
                    sb.append(getLineNumber());
                    sb.append(" column ");
                    sb.append(getColumnNumber());
                    throw new EOFException(sb.toString());
                }
            }
            int i4 = i2 + 1;
            char c = cArr[i2];
            if (c == 10) {
                this.lineNumber++;
                this.lineStart = i4;
            } else if (!(c == ' ' || c == 13 || c == 9)) {
                if (c == '/') {
                    this.pos = i4;
                    if (i4 == i3) {
                        this.pos--;
                        boolean fillBuffer = fillBuffer(2);
                        this.pos++;
                        if (!fillBuffer) {
                            return c;
                        }
                    }
                    checkLenient();
                    char c2 = cArr[this.pos];
                    if (c2 == '*') {
                        this.pos++;
                        if (skipTo("*/")) {
                            i = this.pos + 2;
                            i3 = this.limit;
                        } else {
                            throw syntaxError("Unterminated comment");
                        }
                    } else if (c2 != '/') {
                        return c;
                    } else {
                        this.pos++;
                        skipToEndOfLine();
                        i = this.pos;
                        i3 = this.limit;
                    }
                } else if (c == '#') {
                    this.pos = i4;
                    checkLenient();
                    skipToEndOfLine();
                    i = this.pos;
                    i3 = this.limit;
                } else {
                    this.pos = i4;
                    return c;
                }
                i2 = i;
            }
            i2 = i4;
        }
    }

    private String nextQuotedValue(char c) throws IOException {
        char[] cArr = this.buffer;
        StringBuilder sb = new StringBuilder();
        while (true) {
            int i = this.pos;
            int i2 = this.limit;
            int i3 = i;
            while (i3 < i2) {
                int i4 = i3 + 1;
                char c2 = cArr[i3];
                if (c2 == c) {
                    this.pos = i4;
                    sb.append(cArr, i, (i4 - i) - 1);
                    return sb.toString();
                } else if (c2 == '\\') {
                    this.pos = i4;
                    sb.append(cArr, i, (i4 - i) - 1);
                    sb.append(readEscapeCharacter());
                    int i5 = this.pos;
                    i2 = this.limit;
                    i = i5;
                    i3 = i5;
                } else {
                    if (c2 == 10) {
                        this.lineNumber++;
                        this.lineStart = i4;
                    }
                    i3 = i4;
                }
            }
            sb.append(cArr, i, i3 - i);
            this.pos = i3;
            if (!fillBuffer(1)) {
                throw syntaxError("Unterminated string");
            }
        }
    }

    private String nextUnquotedValue() throws IOException {
        String str;
        StringBuilder sb = null;
        int i = 0;
        while (true) {
            if (this.pos + i < this.limit) {
                switch (this.buffer[this.pos + i]) {
                    case 9:
                    case 10:
                    case 12:
                    case 13:
                    case ' ':
                    case ',':
                    case ':':
                    case '[':
                    case ']':
                    case '{':
                    case '}':
                        break;
                    case '#':
                    case '/':
                    case ';':
                    case '=':
                    case '\\':
                        checkLenient();
                        break;
                    default:
                        i++;
                        continue;
                }
            } else if (i >= this.buffer.length) {
                if (sb == null) {
                    sb = new StringBuilder();
                }
                sb.append(this.buffer, this.pos, i);
                this.pos += i;
                i = 0;
                if (!fillBuffer(1)) {
                }
            } else if (fillBuffer(i + 1)) {
            }
        }
        if (sb == null) {
            str = new String(this.buffer, this.pos, i);
        } else {
            sb.append(this.buffer, this.pos, i);
            str = sb.toString();
        }
        this.pos += i;
        return str;
    }

    private int peekKeyword() throws IOException {
        int i;
        String str;
        String str2;
        char c = this.buffer[this.pos];
        if (c == 't' || c == 'T') {
            str2 = "true";
            str = "TRUE";
            i = 5;
        } else if (c == 'f' || c == 'F') {
            str2 = "false";
            str = "FALSE";
            i = 6;
        } else if (c != 'n' && c != 'N') {
            return 0;
        } else {
            str2 = TEDefine.FACE_BEAUTY_NULL;
            str = "NULL";
            i = 7;
        }
        int length = str2.length();
        int i2 = 1;
        while (i2 < length) {
            if (this.pos + i2 >= this.limit && !fillBuffer(i2 + 1)) {
                return 0;
            }
            char c2 = this.buffer[this.pos + i2];
            if (c2 != str2.charAt(i2) && c2 != str.charAt(i2)) {
                return 0;
            }
            i2++;
        }
        if ((this.pos + length < this.limit || fillBuffer(length + 1)) && isLiteral(this.buffer[this.pos + length])) {
            return 0;
        }
        this.pos += length;
        this.peeked = i;
        return i;
    }

    private int peekNumber() throws IOException {
        long j;
        char c;
        long j2;
        char[] cArr = this.buffer;
        int i = this.pos;
        boolean z = false;
        boolean z2 = true;
        char c2 = 0;
        int i2 = 0;
        long j3 = 0;
        int i3 = this.limit;
        int i4 = i;
        int i5 = 0;
        while (true) {
            if (i4 + i5 == i3) {
                if (i5 == cArr.length) {
                    return i2;
                }
                if (!fillBuffer(i5 + 1)) {
                    j = j3;
                } else {
                    i4 = this.pos;
                    i3 = this.limit;
                }
            }
            c = cArr[i4 + i5];
            if (c != '+') {
                if (c != 'E' && c != 'e') {
                    switch (c) {
                        case '-':
                            j2 = j3;
                            if (c2 == 0) {
                                z = true;
                                c2 = 1;
                                break;
                            } else if (c2 == 5) {
                                c2 = 6;
                                break;
                            } else {
                                return 0;
                            }
                        case '.':
                            int i6 = i2;
                            j2 = j3;
                            if (c2 == 2) {
                                c2 = 3;
                                break;
                            } else {
                                return i6;
                            }
                        default:
                            if (c >= '0') {
                                if (c <= '9') {
                                    boolean z3 = true;
                                    if (c2 != 1) {
                                        if (c2 != 0) {
                                            if (c2 == 2) {
                                                if (j3 != 0) {
                                                    long j4 = j3;
                                                    long j5 = (10 * j3) - ((long) (c - '0'));
                                                    if (j4 <= MIN_INCOMPLETE_INTEGER && (j4 != MIN_INCOMPLETE_INTEGER || j5 >= j4)) {
                                                        z3 = false;
                                                    }
                                                    z2 &= z3;
                                                    j2 = j5;
                                                    break;
                                                } else {
                                                    return i2;
                                                }
                                            } else {
                                                long j6 = j3;
                                                if (c2 == 3) {
                                                    c2 = 4;
                                                } else if (c2 == 5 || c2 == 6) {
                                                    c2 = 7;
                                                }
                                                j3 = j6;
                                                break;
                                            }
                                        } else {
                                            long j7 = j3;
                                        }
                                    } else {
                                        long j8 = j3;
                                    }
                                    j2 = (long) (-(c - '0'));
                                    c2 = 2;
                                    break;
                                } else {
                                    j = j3;
                                    break;
                                }
                            } else {
                                j = j3;
                                break;
                            }
                    }
                } else {
                    int i7 = i2;
                    j2 = j3;
                    if (c2 != 2 && c2 != 4) {
                        return i7;
                    }
                    c2 = 5;
                }
            } else {
                j2 = j3;
                if (c2 != 5) {
                    return 0;
                }
                c2 = 6;
            }
            j3 = j2;
            i5++;
            i2 = 0;
        }
        if (isLiteral(c)) {
            long j9 = j;
            return 0;
        }
        if (c2 != 2 || !z2) {
            long j10 = j;
        } else if (j != Long.MIN_VALUE || z) {
            this.peekedLong = z ? j : -j;
            this.pos += i5;
            this.peeked = 15;
            return 15;
        } else {
            long j11 = j;
        }
        if (c2 != 2 && c2 != 4 && c2 != 7) {
            return 0;
        }
        this.peekedNumberLength = i5;
        this.peeked = 16;
        return 16;
    }

    private void push(int i) {
        if (this.stackSize == this.stack.length) {
            int[] iArr = new int[(this.stackSize * 2)];
            System.arraycopy(this.stack, 0, iArr, 0, this.stackSize);
            this.stack = iArr;
        }
        int[] iArr2 = this.stack;
        int i2 = this.stackSize;
        this.stackSize = i2 + 1;
        iArr2[i2] = i;
    }

    private char readEscapeCharacter() throws IOException {
        int i;
        if (this.pos != this.limit || fillBuffer(1)) {
            char[] cArr = this.buffer;
            int i2 = this.pos;
            this.pos = i2 + 1;
            char c = cArr[i2];
            if (c == 10) {
                this.lineNumber++;
                this.lineStart = this.pos;
            } else if (c == 'b') {
                return 8;
            } else {
                if (c == 'f') {
                    return 12;
                }
                if (c == 'n') {
                    return 10;
                }
                if (c == 'r') {
                    return 13;
                }
                switch (c) {
                    case 't':
                        return 9;
                    case 'u':
                        if (this.pos + 4 <= this.limit || fillBuffer(4)) {
                            char c2 = 0;
                            int i3 = this.pos;
                            int i4 = i3 + 4;
                            while (i3 < i4) {
                                char c3 = this.buffer[i3];
                                char c4 = (char) (c2 << 4);
                                if (c3 >= '0' && c3 <= '9') {
                                    i = c3 - '0';
                                } else if (c3 >= 'a' && c3 <= 'f') {
                                    i = (c3 - 'a') + 10;
                                } else if (c3 < 'A' || c3 > 'F') {
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("\\u");
                                    sb.append(new String(this.buffer, this.pos, 4));
                                    throw new NumberFormatException(sb.toString());
                                } else {
                                    i = (c3 - 'A') + 10;
                                }
                                c2 = (char) (i + c4);
                                i3++;
                            }
                            this.pos += 4;
                            return c2;
                        }
                        throw syntaxError("Unterminated escape sequence");
                }
            }
            return c;
        }
        throw syntaxError("Unterminated escape sequence");
    }

    private void skipQuotedValue(char c) throws IOException {
        char[] cArr = this.buffer;
        while (true) {
            int i = this.pos;
            int i2 = this.limit;
            while (i < i2) {
                int i3 = i + 1;
                char c2 = cArr[i];
                if (c2 == c) {
                    this.pos = i3;
                    return;
                } else if (c2 == '\\') {
                    this.pos = i3;
                    readEscapeCharacter();
                    int i4 = this.pos;
                    i2 = this.limit;
                    i = i4;
                } else {
                    if (c2 == 10) {
                        this.lineNumber++;
                        this.lineStart = i3;
                    }
                    i = i3;
                }
            }
            this.pos = i;
            if (!fillBuffer(1)) {
                throw syntaxError("Unterminated string");
            }
        }
    }

    private boolean skipTo(String str) throws IOException {
        while (true) {
            int i = 0;
            if (this.pos + str.length() > this.limit && !fillBuffer(str.length())) {
                return false;
            }
            if (this.buffer[this.pos] == 10) {
                this.lineNumber++;
                this.lineStart = this.pos + 1;
            } else {
                while (true) {
                    int i2 = i;
                    if (i2 >= str.length()) {
                        return true;
                    }
                    if (this.buffer[this.pos + i2] != str.charAt(i2)) {
                        break;
                    }
                    i = i2 + 1;
                }
            }
            this.pos++;
        }
    }

    private void skipToEndOfLine() throws IOException {
        while (true) {
            if (this.pos < this.limit || fillBuffer(1)) {
                char[] cArr = this.buffer;
                int i = this.pos;
                this.pos = i + 1;
                char c = cArr[i];
                if (c == 10) {
                    this.lineNumber++;
                    this.lineStart = this.pos;
                    return;
                } else if (c == 13) {
                    return;
                }
            } else {
                return;
            }
        }
    }

    private void skipUnquotedValue() throws IOException {
        do {
            int i = 0;
            while (this.pos + i < this.limit) {
                switch (this.buffer[this.pos + i]) {
                    case 9:
                    case 10:
                    case 12:
                    case 13:
                    case ' ':
                    case ',':
                    case ':':
                    case '[':
                    case ']':
                    case '{':
                    case '}':
                        break;
                    case '#':
                    case '/':
                    case ';':
                    case '=':
                    case '\\':
                        checkLenient();
                        break;
                    default:
                        i++;
                }
                this.pos += i;
                return;
            }
            this.pos += i;
        } while (fillBuffer(1));
    }

    private IOException syntaxError(String str) throws IOException {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" at line ");
        sb.append(getLineNumber());
        sb.append(" column ");
        sb.append(getColumnNumber());
        throw new MalformedJsonException(sb.toString());
    }

    public void beginArray() throws IOException {
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        if (i == 3) {
            push(1);
            this.peeked = 0;
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected BEGIN_ARRAY but was ");
        sb.append(peek());
        sb.append(" at line ");
        sb.append(getLineNumber());
        sb.append(" column ");
        sb.append(getColumnNumber());
        throw new IllegalStateException(sb.toString());
    }

    public void beginObject() throws IOException {
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        if (i == 1) {
            push(3);
            this.peeked = 0;
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected BEGIN_OBJECT but was ");
        sb.append(peek());
        sb.append(" at line ");
        sb.append(getLineNumber());
        sb.append(" column ");
        sb.append(getColumnNumber());
        throw new IllegalStateException(sb.toString());
    }

    public void close() throws IOException {
        this.peeked = 0;
        this.stack[0] = 8;
        this.stackSize = 1;
        this.in.close();
    }

    public void endArray() throws IOException {
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        if (i == 4) {
            this.stackSize--;
            this.peeked = 0;
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected END_ARRAY but was ");
        sb.append(peek());
        sb.append(" at line ");
        sb.append(getLineNumber());
        sb.append(" column ");
        sb.append(getColumnNumber());
        throw new IllegalStateException(sb.toString());
    }

    public void endObject() throws IOException {
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        if (i == 2) {
            this.stackSize--;
            this.peeked = 0;
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected END_OBJECT but was ");
        sb.append(peek());
        sb.append(" at line ");
        sb.append(getLineNumber());
        sb.append(" column ");
        sb.append(getColumnNumber());
        throw new IllegalStateException(sb.toString());
    }

    public boolean hasNext() throws IOException {
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        return (i == 2 || i == 4) ? false : true;
    }

    public final boolean isLenient() {
        return this.lenient;
    }

    public boolean nextBoolean() throws IOException {
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        if (i == 5) {
            this.peeked = 0;
            return true;
        } else if (i == 6) {
            this.peeked = 0;
            return false;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Expected a boolean but was ");
            sb.append(peek());
            sb.append(" at line ");
            sb.append(getLineNumber());
            sb.append(" column ");
            sb.append(getColumnNumber());
            throw new IllegalStateException(sb.toString());
        }
    }

    public double nextDouble() throws IOException {
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        if (i == 15) {
            this.peeked = 0;
            return (double) this.peekedLong;
        }
        if (i == 16) {
            this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        } else if (i == 8 || i == 9) {
            this.peekedString = nextQuotedValue(i == 8 ? '\'' : '\"');
        } else if (i == 10) {
            this.peekedString = nextUnquotedValue();
        } else if (i != 11) {
            StringBuilder sb = new StringBuilder();
            sb.append("Expected a double but was ");
            sb.append(peek());
            sb.append(" at line ");
            sb.append(getLineNumber());
            sb.append(" column ");
            sb.append(getColumnNumber());
            throw new IllegalStateException(sb.toString());
        }
        this.peeked = 11;
        double parseDouble = Double.parseDouble(this.peekedString);
        if (this.lenient || (!Double.isNaN(parseDouble) && !Double.isInfinite(parseDouble))) {
            this.peekedString = null;
            this.peeked = 0;
            return parseDouble;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("JSON forbids NaN and infinities: ");
        sb2.append(parseDouble);
        sb2.append(" at line ");
        sb2.append(getLineNumber());
        sb2.append(" column ");
        sb2.append(getColumnNumber());
        throw new MalformedJsonException(sb2.toString());
    }

    public int nextInt() throws IOException {
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        if (i == 15) {
            int i2 = (int) this.peekedLong;
            if (this.peekedLong == ((long) i2)) {
                this.peeked = 0;
                return i2;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Expected an int but was ");
            sb.append(this.peekedLong);
            sb.append(" at line ");
            sb.append(getLineNumber());
            sb.append(" column ");
            sb.append(getColumnNumber());
            throw new NumberFormatException(sb.toString());
        }
        if (i == 16) {
            this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        } else if (i == 8 || i == 9) {
            this.peekedString = nextQuotedValue(i == 8 ? '\'' : '\"');
            try {
                int parseInt = Integer.parseInt(this.peekedString);
                try {
                    this.peeked = 0;
                    return parseInt;
                } catch (NumberFormatException e) {
                }
            } catch (NumberFormatException e2) {
            }
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Expected an int but was ");
            sb2.append(peek());
            sb2.append(" at line ");
            sb2.append(getLineNumber());
            sb2.append(" column ");
            sb2.append(getColumnNumber());
            throw new IllegalStateException(sb2.toString());
        }
        this.peeked = 11;
        double parseDouble = Double.parseDouble(this.peekedString);
        int i3 = (int) parseDouble;
        if (((double) i3) == parseDouble) {
            this.peekedString = null;
            this.peeked = 0;
            return i3;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("Expected an int but was ");
        sb3.append(this.peekedString);
        sb3.append(" at line ");
        sb3.append(getLineNumber());
        sb3.append(" column ");
        sb3.append(getColumnNumber());
        throw new NumberFormatException(sb3.toString());
    }

    public long nextLong() throws IOException {
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        if (i == 15) {
            this.peeked = 0;
            return this.peekedLong;
        }
        if (i == 16) {
            this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        } else if (i == 8 || i == 9) {
            this.peekedString = nextQuotedValue(i == 8 ? '\'' : '\"');
            try {
                long parseLong = Long.parseLong(this.peekedString);
                this.peeked = 0;
                return parseLong;
            } catch (NumberFormatException e) {
            }
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Expected a long but was ");
            sb.append(peek());
            sb.append(" at line ");
            sb.append(getLineNumber());
            sb.append(" column ");
            sb.append(getColumnNumber());
            throw new IllegalStateException(sb.toString());
        }
        this.peeked = 11;
        double parseDouble = Double.parseDouble(this.peekedString);
        long j = (long) parseDouble;
        if (((double) j) == parseDouble) {
            this.peekedString = null;
            this.peeked = 0;
            return j;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("Expected a long but was ");
        sb2.append(this.peekedString);
        sb2.append(" at line ");
        sb2.append(getLineNumber());
        sb2.append(" column ");
        sb2.append(getColumnNumber());
        throw new NumberFormatException(sb2.toString());
    }

    public String nextName() throws IOException {
        String str;
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        if (i == 14) {
            str = nextUnquotedValue();
        } else if (i == 12) {
            str = nextQuotedValue('\'');
        } else if (i == 13) {
            str = nextQuotedValue('\"');
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Expected a name but was ");
            sb.append(peek());
            sb.append(" at line ");
            sb.append(getLineNumber());
            sb.append(" column ");
            sb.append(getColumnNumber());
            throw new IllegalStateException(sb.toString());
        }
        this.peeked = 0;
        return str;
    }

    public void nextNull() throws IOException {
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        if (i == 7) {
            this.peeked = 0;
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Expected null but was ");
        sb.append(peek());
        sb.append(" at line ");
        sb.append(getLineNumber());
        sb.append(" column ");
        sb.append(getColumnNumber());
        throw new IllegalStateException(sb.toString());
    }

    public String nextString() throws IOException {
        String str;
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        if (i == 10) {
            str = nextUnquotedValue();
        } else if (i == 8) {
            str = nextQuotedValue('\'');
        } else if (i == 9) {
            str = nextQuotedValue('\"');
        } else if (i == 11) {
            str = this.peekedString;
            this.peekedString = null;
        } else if (i == 15) {
            str = Long.toString(this.peekedLong);
        } else if (i == 16) {
            str = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Expected a string but was ");
            sb.append(peek());
            sb.append(" at line ");
            sb.append(getLineNumber());
            sb.append(" column ");
            sb.append(getColumnNumber());
            throw new IllegalStateException(sb.toString());
        }
        this.peeked = 0;
        return str;
    }

    public JsonToken peek() throws IOException {
        int i = this.peeked;
        if (i == 0) {
            i = doPeek();
        }
        switch (i) {
            case 1:
                return JsonToken.BEGIN_OBJECT;
            case 2:
                return JsonToken.END_OBJECT;
            case 3:
                return JsonToken.BEGIN_ARRAY;
            case 4:
                return JsonToken.END_ARRAY;
            case 5:
            case 6:
                return JsonToken.BOOLEAN;
            case 7:
                return JsonToken.NULL;
            case 8:
            case 9:
            case 10:
            case 11:
                return JsonToken.STRING;
            case 12:
            case 13:
            case 14:
                return JsonToken.NAME;
            case 15:
            case 16:
                return JsonToken.NUMBER;
            case 17:
                return JsonToken.END_DOCUMENT;
            default:
                throw new AssertionError();
        }
    }

    public final void setLenient(boolean z) {
        this.lenient = z;
    }

    public void skipValue() throws IOException {
        int i = 0;
        do {
            int i2 = this.peeked;
            if (i2 == 0) {
                i2 = doPeek();
            }
            if (i2 == 3) {
                push(1);
                i++;
            } else if (i2 == 1) {
                push(3);
                i++;
            } else if (i2 == 4) {
                this.stackSize--;
                i--;
            } else if (i2 == 2) {
                this.stackSize--;
                i--;
            } else if (i2 == 14 || i2 == 10) {
                skipUnquotedValue();
            } else if (i2 == 8 || i2 == 12) {
                skipQuotedValue('\'');
            } else if (i2 == 9 || i2 == 13) {
                skipQuotedValue('\"');
            } else if (i2 == 16) {
                this.pos += this.peekedNumberLength;
            }
            this.peeked = 0;
        } while (i != 0);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" at line ");
        sb.append(getLineNumber());
        sb.append(" column ");
        sb.append(getColumnNumber());
        return sb.toString();
    }
}
