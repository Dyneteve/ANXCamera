.class public final Landroid/support/mediacompat/Rating2;
.super Ljava/lang/Object;
.source "Rating2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/mediacompat/Rating2$StarStyle;,
        Landroid/support/mediacompat/Rating2$Style;
    }
.end annotation


# static fields
.field private static final KEY_STYLE:Ljava/lang/String; = "android.media.rating2.style"

.field private static final KEY_VALUE:Ljava/lang/String; = "android.media.rating2.value"

.field public static final RATING_3_STARS:I = 0x3

.field public static final RATING_4_STARS:I = 0x4

.field public static final RATING_5_STARS:I = 0x5

.field public static final RATING_HEART:I = 0x1

.field public static final RATING_NONE:I = 0x0

.field private static final RATING_NOT_RATED:F = -1.0f

.field public static final RATING_PERCENTAGE:I = 0x6

.field public static final RATING_THUMB_UP_DOWN:I = 0x2

.field private static final TAG:Ljava/lang/String; = "Rating2"


# instance fields
.field private final mRatingStyle:I

.field private final mRatingValue:F


# direct methods
.method private constructor <init>(IF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroid/support/mediacompat/Rating2;->mRatingStyle:I

    iput p2, p0, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    return-void
.end method

.method public static fromBundle(Landroid/os/Bundle;)Landroid/support/mediacompat/Rating2;
    .locals 3
    .param p0    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Landroid/support/mediacompat/Rating2;

    const-string v1, "android.media.rating2.style"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "android.media.rating2.value"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result p0

    invoke-direct {v0, v1, p0}, Landroid/support/mediacompat/Rating2;-><init>(IF)V

    return-object v0
.end method

.method public static newHeartRating(Z)Landroid/support/mediacompat/Rating2;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    new-instance v0, Landroid/support/mediacompat/Rating2;

    if-eqz p0, :cond_0

    const/high16 p0, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    const/4 v1, 0x1

    invoke-direct {v0, v1, p0}, Landroid/support/mediacompat/Rating2;-><init>(IF)V

    return-object v0
.end method

.method public static newPercentageRating(F)Landroid/support/mediacompat/Rating2;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    cmpg-float v0, p0, v0

    if-ltz v0, :cond_1

    const/high16 v0, 0x42c80000    # 100.0f

    cmpl-float v0, p0, v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/support/mediacompat/Rating2;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p0}, Landroid/support/mediacompat/Rating2;-><init>(IF)V

    return-object v0

    :cond_1
    :goto_0
    const-string p0, "Rating2"

    const-string v0, "Invalid percentage-based rating value"

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method public static newStarRating(IF)Landroid/support/mediacompat/Rating2;
    .locals 3
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_0

    const-string p1, "Rating2"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid rating style ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ") for a star rating"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :pswitch_0
    const/high16 v1, 0x40a00000    # 5.0f

    goto :goto_0

    :pswitch_1
    const/high16 v1, 0x40800000    # 4.0f

    goto :goto_0

    :pswitch_2
    const/high16 v1, 0x40400000    # 3.0f

    nop

    :goto_0
    const/4 v2, 0x0

    cmpg-float v2, p1, v2

    if-ltz v2, :cond_1

    cmpl-float v1, p1, v1

    if-lez v1, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Landroid/support/mediacompat/Rating2;

    invoke-direct {v0, p0, p1}, Landroid/support/mediacompat/Rating2;-><init>(IF)V

    return-object v0

    :cond_1
    :goto_1
    const-string p0, "Rating2"

    const-string p1, "Trying to set out of range star-based rating"

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static newThumbRating(Z)Landroid/support/mediacompat/Rating2;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    new-instance v0, Landroid/support/mediacompat/Rating2;

    if-eqz p0, :cond_0

    const/high16 p0, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    const/4 v1, 0x2

    invoke-direct {v0, v1, p0}, Landroid/support/mediacompat/Rating2;-><init>(IF)V

    return-object v0
.end method

.method public static newUnratedRating(I)Landroid/support/mediacompat/Rating2;
    .locals 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    :pswitch_0
    new-instance v0, Landroid/support/mediacompat/Rating2;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-direct {v0, p0, v1}, Landroid/support/mediacompat/Rating2;-><init>(IF)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    instance-of v0, p1, Landroid/support/mediacompat/Rating2;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    check-cast p1, Landroid/support/mediacompat/Rating2;

    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingStyle:I

    iget v2, p1, Landroid/support/mediacompat/Rating2;->mRatingStyle:I

    if-ne v0, v2, :cond_1

    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    iget p1, p1, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    cmpl-float p1, v0, p1

    if-nez p1, :cond_1

    const/4 v1, 0x1

    nop

    :cond_1
    return v1
.end method

.method public getPercentRating()F
    .locals 2

    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingStyle:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Landroid/support/mediacompat/Rating2;->isRated()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    return v0

    :cond_1
    :goto_0
    const/high16 v0, -0x40800000    # -1.0f

    return v0
.end method

.method public getRatingStyle()I
    .locals 1

    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingStyle:I

    return v0
.end method

.method public getStarRating()F
    .locals 1

    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingStyle:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0}, Landroid/support/mediacompat/Rating2;->isRated()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    return v0

    :cond_0
    :goto_0
    const/high16 v0, -0x40800000    # -1.0f

    return v0

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public hasHeart()Z
    .locals 3

    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingStyle:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v2

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Landroid/support/mediacompat/Rating2;->mRatingStyle:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-static {v0}, Landroid/support/v4/util/ObjectsCompat;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isRated()Z
    .locals 2

    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isThumbUp()Z
    .locals 2

    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingStyle:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget v0, p0, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.media.rating2.style"

    iget v2, p0, Landroid/support/mediacompat/Rating2;->mRatingStyle:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "android.media.rating2.value"

    iget v2, p0, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Rating2:style="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/mediacompat/Rating2;->mRatingStyle:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " rating="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    const-string/jumbo v1, "unrated"

    goto :goto_0

    :cond_0
    iget v1, p0, Landroid/support/mediacompat/Rating2;->mRatingValue:F

    invoke-static {v1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
