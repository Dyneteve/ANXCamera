package com.android.camera.fragment.beauty;

import com.android.camera.data.data.runing.ComponentRunningShine.ShineType;
import com.android.camera.data.data.runing.TypeElementsBeauty;
import java.util.HashMap;
import java.util.Map;

public class BeautySettingManager {
    private static final String TAG = BeautySettingManager.class.getSimpleName();
    private HashMap<String, IBeautySettingBusiness> mBeautySettingBusinessArray = new HashMap<>();
    @ShineType
    private String mBeautyType;
    private IBeautySettingBusiness mCurrentBeautySetting;

    private IBeautySettingBusiness updateBeautySettingBusiness(@ShineType String str, TypeElementsBeauty typeElementsBeauty, Map<String, IBeautySettingBusiness> map) {
        if (map.get(str) != null) {
            return (IBeautySettingBusiness) map.get(str);
        }
        AbBeautySettingBusiness abBeautySettingBusiness = new AbBeautySettingBusiness(str, typeElementsBeauty);
        map.put(this.mBeautyType, abBeautySettingBusiness);
        return abBeautySettingBusiness;
    }

    public IBeautySettingBusiness constructAndGetSetting(@ShineType String str, TypeElementsBeauty typeElementsBeauty) {
        this.mBeautyType = str;
        this.mCurrentBeautySetting = updateBeautySettingBusiness(str, typeElementsBeauty, this.mBeautySettingBusinessArray);
        return this.mCurrentBeautySetting;
    }

    public IBeautySettingBusiness getCurrentBeautySettingBusiness() {
        return this.mCurrentBeautySetting;
    }
}
