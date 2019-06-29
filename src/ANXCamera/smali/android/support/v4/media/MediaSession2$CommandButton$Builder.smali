.class public final Landroid/support/v4/media/MediaSession2$CommandButton$Builder;
.super Ljava/lang/Object;
.source "MediaSession2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaSession2$CommandButton;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mCommand:Landroid/support/v4/media/SessionCommand2;

.field private mDisplayName:Ljava/lang/String;

.field private mEnabled:Z

.field private mExtras:Landroid/os/Bundle;

.field private mIconResId:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Landroid/support/v4/media/MediaSession2$CommandButton;
    .locals 8
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v7, Landroid/support/v4/media/MediaSession2$CommandButton;

    iget-object v1, p0, Landroid/support/v4/media/MediaSession2$CommandButton$Builder;->mCommand:Landroid/support/v4/media/SessionCommand2;

    iget v2, p0, Landroid/support/v4/media/MediaSession2$CommandButton$Builder;->mIconResId:I

    iget-object v3, p0, Landroid/support/v4/media/MediaSession2$CommandButton$Builder;->mDisplayName:Ljava/lang/String;

    iget-object v4, p0, Landroid/support/v4/media/MediaSession2$CommandButton$Builder;->mExtras:Landroid/os/Bundle;

    iget-boolean v5, p0, Landroid/support/v4/media/MediaSession2$CommandButton$Builder;->mEnabled:Z

    const/4 v6, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Landroid/support/v4/media/MediaSession2$CommandButton;-><init>(Landroid/support/v4/media/SessionCommand2;ILjava/lang/String;Landroid/os/Bundle;ZLandroid/support/v4/media/MediaSession2$1;)V

    return-object v7
.end method

.method public setCommand(Landroid/support/v4/media/SessionCommand2;)Landroid/support/v4/media/MediaSession2$CommandButton$Builder;
    .locals 0
    .param p1    # Landroid/support/v4/media/SessionCommand2;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$CommandButton$Builder;->mCommand:Landroid/support/v4/media/SessionCommand2;

    return-object p0
.end method

.method public setDisplayName(Ljava/lang/String;)Landroid/support/v4/media/MediaSession2$CommandButton$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$CommandButton$Builder;->mDisplayName:Ljava/lang/String;

    return-object p0
.end method

.method public setEnabled(Z)Landroid/support/v4/media/MediaSession2$CommandButton$Builder;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-boolean p1, p0, Landroid/support/v4/media/MediaSession2$CommandButton$Builder;->mEnabled:Z

    return-object p0
.end method

.method public setExtras(Landroid/os/Bundle;)Landroid/support/v4/media/MediaSession2$CommandButton$Builder;
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$CommandButton$Builder;->mExtras:Landroid/os/Bundle;

    return-object p0
.end method

.method public setIconResId(I)Landroid/support/v4/media/MediaSession2$CommandButton$Builder;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput p1, p0, Landroid/support/v4/media/MediaSession2$CommandButton$Builder;->mIconResId:I

    return-object p0
.end method
