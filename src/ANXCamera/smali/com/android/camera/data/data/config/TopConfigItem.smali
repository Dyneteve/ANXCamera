.class public Lcom/android/camera/data/data/config/TopConfigItem;
.super Ljava/lang/Object;
.source "TopConfigItem.java"


# instance fields
.field public bindViewPosition:I

.field public configItem:I

.field public enable:Z

.field public gravity:I

.field public index:I

.field public margin:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xb0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    iput p1, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xb0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    iput p1, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    iput p2, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    return-void
.end method

.method public constructor <init>(III)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xb0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/data/data/config/TopConfigItem;->enable:Z

    iput p1, p0, Lcom/android/camera/data/data/config/TopConfigItem;->bindViewPosition:I

    iput p2, p0, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    iput p3, p0, Lcom/android/camera/data/data/config/TopConfigItem;->gravity:I

    return-void
.end method
