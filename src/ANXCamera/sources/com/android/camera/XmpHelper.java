package com.android.camera;

import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.adobe.xmp.XMPMetaFactory;
import com.adobe.xmp.options.SerializeOptions;
import com.android.camera.log.Log;
import com.android.camera.storage.Storage;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

public class XmpHelper {
    public static final String GOOGLE_MICROVIDEO_NAMESPACE = "http://ns.google.com/photos/1.0/camera/";
    private static final int MAX_XMP_BUFFER_SIZE = 65502;
    public static final String MICROVIDEO_OFFSET = "MicroVideoOffset";
    public static final String MICROVIDEO_PREFIX = "GCamera";
    public static final String MICROVIDEO_PRESENTATION_TIMESTAMP = "MicroVideoPresentationTimestampUs";
    public static final String MICROVIDEO_TYPE = "MicroVideo";
    public static final String MICROVIDEO_VERSION = "MicroVideoVersion";
    private static final int M_APP1 = 225;
    private static final int M_SOI = 216;
    private static final int M_SOS = 218;
    private static final String TAG = XmpHelper.class.getSimpleName();
    public static final String XIAOMI_XMP_METADATA_NAMESPACE = "http://ns.xiaomi.com/photos/1.0/camera/";
    public static final String XIAOMI_XMP_METADATA_PREFIX = "MiCamera";
    public static final String XIAOMI_XMP_METADATA_PROPERTY_NAME = "XMPMeta";
    private static final String XMP_HEADER = "http://ns.adobe.com/xap/1.0/\u0000";
    private static final int XMP_HEADER_SIZE = 29;

    private static class Section {
        public byte[] data;
        public int length;
        public int marker;

        private Section() {
        }
    }

    static {
        try {
            XMPMetaFactory.getSchemaRegistry().registerNamespace(GOOGLE_MICROVIDEO_NAMESPACE, MICROVIDEO_PREFIX);
            XMPMetaFactory.getSchemaRegistry().registerNamespace(XIAOMI_XMP_METADATA_NAMESPACE, XIAOMI_XMP_METADATA_PREFIX);
        } catch (XMPException e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to register namespaces: ");
            sb.append(e);
            Log.d(str, sb.toString());
        }
    }

    private XmpHelper() {
    }

    public static XMPMeta createXMPMeta() {
        return XMPMetaFactory.create();
    }

    public static XMPMeta extractOrCreateXMPMeta(String str) {
        XMPMeta extractXMPMeta = extractXMPMeta(str);
        return extractXMPMeta == null ? createXMPMeta() : extractXMPMeta;
    }

    public static XMPMeta extractXMPMeta(InputStream inputStream) {
        List<Section> parse = parse(inputStream, true);
        if (parse == null) {
            return null;
        }
        for (Section section : parse) {
            if (hasXMPHeader(section.data)) {
                byte[] bArr = new byte[(getXMPContentEnd(section.data) - 29)];
                System.arraycopy(section.data, 29, bArr, 0, bArr.length);
                try {
                    return XMPMetaFactory.parseFromBuffer(bArr);
                } catch (XMPException e) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("XMP parse error: ");
                    sb.append(e);
                    Log.d(str, sb.toString());
                    return null;
                }
            }
        }
        return null;
    }

    public static XMPMeta extractXMPMeta(String str) {
        if (str.toLowerCase().endsWith(Storage.JPEG_SUFFIX) || str.toLowerCase().endsWith(".jpeg")) {
            try {
                return extractXMPMeta((InputStream) new FileInputStream(str));
            } catch (FileNotFoundException e) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Could not read from ");
                sb.append(str);
                sb.append(": ");
                sb.append(e);
                Log.e(str2, sb.toString());
                return null;
            }
        } else {
            Log.d(TAG, "XMP parse: only jpeg file is supported");
            return null;
        }
    }

    private static int getXMPContentEnd(byte[] bArr) {
        int length = bArr.length - 1;
        while (length >= 1) {
            if (bArr[length] == 62 && bArr[length - 1] != 63) {
                return length + 1;
            }
            length--;
        }
        return bArr.length;
    }

    private static boolean hasXMPHeader(byte[] bArr) {
        if (bArr.length < 29) {
            return false;
        }
        try {
            byte[] bArr2 = new byte[29];
            System.arraycopy(bArr, 0, bArr2, 0, 29);
            return new String(bArr2, "UTF-8").equals(XMP_HEADER);
        } catch (UnsupportedEncodingException e) {
            return false;
        }
    }

    private static List<Section> insertXMPSection(List<Section> list, XMPMeta xMPMeta) {
        if (list != null) {
            int i = 1;
            if (list.size() > 1) {
                try {
                    SerializeOptions serializeOptions = new SerializeOptions();
                    serializeOptions.setUseCompactFormat(true);
                    serializeOptions.setOmitPacketWrapper(true);
                    byte[] serializeToBuffer = XMPMetaFactory.serializeToBuffer(xMPMeta, serializeOptions);
                    if (serializeToBuffer.length > MAX_XMP_BUFFER_SIZE) {
                        return null;
                    }
                    byte[] bArr = new byte[(serializeToBuffer.length + 29)];
                    System.arraycopy(XMP_HEADER.getBytes(), 0, bArr, 0, 29);
                    System.arraycopy(serializeToBuffer, 0, bArr, 29, serializeToBuffer.length);
                    Section section = new Section();
                    section.marker = 225;
                    section.length = bArr.length + 2;
                    section.data = bArr;
                    int i2 = 0;
                    while (i2 < list.size()) {
                        if (((Section) list.get(i2)).marker != 225 || !hasXMPHeader(((Section) list.get(i2)).data)) {
                            i2++;
                        } else {
                            list.set(i2, section);
                            return list;
                        }
                    }
                    ArrayList arrayList = new ArrayList();
                    if (((Section) list.get(0)).marker != 225) {
                        i = 0;
                    }
                    arrayList.addAll(list.subList(0, i));
                    arrayList.add(section);
                    arrayList.addAll(list.subList(i, list.size()));
                    return arrayList;
                } catch (XMPException e) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Serialize xmp failed: ");
                    sb.append(e);
                    Log.d(str, sb.toString());
                    return null;
                }
            }
        }
        return null;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:29:0x0042, code lost:
        if (r9 != false) goto L_0x0061;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:?, code lost:
        r9 = new com.android.camera.XmpHelper.Section(null);
        r9.marker = r3;
        r9.length = -1;
        r9.data = new byte[r8.available()];
        r8.read(r9.data, 0, r9.data.length);
        r1.add(r9);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:0x0061, code lost:
        if (r8 == null) goto L_0x0068;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:34:?, code lost:
        r8.close();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static List<Section> parse(InputStream inputStream, boolean z) {
        ArrayList arrayList;
        int read;
        try {
            if (inputStream.read() == 255) {
                if (inputStream.read() == 216) {
                    arrayList = new ArrayList();
                    while (true) {
                        int read2 = inputStream.read();
                        if (read2 == -1) {
                            if (inputStream != null) {
                                try {
                                    inputStream.close();
                                } catch (IOException e) {
                                }
                            }
                            return arrayList;
                        } else if (read2 != 255) {
                            if (inputStream != null) {
                                try {
                                    inputStream.close();
                                } catch (IOException e2) {
                                }
                            }
                            return null;
                        } else {
                            while (true) {
                                read = inputStream.read();
                                if (read != 255) {
                                    break;
                                }
                            }
                            if (read == -1) {
                                if (inputStream != null) {
                                    try {
                                        inputStream.close();
                                    } catch (IOException e3) {
                                    }
                                }
                                return null;
                            } else if (read == 218) {
                                break;
                            } else {
                                int read3 = inputStream.read();
                                int read4 = inputStream.read();
                                if (read3 == -1) {
                                    break;
                                } else if (read4 == -1) {
                                    break;
                                } else {
                                    int i = (read3 << 8) | read4;
                                    if (z) {
                                        if (read != 225) {
                                            inputStream.skip((long) (i - 2));
                                        }
                                    }
                                    Section section = new Section();
                                    section.marker = read;
                                    section.length = i;
                                    int i2 = i - 2;
                                    section.data = new byte[i2];
                                    inputStream.read(section.data, 0, i2);
                                    arrayList.add(section);
                                }
                            }
                        }
                    }
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e4) {
                        }
                    }
                    return null;
                }
            }
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e5) {
                }
            }
            return null;
            return arrayList;
        } catch (IOException e6) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Could not parse file: ");
            sb.append(e6);
            Log.d(str, sb.toString());
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e7) {
                }
            }
            return null;
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e8) {
                }
            }
        }
    }

    private static void writeJpegFile(OutputStream outputStream, List<Section> list) throws IOException {
        outputStream.write(255);
        outputStream.write(216);
        for (Section section : list) {
            outputStream.write(255);
            outputStream.write(section.marker);
            if (section.length > 0) {
                int i = section.length & 255;
                outputStream.write(section.length >> 8);
                outputStream.write(i);
            }
            outputStream.write(section.data);
        }
    }

    public static boolean writeXMPMeta(InputStream inputStream, OutputStream outputStream, XMPMeta xMPMeta) {
        List insertXMPSection = insertXMPSection(parse(inputStream, false), xMPMeta);
        if (insertXMPSection == null) {
            return false;
        }
        try {
            writeJpegFile(outputStream, insertXMPSection);
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                }
            }
            return true;
        } catch (IOException e2) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Write to stream failed: ");
            sb.append(e2);
            Log.d(str, sb.toString());
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e3) {
                }
            }
            return false;
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e4) {
                }
            }
        }
    }

    public static boolean writeXMPMeta(String str, XMPMeta xMPMeta) {
        FileOutputStream fileOutputStream;
        if (str.toLowerCase().endsWith(Storage.JPEG_SUFFIX) || str.toLowerCase().endsWith(".jpeg")) {
            try {
                List insertXMPSection = insertXMPSection(parse(new FileInputStream(str), false), xMPMeta);
                if (insertXMPSection == null) {
                    return false;
                }
                try {
                    fileOutputStream = new FileOutputStream(str);
                    writeJpegFile(fileOutputStream, insertXMPSection);
                    fileOutputStream.close();
                    return true;
                } catch (IOException e) {
                    String str2 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed to write to ");
                    sb.append(str);
                    sb.append(": ");
                    sb.append(e);
                    Log.d(str2, sb.toString());
                    return false;
                } catch (Throwable th) {
                    r2.addSuppressed(th);
                }
            } catch (FileNotFoundException e2) {
                String str3 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Could not read from ");
                sb2.append(str);
                sb2.append(": ");
                sb2.append(e2);
                Log.e(str3, sb2.toString());
                return false;
            }
        } else {
            Log.d(TAG, "XMP parse: only jpeg file is supported");
            return false;
        }
        throw th;
    }
}
