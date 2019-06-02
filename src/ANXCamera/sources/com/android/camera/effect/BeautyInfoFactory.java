package com.android.camera.effect;

import com.android.camera.R;
import com.miui.filtersdk.filter.helper.FilterFactory;
import com.miui.filtersdk.filter.helper.FilterFactory.FilterScene;
import com.miui.filtersdk.filter.helper.FilterType;
import java.util.ArrayList;
import java.util.Collections;

public class BeautyInfoFactory {
    public static int getFilterDegree(FilterType filterType) {
        int i = AnonymousClass1.$SwitchMap$com$miui$filtersdk$filter$helper$FilterType[filterType.ordinal()];
        if (i == 1) {
            return 70;
        }
        switch (i) {
            case 13:
                return 60;
            case 14:
                return 70;
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
                return 80;
            default:
                return 100;
        }
    }

    public static int getIndiaFilterDegree(FilterType filterType) {
        return 100;
    }

    public static ArrayList<FilterInfo> initBeautyFilterInfo() {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        ArrayList<FilterInfo> arrayList = new ArrayList<>();
        arrayList.add(new FilterInfo(FilterInfo.FILTER_ID_NONE, R.string.pref_camera_coloreffect_entry_none, R.drawable.portait_effect_image_none, 0));
        FilterType[] filtersByScene = FilterFactory.getFiltersByScene(FilterScene.BEAUTY);
        int length = filtersByScene.length;
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        int i9 = 0;
        while (i6 < length) {
            FilterType filterType = filtersByScene[i6];
            switch (filterType) {
                case B_NATURE:
                    i3 = 10;
                    i5 = R.string.portait_effect_entry_nature;
                    i4 = R.drawable.portait_effect_image_nature;
                    break;
                case B_JAPANESE:
                    i3 = 20;
                    i5 = R.string.portait_effect_entry_japanese;
                    i4 = R.drawable.portait_effect_image_japanese;
                    break;
                case B_PINK:
                    i3 = 30;
                    i5 = R.string.portait_effect_entry_pink;
                    i4 = R.drawable.portait_effect_image_pink;
                    break;
                case B_STORY:
                    i3 = 40;
                    i5 = R.string.portait_effect_entry_story;
                    i4 = R.drawable.portait_effect_image_story;
                    break;
                case B_FAIRYTALE:
                    i3 = 50;
                    i5 = R.string.portait_effect_entry_fairytale;
                    i4 = R.drawable.portait_effect_image_fairytale;
                    break;
                case B_MAZE:
                    i3 = 80;
                    i5 = R.string.portait_effect_entry_maze;
                    i4 = R.drawable.portait_effect_image_maze;
                    break;
                case B_RIDDLE:
                    i3 = 100;
                    i5 = R.string.portait_effect_entry_riddle;
                    i4 = R.drawable.portait_effect_image_riddle;
                    break;
                case B_MOVIE:
                    i3 = 110;
                    i5 = R.string.portait_effect_entry_movie;
                    i4 = R.drawable.portait_effect_image_movie;
                    break;
                case B_M_TEA:
                    i3 = 120;
                    i5 = R.string.portait_effect_entry_tea;
                    i4 = R.drawable.portait_effect_image_m_tea;
                    break;
                case B_M_LILT:
                    i3 = 130;
                    i5 = R.string.portait_effect_entry_lilt;
                    i4 = R.drawable.portait_effect_image_m_lilt;
                    break;
                case B_M_SEPIA:
                    i3 = 140;
                    i5 = R.string.portait_effect_entry_sepia;
                    i4 = R.drawable.portait_effect_image_m_sepia;
                    break;
                case B_M_WHITEANDBLACK:
                    i3 = 150;
                    i5 = R.string.portait_effect_entry_blackwhite;
                    i4 = R.drawable.portait_effect_image_m_blackwhite;
                    break;
                default:
                    i2 = i7;
                    i = i8;
                    i3 = i9;
                    break;
            }
            i2 = i5;
            i = i4;
            if (i2 == 0 || i == 0) {
                i8 = i;
            } else {
                FilterInfo filterInfo = new FilterInfo(2, filterType.ordinal(), i2, i, i3);
                arrayList.add(filterInfo);
                i8 = 0;
                i2 = 0;
            }
            i6++;
            i9 = i3;
            i7 = i2;
        }
        Collections.sort(arrayList);
        return arrayList;
    }

    public static ArrayList<FilterInfo> initIndiaBeautyFilterInfo() {
        return new ArrayList<>();
    }
}
