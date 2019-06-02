package com.android.camera.ui.baseview;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView.Adapter;
import java.util.ArrayList;

public abstract class BaseRecyclerAdapter<T> extends Adapter<BaseRecyclerViewHolder> {
    private ArrayList<T> mDdataList;
    private OnRecyclerItemClickListener<T> onRecyclerItemClickListener;

    public BaseRecyclerAdapter(ArrayList<T> arrayList) {
        this.mDdataList = arrayList;
    }

    public synchronized void addData(T t) {
        if (this.mDdataList == null) {
            this.mDdataList = new ArrayList<>();
        }
        int size = this.mDdataList.size();
        if (this.mDdataList.add(t)) {
            notifyItemInserted(size);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0019, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void addData(T t, int i) {
        if (this.mDdataList != null) {
            if (i <= this.mDdataList.size()) {
                this.mDdataList.add(i, t);
                notifyItemInserted(i);
            }
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

    public void onBindViewHolder(@NonNull BaseRecyclerViewHolder baseRecyclerViewHolder, int i) {
        if (this.mDdataList != null && i <= this.mDdataList.size() - 1) {
            baseRecyclerViewHolder.setData(this.mDdataList.get(i), i);
            if (this.onRecyclerItemClickListener != null) {
                baseRecyclerViewHolder.setClickListener(this.onRecyclerItemClickListener, this.mDdataList.get(i), i);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x001d, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void removeData(int i) {
        if (this.mDdataList != null && i >= 0) {
            if (i <= this.mDdataList.size() - 1) {
                this.mDdataList.remove(i);
                notifyItemRemoved(i);
            }
        }
    }

    public synchronized void setDataList(ArrayList<T> arrayList) {
        this.mDdataList.clear();
        this.mDdataList.addAll(arrayList);
        notifyDataSetChanged();
    }

    public void setOnRecyclerItemClickListener(OnRecyclerItemClickListener<T> onRecyclerItemClickListener2) {
        this.onRecyclerItemClickListener = onRecyclerItemClickListener2;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:23:0x002f, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:7:0x000b, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void updateData(int i, T t) {
        if (this.mDdataList == null) {
            if (i == 0) {
                addData(t);
            }
        } else if (i >= 0) {
            if (i <= this.mDdataList.size()) {
                if (i == this.mDdataList.size()) {
                    addData(t);
                    return;
                }
                this.mDdataList.set(i, t);
                notifyItemChanged(i);
            }
        }
    }
}
