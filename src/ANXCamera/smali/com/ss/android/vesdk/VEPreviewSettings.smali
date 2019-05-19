.class public Lcom/ss/android/vesdk/VEPreviewSettings;
.super Ljava/lang/Object;
.source "VEPreviewSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;
    }
.end annotation


# instance fields
.field private facingID:Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

.field private rotation:I

.field private size:Lcom/ss/android/vesdk/VESize;


# direct methods
.method public constructor <init>(Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;ILcom/ss/android/vesdk/VESize;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->facingID:Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

    iput p2, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->rotation:I

    iput-object p3, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->size:Lcom/ss/android/vesdk/VESize;

    return-void
.end method


# virtual methods
.method public getFacingID()Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->facingID:Lcom/ss/android/vesdk/VEPreviewSettings$CAMERA_FACING_ID;

    return-object v0
.end method

.method public getRotation()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->rotation:I

    return v0
.end method

.method public getSize()Lcom/ss/android/vesdk/VESize;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/VEPreviewSettings;->size:Lcom/ss/android/vesdk/VESize;

    return-object v0
.end method
