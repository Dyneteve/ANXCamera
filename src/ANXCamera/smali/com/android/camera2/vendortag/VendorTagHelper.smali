.class public Lcom/android/camera2/vendortag/VendorTagHelper;
.super Ljava/lang/Object;
.source "VendorTagHelper.java"


# static fields
.field private static final RETHROW:I = 0xcafe

.field private static final TAG:Ljava/lang/String; = "VendorTagHelper"

.field private static final WARNING:I = 0xbabe

.field private static sPreferredAction:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, -0x1

    sput v0, Lcom/android/camera2/vendortag/VendorTagHelper;->sPreferredAction:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getPreferredAction()I
    .locals 2

    sget v0, Lcom/android/camera2/vendortag/VendorTagHelper;->sPreferredAction:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    const-string v0, "VENDOR_TAG_NFE_RETHROW"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f100019

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0xcafe

    goto :goto_0

    :cond_0
    const v0, 0xbabe

    :goto_0
    sput v0, Lcom/android/camera2/vendortag/VendorTagHelper;->sPreferredAction:I

    :cond_1
    sget v0, Lcom/android/camera2/vendortag/VendorTagHelper;->sPreferredAction:I

    return v0
.end method

.method public static getValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CameraCharacteristics;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "TT;>;>;)TT;"
        }
    .end annotation

    invoke-static {}, Lcom/android/camera2/vendortag/VendorTagHelper;->getPreferredAction()I

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/android/camera2/vendortag/VendorTagHelper;->tryGetValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getValue(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureRequest$Builder;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TT;>;>;)TT;"
        }
    .end annotation

    invoke-static {}, Lcom/android/camera2/vendortag/VendorTagHelper;->getPreferredAction()I

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/android/camera2/vendortag/VendorTagHelper;->tryGetValue(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/vendortag/VendorTag;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getValue(Landroid/hardware/camera2/CaptureResult;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureResult;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "TT;>;>;)TT;"
        }
    .end annotation

    invoke-static {}, Lcom/android/camera2/vendortag/VendorTagHelper;->getPreferredAction()I

    move-result v0

    invoke-static {p0, p1, v0}, Lcom/android/camera2/vendortag/VendorTagHelper;->tryGetValue(Landroid/hardware/camera2/CaptureResult;Lcom/android/camera2/vendortag/VendorTag;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getValueQuietly(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CameraCharacteristics;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "TT;>;>;)TT;"
        }
    .end annotation

    const v0, 0xbabe

    invoke-static {p0, p1, v0}, Lcom/android/camera2/vendortag/VendorTagHelper;->tryGetValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getValueQuietly(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureRequest$Builder;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TT;>;>;)TT;"
        }
    .end annotation

    const v0, 0xbabe

    invoke-static {p0, p1, v0}, Lcom/android/camera2/vendortag/VendorTagHelper;->tryGetValue(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/vendortag/VendorTag;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static getValueQuietly(Landroid/hardware/camera2/CaptureResult;Lcom/android/camera2/vendortag/VendorTag;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureResult;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "TT;>;>;)TT;"
        }
    .end annotation

    const v0, 0xbabe

    invoke-static {p0, p1, v0}, Lcom/android/camera2/vendortag/VendorTagHelper;->tryGetValue(Landroid/hardware/camera2/CaptureResult;Lcom/android/camera2/vendortag/VendorTag;I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static setValue(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/vendortag/VendorTag;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureRequest$Builder;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TT;>;>;TT;)V"
        }
    .end annotation

    invoke-static {}, Lcom/android/camera2/vendortag/VendorTagHelper;->getPreferredAction()I

    move-result v0

    invoke-static {p0, p1, p2, v0}, Lcom/android/camera2/vendortag/VendorTagHelper;->trySetValue(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/vendortag/VendorTag;Ljava/lang/Object;I)V

    return-void
.end method

.method public static setValueQuietly(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/vendortag/VendorTag;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureRequest$Builder;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TT;>;>;TT;)V"
        }
    .end annotation

    const v0, 0xbabe

    invoke-static {p0, p1, p2, v0}, Lcom/android/camera2/vendortag/VendorTagHelper;->trySetValue(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/vendortag/VendorTag;Ljava/lang/Object;I)V

    return-void
.end method

.method private static tryGetValue(Landroid/hardware/camera2/CameraCharacteristics;Lcom/android/camera2/vendortag/VendorTag;I)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CameraCharacteristics;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CameraCharacteristics$Key<",
            "TT;>;>;I)TT;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/android/camera2/vendortag/VendorTag;->getKey()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/android/camera2/vendortag/VendorTag;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/camera2/CameraCharacteristics$Key;

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/CameraCharacteristics;->get(Landroid/hardware/camera2/CameraCharacteristics$Key;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const p1, 0xcafe

    if-eq p2, p1, :cond_1

    const-string p1, "VendorTagHelper"

    const-string p2, "caution: failed to try get value from camera characteristics: <VTNF>"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0

    :cond_1
    new-instance p1, Lcom/android/camera2/vendortag/VendorTagNotFoundException;

    invoke-direct {p1, p0}, Lcom/android/camera2/vendortag/VendorTagNotFoundException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_2
    :goto_0
    const-string p0, "VendorTagHelper"

    const-string p1, "caution: failed to try get value from camera characteristics: <NULL>"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method private static tryGetValue(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/vendortag/VendorTag;I)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureRequest$Builder;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TT;>;>;I)TT;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/android/camera2/vendortag/VendorTag;->getKey()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/android/camera2/vendortag/VendorTag;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const p1, 0xcafe

    if-eq p2, p1, :cond_1

    const-string p1, "VendorTagHelper"

    const-string p2, "caution: failed to try get value from capture request: <VTNF>"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0

    :cond_1
    new-instance p1, Lcom/android/camera2/vendortag/VendorTagNotFoundException;

    invoke-direct {p1, p0}, Lcom/android/camera2/vendortag/VendorTagNotFoundException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_2
    :goto_0
    const-string p0, "VendorTagHelper"

    const-string p1, "caution: failed to try get value from capture request: <NULL>"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method private static tryGetValue(Landroid/hardware/camera2/CaptureResult;Lcom/android/camera2/vendortag/VendorTag;I)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureResult;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CaptureResult$Key<",
            "TT;>;>;I)TT;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/android/camera2/vendortag/VendorTag;->getKey()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/android/camera2/vendortag/VendorTag;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {p0, p1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const p1, 0xcafe

    if-eq p2, p1, :cond_1

    const-string p1, "VendorTagHelper"

    const-string p2, "caution: failed to try get value from capture result: <VTNF>"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0

    :cond_1
    new-instance p1, Lcom/android/camera2/vendortag/VendorTagNotFoundException;

    invoke-direct {p1, p0}, Lcom/android/camera2/vendortag/VendorTagNotFoundException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_2
    :goto_0
    const-string p0, "VendorTagHelper"

    const-string p1, "caution: failed to try get value from capture result: <NULL>"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method private static trySetValue(Landroid/hardware/camera2/CaptureRequest$Builder;Lcom/android/camera2/vendortag/VendorTag;Ljava/lang/Object;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/hardware/camera2/CaptureRequest$Builder;",
            "Lcom/android/camera2/vendortag/VendorTag<",
            "Landroid/hardware/camera2/CaptureRequest$Key<",
            "TT;>;>;TT;I)V"
        }
    .end annotation

    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/android/camera2/vendortag/VendorTag;->getKey()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/android/camera2/vendortag/VendorTag;->getKey()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {p0, p1, p2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const p1, 0xcafe

    if-eq p3, p1, :cond_1

    const-string p1, "VendorTagHelper"

    const-string p2, "caution: failed to update capture request: <VTNF>"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void

    :cond_1
    new-instance p1, Lcom/android/camera2/vendortag/VendorTagNotFoundException;

    invoke-direct {p1, p0}, Lcom/android/camera2/vendortag/VendorTagNotFoundException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    :cond_2
    :goto_1
    const-string p0, "VendorTagHelper"

    const-string p1, "caution: failed to update capture request: <NULL>"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
