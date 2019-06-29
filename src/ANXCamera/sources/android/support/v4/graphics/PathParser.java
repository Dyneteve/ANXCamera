package android.support.v4.graphics;

import android.graphics.Path;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.util.Log;
import java.util.ArrayList;

@RestrictTo({Scope.LIBRARY_GROUP})
public class PathParser {
    private static final String LOGTAG = "PathParser";

    private static class ExtractFloatResult {
        int mEndPosition;
        boolean mEndWithNegOrDot;

        ExtractFloatResult() {
        }
    }

    public static class PathDataNode {
        @RestrictTo({Scope.LIBRARY_GROUP})
        public float[] mParams;
        @RestrictTo({Scope.LIBRARY_GROUP})
        public char mType;

        PathDataNode(char c, float[] fArr) {
            this.mType = c;
            this.mParams = fArr;
        }

        PathDataNode(PathDataNode pathDataNode) {
            this.mType = pathDataNode.mType;
            this.mParams = PathParser.copyOfRange(pathDataNode.mParams, 0, pathDataNode.mParams.length);
        }

        /* JADX WARNING: Code restructure failed: missing block: B:11:0x004d, code lost:
            if (r9 >= r13.length) goto L_0x0301;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:12:0x004f, code lost:
            r1 = 0.0f;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:13:0x005c, code lost:
            switch(r30) {
                case 65: goto L_0x02bd;
                case 67: goto L_0x0292;
                case 72: goto L_0x0284;
                case 76: goto L_0x0271;
                case 77: goto L_0x024c;
                case 81: goto L_0x022a;
                case 83: goto L_0x01ec;
                case 84: goto L_0x01c0;
                case 86: goto L_0x01b2;
                case 97: goto L_0x0164;
                case 99: goto L_0x0137;
                case 104: goto L_0x012b;
                case 108: goto L_0x0118;
                case 109: goto L_0x00f3;
                case 113: goto L_0x00d3;
                case 115: goto L_0x0098;
                case 116: goto L_0x0070;
                case 118: goto L_0x0065;
                default: goto L_0x005f;
            };
         */
        /* JADX WARNING: Code restructure failed: missing block: B:14:0x005f, code lost:
            r12 = r7;
            r11 = r8;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:15:0x0061, code lost:
            r26 = r9;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:16:0x0065, code lost:
            r0 = r9 + 0;
            r10.rLineTo(0.0f, r13[r0]);
            r7 = r7 + r13[r0];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:17:0x0072, code lost:
            if (r0 == 'q') goto L_0x007d;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:18:0x0074, code lost:
            if (r0 == 't') goto L_0x007d;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:19:0x0076, code lost:
            if (r0 == 'Q') goto L_0x007d;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:20:0x0078, code lost:
            if (r0 != 'T') goto L_0x007b;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:21:0x007b, code lost:
            r0 = 0;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:22:0x007d, code lost:
            r1 = r8 - r2;
            r0 = r7 - r3;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:23:0x0081, code lost:
            r2 = r9 + 0;
            r4 = r9 + 1;
            r10.rQuadTo(r1, r0, r13[r2], r13[r4]);
            r1 = r1 + r8;
            r0 = r0 + r7;
            r8 = r8 + r13[r2];
            r7 = r7 + r13[r4];
            r3 = r0;
            r2 = r1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:24:0x009a, code lost:
            if (r0 == 'c') goto L_0x00ab;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:26:0x009e, code lost:
            if (r0 == 's') goto L_0x00ab;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:28:0x00a2, code lost:
            if (r0 == 'C') goto L_0x00ab;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:2:0x001d, code lost:
            r20 = 2;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:30:0x00a6, code lost:
            if (r0 != 'S') goto L_0x00a9;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:31:0x00a9, code lost:
            r2 = 0.0f;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:32:0x00ab, code lost:
            r0 = r8 - r2;
            r2 = r7 - r3;
            r1 = r0;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:33:0x00b1, code lost:
            r14 = r9 + 0;
            r15 = r9 + 1;
            r23 = r9 + 2;
            r24 = r9 + 3;
            r10.rCubicTo(r1, r2, r13[r14], r13[r15], r13[r23], r13[r24]);
            r0 = r13[r14] + r8;
            r1 = r13[r15] + r7;
            r8 = r8 + r13[r23];
            r7 = r7 + r13[r24];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:34:0x00d3, code lost:
            r0 = r9 + 0;
            r2 = r9 + 1;
            r4 = r9 + 2;
            r6 = r9 + 3;
            r10.rQuadTo(r13[r0], r13[r2], r13[r4], r13[r6]);
            r0 = r13[r0] + r8;
            r1 = r13[r2] + r7;
            r8 = r8 + r13[r4];
            r7 = r7 + r13[r6];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:35:0x00f3, code lost:
            r0 = r9 + 0;
            r8 = r8 + r13[r0];
            r1 = r9 + 1;
            r7 = r7 + r13[r1];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:36:0x00fd, code lost:
            if (r9 <= 0) goto L_0x0108;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:37:0x00ff, code lost:
            r10.rLineTo(r13[r0], r13[r1]);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:38:0x0108, code lost:
            r10.rMoveTo(r13[r0], r13[r1]);
            r22 = r7;
            r21 = r8;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:39:0x0118, code lost:
            r0 = r9 + 0;
            r4 = r9 + 1;
            r10.rLineTo(r13[r0], r13[r4]);
            r8 = r8 + r13[r0];
            r7 = r7 + r13[r4];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:40:0x012b, code lost:
            r0 = r9 + 0;
            r10.rLineTo(r13[r0], 0.0f);
            r8 = r8 + r13[r0];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:41:0x0137, code lost:
            r14 = r9 + 2;
            r15 = r9 + 3;
            r23 = r9 + 4;
            r24 = r9 + 5;
            r10.rCubicTo(r13[r9 + 0], r13[r9 + 1], r13[r14], r13[r15], r13[r23], r13[r24]);
            r0 = r13[r14] + r8;
            r1 = r13[r15] + r7;
            r8 = r8 + r13[r23];
            r7 = r7 + r13[r24];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:42:0x0160, code lost:
            r2 = r0;
            r3 = r1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:43:0x0164, code lost:
            r14 = r9 + 5;
            r3 = r13[r14] + r8;
            r15 = r9 + 6;
            r4 = r13[r15] + r7;
            r5 = r13[r9 + 0];
            r6 = r13[r9 + 1];
            r23 = r13[r9 + 2];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:44:0x0182, code lost:
            if (r13[r9 + 3] == 0.0f) goto L_0x0187;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:45:0x0184, code lost:
            r24 = true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:46:0x0187, code lost:
            r24 = false;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:48:0x018f, code lost:
            if (r13[r9 + 4] == 0.0f) goto L_0x0194;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:49:0x0191, code lost:
            r25 = true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:50:0x0194, code lost:
            r25 = false;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:51:0x0196, code lost:
            r12 = r7;
            r11 = r8;
            r26 = r9;
            drawArc(r10, r8, r7, r3, r4, r5, r6, r23, r24, r25);
            r8 = r11 + r13[r14];
            r7 = r12 + r13[r15];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:52:0x01b2, code lost:
            r26 = r9;
            r9 = r26 + 0;
            r10.lineTo(r8, r13[r9]);
            r7 = r13[r9];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:53:0x01c0, code lost:
            r12 = r7;
            r11 = r8;
            r26 = r9;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:54:0x01c5, code lost:
            if (r0 == 'q') goto L_0x01cd;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:55:0x01c7, code lost:
            if (r0 == 't') goto L_0x01cd;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:56:0x01c9, code lost:
            if (r0 == 'Q') goto L_0x01cd;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:57:0x01cb, code lost:
            if (r0 != 'T') goto L_0x01d6;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:58:0x01cd, code lost:
            r12 = (2.0f * r12) - r3;
            r11 = (2.0f * r11) - r2;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:59:0x01d6, code lost:
            r9 = r26 + 0;
            r1 = r26 + 1;
            r10.quadTo(r11, r12, r13[r9], r13[r1]);
            r8 = r13[r9];
            r7 = r13[r1];
            r2 = r11;
            r3 = r12;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:60:0x01ec, code lost:
            r12 = r7;
            r11 = r8;
            r26 = r9;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:61:0x01f1, code lost:
            if (r0 == 'c') goto L_0x0203;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:63:0x01f5, code lost:
            if (r0 == 's') goto L_0x0203;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:65:0x01f9, code lost:
            if (r0 == 'C') goto L_0x0203;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:67:0x01fd, code lost:
            if (r0 != 'S') goto L_0x0200;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:68:0x0200, code lost:
            r1 = r11;
            r2 = r12;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:69:0x0203, code lost:
            r1 = (2.0f * r11) - r2;
            r2 = (2.0f * r12) - r3;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:70:0x020d, code lost:
            r9 = r26 + 0;
            r7 = r26 + 1;
            r8 = r26 + 2;
            r11 = r26 + 3;
            r10.cubicTo(r1, r2, r13[r9], r13[r7], r13[r8], r13[r11]);
            r0 = r13[r9];
            r1 = r13[r7];
            r8 = r13[r8];
            r7 = r13[r11];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:71:0x022a, code lost:
            r26 = r9;
            r9 = r26 + 0;
            r1 = r26 + 1;
            r3 = r26 + 2;
            r5 = r26 + 3;
            r10.quadTo(r13[r9], r13[r1], r13[r3], r13[r5]);
            r0 = r13[r9];
            r1 = r13[r1];
            r8 = r13[r3];
            r7 = r13[r5];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:72:0x0248, code lost:
            r2 = r0;
            r3 = r1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:73:0x024c, code lost:
            r26 = r9;
            r9 = r26 + 0;
            r8 = r13[r9];
            r0 = r26 + 1;
            r7 = r13[r0];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:74:0x0256, code lost:
            if (r26 <= 0) goto L_0x0261;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:75:0x0258, code lost:
            r10.lineTo(r13[r9], r13[r0]);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:76:0x0261, code lost:
            r10.moveTo(r13[r9], r13[r0]);
            r22 = r7;
            r21 = r8;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:77:0x0271, code lost:
            r26 = r9;
            r9 = r26 + 0;
            r1 = r26 + 1;
            r10.lineTo(r13[r9], r13[r1]);
            r8 = r13[r9];
            r7 = r13[r1];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:78:0x0284, code lost:
            r26 = r9;
            r9 = r26 + 0;
            r10.lineTo(r13[r9], r7);
            r8 = r13[r9];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:79:0x0292, code lost:
            r26 = r9;
            r9 = r26 + 2;
            r7 = r26 + 3;
            r8 = r26 + 4;
            r11 = r26 + 5;
            r0 = r10;
            r0.cubicTo(r13[r26 + 0], r13[r26 + 1], r13[r9], r13[r7], r13[r8], r13[r11]);
            r8 = r13[r8];
            r0 = r13[r11];
            r1 = r13[r9];
            r2 = r13[r7];
            r7 = r0;
            r3 = r2;
            r2 = r1;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:80:0x02bd, code lost:
            r12 = r7;
            r11 = r8;
            r26 = r9;
            r14 = r26 + 5;
            r3 = r13[r14];
            r15 = r26 + 6;
            r4 = r13[r15];
            r5 = r13[r26 + 0];
            r6 = r13[r26 + 1];
            r7 = r13[r26 + 2];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:81:0x02db, code lost:
            if (r13[r26 + 3] == 0.0f) goto L_0x02df;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:82:0x02dd, code lost:
            r8 = true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:83:0x02df, code lost:
            r8 = false;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:85:0x02e6, code lost:
            if (r13[r26 + 4] == 0.0f) goto L_0x02ea;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:86:0x02e8, code lost:
            r9 = true;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:87:0x02ea, code lost:
            r9 = false;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:88:0x02eb, code lost:
            drawArc(r10, r11, r12, r3, r4, r5, r6, r7, r8, r9);
            r8 = r13[r14];
            r7 = r13[r15];
         */
        /* JADX WARNING: Code restructure failed: missing block: B:89:0x02f7, code lost:
            r3 = r7;
            r2 = r8;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:8:0x0041, code lost:
            r20 = r6;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:90:0x02f9, code lost:
            r9 = r26 + r20;
            r0 = r30;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:91:0x0301, code lost:
            r12 = r7;
            r11 = r8;
            r28[0] = r8;
            r28[1] = r12;
            r28[2] = r2;
            r28[3] = r3;
            r28[4] = r21;
            r28[5] = r22;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:92:0x0311, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:9:0x0043, code lost:
            r8 = r0;
            r7 = r1;
            r21 = r4;
            r22 = r5;
            r9 = 0;
            r0 = r29;
         */
        private static void addCommand(Path path, float[] fArr, char c, char c2, float[] fArr2) {
            int i;
            int i2;
            Path path2 = path;
            float[] fArr3 = fArr2;
            float f = fArr[0];
            float f2 = fArr[1];
            float f3 = fArr[2];
            float f4 = fArr[3];
            float f5 = fArr[4];
            float f6 = fArr[5];
            switch (c2) {
                case 'A':
                case 'a':
                    i2 = 7;
                    break;
                case 'C':
                case 'c':
                    i2 = 6;
                    break;
                case 'H':
                case 'V':
                case 'h':
                case 'v':
                    i = 1;
                    break;
                case 'Q':
                case 'S':
                case 'q':
                case 's':
                    i = 4;
                    break;
                case 'Z':
                case 'z':
                    path.close();
                    path2.moveTo(f5, f6);
                    f = f5;
                    f3 = f;
                    f2 = f6;
                    f4 = f2;
                    break;
            }
        }

        private static void arcToBezier(Path path, double d, double d2, double d3, double d4, double d5, double d6, double d7, double d8, double d9) {
            double d10 = d3;
            int ceil = (int) Math.ceil(Math.abs((d9 * 4.0d) / 3.141592653589793d));
            double cos = Math.cos(d7);
            double sin = Math.sin(d7);
            double cos2 = Math.cos(d8);
            double sin2 = Math.sin(d8);
            double d11 = -d10;
            double d12 = d11 * cos;
            double d13 = d4 * sin;
            double d14 = d11 * sin;
            double d15 = d4 * cos;
            double d16 = (sin2 * d14) + (cos2 * d15);
            double d17 = d9 / ((double) ceil);
            int i = 0;
            double d18 = d6;
            double d19 = d16;
            double d20 = (d12 * sin2) - (d13 * cos2);
            double d21 = d5;
            double d22 = d8;
            while (i < ceil) {
                double d23 = d14;
                double d24 = d22 + d17;
                double sin3 = Math.sin(d24);
                double cos3 = Math.cos(d24);
                double d25 = d17;
                double d26 = (d + ((d10 * cos) * cos3)) - (d13 * sin3);
                double d27 = d2 + (d10 * sin * cos3) + (d15 * sin3);
                double d28 = (d12 * sin3) - (d13 * cos3);
                double d29 = (sin3 * d23) + (cos3 * d15);
                double d30 = d24 - d22;
                double d31 = d15;
                double tan = Math.tan(d30 / 2.0d);
                double d32 = d24;
                double sin4 = (Math.sin(d30) * (Math.sqrt(4.0d + ((3.0d * tan) * tan)) - 1.0d)) / 3.0d;
                double d33 = d21 + (d20 * sin4);
                double d34 = d18 + (d19 * sin4);
                int i2 = ceil;
                double d35 = cos;
                double d36 = d26 - (sin4 * d28);
                double d37 = d27 - (sin4 * d29);
                double d38 = sin;
                Path path2 = path;
                path2.rLineTo(0.0f, 0.0f);
                path2.cubicTo((float) d33, (float) d34, (float) d36, (float) d37, (float) d26, (float) d27);
                i++;
                d18 = d27;
                d21 = d26;
                d14 = d23;
                d19 = d29;
                d20 = d28;
                d17 = d25;
                d15 = d31;
                d22 = d32;
                ceil = i2;
                cos = d35;
                sin = d38;
                d10 = d3;
            }
        }

        private static void drawArc(Path path, float f, float f2, float f3, float f4, float f5, float f6, float f7, boolean z, boolean z2) {
            double d;
            double d2;
            float f8 = f;
            float f9 = f3;
            float f10 = f5;
            float f11 = f6;
            boolean z3 = z2;
            double radians = Math.toRadians((double) f7);
            double cos = Math.cos(radians);
            double sin = Math.sin(radians);
            double d3 = (double) f8;
            double d4 = radians;
            double d5 = (double) f2;
            double d6 = d3;
            double d7 = (double) f10;
            double d8 = ((d3 * cos) + (d5 * sin)) / d7;
            double d9 = d5;
            double d10 = (double) f11;
            double d11 = ((((double) (-f8)) * sin) + (d5 * cos)) / d10;
            double d12 = (double) f4;
            double d13 = ((((double) f9) * cos) + (d12 * sin)) / d7;
            double d14 = d7;
            double d15 = ((((double) (-f9)) * sin) + (d12 * cos)) / d10;
            double d16 = d8 - d13;
            double d17 = d11 - d15;
            double d18 = (d8 + d13) / 2.0d;
            double d19 = (d11 + d15) / 2.0d;
            double d20 = sin;
            double d21 = (d16 * d16) + (d17 * d17);
            if (d21 == 0.0d) {
                Log.w(PathParser.LOGTAG, " Points are coincident");
                return;
            }
            double d22 = cos;
            double d23 = (1.0d / d21) - 0.25d;
            if (d23 < 0.0d) {
                String str = PathParser.LOGTAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Points are too far apart ");
                sb.append(d21);
                Log.w(str, sb.toString());
                float sqrt = (float) (Math.sqrt(d21) / 1.99999d);
                drawArc(path, f, f2, f9, f4, f10 * sqrt, f11 * sqrt, f7, z, z2);
                return;
            }
            boolean z4 = z2;
            double sqrt2 = Math.sqrt(d23);
            double d24 = d16 * sqrt2;
            double d25 = sqrt2 * d17;
            if (z == z4) {
                d2 = d18 - d25;
                d = d19 + d24;
            } else {
                d2 = d18 + d25;
                d = d19 - d24;
            }
            double atan2 = Math.atan2(d11 - d, d8 - d2);
            double atan22 = Math.atan2(d15 - d, d13 - d2) - atan2;
            int i = (atan22 > 0.0d ? 1 : (atan22 == 0.0d ? 0 : -1));
            if (z4 != (i >= 0)) {
                atan22 = i > 0 ? atan22 - 6.283185307179586d : atan22 + 6.283185307179586d;
            }
            double d26 = d2 * d14;
            double d27 = d * d10;
            arcToBezier(path, (d26 * d22) - (d27 * d20), (d26 * d20) + (d27 * d22), d14, d10, d6, d9, d4, atan2, atan22);
        }

        public static void nodesToPath(PathDataNode[] pathDataNodeArr, Path path) {
            float[] fArr = new float[6];
            char c = 'm';
            for (int i = 0; i < pathDataNodeArr.length; i++) {
                addCommand(path, fArr, c, pathDataNodeArr[i].mType, pathDataNodeArr[i].mParams);
                c = pathDataNodeArr[i].mType;
            }
        }

        public void interpolatePathDataNode(PathDataNode pathDataNode, PathDataNode pathDataNode2, float f) {
            for (int i = 0; i < pathDataNode.mParams.length; i++) {
                this.mParams[i] = (pathDataNode.mParams[i] * (1.0f - f)) + (pathDataNode2.mParams[i] * f);
            }
        }
    }

    private PathParser() {
    }

    private static void addNode(ArrayList<PathDataNode> arrayList, char c, float[] fArr) {
        arrayList.add(new PathDataNode(c, fArr));
    }

    public static boolean canMorph(PathDataNode[] pathDataNodeArr, PathDataNode[] pathDataNodeArr2) {
        if (pathDataNodeArr == null || pathDataNodeArr2 == null || pathDataNodeArr.length != pathDataNodeArr2.length) {
            return false;
        }
        for (int i = 0; i < pathDataNodeArr.length; i++) {
            if (pathDataNodeArr[i].mType != pathDataNodeArr2[i].mType || pathDataNodeArr[i].mParams.length != pathDataNodeArr2[i].mParams.length) {
                return false;
            }
        }
        return true;
    }

    static float[] copyOfRange(float[] fArr, int i, int i2) {
        if (i <= i2) {
            int length = fArr.length;
            if (i < 0 || i > length) {
                throw new ArrayIndexOutOfBoundsException();
            }
            int i3 = i2 - i;
            int min = Math.min(i3, length - i);
            float[] fArr2 = new float[i3];
            System.arraycopy(fArr, i, fArr2, 0, min);
            return fArr2;
        }
        throw new IllegalArgumentException();
    }

    public static PathDataNode[] createNodesFromPathData(String str) {
        if (str == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        int i = 1;
        int i2 = 0;
        while (i < str.length()) {
            int nextStart = nextStart(str, i);
            String trim = str.substring(i2, nextStart).trim();
            if (trim.length() > 0) {
                addNode(arrayList, trim.charAt(0), getFloats(trim));
            }
            i2 = nextStart;
            i = nextStart + 1;
        }
        if (i - i2 == 1 && i2 < str.length()) {
            addNode(arrayList, str.charAt(i2), new float[0]);
        }
        return (PathDataNode[]) arrayList.toArray(new PathDataNode[arrayList.size()]);
    }

    public static Path createPathFromPathData(String str) {
        Path path = new Path();
        PathDataNode[] createNodesFromPathData = createNodesFromPathData(str);
        if (createNodesFromPathData == null) {
            return null;
        }
        try {
            PathDataNode.nodesToPath(createNodesFromPathData, path);
            return path;
        } catch (RuntimeException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("Error in parsing ");
            sb.append(str);
            throw new RuntimeException(sb.toString(), e);
        }
    }

    public static PathDataNode[] deepCopyNodes(PathDataNode[] pathDataNodeArr) {
        if (pathDataNodeArr == null) {
            return null;
        }
        PathDataNode[] pathDataNodeArr2 = new PathDataNode[pathDataNodeArr.length];
        for (int i = 0; i < pathDataNodeArr.length; i++) {
            pathDataNodeArr2[i] = new PathDataNode(pathDataNodeArr[i]);
        }
        return pathDataNodeArr2;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:16:0x003a, code lost:
        r2 = false;
     */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0046 A[LOOP:0: B:1:0x000b->B:20:0x0046, LOOP_END] */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x0049 A[SYNTHETIC] */
    private static void extract(String str, int i, ExtractFloatResult extractFloatResult) {
        extractFloatResult.mEndWithNegOrDot = false;
        int i2 = i;
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        while (i2 < str.length()) {
            char charAt = str.charAt(i2);
            if (charAt != ' ') {
                if (charAt == 'E' || charAt == 'e') {
                    z = true;
                    if (!z3) {
                        extractFloatResult.mEndPosition = i2;
                    }
                    i2++;
                } else {
                    switch (charAt) {
                        case ',':
                            break;
                        case '-':
                            if (i2 != i && !z) {
                                extractFloatResult.mEndWithNegOrDot = true;
                            }
                        case '.':
                            if (!z2) {
                                z = false;
                                z2 = true;
                                break;
                            } else {
                                extractFloatResult.mEndWithNegOrDot = true;
                            }
                    }
                }
            }
            z = false;
            z3 = true;
            if (!z3) {
            }
        }
        extractFloatResult.mEndPosition = i2;
    }

    private static float[] getFloats(String str) {
        if (str.charAt(0) == 'z' || str.charAt(0) == 'Z') {
            return new float[0];
        }
        try {
            float[] fArr = new float[str.length()];
            ExtractFloatResult extractFloatResult = new ExtractFloatResult();
            int length = str.length();
            int i = 1;
            int i2 = 0;
            while (i < length) {
                extract(str, i, extractFloatResult);
                int i3 = extractFloatResult.mEndPosition;
                if (i < i3) {
                    int i4 = i2 + 1;
                    fArr[i2] = Float.parseFloat(str.substring(i, i3));
                    i2 = i4;
                }
                i = extractFloatResult.mEndWithNegOrDot ? i3 : i3 + 1;
            }
            return copyOfRange(fArr, 0, i2);
        } catch (NumberFormatException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("error in parsing \"");
            sb.append(str);
            sb.append("\"");
            throw new RuntimeException(sb.toString(), e);
        }
    }

    private static int nextStart(String str, int i) {
        while (i < str.length()) {
            char charAt = str.charAt(i);
            if (((charAt - 'A') * (charAt - 'Z') <= 0 || (charAt - 'a') * (charAt - 'z') <= 0) && charAt != 'e' && charAt != 'E') {
                return i;
            }
            i++;
        }
        return i;
    }

    public static void updateNodes(PathDataNode[] pathDataNodeArr, PathDataNode[] pathDataNodeArr2) {
        for (int i = 0; i < pathDataNodeArr2.length; i++) {
            pathDataNodeArr[i].mType = pathDataNodeArr2[i].mType;
            for (int i2 = 0; i2 < pathDataNodeArr2[i].mParams.length; i2++) {
                pathDataNodeArr[i].mParams[i2] = pathDataNodeArr2[i].mParams[i2];
            }
        }
    }
}
