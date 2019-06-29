.class Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$10;
.super Ljava/lang/Object;
.source "FragmentMimojiEdit.java"

# interfaces
.implements Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$OnSelectListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->initConfigList()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$10;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSelectListener(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;I)V
    .locals 3

    sget-object v0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSelectListener position  : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$10;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p2}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$200(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/fragment/mimoji/MimojiPageChangeAnimManager;->updateLayoutPosition()V

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$10;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p2}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$1000(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    move-result-object p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$10;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p2}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$1000(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    move-result-object p2

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->setIsColorNeedNotify(Z)V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 v0, 0xe0

    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz p2, :cond_1

    if-eqz p1, :cond_1

    iget p1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;->configType:I

    invoke-interface {p2, p1}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->onTypeConfigSelect(I)V

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit$10;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->access$1700(Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;)Landroid/support/v7/widget/RecyclerView;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    return-void
.end method
