.class Landroid/support/v4/content/ModernAsyncTask$3;
.super Ljava/util/concurrent/FutureTask;
.source "ModernAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/content/ModernAsyncTask;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/FutureTask<",
        "TResult;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/content/ModernAsyncTask;


# direct methods
.method constructor <init>(Landroid/support/v4/content/ModernAsyncTask;Ljava/util/concurrent/Callable;)V
    .registers 3

    iput-object p1, p0, Landroid/support/v4/content/ModernAsyncTask$3;->this$0:Landroid/support/v4/content/ModernAsyncTask;

    invoke-direct {p0, p2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    return-void
.end method


# virtual methods
.method protected done()V
    .registers 5

    :try_start_0
    invoke-virtual {p0}, Landroid/support/v4/content/ModernAsyncTask$3;->get()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/content/ModernAsyncTask$3;->this$0:Landroid/support/v4/content/ModernAsyncTask;

    # invokes: Landroid/support/v4/content/ModernAsyncTask;->postResultIfNotInvoked(Ljava/lang/Object;)V
    invoke-static {v1, v0}, Landroid/support/v4/content/ModernAsyncTask;->access$300(Landroid/support/v4/content/ModernAsyncTask;Ljava/lang/Object;)V
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_9} :catch_28
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_9} :catch_1b
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_9} :catch_13
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_9} :catch_a

    goto :goto_2e

    :catch_a
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "An error occurred while executing doInBackground()"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_13
    move-exception v0

    iget-object v1, p0, Landroid/support/v4/content/ModernAsyncTask$3;->this$0:Landroid/support/v4/content/ModernAsyncTask;

    const/4 v2, 0x0

    # invokes: Landroid/support/v4/content/ModernAsyncTask;->postResultIfNotInvoked(Ljava/lang/Object;)V
    invoke-static {v1, v2}, Landroid/support/v4/content/ModernAsyncTask;->access$300(Landroid/support/v4/content/ModernAsyncTask;Ljava/lang/Object;)V

    goto :goto_2e

    :catch_1b
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    const-string v3, "An error occurred while executing doInBackground()"

    invoke-direct {v1, v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_28
    move-exception v0

    const-string v1, "AsyncTask"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2e
    nop

    return-void
.end method
