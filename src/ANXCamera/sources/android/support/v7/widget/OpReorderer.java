package android.support.v7.widget;

import java.util.List;

class OpReorderer {
    final Callback mCallback;

    interface Callback {
        UpdateOp obtainUpdateOp(int i, int i2, int i3, Object obj);

        void recycleUpdateOp(UpdateOp updateOp);
    }

    OpReorderer(Callback callback) {
        this.mCallback = callback;
    }

    private int getLastMoveOutOfOrder(List<UpdateOp> list) {
        boolean z = false;
        for (int size = list.size() - 1; size >= 0; size--) {
            if (((UpdateOp) list.get(size)).cmd != 8) {
                z = true;
            } else if (z) {
                return size;
            }
        }
        return -1;
    }

    private void swapMoveAdd(List<UpdateOp> list, int i, UpdateOp updateOp, int i2, UpdateOp updateOp2) {
        int i3 = updateOp.itemCount < updateOp2.positionStart ? -1 : 0;
        if (updateOp.positionStart < updateOp2.positionStart) {
            i3++;
        }
        if (updateOp2.positionStart <= updateOp.positionStart) {
            updateOp.positionStart += updateOp2.itemCount;
        }
        if (updateOp2.positionStart <= updateOp.itemCount) {
            updateOp.itemCount += updateOp2.itemCount;
        }
        updateOp2.positionStart += i3;
        list.set(i, updateOp2);
        list.set(i2, updateOp);
    }

    private void swapMoveOp(List<UpdateOp> list, int i, int i2) {
        UpdateOp updateOp = (UpdateOp) list.get(i);
        UpdateOp updateOp2 = (UpdateOp) list.get(i2);
        int i3 = updateOp2.cmd;
        if (i3 != 4) {
            switch (i3) {
                case 1:
                    swapMoveAdd(list, i, updateOp, i2, updateOp2);
                    return;
                case 2:
                    swapMoveRemove(list, i, updateOp, i2, updateOp2);
                    return;
                default:
                    return;
            }
        } else {
            swapMoveUpdate(list, i, updateOp, i2, updateOp2);
        }
    }

    /* access modifiers changed from: 0000 */
    public void reorderOps(List<UpdateOp> list) {
        while (true) {
            int lastMoveOutOfOrder = getLastMoveOutOfOrder(list);
            if (lastMoveOutOfOrder != -1) {
                swapMoveOp(list, lastMoveOutOfOrder, lastMoveOutOfOrder + 1);
            } else {
                return;
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void swapMoveRemove(List<UpdateOp> list, int i, UpdateOp updateOp, int i2, UpdateOp updateOp2) {
        boolean z;
        boolean z2 = false;
        if (updateOp.positionStart < updateOp.itemCount) {
            if (updateOp2.positionStart == updateOp.positionStart && updateOp2.itemCount == updateOp.itemCount - updateOp.positionStart) {
                z = false;
                z2 = true;
            } else {
                z = false;
            }
        } else if (updateOp2.positionStart == updateOp.itemCount + 1 && updateOp2.itemCount == updateOp.positionStart - updateOp.itemCount) {
            z = true;
            z2 = true;
        } else {
            z = true;
        }
        if (updateOp.itemCount < updateOp2.positionStart) {
            updateOp2.positionStart--;
        } else if (updateOp.itemCount < updateOp2.positionStart + updateOp2.itemCount) {
            updateOp2.itemCount--;
            updateOp.cmd = 2;
            updateOp.itemCount = 1;
            if (updateOp2.itemCount == 0) {
                list.remove(i2);
                this.mCallback.recycleUpdateOp(updateOp2);
            }
            return;
        }
        UpdateOp updateOp3 = null;
        if (updateOp.positionStart <= updateOp2.positionStart) {
            updateOp2.positionStart++;
        } else if (updateOp.positionStart < updateOp2.positionStart + updateOp2.itemCount) {
            updateOp3 = this.mCallback.obtainUpdateOp(2, updateOp.positionStart + 1, (updateOp2.positionStart + updateOp2.itemCount) - updateOp.positionStart, null);
            updateOp2.itemCount = updateOp.positionStart - updateOp2.positionStart;
        }
        if (z2) {
            list.set(i, updateOp2);
            list.remove(i2);
            this.mCallback.recycleUpdateOp(updateOp);
            return;
        }
        if (z) {
            if (updateOp3 != null) {
                if (updateOp.positionStart > updateOp3.positionStart) {
                    updateOp.positionStart -= updateOp3.itemCount;
                }
                if (updateOp.itemCount > updateOp3.positionStart) {
                    updateOp.itemCount -= updateOp3.itemCount;
                }
            }
            if (updateOp.positionStart > updateOp2.positionStart) {
                updateOp.positionStart -= updateOp2.itemCount;
            }
            if (updateOp.itemCount > updateOp2.positionStart) {
                updateOp.itemCount -= updateOp2.itemCount;
            }
        } else {
            if (updateOp3 != null) {
                if (updateOp.positionStart >= updateOp3.positionStart) {
                    updateOp.positionStart -= updateOp3.itemCount;
                }
                if (updateOp.itemCount >= updateOp3.positionStart) {
                    updateOp.itemCount -= updateOp3.itemCount;
                }
            }
            if (updateOp.positionStart >= updateOp2.positionStart) {
                updateOp.positionStart -= updateOp2.itemCount;
            }
            if (updateOp.itemCount >= updateOp2.positionStart) {
                updateOp.itemCount -= updateOp2.itemCount;
            }
        }
        list.set(i, updateOp2);
        if (updateOp.positionStart != updateOp.itemCount) {
            list.set(i2, updateOp);
        } else {
            list.remove(i2);
        }
        if (updateOp3 != null) {
            list.add(i, updateOp3);
        }
    }

    /* access modifiers changed from: 0000 */
    /* JADX WARNING: Removed duplicated region for block: B:10:0x0037  */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x005f  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0063  */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x006d  */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0072  */
    /* JADX WARNING: Removed duplicated region for block: B:22:? A[RETURN, SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:9:0x0031  */
    public void swapMoveUpdate(List<UpdateOp> list, int i, UpdateOp updateOp, int i2, UpdateOp updateOp2) {
        Object obj;
        UpdateOp updateOp3 = null;
        if (updateOp.itemCount < updateOp2.positionStart) {
            updateOp2.positionStart--;
        } else if (updateOp.itemCount < updateOp2.positionStart + updateOp2.itemCount) {
            updateOp2.itemCount--;
            obj = this.mCallback.obtainUpdateOp(4, updateOp.positionStart, 1, updateOp2.payload);
            if (updateOp.positionStart > updateOp2.positionStart) {
                updateOp2.positionStart++;
            } else if (updateOp.positionStart < updateOp2.positionStart + updateOp2.itemCount) {
                int i3 = (updateOp2.positionStart + updateOp2.itemCount) - updateOp.positionStart;
                updateOp3 = this.mCallback.obtainUpdateOp(4, updateOp.positionStart + 1, i3, updateOp2.payload);
                updateOp2.itemCount -= i3;
            }
            list.set(i2, updateOp);
            if (updateOp2.itemCount <= 0) {
                list.set(i, updateOp2);
            } else {
                list.remove(i);
                this.mCallback.recycleUpdateOp(updateOp2);
            }
            if (obj != null) {
                list.add(i, obj);
            }
            if (updateOp3 == null) {
                list.add(i, updateOp3);
                return;
            }
            return;
        }
        obj = null;
        if (updateOp.positionStart > updateOp2.positionStart) {
        }
        list.set(i2, updateOp);
        if (updateOp2.itemCount <= 0) {
        }
        if (obj != null) {
        }
        if (updateOp3 == null) {
        }
    }
}
