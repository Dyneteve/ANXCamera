.class public abstract Lcom/android/camera/data/data/TypeElements;
.super Ljava/lang/Object;
.source "TypeElements.java"


# instance fields
.field protected mComponentData:Lcom/android/camera/data/data/ComponentData;

.field private mTypeItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/camera/data/data/ComponentData;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C:",
            "Lcom/android/camera/data/data/ComponentData;",
            ">(TC;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/data/data/TypeElements;->mComponentData:Lcom/android/camera/data/data/ComponentData;

    return-void
.end method
