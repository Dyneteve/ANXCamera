.class public Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession$MediaLibrarySessionCallback;
.super Landroid/support/v4/media/MediaSession2$SessionCallback;
.source "MediaLibraryService2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaLibrarySessionCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/media/MediaSession2$SessionCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetChildren(Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;Landroid/support/v4/media/MediaSession2$ControllerInfo;Ljava/lang/String;IILandroid/os/Bundle;)Ljava/util/List;
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaSession2$ControllerInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;",
            "Landroid/support/v4/media/MediaSession2$ControllerInfo;",
            "Ljava/lang/String;",
            "II",
            "Landroid/os/Bundle;",
            ")",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public onGetItem(Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;Landroid/support/v4/media/MediaSession2$ControllerInfo;Ljava/lang/String;)Landroid/support/v4/media/MediaItem2;
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaSession2$ControllerInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public onGetLibraryRoot(Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;Landroid/support/v4/media/MediaSession2$ControllerInfo;Landroid/os/Bundle;)Landroid/support/v4/media/MediaLibraryService2$LibraryRoot;
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaSession2$ControllerInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public onGetSearchResult(Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;Landroid/support/v4/media/MediaSession2$ControllerInfo;Ljava/lang/String;IILandroid/os/Bundle;)Ljava/util/List;
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaSession2$ControllerInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;",
            "Landroid/support/v4/media/MediaSession2$ControllerInfo;",
            "Ljava/lang/String;",
            "II",
            "Landroid/os/Bundle;",
            ")",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public onSearch(Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;Landroid/support/v4/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaSession2$ControllerInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onSubscribe(Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;Landroid/support/v4/media/MediaSession2$ControllerInfo;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaSession2$ControllerInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onUnsubscribe(Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;Landroid/support/v4/media/MediaSession2$ControllerInfo;Ljava/lang/String;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaLibraryService2$MediaLibrarySession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaSession2$ControllerInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method
