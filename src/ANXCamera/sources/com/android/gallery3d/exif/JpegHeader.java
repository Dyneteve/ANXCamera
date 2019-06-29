package com.android.gallery3d.exif;

class JpegHeader {
    public static final short APP0 = -32;
    public static final short APP1 = -31;
    public static final short DAC = -52;
    public static final short DHT = -60;
    public static final short EOI = -39;
    public static final short JPG = -56;
    public static final short SOF0 = -64;
    public static final short SOF15 = -49;
    public static final short SOI = -40;

    JpegHeader() {
    }

    public static final boolean isSofMarker(short s) {
        return (s < -64 || s > -49 || s == -60 || s == -56 || s == -52) ? false : true;
    }
}
