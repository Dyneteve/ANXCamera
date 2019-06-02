.class public Lcom/android/camera2/autozoom/AutoZoomTags;
.super Ljava/lang/Object;
.source "AutoZoomTags.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/autozoom/AutoZoomTags$TAG;
    }
.end annotation


# static fields
.field public static TAG_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/camera2/autozoom/AutoZoomTags$TAG;",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->MODE:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, Ljava/lang/Integer;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->APPLY_IN_PREVIEW:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, Ljava/lang/Integer;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->MINIMUM_SCALING:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, Ljava/lang/Float;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->STOP:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, Ljava/lang/Integer;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->START:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [F

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->SELECT:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, Ljava/lang/Integer;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->UNSELECT:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, Ljava/lang/Integer;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->FORCE_LOCK:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, Ljava/lang/Integer;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->CENTER_OFFSET:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [F

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->SCALE_OFFSET:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, Ljava/lang/Float;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->BOUNDS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [F

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->TARGET_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [F

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->TARGET_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [F

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->STATUS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, Ljava/lang/Integer;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->ACTIVE_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [I

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->SELECTED_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [I

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->PAUSED_OBJECTS:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [I

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->OBJECT_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [F

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->OBJECT_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [F

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->DELAYED_TARGET_BOUNDS_STABILIZED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [F

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/android/camera2/autozoom/AutoZoomTags;->TAG_MAP:Ljava/util/Map;

    sget-object v1, Lcom/android/camera2/autozoom/AutoZoomTags$TAG;->DELAYED_TARGET_BOUNDS_ZOOMED:Lcom/android/camera2/autozoom/AutoZoomTags$TAG;

    const-class v2, [F

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
