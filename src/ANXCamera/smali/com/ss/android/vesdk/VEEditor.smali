.class public Lcom/ss/android/vesdk/VEEditor;
.super Ljava/lang/Object;
.source "VEEditor.java"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;,
        Lcom/ss/android/vesdk/VEEditor$VEState;,
        Lcom/ss/android/vesdk/VEEditor$SEEK_MODE;,
        Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;,
        Lcom/ss/android/vesdk/VEEditor$SCALE_MODE;
    }
.end annotation


# static fields
.field private static final AUDIO_VOLUME:Ljava/lang/String; = "audio volume"

.field public static final COMMIT_VERISION:Ljava/lang/String; = "20190322_ec3de33"

.field private static final EFFECT_RES_PATH:Ljava/lang/String; = "effect res path"

.field private static final ENGINE_PREPARE_FOR_COMPILE:I = 0x1

.field private static final ENGINE_PREPARE_FOR_COMPILE_WITHWATERMARK:I = 0x2

.field private static final ENGINE_PREPARE_FOR_PLAYBACK:I = 0x0

.field private static final ENTITY_ALPHA:Ljava/lang/String; = "entity alpha"

.field private static final ENTITY_END_TIME:Ljava/lang/String; = "entity end time"

.field private static final ENTITY_LAYER:Ljava/lang/String; = "entity layer"

.field private static final ENTITY_PATH:Ljava/lang/String; = "entity path"

.field private static final ENTITY_POSITION_X:Ljava/lang/String; = "entity position x"

.field private static final ENTITY_POSITION_Y:Ljava/lang/String; = "entity position y"

.field private static final ENTITY_ROTATION:Ljava/lang/String; = "entity rotation"

.field private static final ENTITY_SCALE_X:Ljava/lang/String; = "entity scale x"

.field private static final ENTITY_SCALE_Y:Ljava/lang/String; = "entity scale y"

.field private static final ENTITY_START_TIME:Ljava/lang/String; = "entity start time"

.field private static final FILTER_INTENSITY:Ljava/lang/String; = "filter intensity"

.field private static final FILTER_PATH_LEFT:Ljava/lang/String; = "left filter"

.field private static final FILTER_PATH_RIGHT:Ljava/lang/String; = "right filter"

.field private static final FILTER_POSITION:Ljava/lang/String; = "filter position"

.field private static final TAG:Ljava/lang/String; = "VEEditor"

.field private static final TEFilterType_Audio:I = 0x1

.field private static final TEFilterType_Caption:I = 0x4

.field private static final TEFilterType_Color:I = 0x2

.field private static final TEFilterType_Effect_Color:I = 0x7

.field private static final TEFilterType_Effect_Filter:I = 0x8

.field private static final TEFilterType_Sticker:I = 0x0

.field private static final TEFilterType_TimeEffect:I = 0x6

.field private static final TEFilterType_TransForm:I = 0x3

.field private static final TEFilterType_WaterMark:I = 0x5

.field private static final TETrackProperty_BGM:I = 0x1

.field private static final TETrackProperty_OriginalSound:I = 0x0

.field public static final TETrackType_Audio:I = 0x1

.field public static final TETrackType_Video:I


# instance fields
.field private hasDestroyCalled:Z

.field private mAudioEffectfilterIndex:I

.field private mBCompileHighQualityGif:Z

.field private mBReversePlay:Z

.field private mBackGroundColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field private mCancelReverse:Z

.field private mColorFilterIndex:I

.field private mCompileType:Ljava/lang/String;

.field private mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

.field private mInPoint:I

.field private mInitDisplayHeight:I

.field private mInitDisplayWidth:I

.field private mInitSize:Lcom/ss/android/vesdk/VESize;

.field private mMasterTrackIndex:I

.field private mModelsDir:Ljava/lang/String;

.field private mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

.field private mOutPoint:I

.field private mOutputFile:Ljava/lang/String;

.field private mPool:Ljava/util/concurrent/ExecutorService;

.field private mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

.field private mReverseDone:Z

.field private mSurface:Landroid/view/Surface;

.field private mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

.field private mSurfaceHeight:I

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private mSurfaceView:Landroid/view/SurfaceView;

.field private mSurfaceWidth:I

.field private final mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

.field private mTextureView:Landroid/view/TextureView;

.field private mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

.field private mVideoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

.field private mbSeparateAV:Ljava/lang/Boolean;

.field private miFrameCount:I

.field private mlCompileStartTime:J

.field private mlCurTimeMS:J

.field private mlLastTimeMS:J

.field private mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

.field private waterMarkFile:Ljava/lang/String;

.field private waterMarkHeight:D

.field private waterMarkOffsetX:D

.field private waterMarkOffsetY:D

.field private waterMarkWidth:D


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/ss/android/vesdk/VESize;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    const-string v0, "mp4"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mPool:Ljava/util/concurrent/ExecutorService;

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    invoke-static {}, Lcom/ss/android/ttve/nativePort/TEInterface;->createEngine()Lcom/ss/android/ttve/nativePort/TEInterface;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCurTimeMS:J

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlLastTimeMS:J

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCompileStartTime:J

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBReversePlay:Z

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    const/high16 v2, -0x1000000

    iput v2, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z

    new-instance v0, Lcom/ss/android/vesdk/VEEditor$1;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$1;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    new-instance v0, Lcom/ss/android/vesdk/VEEditor$2;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$2;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

    new-instance v0, Lcom/ss/android/vesdk/VEEditor$3;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$3;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "VEEditor"

    const-string v2, "VEEditor no surface"

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    const-string p1, "iesve_veeditor_offscreen"

    const/4 v0, 0x1

    invoke-static {p1, v0, v1}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    return-void

    :cond_0
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const/16 v1, -0x64

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "workspace is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/view/SurfaceView;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/SurfaceView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/ss/android/vesdk/VESize;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    const-string v0, "mp4"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mPool:Ljava/util/concurrent/ExecutorService;

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    invoke-static {}, Lcom/ss/android/ttve/nativePort/TEInterface;->createEngine()Lcom/ss/android/ttve/nativePort/TEInterface;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCurTimeMS:J

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlLastTimeMS:J

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCompileStartTime:J

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBReversePlay:Z

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    const/high16 v1, -0x1000000

    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z

    new-instance v0, Lcom/ss/android/vesdk/VEEditor$1;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$1;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    new-instance v0, Lcom/ss/android/vesdk/VEEditor$2;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$2;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

    new-instance v0, Lcom/ss/android/vesdk/VEEditor$3;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$3;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "VEEditor"

    const-string v1, "VEEditor surfaceView"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {p2}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

    invoke-interface {p1, p2}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOpenGLListeners(Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;)V

    return-void

    :cond_0
    new-instance p2, Lcom/ss/android/vesdk/VEException;

    const/16 v0, -0x64

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "workspace is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, v0, p1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p2
.end method

.method public constructor <init>(Ljava/lang/String;Landroid/view/TextureView;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/TextureView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/ss/android/vesdk/VESize;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    const-string v0, "mp4"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mPool:Ljava/util/concurrent/ExecutorService;

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    invoke-static {}, Lcom/ss/android/ttve/nativePort/TEInterface;->createEngine()Lcom/ss/android/ttve/nativePort/TEInterface;

    move-result-object v2

    iput-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCurTimeMS:J

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlLastTimeMS:J

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    iput-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCompileStartTime:J

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBReversePlay:Z

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    const/high16 v1, -0x1000000

    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z

    new-instance v0, Lcom/ss/android/vesdk/VEEditor$1;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$1;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    new-instance v0, Lcom/ss/android/vesdk/VEEditor$2;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$2;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

    new-instance v0, Lcom/ss/android/vesdk/VEEditor$3;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/VEEditor$3;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "VEEditor"

    const-string v1, "VEEditor textureView"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureView:Landroid/view/TextureView;

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-virtual {p2, p1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mOpenGLCallback:Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOpenGLListeners(Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;)V

    return-void

    :cond_0
    new-instance p2, Lcom/ss/android/vesdk/VEException;

    const/16 v0, -0x64

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "workspace is: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, v0, p1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p2
.end method

.method static synthetic access$000(Lcom/ss/android/vesdk/VEEditor;)Landroid/graphics/SurfaceTexture;
    .locals 0

    iget-object p0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object p0
.end method

.method static synthetic access$002(Lcom/ss/android/vesdk/VEEditor;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    return-object p1
.end method

.method static synthetic access$100(Lcom/ss/android/vesdk/VEEditor;)Landroid/view/Surface;
    .locals 0

    iget-object p0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurface:Landroid/view/Surface;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/ss/android/vesdk/VEEditor;)J
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->mlLastTimeMS:J

    return-wide v0
.end method

.method static synthetic access$1002(Lcom/ss/android/vesdk/VEEditor;J)J
    .locals 0

    iput-wide p1, p0, Lcom/ss/android/vesdk/VEEditor;->mlLastTimeMS:J

    return-wide p1
.end method

.method static synthetic access$102(Lcom/ss/android/vesdk/VEEditor;Landroid/view/Surface;)Landroid/view/Surface;
    .locals 0

    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurface:Landroid/view/Surface;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/ss/android/vesdk/VEEditor;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    return p0
.end method

.method static synthetic access$1102(Lcom/ss/android/vesdk/VEEditor;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    return p1
.end method

.method static synthetic access$1200(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;
    .locals 0

    iget-object p0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/ss/android/vesdk/VEEditor;)V
    .locals 0

    invoke-direct {p0}, Lcom/ss/android/vesdk/VEEditor;->onMonitorCompile()V

    return-void
.end method

.method static synthetic access$1400(Lcom/ss/android/vesdk/VEEditor;)Lcom/ss/android/vesdk/runtime/VEEditorResManager;
    .locals 0

    iget-object p0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/ss/android/vesdk/VEEditor;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    return p0
.end method

.method static synthetic access$1502(Lcom/ss/android/vesdk/VEEditor;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    return p1
.end method

.method static synthetic access$1602(Lcom/ss/android/vesdk/VEEditor;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    return p1
.end method

.method static synthetic access$200(Lcom/ss/android/vesdk/VEEditor;Landroid/view/Surface;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/ss/android/vesdk/VEEditor;->onSurfaceCreated(Landroid/view/Surface;)V

    return-void
.end method

.method static synthetic access$302(Lcom/ss/android/vesdk/VEEditor;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    return p1
.end method

.method static synthetic access$402(Lcom/ss/android/vesdk/VEEditor;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    return p1
.end method

.method static synthetic access$500(Lcom/ss/android/vesdk/VEEditor;)V
    .locals 0

    invoke-direct {p0}, Lcom/ss/android/vesdk/VEEditor;->updateInitDisplaySize()V

    return-void
.end method

.method static synthetic access$600(Lcom/ss/android/vesdk/VEEditor;)V
    .locals 0

    invoke-direct {p0}, Lcom/ss/android/vesdk/VEEditor;->onSurfaceDestroyed()V

    return-void
.end method

.method static synthetic access$700(Lcom/ss/android/vesdk/VEEditor;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/ss/android/vesdk/VEEditor;->onSurfaceChanged(II)V

    return-void
.end method

.method static synthetic access$800(Lcom/ss/android/vesdk/VEEditor;)I
    .locals 0

    iget p0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    return p0
.end method

.method static synthetic access$802(Lcom/ss/android/vesdk/VEEditor;I)I
    .locals 0

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    return p1
.end method

.method static synthetic access$804(Lcom/ss/android/vesdk/VEEditor;)I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->miFrameCount:I

    return v0
.end method

.method static synthetic access$900(Lcom/ss/android/vesdk/VEEditor;)J
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->mlCurTimeMS:J

    return-wide v0
.end method

.method static synthetic access$902(Lcom/ss/android/vesdk/VEEditor;J)J
    .locals 0

    iput-wide p1, p0, Lcom/ss/android/vesdk/VEEditor;->mlCurTimeMS:J

    return-wide p1
.end method

.method private declared-synchronized addWaterMark([Landroid/graphics/Bitmap;ILcom/ss/android/vesdk/VESize;II)I
    .locals 0

    monitor-enter p0

    monitor-exit p0

    const/4 p1, 0x0

    return p1
.end method

.method private static checkFileExists(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    return p0
.end method

.method private declared-synchronized onMonitorCompile()V
    .locals 7

    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->mlCompileStartTime:J

    sub-long/2addr v0, v2

    const-string v2, "te_composition_time"

    invoke-static {v2, v0, v1}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfLong(Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor;->checkFileExists(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const/16 v0, 0xa

    new-array v0, v0, [I

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    invoke-static {v2, v0}, Lcom/ss/android/ttve/nativePort/TEVideoUtils;->getVideoFileInfo(Ljava/lang/String;[I)I

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    const-string v4, "te_composition_file_size"

    long-to-double v2, v2

    const-wide/high16 v5, 0x4090000000000000L    # 1024.0

    div-double/2addr v2, v5

    div-double/2addr v2, v5

    invoke-static {v4, v2, v3}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfDouble(Ljava/lang/String;D)V

    const-string v2, "te_composition_file_duration"

    const/4 v3, 0x3

    aget v3, v0, v3

    int-to-double v3, v3

    invoke-static {v2, v3, v4}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfDouble(Ljava/lang/String;D)V

    const-string v2, "te_composition_bit_rate"

    const/4 v3, 0x6

    aget v3, v0, v3

    int-to-double v3, v3

    invoke-static {v2, v3, v4}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfDouble(Ljava/lang/String;D)V

    const-string v2, "te_composition_fps"

    const/4 v3, 0x7

    aget v3, v0, v3

    int-to-double v3, v3

    invoke-static {v2, v3, v4}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfDouble(Ljava/lang/String;D)V

    const-string v2, "te_composition_resolution"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    aget v4, v0, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v0, v0, v1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/ss/android/ttve/monitor/TEMonitor;->perfString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    sget v0, Lcom/ss/android/ttve/monitor/TEMonitor;->MONITOR_ACTION_COMPILE:I

    invoke-static {v0}, Lcom/ss/android/ttve/monitor/TEMonitor;->report(I)V

    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    const-string v2, "iesve_veeditor_composition_finish_file"

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v2

    const-string v3, "iesve_veeditor_composition_finish_result"

    const-string v4, "succ"

    invoke-virtual {v2, v3, v4}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v2

    const-string v3, "iesve_veeditor_composition_finish_reason"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string v2, "iesve_veeditor_composition_finish"

    invoke-static {v2, v1, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized onSurfaceChanged(II)V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "onSurfaceChanged..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setSurfaceSize(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized onSurfaceCreated(Landroid/view/Surface;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "surfaceCreated..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setPreviewSurface(Landroid/view/Surface;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized onSurfaceDestroyed()V
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "surfaceDestroyed..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->releasePreviewSurface()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized setAudioEffectParam(IIILcom/ss/android/vesdk/VEAudioEffectBean;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean p1, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    const-string p1, "VEEditor"

    const-string p2, "setAudioEffectParam..."

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "audioEffectType"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->type:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "formatShiftOn"

    iget-boolean v0, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->formatShiftOn:Z

    if-eqz v0, :cond_1

    const-string v0, "1"

    goto :goto_0

    :cond_1
    const-string v0, "0"

    :goto_0
    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "smoothOn"

    iget-boolean v0, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->smoothOn:Z

    if-eqz v0, :cond_2

    const-string v0, "1"

    goto :goto_1

    :cond_2
    const-string v0, "0"

    :goto_1
    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "processChMode"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->processChMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string/jumbo p2, "transientDetectMode"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->transientDetectMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "phaseResetMode"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->phaseResetMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "phaseAdjustMethod"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->phaseAdjustMethod:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string/jumbo p2, "windowMode"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->windowMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "pitchTunerMode"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->pitchTunerMode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "blockSize"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->blockSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "centtone"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->centtone:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "semiton"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->semiton:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "octative"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->octative:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p3, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string p2, "speedRatio"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p4, p4, Lcom/ss/android/vesdk/VEAudioEffectBean;->speedRatio:F

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p1, p3, p2, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized setBitrateOptions(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)V
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwCRF()I

    move-result v1

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwMaxRate()I

    move-result v2

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwPreset()I

    move-result v3

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSwQP()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileSoftwareEncodeOptions(IIII)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getBps()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileHardwareEncodeOptions(I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getBitrateMode()Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ordinal()I

    move-result v1

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getEncodeProfile()I

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileCommonEncodeOptions(II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized updateInitDisplaySize()V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v0, v0, Lcom/ss/android/vesdk/VESize;->width:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v1, v1, Lcom/ss/android/vesdk/VESize;->height:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v1, v1, Lcom/ss/android/vesdk/VESize;->width:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v2, v2, Lcom/ss/android/vesdk/VESize;->height:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    div-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v1, v1, Lcom/ss/android/vesdk/VESize;->height:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    iget v2, v2, Lcom/ss/android/vesdk/VESize;->width:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    div-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized addAudioEffects(II[I[I[Lcom/ss/android/vesdk/VEAudioEffectBean;)[I
    .locals 9

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    monitor-exit p0

    return-object p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v1, "addAudioEffects..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    array-length v0, p3

    new-array v2, v0, [I

    new-array v6, v0, [I

    new-array v7, v0, [I

    new-array v3, v0, [Ljava/lang/String;

    const/4 v8, 0x0

    move v1, v8

    :goto_0
    if-ge v1, v0, :cond_1

    aput p1, v2, v1

    aput p2, v6, v1

    const-string v4, "audio effect"

    aput-object v4, v3, v1

    const/4 v4, 0x1

    aput v4, v7, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p3

    :goto_1
    if-ge v8, v0, :cond_2

    aget p4, p3, v8

    aget-object v1, p5, v8

    invoke-direct {p0, p1, p2, p4, v1}, Lcom/ss/android/vesdk/VEEditor;->setAudioEffectParam(IIILcom/ss/android/vesdk/VEAudioEffectBean;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_2
    monitor-exit p0

    return-object p3

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized addAudioTrack(Ljava/lang/String;IIIIZ)I
    .locals 9

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "addAudioTrack..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v1, -0x64

    if-eqz v0, :cond_1

    monitor-exit p0

    return v1

    :cond_1
    if-le p3, p2, :cond_5

    if-gez p2, :cond_2

    goto :goto_1

    :cond_2
    if-le p5, p4, :cond_4

    if-gez p4, :cond_3

    goto :goto_0

    :cond_3
    :try_start_2
    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move-object v3, p1

    move v4, p4

    move v5, p5

    move v6, p2

    move v7, p3

    move v8, p6

    invoke-virtual/range {v2 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->addAudioTrack(Ljava/lang/String;IIIIZ)I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    :cond_4
    :goto_0
    monitor-exit p0

    return v1

    :cond_5
    :goto_1
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized addAudioTrack(Ljava/lang/String;IIIIZII)I
    .locals 11

    move-object v1, p0

    move v0, p2

    move v4, p4

    monitor-enter p0

    :try_start_0
    iget-boolean v2, v1, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v2, "VEEditor"

    const-string v3, "addAudioTrack..."

    invoke-static {v2, v3}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v3, -0x64

    if-eqz v2, :cond_1

    monitor-exit p0

    return v3

    :cond_1
    move v7, p3

    if-le v7, v0, :cond_5

    if-gez v0, :cond_2

    goto :goto_1

    :cond_2
    move/from16 v5, p5

    if-le v5, v4, :cond_4

    if-gez v4, :cond_3

    goto :goto_0

    :cond_3
    :try_start_2
    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move-object v3, p1

    move v6, v0

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    invoke-virtual/range {v2 .. v10}, Lcom/ss/android/ttve/nativePort/TEInterface;->addAudioTrack(Ljava/lang/String;IIIIZII)I

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v0

    :cond_4
    :goto_0
    monitor-exit p0

    return v3

    :cond_5
    :goto_1
    monitor-exit p0

    return v3

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addAudioTrack(Ljava/lang/String;IIZ)I
    .locals 10

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "addAudioTrack..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v1, -0x64

    if-eqz v0, :cond_1

    monitor-exit p0

    return v1

    :cond_1
    if-le p3, p2, :cond_3

    if-gez p2, :cond_2

    goto :goto_0

    :cond_2
    :try_start_2
    const-string v0, "iesve_veeditor_import_music"

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v5, 0x0

    sub-int v6, p3, p2

    move-object v4, p1

    move v7, p2

    move v8, p3

    move v9, p4

    invoke-virtual/range {v3 .. v9}, Lcom/ss/android/ttve/nativePort/TEInterface;->addAudioTrack(Ljava/lang/String;IIIIZ)I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    :cond_3
    :goto_0
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized addEqualizer(IIIII)I
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v7, 0x0

    aput p1, v2, v7

    const-string p1, "audio equalizer"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    new-array v3, v1, [I

    aput p4, v3, v7

    new-array v4, v1, [I

    aput p5, v4, v7

    new-array v5, v1, [I

    aput p2, v5, v7

    new-array v6, v1, [I

    aput v1, v6, v7

    move-object v1, v2

    move-object v2, p1

    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p4, p1, v7

    const-string p5, "preset_id"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p4, p5, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    aget p1, p1, v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized addExtRes(Ljava/lang/String;IIIIFFFF)I
    .locals 22

    move-object/from16 v1, p0

    move/from16 v0, p2

    move/from16 v2, p3

    monitor-enter p0

    :try_start_0
    const-string v3, "VEEditor"

    const-string v4, "addSticker..."

    invoke-static {v3, v4}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v3, v1, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    if-gt v0, v2, :cond_2

    if-ltz v0, :cond_2

    :try_start_1
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    const-string v3, "iesve_veeditor_import_sticker"

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-static {v3, v5, v4}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    iget-object v6, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    new-array v7, v5, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v7, v3

    new-array v9, v5, [I

    aput v0, v9, v3

    new-array v10, v5, [I

    aput v2, v10, v3

    new-array v11, v5, [I

    aput p4, v11, v3

    new-array v12, v5, [I

    aput p5, v12, v3

    move/from16 v0, p8

    float-to-double v13, v0

    move/from16 v0, p9

    float-to-double v2, v0

    move/from16 v0, p6

    float-to-double v4, v0

    move/from16 v0, p7

    move-object/from16 v21, v9

    float-to-double v8, v0

    move-wide/from16 v19, v8

    const/4 v0, 0x0

    move-object v8, v0

    move-object/from16 v9, v21

    move-wide v15, v2

    move-wide/from16 v17, v4

    invoke-virtual/range {v6 .. v20}, Lcom/ss/android/ttve/nativePort/TEInterface;->addSticker([Ljava/lang/String;[Ljava/lang/String;[I[I[I[IDDDD)I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :cond_2
    :goto_0
    const/16 v0, -0x64

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addFilterEffects([I[I[Ljava/lang/String;)[I
    .locals 9

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    monitor-exit p0

    return-object p1

    :cond_0
    :try_start_1
    array-length v0, p1

    new-array v2, v0, [I

    new-array v6, v0, [I

    new-array v7, v0, [I

    new-array v3, v0, [Ljava/lang/String;

    const/4 v8, 0x0

    move v1, v8

    :goto_0
    if-ge v1, v0, :cond_1

    aput v8, v2, v1

    aput v8, v6, v1

    const-string v4, "filter effect"

    aput-object v4, v3, v1

    const/16 v4, 0x8

    aput v4, v7, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move-object v4, p1

    move-object v5, p2

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    array-length p2, p1

    if-eq v0, p2, :cond_2

    new-array p1, v0, [I

    const/4 p2, -0x1

    invoke-static {p1, p2}, Ljava/util/Arrays;->fill([II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_2
    :goto_1
    if-ge v8, v0, :cond_3

    :try_start_2
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v1, p1, v8

    const-string v2, "effect res path"

    aget-object v3, p3, v8

    invoke-virtual {p2, v1, v2, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_3
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized addInfoSticker(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 3
    .param p2    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "addInfoSticker..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_2
    const-string v0, "iesve_veeditor_import_sticker"

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->addInfoSticker(Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized addMetadata(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v1, "addMetadata..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->addMetaData(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, 0x0

    monitor-exit p0

    return p1

    :cond_2
    :goto_0
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized addPitchTempo(IIFFII)I
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v7, 0x0

    aput p1, v2, v7

    const-string p1, "audio pitch tempo"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    new-array v3, v1, [I

    aput p5, v3, v7

    new-array v4, v1, [I

    aput p6, v4, v7

    new-array v5, v1, [I

    aput p2, v5, v7

    new-array v6, v1, [I

    aput v1, v6, v7

    move-object v1, v2

    move-object v2, p1

    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p5, p1, v7

    const-string p6, "pitch_scale"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p5, p6, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p3, p1, v7

    const-string p5, "time_ratio"

    new-instance p6, Ljava/lang/StringBuilder;

    invoke-direct {p6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, ""

    invoke-virtual {p6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p6, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p3, p5, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    aget p1, p1, v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized addRepeatEffect(IIIII)I
    .locals 10

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addRepeatEffect... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->pauseSync()I

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "VEEditor"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "pauseSync failed, ret "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, -0x1

    monitor-exit p0

    return p1

    :cond_1
    :try_start_2
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v8, 0x1

    new-array v2, v8, [I

    const/4 v9, 0x0

    aput p1, v2, v9

    const-string p1, "timeEffect repeating"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v3

    new-array v4, v8, [I

    aput p3, v4, v9

    new-array v5, v8, [I

    aput v0, v5, v9

    new-array v6, v8, [I

    aput p2, v6, v9

    new-array v7, v8, [I

    const/4 p1, 0x6

    aput p1, v7, v9

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    aget p2, p1, v9

    iput p2, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p3, p1, v9

    const-string v0, "timeEffect repeating duration"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p2, p3, v0, p5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p3, p1, v9

    const-string p5, "timeEffect repeating times"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p3, p5, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    new-instance p2, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    const-string p3, "iesve_veeditor_time_effect_id"

    const-string p4, "repeat"

    invoke-virtual {p2, p3, p4}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string p3, "iesve_veeditor_time_effect"

    invoke-static {p3, v8, p2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    aget p1, p1, v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized addReverb(IIFFFFFII)I
    .locals 10

    move-object v1, p0

    monitor-enter p0

    :try_start_0
    iget-boolean v0, v1, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v0, 0x1

    new-array v3, v0, [I

    const/4 v9, 0x0

    aput p1, v3, v9

    const-string v4, "audio reverb"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    new-array v5, v0, [I

    aput p8, v5, v9

    new-array v6, v0, [I

    aput p9, v6, v9

    new-array v7, v0, [I

    aput p2, v7, v9

    new-array v8, v0, [I

    aput v0, v8, v9

    invoke-virtual/range {v2 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object v0

    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v0, v9

    const-string v4, "room_size"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v6, p3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v0, v9

    const-string v4, "hfDamping"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v6, p4

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v0, v9

    const-string v4, "stereoDepth"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v6, p5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v0, v9

    const-string v4, "dry"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v6, p6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v0, v9

    const-string/jumbo v4, "wet"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v6, p7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    aget v0, v0, v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addSegmentVolume([I[I[I[I[F)[I
    .locals 9

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    monitor-exit p0

    return-object p1

    :cond_0
    :try_start_1
    array-length v0, p3

    new-array v3, v0, [Ljava/lang/String;

    new-array v7, v0, [I

    const/4 v8, 0x0

    move v1, v8

    :goto_0
    if-ge v1, v0, :cond_1

    const-string v2, "audio volume filter"

    aput-object v2, v3, v1

    const/4 v2, 0x1

    aput v2, v7, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move-object v2, p1

    move-object v4, p3

    move-object v5, p4

    move-object v6, p2

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    :goto_1
    if-ge v8, v0, :cond_2

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget p3, p1, v8

    const-string p4, "audio volume"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v2, p5, v8

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, p3, p4, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_2
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized addSlowMotionEffect(IIIIFF)I
    .locals 17

    move-object/from16 v1, p0

    move/from16 v0, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    monitor-enter p0

    :try_start_0
    iget-boolean v7, v1, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v7, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v7, "VEEditor"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "addSlowMotionEffect... "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v7, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->pauseSync()I

    move-result v7

    if-eqz v7, :cond_1

    const-string v0, "VEEditor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pauseSync failed, ret "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v0, -0x1

    monitor-exit p0

    return v0

    :cond_1
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v7

    iget-object v8, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v15, 0x1

    new-array v9, v15, [I

    const/16 v16, 0x0

    aput v0, v9, v16

    const-string v0, "timeEffect slow motion"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v10

    new-array v11, v15, [I

    aput v3, v11, v16

    new-array v12, v15, [I

    aput v7, v12, v16

    new-array v13, v15, [I

    aput v2, v13, v16

    new-array v14, v15, [I

    const/4 v0, 0x6

    aput v0, v14, v16

    invoke-virtual/range {v8 .. v14}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object v0

    aget v2, v0, v16

    iput v2, v1, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v0, v16

    const-string v7, "timeEffect slow motion duration"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v7, v4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v0, v16

    const-string v4, "timeEffect slow motion speed"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v3, v0, v16

    const-string v4, "timeEffect fast motion speed"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, ""

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    new-instance v2, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    const-string v3, "iesve_veeditor_time_effect_id"

    const-string v4, "slow"

    invoke-virtual {v2, v3, v4}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string v3, "iesve_veeditor_time_effect"

    invoke-static {v3, v15, v2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    aget v0, v0, v16
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addSticker(Ljava/lang/String;IIIIFFFF)I
    .locals 22

    move-object/from16 v1, p0

    move/from16 v0, p2

    move/from16 v2, p3

    monitor-enter p0

    :try_start_0
    const-string v3, "VEEditor"

    const-string v4, "addSticker..."

    invoke-static {v3, v4}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v3, v1, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    if-gt v0, v2, :cond_2

    if-ltz v0, :cond_2

    :try_start_1
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    const-string v3, "iesve_veeditor_import_sticker"

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-static {v3, v5, v4}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    iget-object v6, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    new-array v7, v5, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v7, v3

    new-array v9, v5, [I

    aput v0, v9, v3

    new-array v10, v5, [I

    aput v2, v10, v3

    new-array v11, v5, [I

    aput p4, v11, v3

    new-array v12, v5, [I

    aput p5, v12, v3

    move/from16 v0, p8

    float-to-double v13, v0

    move/from16 v0, p9

    float-to-double v2, v0

    move/from16 v0, p6

    float-to-double v4, v0

    move/from16 v0, p7

    move-object/from16 v21, v9

    float-to-double v8, v0

    move-wide/from16 v19, v8

    const/4 v0, 0x0

    move-object v8, v0

    move-object/from16 v9, v21

    move-wide v15, v2

    move-wide/from16 v17, v4

    invoke-virtual/range {v6 .. v20}, Lcom/ss/android/ttve/nativePort/TEInterface;->addSticker([Ljava/lang/String;[Ljava/lang/String;[I[I[I[IDDDD)I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :cond_2
    :goto_0
    const/16 v0, -0x64

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addWaterMark(Ljava/lang/String;DDDD)I
    .locals 15

    move-object v1, p0

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v2, "addWaterMark..."

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, v1, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v5, 0x0

    new-array v6, v0, [I

    aput v4, v6, v4

    new-array v0, v0, [I

    iget-object v7, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDuration()I

    move-result v7

    aput v7, v0, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v0

    move-wide/from16 v7, p6

    move-wide/from16 v9, p8

    move-wide/from16 v11, p2

    move-wide/from16 v13, p4

    invoke-virtual/range {v2 .. v14}, Lcom/ss/android/ttve/nativePort/TEInterface;->addWaterMark([Ljava/lang/String;[Ljava/lang/String;[I[IDDDD)I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addWaterMarkForGifHigh(Ljava/lang/String;DDDD)I
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkFile:Ljava/lang/String;

    iput-wide p2, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkWidth:D

    iput-wide p4, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkHeight:D

    iput-wide p6, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetX:D

    iput-wide p8, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetY:D
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, 0x0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized cancelReverseVideo()I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v1, -0x69

    if-eqz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    monitor-exit p0

    return v1

    :cond_1
    :try_start_2
    new-instance v0, Lcom/ss/android/medialib/FFMpegInvoker;

    invoke-direct {v0}, Lcom/ss/android/medialib/FFMpegInvoker;-><init>()V

    invoke-virtual {v0}, Lcom/ss/android/medialib/FFMpegInvoker;->stopReverseVideo()I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 v0, 0x0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized changeRes([Ljava/lang/String;[I[I[Ljava/lang/String;[Ljava/lang/String;[I[ILcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v1, "reInit..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->stop()I

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    const-string p1, "VEEditor"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "stop in changeRes failed, ret = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v1

    :cond_1
    :try_start_2
    invoke-virtual/range {p0 .. p8}, Lcom/ss/android/vesdk/VEEditor;->init2([Ljava/lang/String;[I[I[Ljava/lang/String;[Ljava/lang/String;[I[ILcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;)I

    move-result p1

    if-eqz p1, :cond_2

    const-string p2, "VEEditor"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "init2 in changeRes failed, ret = "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    :cond_2
    :try_start_3
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    const/4 p1, 0x0

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDuration()I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget p2, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iget p3, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iget-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-virtual {p1, p2, p3, v1, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized clearDisplay(I)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->clearDisplay(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized compile(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/vesdk/VEVideoEncodeSettings;)V
    .locals 10

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "VEEditor.compile(outFilePath = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p1, :cond_1

    const-string p1, "VEEditor"

    const-string p2, "IllegalArgumentError: outFilePath == null"

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    if-nez p3, :cond_2

    :try_start_2
    const-string p1, "VEEditor"

    const-string p2, "IllegalArgumentError: VEVideoEncodeSettings == null"

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    :try_start_3
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getNativeHandler()J

    move-result-wide v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_3

    monitor-exit p0

    return-void

    :cond_3
    :try_start_4
    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->mlCompileStartTime:J

    const-string v0, "VEEditor"

    const-string v1, "compile..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->stop()I

    sget-object v0, Lcom/ss/android/vesdk/VEEditor$7;->$SwitchMap$com$ss$android$vesdk$VEVideoEncodeSettings$COMPILE_TYPE:[I

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getCompileType()Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    move-result-object v1

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x2

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    goto/16 :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-boolean p1, p1, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->mIsRunning:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz p1, :cond_4

    monitor-exit p0

    return-void

    :cond_4
    :try_start_5
    iput-boolean v2, p0, Lcom/ss/android/vesdk/VEEditor;->mBCompileHighQualityGif:Z

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileType(I)V

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    if-nez p1, :cond_5

    new-instance p1, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    invoke-direct {p1, p0}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;-><init>(Lcom/ss/android/vesdk/VEEditor;)V

    iput-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v0, Ljava/io/File;

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-char v0, Ljava/io/File;->separatorChar:C

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v0, "gif.mp4"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    invoke-virtual {v0, p1}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setInputFile(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setOutputFile(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkFile:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setWaterMarkFile(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-wide v3, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkWidth:D

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object v5

    iget v5, v5, Lcom/ss/android/vesdk/VESize;->width:I

    int-to-double v5, v5

    mul-double/2addr v3, v5

    double-to-int v3, v3

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setWaterMarkWidth(I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-wide v3, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkHeight:D

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object v5

    iget v5, v5, Lcom/ss/android/vesdk/VESize;->height:I

    int-to-double v5, v5

    mul-double/2addr v3, v5

    double-to-int v3, v3

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setWaterMarkHeight(I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-wide v3, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetX:D

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object v5

    iget v5, v5, Lcom/ss/android/vesdk/VESize;->width:I

    int-to-double v5, v5

    mul-double/2addr v3, v5

    double-to-int v3, v3

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setWaterMarkOffsetX(I)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mp4ToGIFConverter:Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;

    iget-wide v3, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetY:D

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object v5

    iget v5, v5, Lcom/ss/android/vesdk/VESize;->height:I

    int-to-double v5, v5

    mul-double/2addr v3, v5

    double-to-int v3, v3

    invoke-virtual {v0, v3}, Lcom/ss/android/vesdk/VEEditor$Mp4ToHighQualityGIFConverter;->setWaterMarkOffsetY(I)V

    nop

    const-string v0, "high_gif"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    goto :goto_1

    :pswitch_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileType(I)V

    const-string v0, "gif"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    goto :goto_1

    :pswitch_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileType(I)V

    const-string v0, "mp4"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    goto :goto_1

    :goto_0
    invoke-virtual {v0, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileType(I)V

    const-string v0, "mp4"

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    :goto_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getFps()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileFps(I)V

    invoke-direct {p0, p3}, Lcom/ss/android/vesdk/VEEditor;->setBitrateOptions(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setEngineCompilePath(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getResizeMode()I

    move-result p2

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getResizeX()F

    move-result v0

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getResizeY()F

    move-result v3

    invoke-virtual {p1, p2, v0, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setResizer(IFF)V

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getRotate()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setUsrRotate(I)V

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->isHwEnc()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setUseHwEnc(Z)V

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getGopSize()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setEncGopSize(I)V

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getSpeed()F

    move-result p2

    invoke-virtual {p1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setSpeedRatio(F)V

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object p2

    iget p2, p2, Lcom/ss/android/vesdk/VESize;->width:I

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getVideoRes()Lcom/ss/android/vesdk/VESize;

    move-result-object v0

    iget v0, v0, Lcom/ss/android/vesdk/VESize;->height:I

    invoke-virtual {p1, p2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setWidthHeight(II)V

    invoke-virtual {p3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->getWatermarkParam()Lcom/ss/android/vesdk/VEWatermarkParam;

    move-result-object p1

    if-eqz p1, :cond_6

    iget-boolean p2, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->needExtFile:Z

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p2, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCompileWatermark(Lcom/ss/android/vesdk/VEWatermarkParam;)V

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget p3, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-virtual {p2, p3, v0, v1, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz p2, :cond_7

    monitor-exit p0

    return-void

    :cond_6
    :try_start_6
    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget p3, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-virtual {p2, p3, v0, v2, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result p2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-eqz p2, :cond_7

    monitor-exit p0

    return-void

    :cond_7
    if-eqz p1, :cond_8

    :try_start_7
    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object v4, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->images:[Ljava/lang/String;

    iget v5, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->interval:I

    iget v6, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->xOffset:I

    iget v7, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->yOffset:I

    iget v8, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->width:I

    iget v9, p1, Lcom/ss/android/vesdk/VEWatermarkParam;->height:I

    invoke-virtual/range {v3 .. v9}, Lcom/ss/android/ttve/nativePort/TEInterface;->setWaterMark([Ljava/lang/String;IIIII)V

    :cond_8
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->start()I

    new-instance p1, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    const-string p2, "iesve_veeditor_composition_start_file"

    iget-object p3, p0, Lcom/ss/android/vesdk/VEEditor;->mCompileType:Ljava/lang/String;

    invoke-virtual {p1, p2, p3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string p2, "iesve_veeditor_composition_start"

    invoke-static {p2, v2, p1}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public declared-synchronized deleteAudioFilters([I)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v1, "deleteAudioFilter..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeFilter([I)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized deleteAudioTrack(I)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v1, "deleteAudioTrack..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->deleteAudioTrack(I)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :cond_1
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized deleteFilterEffects([I)I
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeFilter([I)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized deleteRepeatEffect(I)I
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleteRepeatEffect... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->pauseSync()I

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pauseSync failed, ret "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, -0x1

    monitor-exit p0

    return p1

    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeFilter([I)I

    move-result p1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized deleteSlowEffect(I)I
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleteSlowEffect... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->pauseSync()I

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pauseSync failed, ret "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, -0x1

    monitor-exit p0

    return p1

    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeFilter([I)I

    move-result p1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized deleteSticker(I)I
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "deleteSticker..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-gez p1, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->deleteSticker(I)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized deleteWaterMark(I)I
    .locals 0

    monitor-enter p0

    monitor-exit p0

    const/4 p1, 0x0

    return p1
.end method

.method public declared-synchronized destroy()V
    .locals 4

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z

    const-string v0, "VEEditor"

    const-string v1, "onDestroy..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getNativeHandler()J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceView:Landroid/view/SurfaceView;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceView:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceCallback:Landroid/view/SurfaceHolder$Callback2;

    invoke-interface {v0, v2}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureView:Landroid/view/TextureView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->getSurfaceTextureListener()Landroid/view/TextureView$SurfaceTextureListener;

    move-result-object v0

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    :cond_2
    :goto_0
    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceView:Landroid/view/SurfaceView;

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mTextureView:Landroid/view/TextureView;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setOpenGLListeners(Lcom/ss/android/ttve/nativePort/NativeCallbacks$IOpenGLCallback;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setInfoListener(Lcom/ss/android/ttve/common/TECommonCallback;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setErrorListener(Lcom/ss/android/ttve/common/TECommonCallback;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->destroyEngine()I

    :cond_3
    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized disableAudioEffect(II)I
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "disableAudioEffect..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1, p1, v0, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->adjustFilterInOut(III)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized disableFilterEffect(II)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-ltz p1, :cond_2

    if-gez p2, :cond_1

    goto :goto_0

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->adjustFilterInOut(III)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :cond_2
    :goto_0
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized enableAudioEffect(IIILcom/ss/android/vesdk/VEAudioEffectBean;)I
    .locals 9

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v1, "enableAudioEffect..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v2, 0x1

    new-array v3, v2, [I

    const/4 v8, 0x0

    aput p1, v3, v8

    const-string v4, "audio effect"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    new-array v5, v2, [I

    aput p3, v5, v8

    new-array p3, v2, [I

    aput v0, p3, v8

    new-array v6, v2, [I

    aput p2, v6, v8

    new-array v7, v2, [I

    aput v2, v7, v8

    move-object v2, v3

    move-object v3, v4

    move-object v4, v5

    move-object v5, p3

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p3

    aget v0, p3, v8

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    aget v0, p3, v8

    invoke-direct {p0, p1, p2, v0, p4}, Lcom/ss/android/vesdk/VEEditor;->setAudioEffectParam(IIILcom/ss/android/vesdk/VEAudioEffectBean;)V

    aget p1, p3, v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized enableAudioEffect(ILcom/ss/android/vesdk/VEAudioEffectBean;)I
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "enableAudioEffect..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0, p1, p2}, Lcom/ss/android/vesdk/VEEditor;->enableAudioEffect(IIILcom/ss/android/vesdk/VEAudioEffectBean;)I

    move-result p1

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    iget p1, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized enableFilterEffect(ILjava/lang/String;)I
    .locals 10

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-ltz p1, :cond_3

    :try_start_1
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    if-gt p1, v0, :cond_3

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v8, 0x1

    new-array v2, v8, [I

    const/4 v9, 0x0

    aput v9, v2, v9

    const-string/jumbo v3, "video effect"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    new-array v4, v8, [I

    aput p1, v4, v9

    new-array v5, v8, [I

    aput v0, v5, v9

    new-array v6, v8, [I

    aput v9, v6, v9

    new-array v7, v8, [I

    const/16 p1, 0x8

    aput p1, v7, v9

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    aget v1, p1, v9

    const-string v2, "effect res path"

    invoke-virtual {v0, v1, v2, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    const-string v1, ""

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    array-length v2, p2

    if-lez v2, :cond_2

    array-length v1, p2

    sub-int/2addr v1, v8

    aget-object v1, p2, v1

    :cond_2
    const-string p2, "iesve_veeditor_filter_effect_id"

    invoke-virtual {v0, p2, v1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string p2, "iesve_veeditor_filter_effect"

    invoke-static {p2, v8, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    aget p1, p1, v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :cond_3
    :goto_0
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized enableReversePlay(Z)I
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v1, -0x69

    if-eqz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    array-length v0, v0

    if-gtz v0, :cond_2

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->stop()I

    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    :goto_0
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateTrackClips(II[Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_4

    const-string p1, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Create Scene failed, ret = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v0

    :cond_4
    :try_start_3
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-boolean v1, p0, Lcom/ss/android/vesdk/VEEditor;->mBReversePlay:Z

    const/4 v3, 0x1

    if-eq p1, v1, :cond_5

    move v1, v3

    goto :goto_1

    :cond_5
    move v1, v2

    :goto_1
    invoke-virtual {v0, v2, v2, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateTrackFilter(IIZ)I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDuration()I

    move-result v1

    iget-object v4, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-virtual {v0, v2, v1, v2, v4}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    sget-object v0, Lcom/ss/android/vesdk/VEEditor$SEEK_MODE;->EDITOR_SEEK_FLAG_LastSeek:Lcom/ss/android/vesdk/VEEditor$SEEK_MODE;

    invoke-virtual {p0, v2, v0}, Lcom/ss/android/vesdk/VEEditor;->seek(ILcom/ss/android/vesdk/VEEditor$SEEK_MODE;)I

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEEditor;->mBReversePlay:Z

    if-eqz p1, :cond_6

    new-instance p1, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    const-string v0, "iesve_veeditor_time_effect_id"

    const-string v1, "reverse"

    invoke-virtual {p1, v0, v1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string v0, "iesve_veeditor_time_effect"

    invoke-static {v0, v3, p1}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_6
    monitor-exit p0

    return v2

    :cond_7
    :goto_2
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized genReverseVideo()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, -0x1

    if-eqz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v2, "reverse..."

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    if-nez v0, :cond_1

    const-string v0, "VEEditor"

    const-string v2, "reverse may be canceled"

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v1

    :cond_1
    :try_start_2
    iget-object v2, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v2, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v2, v2

    if-gtz v2, :cond_2

    goto :goto_1

    :cond_2
    new-instance v2, Lcom/ss/android/medialib/FFMpegInvoker;

    invoke-direct {v2}, Lcom/ss/android/medialib/FFMpegInvoker;-><init>()V

    iget-object v3, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v3, v3

    new-array v3, v3, [Ljava/lang/String;

    iput-object v3, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    iget-object v5, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    array-length v5, v5

    if-ge v4, v5, :cond_5

    invoke-virtual {v0, v4}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->genReverseVideoPath(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    aget-object v6, v6, v4

    invoke-virtual {v2, v6, v5}, Lcom/ss/android/medialib/FFMpegInvoker;->addFastReverseVideo(Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    iget-boolean v7, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    if-eqz v7, :cond_3

    iput-boolean v3, p0, Lcom/ss/android/vesdk/VEEditor;->mCancelReverse:Z

    const-string v0, "VEEditor"

    const-string v2, "reverse failed, reverse has been canceled"

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v1

    :cond_3
    if-eqz v6, :cond_4

    :try_start_3
    const-string v0, "VEEditor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "reverse mResManager.mVideoPaths["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "] failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return v1

    :cond_4
    :try_start_4
    iget-object v6, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    aput-object v5, v6, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return v3

    :cond_6
    :goto_1
    const/16 v0, -0x64

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized genReverseVideoAsync(Lcom/ss/android/vesdk/VEReverseCallback;)V
    .locals 2
    .param p1    # Lcom/ss/android/vesdk/VEReverseCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mPool:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/ss/android/vesdk/VEEditor$6;

    invoke-direct {v1, p0, p1}, Lcom/ss/android/vesdk/VEEditor$6;-><init>(Lcom/ss/android/vesdk/VEEditor;Lcom/ss/android/vesdk/VEReverseCallback;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getCurPosition()I
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getCurPosition()I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getCurrDisplayImage()Landroid/graphics/Bitmap;
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-object v1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDisplayRect()Lcom/ss/android/vesdk/VERect;

    move-result-object v0

    iget v2, v0, Lcom/ss/android/vesdk/VERect;->width:I

    iget v3, v0, Lcom/ss/android/vesdk/VERect;->height:I

    mul-int/2addr v2, v3

    mul-int/lit8 v2, v2, 0x4

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDisplayImage([B)I

    move-result v3

    if-eqz v3, :cond_1

    const-string v0, "VEEditor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getDisplayImage failed "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v1

    :cond_1
    :try_start_2
    iget v1, v0, Lcom/ss/android/vesdk/VERect;->width:I

    iget v0, v0, Lcom/ss/android/vesdk/VERect;->height:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v0, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDuration()I
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDuration()I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getInfoStickerBoundingBox(I)[F
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "getInfoStickerBoundingBox..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    monitor-exit p0

    return-object p1

    :cond_0
    if-ltz p1, :cond_1

    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getInfoStickerBoundingBox(I)[F

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_1
    :try_start_2
    new-instance p1, Lcom/ss/android/vesdk/VEException;

    const/16 v0, -0x64

    const-string v1, ""

    invoke-direct {p1, v0, v1}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getInitSize()Lcom/ss/android/vesdk/VESize;
    .locals 3

    monitor-enter p0

    :try_start_0
    new-instance v0, Lcom/ss/android/vesdk/VESize;

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    iget v2, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VESize;-><init>(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getReverseVideoPaths()[Ljava/lang/String;
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-object v1

    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_1
    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getState()Lcom/ss/android/vesdk/VEEditor$VEState;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/16 v1, -0x69

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->getCurState()I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor$VEState;->valueOf(I)Lcom/ss/android/vesdk/VEEditor$VEState;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const-string v2, " native video editor is null"

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const-string/jumbo v2, "video editor is null"

    invoke-direct {v0, v1, v2}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getVolume(III)F
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "getVolume..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/high16 p1, -0x3d2e0000    # -105.0f

    monitor-exit p0

    return p1

    :cond_0
    if-ltz p3, :cond_2

    :try_start_1
    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    if-le p3, v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p2, p1, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->getTrackVolume(III)F

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :cond_2
    :goto_0
    const/high16 p1, -0x3d380000    # -100.0f

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized init([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;)I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v1, "20190322_ec3de33"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "VEEditor"

    const-string v1, "init..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->getWorkspace()Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x0

    move-object v7, v0

    check-cast v7, [[Ljava/lang/String;

    invoke-virtual {p4}, Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;->ordinal()I

    move-result v8

    move-object v4, p1

    move-object v5, p3

    move-object v6, p2

    invoke-virtual/range {v2 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->createScene(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[[Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "VEEditor"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Create Scene failed, ret = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :cond_1
    const/4 v1, 0x0

    :try_start_2
    iput-boolean v1, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    iput-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    iget-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object p3, p4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mAudioPaths:[Ljava/lang/String;

    iget-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object p1, p4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object p2, p1, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mTransitions:[Ljava/lang/String;

    const/4 p1, 0x1

    if-eqz p3, :cond_2

    array-length p2, p3

    if-eqz p2, :cond_2

    move p2, p1

    goto :goto_0

    :cond_2
    move p2, v1

    :goto_0
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    iput v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    invoke-virtual {p0}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result p2

    iput p2, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object p2

    invoke-virtual {p2}, Lcom/ss/android/vesdk/runtime/VERuntime;->getEnv()Lcom/ss/android/vesdk/runtime/VEEnv;

    move-result-object p2

    invoke-virtual {p2}, Lcom/ss/android/vesdk/runtime/VEEnv;->getDetectModelsDir()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    new-array v3, p1, [I

    aput v1, v3, v1

    const-string p2, "color filter"

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object v4

    new-array v5, p1, [I

    aput v1, v5, v1

    new-array v6, p1, [I

    iget p2, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    aput p2, v6, v1

    new-array v7, p1, [I

    aput v1, v7, v1

    new-array v8, p1, [I

    const/4 p1, 0x7

    aput p1, v8, v1

    invoke-virtual/range {v2 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object p1

    aget p1, p1, v1

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return v0

    :catch_0
    move-exception p1

    :try_start_4
    new-instance p1, Lcom/ss/android/vesdk/VEException;

    const/4 p2, -0x1

    const-string p3, "init failed: VESDK need to be init"

    invoke-direct {p1, p2, p3}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized init2([Ljava/lang/String;[I[I[Ljava/lang/String;[Ljava/lang/String;[I[ILcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;)I
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/VEException;
        }
    .end annotation

    move-object v1, p0

    move-object/from16 v0, p5

    monitor-enter p0

    :try_start_0
    iget-boolean v2, v1, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v2, "VEEditor"

    const-string v3, "init..."

    invoke-static {v2, v3}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v3, 0x0

    move-object v10, v3

    check-cast v10, [[Ljava/lang/String;

    invoke-virtual/range {p8 .. p8}, Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;->ordinal()I

    move-result v11

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, v0

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p4

    invoke-virtual/range {v2 .. v11}, Lcom/ss/android/ttve/nativePort/TEInterface;->createScene2([Ljava/lang/String;[I[I[Ljava/lang/String;[I[I[Ljava/lang/String;[[Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_1

    const-string v0, "VEEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Create Scene failed, ret = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v2

    :cond_1
    const/4 v3, 0x0

    :try_start_2
    iput-boolean v3, v1, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    move-object/from16 v4, p8

    iput-object v4, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    iget-object v4, v1, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object v0, v4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mAudioPaths:[Ljava/lang/String;

    iget-object v4, v1, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-object v5, p1

    iput-object v5, v4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    iget-object v4, v1, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    move-object/from16 v5, p4

    iput-object v5, v4, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mTransitions:[Ljava/lang/String;

    const/4 v4, 0x1

    if-eqz v0, :cond_2

    array-length v0, v0

    if-eqz v0, :cond_2

    move v0, v4

    goto :goto_0

    :cond_2
    move v0, v3

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    iput v3, v1, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    iput v3, v1, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    invoke-virtual {v1}, Lcom/ss/android/vesdk/VEEditor;->getDuration()I

    move-result v0

    iput v0, v1, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-static {}, Lcom/ss/android/vesdk/runtime/VERuntime;->getInstance()Lcom/ss/android/vesdk/runtime/VERuntime;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VERuntime;->getEnv()Lcom/ss/android/vesdk/runtime/VEEnv;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/VEEnv;->getDetectModelsDir()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    iget-object v5, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    new-array v6, v4, [I

    aput v3, v6, v3

    const-string v0, "color filter"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v7

    new-array v8, v4, [I

    aput v3, v8, v3

    new-array v9, v4, [I

    iget v0, v1, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    aput v0, v9, v3

    new-array v10, v4, [I

    aput v3, v10, v3

    new-array v11, v4, [I

    const/4 v0, 0x7

    aput v0, v11, v3

    invoke-virtual/range {v5 .. v11}, Lcom/ss/android/ttve/nativePort/TEInterface;->addFilters([I[Ljava/lang/String;[I[I[I[I)[I

    move-result-object v0

    aget v0, v0, v3

    iput v0, v1, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return v2

    :catch_0
    move-exception v0

    :try_start_4
    new-instance v0, Lcom/ss/android/vesdk/VEException;

    const/4 v2, -0x1

    const-string v3, "init failed: VESDK need to be init"

    invoke-direct {v0, v2, v3}, Lcom/ss/android/vesdk/VEException;-><init>(ILjava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized invalidate()V
    .locals 9

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/high16 v2, -0x40800000    # -1.0f

    const/high16 v3, -0x40800000    # -1.0f

    const/high16 v4, -0x40800000    # -1.0f

    const/high16 v5, -0x40800000    # -1.0f

    const v6, -0x13880

    const v7, -0x13880

    const/4 v8, 0x1

    invoke-virtual/range {v1 .. v8}, Lcom/ss/android/ttve/nativePort/TEInterface;->setDisplayState(FFFFIIZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    const-string p1, "VEEditor"

    const-string v0, "onFrameAvailable..."

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized pause()I
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "pause..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->pause()I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized pauseSync()I
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "pauseSync..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->pauseSync()I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized play()I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v1, "play..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->start()I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized prepare()I
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v1, "prepare..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, ""

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    const-string v0, "VEEditor"

    const-string v1, "model dir is empty"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getDuration()I

    move-result v1

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1, v3, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getInitResolution()[I

    move-result-object v1

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    aget v3, v1, v3

    iput v3, v2, Lcom/ss/android/vesdk/VESize;->width:I

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mInitSize:Lcom/ss/android/vesdk/VESize;

    const/4 v3, 0x1

    aget v1, v1, v3

    iput v1, v2, Lcom/ss/android/vesdk/VESize;->height:I

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    invoke-virtual {p0, v1}, Lcom/ss/android/vesdk/VEEditor;->setBackgroundColor(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeInfoSticker(I)I
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removeInfoSticker... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-gez p1, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeInfoSticker(I)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized removeSegmentVolume(I)I
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-gez p1, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/ss/android/ttve/nativePort/TEInterface;->removeFilter([I)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized restore(Lcom/ss/android/vesdk/VEEditorModel;)Z
    .locals 5
    .param p1    # Lcom/ss/android/vesdk/VEEditorModel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->projectXML:Ljava/lang/String;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor;->checkFileExists(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string p1, "VEEditor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "projectXML not exists: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v1

    :cond_1
    :try_start_2
    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v2, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->restore(Ljava/lang/String;)I

    move-result v2

    if-gez v2, :cond_2

    const-string p1, "VEEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "video editor restore failed: result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", project xml: "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ss/android/ttve/common/TELogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v1

    :cond_2
    :try_start_3
    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->inPoint:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->outputPoint:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iget-boolean v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->reverseDone:Z

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->videoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    iget-boolean v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->separateAV:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->masterTrackIndex:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->audioEffectFilterIndex:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->modelDir:Ljava/lang/String;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIndex:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v1, p1, Lcom/ss/android/vesdk/VEEditorModel;->videoPaths:[Ljava/lang/String;

    iput-object v1, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v1, p1, Lcom/ss/android/vesdk/VEEditorModel;->audioPaths:[Ljava/lang/String;

    iput-object v1, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mAudioPaths:[Ljava/lang/String;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v1, p1, Lcom/ss/android/vesdk/VEEditorModel;->transitions:[Ljava/lang/String;

    iput-object v1, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mTransitions:[Ljava/lang/String;

    iget v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->backgroundColor:I

    iput v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->outputFile:Ljava/lang/String;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkFile:Ljava/lang/String;

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkFile:Ljava/lang/String;

    iget-wide v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkWidth:D

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkWidth:D

    iget-wide v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkHeight:D

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkHeight:D

    iget-wide v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetX:D

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetX:D

    iget-wide v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetY:D

    iput-wide v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetY:D

    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterRightPath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterLeftPath:Ljava/lang/String;

    iget p1, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIntensity:F

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/VEEditor;->setColorFilter(Ljava/lang/String;F)I

    goto :goto_0

    :cond_3
    iget-object v0, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterLeftPath:Ljava/lang/String;

    iget-object v1, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterRightPath:Ljava/lang/String;

    iget v2, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterPosition:F

    iget p1, p1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIntensity:F

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/ss/android/vesdk/VEEditor;->setColorFilter(Ljava/lang/String;Ljava/lang/String;FF)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_0
    const/4 p1, 0x1

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized save()Lcom/ss/android/vesdk/VEEditorModel;
    .locals 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-object v1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->save()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-static {v0}, Lcom/ss/android/vesdk/VEEditor;->checkFileExists(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    goto/16 :goto_0

    :cond_1
    new-instance v1, Lcom/ss/android/vesdk/VEEditorModel;

    invoke-direct {v1}, Lcom/ss/android/vesdk/VEEditorModel;-><init>()V

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->projectXML:Ljava/lang/String;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->inPoint:I

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->outputPoint:I

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z

    iput-boolean v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->reverseDone:Z

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->videoOutRes:Lcom/ss/android/vesdk/VEEditor$VIDEO_RATIO;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mbSeparateAV:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->separateAV:Z

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mMasterTrackIndex:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->masterTrackIndex:I

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mAudioEffectfilterIndex:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->audioEffectFilterIndex:I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->modelDir:Ljava/lang/String;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIndex:I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mVideoPaths:[Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->videoPaths:[Ljava/lang/String;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mAudioPaths:[Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->audioPaths:[Ljava/lang/String;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iget-object v0, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mTransitions:[Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->transitions:[Ljava/lang/String;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->backgroundColor:I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mOutputFile:Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->outputFile:Ljava/lang/String;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkFile:Ljava/lang/String;

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkFile:Ljava/lang/String;

    iget-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkWidth:D

    iput-wide v2, v1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkWidth:D

    iget-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkHeight:D

    iput-wide v2, v1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkHeight:D

    iget-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetX:D

    iput-wide v2, v1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetX:D

    iget-wide v2, p0, Lcom/ss/android/vesdk/VEEditor;->waterMarkOffsetY:D

    iput-wide v2, v1, Lcom/ss/android/vesdk/VEEditorModel;->watermarkOffsetY:D

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getLeftResPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterLeftPath:Ljava/lang/String;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getRightResPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterRightPath:Ljava/lang/String;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getPosition()F

    move-result v0

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterPosition:F

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getIntensity()F

    move-result v0

    iput v0, v1, Lcom/ss/android/vesdk/VEEditorModel;->colorFilterIntensity:F
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    monitor-exit p0

    return-object v1

    :cond_3
    :goto_0
    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized seek(ILcom/ss/android/vesdk/VEEditor$SEEK_MODE;)I
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "seek..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    iget v2, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    invoke-virtual {p2}, Lcom/ss/android/vesdk/VEEditor$SEEK_MODE;->ordinal()I

    move-result p2

    invoke-virtual {v0, p1, v1, v2, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->seek(IIII)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setBackgroundColor(I)V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mBackGroundColor:I

    shr-int/lit8 v0, p1, 0x10

    and-int/lit16 v0, v0, 0xff

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-float v2, v2

    div-float/2addr v2, v1

    and-int/lit16 v3, p1, 0xff

    int-to-float v3, v3

    div-float/2addr v3, v1

    shr-int/lit8 p1, p1, 0x18

    and-int/lit16 p1, p1, 0xff

    int-to-float p1, p1

    div-float/2addr p1, v1

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v1, v0, v2, v3, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setBackGroundColor(FFFF)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setColorFilter(Ljava/lang/String;F)I
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v1, -0x69

    if-eqz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-gez v0, :cond_1

    monitor-exit p0

    return v1

    :cond_1
    const/4 v0, 0x0

    cmpg-float v0, p2, v0

    if-ltz v0, :cond_7

    if-nez p1, :cond_2

    goto/16 :goto_0

    :cond_2
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p2, v0

    if-lez v1, :cond_3

    move p2, v0

    :cond_3
    :try_start_2
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    if-nez v1, :cond_4

    new-instance v1, Lcom/ss/android/ttve/model/FilterBean;

    invoke-direct {v1}, Lcom/ss/android/ttve/model/FilterBean;-><init>()V

    iput-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    :cond_4
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v1}, Lcom/ss/android/ttve/model/FilterBean;->getLeftResPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v1}, Lcom/ss/android/ttve/model/FilterBean;->getRightResPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v1}, Lcom/ss/android/ttve/model/FilterBean;->getIntensity()F

    move-result v1

    cmpl-float v1, v1, p2

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v1}, Lcom/ss/android/ttve/model/FilterBean;->getPosition()F

    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    cmpl-float v1, v1, v0

    if-nez v1, :cond_5

    monitor-exit p0

    return v2

    :cond_5
    :try_start_3
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v1, p1}, Lcom/ss/android/ttve/model/FilterBean;->setLeftResPath(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    const-string v3, ""

    invoke-virtual {v1, v3}, Lcom/ss/android/ttve/model/FilterBean;->setRightResPath(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v1, v0}, Lcom/ss/android/ttve/model/FilterBean;->setPosition(F)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0, p2}, Lcom/ss/android/ttve/model/FilterBean;->setIntensity(F)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v3, "left filter"

    invoke-virtual {v0, v1, v3, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v3, "filter intensity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v1, v3, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v1, "right filter"

    const-string v3, ""

    invoke-virtual {p2, v0, v1, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v1, "filter position"

    const-string v3, "1.0"

    invoke-virtual {p2, v0, v1, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    new-instance p2, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    const-string v0, ""

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v3, 0x1

    if-nez v1, :cond_6

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v1, p1

    if-lez v1, :cond_6

    array-length v0, p1

    sub-int/2addr v0, v3

    aget-object v0, p1, v0

    :cond_6
    const-string p1, "iesve_veeditor_set_filter_click_filter_id"

    invoke-virtual {p2, p1, v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string p1, "iesve_veeditor_set_filter_click"

    invoke-static {p1, v3, p2}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return v2

    :cond_7
    :goto_0
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setColorFilter(Ljava/lang/String;Ljava/lang/String;FF)I
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v1, -0x69

    if-eqz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-gez v0, :cond_1

    monitor-exit p0

    return v1

    :cond_1
    const/4 v0, 0x0

    cmpg-float v1, p4, v0

    if-ltz v1, :cond_9

    cmpg-float v0, p3, v0

    if-ltz v0, :cond_9

    :try_start_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto/16 :goto_0

    :cond_2
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p4, v0

    if-lez v1, :cond_3

    move p4, v0

    :cond_3
    cmpl-float v1, p3, v0

    if-lez v1, :cond_4

    move p3, v0

    :cond_4
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    if-nez v0, :cond_5

    new-instance v0, Lcom/ss/android/ttve/model/FilterBean;

    invoke-direct {v0}, Lcom/ss/android/ttve/model/FilterBean;-><init>()V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    :cond_5
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getLeftResPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getRightResPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getIntensity()F

    move-result v0

    cmpl-float v0, v0, p4

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mCurColorFilter:Lcom/ss/android/ttve/model/FilterBean;

    invoke-virtual {v0}, Lcom/ss/android/ttve/model/FilterBean;->getPosition()F

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    cmpl-float v0, v0, p3

    if-nez v0, :cond_6

    monitor-exit p0

    return v1

    :cond_6
    :try_start_3
    const-string v0, "VEEditor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "leftFilterPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\nrightFilterPath: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " position: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " intensity: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/ss/android/ttve/common/TELogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v2, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v3, "left filter"

    invoke-virtual {v0, v2, v3, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v2, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v3, "filter intensity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {v0, v2, v3, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v2, "right filter"

    invoke-virtual {p4, v0, v2, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    iget-object p4, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mColorFilterIndex:I

    const-string v2, "filter position"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4, v0, v2, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    new-instance p3, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {p3}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    const-string p4, ""

    const-string v0, ""

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_7

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v2, p1

    if-lez v2, :cond_7

    array-length p4, p1

    sub-int/2addr p4, v3

    aget-object p4, p1, p4

    :cond_7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_8

    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length p2, p1

    if-lez p2, :cond_8

    array-length p2, p1

    sub-int/2addr p2, v3

    aget-object v0, p1, p2

    :cond_8
    const-string p1, "iesve_veeditor_set_filter_slide_left_id"

    invoke-virtual {p3, p1, p4}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string p1, "iesve_veeditor_set_filter_slide_right_id"

    invoke-virtual {p3, p1, v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string p1, "iesve_veeditor_set_filter_slide"

    invoke-static {p1, v3, p3}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return v1

    :cond_9
    :goto_0
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setCrop(IIII)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    const-string v1, "iesve_veeditor_cut_scale"

    div-int v2, p4, p3

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;I)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string v1, "iesve_veeditor_cut_scale"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->setCrop(IIII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setDisplayPos(IIII)V
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDisplayPos... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    int-to-float v0, p3

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayWidth:I

    int-to-float v1, v1

    div-float v3, v0, v1

    int-to-float v0, p4

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mInitDisplayHeight:I

    int-to-float v1, v1

    div-float v4, v0, v1

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceWidth:I

    div-int/lit8 v0, v0, 0x2

    div-int/lit8 p3, p3, 0x2

    sub-int/2addr v0, p3

    sub-int/2addr v0, p1

    neg-int v6, v0

    iget p1, p0, Lcom/ss/android/vesdk/VEEditor;->mSurfaceHeight:I

    div-int/lit8 p1, p1, 0x2

    div-int/lit8 p4, p4, 0x2

    sub-int/2addr p1, p4

    sub-int v7, p1, p2

    const/4 v5, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lcom/ss/android/vesdk/VEEditor;->setDisplayState(FFFII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setDisplayState(FFFII)V
    .locals 10

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    const-string v1, "iesve_veeditor_video_scale_width"

    invoke-virtual {v0, v1, p1}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;F)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    move-result-object v1

    const-string v2, "iesve_veeditor_video_scale_heigh"

    invoke-virtual {v1, v2, p2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;F)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string v1, "iesve_veeditor_video_scale"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDisplayState... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v6, 0x0

    const/4 v9, 0x0

    move v3, p1

    move v4, p2

    move v5, p3

    move v7, p4

    move v8, p5

    invoke-virtual/range {v2 .. v9}, Lcom/ss/android/ttve/nativePort/TEInterface;->setDisplayState(FFFFIIZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setExpandLastFrame(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setExpandLastFrame(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setInOut(II)I
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    new-instance v0, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    invoke-direct {v0}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;-><init>()V

    const-string v1, "iesve_veeditor_cut_duration"

    sub-int v2, p2, p1

    invoke-virtual {v0, v1, v2}, Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;->add(Ljava/lang/String;I)Lcom/ss/android/vesdk/keyvaluepair/VEKeyValue;

    const-string v1, "iesve_veeditor_cut_duration"

    const/4 v2, 0x1

    invoke-static {v1, v2, v0}, Lcom/ss/android/ttve/monitor/MonitorUtils;->monitorStatistics(Ljava/lang/String;ILcom/ss/android/vesdk/keyvaluepair/VEKeyValue;)V

    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInOut... "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iput p1, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iput p2, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->stop()I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setInfoStickerAlpha(IF)I
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerAlpha... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "alpha: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-gez p1, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity alpha"

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setInfoStickerLayer(II)I
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerLayer... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "layer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-gez p1, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity layer"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setInfoStickerPosition(IFF)I
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerPosition... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "offsetX: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "offsetY: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-gez p1, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity position x"

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p2

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity position y"

    invoke-static {p3}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p1, v1, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/2addr p2, p1

    monitor-exit p0

    return p2

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setInfoStickerRotation(IF)I
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerRotation... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "degree: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-gez p1, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity rotation"

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setInfoStickerScale(IF)I
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerScale... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "scale: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-gez p1, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity scale x"

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result v0

    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v2, "entity scale y"

    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p1, v2, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/2addr v0, p1

    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setInfoStickerTime(III)I
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInfoStickerTime... index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "startTime: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "endTime: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-gez p1, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity start time"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p2

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "entity end time"

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p1, v1, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/2addr p2, p1

    monitor-exit p0

    return p2

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setLoopPlay(Z)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v1, "setLoopPlay"

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setLooping(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setOnErrorListener(Lcom/ss/android/vesdk/VECommonCallback;)V
    .locals 5
    .param p1    # Lcom/ss/android/vesdk/VECommonCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$4;

    invoke-direct {v0, p0, p1}, Lcom/ss/android/vesdk/VEEditor$4;-><init>(Lcom/ss/android/vesdk/VEEditor;Lcom/ss/android/vesdk/VECommonCallback;)V

    const-string p1, "VEEditor"

    const-string v1, "setOnErrorListener..."

    invoke-static {p1, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    monitor-enter p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getNativeHandler()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-nez p1, :cond_1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_3
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setErrorListener(Lcom/ss/android/ttve/common/TECommonCallback;)V

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setOnInfoListener(Lcom/ss/android/vesdk/VECommonCallback;)V
    .locals 5
    .param p1    # Lcom/ss/android/vesdk/VECommonCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance v0, Lcom/ss/android/vesdk/VEEditor$5;

    invoke-direct {v0, p0, p1}, Lcom/ss/android/vesdk/VEEditor$5;-><init>(Lcom/ss/android/vesdk/VEEditor;Lcom/ss/android/vesdk/VECommonCallback;)V

    const-string p1, "VEEditor"

    const-string v1, "setOnInfoListener..."

    invoke-static {p1, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    monitor-enter p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getNativeHandler()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-nez p1, :cond_1

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_3
    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->setInfoListener(Lcom/ss/android/ttve/common/TECommonCallback;)V

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setReverseVideoPaths([Ljava/lang/String;)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v1, -0x69

    if-eqz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    if-eqz p1, :cond_3

    :try_start_1
    array-length v0, p1

    if-gtz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mResManager:Lcom/ss/android/vesdk/runtime/VEEditorResManager;

    iput-object p1, v0, Lcom/ss/android/vesdk/runtime/VEEditorResManager;->mReverseVideoPath:[Ljava/lang/String;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEEditor;->mReverseDone:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    monitor-exit p0

    return v1

    :cond_3
    :goto_0
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setScaleMode(Lcom/ss/android/vesdk/VEEditor$SCALE_MODE;)I
    .locals 2

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "setScaleMode..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEEditor$SCALE_MODE;->ordinal()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setScaleMode(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, 0x0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setSpeedRatio(F)I
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setSpeedRatio(F)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 p1, 0x0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setSpeedRatioAndUpdate(F)I
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->stop()I

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setSpeedRatio(F)V

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->createTimeline()I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    iget v0, p0, Lcom/ss/android/vesdk/VEEditor;->mInPoint:I

    iget v1, p0, Lcom/ss/android/vesdk/VEEditor;->mOutPoint:I

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/ss/android/vesdk/VEEditor;->mModelsDir:Ljava/lang/String;

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/ss/android/ttve/nativePort/TEInterface;->prepareEngine(IIILjava/lang/String;)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setStickerAnimator(ILcom/ss/android/vesdk/VEStickerAnimator;)I
    .locals 2
    .param p2    # Lcom/ss/android/vesdk/VEStickerAnimator;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    const-string v0, "VEEditor"

    const-string v1, "addAnimator..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-ltz p1, :cond_3

    if-nez p2, :cond_1

    goto :goto_0

    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->getStickerFilterIndex(I)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-gez p1, :cond_2

    monitor-exit p0

    return p1

    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "animator"

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Lcom/ss/android/vesdk/VEStickerAnimator;)I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    :cond_3
    :goto_0
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setUseLargeMattingModel(Z)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/nativePort/TEInterface;->setUseLargeMattingModel(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setVolume(IIF)Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string v1, "setVolume..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p2, p1, p3}, Lcom/ss/android/ttve/nativePort/TEInterface;->setTrackVolume(IIF)Z

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized testSerialization()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0}, Lcom/ss/android/ttve/nativePort/TEInterface;->testSerialization()Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized updateAudioTrack(IIIIIZ)I
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string/jumbo v1, "updateAudioTrack..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v0, -0x64

    if-gez p1, :cond_1

    monitor-exit p0

    return v0

    :cond_1
    if-le p3, p2, :cond_5

    if-gez p2, :cond_2

    goto :goto_1

    :cond_2
    if-le p5, p4, :cond_4

    if-gez p4, :cond_3

    goto :goto_0

    :cond_3
    :try_start_2
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move v2, p1

    move v3, p4

    move v4, p5

    move v5, p2

    move v6, p3

    move v7, p6

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateAudioTrack(IIIIIZ)I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    :cond_4
    :goto_0
    monitor-exit p0

    return v0

    :cond_5
    :goto_1
    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updateAudioTrack(IIIIIZII)I
    .locals 11

    move-object v1, p0

    move v0, p2

    move v4, p4

    move/from16 v9, p7

    monitor-enter p0

    :try_start_0
    iget-boolean v2, v1, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    const/16 v0, -0x69

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    const-string v2, "VEEditor"

    const-string/jumbo v3, "updateAudioTrack..."

    invoke-static {v2, v3}, Lcom/ss/android/ttve/common/TELogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v2, -0x64

    if-gez p1, :cond_1

    monitor-exit p0

    return v2

    :cond_1
    move v7, p3

    if-le v7, v0, :cond_7

    if-gez v0, :cond_2

    goto :goto_2

    :cond_2
    move/from16 v5, p5

    if-le v5, v4, :cond_6

    if-gez v4, :cond_3

    goto :goto_1

    :cond_3
    move/from16 v10, p8

    if-le v10, v9, :cond_5

    if-gez v9, :cond_4

    goto :goto_0

    :cond_4
    :try_start_2
    iget-object v2, v1, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    move v3, p1

    move v6, v0

    move/from16 v8, p6

    invoke-virtual/range {v2 .. v10}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateAudioTrack(IIIIIZII)I

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v0

    :cond_5
    :goto_0
    monitor-exit p0

    return v2

    :cond_6
    :goto_1
    monitor-exit p0

    return v2

    :cond_7
    :goto_2
    monitor-exit p0

    return v2

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized updateAudioTrack(IIIZ)I
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    const-string v0, "VEEditor"

    const-string/jumbo v1, "updateAudioTrack..."

    invoke-static {v0, v1}, Lcom/ss/android/ttve/common/TELogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v0, -0x64

    if-gez p1, :cond_1

    monitor-exit p0

    return v0

    :cond_1
    if-le p3, p2, :cond_3

    if-gez p2, :cond_2

    goto :goto_0

    :cond_2
    :try_start_2
    iget-object v1, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const/4 v3, 0x0

    sub-int v4, p3, p2

    move v2, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-virtual/range {v1 .. v7}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateAudioTrack(IIIIIZ)I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    :cond_3
    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updatePreViewResolution(IIII)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/ss/android/ttve/nativePort/TEInterface;->updateResolution(IIII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized updateSegmentVolume(IF)I
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/ss/android/vesdk/VEEditor;->hasDestroyCalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x69

    monitor-exit p0

    return p1

    :cond_0
    if-gez p1, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    const/4 v0, 0x0

    cmpg-float v1, p2, v0

    if-gez v1, :cond_2

    move p2, v0

    :cond_2
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p2, v0

    if-lez v1, :cond_3

    move p2, v0

    :cond_3
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/vesdk/VEEditor;->mVideoEditor:Lcom/ss/android/ttve/nativePort/TEInterface;

    const-string v1, "audio volume"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, v1, p2}, Lcom/ss/android/ttve/nativePort/TEInterface;->setFilterParam(ILjava/lang/String;Ljava/lang/String;)I

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
