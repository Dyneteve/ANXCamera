package android.support.v4.media.subtitle;

import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.text.style.CharacterStyle;
import android.text.style.StyleSpan;
import android.text.style.UnderlineSpan;
import android.text.style.UpdateAppearance;
import android.util.Log;
import android.view.accessibility.CaptioningManager.CaptionStyle;
import java.util.ArrayList;
import java.util.Arrays;

class Cea608CCParser {
    private static final int AOF = 34;
    private static final int AON = 35;
    private static final int BS = 33;
    private static final int CR = 45;
    private static final boolean DEBUG = Log.isLoggable(TAG, 3);
    private static final int DER = 36;
    private static final int EDM = 44;
    private static final int ENM = 46;
    private static final int EOC = 47;
    private static final int FON = 40;
    private static final int INVALID = -1;
    public static final int MAX_COLS = 32;
    public static final int MAX_ROWS = 15;
    private static final int MODE_PAINT_ON = 1;
    private static final int MODE_POP_ON = 3;
    private static final int MODE_ROLL_UP = 2;
    private static final int MODE_TEXT = 4;
    private static final int MODE_UNKNOWN = 0;
    private static final int RCL = 32;
    private static final int RDC = 41;
    private static final int RTD = 43;
    private static final int RU2 = 37;
    private static final int RU3 = 38;
    private static final int RU4 = 39;
    private static final String TAG = "Cea608CCParser";
    private static final int TR = 42;
    private static final char TS = ' ';
    private CCMemory mDisplay = new CCMemory();
    private final DisplayListener mListener;
    private int mMode = 1;
    private CCMemory mNonDisplay = new CCMemory();
    private int mPrevCtrlCode = -1;
    private int mRollUpSize = 4;
    private CCMemory mTextMem = new CCMemory();

    private static class CCData {
        private static final String[] sCtrlCodeMap = {"RCL", "BS", "AOF", "AON", "DER", "RU2", "RU3", "RU4", "FON", "RDC", "TR", "RTD", "EDM", "CR", "ENM", "EOC"};
        private static final String[] sProtugueseCharMap = {"Ã", "ã", "Í", "Ì", "ì", "Ò", "ò", "Õ", "õ", "{", "}", "\\", "^", "_", "|", "~", "Ä", "ä", "Ö", "ö", "ß", "¥", "¤", "│", "Å", "å", "Ø", "ø", "┌", "┐", "└", "┘"};
        private static final String[] sSpanishCharMap = {"Á", "É", "Ó", "Ú", "Ü", "ü", "‘", "¡", "*", "'", "—", "©", "℠", "•", "“", "”", "À", "Â", "Ç", "È", "Ê", "Ë", "ë", "Î", "Ï", "ï", "Ô", "Ù", "ù", "Û", "«", "»"};
        private static final String[] sSpecialCharMap = {"®", "°", "½", "¿", "™", "¢", "£", "♪", "à", " ", "è", "â", "ê", "î", "ô", "û"};
        private final byte mData1;
        private final byte mData2;
        private final byte mType;

        CCData(byte b, byte b2, byte b3) {
            this.mType = b;
            this.mData1 = b2;
            this.mData2 = b3;
        }

        private String ctrlCodeToString(int i) {
            return sCtrlCodeMap[i - 32];
        }

        static CCData[] fromByteArray(byte[] bArr) {
            CCData[] cCDataArr = new CCData[(bArr.length / 3)];
            for (int i = 0; i < cCDataArr.length; i++) {
                int i2 = i * 3;
                cCDataArr[i] = new CCData(bArr[i2], bArr[i2 + 1], bArr[i2 + 2]);
            }
            return cCDataArr;
        }

        private char getBasicChar(byte b) {
            if (b == 42) {
                return 225;
            }
            if (b == 92) {
                return 233;
            }
            switch (b) {
                case 94:
                    return 237;
                case 95:
                    return 243;
                case 96:
                    return 250;
                default:
                    switch (b) {
                        case 123:
                            return 231;
                        case 124:
                            return 247;
                        case 125:
                            return 209;
                        case 126:
                            return 241;
                        case Byte.MAX_VALUE:
                            return 9608;
                        default:
                            return (char) b;
                    }
            }
        }

        private String getBasicChars() {
            if (this.mData1 < 32 || this.mData1 > Byte.MAX_VALUE) {
                return null;
            }
            StringBuilder sb = new StringBuilder(2);
            sb.append(getBasicChar(this.mData1));
            if (this.mData2 >= 32 && this.mData2 <= Byte.MAX_VALUE) {
                sb.append(getBasicChar(this.mData2));
            }
            return sb.toString();
        }

        private String getExtendedChar() {
            if ((this.mData1 == 18 || this.mData1 == 26) && this.mData2 >= 32 && this.mData2 <= 63) {
                return sSpanishCharMap[this.mData2 - 32];
            }
            if ((this.mData1 == 19 || this.mData1 == 27) && this.mData2 >= 32 && this.mData2 <= 63) {
                return sProtugueseCharMap[this.mData2 - 32];
            }
            return null;
        }

        private String getSpecialChar() {
            if ((this.mData1 == 17 || this.mData1 == 25) && this.mData2 >= 48 && this.mData2 <= 63) {
                return sSpecialCharMap[this.mData2 - 48];
            }
            return null;
        }

        private boolean isBasicChar() {
            return this.mData1 >= 32 && this.mData1 <= Byte.MAX_VALUE;
        }

        /* access modifiers changed from: private */
        public boolean isExtendedChar() {
            return (this.mData1 == 18 || this.mData1 == 26 || this.mData1 == 19 || this.mData1 == 27) && this.mData2 >= 32 && this.mData2 <= 63;
        }

        private boolean isSpecialChar() {
            return (this.mData1 == 17 || this.mData1 == 25) && this.mData2 >= 48 && this.mData2 <= 63;
        }

        /* access modifiers changed from: 0000 */
        public int getCtrlCode() {
            if ((this.mData1 == 20 || this.mData1 == 28) && this.mData2 >= 32 && this.mData2 <= 47) {
                return this.mData2;
            }
            return -1;
        }

        /* access modifiers changed from: 0000 */
        public String getDisplayText() {
            String basicChars = getBasicChars();
            if (basicChars != null) {
                return basicChars;
            }
            String specialChar = getSpecialChar();
            return specialChar == null ? getExtendedChar() : specialChar;
        }

        /* access modifiers changed from: 0000 */
        public StyleCode getMidRow() {
            if ((this.mData1 == 17 || this.mData1 == 25) && this.mData2 >= 32 && this.mData2 <= 47) {
                return StyleCode.fromByte(this.mData2);
            }
            return null;
        }

        /* access modifiers changed from: 0000 */
        public PAC getPAC() {
            if ((this.mData1 & 112) == 16 && (this.mData2 & 64) == 64 && ((this.mData1 & 7) != 0 || (this.mData2 & 32) == 0)) {
                return PAC.fromBytes(this.mData1, this.mData2);
            }
            return null;
        }

        /* access modifiers changed from: 0000 */
        public int getTabOffset() {
            if ((this.mData1 == 23 || this.mData1 == 31) && this.mData2 >= 33 && this.mData2 <= 35) {
                return this.mData2 & 3;
            }
            return 0;
        }

        /* access modifiers changed from: 0000 */
        public boolean isDisplayableChar() {
            return isBasicChar() || isSpecialChar() || isExtendedChar();
        }

        public String toString() {
            if (this.mData1 >= 16 || this.mData2 >= 16) {
                int ctrlCode = getCtrlCode();
                if (ctrlCode != -1) {
                    return String.format("[%d]%s", new Object[]{Byte.valueOf(this.mType), ctrlCodeToString(ctrlCode)});
                }
                int tabOffset = getTabOffset();
                if (tabOffset > 0) {
                    return String.format("[%d]Tab%d", new Object[]{Byte.valueOf(this.mType), Integer.valueOf(tabOffset)});
                }
                PAC pac = getPAC();
                if (pac != null) {
                    return String.format("[%d]PAC: %s", new Object[]{Byte.valueOf(this.mType), pac.toString()});
                }
                StyleCode midRow = getMidRow();
                if (midRow != null) {
                    return String.format("[%d]Mid-row: %s", new Object[]{Byte.valueOf(this.mType), midRow.toString()});
                } else if (isDisplayableChar()) {
                    return String.format("[%d]Displayable: %s (%02x %02x)", new Object[]{Byte.valueOf(this.mType), getDisplayText(), Byte.valueOf(this.mData1), Byte.valueOf(this.mData2)});
                } else {
                    return String.format("[%d]Invalid: %02x %02x", new Object[]{Byte.valueOf(this.mType), Byte.valueOf(this.mData1), Byte.valueOf(this.mData2)});
                }
            } else {
                return String.format("[%d]Null: %02x %02x", new Object[]{Byte.valueOf(this.mType), Byte.valueOf(this.mData1), Byte.valueOf(this.mData2)});
            }
        }
    }

    private static class CCLineBuilder {
        private final StringBuilder mDisplayChars;
        private final StyleCode[] mMidRowStyles = new StyleCode[this.mDisplayChars.length()];
        private final StyleCode[] mPACStyles = new StyleCode[this.mDisplayChars.length()];

        CCLineBuilder(String str) {
            this.mDisplayChars = new StringBuilder(str);
        }

        /* access modifiers changed from: 0000 */
        public void applyStyleSpan(SpannableStringBuilder spannableStringBuilder, StyleCode styleCode, int i, int i2) {
            if (styleCode.isItalics()) {
                spannableStringBuilder.setSpan(new StyleSpan(2), i, i2, 33);
            }
            if (styleCode.isUnderline()) {
                spannableStringBuilder.setSpan(new UnderlineSpan(), i, i2, 33);
            }
        }

        /* access modifiers changed from: 0000 */
        public char charAt(int i) {
            return this.mDisplayChars.charAt(i);
        }

        /* access modifiers changed from: 0000 */
        public SpannableStringBuilder getStyledText(CaptionStyle captionStyle) {
            SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(this.mDisplayChars);
            int i = 0;
            StyleCode styleCode = null;
            int i2 = -1;
            int i3 = -1;
            while (i < this.mDisplayChars.length()) {
                StyleCode styleCode2 = this.mMidRowStyles[i] != null ? this.mMidRowStyles[i] : (this.mPACStyles[i] == null || (i2 >= 0 && i3 >= 0)) ? null : this.mPACStyles[i];
                if (styleCode2 != null) {
                    if (i2 >= 0 && i3 >= 0) {
                        applyStyleSpan(spannableStringBuilder, styleCode2, i2, i);
                    }
                    i2 = i;
                    styleCode = styleCode2;
                }
                if (this.mDisplayChars.charAt(i) != 160) {
                    if (i3 < 0) {
                        i3 = i;
                    }
                } else if (i3 >= 0) {
                    if (this.mDisplayChars.charAt(i3) != ' ') {
                        i3--;
                    }
                    int i4 = this.mDisplayChars.charAt(i + -1) == ' ' ? i : i + 1;
                    spannableStringBuilder.setSpan(new MutableBackgroundColorSpan(captionStyle.backgroundColor), i3, i4, 33);
                    if (i2 >= 0) {
                        applyStyleSpan(spannableStringBuilder, styleCode, i2, i4);
                    }
                    i3 = -1;
                }
                i++;
            }
            return spannableStringBuilder;
        }

        /* access modifiers changed from: 0000 */
        public int length() {
            return this.mDisplayChars.length();
        }

        /* access modifiers changed from: 0000 */
        public void setCharAt(int i, char c) {
            this.mDisplayChars.setCharAt(i, c);
            this.mMidRowStyles[i] = null;
        }

        /* access modifiers changed from: 0000 */
        public void setMidRowAt(int i, StyleCode styleCode) {
            this.mDisplayChars.setCharAt(i, ' ');
            this.mMidRowStyles[i] = styleCode;
        }

        /* access modifiers changed from: 0000 */
        public void setPACAt(int i, PAC pac) {
            this.mPACStyles[i] = pac;
        }
    }

    private static class CCMemory {
        private final String mBlankLine;
        private int mCol;
        private final CCLineBuilder[] mLines = new CCLineBuilder[17];
        private int mRow;

        CCMemory() {
            char[] cArr = new char[34];
            Arrays.fill(cArr, Cea608CCParser.TS);
            this.mBlankLine = new String(cArr);
        }

        private static int clamp(int i, int i2, int i3) {
            return i < i2 ? i2 : i > i3 ? i3 : i;
        }

        private CCLineBuilder getLineBuffer(int i) {
            if (this.mLines[i] == null) {
                this.mLines[i] = new CCLineBuilder(this.mBlankLine);
            }
            return this.mLines[i];
        }

        /* access modifiers changed from: private */
        public void moveBaselineTo(int i, int i2) {
            if (this.mRow != i) {
                int i3 = i < i2 ? i : i2;
                if (this.mRow < i3) {
                    i3 = this.mRow;
                }
                if (i < this.mRow) {
                    for (int i4 = i3 - 1; i4 >= 0; i4--) {
                        this.mLines[i - i4] = this.mLines[this.mRow - i4];
                    }
                } else {
                    for (int i5 = 0; i5 < i3; i5++) {
                        this.mLines[i - i5] = this.mLines[this.mRow - i5];
                    }
                }
                for (int i6 = 0; i6 <= i - i2; i6++) {
                    this.mLines[i6] = null;
                }
                while (true) {
                    i++;
                    if (i < this.mLines.length) {
                        this.mLines[i] = null;
                    } else {
                        return;
                    }
                }
            }
        }

        private void moveCursorByCol(int i) {
            this.mCol = clamp(this.mCol + i, 1, 32);
        }

        private void moveCursorTo(int i, int i2) {
            this.mRow = clamp(i, 1, 15);
            this.mCol = clamp(i2, 1, 32);
        }

        private void moveCursorToRow(int i) {
            this.mRow = clamp(i, 1, 15);
        }

        /* access modifiers changed from: 0000 */
        public void bs() {
            moveCursorByCol(-1);
            if (this.mLines[this.mRow] != null) {
                this.mLines[this.mRow].setCharAt(this.mCol, Cea608CCParser.TS);
                if (this.mCol == 31) {
                    this.mLines[this.mRow].setCharAt(32, Cea608CCParser.TS);
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void cr() {
            moveCursorTo(this.mRow + 1, 1);
        }

        /* access modifiers changed from: 0000 */
        public void der() {
            if (this.mLines[this.mRow] != null) {
                for (int i = 0; i < this.mCol; i++) {
                    if (this.mLines[this.mRow].charAt(i) != 160) {
                        for (int i2 = this.mCol; i2 < this.mLines[this.mRow].length(); i2++) {
                            this.mLines[i2].setCharAt(i2, Cea608CCParser.TS);
                        }
                        return;
                    }
                }
                this.mLines[this.mRow] = null;
            }
        }

        /* access modifiers changed from: 0000 */
        public void erase() {
            for (int i = 0; i < this.mLines.length; i++) {
                this.mLines[i] = null;
            }
            this.mRow = 15;
            this.mCol = 1;
        }

        /* access modifiers changed from: 0000 */
        public SpannableStringBuilder[] getStyledText(CaptionStyle captionStyle) {
            ArrayList arrayList = new ArrayList(15);
            for (int i = 1; i <= 15; i++) {
                arrayList.add(this.mLines[i] != null ? this.mLines[i].getStyledText(captionStyle) : null);
            }
            return (SpannableStringBuilder[]) arrayList.toArray(new SpannableStringBuilder[15]);
        }

        /* access modifiers changed from: 0000 */
        public void rollUp(int i) {
            for (int i2 = 0; i2 <= this.mRow - i; i2++) {
                this.mLines[i2] = null;
            }
            int i3 = (this.mRow - i) + 1;
            if (i3 < 1) {
                i3 = 1;
            }
            while (i3 < this.mRow) {
                int i4 = i3 + 1;
                this.mLines[i3] = this.mLines[i4];
                i3 = i4;
            }
            for (int i5 = this.mRow; i5 < this.mLines.length; i5++) {
                this.mLines[i5] = null;
            }
            this.mCol = 1;
        }

        /* access modifiers changed from: 0000 */
        public void tab(int i) {
            moveCursorByCol(i);
        }

        /* access modifiers changed from: 0000 */
        public void writeMidRowCode(StyleCode styleCode) {
            getLineBuffer(this.mRow).setMidRowAt(this.mCol, styleCode);
            moveCursorByCol(1);
        }

        /* access modifiers changed from: 0000 */
        public void writePAC(PAC pac) {
            if (pac.isIndentPAC()) {
                moveCursorTo(pac.getRow(), pac.getCol());
            } else {
                moveCursorTo(pac.getRow(), 1);
            }
            getLineBuffer(this.mRow).setPACAt(this.mCol, pac);
        }

        /* access modifiers changed from: 0000 */
        public void writeText(String str) {
            for (int i = 0; i < str.length(); i++) {
                getLineBuffer(this.mRow).setCharAt(this.mCol, str.charAt(i));
                moveCursorByCol(1);
            }
        }
    }

    interface DisplayListener {
        CaptionStyle getCaptionStyle();

        void onDisplayChanged(SpannableStringBuilder[] spannableStringBuilderArr);
    }

    public static class MutableBackgroundColorSpan extends CharacterStyle implements UpdateAppearance {
        private int mColor;

        MutableBackgroundColorSpan(int i) {
            this.mColor = i;
        }

        public int getBackgroundColor() {
            return this.mColor;
        }

        public void setBackgroundColor(int i) {
            this.mColor = i;
        }

        public void updateDrawState(TextPaint textPaint) {
            textPaint.bgColor = this.mColor;
        }
    }

    private static class PAC extends StyleCode {
        final int mCol;
        final int mRow;

        PAC(int i, int i2, int i3, int i4) {
            super(i3, i4);
            this.mRow = i;
            this.mCol = i2;
        }

        static PAC fromBytes(byte b, byte b2) {
            int i = new int[]{11, 1, 3, 12, 14, 5, 7, 9}[b & 7] + ((b2 & 32) >> 5);
            int i2 = (b2 & 1) != 0 ? 2 : 0;
            if ((b2 & 16) != 0) {
                return new PAC(i, ((b2 >> 1) & 7) * 4, i2, 0);
            }
            int i3 = (b2 >> 1) & 7;
            if (i3 == 7) {
                i2 |= 1;
                i3 = 0;
            }
            return new PAC(i, -1, i2, i3);
        }

        /* access modifiers changed from: 0000 */
        public int getCol() {
            return this.mCol;
        }

        /* access modifiers changed from: 0000 */
        public int getRow() {
            return this.mRow;
        }

        /* access modifiers changed from: 0000 */
        public boolean isIndentPAC() {
            return this.mCol >= 0;
        }

        public String toString() {
            return String.format("{%d, %d}, %s", new Object[]{Integer.valueOf(this.mRow), Integer.valueOf(this.mCol), super.toString()});
        }
    }

    private static class StyleCode {
        static final int COLOR_BLUE = 2;
        static final int COLOR_CYAN = 3;
        static final int COLOR_GREEN = 1;
        static final int COLOR_INVALID = 7;
        static final int COLOR_MAGENTA = 6;
        static final int COLOR_RED = 4;
        static final int COLOR_WHITE = 0;
        static final int COLOR_YELLOW = 5;
        static final int STYLE_ITALICS = 1;
        static final int STYLE_UNDERLINE = 2;
        static final String[] sColorMap = {"WHITE", "GREEN", "BLUE", "CYAN", "RED", "YELLOW", "MAGENTA", "INVALID"};
        final int mColor;
        final int mStyle;

        StyleCode(int i, int i2) {
            this.mStyle = i;
            this.mColor = i2;
        }

        static StyleCode fromByte(byte b) {
            int i = (b >> 1) & 7;
            int i2 = (b & 1) != 0 ? 2 : 0;
            if (i == 7) {
                i2 |= 1;
                i = 0;
            }
            return new StyleCode(i2, i);
        }

        /* access modifiers changed from: 0000 */
        public int getColor() {
            return this.mColor;
        }

        /* access modifiers changed from: 0000 */
        public boolean isItalics() {
            return (this.mStyle & 1) != 0;
        }

        /* access modifiers changed from: 0000 */
        public boolean isUnderline() {
            return (this.mStyle & 2) != 0;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("{");
            sb.append(sColorMap[this.mColor]);
            if ((this.mStyle & 1) != 0) {
                sb.append(", ITALICS");
            }
            if ((this.mStyle & 2) != 0) {
                sb.append(", UNDERLINE");
            }
            sb.append("}");
            return sb.toString();
        }
    }

    Cea608CCParser(DisplayListener displayListener) {
        this.mListener = displayListener;
    }

    private CCMemory getMemory() {
        switch (this.mMode) {
            case 1:
            case 2:
                return this.mDisplay;
            case 3:
                return this.mNonDisplay;
            case 4:
                return this.mTextMem;
            default:
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("unrecoginized mode: ");
                sb.append(this.mMode);
                Log.w(str, sb.toString());
                return this.mDisplay;
        }
    }

    private boolean handleCtrlCode(CCData cCData) {
        int ctrlCode = cCData.getCtrlCode();
        if (this.mPrevCtrlCode == -1 || this.mPrevCtrlCode != ctrlCode) {
            switch (ctrlCode) {
                case 32:
                    this.mMode = 3;
                    break;
                case 33:
                    getMemory().bs();
                    break;
                case 36:
                    getMemory().der();
                    break;
                case 37:
                case 38:
                case 39:
                    this.mRollUpSize = ctrlCode - 35;
                    if (this.mMode != 2) {
                        this.mDisplay.erase();
                        this.mNonDisplay.erase();
                    }
                    this.mMode = 2;
                    break;
                case 40:
                    Log.i(TAG, "Flash On");
                    break;
                case 41:
                    this.mMode = 1;
                    break;
                case 42:
                    this.mMode = 4;
                    this.mTextMem.erase();
                    break;
                case 43:
                    this.mMode = 4;
                    break;
                case 44:
                    this.mDisplay.erase();
                    updateDisplay();
                    break;
                case 45:
                    if (this.mMode == 2) {
                        getMemory().rollUp(this.mRollUpSize);
                    } else {
                        getMemory().cr();
                    }
                    if (this.mMode == 2) {
                        updateDisplay();
                        break;
                    }
                    break;
                case 46:
                    this.mNonDisplay.erase();
                    break;
                case 47:
                    swapMemory();
                    this.mMode = 3;
                    updateDisplay();
                    break;
                default:
                    this.mPrevCtrlCode = -1;
                    return false;
            }
            this.mPrevCtrlCode = ctrlCode;
            return true;
        }
        this.mPrevCtrlCode = -1;
        return true;
    }

    private boolean handleDisplayableChars(CCData cCData) {
        if (!cCData.isDisplayableChar()) {
            return false;
        }
        if (cCData.isExtendedChar()) {
            getMemory().bs();
        }
        getMemory().writeText(cCData.getDisplayText());
        if (this.mMode == 1 || this.mMode == 2) {
            updateDisplay();
        }
        return true;
    }

    private boolean handleMidRowCode(CCData cCData) {
        StyleCode midRow = cCData.getMidRow();
        if (midRow == null) {
            return false;
        }
        getMemory().writeMidRowCode(midRow);
        return true;
    }

    private boolean handlePACCode(CCData cCData) {
        PAC pac = cCData.getPAC();
        if (pac == null) {
            return false;
        }
        if (this.mMode == 2) {
            getMemory().moveBaselineTo(pac.getRow(), this.mRollUpSize);
        }
        getMemory().writePAC(pac);
        return true;
    }

    private boolean handleTabOffsets(CCData cCData) {
        int tabOffset = cCData.getTabOffset();
        if (tabOffset <= 0) {
            return false;
        }
        getMemory().tab(tabOffset);
        return true;
    }

    private void swapMemory() {
        CCMemory cCMemory = this.mDisplay;
        this.mDisplay = this.mNonDisplay;
        this.mNonDisplay = cCMemory;
    }

    private void updateDisplay() {
        if (this.mListener != null) {
            this.mListener.onDisplayChanged(this.mDisplay.getStyledText(this.mListener.getCaptionStyle()));
        }
    }

    public void parse(byte[] bArr) {
        CCData[] fromByteArray = CCData.fromByteArray(bArr);
        for (int i = 0; i < fromByteArray.length; i++) {
            if (DEBUG) {
                Log.d(TAG, fromByteArray[i].toString());
            }
            if (!handleCtrlCode(fromByteArray[i]) && !handleTabOffsets(fromByteArray[i]) && !handlePACCode(fromByteArray[i]) && !handleMidRowCode(fromByteArray[i])) {
                handleDisplayableChars(fromByteArray[i]);
            }
        }
    }
}
