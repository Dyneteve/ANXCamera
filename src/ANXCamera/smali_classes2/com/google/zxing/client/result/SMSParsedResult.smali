.class public final Lcom/google/zxing/client/result/SMSParsedResult;
.super Lcom/google/zxing/client/result/ParsedResult;
.source "SMSParsedResult.java"


# instance fields
.field private final body:Ljava/lang/String;

.field private final numbers:[Ljava/lang/String;

.field private final subject:Ljava/lang/String;

.field private final vias:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    sget-object v0, Lcom/google/zxing/client/result/ParsedResultType;->SMS:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-direct {p0, v0}, Lcom/google/zxing/client/result/ParsedResult;-><init>(Lcom/google/zxing/client/result/ParsedResultType;)V

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    iput-object v1, p0, Lcom/google/zxing/client/result/SMSParsedResult;->numbers:[Ljava/lang/String;

    new-array v0, v0, [Ljava/lang/String;

    aput-object p2, v0, v2

    iput-object v0, p0, Lcom/google/zxing/client/result/SMSParsedResult;->vias:[Ljava/lang/String;

    iput-object p3, p0, Lcom/google/zxing/client/result/SMSParsedResult;->subject:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/zxing/client/result/SMSParsedResult;->body:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    sget-object v0, Lcom/google/zxing/client/result/ParsedResultType;->SMS:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-direct {p0, v0}, Lcom/google/zxing/client/result/ParsedResult;-><init>(Lcom/google/zxing/client/result/ParsedResultType;)V

    iput-object p1, p0, Lcom/google/zxing/client/result/SMSParsedResult;->numbers:[Ljava/lang/String;

    iput-object p2, p0, Lcom/google/zxing/client/result/SMSParsedResult;->vias:[Ljava/lang/String;

    iput-object p3, p0, Lcom/google/zxing/client/result/SMSParsedResult;->subject:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/zxing/client/result/SMSParsedResult;->body:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getBody()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/SMSParsedResult;->body:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayResult()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iget-object v1, p0, Lcom/google/zxing/client/result/SMSParsedResult;->numbers:[Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/SMSParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/SMSParsedResult;->subject:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/SMSParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/SMSParsedResult;->body:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/SMSParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getNumbers()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/SMSParsedResult;->numbers:[Ljava/lang/String;

    return-object v0
.end method

.method public getSMSURI()Ljava/lang/String;
    .registers 7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "sms:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    const/4 v2, 0x0

    :goto_c
    iget-object v3, p0, Lcom/google/zxing/client/result/SMSParsedResult;->numbers:[Ljava/lang/String;

    array-length v3, v3

    if-lt v2, v3, :cond_4d

    iget-object v2, p0, Lcom/google/zxing/client/result/SMSParsedResult;->body:Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_19

    move v2, v4

    goto :goto_1a

    :cond_19
    move v2, v3

    :goto_1a
    iget-object v5, p0, Lcom/google/zxing/client/result/SMSParsedResult;->subject:Ljava/lang/String;

    if-eqz v5, :cond_20

    move v3, v4

    nop

    :cond_20
    if-nez v2, :cond_24

    if-eqz v3, :cond_48

    :cond_24
    const/16 v4, 0x3f

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-eqz v2, :cond_35

    const-string v4, "body="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/google/zxing/client/result/SMSParsedResult;->body:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_35
    if-eqz v3, :cond_48

    if-eqz v2, :cond_3e

    const/16 v4, 0x26

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_3e
    const-string v4, "subject="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/google/zxing/client/result/SMSParsedResult;->subject:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    :cond_4d
    if-eqz v1, :cond_51

    const/4 v1, 0x0

    goto :goto_56

    :cond_51
    const/16 v3, 0x2c

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_56
    iget-object v3, p0, Lcom/google/zxing/client/result/SMSParsedResult;->numbers:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/google/zxing/client/result/SMSParsedResult;->vias:[Ljava/lang/String;

    if-eqz v3, :cond_73

    iget-object v3, p0, Lcom/google/zxing/client/result/SMSParsedResult;->vias:[Ljava/lang/String;

    aget-object v3, v3, v2

    if-eqz v3, :cond_73

    const-string v3, ";via="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/google/zxing/client/result/SMSParsedResult;->vias:[Ljava/lang/String;

    aget-object v3, v3, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_73
    add-int/lit8 v2, v2, 0x1

    goto :goto_c
.end method

.method public getSubject()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/SMSParsedResult;->subject:Ljava/lang/String;

    return-object v0
.end method

.method public getVias()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/SMSParsedResult;->vias:[Ljava/lang/String;

    return-object v0
.end method
