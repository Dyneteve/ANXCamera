.class Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;
.super Ljava/lang/Object;
.source "FragmentMimoji.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimoji;->showAlertDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$500(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/MimojiInfo;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$500(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/MimojiInfo;

    move-result-object p1

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mPackPath:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$500(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/MimojiInfo;

    move-result-object p1

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mPackPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/FileUtils;->deleteFile(Ljava/lang/String;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$000(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    move-result-object p1

    const/4 p2, 0x0

    const/4 v0, -0x2

    invoke-virtual {p1, v0, v0, p2}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->processBubbleAni(IILandroid/view/View;)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object p1

    const-string v0, "close_state"

    invoke-virtual {p1, v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setCurrentMimojiState(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$100(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$200(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->updateSelect()V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->filelistToMinojiInfo()V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setmCurrentMimojiInfo(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xd9

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;->onMimojiDeleted()V

    :cond_0
    const-string/jumbo p1, "\u840c\u62cd\u5220\u9664"

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiClick(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$3;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$300(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x4

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiCount(Ljava/lang/String;)V

    :cond_1
    return-void
.end method
