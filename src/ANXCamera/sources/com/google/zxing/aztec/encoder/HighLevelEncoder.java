package com.google.zxing.aztec.encoder;

import com.google.zxing.common.BitArray;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

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
        for (int c = 65; c <= 90; c++) {
            CHAR_MAP[0][c] = (c - 65) + 2;
        }
        CHAR_MAP[1][32] = 1;
        for (int c2 = 97; c2 <= 122; c2++) {
            CHAR_MAP[1][c2] = (c2 - 97) + 2;
        }
        CHAR_MAP[2][32] = 1;
        for (int c3 = 48; c3 <= 57; c3++) {
            CHAR_MAP[2][c3] = (c3 - 48) + 2;
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
        int[] mixedTable = iArr6;
        for (int i = 0; i < mixedTable.length; i++) {
            CHAR_MAP[3][mixedTable[i]] = i;
        }
        int[] iArr7 = new int[31];
        iArr7[1] = 13;
        iArr7[6] = 33;
        iArr7[7] = 39;
        iArr7[8] = 35;
        iArr7[9] = 36;
        iArr7[10] = 37;
        iArr7[11] = 38;
        iArr7[12] = 39;
        iArr7[13] = 40;
        iArr7[14] = 41;
        iArr7[15] = 42;
        iArr7[16] = 43;
        iArr7[17] = 44;
        iArr7[18] = 45;
        iArr7[19] = 46;
        iArr7[20] = 47;
        iArr7[21] = 58;
        iArr7[22] = 59;
        iArr7[23] = 60;
        iArr7[24] = 61;
        iArr7[25] = 62;
        iArr7[26] = 63;
        iArr7[27] = 91;
        iArr7[28] = 93;
        iArr7[29] = 123;
        iArr7[30] = 125;
        int[] punctTable = iArr7;
        for (int i2 = 0; i2 < punctTable.length; i2++) {
            if (punctTable[i2] > 0) {
                CHAR_MAP[4][punctTable[i2]] = i2;
            }
        }
        for (int[] table : SHIFT_TABLE) {
            Arrays.fill(table, -1);
        }
        SHIFT_TABLE[0][4] = 0;
        SHIFT_TABLE[1][4] = 0;
        SHIFT_TABLE[1][0] = 28;
        SHIFT_TABLE[3][4] = 0;
        SHIFT_TABLE[2][4] = 0;
        SHIFT_TABLE[2][0] = 15;
    }

    public HighLevelEncoder(byte[] text2) {
        this.text = text2;
    }

    public BitArray encode() {
        Collection<State> states = Collections.singletonList(State.INITIAL_STATE);
        int index = 0;
        while (index < this.text.length) {
            int pairCode = 0;
            byte nextChar = index + 1 < this.text.length ? this.text[index + 1] : 0;
            byte b = this.text[index];
            if (b != 13) {
                if (b != 44) {
                    if (b != 46) {
                        if (b == 58 && nextChar == 32) {
                            pairCode = 5;
                        }
                    } else if (nextChar == 32) {
                        pairCode = 3;
                    }
                } else if (nextChar == 32) {
                    pairCode = 4;
                }
            } else if (nextChar == 10) {
                pairCode = 2;
            }
            int pairCode2 = pairCode;
            if (pairCode2 > 0) {
                states = updateStateListForPair(states, index, pairCode2);
                index++;
            } else {
                states = updateStateListForChar(states, index);
            }
            index++;
        }
        return ((State) Collections.min(states, new Comparator<State>() {
            public int compare(State a, State b) {
                return a.getBitCount() - b.getBitCount();
            }
        })).toBitArray(this.text);
    }

    private Collection<State> updateStateListForChar(Iterable<State> states, int index) {
        Collection<State> result = new LinkedList<>();
        for (State state : states) {
            updateStateForChar(state, index, result);
        }
        return simplifyStates(result);
    }

    private void updateStateForChar(State state, int index, Collection<State> result) {
        char ch = (char) (this.text[index] & -1);
        boolean charInCurrentTable = CHAR_MAP[state.getMode()][ch] > 0;
        State stateNoBinary = null;
        int mode = 0;
        while (mode <= 4) {
            int charInMode = CHAR_MAP[mode][ch];
            if (charInMode > 0) {
                if (stateNoBinary == null) {
                    stateNoBinary = state.endBinaryShift(index);
                }
                if (!charInCurrentTable || mode == state.getMode() || mode == 2) {
                    result.add(stateNoBinary.latchAndAppend(mode, charInMode));
                }
                if (!charInCurrentTable && SHIFT_TABLE[state.getMode()][mode] >= 0) {
                    result.add(stateNoBinary.shiftAndAppend(mode, charInMode));
                }
            }
            mode++;
        }
        if (state.getBinaryShiftByteCount() > 0 || CHAR_MAP[state.getMode()][ch] == 0) {
            result.add(state.addBinaryShiftChar(index));
        }
    }

    private static Collection<State> updateStateListForPair(Iterable<State> states, int index, int pairCode) {
        Collection<State> result = new LinkedList<>();
        for (State state : states) {
            updateStateForPair(state, index, pairCode, result);
        }
        return simplifyStates(result);
    }

    private static void updateStateForPair(State state, int index, int pairCode, Collection<State> result) {
        State stateNoBinary = state.endBinaryShift(index);
        result.add(stateNoBinary.latchAndAppend(4, pairCode));
        if (state.getMode() != 4) {
            result.add(stateNoBinary.shiftAndAppend(4, pairCode));
        }
        if (pairCode == 3 || pairCode == 4) {
            result.add(stateNoBinary.latchAndAppend(2, 16 - pairCode).latchAndAppend(2, 1));
        }
        if (state.getBinaryShiftByteCount() > 0) {
            result.add(state.addBinaryShiftChar(index).addBinaryShiftChar(index + 1));
        }
    }

    private static Collection<State> simplifyStates(Iterable<State> states) {
        List<State> result = new LinkedList<>();
        for (State newState : states) {
            boolean add = true;
            Iterator<State> iterator = result.iterator();
            while (true) {
                if (!iterator.hasNext()) {
                    break;
                }
                State oldState = (State) iterator.next();
                if (oldState.isBetterThanOrEqualTo(newState)) {
                    add = false;
                    break;
                } else if (newState.isBetterThanOrEqualTo(oldState)) {
                    iterator.remove();
                }
            }
            if (add) {
                result.add(newState);
            }
        }
        return result;
    }
}
