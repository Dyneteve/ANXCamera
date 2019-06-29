.class Lcom/android/camera/CameraPreferenceActivity$2;
.super Ljava/lang/Object;
.source "CameraPreferenceActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/CameraPreferenceActivity;->onPreferenceClick(Landroid/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/CameraPreferenceActivity;


# direct methods
.method constructor <init>(Lcom/android/camera/CameraPreferenceActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/CameraPreferenceActivity$2;->this$0:Lcom/android/camera/CameraPreferenceActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/CameraPreferenceActivity$2;->this$0:Lcom/android/camera/CameraPreferenceActivity;

    invoke-static {v0}, Lcom/android/camera/CameraPreferenceActivity;->access$100(Lcom/android/camera/CameraPreferenceActivity;)V

    return-void
.end method
