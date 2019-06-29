.class public Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenLocation;
.super Ljava/lang/Object;
.source "Cea708CCParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/Cea708CCParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CaptionPenLocation"
.end annotation


# instance fields
.field public final column:I

.field public final row:I


# direct methods
.method constructor <init>(II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenLocation;->row:I

    iput p2, p0, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenLocation;->column:I

    return-void
.end method
