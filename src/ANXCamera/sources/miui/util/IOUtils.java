package miui.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.CharArrayWriter;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.lang.ref.SoftReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import miui.util.Pools.Manager;
import miui.util.Pools.Pool;

public class IOUtils {
    private static final int Jq = 4096;
    private static final ThreadLocal<SoftReference<byte[]>> Jr = new ThreadLocal<>();
    private static final ThreadLocal<SoftReference<char[]>> Js = new ThreadLocal<>();
    private static final Pool<ByteArrayOutputStream> Jt = Pools.createSoftReferencePool(new Manager<ByteArrayOutputStream>() {
        /* renamed from: a */
        public void onRelease(ByteArrayOutputStream byteArrayOutputStream) {
            byteArrayOutputStream.reset();
        }

        /* renamed from: du */
        public ByteArrayOutputStream createInstance() {
            return new ByteArrayOutputStream();
        }
    }, 2);
    private static final Pool<CharArrayWriter> Ju = Pools.createSoftReferencePool(new Manager<CharArrayWriter>() {
        /* renamed from: a */
        public void onRelease(CharArrayWriter charArrayWriter) {
            charArrayWriter.reset();
        }

        /* renamed from: dv */
        public CharArrayWriter createInstance() {
            return new CharArrayWriter();
        }
    }, 2);
    private static final Pool<StringWriter> Jv = Pools.createSoftReferencePool(new Manager<StringWriter>() {
        /* renamed from: a */
        public void onRelease(StringWriter stringWriter) {
            stringWriter.getBuffer().setLength(0);
        }

        /* renamed from: dw */
        public StringWriter createInstance() {
            return new StringWriter();
        }
    }, 2);
    private static final String LINE_SEPARATOR;

    static {
        StringWriter stringWriter = (StringWriter) Jv.acquire();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        printWriter.println();
        printWriter.flush();
        LINE_SEPARATOR = stringWriter.toString();
        printWriter.close();
        Jv.release(stringWriter);
    }

    protected IOUtils() throws InstantiationException {
        throw new InstantiationException("Cannot instantiate utility class");
    }

    public static void closeQuietly(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(InputStream inputStream) {
        if (inputStream != null) {
            try {
                inputStream.close();
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(OutputStream outputStream) {
        if (outputStream != null) {
            try {
                outputStream.flush();
            } catch (IOException e) {
            }
            try {
                outputStream.close();
            } catch (IOException e2) {
            }
        }
    }

    public static void closeQuietly(Reader reader) {
        if (reader != null) {
            try {
                reader.close();
            } catch (IOException e) {
            }
        }
    }

    public static void closeQuietly(Writer writer) {
        if (writer != null) {
            try {
                writer.close();
            } catch (IOException e) {
            }
        }
    }

    public static long copy(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] ds = ds();
        long j = 0;
        while (true) {
            int read = inputStream.read(ds);
            if (read != -1) {
                outputStream.write(ds, 0, read);
                j += (long) read;
            } else {
                outputStream.flush();
                return j;
            }
        }
    }

    public static long copy(Reader reader, Writer writer) throws IOException {
        char[] dt = dt();
        long j = 0;
        while (true) {
            int read = reader.read(dt);
            if (read != -1) {
                writer.write(dt, 0, read);
                j += (long) read;
            } else {
                writer.flush();
                return j;
            }
        }
    }

    public static void copy(InputStream inputStream, Writer writer) throws IOException {
        copy((Reader) new InputStreamReader(inputStream), writer);
    }

    public static void copy(InputStream inputStream, Writer writer, String str) throws IOException {
        InputStreamReader inputStreamReader = (str == null || str.length() == 0) ? new InputStreamReader(inputStream) : new InputStreamReader(inputStream, str);
        copy((Reader) inputStreamReader, writer);
    }

    public static void copy(Reader reader, OutputStream outputStream) throws IOException {
        copy(reader, (Writer) new OutputStreamWriter(outputStream));
    }

    public static void copy(Reader reader, OutputStream outputStream, String str) throws IOException {
        OutputStreamWriter outputStreamWriter = (str == null || str.length() == 0) ? new OutputStreamWriter(outputStream) : new OutputStreamWriter(outputStream, str);
        copy(reader, (Writer) outputStreamWriter);
    }

    private static byte[] ds() {
        SoftReference softReference = (SoftReference) Jr.get();
        byte[] bArr = softReference != null ? (byte[]) softReference.get() : null;
        if (bArr != null) {
            return bArr;
        }
        byte[] bArr2 = new byte[4096];
        Jr.set(new SoftReference(bArr2));
        return bArr2;
    }

    private static char[] dt() {
        SoftReference softReference = (SoftReference) Js.get();
        char[] cArr = softReference != null ? (char[]) softReference.get() : null;
        if (cArr != null) {
            return cArr;
        }
        char[] cArr2 = new char[4096];
        Js.set(new SoftReference(cArr2));
        return cArr2;
    }

    public static List<String> readLines(InputStream inputStream) throws IOException {
        return readLines((Reader) new InputStreamReader(inputStream));
    }

    public static List<String> readLines(InputStream inputStream, String str) throws IOException {
        InputStreamReader inputStreamReader = (str == null || str.length() == 0) ? new InputStreamReader(inputStream) : new InputStreamReader(inputStream, str);
        return readLines((Reader) inputStreamReader);
    }

    public static List<String> readLines(Reader reader) throws IOException {
        BufferedReader bufferedReader = reader instanceof BufferedReader ? (BufferedReader) reader : new BufferedReader(reader);
        ArrayList arrayList = new ArrayList();
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                return arrayList;
            }
            arrayList.add(readLine);
        }
    }

    public static byte[] toByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = (ByteArrayOutputStream) Jt.acquire();
        copy(inputStream, (OutputStream) byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        Jt.release(byteArrayOutputStream);
        return byteArray;
    }

    public static byte[] toByteArray(Reader reader) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = (ByteArrayOutputStream) Jt.acquire();
        copy(reader, (OutputStream) byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        Jt.release(byteArrayOutputStream);
        return byteArray;
    }

    public static byte[] toByteArray(Reader reader, String str) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = (ByteArrayOutputStream) Jt.acquire();
        copy(reader, (OutputStream) byteArrayOutputStream, str);
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        Jt.release(byteArrayOutputStream);
        return byteArray;
    }

    public static char[] toCharArray(InputStream inputStream) throws IOException {
        CharArrayWriter charArrayWriter = (CharArrayWriter) Ju.acquire();
        copy(inputStream, (Writer) charArrayWriter);
        char[] charArray = charArrayWriter.toCharArray();
        Ju.release(charArrayWriter);
        return charArray;
    }

    public static char[] toCharArray(InputStream inputStream, String str) throws IOException {
        CharArrayWriter charArrayWriter = (CharArrayWriter) Ju.acquire();
        copy(inputStream, (Writer) charArrayWriter, str);
        char[] charArray = charArrayWriter.toCharArray();
        Ju.release(charArrayWriter);
        return charArray;
    }

    public static char[] toCharArray(Reader reader) throws IOException {
        CharArrayWriter charArrayWriter = (CharArrayWriter) Ju.acquire();
        copy(reader, (Writer) charArrayWriter);
        char[] charArray = charArrayWriter.toCharArray();
        Ju.release(charArrayWriter);
        return charArray;
    }

    public static InputStream toInputStream(String str) {
        return new ByteArrayInputStream(str.getBytes());
    }

    public static InputStream toInputStream(String str, String str2) throws UnsupportedEncodingException {
        byte[] bytes = (str2 == null || str2.length() == 0) ? str.getBytes() : str.getBytes(str2);
        return new ByteArrayInputStream(bytes);
    }

    public static String toString(InputStream inputStream) throws IOException {
        StringWriter stringWriter = (StringWriter) Jv.acquire();
        copy(inputStream, (Writer) stringWriter);
        String stringWriter2 = stringWriter.toString();
        Jv.release(stringWriter);
        return stringWriter2;
    }

    public static String toString(InputStream inputStream, String str) throws IOException {
        StringWriter stringWriter = (StringWriter) Jv.acquire();
        copy(inputStream, (Writer) stringWriter, str);
        String stringWriter2 = stringWriter.toString();
        Jv.release(stringWriter);
        return stringWriter2;
    }

    public static String toString(Reader reader) throws IOException {
        StringWriter stringWriter = (StringWriter) Jv.acquire();
        copy(reader, (Writer) stringWriter);
        String stringWriter2 = stringWriter.toString();
        Jv.release(stringWriter);
        return stringWriter2;
    }

    public static void write(OutputStream outputStream, String str) throws IOException {
        if (str != null) {
            outputStream.write(str.getBytes());
        }
    }

    public static void write(OutputStream outputStream, String str, String str2) throws IOException {
        if (str != null) {
            byte[] bytes = (str2 == null || str2.length() == 0) ? str.getBytes() : str.getBytes(str2);
            outputStream.write(bytes);
        }
    }

    public static void write(OutputStream outputStream, byte[] bArr) throws IOException {
        if (bArr != null) {
            outputStream.write(bArr);
        }
    }

    public static void write(OutputStream outputStream, char[] cArr) throws IOException {
        if (cArr != null) {
            outputStream.write(new String(cArr).getBytes());
        }
    }

    public static void write(OutputStream outputStream, char[] cArr, String str) throws IOException {
        if (cArr != null) {
            byte[] bytes = (str == null || str.length() == 0) ? new String(cArr).getBytes() : new String(cArr).getBytes(str);
            outputStream.write(bytes);
        }
    }

    public static void write(Writer writer, String str) throws IOException {
        if (str != null) {
            writer.write(str);
        }
    }

    public static void write(Writer writer, byte[] bArr) throws IOException {
        if (bArr != null) {
            writer.write(new String(bArr));
        }
    }

    public static void write(Writer writer, byte[] bArr, String str) throws IOException {
        if (bArr != null) {
            String str2 = (str == null || str.length() == 0) ? new String(bArr) : new String(bArr, str);
            writer.write(str2);
        }
    }

    public static void write(Writer writer, char[] cArr) throws IOException {
        if (cArr != null) {
            writer.write(cArr);
        }
    }

    public static void writeLines(OutputStream outputStream, Collection<Object> collection, String str) throws IOException {
        if (collection != null) {
            if (str == null) {
                str = LINE_SEPARATOR;
            }
            for (Object next : collection) {
                if (next != null) {
                    outputStream.write(next.toString().getBytes());
                }
                outputStream.write(str.getBytes());
            }
        }
    }

    public static void writeLines(OutputStream outputStream, Collection<Object> collection, String str, String str2) throws IOException {
        if (collection != null) {
            if (str == null) {
                str = LINE_SEPARATOR;
            }
            for (Object next : collection) {
                if (next != null) {
                    outputStream.write(next.toString().getBytes(str2));
                }
                outputStream.write(str.getBytes(str2));
            }
        }
    }

    public static void writeLines(Writer writer, Collection<Object> collection, String str) throws IOException {
        if (collection != null) {
            if (str == null) {
                str = LINE_SEPARATOR;
            }
            for (Object next : collection) {
                if (next != null) {
                    writer.write(next.toString());
                }
                writer.write(str);
            }
        }
    }
}
