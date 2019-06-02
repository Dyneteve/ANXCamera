.class public Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox$Entry;
.super Ljava/lang/Object;
.source "CompositionOffsetsBox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entry"
.end annotation


# instance fields
.field public count:I

.field public offset:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox$Entry;->count:I

    iput p2, p0, Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox$Entry;->offset:I

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox$Entry;->count:I

    return v0
.end method

.method public getOffset()I
    .locals 1

    iget v0, p0, Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox$Entry;->offset:I

    return v0
.end method
