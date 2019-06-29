.class public Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;
.super Ljava/lang/Object;
.source "EyeLightSingleCheckAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EyeLightItem"
.end annotation


# instance fields
.field private mImageResource:I

.field private mTextResource:I

.field private mType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mImageResource:I

    iput p3, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mTextResource:I

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mType:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getImageResource()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mImageResource:I

    return v0
.end method

.method public getTextResource()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mTextResource:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;->mType:Ljava/lang/String;

    return-object v0
.end method
