package com.android.camera.ui.autoselectview;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import com.android.camera.ui.autoselectview.SelectItemBean;

public abstract class AutoSelectViewHolder<T extends SelectItemBean> extends ViewHolder {
    public AutoSelectViewHolder(@NonNull View view) {
        super(view);
    }

    public abstract void setData(T t, int i);
}
