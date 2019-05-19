package com.android.camera.fragment.beauty;

import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.fragment.beauty.SingleCheckAdapter.LevelItem;
import java.util.ArrayList;
import java.util.List;

@Deprecated
public class LegacyBeautyLevelFragment extends BeautyLevelFragment {
    /* access modifiers changed from: protected */
    public int beautyLevelToPosition(int i, int i2) {
        return Util.clamp(i, 0, i2);
    }

    /* access modifiers changed from: protected */
    public List<LevelItem> initBeautyItems() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new LevelItem((int) R.drawable.ic_config_front_beauty_off));
        arrayList.add(new LevelItem((int) R.drawable.f1));
        arrayList.add(new LevelItem((int) R.drawable.f2));
        arrayList.add(new LevelItem((int) R.drawable.f3));
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public int provideItemHorizontalMargin() {
        return getResources().getDimensionPixelSize(R.dimen.legacy_beauty_level_item_margin);
    }
}
