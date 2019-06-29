.class abstract Landroid/support/v4/media/MediaSession2$BuilderBase;
.super Ljava/lang/Object;
.source "MediaSession2.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaSession2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "BuilderBase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/support/v4/media/MediaSession2;",
        "U:",
        "Landroid/support/v4/media/MediaSession2$BuilderBase<",
        "TT;TU;TC;>;C:",
        "Landroid/support/v4/media/MediaSession2$SessionCallback;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field mCallback:Landroid/support/v4/media/MediaSession2$SessionCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TC;"
        }
    .end annotation
.end field

.field mCallbackExecutor:Ljava/util/concurrent/Executor;

.field final mContext:Landroid/content/Context;

.field mId:Ljava/lang/String;

.field mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

.field mPlaylistAgent:Landroid/support/v4/media/MediaPlaylistAgent;

.field mSessionActivity:Landroid/app/PendingIntent;

.field mVolumeProvider:Landroid/support/v4/media/VolumeProviderCompat;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$BuilderBase;->mContext:Landroid/content/Context;

    const-string p1, "MediaSession2"

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$BuilderBase;->mId:Ljava/lang/String;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "context shouldn\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method abstract build()Landroid/support/v4/media/MediaSession2;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method setId(Ljava/lang/String;)Landroid/support/v4/media/MediaSession2$BuilderBase;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TU;"
        }
    .end annotation

    if-eqz p1, :cond_0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$BuilderBase;->mId:Ljava/lang/String;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "id shouldn\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method setPlayer(Landroid/support/v4/media/BaseMediaPlayer;)Landroid/support/v4/media/MediaSession2$BuilderBase;
    .locals 1
    .param p1    # Landroid/support/v4/media/BaseMediaPlayer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/media/BaseMediaPlayer;",
            ")TU;"
        }
    .end annotation

    if-eqz p1, :cond_0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$BuilderBase;->mPlayer:Landroid/support/v4/media/BaseMediaPlayer;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "player shouldn\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method setPlaylistAgent(Landroid/support/v4/media/MediaPlaylistAgent;)Landroid/support/v4/media/MediaSession2$BuilderBase;
    .locals 1
    .param p1    # Landroid/support/v4/media/MediaPlaylistAgent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/media/MediaPlaylistAgent;",
            ")TU;"
        }
    .end annotation

    if-eqz p1, :cond_0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$BuilderBase;->mPlaylistAgent:Landroid/support/v4/media/MediaPlaylistAgent;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "playlistAgent shouldn\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method setSessionActivity(Landroid/app/PendingIntent;)Landroid/support/v4/media/MediaSession2$BuilderBase;
    .locals 0
    .param p1    # Landroid/app/PendingIntent;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/PendingIntent;",
            ")TU;"
        }
    .end annotation

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$BuilderBase;->mSessionActivity:Landroid/app/PendingIntent;

    return-object p0
.end method

.method setSessionCallback(Ljava/util/concurrent/Executor;Landroid/support/v4/media/MediaSession2$SessionCallback;)Landroid/support/v4/media/MediaSession2$BuilderBase;
    .locals 0
    .param p1    # Ljava/util/concurrent/Executor;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaSession2$SessionCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "TC;)TU;"
        }
    .end annotation

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$BuilderBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Landroid/support/v4/media/MediaSession2$BuilderBase;->mCallback:Landroid/support/v4/media/MediaSession2$SessionCallback;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "callback shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "executor shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method setVolumeProvider(Landroid/support/v4/media/VolumeProviderCompat;)Landroid/support/v4/media/MediaSession2$BuilderBase;
    .locals 0
    .param p1    # Landroid/support/v4/media/VolumeProviderCompat;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/media/VolumeProviderCompat;",
            ")TU;"
        }
    .end annotation

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$BuilderBase;->mVolumeProvider:Landroid/support/v4/media/VolumeProviderCompat;

    return-object p0
.end method
