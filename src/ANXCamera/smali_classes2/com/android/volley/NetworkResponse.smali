.class public Lcom/android/volley/NetworkResponse;
.super Ljava/lang/Object;
.source "NetworkResponse.java"


# instance fields
.field public final data:[B

.field public final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final notModified:Z

.field public final statusCode:I


# direct methods
.method public constructor <init>(I[BLjava/util/Map;Z)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I[B",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/android/volley/NetworkResponse;->statusCode:I

    iput-object p2, p0, Lcom/android/volley/NetworkResponse;->data:[B

    iput-object p3, p0, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    iput-boolean p4, p0, Lcom/android/volley/NetworkResponse;->notModified:Z

    return-void
.end method

.method public constructor <init>([B)V
    .registers 5

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    const/16 v1, 0xc8

    const/4 v2, 0x0

    invoke-direct {p0, v1, p1, v0, v2}, Lcom/android/volley/NetworkResponse;-><init>(I[BLjava/util/Map;Z)V

    return-void
.end method

.method public constructor <init>([BLjava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/16 v0, 0xc8

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, p2, v1}, Lcom/android/volley/NetworkResponse;-><init>(I[BLjava/util/Map;Z)V

    return-void
.end method
