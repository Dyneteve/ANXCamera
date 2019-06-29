.class public Lcom/facebook/rebound/BaseSpringSystem;
.super Ljava/lang/Object;
.source "BaseSpringSystem.java"


# instance fields
.field private final mActiveSprings:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/facebook/rebound/Spring;",
            ">;"
        }
    .end annotation
.end field

.field private mIdle:Z

.field private final mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Lcom/facebook/rebound/SpringSystemListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mSpringLooper:Lcom/facebook/rebound/SpringLooper;

.field private final mSpringRegistry:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/rebound/Spring;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/facebook/rebound/SpringLooper;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mSpringRegistry:Ljava/util/Map;

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mActiveSprings:Ljava/util/Set;

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mIdle:Z

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/facebook/rebound/BaseSpringSystem;->mSpringLooper:Lcom/facebook/rebound/SpringLooper;

    iget-object p1, p0, Lcom/facebook/rebound/BaseSpringSystem;->mSpringLooper:Lcom/facebook/rebound/SpringLooper;

    invoke-virtual {p1, p0}, Lcom/facebook/rebound/SpringLooper;->setSpringSystem(Lcom/facebook/rebound/BaseSpringSystem;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "springLooper is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method activateSpring(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mSpringRegistry:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/rebound/Spring;

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/facebook/rebound/BaseSpringSystem;->mActiveSprings:Ljava/util/Set;

    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/facebook/rebound/BaseSpringSystem;->getIsIdle()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/facebook/rebound/BaseSpringSystem;->mIdle:Z

    iget-object p1, p0, Lcom/facebook/rebound/BaseSpringSystem;->mSpringLooper:Lcom/facebook/rebound/SpringLooper;

    invoke-virtual {p1}, Lcom/facebook/rebound/SpringLooper;->start()V

    :cond_0
    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "springId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " does not reference a registered spring"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addListener(Lcom/facebook/rebound/SpringSystemListener;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "newListener is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method advance(D)V
    .locals 4

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mActiveSprings:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/rebound/Spring;

    invoke-virtual {v1}, Lcom/facebook/rebound/Spring;->systemShouldAdvance()Z

    move-result v2

    if-eqz v2, :cond_0

    const-wide v2, 0x408f400000000000L    # 1000.0

    div-double v2, p1, v2

    invoke-virtual {v1, v2, v3}, Lcom/facebook/rebound/Spring;->advance(D)V

    goto :goto_1

    :cond_0
    iget-object v2, p0, Lcom/facebook/rebound/BaseSpringSystem;->mActiveSprings:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :goto_1
    goto :goto_0

    :cond_1
    return-void
.end method

.method public createSpring()Lcom/facebook/rebound/Spring;
    .locals 1

    new-instance v0, Lcom/facebook/rebound/Spring;

    invoke-direct {v0, p0}, Lcom/facebook/rebound/Spring;-><init>(Lcom/facebook/rebound/BaseSpringSystem;)V

    invoke-virtual {p0, v0}, Lcom/facebook/rebound/BaseSpringSystem;->registerSpring(Lcom/facebook/rebound/Spring;)V

    return-object v0
.end method

.method deregisterSpring(Lcom/facebook/rebound/Spring;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mActiveSprings:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mSpringRegistry:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/facebook/rebound/Spring;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "spring is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getAllSprings()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/rebound/Spring;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mSpringRegistry:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_0

    check-cast v0, Ljava/util/List;

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v0, v1

    :goto_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getIsIdle()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mIdle:Z

    return v0
.end method

.method public getSpringById(Ljava/lang/String;)Lcom/facebook/rebound/Spring;
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mSpringRegistry:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/rebound/Spring;

    return-object p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "id is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public loop(D)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/rebound/SpringSystemListener;

    invoke-interface {v1, p0}, Lcom/facebook/rebound/SpringSystemListener;->onBeforeIntegrate(Lcom/facebook/rebound/BaseSpringSystem;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/facebook/rebound/BaseSpringSystem;->advance(D)V

    iget-object p1, p0, Lcom/facebook/rebound/BaseSpringSystem;->mActiveSprings:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/facebook/rebound/BaseSpringSystem;->mIdle:Z

    :cond_1
    iget-object p1, p0, Lcom/facebook/rebound/BaseSpringSystem;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/facebook/rebound/SpringSystemListener;

    invoke-interface {p2, p0}, Lcom/facebook/rebound/SpringSystemListener;->onAfterIntegrate(Lcom/facebook/rebound/BaseSpringSystem;)V

    goto :goto_1

    :cond_2
    iget-boolean p1, p0, Lcom/facebook/rebound/BaseSpringSystem;->mIdle:Z

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/facebook/rebound/BaseSpringSystem;->mSpringLooper:Lcom/facebook/rebound/SpringLooper;

    invoke-virtual {p1}, Lcom/facebook/rebound/SpringLooper;->stop()V

    :cond_3
    return-void
.end method

.method registerSpring(Lcom/facebook/rebound/Spring;)V
    .locals 2

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mSpringRegistry:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/facebook/rebound/Spring;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mSpringRegistry:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/facebook/rebound/Spring;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "spring is already registered"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "spring is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removeAllListeners()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->clear()V

    return-void
.end method

.method public removeListener(Lcom/facebook/rebound/SpringSystemListener;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/facebook/rebound/BaseSpringSystem;->mListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "listenerToRemove is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
