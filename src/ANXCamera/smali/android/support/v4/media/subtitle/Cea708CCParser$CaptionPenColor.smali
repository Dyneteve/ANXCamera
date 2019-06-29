.class public Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;
.super Ljava/lang/Object;
.source "Cea708CCParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/Cea708CCParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CaptionPenColor"
.end annotation


# instance fields
.field public final backgroundColor:Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;

.field public final edgeColor:Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;

.field public final foregroundColor:Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;


# direct methods
.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;->foregroundColor:Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;

    iput-object p2, p0, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;->backgroundColor:Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;

    iput-object p3, p0, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;->edgeColor:Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;

    return-void
.end method
