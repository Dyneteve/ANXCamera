.class public Lcom/bytedance/frameworks/core/monitor/LogStoreManager;
.super Ljava/lang/Object;
.source "LogStoreManager.java"


# static fields
.field static final LOCAL_MONITOR_COLS:[Ljava/lang/String;

.field static final LOCAL_VERSION_COLS:[Ljava/lang/String;

.field private static final ORDER_BY_ID_ASC:Ljava/lang/String; = "_id ASC "

.field static final SAMPLE_LOG_COLS:[Ljava/lang/String;

.field private static SQL_GET_SAMPLED_COUNT:Ljava/lang/String; = null

.field private static SQL_GET_TOTAL_COUNT:Ljava/lang/String; = null

.field private static final TAG:Ljava/lang/String; = "LogStoreManager"

.field static final WEED_OUT_ROWS_SINGLE_TIME:I = 0x3e8

.field private static final mLock:Ljava/lang/Object;

.field private static sLogStoreManagerMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/bytedance/frameworks/core/monitor/LogStoreManager;",
            ">;"
        }
    .end annotation
.end field

.field static sMaxLogSaveCount:J


# instance fields
.field private mAid:Ljava/lang/String;

.field private mDb:Landroid/database/sqlite/SQLiteDatabase;

.field private volatile totalRowCount:J


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const-wide/32 v0, 0x9c40

    sput-wide v0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->sMaxLogSaveCount:J

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->sLogStoreManagerMap:Ljava/util/HashMap;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mLock:Ljava/lang/Object;

    const-string v0, "_id"

    const-string/jumbo v1, "version_id"

    const-string v2, "data"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->LOCAL_MONITOR_COLS:[Ljava/lang/String;

    const-string v0, "_id"

    const-string/jumbo v1, "type"

    const-string/jumbo v2, "version_id"

    const-string v3, "data"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->SAMPLE_LOG_COLS:[Ljava/lang/String;

    const-string v0, "_id"

    const-string/jumbo v1, "version_code"

    const-string/jumbo v2, "version_name"

    const-string v3, "manifest_version_code"

    const-string/jumbo v4, "update_version_code"

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->LOCAL_VERSION_COLS:[Ljava/lang/String;

    const-string v0, "SELECT count(*) from local_monitor_log WHERE is_sampled = 1"

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->SQL_GET_SAMPLED_COUNT:Ljava/lang/String;

    const-string v0, "SELECT count(*) FROM local_monitor_log"

    sput-object v0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->SQL_GET_TOTAL_COUNT:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->totalRowCount:J

    const-string v0, "monitorlib"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LogStoreManager: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " , threadName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    new-instance v0, Lcom/bytedance/frameworks/core/monitor/DBHelper;

    invoke-direct {v0, p1, p2}, Lcom/bytedance/frameworks/core/monitor/DBHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mAid:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/bytedance/frameworks/core/monitor/DBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    iput-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p1, "LogStoreManager"

    const-string p2, "monitor DB build failed"

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method private declared-synchronized closeDatabase()V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    const-string v1, "LogStoreManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mDb close error:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw v0
.end method

.method protected static safeCloseCursor(Landroid/database/Cursor;)V
    .locals 3

    if-eqz p0, :cond_0

    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "LogStoreManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cursor close error:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_0
    :goto_0
    nop

    :goto_1
    return-void
.end method

.method private setMaxLogSaveCount(J)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    const-wide/32 p1, 0x9c40

    sput-wide p1, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->sMaxLogSaveCount:J

    goto :goto_0

    :cond_0
    sput-wide p1, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->sMaxLogSaveCount:J

    :goto_0
    return-void
.end method

.method private declared-synchronized weedOutLogIfNeed(J)V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->totalRowCount:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    invoke-virtual {p0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->getLogTotalCount()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->totalRowCount:J

    :cond_0
    iget-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->totalRowCount:J

    add-long/2addr v0, p1

    sget-wide p1, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->sMaxLogSaveCount:J

    cmp-long p1, v0, p1

    if-ltz p1, :cond_1

    const-wide/16 p1, 0x3e8

    invoke-virtual {p0, p1, p2}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->weedOutOldLogs(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized weedOutVersionTableIfNeed()V
    .locals 10

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "local_monitor_log"

    const-string/jumbo v0, "version_id"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v8, "_id ASC "

    const-string v9, "1"

    invoke-virtual/range {v1 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->weedOutVersionTable(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized cleanExpiredLog(J)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    goto :goto_1

    :cond_0
    :try_start_1
    const-string v0, "create_time< ? "

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string p2, "local_monitor_log"

    invoke-virtual {p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_1
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public closeDB()V
    .locals 2

    sget-object v0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->closeDatabase()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public declared-synchronized deleteLocalLogByIds(Ljava/lang/String;)I
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "delete from local_monitor_log where _id in ( "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " )"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v1, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    nop

    :goto_0
    monitor-exit p0

    return v1

    :cond_1
    :goto_1
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getAid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mAid:Ljava/lang/String;

    return-object v0
.end method

.method public getDBJournalSizeInKB()I
    .locals 3

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "-journal"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    long-to-int v0, v0

    div-int/lit16 v0, v0, 0x400

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public getDBSizeInMB()I
    .locals 4

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    div-long/2addr v0, v2

    long-to-int v0, v0

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public declared-synchronized getLatestLocalVersion()Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;
    .locals 12

    monitor-enter p0

    nop

    const/4 v0, 0x0

    :try_start_0
    const-string v8, "_id DESC"

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "local_monitor_version"

    sget-object v3, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->LOCAL_VERSION_COLS:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v1 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v2
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v2, :cond_0

    nop

    :try_start_2
    invoke-static {v1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_3
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-interface {v1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v2, 0x3

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    new-instance v2, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    move-object v3, v2

    invoke-direct/range {v3 .. v9}, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-static {v1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    monitor-exit p0

    return-object v2

    :cond_1
    :try_start_5
    invoke-static {v1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v2

    goto :goto_1

    :catchall_1
    move-exception v1

    move-object v11, v1

    move-object v1, v0

    move-object v0, v11

    :goto_0
    invoke-static {v1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    throw v0

    :catch_1
    move-exception v1

    move-object v1, v0

    :goto_1
    invoke-static {v1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :goto_2
    nop

    monitor-exit p0

    return-object v0

    :catchall_2
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getLocalLog(JJLjava/util/List;Ljava/lang/String;)Ljava/util/List;
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/bytedance/frameworks/core/monitor/model/LocalLog;",
            ">;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p5

    monitor-enter p0

    :try_start_0
    iget-object v2, v1, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v2, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    monitor-exit p0

    return-object v0

    :cond_0
    const/4 v2, 0x0

    :try_start_1
    const-string v3, "create_time >=? AND create_time <=? "

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x2

    if-eqz v0, :cond_1

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_1

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " AND type2 IN ( "

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ","

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v8

    const-string v9, "?"

    invoke-static {v8, v9}, Ljava/util/Collections;->nCopies(ILjava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-static {v3, v8}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " )"

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v7

    add-int/2addr v7, v6

    new-array v7, v7, [Ljava/lang/String;

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v5

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v4

    move v8, v5

    :goto_0
    invoke-interface/range {p5 .. p5}, Ljava/util/List;->size()I

    move-result v9

    if-ge v8, v9, :cond_2

    add-int/lit8 v9, v8, 0x2

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    aput-object v10, v7, v9

    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_1
    new-array v7, v6, [Ljava/lang/String;

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v7, v5

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v7, v4

    :cond_2
    move-object v11, v3

    move-object v12, v7

    iget-object v8, v1, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v9, "local_monitor_log"

    sget-object v10, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->LOCAL_MONITOR_COLS:[Ljava/lang/String;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const-string v15, "_id ASC "

    move-object/from16 v16, p6

    invoke-virtual/range {v8 .. v16}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_3

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-static {v3}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    monitor-exit p0

    return-object v0

    :cond_3
    :try_start_4
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    :goto_1
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    invoke-interface {v3, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v11, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    invoke-direct {v11}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;-><init>()V

    invoke-virtual {v11, v9, v10}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setVersionId(J)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object v9

    invoke-virtual {v9, v2}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setData(Ljava/lang/String;)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object v2

    invoke-virtual {v2, v7, v8}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->setId(J)Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    :cond_4
    nop

    :try_start_5
    invoke-static {v3}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    move-object v2, v3

    goto :goto_3

    :catch_0
    move-exception v0

    move-object v2, v3

    goto :goto_2

    :catchall_1
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    :goto_2
    :try_start_6
    const-string v3, "LogStoreManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "obtain monitor logs failed:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    invoke-static {v2}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    nop

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    monitor-exit p0

    return-object v0

    :goto_3
    :try_start_8
    invoke-static {v2}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :catchall_2
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getLocalVersionById(J)Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;
    .locals 11

    monitor-enter p0

    nop

    const/4 v0, 0x0

    :try_start_0
    const-string v8, "_id DESC"

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "local_monitor_version"

    sget-object v3, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->LOCAL_VERSION_COLS:[Ljava/lang/String;

    const-string v4, " _id = ?"

    const/4 v10, 0x1

    new-array v5, v10, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v5, p2

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {v1 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v1
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_0

    nop

    :try_start_2
    invoke-static {p1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_3
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-interface {p1, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 p2, 0x2

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 p2, 0x3

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 p2, 0x4

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance p2, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;

    move-object v2, p2

    invoke-direct/range {v2 .. v8}, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    invoke-static {p1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    monitor-exit p0

    return-object p2

    :cond_1
    :try_start_5
    invoke-static {p1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    goto :goto_2

    :catchall_0
    move-exception p2

    move-object v0, p1

    goto :goto_0

    :catch_0
    move-exception p2

    goto :goto_1

    :catchall_1
    move-exception p2

    :goto_0
    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    throw p2

    :catch_1
    move-exception p1

    move-object p1, v0

    :goto_1
    invoke-static {p1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :goto_2
    nop

    monitor-exit p0

    return-object v0

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getLogCountInTime(JJ)J
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-nez v0, :cond_0

    goto :goto_3

    :cond_0
    nop

    const/4 v0, 0x0

    :try_start_1
    const-string v3, "SELECT count(*) FROM local_monitor_log WHERE create_time >= ? AND create_time <= ?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v4, p2

    const/4 p1, 0x1

    invoke-static {p3, p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p3

    aput-object p3, v4, p1

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :cond_1
    move-wide p2, v1

    :goto_0
    :try_start_3
    invoke-static {p1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    monitor-exit p0

    return-wide p2

    :catchall_0
    move-exception p2

    move-object v0, p1

    goto :goto_1

    :catch_0
    move-exception p2

    move-object v0, p1

    goto :goto_2

    :catchall_1
    move-exception p2

    :goto_1
    :try_start_4
    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    throw p2

    :catch_1
    move-exception p1

    :goto_2
    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    nop

    monitor-exit p0

    return-wide v1

    :cond_2
    :goto_3
    monitor-exit p0

    return-wide v1

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getLogSampled(Ljava/util/List;I)Ljava/util/List;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)",
            "Ljava/util/List<",
            "Lcom/bytedance/frameworks/core/monitor/model/LocalLog;",
            ">;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    monitor-enter p0

    :try_start_0
    iget-object v2, v1, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v2, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    monitor-exit p0

    return-object v0

    :cond_0
    const/4 v2, 0x0

    :try_start_1
    const-string v3, "is_sampled = ? "

    nop

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v0, :cond_1

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " AND type IN ( "

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ","

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v7

    const-string v8, "?"

    invoke-static {v7, v8}, Ljava/util/Collections;->nCopies(ILjava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-static {v3, v7}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ) "

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v6

    add-int/2addr v6, v5

    new-array v6, v6, [Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    move v7, v4

    :goto_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v8

    if-ge v7, v8, :cond_2

    add-int/lit8 v8, v7, 0x1

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    aput-object v7, v6, v8

    move v7, v8

    goto :goto_0

    :cond_1
    new-array v6, v5, [Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v6, v4

    :cond_2
    move-object v10, v3

    move-object v11, v6

    iget-object v7, v1, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v8, "local_monitor_log"

    sget-object v9, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->SAMPLE_LOG_COLS:[Ljava/lang/String;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const-string v14, "_id ASC "

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v3, p2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual/range {v7 .. v15}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_3

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-static {v3}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    monitor-exit p0

    return-object v0

    :cond_3
    :try_start_4
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    :goto_1
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v2, 0x2

    invoke-interface {v3, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    const/4 v2, 0x3

    invoke-interface {v3, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    new-instance v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    move-object v6, v2

    invoke-direct/range {v6 .. v12}, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;-><init>(JLjava/lang/String;JLjava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    :cond_4
    nop

    :try_start_5
    invoke-static {v3}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    move-object v2, v3

    goto :goto_3

    :catch_0
    move-exception v0

    move-object v2, v3

    goto :goto_2

    :catchall_1
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    :goto_2
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    const-string v3, "LogStoreManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "obtain monitor logs failed:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :try_start_7
    invoke-static {v2}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    nop

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    monitor-exit p0

    return-object v0

    :goto_3
    :try_start_8
    invoke-static {v2}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :catchall_2
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getLogSampledCount()J
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-nez v0, :cond_0

    goto :goto_3

    :cond_0
    nop

    nop

    const/4 v0, 0x0

    :try_start_1
    iget-object v3, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    sget-object v4, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->SQL_GET_SAMPLED_COUNT:Ljava/lang/String;

    invoke-virtual {v3, v4, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-wide v1, v4

    :cond_1
    :try_start_3
    invoke-static {v3}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    goto :goto_2

    :catchall_0
    move-exception v0

    move-object v1, v0

    move-object v0, v3

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v0, v3

    goto :goto_1

    :catchall_1
    move-exception v1

    :goto_0
    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    throw v1

    :catch_1
    move-exception v3

    :goto_1
    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :goto_2
    nop

    monitor-exit p0

    return-wide v1

    :cond_2
    :goto_3
    monitor-exit p0

    return-wide v1

    :catchall_2
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getLogTotalCount()J
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    nop

    nop

    const/4 v0, 0x0

    :try_start_1
    iget-object v3, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    sget-object v4, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->SQL_GET_TOTAL_COUNT:Ljava/lang/String;

    invoke-virtual {v3, v4, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    invoke-interface {v3, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-wide v1, v4

    :cond_1
    :try_start_3
    invoke-static {v3}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    monitor-exit p0

    return-wide v1

    :catchall_0
    move-exception v0

    move-object v1, v0

    move-object v0, v3

    goto :goto_0

    :catch_0
    move-exception v0

    move-object v0, v3

    goto :goto_1

    :catchall_1
    move-exception v1

    :goto_0
    :try_start_4
    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V

    throw v1

    :catch_1
    move-exception v3

    :goto_1
    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->safeCloseCursor(Landroid/database/Cursor;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    nop

    monitor-exit p0

    return-wide v1

    :cond_2
    :goto_2
    monitor-exit p0

    return-wide v1

    :catchall_2
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized insertLocalLog(Lcom/bytedance/frameworks/core/monitor/model/LocalLog;)J
    .locals 9

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const-wide/16 v3, 0x1

    :try_start_1
    invoke-direct {p0, v3, v4}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->weedOutLogIfNeed(J)V

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string/jumbo v5, "type"

    iget-object v6, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type:Ljava/lang/String;

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v5, "type2"

    iget-object v6, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type2:Ljava/lang/String;

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "create_time"

    iget-wide v6, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->createTime:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string/jumbo v5, "version_id"

    iget-wide v6, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v5, "data"

    iget-object v6, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->data:Ljava/lang/String;

    invoke-virtual {v0, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "is_sampled"

    iget-boolean p1, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->isSampled:Z

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v5, "local_monitor_log"

    const/4 v6, 0x0

    invoke-virtual {p1, v5, v6, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v5

    cmp-long p1, v5, v1

    if-eqz p1, :cond_1

    iget-wide v7, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->totalRowCount:J

    add-long/2addr v7, v3

    iput-wide v7, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->totalRowCount:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit p0

    return-wide v5

    :catch_0
    move-exception p1

    monitor-exit p0

    return-wide v1

    :cond_2
    :goto_0
    monitor-exit p0

    return-wide v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected declared-synchronized insertLocalLogBatch(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/bytedance/frameworks/core/monitor/model/LocalLog;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_6

    if-eqz p1, :cond_6

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_9

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    int-to-long v0, v0

    invoke-direct {p0, v0, v1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->weedOutLogIfNeed(J)V

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-string v1, "INSERT INTO local_monitor_log(type, type2, create_time, version_id, data, is_sampled) VALUES ( ?, ?, ?, ?, ?, ?)"

    iget-object v2, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;

    const/4 v3, 0x1

    iget-object v4, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type:Ljava/lang/String;

    if-nez v4, :cond_1

    const-string v4, ""

    goto :goto_1

    :cond_1
    iget-object v4, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type:Ljava/lang/String;

    :goto_1
    invoke-virtual {v1, v3, v4}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/4 v3, 0x2

    iget-object v4, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type2:Ljava/lang/String;

    if-nez v4, :cond_2

    const-string v4, ""

    goto :goto_2

    :cond_2
    iget-object v4, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->type2:Ljava/lang/String;

    :goto_2
    invoke-virtual {v1, v3, v4}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/4 v3, 0x3

    iget-wide v4, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->createTime:J

    invoke-virtual {v1, v3, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v3, 0x4

    iget-wide v4, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->versionId:J

    invoke-virtual {v1, v3, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    const/4 v3, 0x5

    iget-object v4, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->data:Ljava/lang/String;

    if-nez v4, :cond_3

    const-string v4, ""

    goto :goto_3

    :cond_3
    iget-object v4, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->data:Ljava/lang/String;

    :goto_3
    invoke-virtual {v1, v3, v4}, Landroid/database/sqlite/SQLiteStatement;->bindString(ILjava/lang/String;)V

    const/4 v3, 0x6

    iget-boolean v2, v2, Lcom/bytedance/frameworks/core/monitor/model/LocalLog;->isSampled:Z

    if-eqz v2, :cond_4

    const-wide/16 v4, 0x1

    goto :goto_4

    :cond_4
    const-wide/16 v4, 0x0

    :goto_4
    invoke-virtual {v1, v3, v4, v5}, Landroid/database/sqlite/SQLiteStatement;->bindLong(IJ)V

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    goto :goto_0

    :cond_5
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    iget-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->totalRowCount:J

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->totalRowCount:J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_5

    :catchall_0
    move-exception p1

    goto :goto_7

    :catch_0
    move-exception p1

    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :goto_5
    goto :goto_6

    :catch_1
    move-exception p1

    nop

    :goto_6
    monitor-exit p0

    return-void

    :goto_7
    nop

    :try_start_5
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_8

    :catch_2
    move-exception v0

    :goto_8
    :try_start_6
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :cond_6
    :goto_9
    monitor-exit p0

    return-void

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized saveLocalVersion(Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;)J
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionCode:Ljava/lang/String;

    iget-object v1, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->versionName:Ljava/lang/String;

    iget-object v2, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->manifestVersionCode:Ljava/lang/String;

    iget-object p1, p1, Lcom/bytedance/frameworks/core/monitor/model/LocalVersionInfo;->updateVersionCode:Ljava/lang/String;

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->saveLocalVersion(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :cond_1
    :goto_0
    const-wide/16 v0, -0x1

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized saveLocalVersion(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v1, -0x1

    if-nez v0, :cond_0

    monitor-exit p0

    return-wide v1

    :cond_0
    :try_start_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string/jumbo v3, "version_code"

    invoke-virtual {v0, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo p1, "version_name"

    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "manifest_version_code"

    invoke-virtual {v0, p1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo p1, "update_version_code"

    invoke-virtual {v0, p1, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string p2, "local_monitor_version"

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-wide p1

    :catch_0
    move-exception p1

    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-wide v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public updateConfig()V
    .locals 2

    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mAid:Ljava/lang/String;

    invoke-static {v0}, Lcom/bytedance/frameworks/core/monitor/config/MonitorConfigure;->getMaxMonitorLogSaveCount(Ljava/lang/String;)J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->setMaxLogSaveCount(J)V

    return-void
.end method

.method public declared-synchronized weedOutOldLogs(J)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    goto :goto_1

    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " DELETE FROM local_monitor_log WHERE _id IN (SELECT _id FROM local_monitor_log ORDER BY _id ASC LIMIT "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->totalRowCount:J

    sub-long/2addr v0, p1

    iput-wide v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->totalRowCount:J

    invoke-direct {p0}, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->weedOutVersionTableIfNeed()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_1
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized weedOutVersionTable(J)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    goto :goto_1

    :cond_0
    :try_start_1
    const-string v0, "_id< ? "

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    iget-object p1, p0, Lcom/bytedance/frameworks/core/monitor/LogStoreManager;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string p2, "local_monitor_version"

    invoke-virtual {p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :goto_0
    monitor-exit p0

    return-void

    :cond_1
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
