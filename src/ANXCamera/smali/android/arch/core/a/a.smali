.class public Landroid/arch/core/a/a;
.super Landroid/arch/core/a/c;
.source "ArchTaskExecutor.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field private static volatile W:Landroid/arch/core/a/a;

.field private static final aa:Ljava/util/concurrent/Executor;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private static final sMainThreadExecutor:Ljava/util/concurrent/Executor;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# instance fields
.field private X:Landroid/arch/core/a/c;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private Z:Landroid/arch/core/a/c;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/arch/core/a/a$1;

    invoke-direct {v0}, Landroid/arch/core/a/a$1;-><init>()V

    sput-object v0, Landroid/arch/core/a/a;->sMainThreadExecutor:Ljava/util/concurrent/Executor;

    new-instance v0, Landroid/arch/core/a/a$2;

    invoke-direct {v0}, Landroid/arch/core/a/a$2;-><init>()V

    sput-object v0, Landroid/arch/core/a/a;->aa:Ljava/util/concurrent/Executor;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/arch/core/a/c;-><init>()V

    new-instance v0, Landroid/arch/core/a/b;

    invoke-direct {v0}, Landroid/arch/core/a/b;-><init>()V

    iput-object v0, p0, Landroid/arch/core/a/a;->Z:Landroid/arch/core/a/c;

    iget-object v0, p0, Landroid/arch/core/a/a;->Z:Landroid/arch/core/a/c;

    iput-object v0, p0, Landroid/arch/core/a/a;->X:Landroid/arch/core/a/c;

    return-void
.end method

.method public static getMainThreadExecutor()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Landroid/arch/core/a/a;->sMainThreadExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public static j()Landroid/arch/core/a/a;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Landroid/arch/core/a/a;->W:Landroid/arch/core/a/a;

    if-eqz v0, :cond_0

    sget-object v0, Landroid/arch/core/a/a;->W:Landroid/arch/core/a/a;

    return-object v0

    :cond_0
    const-class v0, Landroid/arch/core/a/a;

    monitor-enter v0

    :try_start_0
    sget-object v1, Landroid/arch/core/a/a;->W:Landroid/arch/core/a/a;

    if-nez v1, :cond_1

    new-instance v1, Landroid/arch/core/a/a;

    invoke-direct {v1}, Landroid/arch/core/a/a;-><init>()V

    sput-object v1, Landroid/arch/core/a/a;->W:Landroid/arch/core/a/a;

    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Landroid/arch/core/a/a;->W:Landroid/arch/core/a/a;

    return-object v0

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static k()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    sget-object v0, Landroid/arch/core/a/a;->aa:Ljava/util/concurrent/Executor;

    return-object v0
.end method


# virtual methods
.method public a(Landroid/arch/core/a/c;)V
    .locals 0
    .param p1    # Landroid/arch/core/a/c;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    if-nez p1, :cond_0

    iget-object p1, p0, Landroid/arch/core/a/a;->Z:Landroid/arch/core/a/c;

    :cond_0
    iput-object p1, p0, Landroid/arch/core/a/a;->X:Landroid/arch/core/a/c;

    return-void
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Landroid/arch/core/a/a;->X:Landroid/arch/core/a/c;

    invoke-virtual {v0, p1}, Landroid/arch/core/a/c;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public b(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Landroid/arch/core/a/a;->X:Landroid/arch/core/a/c;

    invoke-virtual {v0, p1}, Landroid/arch/core/a/c;->b(Ljava/lang/Runnable;)V

    return-void
.end method

.method public isMainThread()Z
    .locals 1

    iget-object v0, p0, Landroid/arch/core/a/a;->X:Landroid/arch/core/a/c;

    invoke-virtual {v0}, Landroid/arch/core/a/c;->isMainThread()Z

    move-result v0

    return v0
.end method
