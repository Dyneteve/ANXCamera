package com.google.zxing.datamatrix.encoder;

import java.util.Arrays;

public class DefaultPlacement {
    private final byte[] bits;
    private final CharSequence codewords;
    private final int numcols;
    private final int numrows;

    public DefaultPlacement(CharSequence codewords2, int numcols2, int numrows2) {
        this.codewords = codewords2;
        this.numcols = numcols2;
        this.numrows = numrows2;
        this.bits = new byte[(numcols2 * numrows2)];
        Arrays.fill(this.bits, -1);
    }

    /* access modifiers changed from: 0000 */
    public final int getNumrows() {
        return this.numrows;
    }

    /* access modifiers changed from: 0000 */
    public final int getNumcols() {
        return this.numcols;
    }

    /* access modifiers changed from: 0000 */
    public final byte[] getBits() {
        return this.bits;
    }

    public final boolean getBit(int col, int row) {
        return this.bits[(this.numcols * row) + col] == 1;
    }

    /* access modifiers changed from: 0000 */
    public final void setBit(int col, int row, boolean bit) {
        this.bits[(this.numcols * row) + col] = bit;
    }

    /* access modifiers changed from: 0000 */
    public final boolean hasBit(int col, int row) {
        return this.bits[(this.numcols * row) + col] >= 0;
    }

    public final void place() {
        int pos = 0;
        int row = 4;
        int col = 0;
        while (true) {
            if (row == this.numrows && col == 0) {
                int pos2 = pos + 1;
                corner1(pos);
                pos = pos2;
            }
            if (row == this.numrows - 2 && col == 0 && this.numcols % 4 != 0) {
                int pos3 = pos + 1;
                corner2(pos);
                pos = pos3;
            }
            if (row == this.numrows - 2 && col == 0 && this.numcols % 8 == 4) {
                int pos4 = pos + 1;
                corner3(pos);
                pos = pos4;
            }
            if (row == this.numrows + 4 && col == 2 && this.numcols % 8 == 0) {
                int pos5 = pos + 1;
                corner4(pos);
                pos = pos5;
            }
            do {
                if (row < this.numrows && col >= 0 && !hasBit(col, row)) {
                    int pos6 = pos + 1;
                    utah(row, col, pos);
                    pos = pos6;
                }
                row -= 2;
                col += 2;
                if (row < 0) {
                    break;
                }
            } while (col < this.numcols);
            int row2 = row + 1;
            int col2 = col + 3;
            do {
                if (row2 >= 0 && col2 < this.numcols && !hasBit(col2, row2)) {
                    int pos7 = pos + 1;
                    utah(row2, col2, pos);
                    pos = pos7;
                }
                row2 += 2;
                col2 -= 2;
                if (row2 >= this.numrows) {
                    break;
                }
            } while (col2 >= 0);
            row = row2 + 3;
            col = col2 + 1;
            if (row >= this.numrows && col >= this.numcols) {
                break;
            }
        }
        if (!hasBit(this.numcols - 1, this.numrows - 1)) {
            setBit(this.numcols - 1, this.numrows - 1, true);
            setBit(this.numcols - 2, this.numrows - 2, true);
        }
    }

    private void module(int row, int col, int pos, int bit) {
        if (row < 0) {
            row += this.numrows;
            col += 4 - ((this.numrows + 4) % 8);
        }
        if (col < 0) {
            col += this.numcols;
            row += 4 - ((this.numcols + 4) % 8);
        }
        boolean z = true;
        if ((this.codewords.charAt(pos) & (1 << (8 - bit))) == 0) {
            z = false;
        }
        setBit(col, row, z);
    }

    private void utah(int row, int col, int pos) {
        module(row - 2, col - 2, pos, 1);
        module(row - 2, col - 1, pos, 2);
        module(row - 1, col - 2, pos, 3);
        module(row - 1, col - 1, pos, 4);
        module(row - 1, col, pos, 5);
        module(row, col - 2, pos, 6);
        module(row, col - 1, pos, 7);
        module(row, col, pos, 8);
    }

    private void corner1(int pos) {
        module(this.numrows - 1, 0, pos, 1);
        module(this.numrows - 1, 1, pos, 2);
        module(this.numrows - 1, 2, pos, 3);
        module(0, this.numcols - 2, pos, 4);
        module(0, this.numcols - 1, pos, 5);
        module(1, this.numcols - 1, pos, 6);
        module(2, this.numcols - 1, pos, 7);
        module(3, this.numcols - 1, pos, 8);
    }

    private void corner2(int pos) {
        module(this.numrows - 3, 0, pos, 1);
        module(this.numrows - 2, 0, pos, 2);
        module(this.numrows - 1, 0, pos, 3);
        module(0, this.numcols - 4, pos, 4);
        module(0, this.numcols - 3, pos, 5);
        module(0, this.numcols - 2, pos, 6);
        module(0, this.numcols - 1, pos, 7);
        module(1, this.numcols - 1, pos, 8);
    }

    private void corner3(int pos) {
        module(this.numrows - 3, 0, pos, 1);
        module(this.numrows - 2, 0, pos, 2);
        module(this.numrows - 1, 0, pos, 3);
        module(0, this.numcols - 2, pos, 4);
        module(0, this.numcols - 1, pos, 5);
        module(1, this.numcols - 1, pos, 6);
        module(2, this.numcols - 1, pos, 7);
        module(3, this.numcols - 1, pos, 8);
    }

    private void corner4(int pos) {
        module(this.numrows - 1, 0, pos, 1);
        module(this.numrows - 1, this.numcols - 1, pos, 2);
        module(0, this.numcols - 3, pos, 3);
        module(0, this.numcols - 2, pos, 4);
        module(0, this.numcols - 1, pos, 5);
        module(1, this.numcols - 3, pos, 6);
        module(1, this.numcols - 2, pos, 7);
        module(1, this.numcols - 1, pos, 8);
    }
}
