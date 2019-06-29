.class public Lcom/android/camera/constant/CaptureHelper;
.super Ljava/lang/Object;
.source "CaptureHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/CaptureHelper$CaptureStep;,
        Lcom/android/camera/constant/CaptureHelper$ApplyType;,
        Lcom/android/camera/constant/CaptureHelper$PictureState;
    }
.end annotation


# static fields
.field public static final APPLY_BURST:I = 0x4

.field public static final APPLY_CAPTURE:I = 0x3

.field public static final APPLY_PREVIEW:I = 0x1

.field public static final APPLY_PRE_CAPTURE:I = 0x6

.field public static final FLASH_AE_PRIOR_FLOW:[I

.field public static final FLASH_AF_PRIOR_FLOW:[I

.field public static final FLASH_LEGACY_FLOW:[I

.field public static final FLASH_NON_AF_FLOW:[I

.field public static final NORMAL_AE_PRIOR_FLOW:[I

.field public static final STATE_PICTURE_TAKEN:I = 0x8

.field public static final STATE_PREVIEWING:I = 0x1

.field public static final STATE_WAITING_AE_CONVERGED:I = 0x5

.field public static final STATE_WAITING_AE_LOCK:I = 0x4

.field public static final STATE_WAITING_AF_LOCK:I = 0x3

.field public static final STATE_WAITING_FLASH_CLOSE:I = 0x9

.field public static final STATE_WAITING_FLASH_CLOSE_AND_STOP_PREVIEW:I = 0xb

.field public static final STATE_WAITING_FLASH_FIRED:I = 0xa

.field public static final STATE_WAITING_NON_PRECAPTURE:I = 0x7

.field public static final STATE_WAITING_PRECAPTURE:I = 0x6

.field public static final STATE_WAITING_PREVIEW:I = 0x0

.field public static final TRIGGER_LOCK_AE:I = 0x3

.field public static final TRIGGER_LOCK_AF:I = 0x2

.field public static final TRIGGER_PRE_CAPTURE:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/constant/CaptureHelper;->FLASH_LEGACY_FLOW:[I

    const/4 v0, 0x0

    new-array v1, v0, [I

    sput-object v1, Lcom/android/camera/constant/CaptureHelper;->FLASH_AE_PRIOR_FLOW:[I

    new-array v1, v0, [I

    sput-object v1, Lcom/android/camera/constant/CaptureHelper;->FLASH_AF_PRIOR_FLOW:[I

    new-array v1, v0, [I

    sput-object v1, Lcom/android/camera/constant/CaptureHelper;->FLASH_NON_AF_FLOW:[I

    new-array v0, v0, [I

    sput-object v0, Lcom/android/camera/constant/CaptureHelper;->NORMAL_AE_PRIOR_FLOW:[I

    return-void

    :array_0
    .array-data 4
        0x2
        0x1
        0x3
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getWaitingStateByCaptureStep(I)I
    .locals 1

    packed-switch p1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v0, "unKnown capture step"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    const/4 p1, 0x4

    return p1

    :pswitch_1
    const/4 p1, 0x3

    return p1

    :pswitch_2
    const/4 p1, 0x6

    return p1

    nop

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
