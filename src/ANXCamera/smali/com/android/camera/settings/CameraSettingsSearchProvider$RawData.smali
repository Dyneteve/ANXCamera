.class Lcom/android/camera/settings/CameraSettingsSearchProvider$RawData;
.super Ljava/lang/Object;
.source "CameraSettingsSearchProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/settings/CameraSettingsSearchProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RawData"
.end annotation


# instance fields
.field intentAction:Ljava/lang/String;

.field intentTargetClass:Ljava/lang/String;

.field intentTargetPackage:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/camera/settings/CameraSettingsSearchProvider;

.field title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/android/camera/settings/CameraSettingsSearchProvider;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/settings/CameraSettingsSearchProvider$RawData;->this$0:Lcom/android/camera/settings/CameraSettingsSearchProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/android/camera/settings/CameraSettingsSearchProvider$RawData;->title:Ljava/lang/String;

    iput-object p3, p0, Lcom/android/camera/settings/CameraSettingsSearchProvider$RawData;->intentAction:Ljava/lang/String;

    iput-object p4, p0, Lcom/android/camera/settings/CameraSettingsSearchProvider$RawData;->intentTargetPackage:Ljava/lang/String;

    iput-object p5, p0, Lcom/android/camera/settings/CameraSettingsSearchProvider$RawData;->intentTargetClass:Ljava/lang/String;

    return-void
.end method
