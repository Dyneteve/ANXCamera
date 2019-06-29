.class public final Landroid/support/v4/media/MediaSession2$ControllerInfo;
.super Ljava/lang/Object;
.source "MediaSession2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaSession2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ControllerInfo"
.end annotation


# instance fields
.field private final mControllerCb:Landroid/support/v4/media/MediaSession2$ControllerCb;

.field private final mIsTrusted:Z

.field private final mPackageName:Ljava/lang/String;

.field private final mUid:I


# direct methods
.method constructor <init>(Ljava/lang/String;IILandroid/support/v4/media/MediaSession2$ControllerCb;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/support/v4/media/MediaSession2$ControllerCb;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p3, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mUid:I

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mPackageName:Ljava/lang/String;

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mIsTrusted:Z

    iput-object p4, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mControllerCb:Landroid/support/v4/media/MediaSession2$ControllerCb;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Landroid/support/v4/media/MediaSession2$ControllerInfo;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    check-cast p1, Landroid/support/v4/media/MediaSession2$ControllerInfo;

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mControllerCb:Landroid/support/v4/media/MediaSession2$ControllerCb;

    iget-object p1, p1, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mControllerCb:Landroid/support/v4/media/MediaSession2$ControllerCb;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/MediaSession2$ControllerCb;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method getControllerCb()Landroid/support/v4/media/MediaSession2$ControllerCb;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mControllerCb:Landroid/support/v4/media/MediaSession2$ControllerCb;

    return-object v0
.end method

.method getId()Landroid/os/IBinder;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mControllerCb:Landroid/support/v4/media/MediaSession2$ControllerCb;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaSession2$ControllerCb;->getId()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public getUid()I
    .locals 1

    iget v0, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mUid:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mControllerCb:Landroid/support/v4/media/MediaSession2$ControllerCb;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaSession2$ControllerCb;->hashCode()I

    move-result v0

    return v0
.end method

.method public isTrusted()Z
    .locals 1
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-boolean v0, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mIsTrusted:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ControllerInfo {pkg="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", uid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/media/MediaSession2$ControllerInfo;->mUid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "})"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
