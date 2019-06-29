.class public Lcom/android/camera/snap/SnapService;
.super Landroid/app/job/JobService;
.source "SnapService.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x15
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/snap/SnapService$InnerHandler;
    }
.end annotation


# static fields
.field public static final END:I = 0x65

.field public static final MAX_DELAY:I = 0x1388

.field private static final TAG:Ljava/lang/String;

.field public static final mJobId:I = 0x1

.field private static mJobScheduler:Landroid/app/job/JobScheduler;

.field private static mScreenOn:Z


# instance fields
.field private final mHandler:Lcom/android/camera/snap/SnapService$InnerHandler;

.field private mJobParameters:Landroid/app/job/JobParameters;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mRegistered:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/snap/SnapService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/snap/SnapService;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    new-instance v0, Lcom/android/camera/snap/SnapService$InnerHandler;

    invoke-direct {v0, p0}, Lcom/android/camera/snap/SnapService$InnerHandler;-><init>(Lcom/android/camera/snap/SnapService;)V

    iput-object v0, p0, Lcom/android/camera/snap/SnapService;->mHandler:Lcom/android/camera/snap/SnapService$InnerHandler;

    new-instance v0, Lcom/android/camera/snap/SnapService$1;

    invoke-direct {v0, p0}, Lcom/android/camera/snap/SnapService$1;-><init>(Lcom/android/camera/snap/SnapService;)V

    iput-object v0, p0, Lcom/android/camera/snap/SnapService;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/snap/SnapService;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100()Landroid/app/job/JobScheduler;
    .locals 1

    sget-object v0, Lcom/android/camera/snap/SnapService;->mJobScheduler:Landroid/app/job/JobScheduler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/camera/snap/SnapService;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/snap/SnapService;->destroy()V

    return-void
.end method

.method private destroy()V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/snap/SnapService;->unregisterPowerKeyReceiver()V

    iget-object v0, p0, Lcom/android/camera/snap/SnapService;->mHandler:Lcom/android/camera/snap/SnapService$InnerHandler;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Lcom/android/camera/snap/SnapService$InnerHandler;->removeMessages(I)V

    invoke-static {}, Lcom/android/camera/snap/SnapTrigger;->destroy()V

    return-void
.end method

.method private jobFinished()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/snap/SnapService;->mJobParameters:Landroid/app/job/JobParameters;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/snap/SnapService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    return-void
.end method

.method private registerPowerKeyReceiver()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/snap/SnapService;->mRegistered:Z

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.KEYCODE_POWER_UP"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/camera/snap/SnapService;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/snap/SnapService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/snap/SnapService;->mRegistered:Z

    :cond_0
    return-void
.end method

.method public static setScreenOn(Z)V
    .locals 0

    sput-boolean p0, Lcom/android/camera/snap/SnapService;->mScreenOn:Z

    return-void
.end method

.method public static startJob(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 3

    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/camera/snap/SnapService;->mScreenOn:Z

    const-string v0, "jobscheduler"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    sput-object v0, Lcom/android/camera/snap/SnapService;->mJobScheduler:Landroid/app/job/JobScheduler;

    new-instance v0, Landroid/app/job/JobInfo$Builder;

    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lcom/android/camera/snap/SnapService;

    invoke-direct {v1, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p0, 0x1

    invoke-direct {v0, p0, v1}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    invoke-virtual {v0, p1}, Landroid/app/job/JobInfo$Builder;->setTransientExtras(Landroid/os/Bundle;)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/app/job/JobInfo$Builder;->setOverrideDeadline(J)Landroid/app/job/JobInfo$Builder;

    sget-object p0, Lcom/android/camera/snap/SnapService;->mJobScheduler:Landroid/app/job/JobScheduler;

    invoke-virtual {v0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    return-void
.end method

.method private triggerWatchdog()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/snap/SnapService;->mHandler:Lcom/android/camera/snap/SnapService$InnerHandler;

    const/16 v1, 0x65

    invoke-virtual {v0, v1}, Lcom/android/camera/snap/SnapService$InnerHandler;->removeMessages(I)V

    iget-object v0, p0, Lcom/android/camera/snap/SnapService;->mHandler:Lcom/android/camera/snap/SnapService$InnerHandler;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/snap/SnapService$InnerHandler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private unregisterPowerKeyReceiver()V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/snap/SnapService;->mRegistered:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/snap/SnapService;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/camera/snap/SnapService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/snap/SnapService;->mRegistered:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public onDestroy()V
    .locals 0

    invoke-super {p0}, Landroid/app/job/JobService;->onDestroy()V

    invoke-direct {p0}, Lcom/android/camera/snap/SnapService;->destroy()V

    return-void
.end method

.method public onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 6

    sget-object v0, Lcom/android/camera/snap/SnapService;->TAG:Ljava/lang/String;

    const-string v1, "onStartJob"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/android/camera/snap/SnapService;->mJobParameters:Landroid/app/job/JobParameters;

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getTransientExtras()Landroid/os/Bundle;

    move-result-object p1

    invoke-static {p0}, Lcom/android/camera/storage/Storage;->initStorage(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/android/camera/snap/SnapService;->triggerWatchdog()V

    sget-boolean v0, Lcom/android/camera/snap/SnapService;->mScreenOn:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lcom/android/camera/snap/SnapTrigger;->getInstance()Lcom/android/camera/snap/SnapTrigger;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/snap/SnapService;->mHandler:Lcom/android/camera/snap/SnapService$InnerHandler;

    invoke-virtual {v0, p0, v2}, Lcom/android/camera/snap/SnapTrigger;->init(Landroid/content/Context;Landroid/os/Handler;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/android/camera/snap/SnapTrigger;->getInstance()Lcom/android/camera/snap/SnapTrigger;

    move-result-object v0

    const-string v2, "key_code"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    const-string v3, "key_action"

    invoke-virtual {p1, v3, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "key_event_time"

    const-wide/16 v4, 0x0

    invoke-virtual {p1, v3, v4, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-virtual {v0, v2, v1, v3, v4}, Lcom/android/camera/snap/SnapTrigger;->handleKeyEvent(IIJ)V

    invoke-direct {p0}, Lcom/android/camera/snap/SnapService;->registerPowerKeyReceiver()V

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 1

    sget-object p1, Lcom/android/camera/snap/SnapService;->TAG:Ljava/lang/String;

    const-string v0, "onStopJob"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/snap/SnapService;->destroy()V

    const/4 p1, 0x0

    return p1
.end method
