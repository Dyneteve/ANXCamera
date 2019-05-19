.class public Lcom/android/camera/watermark/WaterMarkData;
.super Ljava/lang/Object;
.source "WaterMarkData.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/watermark/WaterMarkData$WatermarkType;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/android/camera/watermark/WaterMarkData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private bottomMargin:I

.field private faceRectF:Landroid/graphics/RectF;

.field private faceViewHeight:I

.field private faceViewWidth:I

.field private transient image:Landroid/graphics/Bitmap;

.field private info:Ljava/lang/String;

.field private isFemale:Z

.field private orientation:I

.field private watermarkType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/camera/watermark/WaterMarkData$1;

    invoke-direct {v0}, Lcom/android/camera/watermark/WaterMarkData$1;-><init>()V

    sput-object v0, Lcom/android/camera/watermark/WaterMarkData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    nop

    :cond_0
    iput-boolean v0, p0, Lcom/android/camera/watermark/WaterMarkData;->isFemale:Z

    const-class v0, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->image:Landroid/graphics/Bitmap;

    const-class v0, Landroid/graphics/RectF;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/RectF;

    iput-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceRectF:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->info:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->bottomMargin:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewWidth:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewHeight:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/android/camera/watermark/WaterMarkData;->orientation:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getBottomMargin()I
    .locals 1

    iget v0, p0, Lcom/android/camera/watermark/WaterMarkData;->bottomMargin:I

    return v0
.end method

.method public getFaceRectF()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceRectF:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getFaceViewHeight()I
    .locals 1

    iget v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewHeight:I

    return v0
.end method

.method public getFaceViewWidth()I
    .locals 1

    iget v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewWidth:I

    return v0
.end method

.method public getImage()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->image:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getInfo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->info:Ljava/lang/String;

    return-object v0
.end method

.method public getOrientation()I
    .locals 1

    iget v0, p0, Lcom/android/camera/watermark/WaterMarkData;->orientation:I

    return v0
.end method

.method public getWatermarkType()I
    .locals 1

    iget v0, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    return v0
.end method

.method public isFemale()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/watermark/WaterMarkData;->isFemale:Z

    return v0
.end method

.method public setBottomMargin(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->bottomMargin:I

    return-void
.end method

.method public setFaceRectF(Landroid/graphics/RectF;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/watermark/WaterMarkData;->faceRectF:Landroid/graphics/RectF;

    return-void
.end method

.method public setFaceViewHeight(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewHeight:I

    return-void
.end method

.method public setFaceViewWidth(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewWidth:I

    return-void
.end method

.method public setFemale(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/watermark/WaterMarkData;->isFemale:Z

    return-void
.end method

.method public setImage(Landroid/graphics/Bitmap;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/watermark/WaterMarkData;->image:Landroid/graphics/Bitmap;

    return-void
.end method

.method public setInfo(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/watermark/WaterMarkData;->info:Ljava/lang/String;

    return-void
.end method

.method public setOrientation(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->orientation:I

    return-void
.end method

.method public setWatermarkType(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/watermark/WaterMarkData;->isFemale:Z

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->image:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/android/camera/watermark/WaterMarkData;->faceRectF:Landroid/graphics/RectF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object p2, p0, Lcom/android/camera/watermark/WaterMarkData;->info:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget p2, p0, Lcom/android/camera/watermark/WaterMarkData;->bottomMargin:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewWidth:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/android/camera/watermark/WaterMarkData;->faceViewHeight:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/android/camera/watermark/WaterMarkData;->orientation:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lcom/android/camera/watermark/WaterMarkData;->watermarkType:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
