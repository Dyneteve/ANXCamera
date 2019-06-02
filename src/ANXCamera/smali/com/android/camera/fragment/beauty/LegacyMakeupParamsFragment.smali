.class public Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;
.super Lcom/android/camera/fragment/beauty/MakeupParamsFragment;
.source "LegacyMakeupParamsFragment.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    new-instance v0, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment$1;-><init>(Lcom/android/camera/fragment/beauty/LegacyMakeupParamsFragment;)V

    return-object v0
.end method
