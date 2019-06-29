package com.android.camera.module.impl.component;

import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.StickerProtocol;
import com.ss.android.vesdk.TERecorder;

public class LiveStickerChangeImpl implements StickerProtocol {
    private TERecorder mRecorder;

    public LiveStickerChangeImpl(TERecorder tERecorder) {
        this.mRecorder = tERecorder;
    }

    public void onStickerChanged(String str) {
        TERecorder tERecorder = this.mRecorder;
        StringBuilder sb = new StringBuilder();
        sb.append(FileUtils.STICKER_RESOURCE_DIR);
        sb.append(str);
        tERecorder.switchEffect(sb.toString());
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(178, this);
    }

    public void unRegisterProtocol() {
        ModeCoordinatorImpl.getInstance().detachProtocol(178, this);
    }
}
