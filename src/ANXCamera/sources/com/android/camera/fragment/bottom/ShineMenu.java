package com.android.camera.fragment.bottom;

import android.content.Context;
import android.util.SparseArray;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.LinearLayout;
import com.android.camera.fragment.beauty.MenuItem;
import com.android.camera.ui.ColorActivateTextView;

public class ShineMenu extends AbBottomMenu implements OnClickListener {
    public ShineMenu(Context context, LinearLayout linearLayout, BeautyMenuAnimator beautyMenuAnimator) {
        super(context, linearLayout, beautyMenuAnimator);
    }

    /* access modifiers changed from: 0000 */
    public void addAllView() {
    }

    /* access modifiers changed from: 0000 */
    public SparseArray<ColorActivateTextView> getChildMenuViewList() {
        return null;
    }

    /* access modifiers changed from: 0000 */
    public int getDefaultType() {
        return 0;
    }

    /* access modifiers changed from: 0000 */
    public SparseArray<MenuItem> getMenuData() {
        return null;
    }

    /* access modifiers changed from: 0000 */
    public boolean isRefreshUI() {
        return false;
    }

    public void onClick(View view) {
    }

    /* access modifiers changed from: 0000 */
    public void switchMenu() {
    }
}
