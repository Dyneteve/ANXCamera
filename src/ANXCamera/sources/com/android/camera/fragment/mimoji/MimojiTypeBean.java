package com.android.camera.fragment.mimoji;

import com.android.camera.ui.autoselectview.SelectItemBean;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigType;

public class MimojiTypeBean extends SelectItemBean {
    private ASAvatarConfigType ASAvatarConfigType;

    public ASAvatarConfigType getASAvatarConfigType() {
        return this.ASAvatarConfigType;
    }

    public void setASAvatarConfigType(ASAvatarConfigType aSAvatarConfigType) {
        this.ASAvatarConfigType = aSAvatarConfigType;
    }
}
