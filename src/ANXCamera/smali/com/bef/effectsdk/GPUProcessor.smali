.class public Lcom/bef/effectsdk/GPUProcessor;
.super Ljava/lang/Object;
.source "GPUProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bef/effectsdk/GPUProcessor$Listener;
    }
.end annotation


# static fields
.field private static sListener:Lcom/bef/effectsdk/GPUProcessor$Listener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/bef/effectsdk/GPUProcessor$Listener;
    .locals 1

    sget-object v0, Lcom/bef/effectsdk/GPUProcessor;->sListener:Lcom/bef/effectsdk/GPUProcessor$Listener;

    return-object v0
.end method

.method public static destroy()V
    .locals 1

    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->destroy()V

    const/4 v0, 0x0

    sput-object v0, Lcom/bef/effectsdk/GPUProcessor;->sListener:Lcom/bef/effectsdk/GPUProcessor$Listener;

    return-void
.end method

.method public static init()V
    .locals 1

    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->init()V

    new-instance v0, Lcom/bef/effectsdk/GPUProcessor$1;

    invoke-direct {v0}, Lcom/bef/effectsdk/GPUProcessor$1;-><init>()V

    invoke-static {v0}, Lcom/bef/effectsdk/message/MessageCenter;->setListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V

    return-void
.end method

.method public static setListener(Lcom/bef/effectsdk/GPUProcessor$Listener;)V
    .locals 0

    sput-object p0, Lcom/bef/effectsdk/GPUProcessor;->sListener:Lcom/bef/effectsdk/GPUProcessor$Listener;

    return-void
.end method
