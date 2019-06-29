.class Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;
.super Lcom/android/camera/panorama/AttachRunnable;
.source "Panorama3Module.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/Panorama3Module$PanoramaPreview;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PreviewAttach"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;
    }
.end annotation


# instance fields
.field private mInputSave:Lcom/android/camera/panorama/InputSave;

.field private mIsAttachEnd:Z

.field private final mPostAttachRunnable:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;

.field private mResultCode:I

.field final synthetic this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview;)V
    .locals 1

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    invoke-direct {p0}, Lcom/android/camera/panorama/AttachRunnable;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mIsAttachEnd:Z

    new-instance p1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;-><init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;Lcom/android/camera/module/Panorama3Module$1;)V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mPostAttachRunnable:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;

    new-instance p1, Lcom/android/camera/panorama/InputSave;

    invoke-direct {p1}, Lcom/android/camera/panorama/InputSave;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mInputSave:Lcom/android/camera/panorama/InputSave;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview;Lcom/android/camera/module/Panorama3Module$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;-><init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview;)V

    return-void
.end method

.method private checkAttachEnd([D)V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->access$6000(Lcom/android/camera/module/Panorama3Module$PanoramaPreview;)Lcom/android/camera/panorama/PositionDetector;

    move-result-object v0

    const/4 v1, 0x0

    aget-wide v2, p1, v1

    const/4 v4, 0x1

    aget-wide v5, p1, v4

    invoke-virtual {v0, v2, v3, v5, v6}, Lcom/android/camera/panorama/PositionDetector;->detect(DD)I

    move-result p1

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkAttachEnd detect_result = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    if-eq p1, v4, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :cond_0
    :pswitch_0
    iput v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mResultCode:I

    iput-boolean v4, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mIsAttachEnd:Z

    nop

    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->access$6100(Lcom/android/camera/module/Panorama3Module$PanoramaPreview;)Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;->setDetectResult(I)V

    iget-object p1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object p1, p1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {p1}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->access$6100(Lcom/android/camera/module/Panorama3Module$PanoramaPreview;)Lcom/android/camera/module/Panorama3Module$PanoramaPreview$UiUpdateRunnable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera/Camera;->runOnUiThread(Ljava/lang/Runnable;)V

    iget-boolean p1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mIsAttachEnd:Z

    if-eqz p1, :cond_1

    return-void

    :cond_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private updatePreviewImage()V
    .locals 14

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$4600()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$500(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$4700(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->updatePreviewImage(Landroid/graphics/Bitmap;)I

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "updatePreviewImage error ret:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$4700(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v1

    const-string v2, "mPreviewImage is null when updatePreviewImage"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :cond_1
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v1

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    const/16 v2, 0xb4

    rem-int/2addr v1, v2

    const/high16 v3, 0x40000000    # 2.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/16 v5, 0x5a

    const/4 v6, 0x0

    if-ne v1, v5, :cond_3

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v1

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    const/16 v5, 0x10e

    if-ne v1, v5, :cond_2

    nop

    nop

    new-instance v12, Landroid/graphics/Matrix;

    invoke-direct {v12}, Landroid/graphics/Matrix;-><init>()V

    int-to-float v1, v2

    invoke-virtual {v12, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$4700(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$4700(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$4700(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    const/4 v13, 0x1

    invoke-static/range {v7 .. v13}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$4700(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v1

    :goto_0
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    iget-object v7, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v7, v7, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v7}, Lcom/android/camera/module/Panorama3Module;->access$2600(Lcom/android/camera/module/Panorama3Module;)F

    move-result v7

    mul-float/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    iget-object v7, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v7, v7, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v7}, Lcom/android/camera/module/Panorama3Module;->access$1400(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    iget-object v8, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v8, v8, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v8}, Lcom/android/camera/module/Panorama3Module;->access$1400(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9, v6, v6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    int-to-float v7, v7

    int-to-float v8, v8

    div-float/2addr v7, v8

    int-to-float v8, v2

    div-float/2addr v8, v7

    float-to-int v7, v8

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    int-to-float v8, v8

    iget-object v10, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v10, v10, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v10}, Lcom/android/camera/module/Panorama3Module;->access$2600(Lcom/android/camera/module/Panorama3Module;)F

    move-result v10

    sub-float/2addr v4, v10

    mul-float/2addr v8, v4

    div-float/2addr v8, v3

    float-to-int v3, v8

    sub-int v4, v7, v5

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    new-instance v4, Landroid/graphics/Rect;

    add-int/2addr v7, v3

    invoke-direct {v4, v6, v3, v2, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "src "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, ", dst = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$4900(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Canvas;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3}, Lcom/android/camera/module/Panorama3Module;->access$5000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Paint;

    move-result-object v3

    invoke-virtual {v2, v1, v4, v9, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto/16 :goto_1

    :cond_3
    nop

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$3300(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;

    move-result-object v1

    iget v1, v1, Lcom/android/camera/panorama/MorphoPanoramaGP3$InitParam;->output_rotation:I

    if-ne v1, v2, :cond_4

    const/16 v5, -0x5a

    :cond_4
    new-instance v12, Landroid/graphics/Matrix;

    invoke-direct {v12}, Landroid/graphics/Matrix;-><init>()V

    int-to-float v1, v5

    invoke-virtual {v12, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$4700(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$4700(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    iget-object v1, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v1, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v1}, Lcom/android/camera/module/Panorama3Module;->access$4700(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    const/4 v13, 0x1

    invoke-static/range {v7 .. v13}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    iget-object v7, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v7, v7, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v7}, Lcom/android/camera/module/Panorama3Module;->access$2600(Lcom/android/camera/module/Panorama3Module;)F

    move-result v7

    mul-float/2addr v5, v7

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    iget-object v7, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v7, v7, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v7}, Lcom/android/camera/module/Panorama3Module;->access$1400(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    iget-object v8, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v8, v8, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v8}, Lcom/android/camera/module/Panorama3Module;->access$1400(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Bitmap;

    move-result-object v8

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9, v6, v6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    int-to-float v7, v7

    int-to-float v8, v8

    div-float/2addr v7, v8

    int-to-float v8, v2

    div-float/2addr v8, v7

    float-to-int v7, v8

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    int-to-float v8, v8

    iget-object v10, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v10, v10, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v10}, Lcom/android/camera/module/Panorama3Module;->access$2600(Lcom/android/camera/module/Panorama3Module;)F

    move-result v10

    sub-float/2addr v4, v10

    mul-float/2addr v8, v4

    div-float/2addr v8, v3

    float-to-int v3, v8

    sub-int v4, v7, v5

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v3, v4

    new-instance v4, Landroid/graphics/Rect;

    add-int/2addr v7, v3

    invoke-direct {v4, v6, v3, v2, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "src "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, ", dst = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$4900(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Canvas;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3}, Lcom/android/camera/module/Panorama3Module;->access$5000(Lcom/android/camera/module/Panorama3Module;)Landroid/graphics/Paint;

    move-result-object v3

    invoke-virtual {v2, v1, v4, v9, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :goto_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public run()V
    .locals 19

    move-object/from16 v1, p0

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v2, "PreviewAttach.run start"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    nop

    const/4 v0, 0x2

    new-array v15, v0, [D

    :goto_0
    const/4 v14, -0x1

    :try_start_0
    iget-object v2, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$2700(Lcom/android/camera/module/Panorama3Module;)Ljava/util/concurrent/LinkedBlockingQueue;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/panorama/CaptureImage;

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$2800()Lcom/android/camera/panorama/CaptureImage;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    if-eq v2, v3, :cond_4

    :try_start_1
    invoke-virtual {v1, v2}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->setImage(Lcom/android/camera/panorama/CaptureImage;)V

    sget-boolean v3, Lcom/android/camera/module/Panorama3Module;->DUMP_YUV:Z

    if-eqz v3, :cond_0

    iget-object v3, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mInputSave:Lcom/android/camera/panorama/InputSave;

    iget-object v4, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v4, v4, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v4}, Lcom/android/camera/module/Panorama3Module;->access$1600(Lcom/android/camera/module/Panorama3Module;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lcom/android/camera/panorama/InputSave;->onSaveImage(Lcom/android/camera/panorama/CaptureImage;Ljava/lang/String;)V

    :cond_0
    sget-object v16, Lcom/android/camera/module/Panorama3Module;->mEngineLock:Ljava/lang/Object;

    monitor-enter v16
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    :try_start_2
    iget-object v3, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v2, "PreviewAttach request stop"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v16
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->closeSrc()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1

    return-void

    :cond_1
    :try_start_4
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v3

    const-string v4, "PreviewAttach attach start"

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v3, v3, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v3, v2}, Lcom/android/camera/module/Panorama3Module;->access$3100(Lcom/android/camera/module/Panorama3Module;Lcom/android/camera/panorama/CaptureImage;)V

    iget-object v2, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v2}, Lcom/android/camera/module/Panorama3Module;->access$500(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/MorphoPanoramaGP3;

    move-result-object v2

    iget-object v3, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->byteBuffer:[Ljava/nio/ByteBuffer;

    const/16 v17, 0x0

    aget-object v3, v3, v17

    iget-object v4, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->byteBuffer:[Ljava/nio/ByteBuffer;

    const/4 v13, 0x1

    aget-object v4, v4, v13

    iget-object v5, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->byteBuffer:[Ljava/nio/ByteBuffer;

    aget-object v5, v5, v0

    iget-object v6, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->rowStride:[I

    aget v6, v6, v17

    iget-object v7, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->rowStride:[I

    aget v7, v7, v13

    iget-object v8, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->rowStride:[I

    aget v8, v8, v0

    iget-object v9, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->pixelStride:[I

    aget v9, v9, v17

    iget-object v10, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->pixelStride:[I

    aget v10, v10, v13

    iget-object v11, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->pixelStride:[I

    aget v11, v11, v0

    iget-object v12, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v12, v12, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v12}, Lcom/android/camera/module/Panorama3Module;->access$3200(Lcom/android/camera/module/Panorama3Module;)Lcom/android/camera/panorama/SensorInfoManager;

    move-result-object v12

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object v13, v15

    move-object/from16 v18, v15

    move v15, v14

    move-object v14, v0

    :try_start_5
    invoke-virtual/range {v2 .. v14}, Lcom/android/camera/panorama/MorphoPanoramaGP3;->attach(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;IIIIIILcom/android/camera/panorama/SensorInfoManager;[DLandroid/content/Context;)I

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v2, "PreviewAttach attach error."

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iput v15, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mResultCode:I

    monitor-exit v16
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :goto_1
    :try_start_6
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->closeSrc()V
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_0

    goto/16 :goto_4

    :cond_2
    :try_start_7
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v2, "PreviewAttach attach end"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lcom/android/camera/module/Panorama3Module;->access$5502(Lcom/android/camera/module/Panorama3Module;Z)Z

    invoke-direct/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->updatePreviewImage()V

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mCenter = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-wide v4, v18, v17

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-wide v4, v18, v2

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v16
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    iget-object v2, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mPostAttachRunnable:Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$PostAttachRunnable;

    invoke-virtual {v0, v2}, Lcom/android/camera/Camera;->runOnUiThread(Ljava/lang/Runnable;)V

    move-object/from16 v0, v18

    invoke-direct {v1, v0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->checkAttachEnd([D)V

    iget-boolean v2, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mIsAttachEnd:Z

    if-eqz v2, :cond_3

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v2, "preview attach end"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    goto :goto_1

    :cond_3
    :try_start_9
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->closeSrc()V
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_0

    nop

    move-object v15, v0

    const/4 v0, 0x2

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    move v15, v14

    :goto_2
    :try_start_a
    monitor-exit v16
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :try_start_b
    throw v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    :catchall_1
    move-exception v0

    goto :goto_3

    :catchall_2
    move-exception v0

    goto :goto_2

    :catchall_3
    move-exception v0

    move v15, v14

    :goto_3
    :try_start_c
    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->closeSrc()V

    throw v0
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_0

    :catch_0
    move-exception v0

    goto :goto_5

    :cond_4
    :goto_4
    goto :goto_6

    :catch_1
    move-exception v0

    move v15, v14

    :goto_5
    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v2

    const-string v3, "PreviewAttach interrupted"

    invoke-static {v2, v3, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iput v15, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mResultCode:I

    :goto_6
    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-static {v0}, Lcom/android/camera/module/Panorama3Module;->access$1700(Lcom/android/camera/module/Panorama3Module;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v0, v0, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {v0}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v0

    new-instance v2, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$1;

    invoke-direct {v2, v1}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$1;-><init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;)V

    invoke-virtual {v0, v2}, Lcom/android/camera/Camera;->runOnUiThread(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PreviewAttach exit. (request exit)"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    iget v0, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->mResultCode:I

    iget-object v2, v1, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;->this$1:Lcom/android/camera/module/Panorama3Module$PanoramaPreview;

    iget-object v2, v2, Lcom/android/camera/module/Panorama3Module$PanoramaPreview;->this$0:Lcom/android/camera/module/Panorama3Module;

    invoke-virtual {v2}, Lcom/android/camera/module/Panorama3Module;->getActivity()Lcom/android/camera/Camera;

    move-result-object v2

    new-instance v3, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$2;

    invoke-direct {v3, v1, v0}, Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach$2;-><init>(Lcom/android/camera/module/Panorama3Module$PanoramaPreview$PreviewAttach;I)V

    invoke-virtual {v2, v3}, Lcom/android/camera/Camera;->runOnUiThread(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/android/camera/module/Panorama3Module;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "PreviewAttach exit."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
