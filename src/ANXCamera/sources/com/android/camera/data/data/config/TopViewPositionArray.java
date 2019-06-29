package com.android.camera.data.data.config;

import java.util.List;

public class TopViewPositionArray {
    private static final int[][] VIEW_POSITION_ARRAY = {new int[]{10}, new int[]{0, 10}, new int[]{0, 5, 10}, new int[]{0, 3, 7, 10}, new int[]{0, 2, 5, 8, 10}, new int[]{0, 1, 4, 6, 9, 10}};

    public static SupportedConfigs fillNotUseViewPosition(List<TopConfigItem> list) {
        if (list == null) {
            return new SupportedConfigs();
        }
        SupportedConfigs supportedConfigs = new SupportedConfigs(11);
        TopConfigItem topConfigItem = new TopConfigItem(176);
        for (int i = 0; i < 11; i++) {
            supportedConfigs.add(topConfigItem);
        }
        boolean z = list.size() <= 2;
        int size = list.size();
        int[] iArr = VIEW_POSITION_ARRAY[size - 1];
        for (int i2 = 0; i2 < size; i2++) {
            TopConfigItem topConfigItem2 = (TopConfigItem) list.get(i2);
            topConfigItem2.index = i2;
            if (!z || topConfigItem2.gravity != 17) {
                topConfigItem2.bindViewPosition = iArr[i2];
            } else {
                topConfigItem2.bindViewPosition = 5;
            }
            supportedConfigs.set(topConfigItem2.bindViewPosition, topConfigItem2);
        }
        return supportedConfigs;
    }
}
