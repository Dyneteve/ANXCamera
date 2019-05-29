.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;
.super Ljava/lang/Object;
.source "ModeProtocol.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/protocol/ModeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MimojiAvatarEngine"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xd9


# virtual methods
.method public abstract backToPreview(ZZ)V
.end method

.method public abstract initAvatarEngine(IIIIZ)V
.end method

.method public abstract isOnCreateMimoji()Z
.end method

.method public abstract isRecordStopping()Z
.end method

.method public abstract isRecording()Z
.end method

.method public abstract onCaptureImage()V
.end method

.method public abstract onCreateCapture()Z
.end method

.method public abstract onDeviceRotationChange(I)V
.end method

.method public abstract onDrawFrame(IIZ)V
.end method

.method public abstract onMimojiCreate()V
.end method

.method public abstract onMimojiSelect(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V
.end method

.method public abstract onPreviewFrame(Landroid/media/Image;)V
.end method

.method public abstract onRecordStart(Landroid/content/ContentValues;)V
.end method

.method public abstract onRecordStop(Z)V
.end method

.method public abstract onResume()V
.end method

.method public abstract releaseRender()V
.end method

.method public abstract setDetectSuccess(Z)V
.end method

.method public abstract setDisableSingleTapUp(Z)V
.end method
