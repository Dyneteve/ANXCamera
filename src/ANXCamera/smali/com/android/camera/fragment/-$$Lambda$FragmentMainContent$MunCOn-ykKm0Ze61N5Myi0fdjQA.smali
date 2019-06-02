.class public final synthetic Lcom/android/camera/fragment/-$$Lambda$FragmentMainContent$MunCOn-ykKm0Ze61N5Myi0fdjQA;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/android/camera/fragment/FragmentMainContent;

.field private final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/camera/fragment/FragmentMainContent;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/-$$Lambda$FragmentMainContent$MunCOn-ykKm0Ze61N5Myi0fdjQA;->f$0:Lcom/android/camera/fragment/FragmentMainContent;

    iput-boolean p2, p0, Lcom/android/camera/fragment/-$$Lambda$FragmentMainContent$MunCOn-ykKm0Ze61N5Myi0fdjQA;->f$1:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/-$$Lambda$FragmentMainContent$MunCOn-ykKm0Ze61N5Myi0fdjQA;->f$0:Lcom/android/camera/fragment/FragmentMainContent;

    iget-boolean v1, p0, Lcom/android/camera/fragment/-$$Lambda$FragmentMainContent$MunCOn-ykKm0Ze61N5Myi0fdjQA;->f$1:Z

    invoke-static {v0, v1}, Lcom/android/camera/fragment/FragmentMainContent;->lambda$updateMimojiFaceDetectResultTip$0(Lcom/android/camera/fragment/FragmentMainContent;Z)V

    return-void
.end method
