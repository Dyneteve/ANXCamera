.class public Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectCheckUpdateResponse;
.super Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;
.source "EffectCheckUpdateResponse.java"


# instance fields
.field private updated:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/ss/android/ugc/effectmanager/common/model/BaseNetResponse;-><init>()V

    return-void
.end method


# virtual methods
.method public isUpdated()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectCheckUpdateResponse;->updated:Z

    return v0
.end method

.method public setUpdated(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/ugc/effectmanager/effect/model/net/EffectCheckUpdateResponse;->updated:Z

    return-void
.end method
