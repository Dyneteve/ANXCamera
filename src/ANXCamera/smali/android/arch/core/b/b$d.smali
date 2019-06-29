.class Landroid/arch/core/b/b$d;
.super Ljava/lang/Object;
.source "SafeIterableMap.java"

# interfaces
.implements Landroid/arch/core/b/b$f;
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/arch/core/b/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/arch/core/b/b$f<",
        "TK;TV;>;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field private aj:Landroid/arch/core/b/b$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/arch/core/b/b$c<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private ak:Z

.field final synthetic al:Landroid/arch/core/b/b;


# direct methods
.method private constructor <init>(Landroid/arch/core/b/b;)V
    .locals 0

    iput-object p1, p0, Landroid/arch/core/b/b$d;->al:Landroid/arch/core/b/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/arch/core/b/b$d;->ak:Z

    return-void
.end method

.method synthetic constructor <init>(Landroid/arch/core/b/b;Landroid/arch/core/b/b$1;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/arch/core/b/b$d;-><init>(Landroid/arch/core/b/b;)V

    return-void
.end method


# virtual methods
.method public c(Landroid/arch/core/b/b$c;)V
    .locals 1
    .param p1    # Landroid/arch/core/b/b$c;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/arch/core/b/b$c<",
            "TK;TV;>;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/arch/core/b/b$d;->aj:Landroid/arch/core/b/b$c;

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Landroid/arch/core/b/b$d;->aj:Landroid/arch/core/b/b$c;

    iget-object p1, p1, Landroid/arch/core/b/b$c;->ai:Landroid/arch/core/b/b$c;

    iput-object p1, p0, Landroid/arch/core/b/b$d;->aj:Landroid/arch/core/b/b$c;

    iget-object p1, p0, Landroid/arch/core/b/b$d;->aj:Landroid/arch/core/b/b$c;

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Landroid/arch/core/b/b$d;->ak:Z

    :cond_1
    return-void
.end method

.method public hasNext()Z
    .locals 3

    iget-boolean v0, p0, Landroid/arch/core/b/b$d;->ak:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/arch/core/b/b$d;->al:Landroid/arch/core/b/b;

    invoke-static {v0}, Landroid/arch/core/b/b;->a(Landroid/arch/core/b/b;)Landroid/arch/core/b/b$c;

    move-result-object v0

    if-eqz v0, :cond_0

    move v1, v2

    nop

    :cond_0
    return v1

    :cond_1
    iget-object v0, p0, Landroid/arch/core/b/b$d;->aj:Landroid/arch/core/b/b$c;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroid/arch/core/b/b$d;->aj:Landroid/arch/core/b/b$c;

    iget-object v0, v0, Landroid/arch/core/b/b$c;->ah:Landroid/arch/core/b/b$c;

    if-eqz v0, :cond_2

    move v1, v2

    nop

    :cond_2
    return v1
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Landroid/arch/core/b/b$d;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    iget-boolean v0, p0, Landroid/arch/core/b/b$d;->ak:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/arch/core/b/b$d;->ak:Z

    iget-object v0, p0, Landroid/arch/core/b/b$d;->al:Landroid/arch/core/b/b;

    invoke-static {v0}, Landroid/arch/core/b/b;->a(Landroid/arch/core/b/b;)Landroid/arch/core/b/b$c;

    move-result-object v0

    iput-object v0, p0, Landroid/arch/core/b/b$d;->aj:Landroid/arch/core/b/b$c;

    goto :goto_1

    :cond_0
    iget-object v0, p0, Landroid/arch/core/b/b$d;->aj:Landroid/arch/core/b/b$c;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/arch/core/b/b$d;->aj:Landroid/arch/core/b/b$c;

    iget-object v0, v0, Landroid/arch/core/b/b$c;->ah:Landroid/arch/core/b/b$c;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Landroid/arch/core/b/b$d;->aj:Landroid/arch/core/b/b$c;

    :goto_1
    iget-object v0, p0, Landroid/arch/core/b/b$d;->aj:Landroid/arch/core/b/b$c;

    return-object v0
.end method
