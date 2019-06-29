.class Lmiui/external/SdkEntranceHelper;
.super Ljava/lang/Object;
.source "SdkConstants.java"

# interfaces
.implements Lmiui/external/SdkConstants;


# static fields
.field private static final SDK_ENTRANCE_CLASS:Ljava/lang/String; = "miui.core.SdkManager"

.field private static final SDK_ENTRANCE_FALLBACK_CLASS:Ljava/lang/String; = "com.miui.internal.core.SdkManager"


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSdkEntrance()Ljava/lang/Class;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    nop

    :try_start_0
    const-string v0, "miui.core.SdkManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_1
    const-string v0, "com.miui.internal.core.SdkManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    nop

    const-string v1, "miuisdk"

    const-string/jumbo v2, "using legacy sdk"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-object v0

    :catch_1
    move-exception v0

    const-string v1, "miuisdk"

    const-string v2, "no sdk found"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    throw v0
.end method
