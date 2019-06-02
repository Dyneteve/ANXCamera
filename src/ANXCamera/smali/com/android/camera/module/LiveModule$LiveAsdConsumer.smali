.class Lcom/android/camera/module/LiveModule$LiveAsdConsumer;
.super Ljava/lang/Object;
.source "LiveModule.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/LiveModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LiveAsdConsumer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/LiveModule;


# direct methods
.method private constructor <init>(Lcom/android/camera/module/LiveModule;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/LiveModule$LiveAsdConsumer;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/module/LiveModule;Lcom/android/camera/module/LiveModule$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/module/LiveModule$LiveAsdConsumer;-><init>(Lcom/android/camera/module/LiveModule;)V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Integer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/module/LiveModule$LiveAsdConsumer;->this$0:Lcom/android/camera/module/LiveModule;

    invoke-static {v0, p1}, Lcom/android/camera/module/LiveModule;->access$600(Lcom/android/camera/module/LiveModule;Ljava/lang/Integer;)V

    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/android/camera/module/LiveModule$LiveAsdConsumer;->accept(Ljava/lang/Integer;)V

    return-void
.end method
