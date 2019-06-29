.class Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CaptionTrack;
.super Landroid/support/v4/media/subtitle/SubtitleTrack;
.source "ClosedCaptionRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/ClosedCaptionRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Cea608CaptionTrack"
.end annotation


# instance fields
.field private final mCCParser:Landroid/support/v4/media/subtitle/Cea608CCParser;

.field private final mRenderingWidget:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;


# direct methods
.method constructor <init>(Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;Landroid/media/MediaFormat;)V
    .locals 0

    invoke-direct {p0, p2}, Landroid/support/v4/media/subtitle/SubtitleTrack;-><init>(Landroid/media/MediaFormat;)V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CaptionTrack;->mRenderingWidget:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;

    new-instance p1, Landroid/support/v4/media/subtitle/Cea608CCParser;

    iget-object p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CaptionTrack;->mRenderingWidget:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;

    invoke-direct {p1, p2}, Landroid/support/v4/media/subtitle/Cea608CCParser;-><init>(Landroid/support/v4/media/subtitle/Cea608CCParser$DisplayListener;)V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CaptionTrack;->mCCParser:Landroid/support/v4/media/subtitle/Cea608CCParser;

    return-void
.end method


# virtual methods
.method public getRenderingWidget()Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CaptionTrack;->mRenderingWidget:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;

    return-object v0
.end method

.method public onData([BZJ)V
    .locals 0

    iget-object p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CaptionTrack;->mCCParser:Landroid/support/v4/media/subtitle/Cea608CCParser;

    invoke-virtual {p2, p1}, Landroid/support/v4/media/subtitle/Cea608CCParser;->parse([B)V

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
