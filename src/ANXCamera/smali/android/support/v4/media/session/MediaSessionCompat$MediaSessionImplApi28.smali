.class Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi28;
.super Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi21;
.source "MediaSessionCompat.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x1c
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/session/MediaSessionCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MediaSessionImplApi28"
.end annotation


# instance fields
.field private mSession:Landroid/media/session/MediaSession;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/support/v4/media/SessionToken2;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi21;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/support/v4/media/SessionToken2;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi21;-><init>(Ljava/lang/Object;)V

    check-cast p1, Landroid/media/session/MediaSession;

    iput-object p1, p0, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi28;->mSession:Landroid/media/session/MediaSession;

    return-void
.end method


# virtual methods
.method public final getCurrentControllerInfo()Landroid/support/v4/media/MediaSessionManager$RemoteUserInfo;
    .locals 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/session/MediaSessionCompat$MediaSessionImplApi28;->mSession:Landroid/media/session/MediaSession;

    invoke-virtual {v0}, Landroid/media/session/MediaSession;->getCurrentControllerInfo()Landroid/media/session/MediaSessionManager$RemoteUserInfo;

    move-result-object v0

    new-instance v1, Landroid/support/v4/media/MediaSessionManager$RemoteUserInfo;

    invoke-virtual {v0}, Landroid/media/session/MediaSessionManager$RemoteUserInfo;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Landroid/media/session/MediaSessionManager$RemoteUserInfo;->getPid()I

    move-result v3

    invoke-virtual {v0}, Landroid/media/session/MediaSessionManager$RemoteUserInfo;->getUid()I

    move-result v0

    invoke-direct {v1, v2, v3, v0}, Landroid/support/v4/media/MediaSessionManager$RemoteUserInfo;-><init>(Ljava/lang/String;II)V

    return-object v1
.end method
