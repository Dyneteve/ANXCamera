.class Landroid/support/v4/media/MediaController2ImplLegacy$ConnectionCallback;
.super Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback;
.source "MediaController2ImplLegacy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaController2ImplLegacy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectionCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaController2ImplLegacy;


# direct methods
.method private constructor <init>(Landroid/support/v4/media/MediaController2ImplLegacy;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ConnectionCallback;->this$0:Landroid/support/v4/media/MediaController2ImplLegacy;

    invoke-direct {p0}, Landroid/support/v4/media/MediaBrowserCompat$ConnectionCallback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v4/media/MediaController2ImplLegacy;Landroid/support/v4/media/MediaController2ImplLegacy$1;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v4/media/MediaController2ImplLegacy$ConnectionCallback;-><init>(Landroid/support/v4/media/MediaController2ImplLegacy;)V

    return-void
.end method


# virtual methods
.method public onConnected()V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ConnectionCallback;->this$0:Landroid/support/v4/media/MediaController2ImplLegacy;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaController2ImplLegacy;->getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ConnectionCallback;->this$0:Landroid/support/v4/media/MediaController2ImplLegacy;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaBrowserCompat;->getSessionToken()Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/support/v4/media/MediaController2ImplLegacy;->access$900(Landroid/support/v4/media/MediaController2ImplLegacy;Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/support/v4/media/MediaController2ImplLegacy;->access$1000()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "MC2ImplLegacy"

    const-string v1, "Controller is closed prematually"

    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v0, v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public onConnectionFailed()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ConnectionCallback;->this$0:Landroid/support/v4/media/MediaController2ImplLegacy;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaController2ImplLegacy;->close()V

    return-void
.end method

.method public onConnectionSuspended()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ConnectionCallback;->this$0:Landroid/support/v4/media/MediaController2ImplLegacy;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaController2ImplLegacy;->close()V

    return-void
.end method
