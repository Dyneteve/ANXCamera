package com.ss.android.ugc.effectmanager.effect.model.net;

import com.ss.android.ugc.effectmanager.common.model.BaseNetResponse;
import com.ss.android.ugc.effectmanager.effect.model.EffectChannelModel;

public class EffectNetListResponse extends BaseNetResponse {
    private EffectChannelModel data;

    public boolean checkValued() {
        return this.data != null && this.data.checkValued();
    }

    public EffectChannelModel getData() {
        return this.data;
    }

    public void setData(EffectChannelModel effectChannelModel) {
        this.data = effectChannelModel;
    }
}
