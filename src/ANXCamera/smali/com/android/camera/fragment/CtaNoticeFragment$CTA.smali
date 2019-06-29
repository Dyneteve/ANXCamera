.class public Lcom/android/camera/fragment/CtaNoticeFragment$CTA;
.super Ljava/lang/Object;
.source "CtaNoticeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/CtaNoticeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CTA"
.end annotation


# static fields
.field private static sCanConnectToNetworkTemp:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->sCanConnectToNetworkTemp:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static canConnectNetwork()Z
    .locals 1

    sget-boolean v0, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->sCanConnectToNetworkTemp:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCTACanCollect()Z

    move-result v0

    return v0
.end method

.method public static setCanConnectNetwork(ZZ)V
    .locals 0

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object p0

    check-cast p0, Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-virtual {p0, p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCTACanCollect(Z)V

    goto :goto_0

    :cond_0
    sput-boolean p1, Lcom/android/camera/fragment/CtaNoticeFragment$CTA;->sCanConnectToNetworkTemp:Z

    :goto_0
    return-void
.end method
