.class Landroid/support/v4/print/PrintHelperKitkat$1;
.super Landroid/print/PrintDocumentAdapter;
.source "PrintHelperKitkat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/print/PrintHelperKitkat;->printBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/support/v4/print/PrintHelperKitkat$OnPrintFinishCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mAttributes:Landroid/print/PrintAttributes;

.field final synthetic this$0:Landroid/support/v4/print/PrintHelperKitkat;

.field final synthetic val$bitmap:Landroid/graphics/Bitmap;

.field final synthetic val$callback:Landroid/support/v4/print/PrintHelperKitkat$OnPrintFinishCallback;

.field final synthetic val$fittingMode:I

.field final synthetic val$jobName:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/support/v4/print/PrintHelperKitkat;Ljava/lang/String;Landroid/graphics/Bitmap;ILandroid/support/v4/print/PrintHelperKitkat$OnPrintFinishCallback;)V
    .registers 6

    iput-object p1, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->this$0:Landroid/support/v4/print/PrintHelperKitkat;

    iput-object p2, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->val$jobName:Ljava/lang/String;

    iput-object p3, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->val$bitmap:Landroid/graphics/Bitmap;

    iput p4, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->val$fittingMode:I

    iput-object p5, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->val$callback:Landroid/support/v4/print/PrintHelperKitkat$OnPrintFinishCallback;

    invoke-direct {p0}, Landroid/print/PrintDocumentAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .registers 2

    iget-object v0, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->val$callback:Landroid/support/v4/print/PrintHelperKitkat$OnPrintFinishCallback;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->val$callback:Landroid/support/v4/print/PrintHelperKitkat$OnPrintFinishCallback;

    invoke-interface {v0}, Landroid/support/v4/print/PrintHelperKitkat$OnPrintFinishCallback;->onFinish()V

    :cond_9
    return-void
.end method

.method public onLayout(Landroid/print/PrintAttributes;Landroid/print/PrintAttributes;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$LayoutResultCallback;Landroid/os/Bundle;)V
    .registers 9

    iput-object p2, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->mAttributes:Landroid/print/PrintAttributes;

    new-instance v0, Landroid/print/PrintDocumentInfo$Builder;

    iget-object v1, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->val$jobName:Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/print/PrintDocumentInfo$Builder;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/print/PrintDocumentInfo$Builder;->setContentType(I)Landroid/print/PrintDocumentInfo$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/print/PrintDocumentInfo$Builder;->setPageCount(I)Landroid/print/PrintDocumentInfo$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/print/PrintDocumentInfo$Builder;->build()Landroid/print/PrintDocumentInfo;

    move-result-object v0

    invoke-virtual {p2, p1}, Landroid/print/PrintAttributes;->equals(Ljava/lang/Object;)Z

    move-result v2

    xor-int/2addr v1, v2

    invoke-virtual {p4, v0, v1}, Landroid/print/PrintDocumentAdapter$LayoutResultCallback;->onLayoutFinished(Landroid/print/PrintDocumentInfo;Z)V

    return-void
.end method

.method public onWrite([Landroid/print/PageRange;Landroid/os/ParcelFileDescriptor;Landroid/os/CancellationSignal;Landroid/print/PrintDocumentAdapter$WriteResultCallback;)V
    .registers 14

    new-instance v0, Landroid/print/pdf/PrintedPdfDocument;

    iget-object v1, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->this$0:Landroid/support/v4/print/PrintHelperKitkat;

    iget-object v1, v1, Landroid/support/v4/print/PrintHelperKitkat;->mContext:Landroid/content/Context;

    iget-object v2, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->mAttributes:Landroid/print/PrintAttributes;

    invoke-direct {v0, v1, v2}, Landroid/print/pdf/PrintedPdfDocument;-><init>(Landroid/content/Context;Landroid/print/PrintAttributes;)V

    iget-object v1, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->this$0:Landroid/support/v4/print/PrintHelperKitkat;

    iget-object v2, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->val$bitmap:Landroid/graphics/Bitmap;

    iget-object v3, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->mAttributes:Landroid/print/PrintAttributes;

    invoke-virtual {v3}, Landroid/print/PrintAttributes;->getColorMode()I

    move-result v3

    # invokes: Landroid/support/v4/print/PrintHelperKitkat;->convertBitmapForColorMode(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    invoke-static {v1, v2, v3}, Landroid/support/v4/print/PrintHelperKitkat;->access$000(Landroid/support/v4/print/PrintHelperKitkat;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v1

    const/4 v2, 0x1

    :try_start_1a
    invoke-virtual {v0, v2}, Landroid/print/pdf/PrintedPdfDocument;->startPage(I)Landroid/graphics/pdf/PdfDocument$Page;

    move-result-object v3

    new-instance v4, Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/pdf/PdfDocument$Page;->getInfo()Landroid/graphics/pdf/PdfDocument$PageInfo;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/pdf/PdfDocument$PageInfo;->getContentRect()Landroid/graphics/Rect;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iget-object v5, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->this$0:Landroid/support/v4/print/PrintHelperKitkat;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    iget v8, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->val$fittingMode:I

    # invokes: Landroid/support/v4/print/PrintHelperKitkat;->getMatrix(IILandroid/graphics/RectF;I)Landroid/graphics/Matrix;
    invoke-static {v5, v6, v7, v4, v8}, Landroid/support/v4/print/PrintHelperKitkat;->access$100(Landroid/support/v4/print/PrintHelperKitkat;IILandroid/graphics/RectF;I)Landroid/graphics/Matrix;

    move-result-object v5

    invoke-virtual {v3}, Landroid/graphics/pdf/PdfDocument$Page;->getCanvas()Landroid/graphics/Canvas;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v1, v5, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    invoke-virtual {v0, v3}, Landroid/print/pdf/PrintedPdfDocument;->finishPage(Landroid/graphics/pdf/PdfDocument$Page;)V
    :try_end_46
    .catchall {:try_start_1a .. :try_end_46} :catchall_7b

    :try_start_46
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    invoke-virtual {v0, v6}, Landroid/print/pdf/PrintedPdfDocument;->writeTo(Ljava/io/OutputStream;)V

    new-array v2, v2, [Landroid/print/PageRange;

    const/4 v6, 0x0

    sget-object v8, Landroid/print/PageRange;->ALL_PAGES:Landroid/print/PageRange;

    aput-object v8, v2, v6

    invoke-virtual {p4, v2}, Landroid/print/PrintDocumentAdapter$WriteResultCallback;->onWriteFinished([Landroid/print/PageRange;)V
    :try_end_5c
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_5c} :catch_5d
    .catchall {:try_start_46 .. :try_end_5c} :catchall_7b

    goto :goto_68

    :catch_5d
    move-exception v2

    :try_start_5e
    const-string v6, "PrintHelperKitkat"

    const-string v8, "Error writing printed content"

    invoke-static {v6, v8, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-virtual {p4, v7}, Landroid/print/PrintDocumentAdapter$WriteResultCallback;->onWriteFailed(Ljava/lang/CharSequence;)V
    :try_end_68
    .catchall {:try_start_5e .. :try_end_68} :catchall_7b

    :goto_68
    nop

    invoke-virtual {v0}, Landroid/print/pdf/PrintedPdfDocument;->close()V

    if-eqz p2, :cond_73

    :try_start_6e
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_71} :catch_72

    goto :goto_73

    :catch_72
    move-exception v2

    :cond_73
    :goto_73
    iget-object v2, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->val$bitmap:Landroid/graphics/Bitmap;

    if-eq v1, v2, :cond_7a

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_7a
    return-void

    :catchall_7b
    move-exception v2

    invoke-virtual {v0}, Landroid/print/pdf/PrintedPdfDocument;->close()V

    if-eqz p2, :cond_86

    :try_start_81
    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_84} :catch_85

    goto :goto_86

    :catch_85
    move-exception v3

    :cond_86
    :goto_86
    iget-object v3, p0, Landroid/support/v4/print/PrintHelperKitkat$1;->val$bitmap:Landroid/graphics/Bitmap;

    if-eq v1, v3, :cond_8d

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_8d
    throw v2
.end method
