.class public Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox$LongEntry;
.super Ljava/lang/Object;
.source "CompositionOffsetsBox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LongEntry"
.end annotation


# instance fields
.field public count:J

.field public offset:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox$LongEntry;->count:J

    iput-wide p3, p0, Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox$LongEntry;->offset:J

    return-void
.end method


# virtual methods
.method public getCount()J
    .locals 2

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox$LongEntry;->count:J

    return-wide v0
.end method

.method public getOffset()J
    .locals 2

    iget-wide v0, p0, Lorg/jcodec/containers/mp4/boxes/CompositionOffsetsBox$LongEntry;->offset:J

    return-wide v0
.end method
