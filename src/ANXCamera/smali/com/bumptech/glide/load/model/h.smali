.class public interface abstract Lcom/bumptech/glide/load/model/h;
.super Ljava/lang/Object;
.source "Headers.java"


# static fields
.field public static final jN:Lcom/bumptech/glide/load/model/h;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final jO:Lcom/bumptech/glide/load/model/h;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/bumptech/glide/load/model/h$1;

    invoke-direct {v0}, Lcom/bumptech/glide/load/model/h$1;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/model/h;->jN:Lcom/bumptech/glide/load/model/h;

    new-instance v0, Lcom/bumptech/glide/load/model/j$a;

    invoke-direct {v0}, Lcom/bumptech/glide/load/model/j$a;-><init>()V

    invoke-virtual {v0}, Lcom/bumptech/glide/load/model/j$a;->cf()Lcom/bumptech/glide/load/model/j;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/model/h;->jO:Lcom/bumptech/glide/load/model/h;

    return-void
.end method


# virtual methods
.method public abstract getHeaders()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method
