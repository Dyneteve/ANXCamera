package com.android.camera.effect.framework.graphics;

import java.util.ArrayList;
import java.util.List;

public class Splitter {
    private List<Block> mBlockList = new ArrayList();

    public List<Block> split(int i, int i2, int i3, int i4) {
        if (this.mBlockList.size() != 0) {
            this.mBlockList.clear();
        }
        int i5 = i % i3;
        int i6 = i5 == 0 ? i / i3 : (i / i3) + 1;
        int i7 = i2 % i4;
        int i8 = i7 == 0 ? i2 / i4 : (i2 / i4) + 1;
        for (int i9 = 0; i9 < i8; i9++) {
            for (int i10 = 0; i10 < i6; i10++) {
                Block block = new Block();
                block.mRowStride = i;
                block.mOffset = (i9 * i * i4) + (i10 * i3);
                int i11 = i6 - 1;
                if (i10 == i11 && i5 > 0 && i9 == i8 - 1 && i7 > 0) {
                    block.mWidth = i5;
                    block.mHeight = i7;
                    this.mBlockList.add(block);
                } else if (i10 == i11 && i5 > 0) {
                    block.mWidth = i5;
                    block.mHeight = i4;
                    this.mBlockList.add(block);
                } else if (i9 != i8 - 1 || i7 <= 0) {
                    block.mWidth = i3;
                    block.mHeight = i4;
                    this.mBlockList.add(block);
                } else {
                    block.mWidth = i3;
                    block.mHeight = i7;
                    this.mBlockList.add(block);
                }
            }
        }
        return this.mBlockList;
    }
}
