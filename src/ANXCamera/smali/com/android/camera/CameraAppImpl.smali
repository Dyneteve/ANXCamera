.class public Lcom/android/camera/CameraAppImpl;
.super Lmiui/external/Application;
.source "CameraAppImpl.java"


# static fields
.field private static sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;


# instance fields
.field private sLaunched:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lmiui/external/Application;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    return-void
.end method

.method public static getAndroidContext()Landroid/content/Context;
    .locals 1

    invoke-static {}, Lcom/android/camera/CameraApplicationDelegate;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public addActivity(Landroid/app/Activity;)V
    .locals 1

    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraApplicationDelegate;->addActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public closeAllActivitiesBut(Landroid/app/Activity;)V
    .locals 1

    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraApplicationDelegate;->closeAllActivitiesBut(Landroid/app/Activity;)V

    return-void
.end method

.method public containsResumedCameraInStack()Z
    .locals 1

    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0}, Lcom/android/camera/CameraApplicationDelegate;->containsResumedCameraInStack()Z

    move-result v0

    return v0
.end method

.method public getActivity(I)Landroid/app/Activity;
    .locals 1

    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraApplicationDelegate;->getActivity(I)Landroid/app/Activity;

    move-result-object p1

    return-object p1
.end method

.method public getActivityCount()I
    .locals 1

    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0}, Lcom/android/camera/CameraApplicationDelegate;->getActivityCount()I

    move-result v0

    return v0
.end method

.method public isApplicationFirstLaunched()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    iget-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    xor-int/lit8 v0, v0, 0x1

    return v0

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/CameraAppImpl;->sLaunched:Z

    return v0
.end method

.method public isMainIntentActivityLaunched()Z
    .locals 1

    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0}, Lcom/android/camera/CameraApplicationDelegate;->isMainIntentActivityLaunched()Z

    move-result v0

    return v0
.end method

.method public isNeedRestore()Z
    .locals 1

    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0}, Lcom/android/camera/CameraApplicationDelegate;->getSettingsFlag()Z

    move-result v0

    return v0
.end method

.method public onCreateApplicationDelegate()Lcom/android/camera/CameraApplicationDelegate;
    .locals 1

    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/camera/CameraApplicationDelegate;

    invoke-direct {v0, p0}, Lcom/android/camera/CameraApplicationDelegate;-><init>(Lcom/android/camera/CameraAppImpl;)V

    sput-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    :cond_0
    invoke-static {}, Lcom/android/camera/CrashHandler;->getInstance()Lcom/android/camera/CrashHandler;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/CrashHandler;->init(Lmiui/external/Application;)V

    invoke-static {p0}, Lcom/android/camera/network/util/NetworkUtils;->bind(Landroid/app/Application;)V

    invoke-static {p0}, Lcom/miui/filtersdk/BeautificationSDK;->init(Landroid/content/Context;)V

    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    return-object v0
.end method

.method public bridge synthetic onCreateApplicationDelegate()Lmiui/external/ApplicationDelegate;
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/CameraAppImpl;->onCreateApplicationDelegate()Lcom/android/camera/CameraApplicationDelegate;

    move-result-object v0

    return-object v0
.end method

.method public removeActivity(Landroid/app/Activity;)V
    .locals 1

    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraApplicationDelegate;->removeActivity(Landroid/app/Activity;)V

    return-void
.end method

.method public resetRestoreFlag()V
    .locals 1

    sget-object v0, Lcom/android/camera/CameraAppImpl;->sApplicationDelegate:Lcom/android/camera/CameraApplicationDelegate;

    invoke-virtual {v0}, Lcom/android/camera/CameraApplicationDelegate;->resetRestoreFlag()V

    return-void
.end method
