.class public Landroid/support/v4/os/TraceCompat;
.super Ljava/lang/Object;
.source "TraceCompat.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static beginSection(Ljava/lang/String;)V
    .registers 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_9

    invoke-static {p0}, Landroid/support/v4/os/TraceJellybeanMR2;->beginSection(Ljava/lang/String;)V

    :cond_9
    return-void
.end method

.method public static endSection()V
    .registers 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_9

    invoke-static {}, Landroid/support/v4/os/TraceJellybeanMR2;->endSection()V

    :cond_9
    return-void
.end method
