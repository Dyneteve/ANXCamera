.class public Lcom/android/camera/effect/ShaderNativeUtil;
.super Ljava/lang/Object;
.source "ShaderNativeUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ShaderNativeUtil"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    :try_start_0
    const-string v0, "CameraEffectJNI"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "ShaderNativeUtil"

    const-string v2, "ShaderNativeUtil load CameraEffectJNI.so failed."

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static native compressJpeg(III)[B
.end method

.method public static compressPicture(III)[B
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/android/camera/effect/ShaderNativeUtil;->compressJpeg(III)[B

    move-result-object p0

    return-object p0
.end method

.method private static native decompressJpeg([BI)[I
.end method

.method public static decompressPicture([BI)[I
    .locals 0

    invoke-static {p0, p1}, Lcom/android/camera/effect/ShaderNativeUtil;->decompressJpeg([BI)[I

    move-result-object p0

    return-object p0
.end method

.method public static native genWaterMarkRange(IIII)V
.end method

.method public static native getCenterSquareImage(II)V
.end method

.method public static native getJpegFromMemImage(IIIII)[B
.end method

.method private static native getJpegPicture(IIIII)[B
.end method

.method public static getPicture(III)[B
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0, v0, p0, p1, p2}, Lcom/android/camera/effect/ShaderNativeUtil;->getJpegPicture(IIIII)[B

    move-result-object p0

    return-object p0
.end method

.method public static getPicture(IIIII)[B
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/camera/effect/ShaderNativeUtil;->getJpegPicture(IIIII)[B

    move-result-object p0

    return-object p0
.end method

.method public static native getWaterMarkRange(I)[B
.end method

.method private static native initJpegTexture([BII)[I
.end method

.method public static initTexture([BI)[I
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/android/camera/effect/ShaderNativeUtil;->initJpegTexture([BII)[I

    move-result-object p0

    return-object p0
.end method

.method public static initTexture([BII)[I
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/android/camera/effect/ShaderNativeUtil;->initJpegTexture([BII)[I

    move-result-object p0

    return-object p0
.end method

.method public static native mergeWaterMarkRange(IIIIII)V
.end method

.method public static native mergeYUV(IIII)V
.end method

.method public static native parseYUVImage(IILjava/nio/Buffer;Ljava/nio/Buffer;Ljava/nio/Buffer;IIII)V
.end method

.method public static native readGraphicBuffer(III)V
.end method

.method public static native readPixelsAndMerge(III)V
.end method

.method public static native readPixelsPboPlainMerge(III)V
.end method

.method public static native releaseGraphicBuffer()V
.end method

.method public static native resizeGraphicBuffer(II)I
.end method

.method public static native setupGraphicBuffer(II)I
.end method

.method public static native texChannelUV(III)V
.end method

.method public static native texChannelY(III)V
.end method

.method public static native updateTextureWidthStride(IIIII)V
.end method
