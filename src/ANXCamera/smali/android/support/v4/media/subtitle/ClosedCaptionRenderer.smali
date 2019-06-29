.class public Landroid/support/v4/media/subtitle/ClosedCaptionRenderer;
.super Landroid/support/v4/media/subtitle/SubtitleController$Renderer;
.source "ClosedCaptionRenderer.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x1c
.end annotation

.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;,
        Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CaptionTrack;
    }
.end annotation


# instance fields
.field private mCCWidget:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;

.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/SubtitleController$Renderer;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public createTrack(Landroid/media/MediaFormat;)Landroid/support/v4/media/subtitle/SubtitleTrack;
    .locals 3

    const-string v0, "mime"

    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "text/cea-608"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer;->mCCWidget:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;

    if-nez v0, :cond_0

    new-instance v0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;

    iget-object v1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;-><init>(Landroid/support/v4/media/subtitle/ClosedCaptionRenderer;Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer;->mCCWidget:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;

    :cond_0
    new-instance v0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CaptionTrack;

    iget-object v1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer;->mCCWidget:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;

    invoke-direct {v0, v1, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CaptionTrack;-><init>(Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;Landroid/media/MediaFormat;)V

    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No matching format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/media/MediaFormat;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public supports(Landroid/media/MediaFormat;)Z
    .locals 1

    const-string v0, "mime"

    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "mime"

    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "text/cea-608"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
