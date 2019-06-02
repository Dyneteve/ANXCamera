.class public Lcom/android/camera/fragment/mimoji/MimojiInfo;
.super Ljava/lang/Object;
.source "MimojiInfo.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/android/camera/fragment/mimoji/MimojiInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public mAvatarTemplatePath:Ljava/lang/String;

.field public mConfigPath:Ljava/lang/String;

.field public mData:[B

.field public mDirectoryName:J

.field public mPackPath:Ljava/lang/String;

.field public mThumbnailUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/android/camera/fragment/mimoji/MimojiInfo;)I
    .locals 4

    iget-wide v0, p0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mDirectoryName:J

    iget-wide v2, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mDirectoryName:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mDirectoryName:J

    iget-wide v2, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mDirectoryName:J

    cmp-long p1, v0, v2

    if-gez p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/MimojiInfo;->compareTo(Lcom/android/camera/fragment/mimoji/MimojiInfo;)I

    move-result p1

    return p1
.end method
