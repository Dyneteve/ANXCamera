package com.ss.android.vesdk;

import android.graphics.SurfaceTexture;
import com.ss.android.ttve.common.TECommon;

public class Texture {
    private SurfaceTexture surfaceTexture;
    private int surfaceTextureID;

    public Texture() {
    }

    public Texture(int i, SurfaceTexture surfaceTexture2) {
        this.surfaceTextureID = i;
        this.surfaceTexture = surfaceTexture2;
    }

    public SurfaceTexture getSurfaceTexture() {
        return this.surfaceTexture;
    }

    public int getSurfaceTextureID() {
        return this.surfaceTextureID;
    }

    public void onDestroy(boolean z) {
        if (z) {
            if (this.surfaceTexture != null) {
                this.surfaceTexture.release();
                this.surfaceTexture = null;
            }
            if (TECommon.isTextureID(this.surfaceTextureID)) {
                TECommon.deleteTextureID(this.surfaceTextureID);
                this.surfaceTextureID = 0;
            }
        }
    }
}
