.class public final synthetic Lcom/android/zxing/-$$Lambda$HandGestureDecoder$k5Tz3QC2-fujaBf7OR4Blfav0bI;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Function;


# instance fields
.field private final synthetic f$0:Lcom/android/zxing/HandGestureDecoder;


# direct methods
.method public synthetic constructor <init>(Lcom/android/zxing/HandGestureDecoder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/zxing/-$$Lambda$HandGestureDecoder$k5Tz3QC2-fujaBf7OR4Blfav0bI;->f$0:Lcom/android/zxing/HandGestureDecoder;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/android/zxing/-$$Lambda$HandGestureDecoder$k5Tz3QC2-fujaBf7OR4Blfav0bI;->f$0:Lcom/android/zxing/HandGestureDecoder;

    check-cast p1, Lcom/android/zxing/PreviewImage;

    invoke-static {v0, p1}, Lcom/android/zxing/HandGestureDecoder;->lambda$new$0(Lcom/android/zxing/HandGestureDecoder;Lcom/android/zxing/PreviewImage;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method
