.class public Landroid/support/v4/app/TaskStackBuilder;
.super Ljava/lang/Object;
.source "TaskStackBuilder.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImplJellybean;,
        Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImplHoneycomb;,
        Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImplBase;,
        Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImpl;,
        Landroid/support/v4/app/TaskStackBuilder$SupportParentable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Landroid/content/Intent;",
        ">;"
    }
.end annotation


# static fields
.field private static final IMPL:Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImpl;

.field private static final TAG:Ljava/lang/String; = "TaskStackBuilder"


# instance fields
.field private final mIntents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field

.field private final mSourceContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_e

    new-instance v0, Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImplHoneycomb;

    invoke-direct {v0}, Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImplHoneycomb;-><init>()V

    sput-object v0, Landroid/support/v4/app/TaskStackBuilder;->IMPL:Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImpl;

    goto :goto_15

    :cond_e
    new-instance v0, Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImplBase;

    invoke-direct {v0}, Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImplBase;-><init>()V

    sput-object v0, Landroid/support/v4/app/TaskStackBuilder;->IMPL:Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImpl;

    :goto_15
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    iput-object p1, p0, Landroid/support/v4/app/TaskStackBuilder;->mSourceContext:Landroid/content/Context;

    return-void
.end method

.method public static create(Landroid/content/Context;)Landroid/support/v4/app/TaskStackBuilder;
    .registers 2

    new-instance v0, Landroid/support/v4/app/TaskStackBuilder;

    invoke-direct {v0, p0}, Landroid/support/v4/app/TaskStackBuilder;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public static from(Landroid/content/Context;)Landroid/support/v4/app/TaskStackBuilder;
    .registers 2

    invoke-static {p0}, Landroid/support/v4/app/TaskStackBuilder;->create(Landroid/content/Context;)Landroid/support/v4/app/TaskStackBuilder;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addNextIntent(Landroid/content/Intent;)Landroid/support/v4/app/TaskStackBuilder;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addNextIntentWithParentStack(Landroid/content/Intent;)Landroid/support/v4/app/TaskStackBuilder;
    .registers 4

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-nez v0, :cond_10

    iget-object v1, p0, Landroid/support/v4/app/TaskStackBuilder;->mSourceContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v0

    :cond_10
    if-eqz v0, :cond_15

    invoke-virtual {p0, v0}, Landroid/support/v4/app/TaskStackBuilder;->addParentStack(Landroid/content/ComponentName;)Landroid/support/v4/app/TaskStackBuilder;

    :cond_15
    invoke-virtual {p0, p1}, Landroid/support/v4/app/TaskStackBuilder;->addNextIntent(Landroid/content/Intent;)Landroid/support/v4/app/TaskStackBuilder;

    return-object p0
.end method

.method public addParentStack(Landroid/app/Activity;)Landroid/support/v4/app/TaskStackBuilder;
    .registers 5

    const/4 v0, 0x0

    instance-of v1, p1, Landroid/support/v4/app/TaskStackBuilder$SupportParentable;

    if-eqz v1, :cond_c

    move-object v1, p1

    check-cast v1, Landroid/support/v4/app/TaskStackBuilder$SupportParentable;

    invoke-interface {v1}, Landroid/support/v4/app/TaskStackBuilder$SupportParentable;->getSupportParentActivityIntent()Landroid/content/Intent;

    move-result-object v0

    :cond_c
    if-nez v0, :cond_12

    invoke-static {p1}, Landroid/support/v4/app/NavUtils;->getParentActivityIntent(Landroid/app/Activity;)Landroid/content/Intent;

    move-result-object v0

    :cond_12
    if-eqz v0, :cond_2a

    invoke-virtual {v0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    if-nez v1, :cond_24

    iget-object v2, p0, Landroid/support/v4/app/TaskStackBuilder;->mSourceContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v1

    :cond_24
    invoke-virtual {p0, v1}, Landroid/support/v4/app/TaskStackBuilder;->addParentStack(Landroid/content/ComponentName;)Landroid/support/v4/app/TaskStackBuilder;

    invoke-virtual {p0, v0}, Landroid/support/v4/app/TaskStackBuilder;->addNextIntent(Landroid/content/Intent;)Landroid/support/v4/app/TaskStackBuilder;

    :cond_2a
    return-object p0
.end method

.method public addParentStack(Landroid/content/ComponentName;)Landroid/support/v4/app/TaskStackBuilder;
    .registers 6

    iget-object v0, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :try_start_6
    iget-object v1, p0, Landroid/support/v4/app/TaskStackBuilder;->mSourceContext:Landroid/content/Context;

    invoke-static {v1, p1}, Landroid/support/v4/app/NavUtils;->getParentActivityIntent(Landroid/content/Context;Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v1

    :goto_c
    if-eqz v1, :cond_1f

    iget-object v2, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v2, v0, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget-object v2, p0, Landroid/support/v4/app/TaskStackBuilder;->mSourceContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/support/v4/app/NavUtils;->getParentActivityIntent(Landroid/content/Context;Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v2
    :try_end_1d
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_6 .. :try_end_1d} :catch_21

    move-object v1, v2

    goto :goto_c

    :cond_1f
    nop

    return-object p0

    :catch_21
    move-exception v1

    const-string v2, "TaskStackBuilder"

    const-string v3, "Bad ComponentName while traversing activity parent metadata"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public addParentStack(Ljava/lang/Class;)Landroid/support/v4/app/TaskStackBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Landroid/support/v4/app/TaskStackBuilder;"
        }
    .end annotation

    new-instance v0, Landroid/content/ComponentName;

    iget-object v1, p0, Landroid/support/v4/app/TaskStackBuilder;->mSourceContext:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Landroid/support/v4/app/TaskStackBuilder;->addParentStack(Landroid/content/ComponentName;)Landroid/support/v4/app/TaskStackBuilder;

    move-result-object v0

    return-object v0
.end method

.method public editIntentAt(I)Landroid/content/Intent;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    return-object v0
.end method

.method public getIntent(I)Landroid/content/Intent;
    .registers 3

    invoke-virtual {p0, p1}, Landroid/support/v4/app/TaskStackBuilder;->editIntentAt(I)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getIntentCount()I
    .registers 2

    iget-object v0, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getIntents()[Landroid/content/Intent;
    .registers 5

    iget-object v0, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Landroid/content/Intent;

    array-length v1, v0

    if-nez v1, :cond_c

    return-object v0

    :cond_c
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Intent;

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const v2, 0x1000c000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    aput-object v1, v0, v3

    const/4 v1, 0x1

    :goto_24
    array-length v2, v0

    if-ge v1, v2, :cond_39

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Intent;

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_24

    :cond_39
    return-object v0
.end method

.method public getPendingIntent(II)Landroid/app/PendingIntent;
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v4/app/TaskStackBuilder;->getPendingIntent(IILandroid/os/Bundle;)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method public getPendingIntent(IILandroid/os/Bundle;)Landroid/app/PendingIntent;
    .registers 11

    iget-object v0, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_36

    iget-object v0, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Landroid/content/Intent;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/content/Intent;

    new-instance v1, Landroid/content/Intent;

    const/4 v2, 0x0

    aget-object v3, v0, v2

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const v3, 0x1000c000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    aput-object v1, v0, v2

    sget-object v1, Landroid/support/v4/app/TaskStackBuilder;->IMPL:Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImpl;

    iget-object v2, p0, Landroid/support/v4/app/TaskStackBuilder;->mSourceContext:Landroid/content/Context;

    move-object v3, v0

    move v4, p1

    move v5, p2

    move-object v6, p3

    invoke-interface/range {v1 .. v6}, Landroid/support/v4/app/TaskStackBuilder$TaskStackBuilderImpl;->getPendingIntent(Landroid/content/Context;[Landroid/content/Intent;IILandroid/os/Bundle;)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1

    :cond_36
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No intents added to TaskStackBuilder; cannot getPendingIntent"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public startActivities()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/app/TaskStackBuilder;->startActivities(Landroid/os/Bundle;)V

    return-void
.end method

.method public startActivities(Landroid/os/Bundle;)V
    .registers 6

    iget-object v0, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_46

    iget-object v0, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    iget-object v1, p0, Landroid/support/v4/app/TaskStackBuilder;->mIntents:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Landroid/content/Intent;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/content/Intent;

    new-instance v1, Landroid/content/Intent;

    const/4 v2, 0x0

    aget-object v3, v0, v2

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const v3, 0x1000c000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    aput-object v1, v0, v2

    iget-object v1, p0, Landroid/support/v4/app/TaskStackBuilder;->mSourceContext:Landroid/content/Context;

    invoke-static {v1, v0, p1}, Landroid/support/v4/content/ContextCompat;->startActivities(Landroid/content/Context;[Landroid/content/Intent;Landroid/os/Bundle;)Z

    move-result v1

    if-nez v1, :cond_45

    new-instance v1, Landroid/content/Intent;

    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aget-object v2, v0, v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object v2, p0, Landroid/support/v4/app/TaskStackBuilder;->mSourceContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_45
    return-void

    :cond_46
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No intents added to TaskStackBuilder; cannot startActivities"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
