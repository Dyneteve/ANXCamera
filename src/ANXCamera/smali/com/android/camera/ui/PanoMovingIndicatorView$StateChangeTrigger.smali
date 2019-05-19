.class Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;
.super Ljava/lang/Object;
.source "PanoMovingIndicatorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/PanoMovingIndicatorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StateChangeTrigger"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mCurrentState:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mLatestState:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mLatestTimes:I

.field private mMaxTimes:I

.field private mMaxTimesMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "TT;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/android/camera/ui/PanoMovingIndicatorView;


# direct methods
.method public constructor <init>(Lcom/android/camera/ui/PanoMovingIndicatorView;Ljava/lang/Object;Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/util/HashMap<",
            "TT;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->this$0:Lcom/android/camera/ui/PanoMovingIndicatorView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestTimes:I

    iput-object p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestState:Ljava/lang/Object;

    iput-object p2, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mCurrentState:Ljava/lang/Object;

    iput-object p3, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mMaxTimesMap:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestState:Ljava/lang/Object;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    iput-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestState:Ljava/lang/Object;

    iput v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestTimes:I

    iget-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mMaxTimesMap:Ljava/util/HashMap;

    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestState:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-nez p1, :cond_0

    const/4 p1, 0x3

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_0
    iput p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mMaxTimes:I

    goto :goto_1

    :cond_1
    iget p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestTimes:I

    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mMaxTimes:I

    if-ge p1, v0, :cond_2

    iget p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestTimes:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestTimes:I

    sget-object p1, Lcom/android/camera/ui/PanoMovingIndicatorView;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mLatestState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestState:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestTimes:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_1
    iget p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mMaxTimes:I

    iget v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestTimes:I

    if-ne p1, v0, :cond_3

    iget-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mCurrentState:Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestState:Ljava/lang/Object;

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mLatestState:Ljava/lang/Object;

    iput-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mCurrentState:Ljava/lang/Object;

    :cond_3
    iget-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mCurrentState:Ljava/lang/Object;

    return-object p1
.end method

.method public setCurrentState(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/camera/ui/PanoMovingIndicatorView$StateChangeTrigger;->mCurrentState:Ljava/lang/Object;

    return-void
.end method
