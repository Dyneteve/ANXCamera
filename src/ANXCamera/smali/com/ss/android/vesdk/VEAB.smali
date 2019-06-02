.class public Lcom/ss/android/vesdk/VEAB;
.super Ljava/lang/Object;
.source "VEAB.java"


# instance fields
.field public mUseV2Editor:Z

.field public mUseV2Recorder:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEAB;->mUseV2Recorder:Z

    iput-boolean v0, p0, Lcom/ss/android/vesdk/VEAB;->mUseV2Editor:Z

    return-void
.end method
