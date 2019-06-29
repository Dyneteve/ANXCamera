.class public Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
.super Ljava/lang/Object;
.source "VEVideoEncodeSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/vesdk/VEVideoEncodeSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

.field private mIsEncodeModeDeclared:Z

.field private mUsage:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mIsEncodeModeDeclared:Z

    const/4 v0, 0x1

    iput v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mUsage:I

    new-instance v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;-><init>(Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x1L
            to = 0x3L
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mIsEncodeModeDeclared:Z

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mUsage:I

    new-instance p1, Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;-><init>(Lcom/ss/android/vesdk/VEVideoEncodeSettings$1;)V

    iput-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    return-void
.end method

.method public constructor <init>(ILcom/ss/android/vesdk/VEVideoEncodeSettings;)V
    .locals 1
    .param p1    # I
        .annotation build Landroid/support/annotation/IntRange;
            from = 0x1L
            to = 0x3L
        .end annotation
    .end param
    .param p2    # Lcom/ss/android/vesdk/VEVideoEncodeSettings;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mIsEncodeModeDeclared:Z

    iput p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mUsage:I

    iput-object p2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mIsEncodeModeDeclared:Z

    return-void
.end method

.method private getCompileHardwareBitrateModeFromCloud()Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;
    .locals 1

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    return-object v0
.end method

.method private getImportHardwareBitrateModeFromCloud()Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;
    .locals 1

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    return-object v0
.end method

.method private getRecordHardwareBitrateModeFromCloud()Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;
    .locals 1

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    return-object v0
.end method

.method private overrideWithCloudConfigForCompile()V
    .locals 6

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v1, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeMode:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v1, v2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1102(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Z)Z

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    new-instance v3, Lcom/ss/android/vesdk/VESize;

    iget v4, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionWidth:I

    iget v5, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionHeight:I

    invoke-direct {v3, v4, v5}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$602(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VESize;)Lcom/ss/android/vesdk/VESize;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWCRF:I

    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$402(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWCRFPreset:I

    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->getCompileHardwareBitrateModeFromCloud()Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    move-result-object v3

    goto :goto_1

    :cond_1
    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileSWBitrateMode:I

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->fromInteger(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    move-result-object v3

    :goto_1
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_2

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeHWBPS:I

    goto :goto_2

    :cond_2
    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$300(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    :goto_2
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_3

    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1200(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    goto :goto_3

    :cond_3
    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWGOP:I

    :goto_3
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_4

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileHwProfile:I

    goto :goto_4

    :cond_4
    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1400(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    :goto_4
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1402(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_5

    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1500(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    goto :goto_5

    :cond_5
    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileEncodeSWMaxrate:I

    :goto_5
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1502(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_6

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$500(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v0

    goto :goto_6

    :cond_6
    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCompileVideoSWQP:I

    :goto_6
    invoke-static {v1, v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$502(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-void
.end method

.method private overrideWithCloudConfigForImport()V
    .locals 6

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v1, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportEncodeMode:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v1, v2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1102(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Z)Z

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    new-instance v3, Lcom/ss/android/vesdk/VESize;

    iget v4, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionWidth:I

    iget v5, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionHeight:I

    invoke-direct {v3, v4, v5}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$602(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VESize;)Lcom/ss/android/vesdk/VESize;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportSWEncodeCRF:I

    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$402(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWPreset:I

    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->getImportHardwareBitrateModeFromCloud()Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    move-result-object v3

    goto :goto_1

    :cond_1
    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportSWBitrateMode:I

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->fromInteger(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    move-result-object v3

    :goto_1
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_2

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportHWEncodeBPS:I

    goto :goto_2

    :cond_2
    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$300(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    :goto_2
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_3

    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1200(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    goto :goto_3

    :cond_3
    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWGop:I

    :goto_3
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_4

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportHwProfile:I

    goto :goto_4

    :cond_4
    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1400(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    :goto_4
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1402(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_5

    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1500(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    goto :goto_5

    :cond_5
    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWMaxrate:I

    :goto_5
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1502(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_6

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$500(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v0

    goto :goto_6

    :cond_6
    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mImportVideoSWQP:I

    :goto_6
    invoke-static {v1, v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$502(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-void
.end method

.method private overrideWithCloudConfigForRecord()V
    .locals 6

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    iget v1, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordEncodeMode:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v1, v2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1102(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Z)Z

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    new-instance v3, Lcom/ss/android/vesdk/VESize;

    iget v4, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionWidth:I

    iget v5, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mCameraPreviewResolutionHeight:I

    invoke-direct {v3, v4, v5}, Lcom/ss/android/vesdk/VESize;-><init>(II)V

    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$602(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VESize;)Lcom/ss/android/vesdk/VESize;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordSWEncodeCRF:I

    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$402(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWPreset:I

    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->getRecordHardwareBitrateModeFromCloud()Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    move-result-object v3

    goto :goto_1

    :cond_1
    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordSWBitrateMode:I

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->fromInteger(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    move-result-object v3

    :goto_1
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_2

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordHWEncodeBPS:I

    goto :goto_2

    :cond_2
    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$300(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    :goto_2
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_3

    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1200(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    goto :goto_3

    :cond_3
    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWGop:I

    :goto_3
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_4

    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordHwProfile:I

    goto :goto_4

    :cond_4
    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1400(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    :goto_4
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1402(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_5

    iget-object v3, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1500(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v3

    goto :goto_5

    :cond_5
    iget v3, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWMaxrate:I

    :goto_5
    invoke-static {v1, v3}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1502(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    iget-object v1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    if-eqz v2, :cond_6

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$500(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)I

    move-result v0

    goto :goto_6

    :cond_6
    iget v0, v0, Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;->mRecordVideoSWQP:I

    :goto_6
    invoke-static {v1, v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$502(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-void
.end method


# virtual methods
.method public build()Lcom/ss/android/vesdk/VEVideoEncodeSettings;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    return-object v0
.end method

.method public overrideWithCloudConfig()Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 3

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/PerformanceConfig;->sVECloudConfig:Lcom/ss/android/vesdk/runtime/cloudconfig/VECloudConfig;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Override with Cloud Configs failed. CloudConfig == null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0

    :cond_0
    iget v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mUsage:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CompileTime BUG, Unexpected usage = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mUsage:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    invoke-direct {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->overrideWithCloudConfigForImport()V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->overrideWithCloudConfigForCompile()V

    goto :goto_0

    :pswitch_2
    invoke-direct {p0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->overrideWithCloudConfigForRecord()V

    nop

    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mIsEncodeModeDeclared:Z

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setBps(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 2

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_ABR:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-object p0
.end method

.method public setCompileType(Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1
    .param p1    # Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    iput-object p1, v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->compileType:Lcom/ss/android/vesdk/VEVideoEncodeSettings$COMPILE_TYPE;

    return-object p0
.end method

.method public setEncodePreset(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1
    .param p1    # Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PRESET;->ordinal()I

    move-result p1

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-object p0
.end method

.method public setEncodeProfile(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1
    .param p1    # Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_PROFILE;->ordinal()I

    move-result p1

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1402(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-object p0
.end method

.method public setEncodeStandard(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_STANDARD;->ordinal()I

    move-result p1

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1702(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-object p0
.end method

.method public setFps(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$102(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-object p0
.end method

.method public setGopSize(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-object p0
.end method

.method public setHasBFrame(Z)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1802(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Z)Z

    return-object p0
.end method

.method public setHwEnc(Z)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1102(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Z)Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->mIsEncodeModeDeclared:Z

    return-object p0
.end method

.method public setQP(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 2

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_QP:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$502(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-object p0
.end method

.method public setResizeMode(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$802(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-object p0
.end method

.method public setResizeX(F)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$902(Lcom/ss/android/vesdk/VEVideoEncodeSettings;F)F

    return-object p0
.end method

.method public setResizeY(F)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1002(Lcom/ss/android/vesdk/VEVideoEncodeSettings;F)F

    return-object p0
.end method

.method public setRotate(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$702(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-object p0
.end method

.method public setSWCRF(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 2

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    sget-object v1, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ENCODE_BITRATE_CRF:Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    invoke-static {v0, v1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$402(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-object p0
.end method

.method public setSpeed(F)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1602(Lcom/ss/android/vesdk/VEVideoEncodeSettings;F)F

    return-object p0
.end method

.method public setSwMaxrate(I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1502(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    return-object p0
.end method

.method public setVideoBitrate(Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;I)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 2

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$202(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;

    sget-object v0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$2;->$SwitchMap$com$ss$android$vesdk$VEVideoEncodeSettings$ENCODE_BITRATE_MODE:[I

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CompileTime BUG. Unhandled enum value "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings$ENCODE_BITRATE_MODE;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    :pswitch_0
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {p1, p2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {p1, p2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$502(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {p1, p2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$402(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    goto :goto_0

    :pswitch_3
    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {p1, p2}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$302(Lcom/ss/android/vesdk/VEVideoEncodeSettings;I)I

    nop

    :goto_0
    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setVideoRes(II)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$600(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)Lcom/ss/android/vesdk/VESize;

    move-result-object v0

    iput p1, v0, Lcom/ss/android/vesdk/VESize;->width:I

    iget-object p1, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$600(Lcom/ss/android/vesdk/VEVideoEncodeSettings;)Lcom/ss/android/vesdk/VESize;

    move-result-object p1

    iput p2, p1, Lcom/ss/android/vesdk/VESize;->height:I

    return-object p0
.end method

.method public setWatermarkParam(Lcom/ss/android/vesdk/VEWatermarkParam;)Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEVideoEncodeSettings$Builder;->exportVideoEncodeSettings:Lcom/ss/android/vesdk/VEVideoEncodeSettings;

    invoke-static {v0, p1}, Lcom/ss/android/vesdk/VEVideoEncodeSettings;->access$1902(Lcom/ss/android/vesdk/VEVideoEncodeSettings;Lcom/ss/android/vesdk/VEWatermarkParam;)Lcom/ss/android/vesdk/VEWatermarkParam;

    return-object p0
.end method
