.class Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;
.super Ljava/lang/Object;
.source "Cea708CaptionRenderer.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CCHandler"
.end annotation


# static fields
.field private static final CAPTION_ALL_WINDOWS_BITMAP:I = 0xff

.field private static final CAPTION_CLEAR_INTERVAL_MS:J = 0xea60L

.field private static final CAPTION_WINDOWS_MAX:I = 0x8

.field private static final DEBUG:Z = false

.field private static final MSG_CAPTION_CLEAR:I = 0x2

.field private static final MSG_DELAY_CANCEL:I = 0x1

.field private static final TAG:Ljava/lang/String; = "CCHandler"

.field private static final TENTHS_OF_SECOND_IN_MILLIS:I = 0x64


# instance fields
.field private final mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

.field private final mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

.field private mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

.field private final mHandler:Landroid/os/Handler;

.field private mIsDelayed:Z

.field private final mPendingCaptionEvents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$1:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;


# direct methods
.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->this$1:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mIsDelayed:Z

    const/16 p1, 0x8

    new-array p1, p1, [Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mPendingCaptionEvents:Ljava/util/ArrayList;

    iput-object p2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method private clearWindows(I)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->getWindowsFromBitmap(I)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->clear()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private defineWindow(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget v0, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;->id:I

    if-ltz v0, :cond_3

    iget-object v1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    array-length v1, v1

    if-lt v0, v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    aget-object v1, v1, v0

    if-nez v1, :cond_2

    new-instance v1, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->this$1:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;

    iget-object v3, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-virtual {v3}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;-><init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/content/Context;)V

    :cond_2
    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-virtual {v1, v2, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->initWindow(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;)V

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    aput-object v1, p1, v0

    iput-object v1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method private delay(I)V
    .locals 4

    if-ltz p1, :cond_1

    const/16 v0, 0xff

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mIsDelayed:Z

    iget-object v1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    mul-int/lit8 p1, p1, 0x64

    int-to-long v2, p1

    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method private delayCancel()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mIsDelayed:Z

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->processPendingBuffer()V

    return-void
.end method

.method private deleteWindows(I)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->getWindowsFromBitmap(I)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->removeFromCaptionView()V

    iget-object v1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->getCaptionWindowId()I

    move-result v0

    const/4 v2, 0x0

    aput-object v2, v1, v0

    goto :goto_0

    :cond_1
    return-void
.end method

.method private displayWindows(I)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->getWindowsFromBitmap(I)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->show()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private getWindowsFromBitmap(I)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_1

    const/4 v2, 0x1

    shl-int/2addr v2, v1

    and-int/2addr v2, p1

    if-eqz v2, :cond_0

    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    aget-object v2, v2, v1

    if-eqz v2, :cond_0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private hideWindows(I)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->getWindowsFromBitmap(I)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->hide()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private processPendingBuffer()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mPendingCaptionEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    invoke-virtual {p0, v1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->processCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mPendingCaptionEvents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method private sendBufferToCurrentWindow(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->sendBuffer(Ljava/lang/String;)V

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    const-wide/32 v1, 0xea60

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_0
    return-void
.end method

.method private sendControlToCurrentWindow(C)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->sendControl(C)V

    :cond_0
    return-void
.end method

.method private setCurrentWindowLayout(I)V
    .locals 1

    if-ltz p1, :cond_2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    array-length v0, v0

    if-lt p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    aget-object p1, v0, p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method private setPenAttr(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->setPenAttr(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;)V

    :cond_0
    return-void
.end method

.method private setPenColor(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->setPenColor(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;)V

    :cond_0
    return-void
.end method

.method private setPenLocation(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenLocation;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    iget v1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenLocation;->row:I

    iget p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenLocation;->column:I

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->setPenLocation(II)V

    :cond_0
    return-void
.end method

.method private setWindowAttr(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindowAttr;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->setWindowAttr(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindowAttr;)V

    :cond_0
    return-void
.end method

.method private toggleWindows(I)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->getWindowsFromBitmap(I)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->isShown()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->hide()V

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->show()V

    :goto_1
    goto :goto_0

    :cond_2
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 1

    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    const/16 p1, 0xff

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->clearWindows(I)V

    return v0

    :pswitch_1
    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->delayCancel()V

    return v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public processCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V
    .locals 1

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mIsDelayed:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mPendingCaptionEvents:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :cond_0
    iget v0, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->type:I

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->defineWindow(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;)V

    goto/16 :goto_0

    :pswitch_1
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindowAttr;

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->setWindowAttr(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindowAttr;)V

    goto/16 :goto_0

    :pswitch_2
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenLocation;

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->setPenLocation(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenLocation;)V

    goto/16 :goto_0

    :pswitch_3
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->setPenColor(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;)V

    goto/16 :goto_0

    :pswitch_4
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->setPenAttr(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;)V

    goto/16 :goto_0

    :pswitch_5
    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->reset()V

    goto/16 :goto_0

    :pswitch_6
    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->delayCancel()V

    goto :goto_0

    :pswitch_7
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->delay(I)V

    goto :goto_0

    :pswitch_8
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->deleteWindows(I)V

    goto :goto_0

    :pswitch_9
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->toggleWindows(I)V

    goto :goto_0

    :pswitch_a
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->hideWindows(I)V

    goto :goto_0

    :pswitch_b
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->displayWindows(I)V

    goto :goto_0

    :pswitch_c
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->clearWindows(I)V

    goto :goto_0

    :pswitch_d
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->setCurrentWindowLayout(I)V

    goto :goto_0

    :pswitch_e
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Character;

    invoke-virtual {p1}, Ljava/lang/Character;->charValue()C

    move-result p1

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->sendControlToCurrentWindow(C)V

    goto :goto_0

    :pswitch_f
    iget-object p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->sendBufferToCurrentWindow(Ljava/lang/String;)V

    nop

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public reset()V
    .locals 3

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCurrentWindowLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mIsDelayed:Z

    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mPendingCaptionEvents:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    :goto_0
    const/16 v2, 0x8

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    aget-object v2, v2, v1

    if-eqz v2, :cond_0

    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->removeFromCaptionView()V

    :cond_0
    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCaptionWindowLayouts:[Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;

    aput-object v0, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;->setVisibility(I)V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCHandler;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    return-void
.end method
