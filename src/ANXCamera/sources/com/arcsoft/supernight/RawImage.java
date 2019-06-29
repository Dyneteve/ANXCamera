package com.arcsoft.supernight;

import java.nio.ByteBuffer;

public class RawImage {
    public int mHeight;
    public int mPitch0;
    public int mPitch1;
    public int mPitch2;
    public int mPitch3;
    public int mPixelArrayFormat;
    public ByteBuffer mPlane0;
    public ByteBuffer mPlane1;
    public ByteBuffer mPlane2;
    public ByteBuffer mPlane3;
    public int mWidth;
}
