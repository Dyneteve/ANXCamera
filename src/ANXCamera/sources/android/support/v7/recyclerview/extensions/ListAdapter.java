package android.support.v7.recyclerview.extensions;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.recyclerview.extensions.AsyncDifferConfig.Builder;
import android.support.v7.util.AdapterListUpdateCallback;
import android.support.v7.util.DiffUtil.ItemCallback;
import android.support.v7.util.ListUpdateCallback;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import java.util.List;

public abstract class ListAdapter<T, VH extends ViewHolder> extends Adapter<VH> {
    private final AsyncListDiffer<T> mHelper;

    protected ListAdapter(@NonNull AsyncDifferConfig<T> asyncDifferConfig) {
        this.mHelper = new AsyncListDiffer<>((ListUpdateCallback) new AdapterListUpdateCallback(this), asyncDifferConfig);
    }

    protected ListAdapter(@NonNull ItemCallback<T> itemCallback) {
        this.mHelper = new AsyncListDiffer<>((ListUpdateCallback) new AdapterListUpdateCallback(this), new Builder(itemCallback).build());
    }

    /* access modifiers changed from: protected */
    public T getItem(int i) {
        return this.mHelper.getCurrentList().get(i);
    }

    public int getItemCount() {
        return this.mHelper.getCurrentList().size();
    }

    public void submitList(@Nullable List<T> list) {
        this.mHelper.submitList(list);
    }
}
