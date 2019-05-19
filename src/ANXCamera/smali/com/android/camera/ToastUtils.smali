.class public Lcom/android/camera/ToastUtils;
.super Ljava/lang/Object;
.source "ToastUtils.java"


# static fields
.field private static final SHORT_DURATION_TIMEOUT:J = 0x7d0L

.field private static sGravity:I

.field private static sOldMsg:Ljava/lang/String;

.field private static sOneTime:J

.field protected static sToast:Landroid/widget/Toast;

.field private static sTwoTime:J

.field private static sXOffset:I

.field private static sYOffset:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    sput-object v0, Lcom/android/camera/ToastUtils;->sToast:Landroid/widget/Toast;

    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/android/camera/ToastUtils;->sOneTime:J

    sput-wide v0, Lcom/android/camera/ToastUtils;->sTwoTime:J

    const/16 v0, 0x11

    sput v0, Lcom/android/camera/ToastUtils;->sGravity:I

    const/4 v0, 0x0

    sput v0, Lcom/android/camera/ToastUtils;->sXOffset:I

    sput v0, Lcom/android/camera/ToastUtils;->sYOffset:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static showToast(Landroid/content/Context;I)V
    .locals 2

    nop

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x11

    const/4 v0, 0x0

    invoke-static {v1, p0, p1, v0, v0}, Lcom/android/camera/ToastUtils;->showToast(Ljava/lang/ref/WeakReference;Ljava/lang/String;III)V

    :cond_0
    return-void
.end method

.method public static showToast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 p0, 0x0

    const/16 v1, 0x11

    invoke-static {v0, p1, v1, p0, p0}, Lcom/android/camera/ToastUtils;->showToast(Ljava/lang/ref/WeakReference;Ljava/lang/String;III)V

    return-void
.end method

.method public static showToast(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1

    nop

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 p0, 0x0

    invoke-static {v0, p1, p2, p0, p0}, Lcom/android/camera/ToastUtils;->showToast(Ljava/lang/ref/WeakReference;Ljava/lang/String;III)V

    :cond_0
    return-void
.end method

.method public static showToast(Landroid/content/Context;Ljava/lang/String;III)V
    .locals 1

    nop

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v0, p1, p2, p3, p4}, Lcom/android/camera/ToastUtils;->showToast(Ljava/lang/ref/WeakReference;Ljava/lang/String;III)V

    :cond_0
    return-void
.end method

.method private static showToast(Ljava/lang/ref/WeakReference;Ljava/lang/String;III)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;",
            "Ljava/lang/String;",
            "III)V"
        }
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/android/camera/ToastUtils;->sToast:Landroid/widget/Toast;

    const/4 v1, 0x0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    if-eqz p0, :cond_1

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    sput-object p0, Lcom/android/camera/ToastUtils;->sToast:Landroid/widget/Toast;

    sget-object p0, Lcom/android/camera/ToastUtils;->sToast:Landroid/widget/Toast;

    invoke-virtual {p0, p2, p3, p4}, Landroid/widget/Toast;->setGravity(III)V

    sget-object p0, Lcom/android/camera/ToastUtils;->sToast:Landroid/widget/Toast;

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    sput-object p1, Lcom/android/camera/ToastUtils;->sOldMsg:Ljava/lang/String;

    sput p2, Lcom/android/camera/ToastUtils;->sGravity:I

    sput p3, Lcom/android/camera/ToastUtils;->sXOffset:I

    sput p4, Lcom/android/camera/ToastUtils;->sYOffset:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    sput-wide p0, Lcom/android/camera/ToastUtils;->sOneTime:J
    :try_end_0
    .catch Landroid/view/InflateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    sput-object v0, Lcom/android/camera/ToastUtils;->sToast:Landroid/widget/Toast;

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception p0

    sput-object v0, Lcom/android/camera/ToastUtils;->sToast:Landroid/widget/Toast;

    invoke-virtual {p0}, Landroid/view/InflateException;->printStackTrace()V

    :goto_0
    nop

    :cond_1
    :goto_1
    goto :goto_4

    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sput-wide v2, Lcom/android/camera/ToastUtils;->sTwoTime:J

    nop

    sget-object p0, Lcom/android/camera/ToastUtils;->sOldMsg:Ljava/lang/String;

    const/4 v0, 0x1

    if-eqz p0, :cond_3

    sget-object p0, Lcom/android/camera/ToastUtils;->sOldMsg:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    sput-object p1, Lcom/android/camera/ToastUtils;->sOldMsg:Ljava/lang/String;

    sget-object p0, Lcom/android/camera/ToastUtils;->sToast:Landroid/widget/Toast;

    invoke-virtual {p0, p1}, Landroid/widget/Toast;->setText(Ljava/lang/CharSequence;)V

    nop

    move v1, v0

    :cond_3
    sget p0, Lcom/android/camera/ToastUtils;->sGravity:I

    if-ne p2, p0, :cond_5

    sget p0, Lcom/android/camera/ToastUtils;->sXOffset:I

    if-ne p0, p3, :cond_5

    sget p0, Lcom/android/camera/ToastUtils;->sYOffset:I

    if-eq p0, p4, :cond_4

    goto :goto_2

    :cond_4
    move v0, v1

    goto :goto_3

    :cond_5
    :goto_2
    sget-object p0, Lcom/android/camera/ToastUtils;->sToast:Landroid/widget/Toast;

    invoke-virtual {p0, p2, p3, p4}, Landroid/widget/Toast;->setGravity(III)V

    sput p2, Lcom/android/camera/ToastUtils;->sGravity:I

    sput p3, Lcom/android/camera/ToastUtils;->sXOffset:I

    sput p4, Lcom/android/camera/ToastUtils;->sYOffset:I

    nop

    :goto_3
    if-nez v0, :cond_6

    sget-wide p0, Lcom/android/camera/ToastUtils;->sTwoTime:J

    sget-wide p2, Lcom/android/camera/ToastUtils;->sOneTime:J

    sub-long/2addr p0, p2

    const-wide/16 p2, 0x7d0

    cmp-long p0, p0, p2

    if-lez p0, :cond_7

    :cond_6
    sget-wide p0, Lcom/android/camera/ToastUtils;->sTwoTime:J

    sput-wide p0, Lcom/android/camera/ToastUtils;->sOneTime:J

    sget-object p0, Lcom/android/camera/ToastUtils;->sToast:Landroid/widget/Toast;

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    :cond_7
    :goto_4
    return-void
.end method
