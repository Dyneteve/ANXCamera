.class Landroid/support/v4/media/MediaSession2ImplBase$2;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroid/support/v4/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaSession2ImplBase;->close()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaSession2ImplBase;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaSession2ImplBase;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2ImplBase$2;->this$0:Landroid/support/v4/media/MediaSession2ImplBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroid/support/v4/media/MediaSession2$ControllerCb;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p1}, Landroid/support/v4/media/MediaSession2$ControllerCb;->onDisconnected()V

    return-void
.end method
