package android.support.v7.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v7.widget.RecyclerView.Adapter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class DiffUtil {
    private static final Comparator<Snake> SNAKE_COMPARATOR = new Comparator<Snake>() {
        public int compare(Snake snake, Snake snake2) {
            int i = snake.x - snake2.x;
            return i == 0 ? snake.y - snake2.y : i;
        }
    };

    public static abstract class Callback {
        public abstract boolean areContentsTheSame(int i, int i2);

        public abstract boolean areItemsTheSame(int i, int i2);

        @Nullable
        public Object getChangePayload(int i, int i2) {
            return null;
        }

        public abstract int getNewListSize();

        public abstract int getOldListSize();
    }

    public static class DiffResult {
        private static final int FLAG_CHANGED = 2;
        private static final int FLAG_IGNORE = 16;
        private static final int FLAG_MASK = 31;
        private static final int FLAG_MOVED_CHANGED = 4;
        private static final int FLAG_MOVED_NOT_CHANGED = 8;
        private static final int FLAG_NOT_CHANGED = 1;
        private static final int FLAG_OFFSET = 5;
        private final Callback mCallback;
        private final boolean mDetectMoves;
        private final int[] mNewItemStatuses;
        private final int mNewListSize;
        private final int[] mOldItemStatuses;
        private final int mOldListSize;
        private final List<Snake> mSnakes;

        DiffResult(Callback callback, List<Snake> list, int[] iArr, int[] iArr2, boolean z) {
            this.mSnakes = list;
            this.mOldItemStatuses = iArr;
            this.mNewItemStatuses = iArr2;
            Arrays.fill(this.mOldItemStatuses, 0);
            Arrays.fill(this.mNewItemStatuses, 0);
            this.mCallback = callback;
            this.mOldListSize = callback.getOldListSize();
            this.mNewListSize = callback.getNewListSize();
            this.mDetectMoves = z;
            addRootSnake();
            findMatchingItems();
        }

        private void addRootSnake() {
            Snake snake = this.mSnakes.isEmpty() ? null : (Snake) this.mSnakes.get(0);
            if (snake == null || snake.x != 0 || snake.y != 0) {
                Snake snake2 = new Snake();
                snake2.x = 0;
                snake2.y = 0;
                snake2.removal = false;
                snake2.size = 0;
                snake2.reverse = false;
                this.mSnakes.add(0, snake2);
            }
        }

        private void dispatchAdditions(List<PostponedUpdate> list, ListUpdateCallback listUpdateCallback, int i, int i2, int i3) {
            if (!this.mDetectMoves) {
                listUpdateCallback.onInserted(i, i2);
                return;
            }
            for (int i4 = i2 - 1; i4 >= 0; i4--) {
                int i5 = i3 + i4;
                int i6 = this.mNewItemStatuses[i5] & 31;
                if (i6 == 0) {
                    listUpdateCallback.onInserted(i, 1);
                    for (PostponedUpdate postponedUpdate : list) {
                        postponedUpdate.currentPos++;
                    }
                } else if (i6 == 4 || i6 == 8) {
                    int i7 = this.mNewItemStatuses[i5] >> 5;
                    listUpdateCallback.onMoved(removePostponedUpdate(list, i7, true).currentPos, i);
                    if (i6 == 4) {
                        listUpdateCallback.onChanged(i, 1, this.mCallback.getChangePayload(i7, i5));
                    }
                } else if (i6 == 16) {
                    list.add(new PostponedUpdate(i5, i, false));
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("unknown flag for pos ");
                    sb.append(i5);
                    sb.append(" ");
                    sb.append(Long.toBinaryString((long) i6));
                    throw new IllegalStateException(sb.toString());
                }
            }
        }

        private void dispatchRemovals(List<PostponedUpdate> list, ListUpdateCallback listUpdateCallback, int i, int i2, int i3) {
            if (!this.mDetectMoves) {
                listUpdateCallback.onRemoved(i, i2);
                return;
            }
            for (int i4 = i2 - 1; i4 >= 0; i4--) {
                int i5 = i3 + i4;
                int i6 = this.mOldItemStatuses[i5] & 31;
                if (i6 == 0) {
                    listUpdateCallback.onRemoved(i + i4, 1);
                    for (PostponedUpdate postponedUpdate : list) {
                        postponedUpdate.currentPos--;
                    }
                } else if (i6 == 4 || i6 == 8) {
                    int i7 = this.mOldItemStatuses[i5] >> 5;
                    PostponedUpdate removePostponedUpdate = removePostponedUpdate(list, i7, false);
                    listUpdateCallback.onMoved(i + i4, removePostponedUpdate.currentPos - 1);
                    if (i6 == 4) {
                        listUpdateCallback.onChanged(removePostponedUpdate.currentPos - 1, 1, this.mCallback.getChangePayload(i5, i7));
                    }
                } else if (i6 == 16) {
                    list.add(new PostponedUpdate(i5, i + i4, true));
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("unknown flag for pos ");
                    sb.append(i5);
                    sb.append(" ");
                    sb.append(Long.toBinaryString((long) i6));
                    throw new IllegalStateException(sb.toString());
                }
            }
        }

        private void findAddition(int i, int i2, int i3) {
            if (this.mOldItemStatuses[i - 1] == 0) {
                findMatchingItem(i, i2, i3, false);
            }
        }

        private boolean findMatchingItem(int i, int i2, int i3, boolean z) {
            int i4;
            int i5;
            if (z) {
                i2--;
                i5 = i;
                i4 = i2;
            } else {
                i5 = i - 1;
                i4 = i5;
            }
            while (i3 >= 0) {
                Snake snake = (Snake) this.mSnakes.get(i3);
                int i6 = snake.x + snake.size;
                int i7 = snake.y + snake.size;
                int i8 = 4;
                if (z) {
                    for (int i9 = i5 - 1; i9 >= i6; i9--) {
                        if (this.mCallback.areItemsTheSame(i9, i4)) {
                            if (this.mCallback.areContentsTheSame(i9, i4)) {
                                i8 = 8;
                            }
                            this.mNewItemStatuses[i4] = (i9 << 5) | 16;
                            this.mOldItemStatuses[i9] = (i4 << 5) | i8;
                            return true;
                        }
                    }
                    continue;
                } else {
                    for (int i10 = i2 - 1; i10 >= i7; i10--) {
                        if (this.mCallback.areItemsTheSame(i4, i10)) {
                            if (this.mCallback.areContentsTheSame(i4, i10)) {
                                i8 = 8;
                            }
                            int i11 = i - 1;
                            this.mOldItemStatuses[i11] = (i10 << 5) | 16;
                            this.mNewItemStatuses[i10] = (i11 << 5) | i8;
                            return true;
                        }
                    }
                    continue;
                }
                i5 = snake.x;
                i2 = snake.y;
                i3--;
            }
            return false;
        }

        private void findMatchingItems() {
            int i = this.mOldListSize;
            int i2 = this.mNewListSize;
            for (int size = this.mSnakes.size() - 1; size >= 0; size--) {
                Snake snake = (Snake) this.mSnakes.get(size);
                int i3 = snake.x + snake.size;
                int i4 = snake.y + snake.size;
                if (this.mDetectMoves) {
                    while (i > i3) {
                        findAddition(i, i2, size);
                        i--;
                    }
                    while (i2 > i4) {
                        findRemoval(i, i2, size);
                        i2--;
                    }
                }
                for (int i5 = 0; i5 < snake.size; i5++) {
                    int i6 = snake.x + i5;
                    int i7 = snake.y + i5;
                    int i8 = this.mCallback.areContentsTheSame(i6, i7) ? 1 : 2;
                    this.mOldItemStatuses[i6] = (i7 << 5) | i8;
                    this.mNewItemStatuses[i7] = (i6 << 5) | i8;
                }
                i = snake.x;
                i2 = snake.y;
            }
        }

        private void findRemoval(int i, int i2, int i3) {
            if (this.mNewItemStatuses[i2 - 1] == 0) {
                findMatchingItem(i, i2, i3, true);
            }
        }

        private static PostponedUpdate removePostponedUpdate(List<PostponedUpdate> list, int i, boolean z) {
            int size = list.size() - 1;
            while (size >= 0) {
                PostponedUpdate postponedUpdate = (PostponedUpdate) list.get(size);
                if (postponedUpdate.posInOwnerList == i && postponedUpdate.removal == z) {
                    list.remove(size);
                    while (size < list.size()) {
                        PostponedUpdate postponedUpdate2 = (PostponedUpdate) list.get(size);
                        postponedUpdate2.currentPos += z ? 1 : -1;
                        size++;
                    }
                    return postponedUpdate;
                }
                size--;
            }
            return null;
        }

        public void dispatchUpdatesTo(@NonNull ListUpdateCallback listUpdateCallback) {
            BatchingListUpdateCallback batchingListUpdateCallback = listUpdateCallback instanceof BatchingListUpdateCallback ? (BatchingListUpdateCallback) listUpdateCallback : new BatchingListUpdateCallback(listUpdateCallback);
            ArrayList arrayList = new ArrayList();
            int i = this.mOldListSize;
            int i2 = this.mNewListSize;
            for (int size = this.mSnakes.size() - 1; size >= 0; size--) {
                Snake snake = (Snake) this.mSnakes.get(size);
                int i3 = snake.size;
                int i4 = snake.x + i3;
                int i5 = snake.y + i3;
                if (i4 < i) {
                    dispatchRemovals(arrayList, batchingListUpdateCallback, i4, i - i4, i4);
                }
                if (i5 < i2) {
                    dispatchAdditions(arrayList, batchingListUpdateCallback, i4, i2 - i5, i5);
                }
                for (int i6 = i3 - 1; i6 >= 0; i6--) {
                    if ((this.mOldItemStatuses[snake.x + i6] & 31) == 2) {
                        batchingListUpdateCallback.onChanged(snake.x + i6, 1, this.mCallback.getChangePayload(snake.x + i6, snake.y + i6));
                    }
                }
                i = snake.x;
                i2 = snake.y;
            }
            batchingListUpdateCallback.dispatchLastEvent();
        }

        public void dispatchUpdatesTo(@NonNull Adapter adapter) {
            dispatchUpdatesTo((ListUpdateCallback) new AdapterListUpdateCallback(adapter));
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public List<Snake> getSnakes() {
            return this.mSnakes;
        }
    }

    public static abstract class ItemCallback<T> {
        public abstract boolean areContentsTheSame(@NonNull T t, @NonNull T t2);

        public abstract boolean areItemsTheSame(@NonNull T t, @NonNull T t2);

        @Nullable
        public Object getChangePayload(@NonNull T t, @NonNull T t2) {
            return null;
        }
    }

    private static class PostponedUpdate {
        int currentPos;
        int posInOwnerList;
        boolean removal;

        public PostponedUpdate(int i, int i2, boolean z) {
            this.posInOwnerList = i;
            this.currentPos = i2;
            this.removal = z;
        }
    }

    static class Range {
        int newListEnd;
        int newListStart;
        int oldListEnd;
        int oldListStart;

        public Range() {
        }

        public Range(int i, int i2, int i3, int i4) {
            this.oldListStart = i;
            this.oldListEnd = i2;
            this.newListStart = i3;
            this.newListEnd = i4;
        }
    }

    static class Snake {
        boolean removal;
        boolean reverse;
        int size;
        int x;
        int y;

        Snake() {
        }
    }

    private DiffUtil() {
    }

    @NonNull
    public static DiffResult calculateDiff(@NonNull Callback callback) {
        return calculateDiff(callback, true);
    }

    @NonNull
    public static DiffResult calculateDiff(@NonNull Callback callback, boolean z) {
        int oldListSize = callback.getOldListSize();
        int newListSize = callback.getNewListSize();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        arrayList2.add(new Range(0, oldListSize, 0, newListSize));
        int abs = Math.abs(oldListSize - newListSize) + oldListSize + newListSize;
        int i = abs * 2;
        int[] iArr = new int[i];
        int[] iArr2 = new int[i];
        ArrayList arrayList3 = new ArrayList();
        while (!arrayList2.isEmpty()) {
            Range range = (Range) arrayList2.remove(arrayList2.size() - 1);
            Snake diffPartial = diffPartial(callback, range.oldListStart, range.oldListEnd, range.newListStart, range.newListEnd, iArr, iArr2, abs);
            if (diffPartial != null) {
                if (diffPartial.size > 0) {
                    arrayList.add(diffPartial);
                }
                diffPartial.x += range.oldListStart;
                diffPartial.y += range.newListStart;
                Range range2 = arrayList3.isEmpty() ? new Range() : (Range) arrayList3.remove(arrayList3.size() - 1);
                range2.oldListStart = range.oldListStart;
                range2.newListStart = range.newListStart;
                if (diffPartial.reverse) {
                    range2.oldListEnd = diffPartial.x;
                    range2.newListEnd = diffPartial.y;
                } else if (diffPartial.removal) {
                    range2.oldListEnd = diffPartial.x - 1;
                    range2.newListEnd = diffPartial.y;
                } else {
                    range2.oldListEnd = diffPartial.x;
                    range2.newListEnd = diffPartial.y - 1;
                }
                arrayList2.add(range2);
                if (!diffPartial.reverse) {
                    range.oldListStart = diffPartial.x + diffPartial.size;
                    range.newListStart = diffPartial.y + diffPartial.size;
                } else if (diffPartial.removal) {
                    range.oldListStart = diffPartial.x + diffPartial.size + 1;
                    range.newListStart = diffPartial.y + diffPartial.size;
                } else {
                    range.oldListStart = diffPartial.x + diffPartial.size;
                    range.newListStart = diffPartial.y + diffPartial.size + 1;
                }
                arrayList2.add(range);
            } else {
                arrayList3.add(range);
            }
        }
        Collections.sort(arrayList, SNAKE_COMPARATOR);
        DiffResult diffResult = new DiffResult(callback, arrayList, iArr, iArr2, z);
        return diffResult;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:44:0x00e3, code lost:
        if (r4[r9 - 1] < r4[r9 + 1]) goto L_0x00f6;
     */
    private static Snake diffPartial(Callback callback, int i, int i2, int i3, int i4, int[] iArr, int[] iArr2, int i5) {
        boolean z;
        int i6;
        int i7;
        boolean z2;
        boolean z3;
        int i8;
        int i9;
        int i10;
        int i11;
        Callback callback2 = callback;
        int[] iArr3 = iArr;
        int[] iArr4 = iArr2;
        int i12 = i2 - i;
        int i13 = i4 - i3;
        int i14 = 1;
        if (i12 < 1 || i13 < 1) {
            return null;
        }
        int i15 = i12 - i13;
        int i16 = ((i12 + i13) + 1) / 2;
        int i17 = (i5 - i16) - 1;
        int i18 = i5 + i16 + 1;
        boolean z4 = false;
        Arrays.fill(iArr3, i17, i18, 0);
        Arrays.fill(iArr4, i17 + i15, i18 + i15, i12);
        boolean z5 = i15 % 2 != 0;
        int i19 = 0;
        while (i19 <= i16) {
            int i20 = -i19;
            int i21 = i20;
            while (i21 <= i19) {
                if (i21 != i20) {
                    if (i21 != i19) {
                        int i22 = i5 + i21;
                        if (iArr3[i22 - 1] < iArr3[i22 + i14]) {
                        }
                    }
                    i8 = iArr3[(i5 + i21) - 1] + 1;
                    z3 = true;
                    int i23 = i16;
                    i9 = i8 - i21;
                    while (true) {
                        if (i8 < i12 && i9 < i13) {
                            i11 = i12;
                            i10 = i13;
                            if (!callback2.areItemsTheSame(i + i8, i3 + i9)) {
                                break;
                            }
                            i8++;
                            i9++;
                            i12 = i11;
                            i13 = i10;
                        } else {
                            i11 = i12;
                            i10 = i13;
                        }
                    }
                    i11 = i12;
                    i10 = i13;
                    int i24 = i5 + i21;
                    iArr3[i24] = i8;
                    if (z5 || i21 < (i15 - i19) + 1 || i21 > (i15 + i19) - 1 || iArr3[i24] < iArr4[i24]) {
                        i21 += 2;
                        z4 = false;
                        i16 = i23;
                        i12 = i11;
                        i13 = i10;
                        i14 = 1;
                    } else {
                        Snake snake = new Snake();
                        snake.x = iArr4[i24];
                        snake.y = snake.x - i21;
                        snake.size = iArr3[i24] - iArr4[i24];
                        snake.removal = z3;
                        snake.reverse = false;
                        return snake;
                    }
                } else {
                    int i25 = i14;
                }
                i8 = iArr3[i5 + i21 + 1];
                z3 = false;
                int i232 = i16;
                i9 = i8 - i21;
                while (true) {
                    if (i8 < i12) {
                        break;
                    }
                    break;
                    i8++;
                    i9++;
                    i12 = i11;
                    i13 = i10;
                }
                i11 = i12;
                i10 = i13;
                int i242 = i5 + i21;
                iArr3[i242] = i8;
                if (z5) {
                }
                i21 += 2;
                z4 = false;
                i16 = i232;
                i12 = i11;
                i13 = i10;
                i14 = 1;
            }
            int i26 = i12;
            int i27 = i13;
            int i28 = i16;
            boolean z6 = z4;
            int i29 = i20;
            while (i29 <= i19) {
                int i30 = i29 + i15;
                if (i30 != i19 + i15) {
                    if (i30 != i20 + i15) {
                        int i31 = i5 + i30;
                        z2 = true;
                    } else {
                        z2 = true;
                    }
                    i6 = iArr4[(i5 + i30) + 1] - 1;
                    z = z2;
                    i7 = i6 - i30;
                    while (i6 > 0 && i7 > 0 && callback2.areItemsTheSame((i + i6) - 1, (i3 + i7) - 1)) {
                        i6--;
                        i7--;
                    }
                    int i32 = i5 + i30;
                    iArr4[i32] = i6;
                    if (!z5 || i30 < i20 || i30 > i19 || iArr3[i32] < iArr4[i32]) {
                        i29 += 2;
                        z6 = false;
                    } else {
                        Snake snake2 = new Snake();
                        snake2.x = iArr4[i32];
                        snake2.y = snake2.x - i30;
                        snake2.size = iArr3[i32] - iArr4[i32];
                        snake2.removal = z;
                        snake2.reverse = true;
                        return snake2;
                    }
                }
                i6 = iArr4[(i5 + i30) - 1];
                z = z6;
                i7 = i6 - i30;
                while (i6 > 0) {
                    i6--;
                    i7--;
                }
                int i322 = i5 + i30;
                iArr4[i322] = i6;
                if (!z5) {
                }
                i29 += 2;
                z6 = false;
            }
            i19++;
            i14 = 1;
            i16 = i28;
            i12 = i26;
            i13 = i27;
            z4 = false;
        }
        throw new IllegalStateException("DiffUtil hit an unexpected case while trying to calculate the optimal path. Please make sure your data is not changing during the diff calculation.");
    }
}
