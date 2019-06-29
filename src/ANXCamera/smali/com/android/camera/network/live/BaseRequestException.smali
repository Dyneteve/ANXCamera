.class public Lcom/android/camera/network/live/BaseRequestException;
.super Ljava/lang/Exception;
.source "BaseRequestException.java"


# instance fields
.field private mErrorCode:Lcom/android/camera/network/net/base/ErrorCode;


# direct methods
.method public constructor <init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/camera/network/live/BaseRequestException;->mErrorCode:Lcom/android/camera/network/net/base/ErrorCode;

    return-void
.end method

.method public constructor <init>(Lcom/android/camera/network/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    invoke-direct {p0, p2, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-object p1, p0, Lcom/android/camera/network/live/BaseRequestException;->mErrorCode:Lcom/android/camera/network/net/base/ErrorCode;

    return-void
.end method


# virtual methods
.method public getErrorCode()Lcom/android/camera/network/net/base/ErrorCode;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/network/live/BaseRequestException;->mErrorCode:Lcom/android/camera/network/net/base/ErrorCode;

    return-object v0
.end method
