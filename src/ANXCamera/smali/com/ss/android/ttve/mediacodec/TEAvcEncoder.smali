.class public Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;
.super Ljava/lang/Object;
.source "TEAvcEncoder.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;
    }
.end annotation


# static fields
.field private static DEBUG:Z = false

.field private static final MASK_BIT_RATE:I = 0x1

.field private static final MASK_FORCE_RESTART:I = 0x4

.field private static final MASK_FRAME_RATE:I = 0x2

.field private static MAX_FRAME_RATE:I = 0x0

.field private static MIN_FRAME_RATE:I = 0x0

.field private static final TAG:Ljava/lang/String;

.field private static final TIMEOUT_USEC:I = 0x0

.field private static final TIMEOUT_USEC_EOS:I = 0x2710

.field private static final VIDEO_MIME_TYPE:Ljava/lang/String; = "video/avc"

.field private static avcqueuesize:I

.field private static c_curObj:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;


# instance fields
.field public AVCQueue:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue<",
            "Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;",
            ">;"
        }
    .end annotation
.end field

.field public configbyte:[B

.field private mBufferIndex:I

.field private mEndOfStream:Z

.field private mFirstFrame:Z

.field private mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

.field private m_bNeedSingalEnd:Z

.field private m_bSignalEndOfStream:Z

.field private m_bSuccessInit:Z

.field private m_bitRate:I

.field private m_codecFormat:Landroid/media/MediaFormat;

.field private m_colorFormat:I

.field private m_configStatus:I

.field private m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

.field private m_encodeStartTime:J

.field private m_frameRate:I

.field private m_getnerateIndex:J

.field private m_height:I

.field private m_iFrameInternal:I

.field private m_isNeedReconfigure:Z

.field private m_mediaCodec:Landroid/media/MediaCodec;

.field private m_profile:I

.field private m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

.field private m_surface:Landroid/view/Surface;

.field private m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

.field private m_useInputSurface:Z

.field private m_width:I

.field private pps:[B

.field private sps:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    sput-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->c_curObj:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    const/4 v0, 0x7

    sput v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MIN_FRAME_RATE:I

    const/16 v0, 0x7d0

    sput v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MAX_FRAME_RATE:I

    const/4 v0, 0x0

    sput-boolean v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->DEBUG:Z

    const/16 v0, 0x19

    sput v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->avcqueuesize:I

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    sget v1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->avcqueuesize:I

    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->AVCQueue:Ljava/util/concurrent/ArrayBlockingQueue;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    const/4 v1, 0x0

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_profile:I

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_useInputSurface:Z

    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSuccessInit:Z

    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bNeedSingalEnd:Z

    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSignalEndOfStream:Z

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    const-wide/16 v3, -0x1

    iput-wide v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_encodeStartTime:J

    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mFirstFrame:Z

    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mEndOfStream:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    return-void
.end method

.method private addOutputData([BJI)V
    .locals 1

    new-instance v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    invoke-direct {v0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;-><init>()V

    iput-object p1, v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->data:[B

    iput-wide p2, v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->pts:J

    iput p4, v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->flag:I

    :try_start_0
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->AVCQueue:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/ArrayBlockingQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private computePresentationTime(J)J
    .locals 4

    iget-wide v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_encodeStartTime:J

    const-wide/32 v2, 0x3b9aca00

    mul-long/2addr p1, v2

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    int-to-long v2, v2

    div-long/2addr p1, v2

    add-long/2addr v0, p1

    return-wide v0
.end method

.method private configEncode()I
    .locals 8

    :try_start_0
    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->reconfigureMediaFormat()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    :cond_2
    const-string v0, "video/avc"

    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getCodecInfo()Landroid/media/MediaCodecInfo;

    move-result-object v0

    const-string v2, "video/avc"

    invoke-virtual {v0, v2}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    move-result-object v0

    iget-object v0, v0, Landroid/media/MediaCodecInfo$CodecCapabilities;->profileLevels:[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    array-length v2, v0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    const/4 v5, 0x1

    if-ge v4, v2, :cond_5

    aget-object v6, v0, v4

    iget v7, v6, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    if-ne v7, v5, :cond_4

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    const-string v2, "profile"

    iget v4, v6, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    invoke-virtual {v0, v2, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v0, v2, :cond_5

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    const-string v2, "level"

    iget v4, v6, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    const/16 v7, 0x2000

    if-gt v4, v7, :cond_3

    iget v7, v6, Landroid/media/MediaCodecInfo$CodecProfileLevel;->level:I

    nop

    :cond_3
    invoke-virtual {v0, v2, v7}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    goto :goto_1

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    invoke-virtual {v0, v2, v1, v1, v5}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_6

    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_useInputSurface:Z

    if-eqz v0, :cond_6

    sget-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    const-string v1, "m_mediaCodec.createInputSurface()"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_6
    nop

    return v3

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, -0x2

    return v0
.end method

.method public static createEncoderObject()Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;
    .locals 1

    new-instance v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    invoke-direct {v0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;-><init>()V

    sput-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->c_curObj:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    sget-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->c_curObj:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    return-object v0
.end method

.method private drainOutputBuffer(J)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    const/4 v1, -0x1

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    :try_start_0
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0, p1, p2}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v1

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    iget v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    const/4 v2, 0x0

    if-ltz v1, :cond_5

    iget v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    invoke-direct {p0, v1}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->getOutputBufferByIdx(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iget v3, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array v3, v3, [B

    iget v4, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget v4, v0, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v4, v5

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    iget v1, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v4, 0x2

    if-ne v1, v4, :cond_0

    iput-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    goto :goto_2

    :cond_0
    iget v1, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v4, 0x1

    const/4 v5, 0x4

    if-ne v1, v4, :cond_3

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    if-eqz v1, :cond_1

    aget-byte v1, v3, v5

    iget-object v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    aget-byte v4, v4, v5

    if-ne v1, v4, :cond_2

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    array-length v1, v1

    add-int/2addr v1, v5

    aget-byte v1, v3, v1

    and-int/lit8 v1, v1, 0x1f

    const/4 v4, 0x5

    if-ne v1, v4, :cond_2

    array-length v1, v3

    iget-object v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    array-length v4, v4

    sub-int/2addr v1, v4

    new-array v1, v1, [B

    iget-object v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    array-length v4, v4

    array-length v5, v1

    invoke-static {v3, v4, v1, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    nop

    goto :goto_1

    :cond_1
    sget-object v1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    const-string v4, "I can\'t find configbyte!!!! NEED extract from I frame!!!"

    invoke-static {v1, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    move-object v1, v3

    :goto_1
    iget-wide v3, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget v5, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-direct {p0, v1, v3, v4, v5}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->addOutputData([BJI)V

    goto :goto_2

    :cond_3
    iget v1, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    if-ne v1, v5, :cond_4

    iput-boolean v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mEndOfStream:Z

    goto :goto_3

    :cond_4
    iget-wide v4, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget v1, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-direct {p0, v3, v4, v5, v1}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->addOutputData([BJI)V

    :goto_2
    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    iget v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    invoke-virtual {v1, v3, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0, p1, p2}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v1

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    goto/16 :goto_0

    :cond_5
    :goto_3
    iget p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    const/4 p2, -0x2

    if-ne p1, p2, :cond_6

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object p1

    const-string p2, "csd-0"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object p2

    const-string v0, "csd-1"

    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getByteBuffer(Ljava/lang/String;)Ljava/nio/ByteBuffer;

    move-result-object p1

    if-eqz p2, :cond_6

    if-eqz p1, :cond_6

    nop

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p2

    invoke-virtual {p2}, [B->clone()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [B

    iput-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->sps:[B

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->pps:[B

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->sps:[B

    array-length p1, p1

    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->pps:[B

    array-length p2, p2

    add-int/2addr p1, p2

    new-array p1, p1, [B

    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->sps:[B

    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->sps:[B

    array-length v0, v0

    invoke-static {p1, v2, p2, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->pps:[B

    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->sps:[B

    array-length v0, v0

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->pps:[B

    array-length v1, v1

    invoke-static {p1, v2, p2, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_6
    return-void
.end method

.method private getOutputBufferByIdx(I)Ljava/nio/ByteBuffer;
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0, p1}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    aget-object p1, v0, p1

    return-object p1
.end method

.method private reconfigureMediaFormat()I
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    const-string v0, "video/avc"

    iget v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    invoke-static {v0, v1, v2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    const-string v1, "color-format"

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    const-string v1, "bitrate"

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    const-string v1, "frame-rate"

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_codecFormat:Landroid/media/MediaFormat;

    const-string v1, "i-frame-interval"

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    sget-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    const-string v1, "width:[%d] height:[%d] frameRate:[%d] iFrameInternal:[%d] bitRate:[%d] colorFormat:[%d]"

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x2

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x3

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x4

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x5

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return v4
.end method


# virtual methods
.method public encodeVideoFromTexture(I)I
    .locals 13
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSuccessInit:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    if-nez v0, :cond_1

    new-instance v0, Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-direct {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;->saveEGLState()V

    :cond_1
    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    const/4 v2, 0x1

    if-nez v0, :cond_2

    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_4

    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    if-ne v0, v2, :cond_3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v0, v3, :cond_3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v3, "video-bitrate"

    iget v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v3, v0}, Landroid/media/MediaCodec;->setParameters(Landroid/os/Bundle;)V

    iput v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->restartEncoder()I

    :goto_0
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    :cond_4
    iget-wide v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_encodeStartTime:J

    const-wide/16 v5, -0x1

    cmp-long v0, v3, v5

    if-nez v0, :cond_5

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_encodeStartTime:J

    :cond_5
    const-wide/16 v3, 0x0

    invoke-direct {p0, v3, v4}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->drainOutputBuffer(J)V

    and-int/lit8 p1, p1, -0x1

    const/16 v0, 0x1e

    if-eqz p1, :cond_c

    :try_start_0
    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-eqz v5, :cond_b

    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v5}, Lcom/ss/android/ttve/common/TESharedContext;->makeCurrent()Z

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    iget v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    invoke-static {v1, v1, v5, v6}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v5, p1}, Lcom/ss/android/ttve/common/TETextureDrawer;->drawTexture(I)V

    iget-boolean v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mFirstFrame:Z

    if-eqz v5, :cond_7

    sget-boolean v5, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->DEBUG:Z

    if-eqz v5, :cond_6

    const v5, 0x384000

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {v5, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v8, 0x500

    const/16 v9, 0x2d0

    const/16 v10, 0x1908

    const/16 v11, 0x1401

    move-object v12, v5

    invoke-static/range {v6 .. v12}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    new-instance v6, Ljava/io/FileOutputStream;

    const-string v7, "/mnt/sdcard/ttt.rgba"

    invoke-direct {v6, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V

    :cond_6
    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mFirstFrame:Z

    :cond_7
    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    iget-wide v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    invoke-direct {p0, v6, v7}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->computePresentationTime(J)J

    move-result-wide v6

    invoke-virtual {v5, v6, v7}, Lcom/ss/android/ttve/common/TESharedContext;->setPresentationTime(J)V

    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v5}, Lcom/ss/android/ttve/common/TESharedContext;->swapBuffers()Z

    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bNeedSingalEnd:Z

    invoke-direct {p0, v3, v4}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->drainOutputBuffer(J)V

    iget-object v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    if-nez v5, :cond_b

    nop

    move v5, v1

    :cond_8
    iget v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    iget v7, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    invoke-static {v1, v1, v6, v7}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-object v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v6, p1}, Lcom/ss/android/ttve/common/TETextureDrawer;->drawTexture(I)V

    iget-object v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    iget-wide v7, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    invoke-direct {p0, v7, v8}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->computePresentationTime(J)J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Lcom/ss/android/ttve/common/TESharedContext;->setPresentationTime(J)V

    iget-object v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v6}, Lcom/ss/android/ttve/common/TESharedContext;->swapBuffers()Z

    invoke-direct {p0, v3, v4}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->drainOutputBuffer(J)V

    add-int/2addr v5, v2

    if-le v5, v0, :cond_9

    goto :goto_1

    :cond_9
    const-wide/16 v6, 0xa

    invoke-static {v6, v7, v1}, Ljava/lang/Thread;->sleep(JI)V

    iget-object v6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    if-eqz v6, :cond_8

    :goto_1
    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    if-nez v2, :cond_a

    sget-object v2, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Generate configData failed!!!"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_a
    sget-object v2, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Generate configData succeed!!!"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->AVCQueue:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {v2}, Ljava/util/concurrent/ArrayBlockingQueue;->clear()V

    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->restartEncoder()I

    iput-wide v3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v2}, Lcom/ss/android/ttve/common/TESharedContext;->makeCurrent()Z

    iget v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    iget v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    invoke-static {v1, v1, v2, v5}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-object v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v2, p1}, Lcom/ss/android/ttve/common/TETextureDrawer;->drawTexture(I)V

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    iget-wide v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    invoke-direct {p0, v5, v6}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->computePresentationTime(J)J

    move-result-wide v5

    invoke-virtual {p1, v5, v6}, Lcom/ss/android/ttve/common/TESharedContext;->setPresentationTime(J)V

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TESharedContext;->swapBuffers()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_b
    goto :goto_3

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_3
    iget-wide v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    const-wide/16 v7, 0x1

    add-long/2addr v5, v7

    iput-wide v5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_getnerateIndex:J

    goto :goto_4

    :cond_c
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    if-eqz p1, :cond_d

    iget-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSignalEndOfStream:Z

    if-nez p1, :cond_d

    iget-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bNeedSingalEnd:Z

    if-eqz p1, :cond_d

    :try_start_1
    sget-object p1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    const-string v5, "m_mediaCodec.flush()"

    invoke-static {p1, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSignalEndOfStream:Z

    iput-boolean v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mEndOfStream:Z

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->signalEndOfInputStream()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_d
    :goto_4
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TEEglStateSaver;->makeSavedStateCurrent()V

    iget-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSignalEndOfStream:Z

    if-eqz p1, :cond_11

    nop

    :cond_e
    iget-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mEndOfStream:Z

    if-nez p1, :cond_10

    const-wide/16 v2, 0x2710

    invoke-direct {p0, v2, v3}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->drainOutputBuffer(J)V

    iget p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mBufferIndex:I

    if-ltz p1, :cond_f

    goto :goto_5

    :cond_f
    add-int/lit8 v0, v0, -0x1

    if-gtz v0, :cond_e

    :cond_10
    :goto_5
    goto :goto_6

    :cond_11
    invoke-direct {p0, v3, v4}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->drainOutputBuffer(J)V

    :goto_6
    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->AVCQueue:Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-virtual {p1}, Ljava/util/concurrent/ArrayBlockingQueue;->poll()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    iput-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    nop

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    if-eqz p1, :cond_12

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    iget-object p1, p1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->data:[B

    array-length v1, p1

    :cond_12
    return v1
.end method

.method public getCodecData(I)[B
    .locals 0

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    iget-object p1, p1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->data:[B

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getExtraData()[B
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configbyte:[B

    return-object v0

    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [B

    return-object v0
.end method

.method public getInfoByFlag([II)I
    .locals 5

    nop

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    const/4 p2, 0x0

    iget-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    iget-wide v1, v1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->pts:J

    const-wide/16 v3, -0x1

    and-long/2addr v1, v3

    long-to-int v1, v1

    aput v1, p1, p2

    iget-object p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mLastCodecData:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;

    iget-wide v1, p2, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder$CodecData;->pts:J

    const/16 p2, 0x20

    shr-long/2addr v1, p2

    and-long/2addr v1, v3

    long-to-int p2, v1

    aput p2, p1, v0

    const/4 p1, 0x2

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    :goto_0
    return p1
.end method

.method public getInputSurface()Landroid/view/Surface;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    return-object v0
.end method

.method public initEncoder(IIIIIIIZ)I
    .locals 9
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    move-object v8, p0

    move/from16 v0, p8

    if-eqz v0, :cond_0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-ge v1, v2, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iput-boolean v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_useInputSurface:Z

    iget-boolean v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_useInputSurface:Z

    if-eqz v0, :cond_1

    const v0, 0x7f000789

    iput v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    goto :goto_0

    :cond_1
    move v0, p4

    iput v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    :goto_0
    iget v6, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    move-object v0, v8

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p6

    move v5, p5

    move/from16 v7, p7

    invoke-virtual/range {v0 .. v7}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->setEncoder(IIIIIII)I

    const/4 v0, 0x1

    iput-boolean v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    iput-boolean v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSuccessInit:Z

    const/4 v0, 0x0

    iput-boolean v0, v8, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bSignalEndOfStream:Z

    invoke-direct {v8}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configEncode()I

    move-result v0

    return v0
.end method

.method public initTextureDrawer()Z
    .locals 3

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    :cond_0
    invoke-static {}, Lcom/ss/android/ttve/common/TETextureDrawer;->create()Lcom/ss/android/ttve/common/TETextureDrawer;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/common/TETextureDrawer;->setRotation(F)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/ttve/common/TETextureDrawer;->setFlipScale(FF)V

    const/4 v0, 0x1

    return v0
.end method

.method public releaseEncoder()V
    .locals 3

    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->stopEncoder()V

    const-string v0, "TEAvcEncoder"

    const-string v1, "releaseEncoder"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "TEAvcEncoder"

    const-string v2, "release surface"

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_1

    const-string v0, "TEAvcEncoder"

    const-string v2, "release mediaCodec"

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TESharedContext;->release()V

    iput-object v1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    :cond_2
    sput-object v1, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->c_curObj:Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;

    return-void
.end method

.method public releaseTextureDrawer()V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    return-void
.end method

.method public restartEncoder()I
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bNeedSingalEnd:Z

    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->stopEncoder()V

    invoke-direct {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->configEncode()I

    move-result v0

    if-gez v0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->startEncoder()I

    move-result v0

    return v0
.end method

.method public setEncoder(IIIIIII)I
    .locals 4

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    if-lez p1, :cond_0

    iput p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_width:I

    :cond_0
    if-lez p2, :cond_1

    iput p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_height:I

    :cond_1
    const/4 p1, 0x1

    if-lez p3, :cond_5

    sget p2, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MIN_FRAME_RATE:I

    const/4 v1, 0x2

    if-ge p3, p2, :cond_2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    const-string v2, "_frameRate:[%d] is too small, change to %d"

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v3, v0

    sget p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MIN_FRAME_RATE:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v3, p1

    invoke-static {p2, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    sget-object p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    invoke-static {p3, p2}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    sget p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MIN_FRAME_RATE:I

    goto :goto_0

    :cond_2
    sget p2, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MAX_FRAME_RATE:I

    if-le p3, p2, :cond_3

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    const-string v2, "_frameRate:[%d] is too large, change to %d"

    new-array v3, v1, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v3, v0

    sget p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MAX_FRAME_RATE:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v3, p1

    invoke-static {p2, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    sget-object p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    invoke-static {p3, p2}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    sget p3, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->MAX_FRAME_RATE:I

    :cond_3
    :goto_0
    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    if-eq p2, p3, :cond_5

    iput p3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_frameRate:I

    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    if-ge p3, p2, :cond_4

    iput p3, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    :cond_4
    iput-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    or-int/2addr p2, v1

    iput p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    :cond_5
    if-lez p4, :cond_6

    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    if-eq p2, p4, :cond_6

    iput p4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_bitRate:I

    iput-boolean p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    iget p2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    or-int/2addr p1, p2

    iput p1, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_configStatus:I

    :cond_6
    if-ltz p5, :cond_7

    iput p5, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_iFrameInternal:I

    :cond_7
    if-lez p6, :cond_8

    iput p6, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_colorFormat:I

    :cond_8
    if-ltz p7, :cond_9

    iput p7, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_profile:I

    :cond_9
    return v0
.end method

.method public startEncoder()I
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    sget-object v0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->TAG:Ljava/lang/String;

    const-string v1, "startEncoder..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    const/4 v2, 0x0

    if-lt v0, v1, :cond_2

    iget-boolean v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_useInputSurface:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    const/4 v1, -0x2

    const/16 v3, 0x3142

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_eglStateSaver:Lcom/ss/android/ttve/common/TEEglStateSaver;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEEglStateSaver;->getSavedEGLContext()Landroid/opengl/EGLContext;

    move-result-object v0

    iget-object v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    const/16 v5, 0x40

    invoke-static {v0, v5, v5, v3, v4}, Lcom/ss/android/ttve/common/TESharedContext;->create(Landroid/opengl/EGLContext;IIILjava/lang/Object;)Lcom/ss/android/ttve/common/TESharedContext;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    if-nez v0, :cond_1

    return v1

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    iget-object v4, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_surface:Landroid/view/Surface;

    invoke-virtual {v0, v2, v2, v3, v4}, Lcom/ss/android/ttve/common/TESharedContext;->updateSurface(IIILjava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->initTextureDrawer()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, -0x3

    return v0

    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_encodeStartTime:J

    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_isNeedReconfigure:Z

    iput-boolean v2, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->mEndOfStream:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    nop

    return v2

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, -0x1

    return v0
.end method

.method public stopEncoder()V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_sharedContext:Lcom/ss/android/ttve/common/TESharedContext;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TESharedContext;->makeCurrent()Z

    :cond_0
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TETextureDrawer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_textureDrawer:Lcom/ss/android/ttve/common/TETextureDrawer;

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ttve/mediacodec/TEAvcEncoder;->m_mediaCodec:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method
