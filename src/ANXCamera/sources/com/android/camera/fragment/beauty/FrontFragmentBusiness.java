package com.android.camera.fragment.beauty;

import android.support.v4.app.Fragment;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.mi.config.b;
import java.util.ArrayList;
import java.util.List;

@Deprecated
public class FrontFragmentBusiness extends AbBeautyFragmentBusiness {
    List<Fragment> mFragments;

    public List<Fragment> getCurrentShowFragmentList() {
        if (this.mFragments == null) {
            this.mFragments = new ArrayList();
        } else {
            this.mFragments.clear();
        }
        if (b.iz()) {
            this.mFragments.add(new BeautyLevelFragment());
        } else {
            this.mFragments.add(new BeautyLevelFragment());
            this.mFragments.add(new MakeupParamsFragment());
        }
        if (DataRepository.dataItemFeature().fw() && CameraSettings.isSupportBeautyMakeup()) {
            this.mFragments.add(new MakeupBeautyFragment());
        }
        return this.mFragments;
    }
}
