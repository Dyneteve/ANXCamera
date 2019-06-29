package com.android.camera.data.data.runing;

import com.android.camera.R;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.TypeElements;
import com.android.camera.data.data.TypeItem;
import com.android.camera.data.data.runing.ComponentRunningShine.ShineType;
import com.android.camera2.CameraCapabilities;
import java.util.ArrayList;
import java.util.List;

public class TypeElementsBeauty extends TypeElements {
    public TypeElementsBeauty(ComponentRunningShine componentRunningShine) {
        super(componentRunningShine);
    }

    private TypeItem createTypeItem(@ShineType String str, String str2, boolean z, CameraCapabilities cameraCapabilities) {
        if (z && !supportType(str2, cameraCapabilities)) {
            return null;
        }
        char c = 65535;
        switch (str2.hashCode()) {
            case -2110473153:
                if (str2.equals("key_live_smooth_strength")) {
                    c = 25;
                    break;
                }
                break;
            case -1735290593:
                if (str2.equals("pref_beauty_body_slim_ratio")) {
                    c = 18;
                    break;
                }
                break;
            case -1584074159:
                if (str2.equals("pref_beautify_jelly_lips_ratio_key")) {
                    c = 14;
                    break;
                }
                break;
            case -1518569458:
                if (str2.equals("pref_beauty_butt_slim_ratio")) {
                    c = 22;
                    break;
                }
                break;
            case -1262324777:
                if (str2.equals("pref_beauty_whole_body_slim_ratio")) {
                    c = 21;
                    break;
                }
                break;
            case -1110975408:
                if (str2.equals("pref_beautify_smile_ratio_key")) {
                    c = 10;
                    break;
                }
                break;
            case -958841118:
                if (str2.equals("pref_beautify_eyebrow_dye_ratio_key")) {
                    c = 12;
                    break;
                }
                break;
            case -897176419:
                if (str2.equals("pref_beautify_slim_nose_ratio_key")) {
                    c = 11;
                    break;
                }
                break;
            case -335791057:
                if (str2.equals("pref_beautify_neck_ratio_key")) {
                    c = 9;
                    break;
                }
                break;
            case -310919472:
                if (str2.equals("pref_beautify_lips_ratio_key")) {
                    c = 7;
                    break;
                }
                break;
            case -271212966:
                if (str2.equals("pref_beautify_chin_ratio_key")) {
                    c = 8;
                    break;
                }
                break;
            case -146567779:
                if (str2.equals("key_beauty_leg_slim_ratio")) {
                    c = 20;
                    break;
                }
                break;
            case -39674120:
                if (str2.equals("pref_beautify_risorius_ratio_key")) {
                    c = 5;
                    break;
                }
                break;
            case 175697132:
                if (str2.equals("key_live_shrink_face_ratio")) {
                    c = 23;
                    break;
                }
                break;
            case 894643879:
                if (str2.equals("pref_beautify_slim_face_ratio_key")) {
                    c = 1;
                    break;
                }
                break;
            case 917154040:
                if (str2.equals("pref_beautify_skin_smooth_ratio_key")) {
                    c = 3;
                    break;
                }
                break;
            case 942822477:
                if (str2.equals("pref_eye_light_type_key")) {
                    c = 16;
                    break;
                }
                break;
            case 987275939:
                if (str2.equals("pref_beautify_nose_ratio_key")) {
                    c = 4;
                    break;
                }
                break;
            case 1048736236:
                if (str2.equals("pref_beautify_enlarge_eye_ratio_key")) {
                    c = 2;
                    break;
                }
                break;
            case 1057690737:
                if (str2.equals("pref_beautify_skin_color_ratio_key")) {
                    c = 0;
                    break;
                }
                break;
            case 1427427765:
                if (str2.equals("pref_beautify_blusher_ratio_key")) {
                    c = 15;
                    break;
                }
                break;
            case 1644342645:
                if (str2.equals("pref_beautify_pupil_line_ratio_key")) {
                    c = 13;
                    break;
                }
                break;
            case 1659922406:
                if (str2.equals("pref_beautify_hairline_ratio_key")) {
                    c = 6;
                    break;
                }
                break;
            case 1709402593:
                if (str2.equals("pref_beauty_shoulder_slim_ratio")) {
                    c = 19;
                    break;
                }
                break;
            case 1771202045:
                if (str2.equals("key_live_enlarge_eye_ratio")) {
                    c = 24;
                    break;
                }
                break;
            case 1945143841:
                if (str2.equals("pref_beauty_head_slim_ratio")) {
                    c = 17;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return new TypeItem(R.drawable.icon_skin_white_n, R.string.edit_skin_white, str, str2);
            case 1:
                return new TypeItem(R.drawable.icon_face_slender_n, R.string.edit_face_slender, str, str2);
            case 2:
                return new TypeItem(R.drawable.icon_eye_large_n, R.string.edit_eye_large, str, str2);
            case 3:
                return new TypeItem(R.drawable.icon_smooth_n, R.string.edit_skin_smooth, str, str2);
            case 4:
                return new TypeItem(R.drawable.icon_nose_n, R.string.edit_nose, str, str2);
            case 5:
                return new TypeItem(R.drawable.icon_risorius_n, R.string.edit_risorius, str, str2);
            case 6:
                return new TypeItem(R.drawable.icon_hair_n, R.string.edit_hairline, str, str2);
            case 7:
                return new TypeItem(R.drawable.icon_lips_n, R.string.edit_lips, str, str2);
            case 8:
                return new TypeItem(R.drawable.icon_chin_n, R.string.edit_chin, str, str2);
            case 9:
                return new TypeItem(R.drawable.icon_neck_n, R.string.edit_neck, str, str2);
            case 10:
                return new TypeItem(R.drawable.icon_skin_white_n, R.string.edit_smile, str, str2);
            case 11:
                return new TypeItem(R.drawable.icon_slim_nose_n, R.string.edit_slim_nose, str, str2);
            case 12:
                return new TypeItem(R.drawable.icon_eyebrow_dye_n, R.string.edit_eyebrow_dye, str, str2);
            case 13:
                return new TypeItem(R.drawable.icon_pupil_line_n, R.string.edit_pupil_line, str, str2);
            case 14:
                return new TypeItem(R.drawable.icon_jelly_lips_n, R.string.edit_jelly_lips, str, str2);
            case 15:
                return new TypeItem(R.drawable.icon_blusher_n, R.string.edit_blusher, str, str2);
            case 16:
                return new TypeItem(R.drawable.icon_eye_light, R.string.eye_light, str, str2);
            case 17:
                return new TypeItem(R.drawable.icon_head_slim, R.string.beauty_body_head, str, str2);
            case 18:
                return new TypeItem(R.drawable.icon_body_slim, R.string.beauty_body_body, str, str2);
            case 19:
                return new TypeItem(R.drawable.icon_shoulder_slim, R.string.beauty_body_shoulder, str, str2);
            case 20:
                return new TypeItem(R.drawable.icon_leg_slim, R.string.beauty_body_legged, str, str2);
            case 21:
                return new TypeItem(R.drawable.icon_whole_body_slim, R.string.beauty_body_whole, str, str2);
            case 22:
                return null;
            case 23:
                return new TypeItem(R.drawable.icon_face_slender_n, R.string.edit_face_slender, str, str2);
            case 24:
                return new TypeItem(R.drawable.icon_eye_large_n, R.string.edit_eye_large, str, str2);
            case 25:
                return new TypeItem(R.drawable.icon_smooth_n, R.string.edit_skin_smooth, str, str2);
            default:
                throw new RuntimeException("to be continued");
        }
    }

    private void initAdvanceItems(List<TypeItem> list, int i, CameraCapabilities cameraCapabilities, ComponentRunningShine componentRunningShine) {
        initItemsBySupportedTypes("3", BeautyConstant.BEAUTY_CATEGORY_FRONT_ADVANCE, list, true, cameraCapabilities);
    }

    private void initFigureItems(List<TypeItem> list, int i, CameraCapabilities cameraCapabilities, ComponentRunningShine componentRunningShine) {
        initItemsBySupportedTypes("6", BeautyConstant.BEAUTY_CATEGORY_BACK_FIGURE, list, true, cameraCapabilities);
        if (componentRunningShine.isSmoothDependBeautyVersion()) {
            TypeItem createTypeItem = createTypeItem("4", "pref_beautify_skin_smooth_ratio_key", true, cameraCapabilities);
            if (createTypeItem != null) {
                list.add(0, createTypeItem);
            }
        }
    }

    private void initItemsBySupportedTypes(@ShineType String str, String[] strArr, List<TypeItem> list, boolean z, CameraCapabilities cameraCapabilities) {
        for (String createTypeItem : strArr) {
            TypeItem createTypeItem2 = createTypeItem(str, createTypeItem, z, cameraCapabilities);
            if (createTypeItem2 != null) {
                list.add(createTypeItem2);
            }
        }
    }

    private void initLiveBeautyItems(List<TypeItem> list, int i, CameraCapabilities cameraCapabilities, ComponentRunningShine componentRunningShine) {
        initItemsBySupportedTypes(ComponentRunningShine.SHINE_LIVE_BEAUTY, BeautyConstant.BEAUTY_CATEGORY_LIVE, list, false, cameraCapabilities);
    }

    private void initMakeUpItems(List<TypeItem> list, int i, CameraCapabilities cameraCapabilities, ComponentRunningShine componentRunningShine) {
        String[] strArr;
        for (String str : BeautyConstant.BEAUTY_CATEGORY_FRONT_MAKEUP) {
            TypeItem typeItem = null;
            char c = 65535;
            if (str.hashCode() == 942822477 && str.equals("pref_eye_light_type_key")) {
                c = 0;
            }
            if (c != 0) {
                typeItem = createTypeItem("5", str, true, cameraCapabilities);
            } else if (i == 1 && DataRepository.dataItemFeature().gi()) {
                typeItem = createTypeItem("5", str, false, cameraCapabilities);
            }
            if (typeItem != null) {
                list.add(typeItem);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x003c, code lost:
        if (r5.equals("pref_beautify_hairline_ratio_key") == false) goto L_0x0049;
     */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x004e  */
    /* JADX WARNING: Removed duplicated region for block: B:17:0x0052  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x0055 A[SYNTHETIC] */
    private void initReModelingItems(List<TypeItem> list, int i, CameraCapabilities cameraCapabilities, ComponentRunningShine componentRunningShine) {
        initItemsBySupportedTypes("4", BeautyConstant.BEAUTY_CATEGORY_FRONT_REMODELING, list, true, cameraCapabilities);
        if (componentRunningShine.isSmoothDependBeautyVersion()) {
            int size = list.size();
            int i2 = 0;
            int i3 = -1;
            int i4 = -1;
            while (true) {
                boolean z = true;
                if (i2 < size) {
                    String str = ((TypeItem) list.get(i2)).mKeyOrType;
                    int hashCode = str.hashCode();
                    if (hashCode != -39674120) {
                        if (hashCode == 1659922406) {
                        }
                    } else if (str.equals("pref_beautify_risorius_ratio_key")) {
                        z = false;
                        switch (z) {
                            case false:
                                i4 = i2;
                                break;
                            case true:
                                i3 = i2;
                                break;
                        }
                        i2++;
                    }
                    z = true;
                    switch (z) {
                        case false:
                            break;
                        case true:
                            break;
                    }
                    i2++;
                } else {
                    if (!(i3 == -1 || i4 == -1)) {
                        list.remove(i4);
                    }
                    TypeItem createTypeItem = createTypeItem("4", "pref_beautify_skin_smooth_ratio_key", true, cameraCapabilities);
                    if (createTypeItem != null) {
                        list.add(0, createTypeItem);
                        return;
                    }
                    return;
                }
            }
        }
    }

    private boolean supportType(String str, CameraCapabilities cameraCapabilities) {
        if (str == null) {
            return false;
        }
        return cameraCapabilities.isSupportBeautyType(str);
    }

    public List<TypeItem> initAndGetSupportItems(int i, CameraCapabilities cameraCapabilities, @ShineType String str) {
        ComponentRunningShine componentRunningShine = (ComponentRunningShine) this.mComponentData;
        ArrayList arrayList = new ArrayList();
        char c = 65535;
        int hashCode = str.hashCode();
        if (hashCode != 1568) {
            switch (hashCode) {
                case 51:
                    if (str.equals("3")) {
                        c = 0;
                        break;
                    }
                    break;
                case 52:
                    if (str.equals("4")) {
                        c = 1;
                        break;
                    }
                    break;
                case 53:
                    if (str.equals("5")) {
                        c = 2;
                        break;
                    }
                    break;
                case 54:
                    if (str.equals("6")) {
                        c = 3;
                        break;
                    }
                    break;
            }
        } else if (str.equals(ComponentRunningShine.SHINE_LIVE_BEAUTY)) {
            c = 4;
        }
        switch (c) {
            case 0:
                initAdvanceItems(arrayList, i, cameraCapabilities, componentRunningShine);
                break;
            case 1:
                initReModelingItems(arrayList, i, cameraCapabilities, componentRunningShine);
                break;
            case 2:
                initMakeUpItems(arrayList, i, cameraCapabilities, componentRunningShine);
                break;
            case 3:
                initFigureItems(arrayList, i, cameraCapabilities, componentRunningShine);
                break;
            case 4:
                initLiveBeautyItems(arrayList, i, cameraCapabilities, componentRunningShine);
                break;
            default:
                throw new RuntimeException("to be continued");
        }
        return arrayList;
    }
}
