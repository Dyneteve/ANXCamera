.class public Landroid/support/v4/media/MediaMetadataCompatApi21$Builder;
.super Ljava/lang/Object;
.source "MediaMetadataCompatApi21.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaMetadataCompatApi21;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static build(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    move-object v0, p0

    check-cast v0, Landroid/media/MediaMetadata$Builder;

    invoke-virtual {v0}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance()Ljava/lang/Object;
    .registers 1

    new-instance v0, Landroid/media/MediaMetadata$Builder;

    invoke-direct {v0}, Landroid/media/MediaMetadata$Builder;-><init>()V

    return-object v0
.end method

.method public static putBitmap(Ljava/lang/Object;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .registers 4

    move-object v0, p0

    check-cast v0, Landroid/media/MediaMetadata$Builder;

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    return-void
.end method

.method public static putLong(Ljava/lang/Object;Ljava/lang/String;J)V
    .registers 5

    move-object v0, p0

    check-cast v0, Landroid/media/MediaMetadata$Builder;

    invoke-virtual {v0, p1, p2, p3}, Landroid/media/MediaMetadata$Builder;->putLong(Ljava/lang/String;J)Landroid/media/MediaMetadata$Builder;

    return-void
.end method

.method public static putRating(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5

    move-object v0, p0

    check-cast v0, Landroid/media/MediaMetadata$Builder;

    move-object v1, p2

    check-cast v1, Landroid/media/Rating;

    invoke-virtual {v0, p1, v1}, Landroid/media/MediaMetadata$Builder;->putRating(Ljava/lang/String;Landroid/media/Rating;)Landroid/media/MediaMetadata$Builder;

    return-void
.end method

.method public static putString(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    move-object v0, p0

    check-cast v0, Landroid/media/MediaMetadata$Builder;

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    return-void
.end method

.method public static putText(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/CharSequence;)V
    .registers 4

    move-object v0, p0

    check-cast v0, Landroid/media/MediaMetadata$Builder;

    invoke-virtual {v0, p1, p2}, Landroid/media/MediaMetadata$Builder;->putText(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/media/MediaMetadata$Builder;

    return-void
.end method
