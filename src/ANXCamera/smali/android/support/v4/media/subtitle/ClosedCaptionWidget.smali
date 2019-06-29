.class abstract Landroid/support/v4/media/subtitle/ClosedCaptionWidget;
.super Landroid/view/ViewGroup;
.source "ClosedCaptionWidget.java"

# interfaces
.implements Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget;


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x1c
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;
    }
.end annotation


# instance fields
.field protected mCaptionStyle:Landroid/view/accessibility/CaptioningManager$CaptionStyle;

.field private final mCaptioningListener:Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;

.field protected mClosedCaptionLayout:Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

.field private mHasChangeListener:Z

.field protected mListener:Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget$OnChangedListener;

.field private final mManager:Landroid/view/accessibility/CaptioningManager;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    new-instance p2, Landroid/support/v4/media/subtitle/ClosedCaptionWidget$1;

    invoke-direct {p2, p0}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget$1;-><init>(Landroid/support/v4/media/subtitle/ClosedCaptionWidget;)V

    iput-object p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mCaptioningListener:Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;

    const/4 p2, 0x1

    const/4 p3, 0x0

    invoke-virtual {p0, p2, p3}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->setLayerType(ILandroid/graphics/Paint;)V

    const-string p2, "captioning"

    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/accessibility/CaptioningManager;

    iput-object p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mManager:Landroid/view/accessibility/CaptioningManager;

    iget-object p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mManager:Landroid/view/accessibility/CaptioningManager;

    invoke-virtual {p2}, Landroid/view/accessibility/CaptioningManager;->getUserStyle()Landroid/view/accessibility/CaptioningManager$CaptionStyle;

    move-result-object p2

    iput-object p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mCaptionStyle:Landroid/view/accessibility/CaptioningManager$CaptionStyle;

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->createCaptionLayout(Landroid/content/Context;)Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mClosedCaptionLayout:Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

    iget-object p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mClosedCaptionLayout:Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

    iget-object p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mCaptionStyle:Landroid/view/accessibility/CaptioningManager$CaptionStyle;

    invoke-interface {p1, p2}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;->setCaptionStyle(Landroid/view/accessibility/CaptioningManager$CaptionStyle;)V

    iget-object p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mClosedCaptionLayout:Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

    iget-object p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mManager:Landroid/view/accessibility/CaptioningManager;

    invoke-virtual {p2}, Landroid/view/accessibility/CaptioningManager;->getFontScale()F

    move-result p2

    invoke-interface {p1, p2}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;->setFontScale(F)V

    iget-object p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mClosedCaptionLayout:Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

    check-cast p1, Landroid/view/ViewGroup;

    const/4 p2, -0x1

    invoke-virtual {p0, p1, p2, p2}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->addView(Landroid/view/View;II)V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->requestLayout()V

    return-void
.end method

.method private manageChangeListener()V
    .locals 2

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-boolean v1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mHasChangeListener:Z

    if-eq v1, v0, :cond_2

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mHasChangeListener:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mManager:Landroid/view/accessibility/CaptioningManager;

    iget-object v1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mCaptioningListener:Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;

    invoke-virtual {v0, v1}, Landroid/view/accessibility/CaptioningManager;->addCaptioningChangeListener(Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mManager:Landroid/view/accessibility/CaptioningManager;

    iget-object v1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mCaptioningListener:Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;

    invoke-virtual {v0, v1}, Landroid/view/accessibility/CaptioningManager;->removeCaptioningChangeListener(Landroid/view/accessibility/CaptioningManager$CaptioningChangeListener;)V

    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public abstract createCaptionLayout(Landroid/content/Context;)Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;
.end method

.method public onAttachedToWindow()V
    .locals 0

    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->manageChangeListener()V

    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->manageChangeListener()V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    iget-object p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mClosedCaptionLayout:Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1, p2, p3, p4, p5}, Landroid/view/ViewGroup;->layout(IIII)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mClosedCaptionLayout:Landroid/support/v4/media/subtitle/ClosedCaptionWidget$ClosedCaptionLayout;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->measure(II)V

    return-void
.end method

.method public setOnChangedListener(Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget$OnChangedListener;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->mListener:Landroid/support/v4/media/subtitle/SubtitleTrack$RenderingWidget$OnChangedListener;

    return-void
.end method

.method public setSize(II)V
    .locals 2

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {p0, v1, v0}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->measure(II)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, p1, p2}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->layout(IIII)V

    return-void
.end method

.method public setVisible(Z)V
    .locals 0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->setVisibility(I)V

    :goto_0
    invoke-direct {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionWidget;->manageChangeListener()V

    return-void
.end method
