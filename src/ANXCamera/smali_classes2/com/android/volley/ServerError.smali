.class public Lcom/android/volley/ServerError;
.super Lcom/android/volley/VolleyError;
.source "ServerError.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/android/volley/VolleyError;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/android/volley/NetworkResponse;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/android/volley/VolleyError;-><init>(Lcom/android/volley/NetworkResponse;)V

    return-void
.end method
