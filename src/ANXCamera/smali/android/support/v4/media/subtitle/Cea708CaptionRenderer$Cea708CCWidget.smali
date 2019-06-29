.class Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;
.super Landroid/support/v4/media/subtitle/ClosedCaptionWidget;
.source "Cea708CaptionRenderer.java"

# interfaces
.implements Landroid/support/v4/media/subtitle/Cea708CCParser$DisplayListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/Cea708CaptionRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Cea708CCWidget"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;,
        Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;,
        Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;,
        Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;,
        Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$ScaledLayout;
    }
.end annotation


# instance fields
.field private final mCCHandler:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;

.field final synthetic this$0:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer;


# direct methods
.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;-><init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;-><init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;-><init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer;Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->this$0:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    new-instance p1, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;

    iget-object p2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mClosedCaptionLayout:Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

    check-cast p2, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-direct {p1, p0, p2}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;-><init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;)V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mCCHandler:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;

    return-void
.end method


# virtual methods
.method public createCaptionLayout(Landroid/content/Context;)Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;
    .locals 1

    new-instance v0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-direct {v0, p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;-><init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/content/Context;)V

    return-object v0
.end method

.method public emitEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mCCHandler:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->processCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->getHeight()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->setSize(II)V

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mListener:Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget$OnChangedListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mListener:Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget$OnChangedListener;

    invoke-interface {p1, p0}, Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget$OnChangedListener;->onChanged(Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;)V

    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->onDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;->mClosedCaptionLayout:Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method
