package com.google.zxing.aztec.encoder;

import com.google.zxing.common.BitArray;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;

public final class HighLevelEncoder {
    private static final int[][] CHAR_MAP = ((int[][]) Array.newInstance(int.class, new int[]{5, 256}));
    static final int[][] LATCH_TABLE;
    static final int MODE_DIGIT = 2;
    static final int MODE_LOWER = 1;
    static final int MODE_MIXED = 3;
    static final String[] MODE_NAMES = {"UPPER", "LOWER", "DIGIT", "MIXED", "PUNCT"};
    static final int MODE_PUNCT = 4;
    static final int MODE_UPPER = 0;
    static final int[][] SHIFT_TABLE = ((int[][]) Array.newInstance(int.class, new int[]{6, 6}));
    private final byte[] text;

    static {
        int[] iArr = new int[5];
        iArr[1] = 327708;
        iArr[2] = 327710;
        iArr[3] = 327709;
        iArr[4] = 656318;
        int[] iArr2 = new int[5];
        iArr2[0] = 590318;
        iArr2[2] = 327710;
        iArr2[3] = 327709;
        iArr2[4] = 656318;
        int[] iArr3 = new int[5];
        iArr3[0] = 262158;
        iArr3[1] = 590300;
        iArr3[3] = 590301;
        iArr3[4] = 932798;
        int[] iArr4 = new int[5];
        iArr4[0] = 327709;
        iArr4[1] = 327708;
        iArr4[2] = 656318;
        iArr4[4] = 327710;
        int[] iArr5 = new int[5];
        iArr5[0] = 327711;
        iArr5[1] = 656380;
        iArr5[2] = 656382;
        iArr5[3] = 656381;
        LATCH_TABLE = new int[][]{iArr, iArr2, iArr3, iArr4, iArr5};
        CHAR_MAP[0][32] = 1;
        for (int i = 65; i <= 90; i++) {
            CHAR_MAP[0][i] = (i - 65) + 2;
        }
        CHAR_MAP[1][32] = 1;
        for (int i2 = 97; i2 <= 122; i2++) {
            CHAR_MAP[1][i2] = (i2 - 97) + 2;
        }
        CHAR_MAP[2][32] = 1;
        for (int i3 = 48; i3 <= 57; i3++) {
            CHAR_MAP[2][i3] = (i3 - 48) + 2;
        }
        CHAR_MAP[2][44] = 12;
        CHAR_MAP[2][46] = 13;
        int[] iArr6 = new int[28];
        iArr6[1] = 32;
        iArr6[2] = 1;
        iArr6[3] = 2;
        iArr6[4] = 3;
        iArr6[5] = 4;
        iArr6[6] = 5;
        iArr6[7] = 6;
        iArr6[8] = 7;
        iArr6[9] = 8;
        iArr6[10] = 9;
        iArr6[11] = 10;
        iArr6[12] = 11;
        iArr6[13] = 12;
        iArr6[14] = 13;
        iArr6[15] = 27;
        iArr6[16] = 28;
        iArr6[17] = 29;
        iArr6[18] = 30;
        iArr6[19] = 31;
        iArr6[20] = 64;
        iArr6[21] = 92;
        iArr6[22] = 94;
        iArr6[23] = 95;
        iArr6[24] = 96;
        iArr6[25] = 124;
        iArr6[26] = 126;
        iArr6[27] = 127;
        int[] iArr7 = iArr6;
        for (int i4 = 0; i4 < iArr7.length; i4++) {
            CHAR_MAP[3][iArr7[i4]] = i4;
        }
        int[] iArr8 = new int[31];
        iArr8[1] = 13;
        iArr8[6] = 33;
        iArr8[7] = 39;
        iArr8[8] = 35;
        iArr8[9] = 36;
        iArr8[10] = 37;
        iArr8[11] = 38;
        iArr8[12] = 39;
        iArr8[13] = 40;
        iArr8[14] = 41;
        iArr8[15] = 42;
        iArr8[16] = 43;
        iArr8[17] = 44;
        iArr8[18] = 45;
        iArr8[19] = 46;
        iArr8[20] = 47;
        iArr8[21] = 58;
        iArr8[22] = 59;
        iArr8[23] = 60;
        iArr8[24] = 61;
        iArr8[25] = 62;
        iArr8[26] = 63;
        iArr8[27] = 91;
        iArr8[28] = 93;
        iArr8[29] = 123;
        iArr8[30] = 125;
        int[] iArr9 = iArr8;
        for (int i5 = 0; i5 < iArr9.length; i5++) {
            if (iArr9[i5] > 0) {
                CHAR_MAP[4][iArr9[i5]] = i5;
            }
        }
        for (int[] fill : SHIFT_TABLE) {
            Arrays.fill(fill, -1);
        }
        SHIFT_TABLE[0][4] = 0;
        SHIFT_TABLE[1][4] = 0;
        SHIFT_TABLE[1][0] = 28;
        SHIFT_TABLE[3][4] = 0;
        SHIFT_TABLE[2][4] = 0;
        SHIFT_TABLE[2][0] = 15;
    }

    public HighLevelEncoder(byte[] bArr) {
        this.text = bArr;
    }

    private static Collection<State> simplifyStates(Iterable<State> iterable) {
        LinkedList linkedList = new LinkedList();
        for (State state : iterable) {
            boolean z = true;
            Iterator it = linkedList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                State state2 = (State) it.next();
                if (state2.isBetterThanOrEqualTo(state)) {
                    z = false;
                    break;
                } else if (state.isBetterThanOrEqualTo(state2)) {
                    it.remove();
                }
            }
            if (z) {
                linkedList.add(state);
            }
        }
        return linkedList;
    }

    private void updateStateForChar(State state, int i, Collection<State> collection) {
        char c = (char) (this.text[i] & 255);
        boolean z = CHAR_MAP[state.getMode()][c] > 0;
        State state2 = null;
        for (int i2 = 0; i2 <= 4; i2++) {
            int i3 = CHAR_MAP[i2][c];
            if (i3 > 0) {
                if (state2 == null) {
                    state2 = state.endBinaryShift(i);
                }
                if (!z || i2 == state.getMode() || i2 == 2) {
                    collection.add(state2.latchAndAppend(i2, i3));
                }
                if (!z && SHIFT_TABLE[state.getMode()][i2] >= 0) {
                    collection.add(state2.shiftAndAppend(i2, i3));
                }
            }
        }
        if (state.getBinaryShiftByteCount() > 0 || CHAR_MAP[state.getMode()][c] == 0) {
            collection.add(state.addBinaryShiftChar(i));
        }
    }

    private static void updateStateForPair(State state, int i, int i2, Collection<State> collection) {
        State endBinaryShift = state.endBinaryShift(i);
        collection.add(endBinaryShift.latchAndAppend(4, i2));
        if (state.getMode() != 4) {
            collection.add(endBinaryShift.shiftAndAppend(4, i2));
        }
        if (i2 == 3 || i2 == 4) {
            collection.add(endBinaryShift.latchAndAppend(2, 16 - i2).latchAndAppend(2, 1));
        }
        if (state.getBinaryShiftByteCount() > 0) {
            collection.add(state.addBinaryShiftChar(i).addBinaryShiftChar(i + 1));
        }
    }

    private Collection<State> updateStateListForChar(Iterable<State> iterable, int i) {
        LinkedList linkedList = new LinkedList();
        for (State updateStateForChar : iterable) {
            updateStateForChar(updateStateForChar, i, linkedList);
        }
        return simplifyStates(linkedList);
    }

    private static Collection<State> updateStateListForPair(Iterable<State> iterable, int i, int i2) {
        LinkedList linkedList = new LinkedList();
        for (State updateStateForPair : iterable) {
            updateStateForPair(updateStateForPair, i, i2, linkedList);
        }
        return simplifyStates(linkedList);
    }

    public BitArray encode() {
        Collection singletonList = Collections.singletonList(State.INITIAL_STATE);
        int i = 0;
        while (i < this.text.length) {
            int i2 = 0;
            byte b = i + 1 < this.text.length ? this.text[i + 1] : 0;
            byte b2 = this.text[i];
            if (b2 != 13) {
                if (b2 != 44) {
                    if (b2 != 46) {
                        if (b2 == 58 && b == 32) {
                            i2 = 5;
                        }
                    } else if (b == 32) {
                        i2 = 3;
                    }
                } else if (b == 32) {
                    i2 = 4;
                }
            } else if (b == 10) {
                i2 = 2;
            }
            int i3 = i2;
            if (i3 > 0) {
                singletonList = updateStateListForPair(singletonList, i, i3);
                i++;
            } else {
                singletonList = updateStateListForChar(singletonList, i);
            }
            i++;
        }
        return ((State) Collections.min(singletonList, new Comparator<State>() {
            public int compare(State state, State state2) {
                return state.getBitCount() - state2.getBitCount();
            }
        })).toBitArray(this.text);
    }
}
