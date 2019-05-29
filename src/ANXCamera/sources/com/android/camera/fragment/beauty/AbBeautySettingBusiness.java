package com.android.camera.fragment.beauty;

import android.text.TextUtils;
import com.android.camera.CameraSettings;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.TypeItem;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.ComponentRunningShine.ShineType;
import com.android.camera.data.data.runing.TypeElementsBeauty;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AbBeautySettingBusiness implements IBeautySettingBusiness {
    private static final String TAG = AbBeautySettingBusiness.class.getSimpleName();
    @ShineType
    private String mBeautyType;
    private String mCurrentBeautyItemType;
    private Map<String, Integer> mExtraTable = new HashMap();
    private List<TypeItem> mSupportedTypeItems;

    public AbBeautySettingBusiness(@ShineType String str, TypeElementsBeauty typeElementsBeauty) {
        this.mBeautyType = str;
        initBeauty(this.mBeautyType, typeElementsBeauty);
    }

    private String getBeautyType() {
        return this.mBeautyType;
    }

    private void initBeauty(String str, TypeElementsBeauty typeElementsBeauty) {
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        int currentCameraId = dataItemGlobal.getCurrentCameraId();
        this.mSupportedTypeItems = typeElementsBeauty.initAndGetSupportItems(currentCameraId, Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(currentCameraId, dataItemGlobal.getCurrentMode()), str);
        this.mCurrentBeautyItemType = ((TypeItem) getSupportedTypeArray(getBeautyType()).get(0)).mKeyOrType;
    }

    public void clearBeauty() {
        for (TypeItem typeItem : getSupportedTypeArray(getBeautyType())) {
            String str = typeItem.mKeyOrType;
            CameraSettings.setFaceBeautyRatio(str, 0);
            this.mExtraTable.put(str, Integer.valueOf(0));
        }
        BeautyHelper.onBeautyChanged();
    }

    public int getDefaultProgressByCurrentItem() {
        return getProgressDefValue(this.mCurrentBeautyItemType);
    }

    public int getProgressByCurrentItem() {
        return this.mExtraTable.get(this.mCurrentBeautyItemType) == null ? getProgressDefValue(this.mCurrentBeautyItemType) : ((Integer) this.mExtraTable.get(this.mCurrentBeautyItemType)).intValue();
    }

    /* access modifiers changed from: protected */
    public int getProgressDefValue(String str) {
        return BeautyConstant.getDefaultValueByKey(str);
    }

    public List<TypeItem> getSupportedTypeArray(String str) {
        return this.mSupportedTypeItems;
    }

    public Object operate(Object obj) {
        return null;
    }

    public void resetBeauty() {
        for (TypeItem typeItem : getSupportedTypeArray(getBeautyType())) {
            String str = typeItem.mKeyOrType;
            int progressDefValue = getProgressDefValue(str);
            this.mExtraTable.put(str, Integer.valueOf(progressDefValue));
            CameraSettings.setFaceBeautyRatio(str, progressDefValue);
        }
        BeautyHelper.onBeautyChanged();
    }

    public void setCurrentType(String str) {
        this.mCurrentBeautyItemType = str;
    }

    public void setProgressForCurrentItem(int i) {
        int intValue = this.mExtraTable.get(this.mCurrentBeautyItemType) == null ? 0 : ((Integer) this.mExtraTable.get(this.mCurrentBeautyItemType)).intValue();
        this.mExtraTable.put(this.mCurrentBeautyItemType, Integer.valueOf(i));
        String str = this.mCurrentBeautyItemType;
        if (intValue != i || i == getProgressDefValue(str)) {
            CameraSettings.setFaceBeautyRatio(str, i);
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onBeautyParameterChanged: ");
            sb.append(str);
            sb.append("=");
            sb.append(i);
            Log.v(str2, sb.toString());
            BeautyHelper.onBeautyChanged();
        }
    }

    public void updateExtraTable() {
        for (TypeItem typeItem : getSupportedTypeArray(getBeautyType())) {
            int i = 0;
            String str = typeItem.mKeyOrType;
            if (!TextUtils.isEmpty(str)) {
                i = CameraSettings.getFaceBeautyRatio(str);
            }
            this.mExtraTable.put(str, Integer.valueOf(i));
        }
    }
}
