.class public Lcom/android/camera/fragment/live/LiveDownloadView;
.super Lcom/android/camera/fragment/sticker/download/DownloadView;
.source "LiveDownloadView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/sticker/download/DownloadView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/sticker/download/DownloadView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method protected getAlphaNormal()F
    .locals 1

    const v0, 0x3f666666    # 0.9f

    return v0
.end method

.method protected getStateImageResource(I)I
    .locals 1

    const v0, 0x7f020165

    if-eqz p1, :cond_0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    return v0

    :pswitch_1
    const p1, 0x7f020166

    return p1

    :pswitch_2
    const p1, 0x7f020167

    return p1

    :cond_0
    return v0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
