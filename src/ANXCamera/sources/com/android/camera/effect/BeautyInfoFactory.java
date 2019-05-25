package com.android.camera.effect;

import com.miui.filtersdk.filter.helper.FilterFactory;
import com.miui.filtersdk.filter.helper.FilterFactory.FilterScene;
import com.miui.filtersdk.filter.helper.FilterType;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.Collections;

public class BeautyInfoFactory {
    public static int getFilterDegree(FilterType filterType) {
        int i = AnonymousClass1.$SwitchMap$com$miui$filtersdk$filter$helper$FilterType[filterType.ordinal()];
        if (i == 1) {
            return 70;
        }
        switch (i) {
            case 25:
                return 60;
            case 26:
                return 70;
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
                return 80;
            default:
                return 100;
        }
    }

    public static int getIndiaFilterDegree(FilterType filterType) {
        int i = AnonymousClass1.$SwitchMap$com$miui$filtersdk$filter$helper$FilterType[filterType.ordinal()];
        if (i == 13 || i == 16) {
            return 80;
        }
        switch (i) {
            case 25:
                return 60;
            case 26:
                return 70;
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
                return 80;
            case 33:
                return 70;
            default:
                return 100;
        }
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
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        ArrayList<FilterInfo> arrayList = new ArrayList<>();
        arrayList.add(new FilterInfo(FilterInfo.FILTER_ID_NONE, R.string.pref_camera_coloreffect_entry_none, R.drawable.portrait_india_effect_image_none, 0));
        FilterType[] filtersByScene = FilterFactory.getFiltersByScene(FilterScene.BEAUTY_INDIA);
        int length = filtersByScene.length;
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        int i9 = 0;
        while (i6 < length) {
            FilterType filterType = filtersByScene[i6];
            switch (filterType) {
                case BI_SUNNY:
                    i3 = 10;
                    i5 = R.string.portrait_india_effect_entry_sunny;
                    i4 = R.drawable.portrait_india_effect_image_sunny;
                    break;
                case BI_PINK:
                    i3 = 20;
                    i5 = R.string.portrait_india_effect_entry_pink;
                    i4 = R.drawable.portrait_india_effect_image_pink;
                    break;
                case BI_MEMORY:
                    i3 = 30;
                    i5 = R.string.portrait_india_effect_entry_memory;
                    i4 = R.drawable.portrait_india_effect_image_memory;
                    break;
                case BI_STRONG:
                    i3 = 40;
                    i5 = R.string.portrait_india_effect_entry_strong;
                    i4 = R.drawable.portrait_india_effect_image_strong;
                    break;
                case BI_WARM:
                    i3 = 50;
                    i5 = R.string.portrait_india_effect_entry_warm;
                    i4 = R.drawable.portrait_india_effect_image_warm;
                    break;
                case BI_RETRO:
                    i3 = 80;
                    i5 = R.string.portrait_india_effect_entry_retro;
                    i4 = R.drawable.portrait_india_effect_image_retro;
                    break;
                case BI_ROMANTIC:
                    i3 = 100;
                    i5 = R.string.portrait_india_effect_entry_romantic;
                    i4 = R.drawable.portrait_india_effect_image_romantic;
                    break;
                case BI_M_DUSK:
                    i3 = 120;
                    i5 = R.string.portait_effect_entry_dusk;
                    i4 = R.drawable.portrait_india_effect_image_m_dusk;
                    break;
                case BI_M_LILT:
                    i3 = 130;
                    i5 = R.string.portait_effect_entry_lilt;
                    i4 = R.drawable.portrait_india_effect_image_m_lilt;
                    break;
                case BI_M_TEA:
                    i3 = 140;
                    i5 = R.string.portait_effect_entry_tea;
                    i4 = R.drawable.portrait_india_effect_image_m_tea;
                    break;
                case BI_M_SEPIA:
                    i3 = 150;
                    i5 = R.string.portait_effect_entry_sepia;
                    i4 = R.drawable.portrait_india_effect_image_m_sepia;
                    break;
                case BI_M_WHITEANDBLACK:
                    i3 = 160;
                    i5 = R.string.portait_effect_entry_blackwhite;
                    i4 = R.drawable.portrait_india_effect_image_m_blackwhite;
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
}
