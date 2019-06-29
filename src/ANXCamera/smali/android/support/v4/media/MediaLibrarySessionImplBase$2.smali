.class Landroid/support/v4/media/MediaLibrarySessionImplBase$2;
.super Ljava/lang/Object;
.source "MediaLibrarySessionImplBase.java"

# interfaces
.implements Landroid/support/v4/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaLibrarySessionImplBase;->notifyChildrenChanged(Landroid/support/v4/media/MediaSession2$ControllerInfo;Ljava/lang/String;ILandroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaLibrarySessionImplBase;

.field final synthetic val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

.field final synthetic val$extras:Landroid/os/Bundle;

.field final synthetic val$itemCount:I

.field final synthetic val$parentId:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaLibrarySessionImplBase;Landroid/support/v4/media/MediaSession2$ControllerInfo;Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->this$0:Landroid/support/v4/media/MediaLibrarySessionImplBase;

    iput-object p2, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    iput-object p3, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->val$parentId:Ljava/lang/String;

    iput p4, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->val$itemCount:I

    iput-object p5, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->val$extras:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroid/support/v4/media/MediaSession2$ControllerCb;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->this$0:Landroid/support/v4/media/MediaLibrarySessionImplBase;

    iget-object v1, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    iget-object v2, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->val$parentId:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Landroid/support/v4/media/MediaLibrarySessionImplBase;->access$000(Landroid/support/v4/media/MediaLibrarySessionImplBase;Landroid/support/v4/media/MediaSession2$ControllerInfo;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean p1, Landroid/support/v4/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz p1, :cond_0

    const-string p1, "MS2ImplBase"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Skipping notifyChildrenChanged() to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " because it hasn\'t subscribed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->this$0:Landroid/support/v4/media/MediaLibrarySessionImplBase;

    invoke-static {p1}, Landroid/support/v4/media/MediaLibrarySessionImplBase;->access$100(Landroid/support/v4/media/MediaLibrarySessionImplBase;)V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->val$parentId:Ljava/lang/String;

    iget v1, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->val$itemCount:I

    iget-object v2, p0, Landroid/support/v4/media/MediaLibrarySessionImplBase$2;->val$extras:Landroid/os/Bundle;

    invoke-virtual {p1, v0, v1, v2}, Landroid/support/v4/media/MediaSession2$ControllerCb;->onChildrenChanged(Ljava/lang/String;ILandroid/os/Bundle;)V

    return-void
.end method
