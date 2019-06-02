.class Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;
.super Ljava/lang/Object;
.source "BeautySmoothLevelFragment.java"

# interfaces
.implements Lcom/android/camera/ui/SeekBarCompat$OnSeekBarCompatTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getNextProgress(Landroid/view/MotionEvent;)I
    .locals 5

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->access$100(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/SeekBarCompat;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->access$200(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)Z

    move-result v1

    if-eqz v1, :cond_0

    int-to-float v1, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    sub-float/2addr v1, v2

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    :goto_0
    int-to-float v0, v0

    div-float/2addr v1, v0

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-static {v0}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->access$300(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr v1, v0

    float-to-int v0, v1

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-static {v1}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->access$100(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/SeekBarCompat;->getPinProgress()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const/4 v4, 0x2

    if-eq v3, v4, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v3, 0x1

    if-ne p1, v3, :cond_4

    :cond_1
    add-int/lit8 p1, v0, 0x0

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    const/4 v3, 0x5

    if-gt p1, v3, :cond_2

    nop

    move v0, v2

    goto :goto_1

    :cond_2
    sub-int p1, v0, v1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    if-gt p1, v3, :cond_3

    nop

    move v0, v1

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->access$300(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)I

    move-result p1

    sub-int p1, v0, p1

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    if-gt p1, v3, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->access$300(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)I

    move-result v0

    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->access$100(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/SeekBarCompat;->isCenterTwoWayMode()Z

    move-result p1

    if-eqz p1, :cond_5

    sub-int/2addr v0, v1

    sub-int/2addr v2, v1

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->access$300(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)I

    move-result p1

    sub-int/2addr p1, v1

    invoke-static {v0, v2, p1}, Lcom/android/camera/Util;->clamp(III)I

    move-result p1

    goto :goto_2

    :cond_5
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->access$300(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)I

    move-result p1

    invoke-static {v0, v2, p1}, Lcom/android/camera/Util;->clamp(III)I

    move-result p1

    :goto_2
    return p1
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x1

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-static {v2}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->access$100(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ui/SeekBarCompat;->getThumb()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Landroid/graphics/Rect;->contains(II)Z

    move-result p1

    if-nez p1, :cond_0

    return v0

    :cond_0
    :pswitch_1
    invoke-direct {p0, p2}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->getNextProgress(Landroid/view/MotionEvent;)I

    move-result p1

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment$2;->this$0:Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;

    invoke-static {p2}, Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;->access$100(Lcom/android/camera/fragment/beauty/BeautySmoothLevelFragment;)Lcom/android/camera/ui/SeekBarCompat;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/camera/ui/SeekBarCompat;->setProgress(I)V

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
