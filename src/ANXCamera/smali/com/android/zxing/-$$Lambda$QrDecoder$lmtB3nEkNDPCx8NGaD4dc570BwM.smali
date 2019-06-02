.class public final synthetic Lcom/android/zxing/-$$Lambda$QrDecoder$lmtB3nEkNDPCx8NGaD4dc570BwM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final synthetic f$0:Lcom/android/zxing/QrDecoder;


# direct methods
.method public synthetic constructor <init>(Lcom/android/zxing/QrDecoder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/zxing/-$$Lambda$QrDecoder$lmtB3nEkNDPCx8NGaD4dc570BwM;->f$0:Lcom/android/zxing/QrDecoder;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/android/zxing/-$$Lambda$QrDecoder$lmtB3nEkNDPCx8NGaD4dc570BwM;->f$0:Lcom/android/zxing/QrDecoder;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/android/zxing/QrDecoder;->lambda$new$1(Lcom/android/zxing/QrDecoder;Ljava/lang/String;)V

    return-void
.end method
