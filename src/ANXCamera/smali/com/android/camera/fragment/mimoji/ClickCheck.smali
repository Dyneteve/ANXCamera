.class public Lcom/android/camera/fragment/mimoji/ClickCheck;
.super Ljava/lang/Object;
.source "ClickCheck.java"


# static fields
.field private static final CLICK_TIME:J = 0x64L


# instance fields
.field private mLastClickTime:J


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/fragment/mimoji/ClickCheck;->mLastClickTime:J

    return-void
.end method


# virtual methods
.method public checkClickable()Z
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/fragment/mimoji/ClickCheck;->mLastClickTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x64

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iput-wide v0, p0, Lcom/android/camera/fragment/mimoji/ClickCheck;->mLastClickTime:J

    const/4 v0, 0x1

    return v0
.end method
