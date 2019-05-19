.class Lcom/android/camera/CameraBrightness$CameraBrightnessTask;
.super Landroid/os/AsyncTask;
.source "CameraBrightness.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/CameraBrightness;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CameraBrightnessTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private final ADJUST_RATIO_BASE:F

.field private final ADJUST_RATIO_RANGE:F

.field private final DEBUG:Z

.field private mActivityWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private mCallbackWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/camera/CameraBrightnessCallback;",
            ">;"
        }
    .end annotation
.end field

.field private mPaused:Z

.field private mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

.field private mScreenManualBrightnessSpline:Landroid/util/Spline;

.field private mUseDefaultValue:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/android/camera/CameraBrightnessCallback;ZZ)V
    .locals 1

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->DEBUG:Z

    const v0, 0x3e99999a    # 0.3f

    iput v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->ADJUST_RATIO_RANGE:F

    const v0, 0x3dcccccd    # 0.1f

    iput v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->ADJUST_RATIO_BASE:F

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mCallbackWeakReference:Ljava/lang/ref/WeakReference;

    iput-boolean p4, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPaused:Z

    iput-boolean p3, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    return-void
.end method

.method private createManualBrightnessSpline([I[I)Landroid/util/Spline;
    .locals 5

    :try_start_0
    array-length v0, p1

    new-array v1, v0, [F

    new-array v2, v0, [F

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_0

    aget v4, p1, v3

    int-to-float v4, v4

    aput v4, v1, v3

    aget v4, p2, v3

    int-to-float v4, v4

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;

    invoke-direct {p1, v1, v2}, Lcom/android/camera/CameraBrightness$MonotoneCubicSpline;-><init>([F[F)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string p2, "CameraBrightness"

    const-string v0, "Could not create manual-brightness spline."

    invoke-static {p2, v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    return-object p1
.end method

.method private createSpline()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mScreenManualBrightnessSpline:Landroid/util/Spline;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

    if-nez v0, :cond_2

    :cond_0
    const-string v0, "config_manual_spline_available"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getAndroidBoolRes(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "config_manualBrightnessRemapIn"

    invoke-direct {p0, v0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getAndroidArrayRes(Ljava/lang/String;)[I

    move-result-object v0

    const-string v1, "config_manualBrightnessRemapOut"

    invoke-direct {p0, v1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getAndroidArrayRes(Ljava/lang/String;)[I

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->createManualBrightnessSpline([I[I)Landroid/util/Spline;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mScreenManualBrightnessSpline:Landroid/util/Spline;

    invoke-direct {p0, v0, v1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->createManualBrightnessSpline([I[I)Landroid/util/Spline;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mScreenManualBrightnessSpline:Landroid/util/Spline;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

    if-nez v0, :cond_2

    :cond_1
    const-string v0, "CameraBrightness"

    const-string v1, "Error to create manual brightness spline"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-void
.end method

.method private execCommand(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-string v2, ""

    nop

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Process;->waitFor()I

    move-result v3

    if-eqz v3, :cond_0

    const-string v0, "CameraBrightness"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "exit value = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Process;->exitValue()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    :cond_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v4, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    new-instance p1, Ljava/lang/StringBuffer;

    invoke-direct {p1}, Ljava/lang/StringBuffer;-><init>()V

    nop

    :goto_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    :cond_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    const-string v2, "CameraBrightness"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "execCommand lcd value="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " cost="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    nop

    move-object v2, p1

    goto :goto_3

    :catch_0
    move-exception v0

    move-object v2, p1

    move-object p1, v0

    goto :goto_1

    :catch_1
    move-exception v0

    move-object v2, p1

    move-object p1, v0

    goto :goto_2

    :catch_2
    move-exception p1

    :goto_1
    const-string v0, "CameraBrightness"

    const-string v1, "execCommand IOException"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    :catch_3
    move-exception p1

    :goto_2
    const-string v0, "CameraBrightness"

    const-string v1, "execCommand InterruptedException"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    nop

    :goto_3
    return-object v2
.end method

.method private getAndroidArrayRes(Ljava/lang/String;)[I
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    const-class v1, Lcom/android/internal/R$array;

    const-string v2, "I"

    invoke-static {v1, p1, v2}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v0}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v1
    :try_end_0
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    const-string v2, "CameraBrightness"

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    move-exception v1

    const-string v2, "CameraBrightness"

    invoke-virtual {v1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    nop

    :goto_0
    :try_start_1
    const-class v1, Landroid/miui/R$array;

    const-string v2, "I"

    invoke-static {v1, p1, v2}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1, v0}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object p1
    :try_end_1
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    return-object p1

    :catch_2
    move-exception p1

    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :catch_3
    move-exception p1

    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    nop

    :goto_1
    const/4 p1, 0x2

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    return-object p1

    :array_0
    .array-data 4
        0x0
        0xff
    .end array-data
.end method

.method private getAndroidBoolRes(Ljava/lang/String;Z)Z
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    const-class v1, Lcom/android/internal/R$bool;

    const-string v2, "I"

    invoke-static {v1, p1, v2}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v0}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1
    :try_end_0
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception v1

    const-string v2, "CameraBrightness"

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    move-exception v1

    const-string v2, "CameraBrightness"

    invoke-virtual {v1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    nop

    :goto_0
    :try_start_1
    const-class v1, Landroid/miui/R$bool;

    const-string v2, "I"

    invoke-static {v1, p1, v2}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1, v0}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1
    :try_end_1
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    return p1

    :catch_2
    move-exception p1

    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :catch_3
    move-exception p1

    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    nop

    :goto_1
    return p2
.end method

.method private getAndroidIntResource(Ljava/lang/String;)I
    .locals 2

    :try_start_0
    const-class v0, Lcom/android/internal/R$integer;

    const-string v1, "I"

    invoke-static {v0, p1, v1}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1
    :try_end_0
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    move-exception p1

    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    nop

    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private getBrightIsAndroidP(Landroid/view/WindowManager$LayoutParams;Landroid/app/Activity;)Ljava/lang/Integer;
    .locals 5
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    const-class v1, Landroid/os/PowerManager;

    const-string v2, "BRIGHTNESS_ON"

    invoke-static {v1, v2}, Lmiui/util/ReflectionUtils;->findField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const-class v2, Landroid/os/PowerManager;

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    const-string v2, "screen_brightness"

    invoke-static {p2, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result p2

    const-string v2, "CameraBrightness"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "android P -> current back light -> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    nop

    mul-int/lit16 p2, p2, 0x100

    int-to-float p2, p2

    add-int/lit8 v1, v1, 0x1

    int-to-float v1, v1

    div-float/2addr p2, v1

    float-to-double v1, p2

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int p2, v1

    invoke-direct {p0, p2}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->toEnLargeBrightness(I)I

    move-result p2

    int-to-float p2, p2

    iget v1, p1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    const/high16 v1, 0x437f0000    # 255.0f

    mul-float/2addr p1, v1

    float-to-int p1, p1

    int-to-float p1, p1

    cmpl-float p1, p2, p1

    if-nez p1, :cond_0

    const-string p1, "CameraBrightness"

    const-string p2, "android P -> doInBackground brightness unchanged"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_0
    float-to-int p1, p2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :catch_0
    move-exception p1

    const-string p2, "CameraBrightness"

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method private getBrightNotAndroidP(Landroid/view/WindowManager$LayoutParams;)Ljava/lang/Integer;
    .locals 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    invoke-direct {p0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getCurrentBackLight()I

    move-result v0

    const-string v1, "CameraBrightness"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "current back light -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    if-gtz v0, :cond_0

    return-object v1

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->createSpline()V

    iget v2, p1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    const/high16 v2, 0x437f0000    # 255.0f

    mul-float/2addr p1, v2

    iget-object v2, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPositiveScreenManualBrightnessSpline:Landroid/util/Spline;

    invoke-virtual {v2, p1}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    goto :goto_0

    :cond_1
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    :goto_0
    sub-int/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    const/4 v2, 0x1

    if-gt p1, v2, :cond_2

    const-string p1, "CameraBrightness"

    const-string v0, "doInBackground brightness unchanged"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_2
    nop

    iget-object p1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mScreenManualBrightnessSpline:Landroid/util/Spline;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mScreenManualBrightnessSpline:Landroid/util/Spline;

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/util/Spline;->interpolate(F)F

    move-result p1

    float-to-int v0, p1

    :cond_3
    invoke-direct {p0, v0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->toEnLargeBrightness(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method private getCurrentBackLight()I
    .locals 4

    nop

    nop

    const/4 v0, 0x0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    const-string v2, "0"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    if-nez v0, :cond_4

    :cond_1
    const/4 v2, 0x3

    if-ge v1, v2, :cond_4

    invoke-virtual {p0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_2

    :cond_2
    const-string v0, "cat sys/class/backlight/panel0-backlight/brightness"

    invoke-direct {p0, v0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->execCommand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "0"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    if-nez v0, :cond_0

    :cond_3
    const-wide/16 v2, 0x12c

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    const-string v3, "CameraBrightness"

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    :goto_2
    const-string v1, "CameraBrightness"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCurrentBackLight currentSetting="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, -0x1

    if-nez v1, :cond_8

    const-string v1, "config_backlightBits"

    invoke-direct {p0, v1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getAndroidIntResource(Ljava/lang/String;)I

    move-result v1

    if-gtz v1, :cond_5

    const-string v1, "config_backlightBit"

    invoke-direct {p0, v1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getMiuiIntResource(Ljava/lang/String;)I

    move-result v1

    :cond_5
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    float-to-int v0, v0

    const/16 v3, 0x8

    if-le v1, v3, :cond_7

    sub-int/2addr v1, v3

    const/4 v2, 0x1

    shl-int v3, v2, v1

    if-ge v0, v3, :cond_6

    goto :goto_3

    :cond_6
    shr-int v2, v0, v1

    :goto_3
    const-string v0, "CameraBrightness"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCurrentBackLight convert to "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    nop

    return v2

    :cond_7
    return v2

    :cond_8
    return v2
.end method

.method private getMiuiIntResource(Ljava/lang/String;)I
    .locals 2

    :try_start_0
    const-class v0, Landroid/miui/R$integer;

    const-string v1, "I"

    invoke-static {v0, p1, v1}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lmiui/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1
    :try_end_0
    .catch Lmiui/reflect/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    move-exception p1

    const-string v0, "CameraBrightness"

    invoke-virtual {p1}, Lmiui/reflect/NoSuchFieldException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    nop

    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private toEnLargeBrightness(I)I
    .locals 7

    nop

    const/4 v0, 0x0

    const/16 v1, 0xb9

    invoke-static {p1, v0, v1}, Lcom/android/camera/Util;->clamp(III)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x43390000    # 185.0f

    div-float/2addr v1, v2

    const v2, 0x3e99999a    # 0.3f

    mul-float/2addr v1, v2

    const v2, 0x3dcccccd    # 0.1f

    add-float/2addr v2, v1

    int-to-double v3, p1

    float-to-double v1, v2

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    add-double/2addr v5, v1

    mul-double/2addr v3, v5

    double-to-int p1, v3

    const/16 v1, 0xff

    invoke-static {p1, v0, v1}, Lcom/android/camera/Util;->clamp(III)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method private updateBrightness(I)V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_3

    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPaused:Z

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    if-nez v2, :cond_1

    iget-boolean v2, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPaused:Z

    if-nez v2, :cond_1

    int-to-float v2, p1

    const/high16 v3, 0x437f0000    # 255.0f

    div-float/2addr v2, v3

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    goto :goto_0

    :cond_1
    const/high16 v2, -0x40800000    # -1.0f

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    :goto_0
    const-string v2, "CameraBrightness"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "updateBrightness setting="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " useDefaultValue="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v4, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, " screenBrightness="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    iget-object v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mCallbackWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/CameraBrightnessCallback;

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lcom/android/camera/CameraBrightnessCallback;->setBrightness(I)V

    :cond_2
    return-void

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 3

    const-string p1, "CameraBrightness"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "doInBackground useDefaultValue="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " paused="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPaused:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mActivityWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Activity;

    if-eqz p1, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mUseDefaultValue:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->mPaused:Z

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_0

    invoke-direct {p0, v0, p1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getBrightIsAndroidP(Landroid/view/WindowManager$LayoutParams;Landroid/app/Activity;)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-direct {p0, v0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->getBrightNotAndroidP(Landroid/view/WindowManager$LayoutParams;)Ljava/lang/Integer;

    move-result-object p1

    :goto_0
    return-object p1

    :cond_1
    const/4 p1, -0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->updateBrightness(I)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/CameraBrightness$CameraBrightnessTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method
