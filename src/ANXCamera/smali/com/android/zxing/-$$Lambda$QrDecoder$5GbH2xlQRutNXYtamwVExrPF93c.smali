.class public final synthetic Lcom/android/zxing/-$$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/zxing/-$$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/zxing/-$$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c;

    invoke-direct {v0}, Lcom/android/zxing/-$$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c;-><init>()V

    sput-object v0, Lcom/android/zxing/-$$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c;->INSTANCE:Lcom/android/zxing/-$$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p1}, Lcom/android/zxing/QrDecoder;->lambda$startDecode$3(Ljava/lang/Throwable;)V

    return-void
.end method
