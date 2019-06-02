.class public abstract Landroid/support/v4/hardware/display/DisplayManagerCompat;
.super Ljava/lang/Object;
.source "DisplayManagerCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/hardware/display/DisplayManagerCompat$JellybeanMr1Impl;,
        Landroid/support/v4/hardware/display/DisplayManagerCompat$LegacyImpl;
    }
.end annotation


# static fields
.field public static final DISPLAY_CATEGORY_PRESENTATION:Ljava/lang/String; = "android.hardware.display.category.PRESENTATION"

.field private static final sInstances:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "Landroid/support/v4/hardware/display/DisplayManagerCompat;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Landroid/support/v4/hardware/display/DisplayManagerCompat;->sInstances:Ljava/util/WeakHashMap;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Landroid/support/v4/hardware/display/DisplayManagerCompat;
    .registers 5

    sget-object v0, Landroid/support/v4/hardware/display/DisplayManagerCompat;->sInstances:Ljava/util/WeakHashMap;

    monitor-enter v0

    :try_start_3
    sget-object v1, Landroid/support/v4/hardware/display/DisplayManagerCompat;->sInstances:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/hardware/display/DisplayManagerCompat;

    if-nez v1, :cond_25

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v2, v3, :cond_1a

    new-instance v3, Landroid/support/v4/hardware/display/DisplayManagerCompat$JellybeanMr1Impl;

    invoke-direct {v3, p0}, Landroid/support/v4/hardware/display/DisplayManagerCompat$JellybeanMr1Impl;-><init>(Landroid/content/Context;)V

    move-object v1, v3

    goto :goto_20

    :cond_1a
    new-instance v3, Landroid/support/v4/hardware/display/DisplayManagerCompat$LegacyImpl;

    invoke-direct {v3, p0}, Landroid/support/v4/hardware/display/DisplayManagerCompat$LegacyImpl;-><init>(Landroid/content/Context;)V

    move-object v1, v3

    :goto_20
    sget-object v3, Landroid/support/v4/hardware/display/DisplayManagerCompat;->sInstances:Ljava/util/WeakHashMap;

    invoke-virtual {v3, p0, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_25
    monitor-exit v0

    return-object v1

    :catchall_27
    move-exception v1

    monitor-exit v0
    :try_end_29
    .catchall {:try_start_3 .. :try_end_29} :catchall_27

    throw v1
.end method


# virtual methods
.method public abstract getDisplay(I)Landroid/view/Display;
.end method

.method public abstract getDisplays()[Landroid/view/Display;
.end method

.method public abstract getDisplays(Ljava/lang/String;)[Landroid/view/Display;
.end method
