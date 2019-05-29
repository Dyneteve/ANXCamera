.class public Lcom/android/camera/module/impl/component/MimojiStatusManager;
.super Ljava/lang/Object;
.source "MimojiStatusManager.java"


# static fields
.field public static MIMOJI_CREATE:I

.field public static MIMOJI_EDIT_MID:I

.field public static MIMOJI_EIDT:I

.field public static MIMOJI_NONE:I

.field public static MIMOJI_PREVIEW:I


# instance fields
.field public mCurrentMimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

.field private volatile mIsAvatarInited:Z

.field private mMode:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_NONE:I

    const/4 v0, 0x2

    sput v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    const/4 v0, 0x4

    sput v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_CREATE:I

    const/16 v0, 0x8

    sput v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EDIT_MID:I

    const/16 v0, 0x10

    sput v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EIDT:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_NONE:I

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mMode:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mIsAvatarInited:Z

    return-void
.end method


# virtual methods
.method public IsAvatarInited()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mIsAvatarInited:Z

    return v0
.end method

.method public IsInMimojiCreate()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mMode:I

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_CREATE:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public IsInMimojiEdit()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mMode:I

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EIDT:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public IsInMimojiEditMid()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mMode:I

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EDIT_MID:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public IsInMimojiPreview()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mMode:I

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public IsInPreviewSurface()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mMode:I

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_CREATE:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public declared-synchronized getMode()I
    .locals 1

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mMode:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized reset()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mIsAvatarInited:Z

    sget v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_NONE:I

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mMode:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setAvatarInited(Z)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mIsAvatarInited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setMode(I)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mMode:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
