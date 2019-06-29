package android.support.v4.media.subtitle;

import android.graphics.Color;
import android.support.annotation.RequiresApi;
import android.util.Log;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

@RequiresApi(28)
class Cea708CCParser {
    public static final int CAPTION_EMIT_TYPE_BUFFER = 1;
    public static final int CAPTION_EMIT_TYPE_COMMAND_CLW = 4;
    public static final int CAPTION_EMIT_TYPE_COMMAND_CWX = 3;
    public static final int CAPTION_EMIT_TYPE_COMMAND_DFX = 16;
    public static final int CAPTION_EMIT_TYPE_COMMAND_DLC = 10;
    public static final int CAPTION_EMIT_TYPE_COMMAND_DLW = 8;
    public static final int CAPTION_EMIT_TYPE_COMMAND_DLY = 9;
    public static final int CAPTION_EMIT_TYPE_COMMAND_DSW = 5;
    public static final int CAPTION_EMIT_TYPE_COMMAND_HDW = 6;
    public static final int CAPTION_EMIT_TYPE_COMMAND_RST = 11;
    public static final int CAPTION_EMIT_TYPE_COMMAND_SPA = 12;
    public static final int CAPTION_EMIT_TYPE_COMMAND_SPC = 13;
    public static final int CAPTION_EMIT_TYPE_COMMAND_SPL = 14;
    public static final int CAPTION_EMIT_TYPE_COMMAND_SWA = 15;
    public static final int CAPTION_EMIT_TYPE_COMMAND_TGW = 7;
    public static final int CAPTION_EMIT_TYPE_CONTROL = 2;
    private static final boolean DEBUG = false;
    private static final String MUSIC_NOTE_CHAR = new String("♫".getBytes(StandardCharsets.UTF_8), StandardCharsets.UTF_8);
    private static final String TAG = "Cea708CCParser";
    private final StringBuilder mBuilder = new StringBuilder();
    private int mCommand = 0;
    private DisplayListener mListener = new DisplayListener() {
        public void emitEvent(CaptionEvent captionEvent) {
        }
    };

    public static class CaptionColor {
        private static final int[] COLOR_MAP = {0, 15, 240, 255};
        public static final int OPACITY_FLASH = 1;
        private static final int[] OPACITY_MAP = {255, 254, 128, 0};
        public static final int OPACITY_SOLID = 0;
        public static final int OPACITY_TRANSLUCENT = 2;
        public static final int OPACITY_TRANSPARENT = 3;
        public final int blue;
        public final int green;
        public final int opacity;
        public final int red;

        CaptionColor(int i, int i2, int i3, int i4) {
            this.opacity = i;
            this.red = i2;
            this.green = i3;
            this.blue = i4;
        }

        public int getArgbValue() {
            return Color.argb(OPACITY_MAP[this.opacity], COLOR_MAP[this.red], COLOR_MAP[this.green], COLOR_MAP[this.blue]);
        }
    }

    public static class CaptionEvent {
        public final Object obj;
        public final int type;

        CaptionEvent(int i, Object obj2) {
            this.type = i;
            this.obj = obj2;
        }
    }

    public static class CaptionPenAttr {
        public static final int OFFSET_NORMAL = 1;
        public static final int OFFSET_SUBSCRIPT = 0;
        public static final int OFFSET_SUPERSCRIPT = 2;
        public static final int PEN_SIZE_LARGE = 2;
        public static final int PEN_SIZE_SMALL = 0;
        public static final int PEN_SIZE_STANDARD = 1;
        public final int edgeType;
        public final int fontTag;
        public final boolean italic;
        public final int penOffset;
        public final int penSize;
        public final int textTag;
        public final boolean underline;

        CaptionPenAttr(int i, int i2, int i3, int i4, int i5, boolean z, boolean z2) {
            this.penSize = i;
            this.penOffset = i2;
            this.textTag = i3;
            this.fontTag = i4;
            this.edgeType = i5;
            this.underline = z;
            this.italic = z2;
        }
    }

    public static class CaptionPenColor {
        public final CaptionColor backgroundColor;
        public final CaptionColor edgeColor;
        public final CaptionColor foregroundColor;

        CaptionPenColor(CaptionColor captionColor, CaptionColor captionColor2, CaptionColor captionColor3) {
            this.foregroundColor = captionColor;
            this.backgroundColor = captionColor2;
            this.edgeColor = captionColor3;
        }
    }

    public static class CaptionPenLocation {
        public final int column;
        public final int row;

        CaptionPenLocation(int i, int i2) {
            this.row = i;
            this.column = i2;
        }
    }

    public static class CaptionWindow {
        public final int anchorHorizontal;
        public final int anchorId;
        public final int anchorVertical;
        public final int columnCount;
        public final boolean columnLock;
        public final int id;
        public final int penStyle;
        public final int priority;
        public final boolean relativePositioning;
        public final int rowCount;
        public final boolean rowLock;
        public final boolean visible;
        public final int windowStyle;

        CaptionWindow(int i, boolean z, boolean z2, boolean z3, int i2, boolean z4, int i3, int i4, int i5, int i6, int i7, int i8, int i9) {
            this.id = i;
            this.visible = z;
            this.rowLock = z2;
            this.columnLock = z3;
            this.priority = i2;
            this.relativePositioning = z4;
            this.anchorVertical = i3;
            this.anchorHorizontal = i4;
            this.anchorId = i5;
            this.rowCount = i6;
            this.columnCount = i7;
            this.penStyle = i8;
            this.windowStyle = i9;
        }
    }

    public static class CaptionWindowAttr {
        public final CaptionColor borderColor;
        public final int borderType;
        public final int displayEffect;
        public final int effectDirection;
        public final int effectSpeed;
        public final CaptionColor fillColor;
        public final int justify;
        public final int printDirection;
        public final int scrollDirection;
        public final boolean wordWrap;

        CaptionWindowAttr(CaptionColor captionColor, CaptionColor captionColor2, int i, boolean z, int i2, int i3, int i4, int i5, int i6, int i7) {
            this.fillColor = captionColor;
            this.borderColor = captionColor2;
            this.borderType = i;
            this.wordWrap = z;
            this.printDirection = i2;
            this.scrollDirection = i3;
            this.justify = i4;
            this.effectDirection = i5;
            this.effectSpeed = i6;
            this.displayEffect = i7;
        }
    }

    private static class Const {
        public static final int CODE_C0_BS = 8;
        public static final int CODE_C0_CR = 13;
        public static final int CODE_C0_ETX = 3;
        public static final int CODE_C0_EXT1 = 16;
        public static final int CODE_C0_FF = 12;
        public static final int CODE_C0_HCR = 14;
        public static final int CODE_C0_NUL = 0;
        public static final int CODE_C0_P16 = 24;
        public static final int CODE_C0_RANGE_END = 31;
        public static final int CODE_C0_RANGE_START = 0;
        public static final int CODE_C0_SKIP1_RANGE_END = 23;
        public static final int CODE_C0_SKIP1_RANGE_START = 16;
        public static final int CODE_C0_SKIP2_RANGE_END = 31;
        public static final int CODE_C0_SKIP2_RANGE_START = 24;
        public static final int CODE_C1_CLW = 136;
        public static final int CODE_C1_CW0 = 128;
        public static final int CODE_C1_CW1 = 129;
        public static final int CODE_C1_CW2 = 130;
        public static final int CODE_C1_CW3 = 131;
        public static final int CODE_C1_CW4 = 132;
        public static final int CODE_C1_CW5 = 133;
        public static final int CODE_C1_CW6 = 134;
        public static final int CODE_C1_CW7 = 135;
        public static final int CODE_C1_DF0 = 152;
        public static final int CODE_C1_DF1 = 153;
        public static final int CODE_C1_DF2 = 154;
        public static final int CODE_C1_DF3 = 155;
        public static final int CODE_C1_DF4 = 156;
        public static final int CODE_C1_DF5 = 157;
        public static final int CODE_C1_DF6 = 158;
        public static final int CODE_C1_DF7 = 159;
        public static final int CODE_C1_DLC = 142;
        public static final int CODE_C1_DLW = 140;
        public static final int CODE_C1_DLY = 141;
        public static final int CODE_C1_DSW = 137;
        public static final int CODE_C1_HDW = 138;
        public static final int CODE_C1_RANGE_END = 159;
        public static final int CODE_C1_RANGE_START = 128;
        public static final int CODE_C1_RST = 143;
        public static final int CODE_C1_SPA = 144;
        public static final int CODE_C1_SPC = 145;
        public static final int CODE_C1_SPL = 146;
        public static final int CODE_C1_SWA = 151;
        public static final int CODE_C1_TGW = 139;
        public static final int CODE_C2_RANGE_END = 31;
        public static final int CODE_C2_RANGE_START = 0;
        public static final int CODE_C2_SKIP0_RANGE_END = 7;
        public static final int CODE_C2_SKIP0_RANGE_START = 0;
        public static final int CODE_C2_SKIP1_RANGE_END = 15;
        public static final int CODE_C2_SKIP1_RANGE_START = 8;
        public static final int CODE_C2_SKIP2_RANGE_END = 23;
        public static final int CODE_C2_SKIP2_RANGE_START = 16;
        public static final int CODE_C2_SKIP3_RANGE_END = 31;
        public static final int CODE_C2_SKIP3_RANGE_START = 24;
        public static final int CODE_C3_RANGE_END = 159;
        public static final int CODE_C3_RANGE_START = 128;
        public static final int CODE_C3_SKIP4_RANGE_END = 135;
        public static final int CODE_C3_SKIP4_RANGE_START = 128;
        public static final int CODE_C3_SKIP5_RANGE_END = 143;
        public static final int CODE_C3_SKIP5_RANGE_START = 136;
        public static final int CODE_G0_MUSICNOTE = 127;
        public static final int CODE_G0_RANGE_END = 127;
        public static final int CODE_G0_RANGE_START = 32;
        public static final int CODE_G1_RANGE_END = 255;
        public static final int CODE_G1_RANGE_START = 160;
        public static final int CODE_G2_BLK = 48;
        public static final int CODE_G2_NBTSP = 33;
        public static final int CODE_G2_RANGE_END = 127;
        public static final int CODE_G2_RANGE_START = 32;
        public static final int CODE_G2_TSP = 32;
        public static final int CODE_G3_CC = 160;
        public static final int CODE_G3_RANGE_END = 255;
        public static final int CODE_G3_RANGE_START = 160;

        private Const() {
        }
    }

    interface DisplayListener {
        void emitEvent(CaptionEvent captionEvent);
    }

    Cea708CCParser(DisplayListener displayListener) {
        if (displayListener != null) {
            this.mListener = displayListener;
        }
    }

    private void emitCaptionBuffer() {
        if (this.mBuilder.length() > 0) {
            this.mListener.emitEvent(new CaptionEvent(1, this.mBuilder.toString()));
            this.mBuilder.setLength(0);
        }
    }

    private void emitCaptionEvent(CaptionEvent captionEvent) {
        emitCaptionBuffer();
        this.mListener.emitEvent(captionEvent);
    }

    private int parseC0(byte[] bArr, int i) {
        if (this.mCommand >= 24 && this.mCommand <= 31) {
            if (this.mCommand == 24) {
                try {
                    if (bArr[i] == 0) {
                        this.mBuilder.append((char) bArr[i + 1]);
                    } else {
                        this.mBuilder.append(new String(Arrays.copyOfRange(bArr, i, i + 2), "EUC-KR"));
                    }
                } catch (UnsupportedEncodingException e) {
                    Log.e(TAG, "P16 Code - Could not find supported encoding", e);
                }
            }
            return i + 2;
        } else if (this.mCommand >= 16 && this.mCommand <= 23) {
            return i + 1;
        } else {
            int i2 = this.mCommand;
            if (i2 == 0) {
                return i;
            }
            if (i2 == 3) {
                emitCaptionEvent(new CaptionEvent(2, Character.valueOf((char) this.mCommand)));
                return i;
            } else if (i2 != 8) {
                switch (i2) {
                    case 12:
                        emitCaptionEvent(new CaptionEvent(2, Character.valueOf((char) this.mCommand)));
                        return i;
                    case 13:
                        this.mBuilder.append(10);
                        return i;
                    case 14:
                        emitCaptionEvent(new CaptionEvent(2, Character.valueOf((char) this.mCommand)));
                        return i;
                    default:
                        return i;
                }
            } else {
                emitCaptionEvent(new CaptionEvent(2, Character.valueOf((char) this.mCommand)));
                return i;
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:47:?, code lost:
        return r29;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:?, code lost:
        return r1;
     */
    private int parseC1(byte[] bArr, int i) {
        int i2;
        int i3 = this.mCommand;
        switch (i3) {
            case 128:
            case 129:
            case 130:
            case 131:
            case 132:
            case 133:
            case 134:
            case 135:
                emitCaptionEvent(new CaptionEvent(3, Integer.valueOf(this.mCommand - 128)));
                break;
            case 136:
                int i4 = i + 1;
                emitCaptionEvent(new CaptionEvent(4, Integer.valueOf(bArr[i] & 255)));
                return i4;
            case 137:
                int i5 = i + 1;
                emitCaptionEvent(new CaptionEvent(5, Integer.valueOf(bArr[i] & 255)));
                return i5;
            case 138:
                int i6 = i + 1;
                emitCaptionEvent(new CaptionEvent(6, Integer.valueOf(bArr[i] & 255)));
                return i6;
            case 139:
                int i7 = i + 1;
                emitCaptionEvent(new CaptionEvent(7, Integer.valueOf(bArr[i] & 255)));
                return i7;
            case 140:
                int i8 = i + 1;
                emitCaptionEvent(new CaptionEvent(8, Integer.valueOf(bArr[i] & 255)));
                return i8;
            case 141:
                int i9 = i + 1;
                emitCaptionEvent(new CaptionEvent(9, Integer.valueOf(bArr[i] & 255)));
                return i9;
            case 142:
                emitCaptionEvent(new CaptionEvent(10, null));
                break;
            case 143:
                emitCaptionEvent(new CaptionEvent(11, null));
                break;
            case 144:
                int i10 = i + 1;
                i2 = i + 2;
                CaptionPenAttr captionPenAttr = new CaptionPenAttr(bArr[i] & 3, (bArr[i] & 12) >> 2, (bArr[i] & 240) >> 4, bArr[i10] & 7, (bArr[i10] & 56) >> 3, (bArr[i10] & 64) != 0, (bArr[i10] & 128) != 0);
                emitCaptionEvent(new CaptionEvent(12, captionPenAttr));
                break;
            case 145:
                CaptionColor captionColor = new CaptionColor((bArr[i] & 192) >> 6, (bArr[i] & 48) >> 4, (bArr[i] & 12) >> 2, bArr[i] & 3);
                int i11 = i + 1;
                CaptionColor captionColor2 = new CaptionColor((bArr[i11] & 192) >> 6, (bArr[i11] & 48) >> 4, (bArr[i11] & 12) >> 2, bArr[i11] & 3);
                int i12 = i11 + 1;
                i2 = i12 + 1;
                emitCaptionEvent(new CaptionEvent(13, new CaptionPenColor(captionColor, captionColor2, new CaptionColor(0, (bArr[i12] & 48) >> 4, (bArr[i12] & 12) >> 2, bArr[i12] & 3))));
                break;
            case 146:
                int i13 = i + 2;
                emitCaptionEvent(new CaptionEvent(14, new CaptionPenLocation(bArr[i] & 15, bArr[i + 1] & 63)));
                return i13;
            default:
                switch (i3) {
                    case 151:
                        CaptionColor captionColor3 = new CaptionColor((bArr[i] & 192) >> 6, (bArr[i] & 48) >> 4, (bArr[i] & 12) >> 2, bArr[i] & 3);
                        int i14 = i + 1;
                        int i15 = i + 2;
                        int i16 = ((bArr[i14] & 192) >> 6) | ((bArr[i15] & 128) >> 5);
                        CaptionColor captionColor4 = new CaptionColor(0, (bArr[i14] & 48) >> 4, (bArr[i14] & 12) >> 2, bArr[i14] & 3);
                        int i17 = i + 3;
                        i2 = i + 4;
                        CaptionWindowAttr captionWindowAttr = new CaptionWindowAttr(captionColor3, captionColor4, i16, (bArr[i15] & 64) != 0, (bArr[i15] & 48) >> 4, (bArr[i15] & 12) >> 2, bArr[i15] & 3, (bArr[i17] & 12) >> 2, (bArr[i17] & 240) >> 4, bArr[i17] & 3);
                        emitCaptionEvent(new CaptionEvent(15, captionWindowAttr));
                        break;
                    case 152:
                    case 153:
                    case 154:
                    case 155:
                    case 156:
                    case 157:
                    case 158:
                    case 159:
                        int i18 = i + 1;
                        int i19 = i + 3;
                        int i20 = i + 5;
                        i2 = i + 6;
                        CaptionWindow captionWindow = new CaptionWindow(this.mCommand - 152, (bArr[i] & 32) != 0, (bArr[i] & 16) != 0, (bArr[i] & 8) != 0, bArr[i] & 7, (bArr[i18] & 128) != 0, bArr[i18] & Byte.MAX_VALUE, bArr[i + 2] & 255, (bArr[i19] & 240) >> 4, bArr[i19] & 15, bArr[i + 4] & 63, bArr[i20] & 7, (bArr[i20] & 56) >> 3);
                        emitCaptionEvent(new CaptionEvent(16, captionWindow));
                        break;
                }
        }
    }

    private int parseC2(byte[] bArr, int i) {
        return (this.mCommand < 0 || this.mCommand > 7) ? (this.mCommand < 8 || this.mCommand > 15) ? (this.mCommand < 16 || this.mCommand > 23) ? (this.mCommand < 24 || this.mCommand > 31) ? i : i + 3 : i + 2 : i + 1 : i;
    }

    private int parseC3(byte[] bArr, int i) {
        return (this.mCommand < 128 || this.mCommand > 135) ? (this.mCommand < 136 || this.mCommand > 143) ? i : i + 5 : i + 4;
    }

    private int parseExt1(byte[] bArr, int i) {
        this.mCommand = bArr[i] & 255;
        int i2 = i + 1;
        return (this.mCommand < 0 || this.mCommand > 31) ? (this.mCommand < 128 || this.mCommand > 159) ? (this.mCommand < 32 || this.mCommand > 127) ? (this.mCommand < 160 || this.mCommand > 255) ? i2 : parseG3(bArr, i2) : parseG2(bArr, i2) : parseC3(bArr, i2) : parseC2(bArr, i2);
    }

    private int parseG0(byte[] bArr, int i) {
        if (this.mCommand == 127) {
            this.mBuilder.append(MUSIC_NOTE_CHAR);
        } else {
            this.mBuilder.append((char) this.mCommand);
        }
        return i;
    }

    private int parseG1(byte[] bArr, int i) {
        this.mBuilder.append((char) this.mCommand);
        return i;
    }

    private int parseG2(byte[] bArr, int i) {
        int i2 = this.mCommand;
        if (i2 != 48) {
            switch (i2) {
            }
        }
        return i;
    }

    private int parseG3(byte[] bArr, int i) {
        int i2 = this.mCommand;
        return i;
    }

    private int parseServiceBlockData(byte[] bArr, int i) {
        this.mCommand = bArr[i] & 255;
        int i2 = i + 1;
        return this.mCommand == 16 ? parseExt1(bArr, i2) : (this.mCommand < 0 || this.mCommand > 31) ? (this.mCommand < 128 || this.mCommand > 159) ? (this.mCommand < 32 || this.mCommand > 127) ? (this.mCommand < 160 || this.mCommand > 255) ? i2 : parseG1(bArr, i2) : parseG0(bArr, i2) : parseC1(bArr, i2) : parseC0(bArr, i2);
    }

    public void parse(byte[] bArr) {
        int i = 0;
        while (i < bArr.length) {
            i = parseServiceBlockData(bArr, i);
        }
        emitCaptionBuffer();
    }
}
