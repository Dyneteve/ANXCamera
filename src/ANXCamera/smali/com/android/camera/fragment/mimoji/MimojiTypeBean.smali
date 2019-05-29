.class public Lcom/android/camera/fragment/mimoji/MimojiTypeBean;
.super Lcom/android/camera/ui/autoselectview/SelectItemBean;
.source "MimojiTypeBean.java"


# instance fields
.field private ASAvatarConfigType:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/autoselectview/SelectItemBean;-><init>()V

    return-void
.end method


# virtual methods
.method public getASAvatarConfigType()Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiTypeBean;->ASAvatarConfigType:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;

    return-object v0
.end method

.method public setASAvatarConfigType(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiTypeBean;->ASAvatarConfigType:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;

    return-void
.end method
