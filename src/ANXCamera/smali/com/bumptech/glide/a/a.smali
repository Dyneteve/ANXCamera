.class public final Lcom/bumptech/glide/a/a;
.super Ljava/lang/Object;
.source "DiskLruCache.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/a/a$a;,
        Lcom/bumptech/glide/a/a$c;,
        Lcom/bumptech/glide/a/a$b;,
        Lcom/bumptech/glide/a/a$d;
    }
.end annotation


# static fields
.field static final ANY_SEQUENCE_NUMBER:J = -0x1L

.field private static final CLEAN:Ljava/lang/String; = "CLEAN"

.field private static final DIRTY:Ljava/lang/String; = "DIRTY"

.field static final JOURNAL_FILE:Ljava/lang/String; = "journal"

.field static final JOURNAL_FILE_BACKUP:Ljava/lang/String; = "journal.bkp"

.field static final JOURNAL_FILE_TEMP:Ljava/lang/String; = "journal.tmp"

.field static final MAGIC:Ljava/lang/String; = "libcore.io.DiskLruCache"

.field private static final READ:Ljava/lang/String; = "READ"

.field private static final REMOVE:Ljava/lang/String; = "REMOVE"

.field static final VERSION_1:Ljava/lang/String; = "1"


# instance fields
.field private final appVersion:I

.field private cV:Ljava/io/Writer;

.field final cW:Ljava/util/concurrent/ThreadPoolExecutor;

.field private final cX:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private final directory:Ljava/io/File;

.field private final journalFile:Ljava/io/File;

.field private final journalFileBackup:Ljava/io/File;

.field private final journalFileTmp:Ljava/io/File;

.field private final lruEntries:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Lcom/bumptech/glide/a/a$c;",
            ">;"
        }
    .end annotation
.end field

.field private maxSize:J

.field private nextSequenceNumber:J

.field private redundantOpCount:I

.field private size:J

.field private final valueCount:I


# direct methods
.method private constructor <init>(Ljava/io/File;IIJ)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v2, 0x0

    iput-wide v2, v0, Lcom/bumptech/glide/a/a;->size:J

    new-instance v4, Ljava/util/LinkedHashMap;

    const/4 v5, 0x0

    const/high16 v6, 0x3f400000    # 0.75f

    const/4 v7, 0x1

    invoke-direct {v4, v5, v6, v7}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v4, v0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    iput-wide v2, v0, Lcom/bumptech/glide/a/a;->nextSequenceNumber:J

    new-instance v2, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v13, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v14, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v14}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    new-instance v15, Lcom/bumptech/glide/a/a$a;

    const/4 v3, 0x0

    invoke-direct {v15, v3}, Lcom/bumptech/glide/a/a$a;-><init>(Lcom/bumptech/glide/a/a$1;)V

    const/4 v9, 0x0

    const/4 v10, 0x1

    const-wide/16 v11, 0x3c

    move-object v8, v2

    invoke-direct/range {v8 .. v15}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v2, v0, Lcom/bumptech/glide/a/a;->cW:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v2, Lcom/bumptech/glide/a/a$1;

    invoke-direct {v2, v0}, Lcom/bumptech/glide/a/a$1;-><init>(Lcom/bumptech/glide/a/a;)V

    iput-object v2, v0, Lcom/bumptech/glide/a/a;->cX:Ljava/util/concurrent/Callable;

    iput-object v1, v0, Lcom/bumptech/glide/a/a;->directory:Ljava/io/File;

    move/from16 v2, p2

    iput v2, v0, Lcom/bumptech/glide/a/a;->appVersion:I

    new-instance v2, Ljava/io/File;

    const-string v3, "journal"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, v0, Lcom/bumptech/glide/a/a;->journalFile:Ljava/io/File;

    new-instance v2, Ljava/io/File;

    const-string v3, "journal.tmp"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, v0, Lcom/bumptech/glide/a/a;->journalFileTmp:Ljava/io/File;

    new-instance v2, Ljava/io/File;

    const-string v3, "journal.bkp"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, v0, Lcom/bumptech/glide/a/a;->journalFileBackup:Ljava/io/File;

    move/from16 v1, p3

    iput v1, v0, Lcom/bumptech/glide/a/a;->valueCount:I

    move-wide/from16 v1, p4

    iput-wide v1, v0, Lcom/bumptech/glide/a/a;->maxSize:J

    return-void
.end method

.method static synthetic a(Lcom/bumptech/glide/a/a;I)I
    .locals 0

    iput p1, p0, Lcom/bumptech/glide/a/a;->redundantOpCount:I

    return p1
.end method

.method static synthetic a(Lcom/bumptech/glide/a/a;Ljava/lang/String;J)Lcom/bumptech/glide/a/a$b;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Lcom/bumptech/glide/a/a;->a(Ljava/lang/String;J)Lcom/bumptech/glide/a/a$b;

    move-result-object p0

    return-object p0
.end method

.method private declared-synchronized a(Ljava/lang/String;J)Lcom/bumptech/glide/a/a$b;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->checkNotClosed()V

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/a/a$c;

    const-wide/16 v1, -0x1

    cmp-long v1, p2, v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->e(Lcom/bumptech/glide/a/a$c;)J

    move-result-wide v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long p2, v3, p2

    if-eqz p2, :cond_1

    :cond_0
    monitor-exit p0

    return-object v2

    :cond_1
    if-nez v0, :cond_2

    :try_start_1
    new-instance v0, Lcom/bumptech/glide/a/a$c;

    invoke-direct {v0, p0, p1, v2}, Lcom/bumptech/glide/a/a$c;-><init>(Lcom/bumptech/glide/a/a;Ljava/lang/String;Lcom/bumptech/glide/a/a$1;)V

    iget-object p2, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {p2, p1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;)Lcom/bumptech/glide/a/a$b;

    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p2, :cond_3

    monitor-exit p0

    return-object v2

    :cond_3
    :goto_0
    :try_start_2
    new-instance p2, Lcom/bumptech/glide/a/a$b;

    invoke-direct {p2, p0, v0, v2}, Lcom/bumptech/glide/a/a$b;-><init>(Lcom/bumptech/glide/a/a;Lcom/bumptech/glide/a/a$c;Lcom/bumptech/glide/a/a$1;)V

    invoke-static {v0, p2}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;Lcom/bumptech/glide/a/a$b;)Lcom/bumptech/glide/a/a$b;

    iget-object p3, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    const-string v0, "DIRTY"

    invoke-virtual {p3, v0}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    iget-object p3, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    const/16 v0, 0x20

    invoke-virtual {p3, v0}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    iget-object p3, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {p3, p1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    const/16 p3, 0xa

    invoke-virtual {p1, p3}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {p1}, Ljava/io/Writer;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object p2

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public static a(Ljava/io/File;IIJ)Lcom/bumptech/glide/a/a;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-lez v0, :cond_4

    if-lez p2, :cond_3

    new-instance v0, Ljava/io/File;

    const-string v1, "journal.bkp"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/io/File;

    const-string v2, "journal"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/bumptech/glide/a/a;->a(Ljava/io/File;Ljava/io/File;Z)V

    :cond_1
    :goto_0
    new-instance v0, Lcom/bumptech/glide/a/a;

    move-object v3, v0

    move-object v4, p0

    move v5, p1

    move v6, p2

    move-wide v7, p3

    invoke-direct/range {v3 .. v8}, Lcom/bumptech/glide/a/a;-><init>(Ljava/io/File;IIJ)V

    iget-object v1, v0, Lcom/bumptech/glide/a/a;->journalFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    :try_start_0
    invoke-direct {v0}, Lcom/bumptech/glide/a/a;->readJournal()V

    invoke-direct {v0}, Lcom/bumptech/glide/a/a;->processJournal()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v1

    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "DiskLruCache "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " is corrupt: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", removing"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/bumptech/glide/a/a;->delete()V

    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    new-instance v0, Lcom/bumptech/glide/a/a;

    move-object v3, v0

    move-object v4, p0

    move v5, p1

    move v6, p2

    move-wide v7, p3

    invoke-direct/range {v3 .. v8}, Lcom/bumptech/glide/a/a;-><init>(Ljava/io/File;IIJ)V

    invoke-direct {v0}, Lcom/bumptech/glide/a/a;->rebuildJournal()V

    return-object v0

    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p1, "valueCount <= 0"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "maxSize <= 0"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static synthetic a(Lcom/bumptech/glide/a/a;)Ljava/io/Writer;
    .locals 0

    iget-object p0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    return-object p0
.end method

.method private declared-synchronized a(Lcom/bumptech/glide/a/a$b;Z)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Lcom/bumptech/glide/a/a$b;->a(Lcom/bumptech/glide/a/a$b;)Lcom/bumptech/glide/a/a$c;

    move-result-object v0

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;)Lcom/bumptech/glide/a/a$b;

    move-result-object v1

    if-ne v1, p1, :cond_a

    const/4 v1, 0x0

    if-eqz p2, :cond_2

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->d(Lcom/bumptech/glide/a/a$c;)Z

    move-result v2

    if-nez v2, :cond_2

    move v2, v1

    :goto_0
    iget v3, p0, Lcom/bumptech/glide/a/a;->valueCount:I

    if-ge v2, v3, :cond_2

    invoke-static {p1}, Lcom/bumptech/glide/a/a$b;->b(Lcom/bumptech/glide/a/a$b;)[Z

    move-result-object v3

    aget-boolean v3, v3, v2

    if-eqz v3, :cond_1

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/a/a$c;->p(I)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p1}, Lcom/bumptech/glide/a/a$b;->abort()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcom/bumptech/glide/a/a$b;->abort()V

    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Newly created entry didn\'t create value for index "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_1
    iget p1, p0, Lcom/bumptech/glide/a/a;->valueCount:I

    if-ge v1, p1, :cond_5

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/a/a$c;->p(I)Ljava/io/File;

    move-result-object p1

    if-eqz p2, :cond_3

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/a/a$c;->o(I)Ljava/io/File;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->b(Lcom/bumptech/glide/a/a$c;)[J

    move-result-object p1

    aget-wide v3, p1, v1

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v5

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->b(Lcom/bumptech/glide/a/a$c;)[J

    move-result-object p1

    aput-wide v5, p1, v1

    iget-wide v7, p0, Lcom/bumptech/glide/a/a;->size:J

    sub-long/2addr v7, v3

    add-long/2addr v7, v5

    iput-wide v7, p0, Lcom/bumptech/glide/a/a;->size:J

    goto :goto_2

    :cond_3
    invoke-static {p1}, Lcom/bumptech/glide/a/a;->c(Ljava/io/File;)V

    :cond_4
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_5
    iget p1, p0, Lcom/bumptech/glide/a/a;->redundantOpCount:I

    const/4 v1, 0x1

    add-int/2addr p1, v1

    iput p1, p0, Lcom/bumptech/glide/a/a;->redundantOpCount:I

    const/4 p1, 0x0

    invoke-static {v0, p1}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;Lcom/bumptech/glide/a/a$b;)Lcom/bumptech/glide/a/a$b;

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->d(Lcom/bumptech/glide/a/a$c;)Z

    move-result p1

    or-int/2addr p1, p2

    const/16 v2, 0xa

    const/16 v3, 0x20

    if-eqz p1, :cond_6

    invoke-static {v0, v1}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;Z)Z

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    const-string v1, "CLEAN"

    invoke-virtual {p1, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {p1, v3}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->c(Lcom/bumptech/glide/a/a$c;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {v0}, Lcom/bumptech/glide/a/a$c;->aq()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {p1, v2}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    if-eqz p2, :cond_7

    iget-wide p1, p0, Lcom/bumptech/glide/a/a;->nextSequenceNumber:J

    const-wide/16 v1, 0x1

    add-long/2addr v1, p1

    iput-wide v1, p0, Lcom/bumptech/glide/a/a;->nextSequenceNumber:J

    invoke-static {v0, p1, p2}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;J)J

    goto :goto_3

    :cond_6
    iget-object p1, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->c(Lcom/bumptech/glide/a/a$c;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    const-string p2, "REMOVE"

    invoke-virtual {p1, p2}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {p1, v3}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->c(Lcom/bumptech/glide/a/a$c;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {p1, v2}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    :cond_7
    :goto_3
    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {p1}, Ljava/io/Writer;->flush()V

    iget-wide p1, p0, Lcom/bumptech/glide/a/a;->size:J

    iget-wide v0, p0, Lcom/bumptech/glide/a/a;->maxSize:J

    cmp-long p1, p1, v0

    if-gtz p1, :cond_8

    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->journalRebuildRequired()Z

    move-result p1

    if-eqz p1, :cond_9

    :cond_8
    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cW:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object p2, p0, Lcom/bumptech/glide/a/a;->cX:Ljava/util/concurrent/Callable;

    invoke-virtual {p1, p2}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_9
    monitor-exit p0

    return-void

    :cond_a
    :try_start_2
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method static synthetic a(Lcom/bumptech/glide/a/a;Lcom/bumptech/glide/a/a$b;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/bumptech/glide/a/a;->a(Lcom/bumptech/glide/a/a$b;Z)V

    return-void
.end method

.method private static a(Ljava/io/File;Ljava/io/File;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p2, :cond_0

    invoke-static {p1}, Lcom/bumptech/glide/a/a;->c(Ljava/io/File;)V

    :cond_0
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0

    if-eqz p0, :cond_1

    return-void

    :cond_1
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
.end method

.method static synthetic b(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p0}, Lcom/bumptech/glide/a/a;->inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic b(Lcom/bumptech/glide/a/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->trimToSize()V

    return-void
.end method

.method private static c(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0

    :cond_1
    :goto_0
    return-void
.end method

.method static synthetic c(Lcom/bumptech/glide/a/a;)Z
    .locals 0

    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->journalRebuildRequired()Z

    move-result p0

    return p0
.end method

.method private checkNotClosed()V
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cache is closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic d(Lcom/bumptech/glide/a/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->rebuildJournal()V

    return-void
.end method

.method static synthetic e(Lcom/bumptech/glide/a/a;)I
    .locals 0

    iget p0, p0, Lcom/bumptech/glide/a/a;->valueCount:I

    return p0
.end method

.method static synthetic f(Lcom/bumptech/glide/a/a;)Ljava/io/File;
    .locals 0

    iget-object p0, p0, Lcom/bumptech/glide/a/a;->directory:Ljava/io/File;

    return-object p0
.end method

.method private static inputStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/io/InputStreamReader;

    sget-object v1, Lcom/bumptech/glide/a/c;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-static {v0}, Lcom/bumptech/glide/a/c;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private journalRebuildRequired()Z
    .locals 2

    nop

    iget v0, p0, Lcom/bumptech/glide/a/a;->redundantOpCount:I

    const/16 v1, 0x7d0

    if-lt v0, v1, :cond_0

    iget v0, p0, Lcom/bumptech/glide/a/a;->redundantOpCount:I

    iget-object v1, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private processJournal()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->journalFileTmp:Ljava/io/File;

    invoke-static {v0}, Lcom/bumptech/glide/a/a;->c(Ljava/io/File;)V

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/a/a$c;

    invoke-static {v1}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;)Lcom/bumptech/glide/a/a$b;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    :goto_1
    iget v2, p0, Lcom/bumptech/glide/a/a;->valueCount:I

    if-ge v3, v2, :cond_2

    iget-wide v4, p0, Lcom/bumptech/glide/a/a;->size:J

    invoke-static {v1}, Lcom/bumptech/glide/a/a$c;->b(Lcom/bumptech/glide/a/a$c;)[J

    move-result-object v2

    aget-wide v6, v2, v3

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/bumptech/glide/a/a;->size:J

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_0
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;Lcom/bumptech/glide/a/a$b;)Lcom/bumptech/glide/a/a$b;

    :goto_2
    iget v2, p0, Lcom/bumptech/glide/a/a;->valueCount:I

    if-ge v3, v2, :cond_1

    invoke-virtual {v1, v3}, Lcom/bumptech/glide/a/a$c;->o(I)Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lcom/bumptech/glide/a/a;->c(Ljava/io/File;)V

    invoke-virtual {v1, v3}, Lcom/bumptech/glide/a/a$c;->p(I)Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lcom/bumptech/glide/a/a;->c(Ljava/io/File;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    :cond_2
    goto :goto_0

    :cond_3
    return-void
.end method

.method private readJournal()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/bumptech/glide/a/b;

    new-instance v1, Ljava/io/FileInputStream;

    iget-object v2, p0, Lcom/bumptech/glide/a/a;->journalFile:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    sget-object v2, Lcom/bumptech/glide/a/c;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Lcom/bumptech/glide/a/b;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    :try_start_0
    invoke-virtual {v0}, Lcom/bumptech/glide/a/b;->readLine()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/bumptech/glide/a/b;->readLine()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/bumptech/glide/a/b;->readLine()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/bumptech/glide/a/b;->readLine()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lcom/bumptech/glide/a/b;->readLine()Ljava/lang/String;

    move-result-object v5

    const-string v6, "libcore.io.DiskLruCache"

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v6, "1"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    iget v6, p0, Lcom/bumptech/glide/a/a;->appVersion:I

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, p0, Lcom/bumptech/glide/a/a;->valueCount:I

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, ""

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    const/4 v1, 0x0

    :goto_0
    :try_start_1
    invoke-virtual {v0}, Lcom/bumptech/glide/a/b;->readLine()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/bumptech/glide/a/a;->readJournalLine(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception v2

    nop

    :try_start_2
    iget-object v2, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/bumptech/glide/a/a;->redundantOpCount:I

    invoke-virtual {v0}, Lcom/bumptech/glide/a/b;->as()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->rebuildJournal()V

    goto :goto_1

    :cond_0
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/OutputStreamWriter;

    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v4, p0, Lcom/bumptech/glide/a/a;->journalFile:Ljava/io/File;

    const/4 v5, 0x1

    invoke-direct {v3, v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    sget-object v4, Lcom/bumptech/glide/a/c;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v2, v3, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_1
    invoke-static {v0}, Lcom/bumptech/glide/a/c;->closeQuietly(Ljava/io/Closeable;)V

    nop

    return-void

    :cond_1
    :try_start_3
    new-instance v3, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "unexpected journal header: ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v1

    invoke-static {v0}, Lcom/bumptech/glide/a/c;->closeQuietly(Ljava/io/Closeable;)V

    throw v1
.end method

.method private readJournalLine(Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_6

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    if-ne v0, v2, :cond_0

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "REMOVE"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v1, v4, :cond_1

    const-string v4, "REMOVE"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {p1, v3}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    :cond_1
    iget-object v4, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v4, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bumptech/glide/a/a$c;

    const/4 v5, 0x0

    if-nez v4, :cond_2

    new-instance v4, Lcom/bumptech/glide/a/a$c;

    invoke-direct {v4, p0, v3, v5}, Lcom/bumptech/glide/a/a$c;-><init>(Lcom/bumptech/glide/a/a;Ljava/lang/String;Lcom/bumptech/glide/a/a$1;)V

    iget-object v6, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v6, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    if-eq v0, v2, :cond_3

    const-string v3, "CLEAN"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v1, v3, :cond_3

    const-string v3, "CLEAN"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v1, 0x1

    add-int/2addr v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, v1}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;Z)Z

    invoke-static {v4, v5}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;Lcom/bumptech/glide/a/a$b;)Lcom/bumptech/glide/a/a$b;

    invoke-static {v4, p1}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;[Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    if-ne v0, v2, :cond_4

    const-string v3, "DIRTY"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v1, v3, :cond_4

    const-string v3, "DIRTY"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    new-instance p1, Lcom/bumptech/glide/a/a$b;

    invoke-direct {p1, p0, v4, v5}, Lcom/bumptech/glide/a/a$b;-><init>(Lcom/bumptech/glide/a/a;Lcom/bumptech/glide/a/a$c;Lcom/bumptech/glide/a/a$1;)V

    invoke-static {v4, p1}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;Lcom/bumptech/glide/a/a$b;)Lcom/bumptech/glide/a/a$b;

    goto :goto_0

    :cond_4
    if-ne v0, v2, :cond_5

    const-string v0, "READ"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v1, v0, :cond_5

    const-string v0, "READ"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    :goto_0
    return-void

    :cond_5
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unexpected journal line: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "unexpected journal line: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private declared-synchronized rebuildJournal()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    :cond_0
    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v1, Ljava/io/OutputStreamWriter;

    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lcom/bumptech/glide/a/a;->journalFileTmp:Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    sget-object v3, Lcom/bumptech/glide/a/c;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    const-string v1, "libcore.io.DiskLruCache"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    iget v1, p0, Lcom/bumptech/glide/a/a;->appVersion:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    iget v1, p0, Lcom/bumptech/glide/a/a;->valueCount:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/a/a$c;

    invoke-static {v2}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;)Lcom/bumptech/glide/a/a$b;

    move-result-object v3

    const/16 v4, 0xa

    if-eqz v3, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "DIRTY "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/bumptech/glide/a/a$c;->c(Lcom/bumptech/glide/a/a$c;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "CLEAN "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/bumptech/glide/a/a$c;->c(Lcom/bumptech/glide/a/a$c;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/bumptech/glide/a/a$c;->aq()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    goto :goto_0

    :cond_2
    :try_start_2
    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    nop

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->journalFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->journalFile:Ljava/io/File;

    iget-object v2, p0, Lcom/bumptech/glide/a/a;->journalFileBackup:Ljava/io/File;

    invoke-static {v0, v2, v1}, Lcom/bumptech/glide/a/a;->a(Ljava/io/File;Ljava/io/File;Z)V

    :cond_3
    iget-object v0, p0, Lcom/bumptech/glide/a/a;->journalFileTmp:Ljava/io/File;

    iget-object v2, p0, Lcom/bumptech/glide/a/a;->journalFile:Ljava/io/File;

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Lcom/bumptech/glide/a/a;->a(Ljava/io/File;Ljava/io/File;Z)V

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->journalFileBackup:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    new-instance v0, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/OutputStreamWriter;

    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v4, p0, Lcom/bumptech/glide/a/a;->journalFile:Ljava/io/File;

    invoke-direct {v3, v4, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    sget-object v1, Lcom/bumptech/glide/a/c;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v2, v3, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    iput-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private trimToSize()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    iget-wide v0, p0, Lcom/bumptech/glide/a/a;->size:J

    iget-wide v2, p0, Lcom/bumptech/glide/a/a;->maxSize:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/a/a;->remove(Ljava/lang/String;)Z

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/a/a$c;

    invoke-static {v1}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;)Lcom/bumptech/glide/a/a$b;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-static {v1}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;)Lcom/bumptech/glide/a/a$b;

    move-result-object v1

    invoke-virtual {v1}, Lcom/bumptech/glide/a/a$b;->abort()V

    :cond_1
    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->trimToSize()V

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public delete()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/a/a;->close()V

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->directory:Ljava/io/File;

    invoke-static {v0}, Lcom/bumptech/glide/a/c;->deleteContents(Ljava/io/File;)V

    return-void
.end method

.method public declared-synchronized flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->checkNotClosed()V

    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->trimToSize()V

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDirectory()Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->directory:Ljava/io/File;

    return-object v0
.end method

.method public declared-synchronized getMaxSize()J
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/bumptech/glide/a/a;->maxSize:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isClosed()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized n(Ljava/lang/String;)Lcom/bumptech/glide/a/a$d;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->checkNotClosed()V

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/a/a$c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    monitor-exit p0

    return-object v1

    :cond_0
    :try_start_1
    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->d(Lcom/bumptech/glide/a/a$c;)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v2, :cond_1

    monitor-exit p0

    return-object v1

    :cond_1
    :try_start_2
    iget-object v2, v0, Lcom/bumptech/glide/a/a$c;->cleanFiles:[Ljava/io/File;

    array-length v3, v2

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_3

    aget-object v5, v2, v4

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v5, :cond_2

    monitor-exit p0

    return-object v1

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_3
    :try_start_3
    iget v1, p0, Lcom/bumptech/glide/a/a;->redundantOpCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/bumptech/glide/a/a;->redundantOpCount:I

    iget-object v1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    const-string v2, "READ"

    invoke-virtual {v1, v2}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    iget-object v1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    iget-object v1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {v1, p1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    iget-object v1, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->journalRebuildRequired()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/bumptech/glide/a/a;->cW:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v2, p0, Lcom/bumptech/glide/a/a;->cX:Ljava/util/concurrent/Callable;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    :cond_4
    new-instance v8, Lcom/bumptech/glide/a/a$d;

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->e(Lcom/bumptech/glide/a/a$c;)J

    move-result-wide v3

    iget-object v5, v0, Lcom/bumptech/glide/a/a$c;->cleanFiles:[Ljava/io/File;

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->b(Lcom/bumptech/glide/a/a$c;)[J

    move-result-object v6

    const/4 v7, 0x0

    move-object v0, v8

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lcom/bumptech/glide/a/a$d;-><init>(Lcom/bumptech/glide/a/a;Ljava/lang/String;J[Ljava/io/File;[JLcom/bumptech/glide/a/a$1;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object v8

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public o(Ljava/lang/String;)Lcom/bumptech/glide/a/a$b;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, -0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/bumptech/glide/a/a;->a(Ljava/lang/String;J)Lcom/bumptech/glide/a/a$b;

    move-result-object p1

    return-object p1
.end method

.method public declared-synchronized remove(Ljava/lang/String;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->checkNotClosed()V

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/a/a$c;

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->a(Lcom/bumptech/glide/a/a$c;)Lcom/bumptech/glide/a/a$b;

    move-result-object v2

    if-eqz v2, :cond_0

    goto/16 :goto_2

    :cond_0
    :goto_0
    iget v2, p0, Lcom/bumptech/glide/a/a;->valueCount:I

    if-ge v1, v2, :cond_3

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/a/a$c;->o(I)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    new-instance p1, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "failed to delete "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_1
    iget-wide v2, p0, Lcom/bumptech/glide/a/a;->size:J

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->b(Lcom/bumptech/glide/a/a$c;)[J

    move-result-object v4

    aget-wide v4, v4, v1

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lcom/bumptech/glide/a/a;->size:J

    invoke-static {v0}, Lcom/bumptech/glide/a/a$c;->b(Lcom/bumptech/glide/a/a$c;)[J

    move-result-object v2

    const-wide/16 v3, 0x0

    aput-wide v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    iget v0, p0, Lcom/bumptech/glide/a/a;->redundantOpCount:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/bumptech/glide/a/a;->redundantOpCount:I

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    const-string v2, "REMOVE"

    invoke-virtual {v0, v2}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cV:Ljava/io/Writer;

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->lruEntries:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0}, Lcom/bumptech/glide/a/a;->journalRebuildRequired()Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cW:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v0, p0, Lcom/bumptech/glide/a/a;->cX:Ljava/util/concurrent/Callable;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_4
    monitor-exit p0

    return v1

    :cond_5
    :goto_2
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setMaxSize(J)V
    .locals 0

    monitor-enter p0

    :try_start_0
    iput-wide p1, p0, Lcom/bumptech/glide/a/a;->maxSize:J

    iget-object p1, p0, Lcom/bumptech/glide/a/a;->cW:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object p2, p0, Lcom/bumptech/glide/a/a;->cX:Ljava/util/concurrent/Callable;

    invoke-virtual {p1, p2}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized size()J
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/bumptech/glide/a/a;->size:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
