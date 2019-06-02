.class public final Landroid/support/v4/media/routing/MediaRouterJellybeanMr1$IsConnectingWorkaround;
.super Ljava/lang/Object;
.source "MediaRouterJellybeanMr1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/routing/MediaRouterJellybeanMr1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IsConnectingWorkaround"
.end annotation


# instance fields
.field private mGetStatusCodeMethod:Ljava/lang/reflect/Method;

.field private mStatusConnecting:I


# direct methods
.method public constructor <init>()V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-ne v0, v1, :cond_2d

    :try_start_9
    const-class v0, Landroid/media/MediaRouter$RouteInfo;

    const-string v1, "STATUS_CONNECTING"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    iput v1, p0, Landroid/support/v4/media/routing/MediaRouterJellybeanMr1$IsConnectingWorkaround;->mStatusConnecting:I

    const-class v1, Landroid/media/MediaRouter$RouteInfo;

    const-string v2, "getStatusCode"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v4/media/routing/MediaRouterJellybeanMr1$IsConnectingWorkaround;->mGetStatusCodeMethod:Ljava/lang/reflect/Method;
    :try_end_25
    .catch Ljava/lang/NoSuchFieldException; {:try_start_9 .. :try_end_25} :catch_2a
    .catch Ljava/lang/NoSuchMethodException; {:try_start_9 .. :try_end_25} :catch_28
    .catch Ljava/lang/IllegalAccessException; {:try_start_9 .. :try_end_25} :catch_26

    goto :goto_2b

    :catch_26
    move-exception v0

    goto :goto_2c

    :catch_28
    move-exception v0

    goto :goto_2b

    :catch_2a
    move-exception v0

    :goto_2b
    nop

    :goto_2c
    return-void

    :cond_2d
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method


# virtual methods
.method public isConnecting(Ljava/lang/Object;)Z
    .registers 6

    move-object v0, p1

    check-cast v0, Landroid/media/MediaRouter$RouteInfo;

    iget-object v1, p0, Landroid/support/v4/media/routing/MediaRouterJellybeanMr1$IsConnectingWorkaround;->mGetStatusCodeMethod:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    if-eqz v1, :cond_21

    :try_start_8
    iget-object v1, p0, Landroid/support/v4/media/routing/MediaRouterJellybeanMr1$IsConnectingWorkaround;->mGetStatusCodeMethod:Ljava/lang/reflect/Method;

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget v3, p0, Landroid/support/v4/media/routing/MediaRouterJellybeanMr1$IsConnectingWorkaround;->mStatusConnecting:I
    :try_end_18
    .catch Ljava/lang/IllegalAccessException; {:try_start_8 .. :try_end_18} :catch_1f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_8 .. :try_end_18} :catch_1d

    if-ne v1, v3, :cond_1c

    const/4 v2, 0x1

    nop

    :cond_1c
    return v2

    :catch_1d
    move-exception v1

    goto :goto_21

    :catch_1f
    move-exception v1

    nop

    :cond_21
    :goto_21
    return v2
.end method
