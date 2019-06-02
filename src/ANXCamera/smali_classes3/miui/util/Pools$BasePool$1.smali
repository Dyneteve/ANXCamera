.class Lmiui/util/Pools$BasePool$1;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/util/Pools$BasePool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic JQ:Lmiui/util/Pools$BasePool;


# direct methods
.method constructor <init>(Lmiui/util/Pools$BasePool;)V
    .registers 2

    iput-object p1, p0, Lmiui/util/Pools$BasePool$1;->JQ:Lmiui/util/Pools$BasePool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lmiui/util/Pools$BasePool$1;->JQ:Lmiui/util/Pools$BasePool;

    invoke-virtual {v0}, Lmiui/util/Pools$BasePool;->close()V
    :try_end_5
    .catchall {:try_start_0 .. :try_end_5} :catchall_a

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    nop

    return-void

    :catchall_a
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    throw v0
.end method
