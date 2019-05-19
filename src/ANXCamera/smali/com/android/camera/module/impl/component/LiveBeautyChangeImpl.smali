.class public Lcom/android/camera/module/impl/component/LiveBeautyChangeImpl;
.super Ljava/lang/Object;
.source "LiveBeautyChangeImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$OnFaceBeautyChangedProtocol;


# instance fields
.field private mRecorder:Lcom/ss/android/vesdk/TERecorder;


# direct methods
.method public constructor <init>(Lcom/ss/android/vesdk/TERecorder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/LiveBeautyChangeImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    return-void
.end method


# virtual methods
.method public onBeautyChanged(Z)V
    .locals 2

    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveBeautyChangeImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    sget-object v0, Lcom/android/camera/module/impl/component/FileUtils;->BEAUTY_12_DIR:Ljava/lang/String;

    const/4 v1, 0x3

    invoke-virtual {p1, v1, v0}, Lcom/ss/android/vesdk/TERecorder;->setBeautyFace(ILjava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/module/impl/component/LiveBeautyChangeImpl;->mRecorder:Lcom/ss/android/vesdk/TERecorder;

    const v0, 0x3eb33333    # 0.35f

    invoke-virtual {p1, v0, v0}, Lcom/ss/android/vesdk/TERecorder;->setBeautyFaceIntensity(FF)I

    return-void
.end method

.method public registerProtocol()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc7

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method
