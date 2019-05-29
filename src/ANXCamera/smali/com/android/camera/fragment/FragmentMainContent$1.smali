.class Lcom/android/camera/fragment/FragmentMainContent$1;
.super Ljava/lang/Object;
.source "FragmentMainContent.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentMainContent;->consumeResult(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentMainContent;

.field final synthetic val$detectResult:I

.field final synthetic val$isMimoji:Z


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentMainContent;ZI)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentMainContent$1;->this$0:Lcom/android/camera/fragment/FragmentMainContent;

    iput-boolean p2, p0, Lcom/android/camera/fragment/FragmentMainContent$1;->val$isMimoji:Z

    iput p3, p0, Lcom/android/camera/fragment/FragmentMainContent$1;->val$detectResult:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-boolean v0, p0, Lcom/android/camera/fragment/FragmentMainContent$1;->val$isMimoji:Z

    const/16 v1, 0xac

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/camera/fragment/FragmentMainContent$1;->val$detectResult:I

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/MimojiHelper;->getTipsResIdFace(I)I

    move-result v0

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz v1, :cond_0

    if-lez v0, :cond_0

    const/4 v2, 0x1

    invoke-interface {v1, v2, v0}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertMimojiFaceDetect(ZI)V

    :cond_0
    return-void

    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent$1;->this$0:Lcom/android/camera/fragment/FragmentMainContent;

    invoke-static {v1}, Lcom/android/camera/fragment/FragmentMainContent;->access$000(Lcom/android/camera/fragment/FragmentMainContent;)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertLightingHint(I)V

    :cond_2
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xc6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$VerticalProtocol;

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentMainContent$1;->this$0:Lcom/android/camera/fragment/FragmentMainContent;

    invoke-static {v1}, Lcom/android/camera/fragment/FragmentMainContent;->access$000(Lcom/android/camera/fragment/FragmentMainContent;)I

    move-result v1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$VerticalProtocol;->alertLightingHint(I)V

    :cond_3
    return-void
.end method
