.class Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;
.super Ljava/lang/Object;
.source "MediaController2ImplBase.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaController2ImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SessionServiceConnection"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaController2ImplBase;


# direct methods
.method private constructor <init>(Landroid/support/v4/media/MediaController2ImplBase;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;->this$0:Landroid/support/v4/media/MediaController2ImplBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v4/media/MediaController2ImplBase;Landroid/support/v4/media/MediaController2ImplBase$1;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;-><init>(Landroid/support/v4/media/MediaController2ImplBase;)V

    return-void
.end method


# virtual methods
.method public onBindingDied(Landroid/content/ComponentName;)V
    .locals 0

    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;->this$0:Landroid/support/v4/media/MediaController2ImplBase;

    invoke-virtual {p1}, Landroid/support/v4/media/MediaController2ImplBase;->close()V

    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3

    sget-boolean v0, Landroid/support/v4/media/MediaController2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MC2ImplBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onServiceConnected "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;->this$0:Landroid/support/v4/media/MediaController2ImplBase;

    invoke-static {v0}, Landroid/support/v4/media/MediaController2ImplBase;->access$300(Landroid/support/v4/media/MediaController2ImplBase;)Landroid/support/v4/media/SessionToken2;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/media/SessionToken2;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string p2, "MC2ImplBase"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " was connected, but expected pkg="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;->this$0:Landroid/support/v4/media/MediaController2ImplBase;

    invoke-static {p1}, Landroid/support/v4/media/MediaController2ImplBase;->access$300(Landroid/support/v4/media/MediaController2ImplBase;)Landroid/support/v4/media/SessionToken2;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/SessionToken2;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " with id="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;->this$0:Landroid/support/v4/media/MediaController2ImplBase;

    invoke-static {p1}, Landroid/support/v4/media/MediaController2ImplBase;->access$300(Landroid/support/v4/media/MediaController2ImplBase;)Landroid/support/v4/media/SessionToken2;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/SessionToken2;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;->this$0:Landroid/support/v4/media/MediaController2ImplBase;

    invoke-static {p2}, Landroid/support/v4/media/IMediaSession2$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/IMediaSession2;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/support/v4/media/MediaController2ImplBase;->access$400(Landroid/support/v4/media/MediaController2ImplBase;Landroid/support/v4/media/IMediaSession2;)V

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 3

    sget-boolean v0, Landroid/support/v4/media/MediaController2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MC2ImplBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Session service "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " is disconnected."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method
