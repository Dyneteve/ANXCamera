package com.android.camera.fragment.mimoji;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigInfo;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigValue;
import com.arcsoft.avatar.AvatarEngine;
import com.arcsoft.avatar.util.AvatarConfigUtils;
import com.arcsoft.avatar.util.LOG;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

public class ConfigInfoThumUtils {
    private static final String TAG = "ConfigInfoThumUtils";
    private final float[] mBeardStyleRegion = {522.0f, 628.0f, 160.0f, 326.0f, 200.0f, 200.0f, 1.0f};
    private final float[] mEarShapeRegion = {1031.0f, 1240.0f, 179.0f, 543.0f, 200.0f, 200.0f, 1.0f};
    private final float[] mEyeBrowSharpRegion = {528.0f, 635.0f, 164.0f, 209.0f, 200.0f, 200.0f, 1.0f};
    private final float[] mEyeSharpRegion = {528.0f, 635.0f, 164.0f, 209.0f, 200.0f, 200.0f, 1.0f};
    private ArrayList<ASAvatarConfigInfo> mEyeWearList;
    private final float[] mEyeWearStyleRegin = {261.0f, 314.0f, 35.0f, 40.0f, 200.0f, 200.0f, 1.0f};
    private final float[] mEyelashStyleRegion = {1306.0f, 1570.0f, 389.0f, 668.0f, 200.0f, 200.0f, 1.0f};
    private final float[] mFaceSharpRegion = {261.0f, 314.0f, 35.0f, 40.0f, 200.0f, 200.0f, 1.0f};
    private final float[] mFrecklesRegion = {601.0f, 723.0f, 201.0f, 274.0f, 200.0f, 200.0f, 1.0f};
    private ArrayList<ASAvatarConfigInfo> mHairList;
    private final float[] mHairStyleRegion = {270.0f, 325.0f, 23.0f, 37.0f, 220.0f, 220.0f, 1.0f};
    private final String mHat = "Hat";
    private final float[] mHatStyleRegion = {270.0f, 325.0f, 23.0f, 20.0f, 220.0f, 220.0f, 1.0f};
    private final String mHeadWear = "Hea";
    private final float[] mHeadWearStyleRegion = {422.0f, 510.0f, 98.0f, 15.0f, 220.0f, 220.0f, 0.8f};
    private final float[] mMouthSharpRegion = {1198.0f, 1442.0f, 499.0f, 784.0f, 200.0f, 200.0f, 1.0f};
    private final float[] mNevusRegion = {601.0f, 723.0f, 201.0f, 274.0f, 200.0f, 200.0f, 1.0f};
    private boolean mNoEyeWear = false;
    private boolean mNoHair = false;
    private final float[] mNoseShapeRegion = {737.0f, 887.0f, 270.0f, 378.0f, 200.0f, 200.0f, 1.0f};
    private float[] mTempRegion = new float[7];
    private final float[] mnNormalRegion = {200.0f, 200.0f, 0.0f, 0.0f, 200.0f, 200.0f, 1.0f};

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
            this.mTempRegion = aSAvatarConfigInfo2.name.substring(0, 3).equalsIgnoreCase("Hat") ? this.mHatStyleRegion : this.mHeadWearStyleRegion;
        } else if (i3 == 14) {
            this.mTempRegion = this.mBeardStyleRegion;
            this.mNoEyeWear = true;
            this.mNoHair = true;
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
            if (this.mHairList.size() > 0) {
                avatarEngine2.setConfig((ASAvatarConfigInfo) this.mHairList.get(this.mHairList.size() - 1));
            }
        }
        if (this.mNoEyeWear) {
            if (this.mEyeWearList == null) {
                this.mEyeWearList = avatarEngine2.getConfig(9, i2);
            }
            if (this.mEyeWearList.size() > 0) {
                avatarEngine2.setConfig((ASAvatarConfigInfo) this.mEyeWearList.get(0));
            }
        }
        avatarEngine.setConfig(aSAvatarConfigInfo);
        int i4 = (int) this.mTempRegion[4];
        int i5 = (int) this.mTempRegion[5];
        byte[] bArr = new byte[(i4 * i5 * 4)];
        avatarEngine2.renderThumb((int) this.mTempRegion[0], (int) this.mTempRegion[1], (int) this.mTempRegion[2], (int) this.mTempRegion[3], bArr, i4, i5, i4 * 4, fArr, this.mTempRegion[6]);
        Bitmap createBitmap = Bitmap.createBitmap(i4, i5, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(bArr));
        aSAvatarConfigInfo2.thum = createBitmap;
    }

    public void reset(AvatarEngine avatarEngine, ASAvatarConfigValue aSAvatarConfigValue) {
        ASAvatarConfigInfo aSAvatarConfigInfo;
        ASAvatarConfigInfo aSAvatarConfigInfo2 = null;
        if (this.mNoHair) {
            int currentConfigIdWithType = AvatarConfigUtils.getCurrentConfigIdWithType(1, aSAvatarConfigValue);
            if (currentConfigIdWithType == -1) {
                currentConfigIdWithType = 0;
            }
            Iterator it = this.mHairList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    aSAvatarConfigInfo = null;
                    break;
                }
                aSAvatarConfigInfo = (ASAvatarConfigInfo) it.next();
                if (aSAvatarConfigInfo.configID == currentConfigIdWithType) {
                    break;
                }
            }
            if (aSAvatarConfigInfo != null) {
                avatarEngine.setConfig(aSAvatarConfigInfo);
            }
        }
        if (this.mNoEyeWear) {
            int currentConfigIdWithType2 = AvatarConfigUtils.getCurrentConfigIdWithType(9, aSAvatarConfigValue);
            if (currentConfigIdWithType2 == -1) {
                currentConfigIdWithType2 = 0;
            }
            Iterator it2 = this.mEyeWearList.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                ASAvatarConfigInfo aSAvatarConfigInfo3 = (ASAvatarConfigInfo) it2.next();
                if (aSAvatarConfigInfo3.configID == currentConfigIdWithType2) {
                    aSAvatarConfigInfo2 = aSAvatarConfigInfo3;
                    break;
                }
            }
            if (aSAvatarConfigInfo2 != null) {
                avatarEngine.setConfig(aSAvatarConfigInfo2);
            }
        }
    }
}
