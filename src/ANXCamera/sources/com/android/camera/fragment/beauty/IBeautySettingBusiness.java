package com.android.camera.fragment.beauty;

import com.android.camera.data.data.TypeItem;
import com.android.camera.data.data.runing.ComponentRunningShine.ShineType;
import java.util.List;

public interface IBeautySettingBusiness extends IBeautyBusiness {
    void clearBeauty();

    int getDefaultProgressByCurrentItem();

    int getProgressByCurrentItem();

    List<TypeItem> getSupportedTypeArray(@ShineType String str);

    void resetBeauty();

    void setCurrentType(String str);

    void setProgressForCurrentItem(int i);

    void updateExtraTable();
}
