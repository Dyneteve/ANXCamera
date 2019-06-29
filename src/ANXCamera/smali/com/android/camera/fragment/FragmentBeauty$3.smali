.class Lcom/android/camera/fragment/FragmentBeauty$3;
.super Ljava/lang/Object;
.source "FragmentBeauty.java"

# interfaces
.implements Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentBeauty;->initAdjustSeekBar()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBeauty;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentBeauty;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$3;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$3;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {p1}, Lcom/android/camera/fragment/FragmentBeauty;->access$100(Lcom/android/camera/fragment/FragmentBeauty;)I

    move-result p1

    if-eq p2, p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$3;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {p1}, Lcom/android/camera/fragment/FragmentBeauty;->access$200(Lcom/android/camera/fragment/FragmentBeauty;)I

    move-result p1

    sub-int p1, p2, p1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    const/4 p3, 0x5

    if-le p1, p3, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$3;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {p1, p2}, Lcom/android/camera/fragment/FragmentBeauty;->access$202(Lcom/android/camera/fragment/FragmentBeauty;I)I

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$3;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {p1}, Lcom/android/camera/fragment/FragmentBeauty;->access$000(Lcom/android/camera/fragment/FragmentBeauty;)Lio/reactivex/FlowableEmitter;

    move-result-object p1

    div-int/lit8 p2, p2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p1, p2}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_1
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
