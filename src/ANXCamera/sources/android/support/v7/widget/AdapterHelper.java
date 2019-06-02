package android.support.v7.widget;

import android.support.v4.util.Pools.Pool;
import android.support.v4.util.Pools.SimplePool;
import android.support.v7.widget.RecyclerView.ViewHolder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class AdapterHelper implements Callback {
    private static final boolean DEBUG = false;
    static final int POSITION_TYPE_INVISIBLE = 0;
    static final int POSITION_TYPE_NEW_OR_LAID_OUT = 1;
    private static final String TAG = "AHT";
    final Callback mCallback;
    final boolean mDisableRecycler;
    Runnable mOnItemProcessedCallback;
    final OpReorderer mOpReorderer;
    final ArrayList<UpdateOp> mPendingUpdates;
    final ArrayList<UpdateOp> mPostponedList;
    private Pool<UpdateOp> mUpdateOpPool;

    interface Callback {
        ViewHolder findViewHolder(int i);

        void markViewHoldersUpdated(int i, int i2, Object obj);

        void offsetPositionsForAdd(int i, int i2);

        void offsetPositionsForMove(int i, int i2);

        void offsetPositionsForRemovingInvisible(int i, int i2);

        void offsetPositionsForRemovingLaidOutOrNewView(int i, int i2);

        void onDispatchFirstPass(UpdateOp updateOp);

        void onDispatchSecondPass(UpdateOp updateOp);
    }

    static class UpdateOp {
        static final int ADD = 0;
        static final int MOVE = 3;
        static final int POOL_SIZE = 30;
        static final int REMOVE = 1;
        static final int UPDATE = 2;
        int cmd;
        int itemCount;
        Object payload;
        int positionStart;

        UpdateOp(int i, int i2, int i3, Object obj) {
            this.cmd = i;
            this.positionStart = i2;
            this.itemCount = i3;
            this.payload = obj;
        }

        /* access modifiers changed from: 0000 */
        public String cmdToString() {
            switch (this.cmd) {
                case 0:
                    return "add";
                case 1:
                    return "rm";
                case 2:
                    return "up";
                case 3:
                    return "mv";
                default:
                    return "??";
            }
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            UpdateOp updateOp = (UpdateOp) obj;
            if (this.cmd != updateOp.cmd) {
                return false;
            }
            if (this.cmd == 3 && Math.abs(this.itemCount - this.positionStart) == 1 && this.itemCount == updateOp.positionStart && this.positionStart == updateOp.itemCount) {
                return true;
            }
            if (this.itemCount != updateOp.itemCount || this.positionStart != updateOp.positionStart) {
                return false;
            }
            if (this.payload != null) {
                if (!this.payload.equals(updateOp.payload)) {
                    return false;
                }
            } else if (updateOp.payload != null) {
                return false;
            }
            return true;
        }

        public int hashCode() {
            return (31 * ((31 * this.cmd) + this.positionStart)) + this.itemCount;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(Integer.toHexString(System.identityHashCode(this)));
            sb.append("[");
            sb.append(cmdToString());
            sb.append(",s:");
            sb.append(this.positionStart);
            sb.append("c:");
            sb.append(this.itemCount);
            sb.append(",p:");
            sb.append(this.payload);
            sb.append("]");
            return sb.toString();
        }
    }

    AdapterHelper(Callback callback) {
        this(callback, false);
    }

    AdapterHelper(Callback callback, boolean z) {
        this.mUpdateOpPool = new SimplePool(30);
        this.mPendingUpdates = new ArrayList<>();
        this.mPostponedList = new ArrayList<>();
        this.mCallback = callback;
        this.mDisableRecycler = z;
        this.mOpReorderer = new OpReorderer(this);
    }

    private void applyAdd(UpdateOp updateOp) {
        postponeAndUpdateViewHolders(updateOp);
    }

    private void applyMove(UpdateOp updateOp) {
        postponeAndUpdateViewHolders(updateOp);
    }

    private void applyRemove(UpdateOp updateOp) {
        int i = updateOp.positionStart;
        int i2 = 0;
        int i3 = updateOp.positionStart + updateOp.itemCount;
        char c = 65535;
        int i4 = updateOp.positionStart;
        while (i4 < i3) {
            boolean z = false;
            if (this.mCallback.findViewHolder(i4) != null || canFindInPreLayout(i4)) {
                if (c == 0) {
                    dispatchAndUpdateViewHolders(obtainUpdateOp(1, i, i2, null));
                    z = true;
                }
                c = 1;
            } else {
                if (c == 1) {
                    postponeAndUpdateViewHolders(obtainUpdateOp(1, i, i2, null));
                    z = true;
                }
                c = 0;
            }
            if (z) {
                i4 -= i2;
                i3 -= i2;
                i2 = 1;
            } else {
                i2++;
            }
            i4++;
        }
        if (i2 != updateOp.itemCount) {
            recycleUpdateOp(updateOp);
            updateOp = obtainUpdateOp(1, i, i2, null);
        }
        if (c == 0) {
            dispatchAndUpdateViewHolders(updateOp);
        } else {
            postponeAndUpdateViewHolders(updateOp);
        }
    }

    private void applyUpdate(UpdateOp updateOp) {
        int i;
        int i2 = updateOp.positionStart;
        int i3 = 0;
        int i4 = updateOp.positionStart + updateOp.itemCount;
        char c = 65535;
        int i5 = updateOp.positionStart;
        while (i5 < i4) {
            if (this.mCallback.findViewHolder(i5) != null || canFindInPreLayout(i5)) {
                if (c == 0) {
                    dispatchAndUpdateViewHolders(obtainUpdateOp(2, i2, i, updateOp.payload));
                    i = 0;
                    i2 = i5;
                }
                c = 1;
            } else {
                if (c == 1) {
                    postponeAndUpdateViewHolders(obtainUpdateOp(2, i2, i, updateOp.payload));
                    i = 0;
                    i2 = i5;
                }
                c = 0;
            }
            i3 = i + 1;
            i5++;
        }
        if (i != updateOp.itemCount) {
            Object obj = updateOp.payload;
            recycleUpdateOp(updateOp);
            updateOp = obtainUpdateOp(2, i2, i, obj);
        }
        if (c == 0) {
            dispatchAndUpdateViewHolders(updateOp);
        } else {
            postponeAndUpdateViewHolders(updateOp);
        }
    }

    private boolean canFindInPreLayout(int i) {
        int size = this.mPostponedList.size();
        for (int i2 = 0; i2 < size; i2++) {
            UpdateOp updateOp = (UpdateOp) this.mPostponedList.get(i2);
            if (updateOp.cmd == 3) {
                if (findPositionOffset(updateOp.itemCount, i2 + 1) == i) {
                    return true;
                }
            } else if (updateOp.cmd == 0) {
                int i3 = updateOp.positionStart + updateOp.itemCount;
                for (int i4 = updateOp.positionStart; i4 < i3; i4++) {
                    if (findPositionOffset(i4, i2 + 1) == i) {
                        return true;
                    }
                }
                continue;
            } else {
                continue;
            }
        }
        return false;
    }

    private void dispatchAndUpdateViewHolders(UpdateOp updateOp) {
        int i;
        if (updateOp.cmd == 0 || updateOp.cmd == 3) {
            throw new IllegalArgumentException("should not dispatch add or move for pre layout");
        }
        int updatePositionWithPostponed = updatePositionWithPostponed(updateOp.positionStart, updateOp.cmd);
        int i2 = 1;
        int i3 = updateOp.positionStart;
        switch (updateOp.cmd) {
            case 1:
                i = 0;
                break;
            case 2:
                i = 1;
                break;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("op should be remove or update.");
                sb.append(updateOp);
                throw new IllegalArgumentException(sb.toString());
        }
        int i4 = i3;
        int i5 = updatePositionWithPostponed;
        for (int i6 = 1; i6 < updateOp.itemCount; i6++) {
            int updatePositionWithPostponed2 = updatePositionWithPostponed(updateOp.positionStart + (i * i6), updateOp.cmd);
            boolean z = false;
            boolean z2 = false;
            switch (updateOp.cmd) {
                case 1:
                    if (updatePositionWithPostponed2 == i5) {
                        z2 = true;
                    }
                    z = z2;
                    break;
                case 2:
                    if (updatePositionWithPostponed2 == i5 + 1) {
                        z2 = true;
                    }
                    z = z2;
                    break;
            }
            if (z) {
                i2++;
            } else {
                UpdateOp obtainUpdateOp = obtainUpdateOp(updateOp.cmd, i5, i2, updateOp.payload);
                dispatchFirstPassAndUpdateViewHolders(obtainUpdateOp, i4);
                recycleUpdateOp(obtainUpdateOp);
                if (updateOp.cmd == 2) {
                    i4 += i2;
                }
                i5 = updatePositionWithPostponed2;
                i2 = 1;
            }
        }
        Object obj = updateOp.payload;
        recycleUpdateOp(updateOp);
        if (i2 > 0) {
            UpdateOp obtainUpdateOp2 = obtainUpdateOp(updateOp.cmd, i5, i2, obj);
            dispatchFirstPassAndUpdateViewHolders(obtainUpdateOp2, i4);
            recycleUpdateOp(obtainUpdateOp2);
        }
    }

    private void postponeAndUpdateViewHolders(UpdateOp updateOp) {
        this.mPostponedList.add(updateOp);
        switch (updateOp.cmd) {
            case 0:
                this.mCallback.offsetPositionsForAdd(updateOp.positionStart, updateOp.itemCount);
                return;
            case 1:
                this.mCallback.offsetPositionsForRemovingLaidOutOrNewView(updateOp.positionStart, updateOp.itemCount);
                return;
            case 2:
                this.mCallback.markViewHoldersUpdated(updateOp.positionStart, updateOp.itemCount, updateOp.payload);
                return;
            case 3:
                this.mCallback.offsetPositionsForMove(updateOp.positionStart, updateOp.itemCount);
                return;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unknown update op type for ");
                sb.append(updateOp);
                throw new IllegalArgumentException(sb.toString());
        }
    }

    private int updatePositionWithPostponed(int i, int i2) {
        int i3;
        int i4;
        for (int size = this.mPostponedList.size() - 1; size >= 0; size--) {
            UpdateOp updateOp = (UpdateOp) this.mPostponedList.get(size);
            if (updateOp.cmd == 3) {
                if (updateOp.positionStart < updateOp.itemCount) {
                    i4 = updateOp.positionStart;
                    i3 = updateOp.itemCount;
                } else {
                    i4 = updateOp.itemCount;
                    i3 = updateOp.positionStart;
                }
                if (i < i4 || i > i3) {
                    if (i < updateOp.positionStart) {
                        if (i2 == 0) {
                            updateOp.positionStart++;
                            updateOp.itemCount++;
                        } else if (i2 == 1) {
                            updateOp.positionStart--;
                            updateOp.itemCount--;
                        }
                    }
                } else if (i4 == updateOp.positionStart) {
                    if (i2 == 0) {
                        updateOp.itemCount++;
                    } else if (i2 == 1) {
                        updateOp.itemCount--;
                    }
                    i++;
                } else {
                    if (i2 == 0) {
                        updateOp.positionStart++;
                    } else if (i2 == 1) {
                        updateOp.positionStart--;
                    }
                    i--;
                }
            } else if (updateOp.positionStart <= i) {
                if (updateOp.cmd == 0) {
                    i -= updateOp.itemCount;
                } else if (updateOp.cmd == 1) {
                    i += updateOp.itemCount;
                }
            } else if (i2 == 0) {
                updateOp.positionStart++;
            } else if (i2 == 1) {
                updateOp.positionStart--;
            }
        }
        for (int size2 = this.mPostponedList.size() - 1; size2 >= 0; size2--) {
            UpdateOp updateOp2 = (UpdateOp) this.mPostponedList.get(size2);
            if (updateOp2.cmd == 3) {
                if (updateOp2.itemCount == updateOp2.positionStart || updateOp2.itemCount < 0) {
                    this.mPostponedList.remove(size2);
                    recycleUpdateOp(updateOp2);
                }
            } else if (updateOp2.itemCount <= 0) {
                this.mPostponedList.remove(size2);
                recycleUpdateOp(updateOp2);
            }
        }
        return i;
    }

    /* access modifiers changed from: 0000 */
    public AdapterHelper addUpdateOp(UpdateOp... updateOpArr) {
        Collections.addAll(this.mPendingUpdates, updateOpArr);
        return this;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:35:0x0046, code lost:
        continue;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int applyPendingUpdatesToPosition(int i) {
        int size = this.mPendingUpdates.size();
        for (int i2 = 0; i2 < size; i2++) {
            UpdateOp updateOp = (UpdateOp) this.mPendingUpdates.get(i2);
            int i3 = updateOp.cmd;
            if (i3 != 3) {
                switch (i3) {
                    case 0:
                        if (updateOp.positionStart > i) {
                            break;
                        } else {
                            i += updateOp.itemCount;
                            break;
                        }
                    case 1:
                        if (updateOp.positionStart <= i) {
                            if (updateOp.positionStart + updateOp.itemCount <= i) {
                                i -= updateOp.itemCount;
                                break;
                            } else {
                                return -1;
                            }
                        } else {
                            continue;
                        }
                }
            } else if (updateOp.positionStart == i) {
                i = updateOp.itemCount;
            } else {
                if (updateOp.positionStart < i) {
                    i--;
                }
                if (updateOp.itemCount <= i) {
                    i++;
                }
            }
        }
        return i;
    }

    /* access modifiers changed from: 0000 */
    public void consumePostponedUpdates() {
        int size = this.mPostponedList.size();
        for (int i = 0; i < size; i++) {
            this.mCallback.onDispatchSecondPass((UpdateOp) this.mPostponedList.get(i));
        }
        recycleUpdateOpsAndClearList(this.mPostponedList);
    }

    /* access modifiers changed from: 0000 */
    public void consumeUpdatesInOnePass() {
        consumePostponedUpdates();
        int size = this.mPendingUpdates.size();
        for (int i = 0; i < size; i++) {
            UpdateOp updateOp = (UpdateOp) this.mPendingUpdates.get(i);
            switch (updateOp.cmd) {
                case 0:
                    this.mCallback.onDispatchSecondPass(updateOp);
                    this.mCallback.offsetPositionsForAdd(updateOp.positionStart, updateOp.itemCount);
                    break;
                case 1:
                    this.mCallback.onDispatchSecondPass(updateOp);
                    this.mCallback.offsetPositionsForRemovingInvisible(updateOp.positionStart, updateOp.itemCount);
                    break;
                case 2:
                    this.mCallback.onDispatchSecondPass(updateOp);
                    this.mCallback.markViewHoldersUpdated(updateOp.positionStart, updateOp.itemCount, updateOp.payload);
                    break;
                case 3:
                    this.mCallback.onDispatchSecondPass(updateOp);
                    this.mCallback.offsetPositionsForMove(updateOp.positionStart, updateOp.itemCount);
                    break;
            }
            if (this.mOnItemProcessedCallback != null) {
                this.mOnItemProcessedCallback.run();
            }
        }
        recycleUpdateOpsAndClearList(this.mPendingUpdates);
    }

    /* access modifiers changed from: 0000 */
    public void dispatchFirstPassAndUpdateViewHolders(UpdateOp updateOp, int i) {
        this.mCallback.onDispatchFirstPass(updateOp);
        switch (updateOp.cmd) {
            case 1:
                this.mCallback.offsetPositionsForRemovingInvisible(i, updateOp.itemCount);
                return;
            case 2:
                this.mCallback.markViewHoldersUpdated(i, updateOp.itemCount, updateOp.payload);
                return;
            default:
                throw new IllegalArgumentException("only remove and update ops can be dispatched in first pass");
        }
    }

    /* access modifiers changed from: 0000 */
    public int findPositionOffset(int i) {
        return findPositionOffset(i, 0);
    }

    /* access modifiers changed from: 0000 */
    public int findPositionOffset(int i, int i2) {
        int size = this.mPostponedList.size();
        int i3 = i;
        for (int i4 = i2; i4 < size; i4++) {
            UpdateOp updateOp = (UpdateOp) this.mPostponedList.get(i4);
            if (updateOp.cmd == 3) {
                if (updateOp.positionStart == i3) {
                    i3 = updateOp.itemCount;
                } else {
                    if (updateOp.positionStart < i3) {
                        i3--;
                    }
                    if (updateOp.itemCount <= i3) {
                        i3++;
                    }
                }
            } else if (updateOp.positionStart > i3) {
                continue;
            } else if (updateOp.cmd == 1) {
                if (i3 < updateOp.positionStart + updateOp.itemCount) {
                    return -1;
                }
                i3 -= updateOp.itemCount;
            } else if (updateOp.cmd == 0) {
                i3 += updateOp.itemCount;
            }
        }
        return i3;
    }

    /* access modifiers changed from: 0000 */
    public boolean hasPendingUpdates() {
        return this.mPendingUpdates.size() > 0;
    }

    public UpdateOp obtainUpdateOp(int i, int i2, int i3, Object obj) {
        UpdateOp updateOp = (UpdateOp) this.mUpdateOpPool.acquire();
        if (updateOp == null) {
            return new UpdateOp(i, i2, i3, obj);
        }
        updateOp.cmd = i;
        updateOp.positionStart = i2;
        updateOp.itemCount = i3;
        updateOp.payload = obj;
        return updateOp;
    }

    /* access modifiers changed from: 0000 */
    public boolean onItemRangeChanged(int i, int i2, Object obj) {
        this.mPendingUpdates.add(obtainUpdateOp(2, i, i2, obj));
        return this.mPendingUpdates.size() == 1;
    }

    /* access modifiers changed from: 0000 */
    public boolean onItemRangeInserted(int i, int i2) {
        this.mPendingUpdates.add(obtainUpdateOp(0, i, i2, null));
        return this.mPendingUpdates.size() == 1;
    }

    /* access modifiers changed from: 0000 */
    public boolean onItemRangeMoved(int i, int i2, int i3) {
        boolean z = false;
        if (i == i2) {
            return false;
        }
        if (i3 == 1) {
            this.mPendingUpdates.add(obtainUpdateOp(3, i, i2, null));
            if (this.mPendingUpdates.size() == 1) {
                z = true;
            }
            return z;
        }
        throw new IllegalArgumentException("Moving more than 1 item is not supported yet");
    }

    /* access modifiers changed from: 0000 */
    public boolean onItemRangeRemoved(int i, int i2) {
        this.mPendingUpdates.add(obtainUpdateOp(1, i, i2, null));
        return this.mPendingUpdates.size() == 1;
    }

    /* access modifiers changed from: 0000 */
    public void preProcess() {
        this.mOpReorderer.reorderOps(this.mPendingUpdates);
        int size = this.mPendingUpdates.size();
        for (int i = 0; i < size; i++) {
            UpdateOp updateOp = (UpdateOp) this.mPendingUpdates.get(i);
            switch (updateOp.cmd) {
                case 0:
                    applyAdd(updateOp);
                    break;
                case 1:
                    applyRemove(updateOp);
                    break;
                case 2:
                    applyUpdate(updateOp);
                    break;
                case 3:
                    applyMove(updateOp);
                    break;
            }
            if (this.mOnItemProcessedCallback != null) {
                this.mOnItemProcessedCallback.run();
            }
        }
        this.mPendingUpdates.clear();
    }

    public void recycleUpdateOp(UpdateOp updateOp) {
        if (!this.mDisableRecycler) {
            updateOp.payload = null;
            this.mUpdateOpPool.release(updateOp);
        }
    }

    /* access modifiers changed from: 0000 */
    public void recycleUpdateOpsAndClearList(List<UpdateOp> list) {
        int size = list.size();
        for (int i = 0; i < size; i++) {
            recycleUpdateOp((UpdateOp) list.get(i));
        }
        list.clear();
    }

    /* access modifiers changed from: 0000 */
    public void reset() {
        recycleUpdateOpsAndClearList(this.mPendingUpdates);
        recycleUpdateOpsAndClearList(this.mPostponedList);
    }
}
