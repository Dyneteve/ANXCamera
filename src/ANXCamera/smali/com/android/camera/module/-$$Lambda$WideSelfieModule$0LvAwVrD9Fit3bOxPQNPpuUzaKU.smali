.class public final synthetic Lcom/android/camera/module/-$$Lambda$WideSelfieModule$0LvAwVrD9Fit3bOxPQNPpuUzaKU;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic INSTANCE:Lcom/android/camera/module/-$$Lambda$WideSelfieModule$0LvAwVrD9Fit3bOxPQNPpuUzaKU;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/android/camera/module/-$$Lambda$WideSelfieModule$0LvAwVrD9Fit3bOxPQNPpuUzaKU;

    invoke-direct {v0}, Lcom/android/camera/module/-$$Lambda$WideSelfieModule$0LvAwVrD9Fit3bOxPQNPpuUzaKU;-><init>()V

    sput-object v0, Lcom/android/camera/module/-$$Lambda$WideSelfieModule$0LvAwVrD9Fit3bOxPQNPpuUzaKU;->INSTANCE:Lcom/android/camera/module/-$$Lambda$WideSelfieModule$0LvAwVrD9Fit3bOxPQNPpuUzaKU;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/android/camera/CameraSize;

    check-cast p2, Lcom/android/camera/CameraSize;

    invoke-static {p1, p2}, Lcom/android/camera/module/WideSelfieModule;->lambda$filterSupportedSize4WideSelfie$0(Lcom/android/camera/CameraSize;Lcom/android/camera/CameraSize;)I

    move-result p1

    return p1
.end method
