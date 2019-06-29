.class Landroid/support/v4/media/MediaSessionLegacyStub$6;
.super Ljava/lang/Object;
.source "MediaSessionLegacyStub.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaSessionLegacyStub;->onCommand2Internal(Landroid/os/IBinder;Landroid/support/v4/media/SessionCommand2;ILandroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

.field final synthetic val$commandCode:I

.field final synthetic val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

.field final synthetic val$runnable:Landroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;

.field final synthetic val$sessionCommand:Landroid/support/v4/media/SessionCommand2;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaSessionLegacyStub;Landroid/support/v4/media/SessionCommand2;Landroid/support/v4/media/MediaSession2$ControllerInfo;ILandroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iput-object p2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$sessionCommand:Landroid/support/v4/media/SessionCommand2;

    iput-object p3, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    iput p4, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$commandCode:I

    iput-object p5, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$runnable:Landroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$sessionCommand:Landroid/support/v4/media/SessionCommand2;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    iget-object v2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$sessionCommand:Landroid/support/v4/media/SessionCommand2;

    invoke-static {v0, v1, v2}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$000(Landroid/support/v4/media/MediaSessionLegacyStub;Landroid/support/v4/media/MediaSession2$ControllerInfo;Landroid/support/v4/media/SessionCommand2;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$100()Landroid/util/SparseArray;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$sessionCommand:Landroid/support/v4/media/SessionCommand2;

    invoke-virtual {v1}, Landroid/support/v4/media/SessionCommand2;->getCommandCode()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/SessionCommand2;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    iget v2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$commandCode:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$200(Landroid/support/v4/media/MediaSessionLegacyStub;Landroid/support/v4/media/MediaSession2$ControllerInfo;I)Z

    move-result v0

    if-nez v0, :cond_2

    return-void

    :cond_2
    invoke-static {}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$100()Landroid/util/SparseArray;

    move-result-object v0

    iget v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$commandCode:I

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/SessionCommand2;

    :goto_0
    if-eqz v0, :cond_4

    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v1, v1, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v1}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroid/support/v4/media/MediaSession2$SessionCallback;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v2, v2, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v2}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroid/support/v4/media/MediaSession2;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v1, v2, v3, v0}, Landroid/support/v4/media/MediaSession2$SessionCallback;->onCommandRequest(Landroid/support/v4/media/MediaSession2;Landroid/support/v4/media/MediaSession2$ControllerInfo;Landroid/support/v4/media/SessionCommand2;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-static {}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$300()Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "MediaSessionLegacyStub"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Command ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, ") from "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " was rejected by "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    return-void

    :cond_4
    :try_start_0
    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$runnable:Landroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;

    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-interface {v0, v1}, Landroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;->run(Landroid/support/v4/media/MediaSession2$ControllerInfo;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "MediaSessionLegacyStub"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Exception in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Landroid/support/v4/media/MediaSessionLegacyStub$6;->val$controller:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v3}, Landroid/support/v4/media/MediaSession2$ControllerInfo;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method
