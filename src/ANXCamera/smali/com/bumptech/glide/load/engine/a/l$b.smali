.class final Lcom/bumptech/glide/load/engine/a/l$b;
.super Ljava/lang/Object;
.source "MemorySizeCalculator.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/a/l$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/a/l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# instance fields
.field private final jE:Landroid/util/DisplayMetrics;


# direct methods
.method constructor <init>(Landroid/util/DisplayMetrics;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a/l$b;->jE:Landroid/util/DisplayMetrics;

    return-void
.end method


# virtual methods
.method public cm()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a/l$b;->jE:Landroid/util/DisplayMetrics;

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    return v0
.end method

.method public cn()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a/l$b;->jE:Landroid/util/DisplayMetrics;

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    return v0
.end method
