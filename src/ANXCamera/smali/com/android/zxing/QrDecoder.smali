.class public Lcom/android/zxing/QrDecoder;
.super Lcom/android/zxing/Decoder;
.source "QrDecoder.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "QrDecoder"


# instance fields
.field private final mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

.field private mScanResult:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 4

    invoke-direct {p0}, Lcom/android/zxing/Decoder;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/android/zxing/QrDecoder;->mScanResult:Ljava/lang/String;

    new-instance v0, Lcom/google/zxing/MultiFormatReader;

    invoke-direct {v0}, Lcom/google/zxing/MultiFormatReader;-><init>()V

    iput-object v0, p0, Lcom/android/zxing/QrDecoder;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    sget-object v3, Lcom/android/zxing/DecodeFormats;->QR_CODE_FORMATS:Ljava/util/Vector;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    sget-object v3, Lcom/google/zxing/DecodeHintType;->POSSIBLE_FORMATS:Lcom/google/zxing/DecodeHintType;

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/zxing/QrDecoder;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v2, v0}, Lcom/google/zxing/MultiFormatReader;->setHints(Ljava/util/Map;)V

    iput-boolean v1, p0, Lcom/android/zxing/QrDecoder;->mEnable:Z

    return-void
.end method

.method public static synthetic lambda$startDecode$0(Lcom/android/zxing/QrDecoder;Lio/reactivex/FlowableEmitter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iput-object p1, p0, Lcom/android/zxing/QrDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    return-void
.end method

.method public static synthetic lambda$startDecode$1(Lcom/android/zxing/QrDecoder;Lcom/android/zxing/PreviewImage;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "QrDecoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "decode E: previewImage is null? "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, p1}, Lcom/android/zxing/QrDecoder;->decode(Lcom/android/zxing/PreviewImage;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static synthetic lambda$startDecode$2(Lcom/android/zxing/QrDecoder;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "QrDecoder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "decode X: result = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Lcom/android/zxing/QrDecoder;->mDecoding:Z

    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mScanResult:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    :goto_0
    xor-int/2addr v0, v1

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/zxing/QrDecoder;->mDecoding:Z

    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mScanResult:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    :goto_1
    if-nez v0, :cond_1

    return-void

    :cond_1
    iput-object p1, p0, Lcom/android/zxing/QrDecoder;->mScanResult:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xaf

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    iget-boolean v0, p0, Lcom/android/zxing/QrDecoder;->mDecoding:Z

    if-nez v0, :cond_2

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showQrCodeTip()V

    goto :goto_2

    :cond_2
    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->hideQrCodeTip()V

    :goto_2
    return-void
.end method

.method static synthetic lambda$startDecode$3(Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "QrDecoder"

    const-string v1, "onError: "

    invoke-static {v0, v1, p0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method


# virtual methods
.method protected decode(Lcom/android/zxing/PreviewImage;)Ljava/lang/String;
    .locals 10

    const-string v0, ""

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getData()[B

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getData()[B

    move-result-object v1

    array-length v1, v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getWidth()I

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getHeight()I

    move-result v1

    if-nez v1, :cond_0

    goto :goto_4

    :cond_0
    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getData()[B

    move-result-object v1

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getWidth()I

    move-result v8

    invoke-virtual {p1}, Lcom/android/zxing/PreviewImage;->getHeight()I

    move-result v9

    mul-int p1, v8, v9

    new-array v2, p1, [B

    array-length v3, v1

    if-le v3, p1, :cond_1

    array-length p1, v2

    const/4 v3, 0x0

    invoke-static {v1, v3, v2, v3, p1}, Ljava/lang/System;->arraycopy([BI[BII)V

    move-object v3, v2

    goto :goto_0

    :cond_1
    nop

    move-object v3, v1

    :goto_0
    new-instance p1, Lcom/android/zxing/YUVLuminanceSource;

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p1

    move v4, v8

    move v5, v9

    invoke-direct/range {v2 .. v9}, Lcom/android/zxing/YUVLuminanceSource;-><init>([BIIIIII)V

    new-instance v1, Lcom/google/zxing/BinaryBitmap;

    new-instance v2, Lcom/google/zxing/common/HybridBinarizer;

    invoke-direct {v2, p1}, Lcom/google/zxing/common/HybridBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    invoke-direct {v1, v2}, Lcom/google/zxing/BinaryBitmap;-><init>(Lcom/google/zxing/Binarizer;)V

    :try_start_0
    iget-object p1, p0, Lcom/android/zxing/QrDecoder;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {p1, v1}, Lcom/google/zxing/MultiFormatReader;->decodeWithState(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lcom/google/zxing/ReaderException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, p1

    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/android/zxing/QrDecoder;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {p1}, Lcom/google/zxing/MultiFormatReader;->reset()V

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_0
    move-exception p1

    :try_start_1
    const-string v1, "QrDecoder"

    const-string v2, "decode: ReaderException: "

    invoke-static {v1, v2, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :goto_2
    return-object v0

    :goto_3
    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mMultiFormatReader:Lcom/google/zxing/MultiFormatReader;

    invoke-virtual {v0}, Lcom/google/zxing/MultiFormatReader;->reset()V

    throw p1

    :cond_3
    :goto_4
    return-object v0
.end method

.method public getScanResult()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mScanResult:Ljava/lang/String;

    return-object v0
.end method

.method public init(I)V
    .locals 0

    return-void
.end method

.method public onPreviewFrame(Landroid/media/Image;I)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/zxing/QrDecoder;->needPreviewFrame()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/android/zxing/PreviewImage;

    invoke-direct {v0, p1, p2}, Lcom/android/zxing/PreviewImage;-><init>(Landroid/media/Image;I)V

    iget-object p1, p0, Lcom/android/zxing/QrDecoder;->mDecodeFlowableEmitter:Lio/reactivex/FlowableEmitter;

    invoke-interface {p1, v0}, Lio/reactivex/FlowableEmitter;->onNext(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public reset()V
    .locals 0

    return-void
.end method

.method public resetScanResult()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/QrDecoder;->mDecoding:Z

    const-string v0, ""

    iput-object v0, p0, Lcom/android/zxing/QrDecoder;->mScanResult:Ljava/lang/String;

    return-void
.end method

.method public startDecode()V
    .locals 3

    new-instance v0, Lcom/android/zxing/-$$Lambda$QrDecoder$Rc15QvI9d-ellK6pqRPEGV4Ufvo;

    invoke-direct {v0, p0}, Lcom/android/zxing/-$$Lambda$QrDecoder$Rc15QvI9d-ellK6pqRPEGV4Ufvo;-><init>(Lcom/android/zxing/QrDecoder;)V

    sget-object v1, Lio/reactivex/BackpressureStrategy;->DROP:Lio/reactivex/BackpressureStrategy;

    invoke-static {v0, v1}, Lio/reactivex/Flowable;->create(Lio/reactivex/FlowableOnSubscribe;Lio/reactivex/BackpressureStrategy;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/-$$Lambda$QrDecoder$RIOWWoO2iO5364BNBaDxB0DTl-g;

    invoke-direct {v1, p0}, Lcom/android/zxing/-$$Lambda$QrDecoder$RIOWWoO2iO5364BNBaDxB0DTl-g;-><init>(Lcom/android/zxing/QrDecoder;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Flowable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Flowable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Flowable;

    move-result-object v0

    new-instance v1, Lcom/android/zxing/-$$Lambda$QrDecoder$fltTZBFxDQoGbFPFl-4koaLLCeI;

    invoke-direct {v1, p0}, Lcom/android/zxing/-$$Lambda$QrDecoder$fltTZBFxDQoGbFPFl-4koaLLCeI;-><init>(Lcom/android/zxing/QrDecoder;)V

    sget-object v2, Lcom/android/zxing/-$$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c;->INSTANCE:Lcom/android/zxing/-$$Lambda$QrDecoder$5GbH2xlQRutNXYtamwVExrPF93c;

    invoke-virtual {v0, v1, v2}, Lio/reactivex/Flowable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/zxing/QrDecoder;->mDecodeDisposable:Lio/reactivex/disposables/Disposable;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/zxing/QrDecoder;->mDecoding:Z

    iget-object v0, p0, Lcom/android/zxing/QrDecoder;->mDecodingCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void
.end method
