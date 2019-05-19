.class public Lcom/ss/android/ttve/common/TESpdLogManager;
.super Ljava/lang/Object;
.source "TESpdLogManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/common/TESpdLogManager$InfoLevel;
    }
.end annotation


# static fields
.field private static volatile mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;


# instance fields
.field private mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

.field private mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/ss/android/ttve/common/TESpdLogInvoker;

    invoke-direct {v0}, Lcom/ss/android/ttve/common/TESpdLogInvoker;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    new-instance v0, Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-direct {v0}, Lcom/ss/android/medialib/SpdLogInvoker;-><init>()V

    iput-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    return-void
.end method

.method public static getInstance()Lcom/ss/android/ttve/common/TESpdLogManager;
    .locals 2

    sget-object v0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;

    if-nez v0, :cond_1

    const-class v0, Lcom/ss/android/ttve/common/TESpdLogManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/ss/android/ttve/common/TESpdLogManager;

    invoke-direct {v1}, Lcom/ss/android/ttve/common/TESpdLogManager;-><init>()V

    sput-object v1, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdManager:Lcom/ss/android/ttve/common/TESpdLogManager;

    return-object v0
.end method

.method public static getLogFiles(Ljava/lang/String;)[Ljava/lang/String;
    .locals 7

    const-string v0, ".txt"

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    new-array p0, v2, [Ljava/lang/String;

    return-object p0

    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {v1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move v4, v2

    :goto_0
    array-length v5, v1

    if-ge v4, v5, :cond_2

    aget-object v5, v1, v4

    invoke-virtual {v5, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v6, v1, v4

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    new-array p0, v2, [Ljava/lang/String;

    invoke-interface {v3, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    return-object p0

    :cond_3
    new-array p0, v2, [Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public close()V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->close()V

    iget-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-virtual {v0}, Lcom/ss/android/medialib/SpdLogInvoker;->close()V

    return-void
.end method

.method public error(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->error(Ljava/lang/String;)I

    return-void
.end method

.method public info(Lcom/ss/android/ttve/common/TESpdLogManager$InfoLevel;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/ss/android/ttve/common/TESpdLogManager$1;->$SwitchMap$com$ss$android$ttve$common$TESpdLogManager$InfoLevel:[I

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TESpdLogManager$InfoLevel;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    const-string p1, "TESpdLogManager"

    const-string p2, "\u9519\u8bef\u7684\u7b49\u7ea7"

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x3

    invoke-virtual {p1, v0, p2}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->info(ILjava/lang/String;)I

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x2

    invoke-virtual {p1, v0, p2}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->info(ILjava/lang/String;)I

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x1

    invoke-virtual {p1, v0, p2}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->info(ILjava/lang/String;)I

    nop

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public initSpdLog(Ljava/lang/String;II)I
    .locals 3

    const-string v0, "TESpdLogManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "logDir: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    invoke-virtual {v0, p1, p2, p3}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->initSpdLog(Ljava/lang/String;II)I

    move-result v0

    iget-object v1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-virtual {v1, p1, p2, p3}, Lcom/ss/android/medialib/SpdLogInvoker;->initSpdLog(Ljava/lang/String;II)I

    move-result p1

    if-gez v0, :cond_0

    return v0

    :cond_0
    if-gez p1, :cond_1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public setLevel(Lcom/ss/android/ttve/common/TESpdLogManager$InfoLevel;)V
    .locals 1

    sget-object v0, Lcom/ss/android/ttve/common/TESpdLogManager$1;->$SwitchMap$com$ss$android$ttve$common$TESpdLogManager$InfoLevel:[I

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TESpdLogManager$InfoLevel;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    const-string p1, "TESpdLogManager"

    const-string v0, "\u9519\u8bef\u7684\u7b49\u7ea7"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->setLevel(I)V

    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-virtual {p1, v0}, Lcom/ss/android/medialib/SpdLogInvoker;->setLevel(I)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->setLevel(I)V

    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-virtual {p1, v0}, Lcom/ss/android/medialib/SpdLogInvoker;->setLevel(I)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->setLevel(I)V

    iget-object p1, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mEditor1SpdLogInvoker:Lcom/ss/android/medialib/SpdLogInvoker;

    invoke-virtual {p1, v0}, Lcom/ss/android/medialib/SpdLogInvoker;->setLevel(I)V

    nop

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public warn(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/common/TESpdLogManager;->mTESpdLogInvoker:Lcom/ss/android/ttve/common/TESpdLogInvoker;

    invoke-virtual {v0, p1}, Lcom/ss/android/ttve/common/TESpdLogInvoker;->warn(Ljava/lang/String;)I

    return-void
.end method
