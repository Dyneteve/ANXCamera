.class Lcom/android/camera/effect/renders/SnapshotRender$RenderHolder;
.super Ljava/lang/Object;
.source "SnapshotRender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/effect/renders/SnapshotRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RenderHolder"
.end annotation


# static fields
.field private static render:Lcom/android/camera/effect/renders/SnapshotRender;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/android/camera/effect/renders/SnapshotRender;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/camera/effect/renders/SnapshotRender;-><init>(Lcom/android/camera/effect/renders/SnapshotRender$1;)V

    sput-object v0, Lcom/android/camera/effect/renders/SnapshotRender$RenderHolder;->render:Lcom/android/camera/effect/renders/SnapshotRender;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/android/camera/effect/renders/SnapshotRender;
    .locals 1

    sget-object v0, Lcom/android/camera/effect/renders/SnapshotRender$RenderHolder;->render:Lcom/android/camera/effect/renders/SnapshotRender;

    return-object v0
.end method
