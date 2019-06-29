.class public Lcom/xiaomi/camera/core/FilterProcessor$YuvAttributeWrapper;
.super Ljava/lang/Object;
.source "FilterProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/core/FilterProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "YuvAttributeWrapper"
.end annotation


# instance fields
.field public mAttribute:Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

.field public mBlocker:Landroid/os/ConditionVariable;


# direct methods
.method public constructor <init>(Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;Landroid/os/ConditionVariable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/camera/core/FilterProcessor$YuvAttributeWrapper;->mAttribute:Lcom/android/camera/effect/draw_mode/DrawYuvAttribute;

    iput-object p2, p0, Lcom/xiaomi/camera/core/FilterProcessor$YuvAttributeWrapper;->mBlocker:Landroid/os/ConditionVariable;

    return-void
.end method
