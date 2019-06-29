.class public Lcom/google/lens/sdk/LensApi;
.super Ljava/lang/Object;
.source "LensApi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/lens/sdk/LensApi$LensSdkParamsCallback;,
        Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;,
        Lcom/google/lens/sdk/LensApi$LensFeature;,
        Lcom/google/lens/sdk/LensApi$LensAvailabilityStatus;
    }
.end annotation


# static fields
.field static final LENS_BITMAP_URI_KEY:Ljava/lang/String; = "LensBitmapUriKey"
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final LENS_DEEPLINKING_STRING:Ljava/lang/String; = "googleapp://lens"
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final LENS_DEEPLINKING_URI:Landroid/net/Uri;
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "LensApi"


# instance fields
.field private final context:Landroid/content/Context;

.field private final paramsReader:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

.field private final serviceBridge:Lcom/google/android/apps/lens/library/base/LensServiceBridge;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "googleapp://lens"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/google/lens/sdk/LensApi;->LENS_DEEPLINKING_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/lens/sdk/LensApi;->context:Landroid/content/Context;

    new-instance v0, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    invoke-direct {v0, p1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/lens/sdk/LensApi;->paramsReader:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    new-instance v0, Lcom/google/android/apps/lens/library/base/LensServiceBridge;

    invoke-direct {v0, p1}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/google/lens/sdk/LensApi;->serviceBridge:Lcom/google/android/apps/lens/library/base/LensServiceBridge;

    return-void
.end method

.method static synthetic access$000(I)I
    .locals 0

    invoke-static {p0}, Lcom/google/lens/sdk/LensApi;->mapInternalLensAvailabilityToExternal(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$100(Lcom/google/lens/sdk/LensApi;Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/google/lens/sdk/LensApi;->startLensActivity(Landroid/app/Activity;)V

    return-void
.end method

.method private appendBitmapUri(Landroid/net/Uri;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "baseUri",
            "bitmapUri"
        }
    .end annotation

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    nop

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "LensBitmapUriKey"

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    return-object p1
.end method

.method private static mapInternalLensAvailabilityToExternal(I)I
    .locals 3
    .annotation build Lcom/google/lens/sdk/LensApi$LensAvailabilityStatus;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "internalLensAvailabilityStatus"
        }
    .end annotation

    packed-switch p0, :pswitch_data_0

    :pswitch_0
    const-string v0, "LensApi"

    const/16 v1, 0x20

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Internal error code: "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x1

    return p0

    :pswitch_1
    return p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private startLensActivity(Landroid/app/Activity;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/lens/sdk/LensApi;->serviceBridge:Lcom/google/android/apps/lens/library/base/LensServiceBridge;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->prewarmLensActivity()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "LensApi"

    const-string v1, "Lens is pre-warmed."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "googleapp://lens"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method


# virtual methods
.method public checkArStickersAvailability(Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "callback"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/lens/sdk/LensApi;->paramsReader:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->getArStickersAvailability()I

    move-result v0

    invoke-static {v0}, Lcom/google/lens/sdk/LensApi;->mapInternalLensAvailabilityToExternal(I)I

    move-result v0

    invoke-interface {p1, v0}, Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;->onAvailabilityStatusFetched(I)V

    return-void
.end method

.method public checkLensAvailability(Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "callback"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/lens/sdk/LensApi;->context:Landroid/content/Context;

    const-string v1, "keyguard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    const/4 v0, 0x5

    invoke-interface {p1, v0}, Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;->onAvailabilityStatusFetched(I)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/lens/sdk/LensApi;->paramsReader:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    new-instance v1, Lcom/google/lens/sdk/LensApi$LensSdkParamsCallback;

    invoke-direct {v1, p1}, Lcom/google/lens/sdk/LensApi$LensSdkParamsCallback;-><init>(Lcom/google/lens/sdk/LensApi$LensAvailabilityCallback;)V

    invoke-virtual {v0, v1}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->getParams(Lcom/google/android/apps/lens/library/base/LensSdkParamsReader$LensSdkParamsCallback;)V

    return-void
.end method

.method public launchLensActivity(Landroid/app/Activity;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "activity"
        }
    .end annotation

    const-string v0, "keyguard"

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/KeyguardManager;

    invoke-virtual {v0}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z

    move-result v1

    if-eqz v1, :cond_1

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_0

    new-instance v1, Lcom/google/lens/sdk/LensApi$1;

    invoke-direct {v1, p0, p1}, Lcom/google/lens/sdk/LensApi$1;-><init>(Lcom/google/lens/sdk/LensApi;Landroid/app/Activity;)V

    invoke-virtual {v0, p1, v1}, Landroid/app/KeyguardManager;->requestDismissKeyguard(Landroid/app/Activity;Landroid/app/KeyguardManager$KeyguardDismissCallback;)V

    return-void

    :cond_0
    const-string p1, "LensApi"

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x40

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Cannot start Lens when device is locked with Android "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    invoke-direct {p0, p1}, Lcom/google/lens/sdk/LensApi;->startLensActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public launchLensActivity(Landroid/app/Activity;I)V
    .locals 2
    .param p2    # I
        .annotation build Lcom/google/lens/sdk/LensApi$LensFeature;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "activity",
            "feature"
        }
    .end annotation

    packed-switch p2, :pswitch_data_0

    const-string p1, "LensApi"

    const/16 v0, 0x22

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v0, "Invalid lens activity: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :pswitch_0
    iget-object p2, p0, Lcom/google/lens/sdk/LensApi;->paramsReader:Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;

    invoke-virtual {p2}, Lcom/google/android/apps/lens/library/base/LensSdkParamsReader;->getArStickersAvailability()I

    move-result p2

    if-nez p2, :cond_0

    new-instance p2, Landroid/content/Intent;

    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    const-string v0, "com.google.ar.lens"

    const-string v1, "com.google.vr.apps.ornament.app.MainActivity"

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0, p1}, Lcom/google/lens/sdk/LensApi;->launchLensActivity(Landroid/app/Activity;)V

    nop

    :cond_0
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public launchLensActivityWithBitmapUri(Landroid/app/Activity;Landroid/net/Uri;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "activity",
            "bitmapUri"
        }
    .end annotation

    if-nez p2, :cond_0

    const-string p1, "LensApi"

    const-string p2, "Image URI is null!"

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    sget-object v1, Lcom/google/lens/sdk/LensApi;->LENS_DEEPLINKING_URI:Landroid/net/Uri;

    invoke-direct {p0, v1, p2}, Lcom/google/lens/sdk/LensApi;->appendBitmapUri(Landroid/net/Uri;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/4 p2, 0x0

    invoke-virtual {p1, v0, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public onPause()V
    .locals 1

    iget-object v0, p0, Lcom/google/lens/sdk/LensApi;->serviceBridge:Lcom/google/android/apps/lens/library/base/LensServiceBridge;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->unbindService()V

    return-void
.end method

.method public onResume()V
    .locals 1

    iget-object v0, p0, Lcom/google/lens/sdk/LensApi;->serviceBridge:Lcom/google/android/apps/lens/library/base/LensServiceBridge;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/LensServiceBridge;->bindService()Z

    return-void
.end method
