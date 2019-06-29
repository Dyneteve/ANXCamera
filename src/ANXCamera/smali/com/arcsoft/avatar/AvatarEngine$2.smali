.class Lcom/arcsoft/avatar/AvatarEngine$2;
.super Ljava/lang/Object;
.source "AvatarEngine.java"

# interfaces
.implements Lcom/arcsoft/avatar/AvatarConfig$GetConfigCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arcsoft/avatar/AvatarEngine;->getConfig(II)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/ArrayList;

.field final synthetic b:I

.field final synthetic c:Lcom/arcsoft/avatar/AvatarEngine;


# direct methods
.method constructor <init>(Lcom/arcsoft/avatar/AvatarEngine;Ljava/util/ArrayList;I)V
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->c:Lcom/arcsoft/avatar/AvatarEngine;

    iput-object p2, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->a:Ljava/util/ArrayList;

    iput p3, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetConfig(IIIILjava/lang/String;Ljava/lang/String;IIZZZF)V
    .locals 1

    new-instance v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    invoke-direct {v0}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;-><init>()V

    iput p1, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    iput p3, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    iput p4, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->gender:I

    iput-object p5, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->name:Ljava/lang/String;

    iput-object p6, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configThumbPath:Ljava/lang/String;

    iput-boolean p9, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->isDefault:Z

    iput-boolean p10, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->isValid:Z

    iput-boolean p11, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->isSupportContinuous:Z

    iput p12, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->continuousValue:F

    iput p7, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->startColorValue:I

    iput p8, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->endColorValue:I

    const/4 p1, 0x5

    if-ne p3, p1, :cond_1

    const/4 p1, -0x1

    if-eq p2, p1, :cond_1

    new-instance p1, Ljava/lang/Integer;

    invoke-direct {p1, p2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p3, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->c:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-static {p3}, Lcom/arcsoft/avatar/AvatarEngine;->a(Lcom/arcsoft/avatar/AvatarEngine;)Ljava/util/TreeMap;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_0

    iget-object p3, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->c:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-static {p3}, Lcom/arcsoft/avatar/AvatarEngine;->a(Lcom/arcsoft/avatar/AvatarEngine;)Ljava/util/TreeMap;

    move-result-object p3

    invoke-virtual {p3, p1, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object p1, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->c:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-static {p1}, Lcom/arcsoft/avatar/AvatarEngine;->b(Lcom/arcsoft/avatar/AvatarEngine;)I

    move-result p1

    if-eq p2, p1, :cond_1

    return-void

    :cond_1
    iget-object p1, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->a:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string p1, "AvatarEngine"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo p3, "type = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, p0, Lcom/arcsoft/avatar/AvatarEngine$2;->b:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " info = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
