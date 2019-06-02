.class final Lcom/google/zxing/oned/EANManufacturerOrgSupport;
.super Ljava/lang/Object;
.source "EANManufacturerOrgSupport.java"


# instance fields
.field private final countryIdentifiers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final ranges:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[I>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->ranges:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->countryIdentifiers:Ljava/util/List;

    return-void
.end method

.method private add([ILjava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->ranges:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->countryIdentifiers:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private declared-synchronized initIfNeeded()V
    .registers 6

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->ranges:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_485

    if-nez v0, :cond_b

    monitor-exit p0

    return-void

    :cond_b
    const/4 v0, 0x2

    :try_start_c
    new-array v1, v0, [I

    const/16 v2, 0x13

    const/4 v3, 0x1

    aput v2, v1, v3

    const-string v2, "US/CA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_488

    const-string v2, "US"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_490

    const-string v2, "US/CA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_498

    const-string v2, "FR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x17c

    const/4 v4, 0x0

    aput v2, v1, v4

    const-string v2, "BG"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x17f

    aput v2, v1, v4

    const-string v2, "SI"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x181

    aput v2, v1, v4

    const-string v2, "HR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x183

    aput v2, v1, v4

    const-string v2, "BA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4a0

    const-string v2, "DE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4a8

    const-string v2, "JP"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4b0

    const-string v2, "RU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1d7

    aput v2, v1, v4

    const-string v2, "TW"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1da

    aput v2, v1, v4

    const-string v2, "EE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1db

    aput v2, v1, v4

    const-string v2, "LV"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1dc

    aput v2, v1, v4

    const-string v2, "AZ"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1dd

    aput v2, v1, v4

    const-string v2, "LT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1de

    aput v2, v1, v4

    const-string v2, "UZ"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1df

    aput v2, v1, v4

    const-string v2, "LK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1e0

    aput v2, v1, v4

    const-string v2, "PH"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1e1

    aput v2, v1, v4

    const-string v2, "BY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1e2

    aput v2, v1, v4

    const-string v2, "UA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1e4

    aput v2, v1, v4

    const-string v2, "MD"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1e5

    aput v2, v1, v4

    const-string v2, "AM"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1e6

    aput v2, v1, v4

    const-string v2, "GE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1e7

    aput v2, v1, v4

    const-string v2, "KZ"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x1e9

    aput v2, v1, v4

    const-string v2, "HK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4b8

    const-string v2, "JP"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4c0

    const-string v2, "GB"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x208

    aput v2, v1, v4

    const-string v2, "GR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x210

    aput v2, v1, v4

    const-string v2, "LB"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x211

    aput v2, v1, v4

    const-string v2, "CY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x213

    aput v2, v1, v4

    const-string v2, "MK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x217

    aput v2, v1, v4

    const-string v2, "MT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x21b

    aput v2, v1, v4

    const-string v2, "IE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4c8

    const-string v2, "BE/LU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x230

    aput v2, v1, v4

    const-string v2, "PT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x239

    aput v2, v1, v4

    const-string v2, "IS"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4d0

    const-string v2, "DK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x24e

    aput v2, v1, v4

    const-string v2, "PL"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x252

    aput v2, v1, v4

    const-string v2, "RO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x257

    aput v2, v1, v4

    const-string v2, "HU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4d8

    const-string v2, "ZA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x25b

    aput v2, v1, v4

    const-string v2, "GH"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x260

    aput v2, v1, v4

    const-string v2, "BH"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x261

    aput v2, v1, v4

    const-string v2, "MU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x263

    aput v2, v1, v4

    const-string v2, "MA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x265

    aput v2, v1, v4

    const-string v2, "DZ"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x268

    aput v2, v1, v4

    const-string v2, "KE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x26a

    aput v2, v1, v4

    const-string v2, "CI"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x26b

    aput v2, v1, v4

    const-string v2, "TN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x26d

    aput v2, v1, v4

    const-string v2, "SY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x26e

    aput v2, v1, v4

    const-string v2, "EG"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x270

    aput v2, v1, v4

    const-string v2, "LY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x271

    aput v2, v1, v4

    const-string v2, "JO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x272

    aput v2, v1, v4

    const-string v2, "IR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x273

    aput v2, v1, v4

    const-string v2, "KW"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x274

    aput v2, v1, v4

    const-string v2, "SA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x275

    aput v2, v1, v4

    const-string v2, "AE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4e0

    const-string v2, "FI"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4e8

    const-string v2, "CN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4f0

    const-string v2, "NO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x2d9

    aput v2, v1, v4

    const-string v2, "IL"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_4f8

    const-string v2, "SE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x2e4

    aput v2, v1, v4

    const-string v2, "GT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x2e5

    aput v2, v1, v4

    const-string v2, "SV"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x2e6

    aput v2, v1, v4

    const-string v2, "HN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x2e7

    aput v2, v1, v4

    const-string v2, "NI"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x2e8

    aput v2, v1, v4

    const-string v2, "CR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x2e9

    aput v2, v1, v4

    const-string v2, "PA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x2ea

    aput v2, v1, v4

    const-string v2, "DO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x2ee

    aput v2, v1, v4

    const-string v2, "MX"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_500

    const-string v2, "CA"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x2f7

    aput v2, v1, v4

    const-string v2, "VE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_508

    const-string v2, "CH"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x302

    aput v2, v1, v4

    const-string v2, "CO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x305

    aput v2, v1, v4

    const-string v2, "UY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x307

    aput v2, v1, v4

    const-string v2, "PE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x309

    aput v2, v1, v4

    const-string v2, "BO"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x30b

    aput v2, v1, v4

    const-string v2, "AR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x30c

    aput v2, v1, v4

    const-string v2, "CL"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x310

    aput v2, v1, v4

    const-string v2, "PY"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x311

    aput v2, v1, v4

    const-string v2, "PE"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x312

    aput v2, v1, v4

    const-string v2, "EC"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_510

    const-string v2, "BR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_518

    const-string v2, "IT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_520

    const-string v2, "ES"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x352

    aput v2, v1, v4

    const-string v2, "CU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x35a

    aput v2, v1, v4

    const-string v2, "SK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x35b

    aput v2, v1, v4

    const-string v2, "CZ"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x35c

    aput v2, v1, v4

    const-string v2, "YU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x361

    aput v2, v1, v4

    const-string v2, "MN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x363

    aput v2, v1, v4

    const-string v2, "KP"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_528

    const-string v2, "TR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_530

    const-string v2, "NL"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x370

    aput v2, v1, v4

    const-string v2, "KR"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x375

    aput v2, v1, v4

    const-string v2, "TH"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x378

    aput v2, v1, v4

    const-string v2, "SG"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x37a

    aput v2, v1, v4

    const-string v2, "IN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x37d

    aput v2, v1, v4

    const-string v2, "VN"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x380

    aput v2, v1, v4

    const-string v2, "PK"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v3, [I

    const/16 v2, 0x383

    aput v2, v1, v4

    const-string v2, "ID"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_538

    const-string v2, "AT"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v1, v0, [I

    fill-array-data v1, :array_540

    const-string v2, "AU"

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v0, v0, [I

    fill-array-data v0, :array_548

    const-string v1, "AZ"

    invoke-direct {p0, v0, v1}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v0, v3, [I

    const/16 v1, 0x3bb

    aput v1, v0, v4

    const-string v1, "MY"

    invoke-direct {p0, v0, v1}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V

    new-array v0, v3, [I

    const/16 v1, 0x3be

    aput v1, v0, v4

    const-string v1, "MO"

    invoke-direct {p0, v0, v1}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->add([ILjava/lang/String;)V
    :try_end_483
    .catchall {:try_start_c .. :try_end_483} :catchall_485

    monitor-exit p0

    return-void

    :catchall_485
    move-exception v0

    monitor-exit p0

    throw v0

    :array_488
    .array-data 4
        0x1e
        0x27
    .end array-data

    :array_490
    .array-data 4
        0x3c
        0x8b
    .end array-data

    :array_498
    .array-data 4
        0x12c
        0x17b
    .end array-data

    :array_4a0
    .array-data 4
        0x190
        0x1b8
    .end array-data

    :array_4a8
    .array-data 4
        0x1c2
        0x1cb
    .end array-data

    :array_4b0
    .array-data 4
        0x1cc
        0x1d5
    .end array-data

    :array_4b8
    .array-data 4
        0x1ea
        0x1f3
    .end array-data

    :array_4c0
    .array-data 4
        0x1f4
        0x1fd
    .end array-data

    :array_4c8
    .array-data 4
        0x21c
        0x225
    .end array-data

    :array_4d0
    .array-data 4
        0x23a
        0x243
    .end array-data

    :array_4d8
    .array-data 4
        0x258
        0x259
    .end array-data

    :array_4e0
    .array-data 4
        0x280
        0x289
    .end array-data

    :array_4e8
    .array-data 4
        0x2b2
        0x2b7
    .end array-data

    :array_4f0
    .array-data 4
        0x2bc
        0x2c5
    .end array-data

    :array_4f8
    .array-data 4
        0x2da
        0x2e3
    .end array-data

    :array_500
    .array-data 4
        0x2f2
        0x2f3
    .end array-data

    :array_508
    .array-data 4
        0x2f8
        0x301
    .end array-data

    :array_510
    .array-data 4
        0x315
        0x316
    .end array-data

    :array_518
    .array-data 4
        0x320
        0x347
    .end array-data

    :array_520
    .array-data 4
        0x348
        0x351
    .end array-data

    :array_528
    .array-data 4
        0x364
        0x365
    .end array-data

    :array_530
    .array-data 4
        0x366
        0x36f
    .end array-data

    :array_538
    .array-data 4
        0x384
        0x397
    .end array-data

    :array_540
    .array-data 4
        0x3a2
        0x3ab
    .end array-data

    :array_548
    .array-data 4
        0x3ac
        0x3b5
    .end array-data
.end method


# virtual methods
.method lookupCountryIdentifier(Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    invoke-direct {p0}, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->initIfNeeded()V

    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->ranges:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_14
    const/4 v4, 0x0

    if-lt v3, v2, :cond_18

    return-object v4

    :cond_18
    iget-object v5, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->ranges:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [I

    aget v6, v5, v0

    if-ge v1, v6, :cond_25

    return-object v4

    :cond_25
    array-length v4, v5

    const/4 v7, 0x1

    if-ne v4, v7, :cond_2b

    move v4, v6

    goto :goto_2d

    :cond_2b
    aget v4, v5, v7

    :goto_2d
    if-gt v1, v4, :cond_38

    iget-object v0, p0, Lcom/google/zxing/oned/EANManufacturerOrgSupport;->countryIdentifiers:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    :cond_38
    add-int/lit8 v3, v3, 0x1

    goto :goto_14
.end method
