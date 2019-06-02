.class public Lcom/ss/android/ugc/effectmanager/common/model/NetException;
.super Ljava/lang/Exception;
.source "NetException.java"


# instance fields
.field private status_code:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/model/NetException;->status_code:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public getStatus_code()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ugc/effectmanager/common/model/NetException;->status_code:Ljava/lang/Integer;

    return-object v0
.end method

.method public setStatus_code(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ugc/effectmanager/common/model/NetException;->status_code:Ljava/lang/Integer;

    return-void
.end method
