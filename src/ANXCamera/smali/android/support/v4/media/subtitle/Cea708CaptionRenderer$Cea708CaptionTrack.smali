.class Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CaptionTrack;
.super Landroid/support/v4/media/subtitle/SubtitleTrack;
.source "Cea708CaptionRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/Cea708CaptionRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Cea708CaptionTrack"
.end annotation


# instance fields
.field private final mCCParser:Landroid/support/v4/media/subtitle/Cea708CCParser;

.field private final mRenderingWidget:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;


# direct methods
.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/media/MediaFormat;)V
    .locals 0

    invoke-direct {p0, p2}, Landroid/support/v4/media/subtitle/SubtitleTrack;-><init>(Landroid/media/MediaFormat;)V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CaptionTrack;->mRenderingWidget:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;

    new-instance p1, Landroid/support/v4/media/subtitle/Cea708CCParser;

    iget-object p2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CaptionTrack;->mRenderingWidget:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;

    invoke-direct {p1, p2}, Landroid/support/v4/media/subtitle/Cea708CCParser;-><init>(Landroid/support/v4/media/subtitle/Cea708CCParser$DisplayListener;)V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CaptionTrack;->mCCParser:Landroid/support/v4/media/subtitle/Cea708CCParser;

    return-void
.end method


# virtual methods
.method public getRenderingWidget()Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CaptionTrack;->mRenderingWidget:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;

    return-object v0
.end method

.method public onData([BZJ)V
    .locals 0

    iget-object p2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CaptionTrack;->mCCParser:Landroid/support/v4/media/subtitle/Cea708CCParser;

    invoke-virtual {p2, p1}, Landroid/support/v4/media/subtitle/Cea708CCParser;->parse([B)V

    return-void
.end method

.method public updateView(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/media/subtitle/SubtitleTrack$Cue;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
