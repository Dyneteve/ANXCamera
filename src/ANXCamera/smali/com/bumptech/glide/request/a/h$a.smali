.class Lcom/bumptech/glide/request/a/h$a;
.super Ljava/lang/Object;
.source "ViewAnimationFactory.java"

# interfaces
.implements Lcom/bumptech/glide/request/a/k$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/request/a/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final pH:Landroid/view/animation/Animation;


# direct methods
.method constructor <init>(Landroid/view/animation/Animation;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/request/a/h$a;->pH:Landroid/view/animation/Animation;

    return-void
.end method


# virtual methods
.method public m(Landroid/content/Context;)Landroid/view/animation/Animation;
    .locals 0

    iget-object p1, p0, Lcom/bumptech/glide/request/a/h$a;->pH:Landroid/view/animation/Animation;

    return-object p1
.end method
