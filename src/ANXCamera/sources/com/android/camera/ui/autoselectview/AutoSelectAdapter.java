package com.android.camera.ui.autoselectview;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView.Adapter;
import com.android.camera.ui.autoselectview.SelectItemBean;
import java.util.ArrayList;

public abstract class AutoSelectAdapter<T extends SelectItemBean> extends Adapter<AutoSelectViewHolder> implements OnPositionChangedListener {
    private ArrayList<T> mDdataList;
    private int mLastMiddlePosition = 0;
    private int mLastSelectPosition = -1;

    public AutoSelectAdapter(ArrayList<T> arrayList) {
        this.mDdataList = arrayList;
    }

    public synchronized void addData(T t) {
        if (this.mDdataList != null) {
            this.mDdataList.add(t);
            notifyItemInserted(getItemCount());
        }
    }

    public ArrayList<T> getDataList() {
        return this.mDdataList;
    }

    public int getItemCount() {
        if (this.mDdataList == null) {
            return 0;
        }
        return this.mDdataList.size();
    }

    public int getLastSelectPosition() {
        return this.mLastSelectPosition;
    }

    public void onBindViewHolder(@NonNull AutoSelectViewHolder autoSelectViewHolder, int i) {
        autoSelectViewHolder.setData((SelectItemBean) this.mDdataList.get(i), i);
    }

    public void onMoveMiddlePoisionChanged(int i) {
        if (this.mLastMiddlePosition != i) {
            updateDataAlpha(this.mLastMiddlePosition, 0);
            updateDataAlpha(i, 1);
            this.mLastMiddlePosition = i;
        }
    }

    public void onSelectedPositionChanged(int i) {
        if (this.mLastMiddlePosition != i) {
            updateDataAlpha(this.mLastMiddlePosition, 0);
        }
        if (this.mLastSelectPosition == i && this.mLastSelectPosition != this.mLastMiddlePosition) {
            updateDataAlpha(this.mLastSelectPosition, 0);
            updateDataAlpha(i, 1);
        }
        if (this.mLastSelectPosition != i) {
            updateDataAlpha(this.mLastSelectPosition, 0);
            updateDataAlpha(i, 1);
            this.mLastSelectPosition = i;
            onSelectedPositionFinish(i);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x001b, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void removeData(int i) {
        if (this.mDdataList != null && i >= 0) {
            if (i <= getItemCount() - 1) {
                this.mDdataList.remove(i);
                notifyItemRemoved(i);
            }
        }
    }

    public synchronized void setDataList(ArrayList<T> arrayList) {
        this.mDdataList = arrayList;
        this.mLastSelectPosition = -1;
        this.mLastMiddlePosition = 0;
        notifyDataSetChanged();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x001b, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void updateData(int i, T t) {
        if (this.mDdataList != null && i >= 0) {
            if (i <= getItemCount() - 1) {
                this.mDdataList.set(i, t);
                notifyItemChanged(i);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x0021, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void updateDataAlpha(int i, int i2) {
        if (this.mDdataList != null && i >= 0) {
            if (i <= getItemCount() - 1) {
                ((SelectItemBean) this.mDdataList.get(i)).setAlpha(i2);
                notifyItemChanged(i);
            }
        }
    }
}
