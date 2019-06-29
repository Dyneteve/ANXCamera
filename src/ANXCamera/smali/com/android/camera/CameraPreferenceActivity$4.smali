.class Lcom/android/camera/CameraPreferenceActivity$4;
.super Landroid/os/AsyncTask;
.source "CameraPreferenceActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/CameraPreferenceActivity;->installQRCodeReceiver()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/CameraPreferenceActivity;


# direct methods
.method constructor <init>(Lcom/android/camera/CameraPreferenceActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/CameraPreferenceActivity$4;->this$0:Lcom/android/camera/CameraPreferenceActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/android/camera/CameraPreferenceActivity$4;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 4

    sget-object p1, Lcom/android/camera/CameraPreferenceActivity;->TAG:Ljava/lang/String;

    const-string v0, "install..."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/CameraPreferenceActivity$4;->this$0:Lcom/android/camera/CameraPreferenceActivity;

    const-string v0, "com.xiaomi.scanner"

    iget-object v1, p0, Lcom/android/camera/CameraPreferenceActivity$4;->this$0:Lcom/android/camera/CameraPreferenceActivity;

    invoke-static {v1}, Lcom/android/camera/CameraPreferenceActivity;->access$300(Lcom/android/camera/CameraPreferenceActivity;)Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {p1, v0, v1, v2, v3}, Lcom/android/camera/Util;->installPackage(Landroid/content/Context;Ljava/lang/String;Lcom/android/camera/lib/compatibility/util/CompatibilityUtils$PackageInstallerListener;ZZ)V

    const/4 p1, 0x0

    return-object p1
.end method
