package com.android.camera;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class SceneManager {
    public static final int SCENE_BURST = 4;
    public static final int SCENE_HDR = 2;
    public static final int SCENE_HHT = 3;
    public static final int SCENE_NORMAL = 1;
    private int[] mSceneStacks = new int[0];

    @Retention(RetentionPolicy.SOURCE)
    public @interface SceneType {
    }

    public int getCurrentScene() {
        if (this.mSceneStacks.length > 1) {
            return this.mSceneStacks[0];
        }
        return 1;
    }

    public String getSuffix() {
        switch (getCurrentScene()) {
            case 2:
                return "_HDR";
            case 3:
                return "_HHT";
            default:
                return "";
        }
    }

    public int popStacks() {
        int length = this.mSceneStacks.length;
        if (length <= 1) {
            return 1;
        }
        int i = length - 2;
        int i2 = this.mSceneStacks[i];
        int[] iArr = new int[i];
        System.arraycopy(this.mSceneStacks, 0, iArr, 0, i);
        this.mSceneStacks = iArr;
        return i2;
    }

    public void pushStacks(int i) {
        int length = this.mSceneStacks.length;
        if (length >= 1) {
            for (int i2 = 0; i2 < length; i2++) {
                if (this.mSceneStacks[i2] == i) {
                    int[] iArr = new int[length];
                    System.arraycopy(this.mSceneStacks, 0, iArr, 0, i2);
                    System.arraycopy(this.mSceneStacks, i2 + 1, iArr, i2, (length - i2) - 1);
                    iArr[length - 1] = i;
                    this.mSceneStacks = iArr;
                    return;
                }
            }
        }
        int[] iArr2 = new int[(length + 1)];
        System.arraycopy(this.mSceneStacks, 0, iArr2, 0, length);
        iArr2[length] = i;
        this.mSceneStacks = iArr2;
    }
}
