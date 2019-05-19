.class public Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
.super Ljava/lang/Object;
.source "HttpRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;,
        Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$FlushOperation;,
        Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$CloseOperation;,
        Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$Operation;,
        Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;,
        Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$Base64;,
        Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;,
        Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;
    }
.end annotation


# static fields
.field private static final BOUNDARY:Ljava/lang/String; = "00content0boundary00"

.field public static final CHARSET_UTF8:Ljava/lang/String; = "UTF-8"

.field private static CONNECTION_FACTORY:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory; = null

.field public static final CONTENT_TYPE_FORM:Ljava/lang/String; = "application/x-www-form-urlencoded"

.field public static final CONTENT_TYPE_JSON:Ljava/lang/String; = "application/json"

.field private static final CONTENT_TYPE_MULTIPART:Ljava/lang/String; = "multipart/form-data; boundary=00content0boundary00"

.field private static final CRLF:Ljava/lang/String; = "\r\n"

.field private static final EMPTY_STRINGS:[Ljava/lang/String;

.field public static final ENCODING_GZIP:Ljava/lang/String; = "gzip"

.field public static final HEADER_ACCEPT:Ljava/lang/String; = "Accept"

.field public static final HEADER_ACCEPT_CHARSET:Ljava/lang/String; = "Accept-Charset"

.field public static final HEADER_ACCEPT_ENCODING:Ljava/lang/String; = "Accept-Encoding"

.field public static final HEADER_AUTHORIZATION:Ljava/lang/String; = "Authorization"

.field public static final HEADER_CACHE_CONTROL:Ljava/lang/String; = "Cache-Control"

.field public static final HEADER_CONTENT_ENCODING:Ljava/lang/String; = "Content-Encoding"

.field public static final HEADER_CONTENT_LENGTH:Ljava/lang/String; = "Content-Length"

.field public static final HEADER_CONTENT_TYPE:Ljava/lang/String; = "Content-Type"

.field public static final HEADER_DATE:Ljava/lang/String; = "Date"

.field public static final HEADER_ETAG:Ljava/lang/String; = "ETag"

.field public static final HEADER_EXPIRES:Ljava/lang/String; = "Expires"

.field public static final HEADER_IF_NONE_MATCH:Ljava/lang/String; = "If-None-Match"

.field public static final HEADER_LAST_MODIFIED:Ljava/lang/String; = "Last-Modified"

.field public static final HEADER_LOCATION:Ljava/lang/String; = "Location"

.field public static final HEADER_PROXY_AUTHORIZATION:Ljava/lang/String; = "Proxy-Authorization"

.field public static final HEADER_REFERER:Ljava/lang/String; = "Referer"

.field public static final HEADER_SERVER:Ljava/lang/String; = "Server"

.field public static final HEADER_USER_AGENT:Ljava/lang/String; = "User-Agent"

.field public static final METHOD_DELETE:Ljava/lang/String; = "DELETE"

.field public static final METHOD_GET:Ljava/lang/String; = "GET"

.field public static final METHOD_HEAD:Ljava/lang/String; = "HEAD"

.field public static final METHOD_OPTIONS:Ljava/lang/String; = "OPTIONS"

.field public static final METHOD_POST:Ljava/lang/String; = "POST"

.field public static final METHOD_PUT:Ljava/lang/String; = "PUT"

.field public static final METHOD_TRACE:Ljava/lang/String; = "TRACE"

.field public static final PARAM_CHARSET:Ljava/lang/String; = "charset"

.field private static TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

.field private static TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;


# instance fields
.field private bufferSize:I

.field private connection:Ljava/net/HttpURLConnection;

.field private form:Z

.field private httpProxyHost:Ljava/lang/String;

.field private httpProxyPort:I

.field private ignoreCloseExceptions:Z

.field private multipart:Z

.field private output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

.field private progress:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;

.field private final requestMethod:Ljava/lang/String;

.field private totalSize:J

.field private totalWritten:J

.field private uncompress:Z

.field private final url:Ljava/net/URL;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->EMPTY_STRINGS:[Ljava/lang/String;

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;->DEFAULT:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;

    sput-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->CONNECTION_FACTORY:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->ignoreCloseExceptions:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->uncompress:Z

    const/16 v0, 0x2000

    iput v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferSize:I

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->totalSize:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->totalWritten:J

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;->DEFAULT:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->progress:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;

    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->url:Ljava/net/URL;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->requestMethod:Ljava/lang/String;

    return-void

    :catch_0
    move-exception p1

    new-instance p2, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {p2, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw p2
.end method

.method public constructor <init>(Ljava/net/URL;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->ignoreCloseExceptions:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->uncompress:Z

    const/16 v0, 0x2000

    iput v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferSize:I

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->totalSize:J

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->totalWritten:J

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;->DEFAULT:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->progress:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->url:Ljava/net/URL;

    iput-object p2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->requestMethod:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;)I
    .locals 0

    iget p0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferSize:I

    return p0
.end method

.method static synthetic access$200(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;)J
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->totalWritten:J

    return-wide v0
.end method

.method static synthetic access$202(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;J)J
    .locals 0

    iput-wide p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->totalWritten:J

    return-wide p1
.end method

.method static synthetic access$300(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;)J
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->totalSize:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;
    .locals 0

    iget-object p0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->progress:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;

    return-object p0
.end method

.method private static addParam(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->arrayToList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    :cond_0
    instance-of v0, p1, Ljava/lang/Iterable;

    if-eqz v0, :cond_4

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "[]="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "&"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    goto :goto_0

    :cond_3
    goto :goto_1

    :cond_4
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "="

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_5

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_5
    :goto_1
    return-object p2
.end method

.method private static addParamPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 4

    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    if-ge v1, v2, :cond_1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 v0, 0x26

    if-eq p0, v0, :cond_1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_1
    :goto_0
    return-object p1
.end method

.method private static addPathSeparator(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .locals 2

    const/16 v0, 0x3a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    const/16 v1, 0x2f

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p0

    if-ne v0, p0, :cond_0

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_0
    return-object p1
.end method

.method public static append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map<",
            "**>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->addPathSeparator(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    invoke-static {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->addParamPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->addParam(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 p1, 0x26

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-static {v1, p1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->addParam(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    :goto_1
    return-object p0
.end method

.method public static varargs append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 3

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    if-eqz p1, :cond_3

    array-length v0, p1

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    array-length v0, p1

    const/4 v1, 0x2

    rem-int/2addr v0, v1

    if-nez v0, :cond_2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->addPathSeparator(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    invoke-static {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->addParamPrefix(Ljava/lang/String;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    const/4 p0, 0x0

    aget-object p0, p1, p0

    const/4 v2, 0x1

    aget-object v2, p1, v2

    invoke-static {p0, v2, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->addParam(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    :goto_0
    array-length p0, p1

    if-ge v1, p0, :cond_1

    const/16 p0, 0x26

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    aget-object p0, p1, v1

    add-int/lit8 v2, v1, 0x1

    aget-object v2, p1, v2

    invoke-static {p0, v2, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->addParam(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Must specify an even number of parameter names/values"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    :goto_1
    return-object p0
.end method

.method private static arrayToList(Ljava/lang/Object;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    instance-of v0, p0, [Ljava/lang/Object;

    if-eqz v0, :cond_0

    check-cast p0, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    instance-of v1, p0, [I

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    check-cast p0, [I

    array-length v1, p0

    :goto_0
    if-ge v2, v1, :cond_8

    aget v3, p0, v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    instance-of v1, p0, [Z

    if-eqz v1, :cond_2

    check-cast p0, [Z

    array-length v1, p0

    :goto_1
    if-ge v2, v1, :cond_8

    aget-boolean v3, p0, v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    instance-of v1, p0, [J

    if-eqz v1, :cond_3

    check-cast p0, [J

    array-length v1, p0

    :goto_2
    if-ge v2, v1, :cond_8

    aget-wide v3, p0, v2

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_3
    instance-of v1, p0, [F

    if-eqz v1, :cond_4

    check-cast p0, [F

    array-length v1, p0

    :goto_3
    if-ge v2, v1, :cond_8

    aget v3, p0, v2

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_4
    instance-of v1, p0, [D

    if-eqz v1, :cond_5

    check-cast p0, [D

    array-length v1, p0

    :goto_4
    if-ge v2, v1, :cond_8

    aget-wide v3, p0, v2

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_5
    instance-of v1, p0, [S

    if-eqz v1, :cond_6

    check-cast p0, [S

    array-length v1, p0

    :goto_5
    if-ge v2, v1, :cond_8

    aget-short v3, p0, v2

    invoke-static {v3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_6
    instance-of v1, p0, [B

    if-eqz v1, :cond_7

    check-cast p0, [B

    array-length v1, p0

    :goto_6
    if-ge v2, v1, :cond_8

    aget-byte v3, p0, v2

    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_7
    instance-of v1, p0, [C

    if-eqz v1, :cond_8

    check-cast p0, [C

    array-length v1, p0

    :goto_7
    if-ge v2, v1, :cond_8

    aget-char v3, p0, v2

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_8
    return-object v0
.end method

.method private createConnection()Ljava/net/HttpURLConnection;
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->httpProxyHost:Ljava/lang/String;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->CONNECTION_FACTORY:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->url:Ljava/net/URL;

    invoke-direct {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->createProxy()Ljava/net/Proxy;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;->create(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/HttpURLConnection;

    move-result-object v0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->CONNECTION_FACTORY:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->url:Ljava/net/URL;

    invoke-interface {v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;->create(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->requestMethod:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method private createProxy()Ljava/net/Proxy;
    .locals 5

    new-instance v0, Ljava/net/Proxy;

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    new-instance v2, Ljava/net/InetSocketAddress;

    iget-object v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->httpProxyHost:Ljava/lang/String;

    iget v4, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->httpProxyPort:I

    invoke-direct {v2, v3, v4}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {v0, v1, v2}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    return-object v0
.end method

.method public static delete(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "DELETE"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static delete(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map<",
            "**>;Z)",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    invoke-static {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    if-eqz p2, :cond_0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->delete(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p0

    return-object p0
.end method

.method public static varargs delete(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0

    invoke-static {p0, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->delete(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p0

    return-object p0
.end method

.method public static delete(Ljava/net/URL;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "DELETE"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static encode(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    nop

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0}, Ljava/net/URL;->getPort()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x3a

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_0
    move-object v3, p0

    :try_start_1
    new-instance p0, Ljava/net/URI;

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljava/net/URL;->getQuery()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Ljava/net/URI;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-lez v0, :cond_1

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "+"

    const-string v2, "%2B"

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    :cond_1
    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Parsing URI failed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    new-instance p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw p0

    :catch_1
    move-exception p0

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public static get(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "GET"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static get(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map<",
            "**>;Z)",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    invoke-static {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    if-eqz p2, :cond_0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->get(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p0

    return-object p0
.end method

.method public static varargs get(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0

    invoke-static {p0, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->get(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p0

    return-object p0
.end method

.method public static get(Ljava/net/URL;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "GET"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getTrustedFactory()Ljavax/net/ssl/SSLSocketFactory;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljavax/net/ssl/TrustManager;

    const/4 v1, 0x0

    new-instance v2, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$1;

    invoke-direct {v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$1;-><init>()V

    aput-object v2, v0, v1

    :try_start_0
    const-string v1, "TLS"

    invoke-static {v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    const/4 v2, 0x0

    new-instance v3, Ljava/security/SecureRandom;

    invoke-direct {v3}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v2, v0, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    invoke-virtual {v1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    sput-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/io/IOException;

    const-string v2, "Security exception configuring SSL context"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0

    :cond_0
    :goto_0
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->TRUSTED_FACTORY:Ljavax/net/ssl/SSLSocketFactory;

    return-object v0
.end method

.method private static getTrustedVerifier()Ljavax/net/ssl/HostnameVerifier;
    .locals 1

    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    if-nez v0, :cond_0

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$2;

    invoke-direct {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$2;-><init>()V

    sput-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    :cond_0
    sget-object v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->TRUSTED_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    return-object v0
.end method

.method private static getValidCharset(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    return-object p0

    :cond_0
    const-string p0, "UTF-8"

    return-object p0
.end method

.method public static head(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "HEAD"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static head(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map<",
            "**>;Z)",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    invoke-static {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    if-eqz p2, :cond_0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->head(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p0

    return-object p0
.end method

.method public static varargs head(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0

    invoke-static {p0, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->head(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p0

    return-object p0
.end method

.method public static head(Ljava/net/URL;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "HEAD"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method private incrementTotalSize(J)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 4

    iget-wide v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->totalSize:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->totalSize:J

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->totalSize:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->totalSize:J

    return-object p0
.end method

.method public static keepAlive(Z)V
    .locals 1

    const-string v0, "http.keepAlive"

    invoke-static {p0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public static maxConnections(I)V
    .locals 1

    const-string v0, "http.maxConnections"

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public static varargs nonProxyHosts([Ljava/lang/String;)V
    .locals 4

    if-eqz p0, :cond_1

    array-length v0, p0

    if-lez v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    array-length v1, p0

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v3, 0x7c

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    aget-object p0, p0, v1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "http.nonProxyHosts"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_1

    :cond_1
    const-string p0, "http.nonProxyHosts"

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    :goto_1
    return-void
.end method

.method public static options(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "OPTIONS"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static options(Ljava/net/URL;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "OPTIONS"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static post(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "POST"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static post(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map<",
            "**>;Z)",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    invoke-static {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    if-eqz p2, :cond_0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->post(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p0

    return-object p0
.end method

.method public static varargs post(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0

    invoke-static {p0, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->post(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p0

    return-object p0
.end method

.method public static post(Ljava/net/URL;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "POST"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static proxyHost(Ljava/lang/String;)V
    .locals 1

    const-string v0, "http.proxyHost"

    invoke-static {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "https.proxyHost"

    invoke-static {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public static proxyPort(I)V
    .locals 1

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "http.proxyPort"

    invoke-static {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "https.proxyPort"

    invoke-static {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public static put(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "PUT"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static put(Ljava/lang/CharSequence;Ljava/util/Map;Z)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map<",
            "**>;Z)",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    invoke-static {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->append(Ljava/lang/CharSequence;Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    if-eqz p2, :cond_0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->put(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p0

    return-object p0
.end method

.method public static varargs put(Ljava/lang/CharSequence;Z[Ljava/lang/Object;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0

    invoke-static {p0, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->append(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->encode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :cond_0
    invoke-static {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->put(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p0

    return-object p0
.end method

.method public static put(Ljava/net/URL;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "PUT"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method

.method public static setConnectionFactory(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;)V
    .locals 0

    if-nez p0, :cond_0

    sget-object p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;->DEFAULT:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;

    sput-object p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->CONNECTION_FACTORY:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;

    goto :goto_0

    :cond_0
    sput-object p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->CONNECTION_FACTORY:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$ConnectionFactory;

    :goto_0
    return-void
.end method

.method private static setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-eqz p1, :cond_0

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$3;

    invoke-direct {v0, p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$3;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$4;

    invoke-direct {v0, p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$4;-><init>(Ljava/lang/String;)V

    :goto_0
    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public static trace(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "TRACE"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/lang/CharSequence;Ljava/lang/String;)V

    return-object v0
.end method

.method public static trace(Ljava/net/URL;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    const-string v1, "TRACE"

    invoke-direct {v0, p0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const-string v0, "Accept"

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public acceptCharset(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const-string v0, "Accept-Charset"

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public acceptEncoding(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const-string v0, "Accept-Encoding"

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public acceptGzipEncoding()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const-string v0, "gzip"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->acceptEncoding(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public acceptJson()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const-string v0, "application/json"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->accept(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public authorization(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const-string v0, "Authorization"

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public badRequest()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->code()I

    move-result v0

    const/16 v1, 0x190

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public basic(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Basic "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x3a

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->authorization(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public body(Ljava/util/concurrent/atomic/AtomicReference;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->body()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-object p0
.end method

.method public body(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->body(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    return-object p0
.end method

.method public body()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->charset()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->body(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public body(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->byteStream()Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->buffer()Ljava/io/BufferedInputStream;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-static {p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public buffer()Ljava/io/BufferedInputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->stream()Ljava/io/InputStream;

    move-result-object v1

    iget v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferSize:I

    invoke-direct {v0, v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    return-object v0
.end method

.method public bufferSize()I
    .locals 1

    iget v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferSize:I

    return v0
.end method

.method public bufferSize(I)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    iput p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferSize:I

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Size must be greater than zero"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bufferedReader()Ljava/io/BufferedReader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->charset()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferedReader(Ljava/lang/String;)Ljava/io/BufferedReader;

    move-result-object v0

    return-object v0
.end method

.method public bufferedReader(Ljava/lang/String;)Ljava/io/BufferedReader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    new-instance v0, Ljava/io/BufferedReader;

    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->reader(Ljava/lang/String;)Ljava/io/InputStreamReader;

    move-result-object p1

    iget v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferSize:I

    invoke-direct {v0, p1, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    return-object v0
.end method

.method protected byteStream()Ljava/io/ByteArrayOutputStream;
    .locals 2

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->contentLength()I

    move-result v0

    if-lez v0, :cond_0

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1, v0}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    return-object v1

    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    return-object v0
.end method

.method public bytes()[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->byteStream()Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->buffer()Ljava/io/BufferedInputStream;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public cacheControl()Ljava/lang/String;
    .locals 1

    const-string v0, "Cache-Control"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public charset()Ljava/lang/String;
    .locals 2

    const-string v0, "Content-Type"

    const-string v1, "charset"

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->parameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public chunk(I)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    return-object p0
.end method

.method protected closeOutput()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->progress(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    if-nez v1, :cond_0

    return-object p0

    :cond_0
    iget-boolean v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->multipart:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    const-string v2, "\r\n--00content0boundary00--\r\n"

    invoke-virtual {v1, v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    :cond_1
    iget-boolean v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->ignoreCloseExceptions:Z

    if-eqz v1, :cond_2

    :try_start_0
    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    :goto_0
    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->close()V

    :goto_1
    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    return-object p0
.end method

.method protected closeOutputQuietly()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->closeOutput()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public code()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->closeOutput()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public code(Ljava/util/concurrent/atomic/AtomicInteger;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->code()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-object p0
.end method

.method public connectTimeout(I)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    return-object p0
.end method

.method public contentEncoding()Ljava/lang/String;
    .locals 1

    const-string v0, "Content-Encoding"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public contentLength()I
    .locals 1

    const-string v0, "Content-Length"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->intHeader(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public contentLength(I)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    return-object p0
.end method

.method public contentLength(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->contentLength(I)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public contentType(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->contentType(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public contentType(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    nop

    const-string v0, "Content-Type"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "; charset="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p2, "Content-Type"

    invoke-virtual {p0, p2, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public contentType()Ljava/lang/String;
    .locals 1

    const-string v0, "Content-Type"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v6, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$8;

    iget-boolean v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->ignoreCloseExceptions:Z

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$8;-><init>(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;Ljava/io/Closeable;ZLjava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v6}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$8;->call()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    return-object p1
.end method

.method protected copy(Ljava/io/Reader;Ljava/io/Writer;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v6, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;

    iget-boolean v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->ignoreCloseExceptions:Z

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;-><init>(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;Ljava/io/Closeable;ZLjava/io/Reader;Ljava/io/Writer;)V

    invoke-virtual {v6}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$9;->call()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    return-object p1
.end method

.method public created()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->code()I

    move-result v0

    const/16 v1, 0xc9

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public date()J
    .locals 2

    const-string v0, "Date"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->dateHeader(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public dateHeader(Ljava/lang/String;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    const-wide/16 v0, -0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->dateHeader(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public dateHeader(Ljava/lang/String;J)J
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->closeOutputQuietly()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/net/HttpURLConnection;->getHeaderFieldDate(Ljava/lang/String;J)J

    move-result-wide p1

    return-wide p1
.end method

.method public disconnect()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object p0
.end method

.method public eTag()Ljava/lang/String;
    .locals 1

    const-string v0, "ETag"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public expires()J
    .locals 2

    const-string v0, "Expires"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->dateHeader(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public followRedirects(Z)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    return-object p0
.end method

.method public form(Ljava/lang/Object;Ljava/lang/Object;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, p2, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->form(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public form(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->form:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    if-eqz v0, :cond_0

    const-string v2, "application/x-www-form-urlencoded"

    invoke-virtual {p0, v2, p3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->contentType(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    iput-boolean v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->form:Z

    :cond_0
    invoke-static {p3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->openOutput()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    const/16 v1, 0x26

    invoke-virtual {v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->write(I)V

    :cond_1
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    iget-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    const/16 v0, 0x3d

    invoke-virtual {p1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->write(I)V

    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    nop

    return-object p0

    :catch_0
    move-exception p1

    new-instance p2, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {p2, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw p2
.end method

.method public form(Ljava/util/Map$Entry;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "**>;)",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->form(Ljava/util/Map$Entry;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public form(Ljava/util/Map$Entry;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "**>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->form(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public form(Ljava/util/Map;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;)",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    const-string v0, "UTF-8"

    invoke-virtual {p0, p1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->form(Ljava/util/Map;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public form(Ljava/util/Map;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;",
            "Ljava/lang/String;",
            ")",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-virtual {p0, v0, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->form(Ljava/util/Map$Entry;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public getConnection()Ljava/net/HttpURLConnection;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->createConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    iput-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    return-object v0
.end method

.method protected getParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    const/4 v0, 0x0

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_2

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x3b

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, 0x1

    add-int/2addr v3, v4

    if-eqz v3, :cond_7

    if-ne v3, v1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_2

    nop

    move v5, v1

    :cond_2
    :goto_0
    if-ge v3, v5, :cond_6

    const/16 v7, 0x3d

    invoke-virtual {p1, v7, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    if-eq v7, v6, :cond_4

    if-ge v7, v5, :cond_4

    invoke-virtual {p1, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p1, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_4

    const/4 p1, 0x2

    if-le v7, p1, :cond_3

    const/4 p1, 0x0

    invoke-virtual {v3, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    const/16 p2, 0x22

    if-ne p2, p1, :cond_3

    sub-int/2addr v7, v4

    invoke-virtual {v3, v7}, Ljava/lang/String;->charAt(I)C

    move-result p1

    if-ne p2, p1, :cond_3

    invoke-virtual {v3, v4, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_3
    return-object v3

    :cond_4
    add-int/lit8 v3, v5, 0x1

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    if-ne v5, v6, :cond_5

    nop

    move v5, v1

    :cond_5
    goto :goto_0

    :cond_6
    return-object v0

    :cond_7
    :goto_1
    return-object v0

    :cond_8
    :goto_2
    return-object v0
.end method

.method protected getParams(Ljava/lang/String;)Ljava/util/Map;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x3b

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    if-eqz v2, :cond_7

    if-ne v2, v0, :cond_1

    goto :goto_2

    :cond_1
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_2

    nop

    move v4, v0

    :cond_2
    new-instance v6, Ljava/util/LinkedHashMap;

    invoke-direct {v6}, Ljava/util/LinkedHashMap;-><init>()V

    :goto_0
    if-ge v2, v4, :cond_6

    const/16 v7, 0x3d

    invoke-virtual {p1, v7, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v7

    if-eq v7, v5, :cond_4

    if-ge v7, v4, :cond_4

    invoke-virtual {p1, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_4

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {p1, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_4

    const/4 v9, 0x2

    if-le v8, v9, :cond_3

    const/4 v9, 0x0

    invoke-virtual {v7, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x22

    if-ne v10, v9, :cond_3

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v10, v9, :cond_3

    invoke-virtual {v7, v3, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    invoke-interface {v6, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    :goto_1
    add-int/lit8 v2, v4, 0x1

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    if-ne v4, v5, :cond_5

    nop

    move v4, v0

    :cond_5
    goto :goto_0

    :cond_6
    return-object v6

    :cond_7
    :goto_2
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object p1

    return-object p1

    :cond_8
    :goto_3
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public header(Ljava/lang/String;Ljava/lang/Number;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method

.method public header(Ljava/util/Map$Entry;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public header(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->closeOutputQuietly()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public headers(Ljava/util/Map;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/util/Map$Entry;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public headers()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->closeOutputQuietly()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public headers(Ljava/lang/String;)[Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->headers()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    return-object p1

    :cond_1
    sget-object p1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->EMPTY_STRINGS:[Ljava/lang/String;

    return-object p1

    :cond_2
    :goto_0
    sget-object p1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->EMPTY_STRINGS:[Ljava/lang/String;

    return-object p1
.end method

.method public ifModifiedSince(J)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->setIfModifiedSince(J)V

    return-object p0
.end method

.method public ifNoneMatch(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const-string v0, "If-None-Match"

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public ignoreCloseExceptions(Z)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->ignoreCloseExceptions:Z

    return-object p0
.end method

.method public ignoreCloseExceptions()Z
    .locals 1

    iget-boolean v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->ignoreCloseExceptions:Z

    return v0
.end method

.method public intHeader(Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->intHeader(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public intHeader(Ljava/lang/String;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->closeOutputQuietly()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/net/HttpURLConnection;->getHeaderFieldInt(Ljava/lang/String;I)I

    move-result p1

    return p1
.end method

.method public isBodyEmpty()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->contentLength()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public lastModified()J
    .locals 2

    const-string v0, "Last-Modified"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->dateHeader(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public location()Ljava/lang/String;
    .locals 1

    const-string v0, "Location"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public message()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->closeOutput()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method public method()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public noContent()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->code()I

    move-result v0

    const/16 v1, 0xcc

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public notFound()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->code()I

    move-result v0

    const/16 v1, 0x194

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public notModified()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->code()I

    move-result v0

    const/16 v1, 0x130

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public ok()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->code()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected openOutput()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    nop

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "charset"

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    iget v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferSize:I

    invoke-direct {v1, v2, v0, v3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/lang/String;I)V

    iput-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    return-object p0
.end method

.method public parameter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getParam(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public parameters(Ljava/lang/String;)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getParams(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public part(Ljava/lang/String;Ljava/io/File;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public part(Ljava/lang/String;Ljava/io/InputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v0, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public part(Ljava/lang/String;Ljava/lang/Number;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Number;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Number;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/io/BufferedInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p4}, Ljava/io/File;->length()J

    move-result-wide v1

    invoke-direct {p0, v1, v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->incrementTotalSize(J)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1

    :catch_0
    move-exception p1

    new-instance p2, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {p2, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw p2
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->startPart()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    iget-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    invoke-virtual {p0, p4, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    return-object p0

    :catch_0
    move-exception p1

    new-instance p2, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {p2, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw p2
.end method

.method public part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->startPart()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    iget-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    invoke-virtual {p1, p4}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    return-object p0

    :catch_0
    move-exception p1

    new-instance p2, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {p2, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw p2
.end method

.method public partHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    const-string v0, ": "

    invoke-virtual {p1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    const-string p2, "\r\n"

    invoke-virtual {p1, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public progress(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0

    if-nez p1, :cond_0

    sget-object p1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;->DEFAULT:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->progress:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->progress:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$UploadProgress;

    :goto_0
    return-object p0
.end method

.method public proxyAuthorization(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const-string v0, "Proxy-Authorization"

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public proxyBasic(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Basic "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x3a

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->proxyAuthorization(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public readTimeout(I)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    return-object p0
.end method

.method public reader()Ljava/io/InputStreamReader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->charset()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->reader(Ljava/lang/String;)Ljava/io/InputStreamReader;

    move-result-object v0

    return-object v0
.end method

.method public reader(Ljava/lang/String;)Ljava/io/InputStreamReader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->stream()Ljava/io/InputStream;

    move-result-object v1

    invoke-static {p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getValidCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public receive(Ljava/io/File;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/io/BufferedOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iget p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferSize:I

    invoke-direct {v0, v1, p1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    new-instance p1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$5;

    iget-boolean v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->ignoreCloseExceptions:Z

    invoke-direct {p1, p0, v0, v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$5;-><init>(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;Ljava/io/Closeable;ZLjava/io/OutputStream;)V

    invoke-virtual {p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$5;->call()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    return-object p1

    :catch_0
    move-exception p1

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public receive(Ljava/io/OutputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->buffer()Ljava/io/BufferedInputStream;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public receive(Ljava/io/PrintStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->receive(Ljava/io/OutputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public receive(Ljava/io/Writer;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferedReader()Ljava/io/BufferedReader;

    move-result-object v4

    new-instance v6, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$7;

    iget-boolean v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->ignoreCloseExceptions:Z

    move-object v0, v6

    move-object v1, p0

    move-object v2, v4

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$7;-><init>(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;Ljava/io/Closeable;ZLjava/io/BufferedReader;Ljava/io/Writer;)V

    invoke-virtual {v6}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$7;->call()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    return-object p1
.end method

.method public receive(Ljava/lang/Appendable;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->bufferedReader()Ljava/io/BufferedReader;

    move-result-object v4

    new-instance v6, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;

    iget-boolean v3, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->ignoreCloseExceptions:Z

    move-object v0, v6

    move-object v1, p0

    move-object v2, v4

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;-><init>(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;Ljava/io/Closeable;ZLjava/io/BufferedReader;Ljava/lang/Appendable;)V

    invoke-virtual {v6}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$6;->call()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    return-object p1
.end method

.method public referer(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const-string v0, "Referer"

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public send(Ljava/io/File;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/io/BufferedInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v1

    invoke-direct {p0, v1, v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->incrementTotalSize(J)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->send(Ljava/io/InputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1

    :catch_0
    move-exception p1

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public send(Ljava/io/InputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->openOutput()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    invoke-virtual {p0, p1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    return-object p0

    :catch_0
    move-exception p1

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public send(Ljava/io/Reader;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->openOutput()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    new-instance v0, Ljava/io/OutputStreamWriter;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    invoke-static {v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->access$500(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;)Ljava/nio/charset/CharsetEncoder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/charset/CharsetEncoder;->charset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$10;

    invoke-direct {v1, p0, v0, p1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$10;-><init>(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;Ljava/io/Flushable;Ljava/io/Reader;Ljava/io/Writer;)V

    invoke-virtual {v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$10;->call()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    return-object p1

    :catch_0
    move-exception p1

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public send(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->openOutput()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    return-object p0

    :catch_0
    move-exception p1

    new-instance v0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v0
.end method

.method public send([B)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    if-eqz p1, :cond_0

    array-length v0, p1

    int-to-long v0, v0

    invoke-direct {p0, v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->incrementTotalSize(J)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    :cond_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->send(Ljava/io/InputStream;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public server()Ljava/lang/String;
    .locals 1

    const-string v0, "Server"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public serverError()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->code()I

    move-result v0

    const/16 v1, 0x1f4

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected startPart()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->multipart:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->multipart:Z

    const-string v0, "multipart/form-data; boundary=00content0boundary00"

    invoke-virtual {p0, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->contentType(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->openOutput()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    const-string v1, "--00content0boundary00\r\n"

    invoke-virtual {v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    const-string v1, "\r\n--00content0boundary00\r\n"

    invoke-virtual {v0, v1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->write(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    :goto_0
    return-object p0
.end method

.method public stream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->code()I

    move-result v0

    const/16 v1, 0x190

    if-ge v0, v1, :cond_0

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1

    :cond_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    if-nez v0, :cond_2

    :try_start_1
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->contentLength()I

    move-result v1

    if-gtz v1, :cond_1

    new-instance v0, Ljava/io/ByteArrayInputStream;

    const/4 v1, 0x0

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    goto :goto_0

    :cond_1
    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1

    :cond_2
    :goto_0
    iget-boolean v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->uncompress:Z

    if-eqz v1, :cond_4

    const-string v1, "gzip"

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->contentEncoding()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    goto :goto_1

    :cond_3
    :try_start_2
    new-instance v1, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v1, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    return-object v1

    :catch_2
    move-exception v0

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1

    :cond_4
    :goto_1
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->method()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->url()Ljava/net/URL;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public trustAllCerts()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    instance-of v1, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v1, :cond_0

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getTrustedFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    :cond_0
    return-object p0
.end method

.method public trustAllHosts()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    instance-of v1, v0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz v1, :cond_0

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    invoke-static {}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getTrustedVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    :cond_0
    return-object p0
.end method

.method public uncompress(Z)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->uncompress:Z

    return-object p0
.end method

.method public url()Ljava/net/URL;
    .locals 1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public useCaches(Z)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->getConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    return-object p0
.end method

.method public useProxy(Ljava/lang/String;I)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->connection:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->httpProxyHost:Ljava/lang/String;

    iput p2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->httpProxyPort:I

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "The connection has already been created. This method must be called before reading or writing to the request."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public userAgent(Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1

    const-string v0, "User-Agent"

    invoke-virtual {p0, v0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method protected writePartHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method protected writePartHeader(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "form-data; name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p2, :cond_0

    const-string p1, "\"; filename=\""

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    const/16 p1, 0x22

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string p1, "Content-Disposition"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->partHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    if-eqz p3, :cond_1

    const-string p1, "Content-Type"

    invoke-virtual {p0, p1, p3}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->partHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    :cond_1
    const-string p1, "\r\n"

    invoke-virtual {p0, p1}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->send(Ljava/lang/CharSequence;)Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    move-result-object p1

    return-object p1
.end method

.method public writer()Ljava/io/OutputStreamWriter;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->openOutput()Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;

    new-instance v0, Ljava/io/OutputStreamWriter;

    iget-object v1, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    iget-object v2, p0, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest;->output:Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;

    invoke-static {v2}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;->access$500(Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$RequestOutputStream;)Ljava/nio/charset/CharsetEncoder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/charset/CharsetEncoder;->charset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;

    invoke-direct {v1, v0}, Lcom/ss/android/vesdk/runtime/cloudconfig/HttpRequest$HttpRequestException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method
