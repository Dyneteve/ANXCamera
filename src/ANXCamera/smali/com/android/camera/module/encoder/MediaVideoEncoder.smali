.class public Lcom/android/camera/module/encoder/MediaVideoEncoder;
.super Lcom/android/camera/module/encoder/MediaEncoder;
.source "MediaVideoEncoder.java"


# static fields
.field private static final BPP:F = 0.25f

.field private static final FRAME_RATE:I = 0x19

.field private static final MIME_TYPE:Ljava/lang/String; = "video/avc"

.field private static final TAG:Ljava/lang/String;

.field protected static sRecognizedFormats:[I


# instance fields
.field private mExtraFrames:I

.field private mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

.field private mRequestStopTime:J

.field private mSharedEGLContext:Landroid/opengl/EGLContext;

.field private mSurface:Landroid/view/Surface;

.field private final mVideoHeight:I

.field private final mVideoWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-class v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x7f000789

    aput v2, v0, v1

    sput-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->sRecognizedFormats:[I

    return-void
.end method

.method public constructor <init>(Landroid/opengl/EGLContext;Lcom/android/camera/module/encoder/MediaMuxerWrapper;Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;II)V
    .locals 5

    invoke-direct {p0, p2, p3}, Lcom/android/camera/module/encoder/MediaEncoder;-><init>(Lcom/android/camera/module/encoder/MediaMuxerWrapper;Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;)V

    sget-object p2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    sget-object p3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v0, "init: videoSize=%dx%d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {p3, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput p4, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoWidth:I

    iput p5, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoHeight:I

    nop

    nop

    if-le p4, p5, :cond_0

    nop

    nop

    move v4, p5

    move p5, p4

    move p4, v4

    :cond_0
    sget-object p2, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    invoke-static {p2, p4, p5}, Lcom/android/camera/module/encoder/RenderHandler;->createHandler(Ljava/lang/String;II)Lcom/android/camera/module/encoder/RenderHandler;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    iput-object p1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSharedEGLContext:Landroid/opengl/EGLContext;

    return-void
.end method

.method private calcBitRate()I
    .locals 7

    iget v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoWidth:I

    int-to-float v0, v0

    const/high16 v1, 0x40c80000    # 6.25f

    mul-float/2addr v1, v0

    iget v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoHeight:I

    int-to-float v0, v0

    mul-float/2addr v1, v0

    float-to-int v0, v1

    sget-object v1, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "bitrate=%d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method private static isRecognizedVideoFormat(I)Z
    .locals 4

    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->sRecognizedFormats:[I

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->sRecognizedFormats:[I

    array-length v0, v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    move v2, v1

    :goto_1
    if-ge v2, v0, :cond_2

    sget-object v3, Lcom/android/camera/module/encoder/MediaVideoEncoder;->sRecognizedFormats:[I

    aget v3, v3, v2

    if-ne v3, p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return v1
.end method

.method protected static final selectColorFormat(Landroid/media/MediaCodecInfo;Ljava/lang/String;)I
    .locals 3

    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "selectColorFormat>>>codec:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    nop

    const/4 v0, 0x5

    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setPriority(I)V

    invoke-virtual {p0, p1}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/Thread;->setPriority(I)V

    nop

    const/4 p1, 0x0

    move v0, p1

    :goto_0
    iget-object v1, p0, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    array-length v1, v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    aget v1, v1, v0

    invoke-static {v1}, Lcom/android/camera/module/encoder/MediaVideoEncoder;->isRecognizedVideoFormat(I)Z

    move-result v2

    if-eqz v2, :cond_0

    nop

    nop

    move p1, v1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    sget-object p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "selectColorFormat<<<colorFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return p1

    :catchall_0
    move-exception p0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/Thread;->setPriority(I)V

    throw p0
.end method

.method protected static final selectVideoCodec(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 7

    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "selectVideoCodec>>>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_3

    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v3

    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_2

    :cond_0
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v4

    move v5, v1

    :goto_1
    array-length v6, v4

    if-ge v5, v6, :cond_2

    aget-object v6, v4, v5

    invoke-virtual {v6, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-static {v3, p0}, Lcom/android/camera/module/encoder/MediaVideoEncoder;->selectColorFormat(Landroid/media/MediaCodecInfo;Ljava/lang/String;)I

    move-result v6

    if-lez v6, :cond_1

    return-object v3

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    sget-object p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string v0, "selectVideoCodec<<<"

    invoke-static {p0, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public frameAvailableSoon(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)Z
    .locals 5

    invoke-super {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->frameAvailableSoon()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSkipFrame:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    invoke-virtual {v1, p1}, Lcom/android/camera/module/encoder/RenderHandler;->draw(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V

    iget-wide v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRequestStopTime:J

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-lez p1, :cond_0

    iget p1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mExtraFrames:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mExtraFrames:I

    iget p1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mExtraFrames:I

    if-gtz p1, :cond_0

    invoke-super {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->stopRecording()V

    :cond_0
    return v0
.end method

.method protected prepare()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "prepare>>>"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mTrackIndex:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMuxerStarted:Z

    iput-boolean v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mIsEOS:Z

    const-string/jumbo v0, "video/avc"

    invoke-static {v0}, Lcom/android/camera/module/encoder/MediaVideoEncoder;->selectVideoCodec(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "no appropriate codec for video/avc"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    sget-object v1, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "selected codec: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string/jumbo v0, "video/avc"

    iget v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoWidth:I

    iget v2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mVideoHeight:I

    invoke-static {v0, v1, v2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    const-string v1, "color-format"

    const v2, 0x7f000789

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string v1, "bitrate"

    invoke-direct {p0}, Lcom/android/camera/module/encoder/MediaVideoEncoder;->calcBitRate()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string v1, "frame-rate"

    const/16 v2, 0x19

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string v1, "i-frame-interval"

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setFloat(Ljava/lang/String;F)V

    sget-object v1, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "format: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string/jumbo v1, "video/avc"

    invoke-static {v1}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, v3, v2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    iget-object v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSharedEGLContext:Landroid/opengl/EGLContext;

    iget-object v3, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1, v3, v2}, Lcom/android/camera/module/encoder/RenderHandler;->setEglContext(Landroid/opengl/EGLContext;Ljava/lang/Object;Z)V

    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mListener:Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;

    invoke-interface {v0, p0}, Lcom/android/camera/module/encoder/MediaEncoder$MediaEncoderListener;->onPrepared(Lcom/android/camera/module/encoder/MediaEncoder;)V

    :cond_1
    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "prepare<<<"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected release()V
    .locals 2

    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "release"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    iput-object v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSurface:Landroid/view/Surface;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    invoke-virtual {v0}, Lcom/android/camera/module/encoder/RenderHandler;->release()V

    iput-object v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mSharedEGLContext:Landroid/opengl/EGLContext;

    iput-object v1, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRenderHandler:Lcom/android/camera/module/encoder/RenderHandler;

    :cond_1
    invoke-super {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->release()V

    return-void
.end method

.method protected signalEndOfInputStream()V
    .locals 2

    sget-object v0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->TAG:Ljava/lang/String;

    const-string v1, "signalEndOfInputStream"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mMediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mIsEOS:Z

    return-void
.end method

.method protected startRecording(J)Z
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/android/camera/module/encoder/MediaEncoder;->startRecording(J)Z

    move-result p1

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mRequestStopTime:J

    const/4 p2, 0x0

    iput p2, p0, Lcom/android/camera/module/encoder/MediaVideoEncoder;->mExtraFrames:I

    return p1
.end method

.method protected stopRecording()V
    .locals 0

    invoke-super {p0}, Lcom/android/camera/module/encoder/MediaEncoder;->stopRecording()V

    return-void
.end method
