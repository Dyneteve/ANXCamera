package com.android.camera2;

import android.graphics.Point;
import android.support.annotation.NonNull;
import android.util.Xml;
import com.adobe.xmp.XMPException;
import com.adobe.xmp.XMPMeta;
import com.android.camera.XmpHelper;
import com.android.camera.log.Log;
import com.android.gallery3d.exif.ExifInterface;
import com.xiaomi.camera.core.PictureInfo;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringWriter;
import org.xmlpull.v1.XmlSerializer;

public class ArcsoftDepthMap {
    private static final int BLUR_LEVEL_START_ADDR = 16;
    private static final int DAPTH_MAP_START_ADDR = 152;
    private static final int DATA_LENGTH_4 = 4;
    private static final int DATA_LENGTH_START_ADDR = 148;
    private static final int HEADER_LENGTH_START_ADDR = 4;
    private static final int HEADER_START_ADDR = 0;
    private static final int POINT_X_START_ADDR = 8;
    private static final int POINT_Y_START_ADDR = 12;
    private static final String TAG = ArcsoftDepthMap.class.getSimpleName();
    @Deprecated
    public static final int TAG_DEPTH_MAP_BLUR_LEVEL = ExifInterface.defineTag(2, -30575);
    @Deprecated
    public static final int TAG_DEPTH_MAP_FOCUS_POINT = ExifInterface.defineTag(2, -30576);
    private byte[] mDepthMapHeader;
    private byte[] mDepthMapOriginalData;

    private static /* synthetic */ void $closeResource(Throwable th, AutoCloseable autoCloseable) {
        if (th != null) {
            try {
                autoCloseable.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
        } else {
            autoCloseable.close();
        }
    }

    public ArcsoftDepthMap(byte[] bArr) {
        if (bArr != null) {
            int headerTag = getHeaderTag(bArr);
            if (headerTag == 128) {
                this.mDepthMapOriginalData = bArr;
                this.mDepthMapHeader = getDepthMapHeader();
                return;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Illegal depth format! 0x80 != ");
            sb.append(headerTag);
            throw new IllegalArgumentException(sb.toString());
        }
        throw new IllegalArgumentException("Null depth data!");
    }

    private static byte[] getBytes(byte[] bArr, int i, int i2) {
        if (i2 <= 0 || i < 0 || i2 > bArr.length - i) {
            StringBuilder sb = new StringBuilder();
            sb.append("WRONG ARGUMENT: from =");
            sb.append(i);
            sb.append(", length = ");
            sb.append(i2);
            throw new IllegalArgumentException(sb.toString());
        }
        byte[] bArr2 = new byte[i2];
        System.arraycopy(bArr, i, bArr2, 0, i2);
        return bArr2;
    }

    private static int getHeaderTag(byte[] bArr) {
        return getInteger(getBytes(bArr, 0, 4));
    }

    private static int getInteger(byte[] bArr) {
        if (bArr.length == 4) {
            int i = 0;
            for (int i2 = 0; i2 < 4; i2++) {
                i += (bArr[i2] & 255) << (i2 * 8);
            }
            return i;
        }
        throw new IllegalArgumentException("bytes can not covert to a integer value!");
    }

    public static boolean isDepthMapData(byte[] bArr) {
        boolean z = bArr != null && bArr.length > 4 && getHeaderTag(bArr) == 128;
        if (!z) {
            Log.e(TAG, "Illegal depthmap format");
        }
        return z;
    }

    public int getBlurLevel() {
        return getInteger(getBytes(this.mDepthMapHeader, 16, 4));
    }

    public byte[] getDepthMapData() {
        return getBytes(this.mDepthMapOriginalData, 152, getDepthMapLength());
    }

    public byte[] getDepthMapHeader() {
        return getBytes(this.mDepthMapOriginalData, 0, getInteger(getBytes(this.mDepthMapOriginalData, 4, 4)));
    }

    public int getDepthMapLength() {
        return getInteger(getBytes(this.mDepthMapHeader, 148, 4));
    }

    public Point getFocusPoint() {
        return new Point(getInteger(getBytes(this.mDepthMapHeader, 8, 4)), getInteger(getBytes(this.mDepthMapHeader, 12, 4)));
    }

    /* JADX WARNING: type inference failed for: r4v8, types: [byte[]] */
    /* JADX WARNING: type inference failed for: r4v9 */
    /* JADX WARNING: type inference failed for: r4v10 */
    /* JADX WARNING: type inference failed for: r4v11 */
    /* JADX WARNING: type inference failed for: r4v12 */
    /* JADX WARNING: type inference failed for: r3v2, types: [java.lang.Throwable] */
    /* JADX WARNING: type inference failed for: r3v3 */
    /* JADX WARNING: type inference failed for: r0v10 */
    /* JADX WARNING: type inference failed for: r4v13, types: [java.lang.Throwable] */
    /* JADX WARNING: type inference failed for: r18v0 */
    /* JADX WARNING: type inference failed for: r4v14 */
    /* JADX WARNING: type inference failed for: r3v4 */
    /* JADX WARNING: type inference failed for: r0v12, types: [java.lang.Throwable] */
    /* JADX WARNING: type inference failed for: r3v5 */
    /* JADX WARNING: type inference failed for: r3v6 */
    /* JADX WARNING: type inference failed for: r4v15 */
    /* JADX WARNING: type inference failed for: r3v7 */
    /* JADX WARNING: type inference failed for: r3v8 */
    /* JADX WARNING: type inference failed for: r0v16, types: [java.lang.Throwable] */
    /* JADX WARNING: type inference failed for: r3v9 */
    /* JADX WARNING: type inference failed for: r3v10 */
    /* JADX WARNING: type inference failed for: r3v11 */
    /* JADX WARNING: type inference failed for: r4v20, types: [byte[]] */
    /* JADX WARNING: type inference failed for: r3v12 */
    /* JADX WARNING: type inference failed for: r0v22, types: [java.lang.Throwable] */
    /* JADX WARNING: type inference failed for: r3v13 */
    /* JADX WARNING: type inference failed for: r3v14 */
    /* JADX WARNING: type inference failed for: r3v15 */
    /* JADX WARNING: type inference failed for: r4v37 */
    /* JADX WARNING: type inference failed for: r4v38 */
    /* JADX WARNING: type inference failed for: r4v39 */
    /* JADX WARNING: type inference failed for: r0v41 */
    /* JADX WARNING: type inference failed for: r3v16 */
    /* JADX WARNING: type inference failed for: r3v17 */
    /* JADX WARNING: type inference failed for: r3v18 */
    /* JADX WARNING: type inference failed for: r3v19 */
    /* JADX WARNING: type inference failed for: r3v20 */
    /* JADX WARNING: type inference failed for: r0v42 */
    /* JADX WARNING: type inference failed for: r3v21 */
    /* JADX WARNING: type inference failed for: r3v22 */
    /* JADX WARNING: type inference failed for: r3v23 */
    /* JADX WARNING: type inference failed for: r4v40 */
    /* JADX WARNING: type inference failed for: r4v41 */
    /* JADX WARNING: type inference failed for: r4v42 */
    /* JADX WARNING: type inference failed for: r4v43 */
    /* JADX WARNING: type inference failed for: r3v24 */
    /* JADX WARNING: type inference failed for: r0v43 */
    /* JADX WARNING: type inference failed for: r3v25 */
    /* JADX WARNING: type inference failed for: r3v26 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r4v9
  assigns: []
  uses: []
  mth insns count: 373
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Removed duplicated region for block: B:152:0x035b  */
    /* JADX WARNING: Removed duplicated region for block: B:82:0x02c8  */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x02d3  */
    /* JADX WARNING: Unknown variable types count: 22 */
    public byte[] writePortraitExif(int i, byte[] bArr, byte[] bArr2, @NonNull int[] iArr, byte[] bArr3, @NonNull int[] iArr2, byte[] bArr4, int[] iArr3, int i2, boolean z, boolean z2, PictureInfo pictureInfo, int i3, int i4) {
        byte[] bArr5;
        byte[] bArr6;
        String str;
        byte[] bArr7;
        ? r4;
        ? r42;
        ? r43;
        ? r44;
        ? r3;
        ? r32;
        ? r45;
        ? r33;
        Throwable th;
        ? r34;
        ? r35;
        ByteArrayOutputStream byteArrayOutputStream;
        Throwable th2;
        int i5;
        int i6 = i;
        byte[] bArr8 = bArr;
        byte[] bArr9 = bArr2;
        byte[] bArr10 = bArr3;
        byte[] bArr11 = bArr4;
        int[] iArr4 = iArr3;
        int i7 = i2;
        Point focusPoint = getFocusPoint();
        int blurLevel = getBlurLevel();
        boolean isFrontCamera = pictureInfo.isFrontCamera();
        int i8 = -1;
        int i9 = 10;
        if (i6 > 0) {
            if (isFrontCamera) {
                i5 = (!pictureInfo.isAiEnabled() || pictureInfo.getAiType() != 10) ? 40 : 70;
            } else {
                if (pictureInfo.isAiEnabled() && pictureInfo.getAiType() == 10) {
                    i5 = 30;
                }
                i8 = 5;
            }
            i9 = i5;
            i8 = 5;
        } else {
            i9 = -1;
        }
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("writePortraitExif: focusPoint: ");
        sb.append(focusPoint);
        Log.d(str2, sb.toString());
        String str3 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("writePortraitExif: blurLevel: ");
        sb2.append(blurLevel);
        Log.d(str3, sb2.toString());
        String str4 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("writePortraitExif: shineThreshold: ");
        sb3.append(i8);
        Log.d(str4, sb3.toString());
        String str5 = TAG;
        StringBuilder sb4 = new StringBuilder();
        sb4.append("writePortraitExif: shineLevel: ");
        sb4.append(i9);
        Log.d(str5, sb4.toString());
        String str6 = TAG;
        StringBuilder sb5 = new StringBuilder();
        sb5.append("writePortraitExif: lightingPattern: ");
        sb5.append(i7);
        Log.d(str6, sb5.toString());
        try {
            byteArrayOutputStream = new ByteArrayOutputStream();
            try {
                ExifInterface exifInterface = new ExifInterface();
                exifInterface.readExif(bArr8);
                exifInterface.addXiaomiDepthmapVersion(i6);
                exifInterface.addDepthMapBlurLevel(blurLevel);
                exifInterface.addPortraitLighting(i7);
                if (z2) {
                    exifInterface.addFrontMirror(z);
                }
                exifInterface.writeExif(bArr8, (OutputStream) byteArrayOutputStream);
                bArr5 = byteArrayOutputStream.toByteArray();
                try {
                    $closeResource(null, byteArrayOutputStream);
                } catch (IOException e) {
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (IOException e2) {
            bArr5 = null;
            Log.e(TAG, "writePortraitExif(): Failed to write depthmap associated exif metadata");
            if (bArr5 != null) {
            }
            byte[] bArr12 = bArr8;
            Log.e(TAG, "writePortraitExif(): #1: return original jpeg");
            return bArr12;
        }
        if (bArr5 != null || bArr5.length <= bArr8.length) {
            byte[] bArr122 = bArr8;
            Log.e(TAG, "writePortraitExif(): #1: return original jpeg");
            return bArr122;
        }
        try {
            XmlSerializer newSerializer = Xml.newSerializer();
            StringWriter stringWriter = new StringWriter();
            newSerializer.setOutput(stringWriter);
            bArr6 = bArr5;
            try {
                newSerializer.startDocument("UTF-8", Boolean.valueOf(true));
                newSerializer.startTag(null, "depthmap");
                newSerializer.attribute(null, "version", String.valueOf(i));
                StringBuilder sb6 = new StringBuilder();
                sb6.append(focusPoint.x);
                sb6.append(",");
                sb6.append(focusPoint.y);
                newSerializer.attribute(null, "focuspoint", sb6.toString());
                newSerializer.attribute(null, "blurlevel", String.valueOf(blurLevel));
                newSerializer.attribute(null, "shinethreshold", String.valueOf(i8));
                newSerializer.attribute(null, "shinelevel", String.valueOf(i9));
                newSerializer.attribute(null, "rawlength", String.valueOf(i3));
                newSerializer.attribute(null, "depthlength", String.valueOf(i4));
                newSerializer.endTag(null, "depthmap");
                if (bArr11 != null && bArr11.length > 0 && iArr4 != null && iArr4.length >= 4) {
                    newSerializer.startTag(null, "subimage");
                    newSerializer.attribute(null, "offset", String.valueOf(bArr11.length + (bArr9 != null ? bArr9.length : 0) + (bArr10 != null ? bArr10.length : 0) + i3 + i4));
                    newSerializer.attribute(null, "length", String.valueOf(bArr11.length));
                    newSerializer.attribute(null, "paddingx", String.valueOf(iArr4[0]));
                    newSerializer.attribute(null, "paddingy", String.valueOf(iArr4[1]));
                    newSerializer.attribute(null, "width", String.valueOf(iArr4[2]));
                    newSerializer.attribute(null, "height", String.valueOf(iArr4[3]));
                    newSerializer.endTag(null, "subimage");
                }
                if (bArr9 != null && bArr9.length > 0) {
                    newSerializer.startTag(null, "lenswatermark");
                    newSerializer.attribute(null, "offset", String.valueOf(bArr9.length + (bArr10 != null ? bArr10.length : 0) + i3 + i4));
                    newSerializer.attribute(null, "length", String.valueOf(bArr9.length));
                    newSerializer.attribute(null, "width", String.valueOf(iArr[0]));
                    newSerializer.attribute(null, "height", String.valueOf(iArr[1]));
                    newSerializer.attribute(null, "paddingx", String.valueOf(iArr[2]));
                    newSerializer.attribute(null, "paddingy", String.valueOf(iArr[3]));
                    newSerializer.endTag(null, "lenswatermark");
                }
                if (bArr10 != null && bArr10.length > 0) {
                    newSerializer.startTag(null, "timewatermark");
                    newSerializer.attribute(null, "offset", String.valueOf(bArr10.length + i3 + i4));
                    newSerializer.attribute(null, "length", String.valueOf(bArr10.length));
                    newSerializer.attribute(null, "width", String.valueOf(iArr2[0]));
                    newSerializer.attribute(null, "height", String.valueOf(iArr2[1]));
                    newSerializer.attribute(null, "paddingx", String.valueOf(iArr2[2]));
                    newSerializer.attribute(null, "paddingy", String.valueOf(iArr2[3]));
                    newSerializer.endTag(null, "timewatermark");
                }
                newSerializer.endDocument();
                str = stringWriter.toString();
            } catch (IOException e3) {
                Log.e(TAG, "writePortraitExif(): Failed to generate depthmap associated xmp metadata");
                str = null;
                if (str == null) {
                }
            }
        } catch (IOException e4) {
            bArr6 = bArr5;
            Log.e(TAG, "writePortraitExif(): Failed to generate depthmap associated xmp metadata");
            str = null;
            if (str == null) {
            }
        }
        if (str == null) {
            Log.e(TAG, "writePortraitExif(): #2: return original jpeg");
            return bArr;
        }
        byte[] bArr13 = bArr;
        try {
            bArr7 = bArr6;
            try {
                ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr7);
                try {
                    ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream();
                    try {
                        XMPMeta createXMPMeta = XmpHelper.createXMPMeta();
                        createXMPMeta.setProperty(XmpHelper.XIAOMI_XMP_METADATA_NAMESPACE, XmpHelper.XIAOMI_XMP_METADATA_PROPERTY_NAME, str);
                        XmpHelper.writeXMPMeta(byteArrayInputStream, byteArrayOutputStream2, createXMPMeta);
                        if (bArr11 != null) {
                            try {
                                if (bArr11.length > 0 && iArr4 != null && iArr4.length >= 4) {
                                    byteArrayOutputStream2.write(bArr11);
                                }
                            } catch (Throwable th4) {
                                th = th4;
                                th = null;
                                r34 = 0;
                                try {
                                    $closeResource(th, byteArrayOutputStream2);
                                    throw th;
                                } catch (Throwable th5) {
                                    th = th5;
                                    r33 = r34;
                                    r44 = r33;
                                    r3 = r33;
                                    r43 = r44;
                                    $closeResource(r3, byteArrayInputStream);
                                    throw th;
                                }
                            }
                        }
                        if (bArr9 != null) {
                            byteArrayOutputStream2.write(bArr9);
                        }
                        if (bArr10 != null) {
                            byteArrayOutputStream2.write(bArr10);
                        }
                        byteArrayOutputStream2.flush();
                        ? byteArray = byteArrayOutputStream2.toByteArray();
                        ? r36 = 0;
                        try {
                            $closeResource(null, byteArrayOutputStream2);
                            try {
                                r43 = byteArray;
                                $closeResource(null, byteArrayInputStream);
                                r43 = byteArray;
                                r4 = byteArray;
                            } catch (XMPException | IOException e5) {
                                r42 = r43;
                            }
                            if (r4 == 0 && r4.length > bArr7.length) {
                                return r4;
                            }
                            Log.e(TAG, "writePortraitExif(): #3: return original jpeg");
                            return bArr13;
                        } catch (Throwable th6) {
                            th = th6;
                            r44 = byteArray;
                            r3 = r36;
                            r43 = r44;
                            $closeResource(r3, byteArrayInputStream);
                            throw th;
                        }
                    } catch (Throwable th7) {
                        th = th7;
                        th = null;
                        r34 = 0;
                        $closeResource(th, byteArrayOutputStream2);
                        throw th;
                    }
                } catch (Throwable th8) {
                    th = th8;
                    r33 = 0;
                    r44 = r33;
                    r3 = r33;
                    r43 = r44;
                    $closeResource(r3, byteArrayInputStream);
                    throw th;
                }
            } catch (XMPException | IOException e6) {
                r42 = 0;
                Log.d(TAG, "writePortraitExif(): Failed to insert depthmap associated xmp metadata");
                r4 = r42;
                if (r4 == 0) {
                }
                Log.e(TAG, "writePortraitExif(): #3: return original jpeg");
                return bArr13;
            }
        } catch (XMPException | IOException e7) {
            bArr7 = bArr6;
            r42 = 0;
            Log.d(TAG, "writePortraitExif(): Failed to insert depthmap associated xmp metadata");
            r4 = r42;
            if (r4 == 0) {
            }
            Log.e(TAG, "writePortraitExif(): #3: return original jpeg");
            return bArr13;
        }
        $closeResource(th2, byteArrayOutputStream);
        throw th;
    }
}
