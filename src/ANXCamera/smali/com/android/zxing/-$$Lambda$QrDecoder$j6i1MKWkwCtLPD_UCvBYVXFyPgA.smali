.class public final synthetic Lcom/android/zxing/-$$Lambda$QrDecoder$j6i1MKWkwCtLPD_UCvBYVXFyPgA;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Function;


# instance fields
.field private final synthetic f$0:Lcom/android/zxing/QrDecoder;


# direct methods
.method public synthetic constructor <init>(Lcom/android/zxing/QrDecoder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/zxing/-$$Lambda$QrDecoder$j6i1MKWkwCtLPD_UCvBYVXFyPgA;->f$0:Lcom/android/zxing/QrDecoder;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/android/zxing/-$$Lambda$QrDecoder$j6i1MKWkwCtLPD_UCvBYVXFyPgA;->f$0:Lcom/android/zxing/QrDecoder;

    check-cast p1, Lcom/android/zxing/PreviewImage;

    invoke-static {v0, p1}, Lcom/android/zxing/QrDecoder;->lambda$new$0(Lcom/android/zxing/QrDecoder;Lcom/android/zxing/PreviewImage;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
