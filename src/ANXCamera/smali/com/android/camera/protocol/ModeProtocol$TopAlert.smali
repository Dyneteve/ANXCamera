.class public interface abstract Lcom/android/camera/protocol/ModeProtocol$TopAlert;
.super Ljava/lang/Object;
.source "ModeProtocol.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;
.implements Lcom/android/camera/protocol/ModeProtocol$LyingDirectHint;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/protocol/ModeProtocol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "TopAlert"
.end annotation


# static fields
.field public static final TYPE_TAG:I = 0xac


# virtual methods
.method public abstract alertAiDetectTipHint(IIJ)V
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
.end method

.method public abstract alertAiSceneSelector(I)V
.end method

.method public abstract alertFlash(IZZ)V
.end method

.method public abstract alertHDR(IZZ)V
.end method

.method public abstract alertLightingHint(I)V
.end method

.method public abstract alertLightingTitle(Z)V
.end method

.method public abstract alertMimojiFaceDetect(ZI)V
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
.end method

.method public abstract alertMoonModeSelector(IZ)V
.end method

.method public abstract alertMusicClose(Z)V
.end method

.method public abstract alertSwitchHint(II)V
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
.end method

.method public abstract alertSwitchHint(ILjava/lang/String;)V
.end method

.method public abstract alertTopHint(II)V
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
.end method

.method public abstract alertTopHint(IIJ)V
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
.end method

.method public abstract alertTopHint(ILjava/lang/String;)V
.end method

.method public abstract alertUpdateValue(I)V
.end method

.method public abstract alertVideoUltraClear(II)V
    .param p2    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
.end method

.method public abstract clearAlertStatus()V
.end method

.method public varargs abstract disableMenuItem(Z[I)V
.end method

.method public varargs abstract enableMenuItem(Z[I)V
.end method

.method public abstract getCurrentAiSceneLevel()I
.end method

.method public abstract hideAlert()V
.end method

.method public abstract hideConfigMenu()V
.end method

.method public abstract hideExtraMenu()V
.end method

.method public abstract hideSwitchHint()V
.end method

.method public abstract insertConfigItem(I)V
.end method

.method public abstract isExtraMenuShowing()Z
.end method

.method public abstract reInitAlert(Z)V
.end method

.method public abstract refreshExtraMenu()V
.end method

.method public abstract removeConfigItem(I)V
.end method

.method public abstract removeExtraMenu(I)V
.end method

.method public abstract setAiSceneImageLevel(I)V
.end method

.method public abstract setRecordingTimeState(I)V
.end method

.method public abstract showConfigMenu()V
.end method

.method public abstract startLiveShotAnimation()V
.end method

.method public varargs abstract updateConfigItem([I)V
.end method

.method public abstract updateContentDescription()V
.end method

.method public abstract updateRecordingTime(Ljava/lang/String;)V
.end method
