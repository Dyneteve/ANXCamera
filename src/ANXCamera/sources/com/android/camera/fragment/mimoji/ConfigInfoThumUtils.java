package com.android.camera.fragment.mimoji;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import com.arcsoft.avatar.AvatarEngine;
import com.arcsoft.avatar.util.LOG;
import com.arcsoft.avatar.util.NotifyMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;

public class ConfigInfoThumUtils {
    private static final String TAG = "ConfigInfoThumUtils";
    private final int[] mBeardStyleRegion = {522, 628, 160, 326, 200, 200};
    private final int[] mEarShapeRegion = {1031, 1240, 179, 543, 200, 200};
    private final int[] mEyeBrowSharpRegion = {NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER, 635, 164, 209, 200, 200};
    private final int[] mEyeSharpRegion = {NotifyMessage.MSG_MEDIA_RECORDER_ERROR_ENCODER, 635, 164, 209, 200, 200};
    private ArrayList<ASAvatarConfigInfo> mEyeWearList;
    private final int[] mEyeWearStyleRegin = {261, 314, 35, 40, 200, 200};
    private final int[] mEyelashStyleRegion = {1306, 1570, 389, 668, 200, 200};
    private final int[] mFaceSharpRegion = {261, 314, 35, 40, 200, 200};
    private final int[] mFrecklesRegion = {601, 723, 201, 274, 200, 200};
    private ArrayList<ASAvatarConfigInfo> mHairList;
    private final int[] mHairStyleRegion = {251, 303, 25, 35, 200, 200};
    private final int[] mHeadWearStyleRegion = {261, 314, 35, 30, 200, 200};
    private final int[] mMouthSharpRegion = {1198, 1442, 499, 784, 200, 200};
    private final int[] mNevusRegion = {601, 723, 201, 274, 200, 200};
    private boolean mNoEyeWear = false;
    private boolean mNoHair = false;
    private final int[] mNoseShapeRegion = {737, 887, 270, 378, 200, 200};
    private int[] mTempRegion = new int[6];
    private final int[] mnNormalRegion = {200, 200, 0, 0, 200, 200};

    public void renderThumb(AvatarEngine avatarEngine, ASAvatarConfigInfo aSAvatarConfigInfo, int i, float[] fArr) {
        AvatarEngine avatarEngine2 = avatarEngine;
        ASAvatarConfigInfo aSAvatarConfigInfo2 = aSAvatarConfigInfo;
        int i2 = i;
        this.mNoHair = false;
        this.mNoEyeWear = false;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("configType : ");
        sb.append(aSAvatarConfigInfo2.configType);
        LOG.d(str, sb.toString());
        int i3 = aSAvatarConfigInfo2.configType;
        if (i3 == 1) {
            this.mTempRegion = this.mHairStyleRegion;
        } else if (i3 == 12) {
            this.mTempRegion = this.mHeadWearStyleRegion;
        } else if (i3 == 14) {
            this.mTempRegion = this.mBeardStyleRegion;
            this.mNoEyeWear = true;
        } else if (i3 == 17) {
            this.mTempRegion = this.mEyelashStyleRegion;
            this.mNoEyeWear = true;
        } else if (i3 != 24) {
            switch (i3) {
                case 7:
                    this.mTempRegion = this.mFrecklesRegion;
                    this.mNoEyeWear = true;
                    break;
                case 8:
                    this.mTempRegion = this.mNevusRegion;
                    this.mNoEyeWear = true;
                    break;
                case 9:
                    this.mTempRegion = this.mEyeWearStyleRegin;
                    break;
                default:
                    switch (i3) {
                        case 19:
                            this.mTempRegion = this.mFaceSharpRegion;
                            break;
                        case 20:
                            this.mTempRegion = this.mEyeSharpRegion;
                            this.mNoEyeWear = true;
                            break;
                        case 21:
                            this.mTempRegion = this.mMouthSharpRegion;
                            this.mNoEyeWear = true;
                            break;
                        default:
                            switch (i3) {
                                case 27:
                                    this.mTempRegion = this.mEarShapeRegion;
                                    this.mNoHair = true;
                                    this.mNoEyeWear = true;
                                    break;
                                case 28:
                                    this.mTempRegion = this.mEyeBrowSharpRegion;
                                    this.mNoEyeWear = true;
                                    break;
                                default:
                                    this.mTempRegion = this.mnNormalRegion;
                                    break;
                            }
                    }
            }
        } else {
            this.mTempRegion = this.mNoseShapeRegion;
            this.mNoEyeWear = true;
        }
        if (this.mNoHair) {
            if (this.mHairList == null) {
                this.mHairList = avatarEngine2.getConfig(1, i2);
            }
            avatarEngine2.setConfig((ASAvatarConfigInfo) this.mHairList.get(this.mHairList.size() - 1));
        }
        if (this.mNoEyeWear) {
            if (this.mEyeWearList == null) {
                this.mEyeWearList = avatarEngine2.getConfig(9, i2);
            }
            avatarEngine2.setConfig((ASAvatarConfigInfo) this.mEyeWearList.get(0));
        }
        avatarEngine.setConfig(aSAvatarConfigInfo);
        int i4 = this.mTempRegion[4];
        int i5 = this.mTempRegion[5];
        byte[] bArr = new byte[(i4 * i5 * 4)];
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("mTempRegion");
        sb2.append(Arrays.toString(this.mTempRegion));
        LOG.d(str2, sb2.toString());
        int i6 = this.mTempRegion[0];
        int i7 = this.mTempRegion[1];
        int i8 = this.mTempRegion[2];
        int i9 = this.mTempRegion[3];
        avatarEngine2.renderThumb(i6, i7, i8, i9, bArr, i4, i5, i4 * 4, fArr);
        Bitmap createBitmap = Bitmap.createBitmap(i4, i5, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(bArr));
        aSAvatarConfigInfo2.thum = createBitmap;
    }
}
