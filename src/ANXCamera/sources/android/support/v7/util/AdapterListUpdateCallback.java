package android.support.v7.util;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView.Adapter;

public final class AdapterListUpdateCallback implements ListUpdateCallback {
    @NonNull
    private final Adapter mAdapter;

    public AdapterListUpdateCallback(@NonNull Adapter adapter) {
        this.mAdapter = adapter;
    }

    public void onChanged(int i, int i2, Object obj) {
        this.mAdapter.notifyItemRangeChanged(i, i2, obj);
    }

    public void onInserted(int i, int i2) {
        this.mAdapter.notifyItemRangeInserted(i, i2);
    }

    public void onMoved(int i, int i2) {
        this.mAdapter.notifyItemMoved(i, i2);
    }

    public void onRemoved(int i, int i2) {
        this.mAdapter.notifyItemRangeRemoved(i, i2);
    }
}
