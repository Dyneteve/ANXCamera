.class public final synthetic Lcom/android/zxing/-$$Lambda$QrDecoder$Rc15QvI9d-ellK6pqRPEGV4Ufvo;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/FlowableOnSubscribe;


# instance fields
.field private final synthetic f$0:Lcom/android/zxing/QrDecoder;


# direct methods
.method public synthetic constructor <init>(Lcom/android/zxing/QrDecoder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/zxing/-$$Lambda$QrDecoder$Rc15QvI9d-ellK6pqRPEGV4Ufvo;->f$0:Lcom/android/zxing/QrDecoder;

    return-void
.end method


# virtual methods
.method public final subscribe(Lio/reactivex/FlowableEmitter;)V
    .locals 1

    iget-object v0, p0, Lcom/android/zxing/-$$Lambda$QrDecoder$Rc15QvI9d-ellK6pqRPEGV4Ufvo;->f$0:Lcom/android/zxing/QrDecoder;

    invoke-static {v0, p1}, Lcom/android/zxing/QrDecoder;->lambda$startDecode$0(Lcom/android/zxing/QrDecoder;Lio/reactivex/FlowableEmitter;)V

    return-void
.end method
