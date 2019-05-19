package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.ViewGroup.LayoutParams;
import android.view.WindowManager;
import android.widget.GridView;

public class MeatureViewHeightWeight {
    public static void setGridViewHeightBasedOnChildren(Context context, GridView gridView, int i) {
        if (gridView.getAdapter() != null) {
            WindowManager windowManager = (WindowManager) context.getSystemService("window");
            DisplayMetrics displayMetrics = new DisplayMetrics();
            windowManager.getDefaultDisplay().getMetrics(displayMetrics);
            LayoutParams layoutParams = gridView.getLayoutParams();
            layoutParams.height = 272 * (i % 3 != 0 ? (i / 3) + 1 : i / 3);
            layoutParams.width = displayMetrics.widthPixels;
            gridView.setLayoutParams(layoutParams);
        }
    }
}
