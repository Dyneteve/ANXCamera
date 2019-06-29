package com.android.gallery3d.ui;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import java.io.ByteArrayOutputStream;
import java.util.HashMap;

public abstract class UploadedTexture extends BasicTexture {
    private static final String TAG = "Texture";
    private static final int UPLOAD_LIMIT = 100;
    private static BorderKey sBorderKey = new BorderKey();
    private static HashMap<BorderKey, Bitmap> sBorderLines = new HashMap<>();
    static float[] sCropRect = new float[4];
    static int[] sTextureId = new int[1];
    private static int sUploadedCount;
    protected Bitmap mBitmap;
    private int mBorder;
    private boolean mContentValid;
    private boolean mIsPremultiplied;
    private boolean mIsUploading;
    private boolean mOpaque;
    private boolean mThrottled;

    private static class BorderKey implements Cloneable {
        public Config config;
        public int length;
        public boolean vertical;

        private BorderKey() {
        }

        public BorderKey clone() {
            try {
                return (BorderKey) super.clone();
            } catch (CloneNotSupportedException e) {
                throw new AssertionError(e);
            }
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof BorderKey)) {
                return false;
            }
            BorderKey borderKey = (BorderKey) obj;
            if (this.vertical == borderKey.vertical && this.config == borderKey.config && this.length == borderKey.length) {
                z = true;
            }
            return z;
        }

        public int hashCode() {
            int hashCode = this.config.hashCode() ^ this.length;
            return this.vertical ? hashCode : -hashCode;
        }
    }

    protected UploadedTexture() {
        this(false);
    }

    protected UploadedTexture(boolean z) {
        super(null, 0, 0);
        this.mContentValid = true;
        this.mIsUploading = false;
        this.mOpaque = true;
        this.mThrottled = false;
        this.mIsPremultiplied = false;
        if (z) {
            setBorder(true);
            this.mBorder = 1;
        }
    }

    private void freeBitmap() {
        Utils.assertTrue(this.mBitmap != null);
        onFreeBitmap(this.mBitmap);
        this.mBitmap = null;
    }

    private Bitmap getBitmap() {
        if (this.mBitmap == null) {
            this.mBitmap = onGetBitmap();
            this.mIsPremultiplied = this.mBitmap.isPremultiplied();
            int width = this.mBitmap.getWidth() + (this.mBorder * 2);
            int height = this.mBitmap.getHeight() + (this.mBorder * 2);
            if (this.mWidth == -1) {
                setSize(width, height);
            }
        }
        return this.mBitmap;
    }

    private static Bitmap getBorderLine(boolean z, Config config, int i) {
        BorderKey borderKey = sBorderKey;
        borderKey.vertical = z;
        borderKey.config = config;
        borderKey.length = i;
        Bitmap bitmap = (Bitmap) sBorderLines.get(borderKey);
        if (bitmap == null) {
            bitmap = z ? Bitmap.createBitmap(1, i, config) : Bitmap.createBitmap(i, 1, config);
            sBorderLines.put(borderKey.clone(), bitmap);
        }
        return bitmap;
    }

    public static void resetUploadLimit() {
        sUploadedCount = 0;
    }

    public static boolean uploadLimitReached() {
        return sUploadedCount > 100;
    }

    /* JADX INFO: finally extract failed */
    private void uploadToCanvas(GLCanvas gLCanvas) {
        char c;
        boolean z;
        int i;
        Config config;
        int i2;
        Bitmap bitmap = getBitmap();
        if (bitmap != null) {
            try {
                int width = bitmap.getWidth();
                int height = bitmap.getHeight();
                int i3 = this.mBorder;
                int i4 = this.mBorder;
                int textureWidth = getTextureWidth();
                int textureHeight = getTextureHeight();
                Utils.assertTrue(width <= textureWidth && height <= textureHeight);
                sCropRect[0] = (float) this.mBorder;
                sCropRect[1] = (float) (this.mBorder + height);
                sCropRect[2] = (float) width;
                sCropRect[3] = (float) (-height);
                GLES20.glGenTextures(1, sTextureId, 0);
                GLES20.glBindTexture(3553, sTextureId[0]);
                GLES20.glTexParameterfv(3553, 35741, sCropRect, 0);
                GLES20.glTexParameteri(3553, 10242, 33071);
                GLES20.glTexParameteri(3553, 10243, 33071);
                GLES20.glTexParameterf(3553, 10241, 9729.0f);
                GLES20.glTexParameterf(3553, 10240, 9729.0f);
                if (width == textureWidth && height == textureHeight) {
                    GLUtils.texImage2D(3553, 0, bitmap, 0);
                    c = 0;
                    z = true;
                } else {
                    int internalFormat = GLUtils.getInternalFormat(bitmap);
                    int type = GLUtils.getType(bitmap);
                    Config config2 = bitmap.getConfig();
                    GLES20.glTexImage2D(3553, 0, internalFormat, textureWidth, textureHeight, 0, internalFormat, type, null);
                    Config config3 = config2;
                    c = 0;
                    int i5 = textureHeight;
                    int i6 = textureWidth;
                    GLUtils.texSubImage2D(3553, 0, this.mBorder, this.mBorder, bitmap, internalFormat, type);
                    if (this.mBorder > 0) {
                        i = i6;
                        i2 = i5;
                        z = true;
                        config = config3;
                        GLUtils.texSubImage2D(3553, 0, 0, 0, getBorderLine(true, config3, i5), internalFormat, type);
                        GLUtils.texSubImage2D(3553, 0, 0, 0, getBorderLine(false, config, i), internalFormat, type);
                    } else {
                        i = i6;
                        i2 = i5;
                        z = true;
                        config = config3;
                    }
                    if (this.mBorder + width < i) {
                        GLUtils.texSubImage2D(3553, 0, this.mBorder + width, 0, getBorderLine(z, config, i2), internalFormat, type);
                    }
                    if (this.mBorder + height < i2) {
                        GLUtils.texSubImage2D(3553, 0, 0, this.mBorder + height, getBorderLine(false, config, i), internalFormat, type);
                    }
                }
                freeBitmap();
                setAssociatedCanvas(gLCanvas);
                this.mId = sTextureId[c];
                this.mState = z ? 1 : 0;
                this.mContentValid = z;
            } catch (Throwable th) {
                freeBitmap();
                throw th;
            }
        } else {
            this.mState = -1;
            throw new RuntimeException("Texture load fail, no bitmap");
        }
    }

    public byte[] getBitmapData(CompressFormat compressFormat) {
        Bitmap bitmap = getBitmap();
        if (bitmap == null) {
            return null;
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        bitmap.compress(compressFormat, 100, byteArrayOutputStream);
        return byteArrayOutputStream.toByteArray();
    }

    public int getHeight() {
        if (this.mWidth == -1) {
            getBitmap();
        }
        return this.mHeight;
    }

    public int getTarget() {
        return 3553;
    }

    public int getWidth() {
        if (this.mWidth == -1) {
            getBitmap();
        }
        return this.mWidth;
    }

    /* access modifiers changed from: protected */
    public void invalidateContent() {
        if (this.mBitmap != null) {
            freeBitmap();
        }
        this.mContentValid = false;
        this.mWidth = -1;
        this.mHeight = -1;
    }

    public boolean isContentValid() {
        return isLoaded() && this.mContentValid;
    }

    public boolean isOpaque() {
        return this.mOpaque;
    }

    public boolean isPremultiplied() {
        return this.mBitmap != null ? this.mBitmap.isPremultiplied() : this.mIsPremultiplied;
    }

    public boolean isUploading() {
        return this.mIsUploading;
    }

    public boolean onBind(GLCanvas gLCanvas) {
        updateContent(gLCanvas);
        return isContentValid();
    }

    /* access modifiers changed from: protected */
    public abstract void onFreeBitmap(Bitmap bitmap);

    /* access modifiers changed from: protected */
    public abstract Bitmap onGetBitmap();

    public void recycle() {
        super.recycle();
        if (this.mBitmap != null) {
            freeBitmap();
        }
    }

    /* access modifiers changed from: protected */
    public void setIsUploading(boolean z) {
        this.mIsUploading = z;
    }

    public void setOpaque(boolean z) {
        this.mOpaque = z;
    }

    /* access modifiers changed from: protected */
    public void setThrottled(boolean z) {
        this.mThrottled = z;
    }

    public void updateContent(GLCanvas gLCanvas) {
        if (!isLoaded()) {
            if (this.mThrottled) {
                int i = sUploadedCount + 1;
                sUploadedCount = i;
                if (i > 100) {
                    return;
                }
            }
            uploadToCanvas(gLCanvas);
        } else if (!this.mContentValid) {
            Bitmap bitmap = getBitmap();
            int internalFormat = GLUtils.getInternalFormat(bitmap);
            int type = GLUtils.getType(bitmap);
            GLES20.glBindTexture(3553, this.mId);
            GLUtils.texSubImage2D(3553, 0, this.mBorder, this.mBorder, bitmap, internalFormat, type);
            freeBitmap();
            this.mContentValid = true;
        }
    }
}
