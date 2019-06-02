package com.android.camera.ui.baseview;

import android.content.Context;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView.Recycler;
import android.support.v7.widget.RecyclerView.State;
import android.util.AttributeSet;
import com.android.camera.log.Log;

public class BaseGridLayoutManager extends GridLayoutManager {
    public BaseGridLayoutManager(Context context, int i) {
        super(context, i);
    }

    public BaseGridLayoutManager(Context context, int i, int i2, boolean z) {
        super(context, i, i2, z);
    }

    public BaseGridLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
    }

    public void onLayoutChildren(Recycler recycler, State state) {
        try {
            BaseGridLayoutManager.super.onLayoutChildren(recycler, state);
        } catch (IndexOutOfBoundsException e) {
            Log.i("BaseGridLayoutManager", "IndexOutOfBoundsException ");
        }
    }
}
