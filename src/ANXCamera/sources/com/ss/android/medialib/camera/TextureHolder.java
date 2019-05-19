package com.ss.android.medialib.camera;

import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import com.ss.android.medialib.common.Common;

public class TextureHolder {
    protected float[] mMPV = new float[16];
    private Texture mTexture = new Texture();
    /* access modifiers changed from: private */
    public OnFrameAvailableListener onFrameAvailableListener;

    public static class Texture {
        /* access modifiers changed from: private */
        public SurfaceTexture surfaceTexture;
        /* access modifiers changed from: private */
        public int surfaceTextureID;

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
    }

    public void frameAvailable() {
        if (this.mTexture.surfaceTexture != null) {
            this.mTexture.surfaceTexture.getTransformMatrix(this.mMPV);
            if (this.onFrameAvailableListener != null) {
                this.onFrameAvailableListener.onFrameAvailable(this.mTexture.surfaceTexture);
            }
        }
    }

    public float[] getMPV() {
        return this.mMPV;
    }

    public SurfaceTexture getSurfaceTexture() {
        return this.mTexture.surfaceTexture;
    }

    public int getSurfaceTextureID() {
        return this.mTexture.surfaceTextureID;
    }

    public Texture getTexture() {
        return this.mTexture;
    }

    public void onCreate() {
        this.mTexture = new Texture();
        this.mTexture.surfaceTextureID = Common.genSurfaceTextureID();
        this.mTexture.surfaceTexture = new SurfaceTexture(this.mTexture.surfaceTextureID);
        this.mTexture.surfaceTexture.setOnFrameAvailableListener(new OnFrameAvailableListener() {
            public void onFrameAvailable(SurfaceTexture surfaceTexture) {
                surfaceTexture.getTransformMatrix(TextureHolder.this.mMPV);
                if (TextureHolder.this.onFrameAvailableListener != null) {
                    TextureHolder.this.onFrameAvailableListener.onFrameAvailable(surfaceTexture);
                }
            }
        });
    }

    public void onCreate(Texture texture) {
        if (texture == null) {
            this.mTexture.surfaceTextureID = Common.genSurfaceTextureID();
            this.mTexture.surfaceTexture = new SurfaceTexture(this.mTexture.surfaceTextureID);
        } else if (!Common.isTextureID(texture.surfaceTextureID)) {
            this.mTexture.surfaceTextureID = Common.genSurfaceTextureID();
            this.mTexture.surfaceTexture = new SurfaceTexture(this.mTexture.surfaceTextureID);
        } else if (texture.surfaceTexture == null) {
            this.mTexture.surfaceTextureID = texture.surfaceTextureID;
            this.mTexture.surfaceTexture = new SurfaceTexture(this.mTexture.surfaceTextureID);
        } else {
            this.mTexture.surfaceTextureID = texture.surfaceTextureID;
            this.mTexture.surfaceTexture = texture.surfaceTexture;
        }
        this.mTexture.surfaceTexture.setOnFrameAvailableListener(new OnFrameAvailableListener() {
            public void onFrameAvailable(SurfaceTexture surfaceTexture) {
                TextureHolder.this.frameAvailable();
            }
        });
    }

    public void onDestroy(boolean z) {
        if (z) {
            if (this.mTexture.surfaceTexture != null) {
                this.mTexture.surfaceTexture.release();
                this.mTexture.surfaceTexture = null;
            }
            if (Common.isTextureID(this.mTexture.surfaceTextureID)) {
                Common.deleteTextureID(this.mTexture.surfaceTextureID);
                this.mTexture.surfaceTextureID = 0;
            }
        }
    }

    public void setOnFrameAvailableListener(OnFrameAvailableListener onFrameAvailableListener2) {
        this.onFrameAvailableListener = onFrameAvailableListener2;
    }

    public void updateTexImage() {
        this.mTexture.surfaceTexture.updateTexImage();
    }
}
