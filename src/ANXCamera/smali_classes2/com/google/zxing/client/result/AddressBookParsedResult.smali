.class public final Lcom/google/zxing/client/result/AddressBookParsedResult;
.super Lcom/google/zxing/client/result/ParsedResult;
.source "AddressBookParsedResult.java"


# instance fields
.field private final addressTypes:[Ljava/lang/String;

.field private final addresses:[Ljava/lang/String;

.field private final birthday:Ljava/lang/String;

.field private final emailTypes:[Ljava/lang/String;

.field private final emails:[Ljava/lang/String;

.field private final geo:[Ljava/lang/String;

.field private final instantMessenger:Ljava/lang/String;

.field private final names:[Ljava/lang/String;

.field private final nicknames:[Ljava/lang/String;

.field private final note:Ljava/lang/String;

.field private final org:Ljava/lang/String;

.field private final phoneNumbers:[Ljava/lang/String;

.field private final phoneTypes:[Ljava/lang/String;

.field private final pronunciation:Ljava/lang/String;

.field private final title:Ljava/lang/String;

.field private final urls:[Ljava/lang/String;


# direct methods
.method public constructor <init>([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 34

    move-object/from16 v0, p0

    sget-object v1, Lcom/google/zxing/client/result/ParsedResultType;->ADDRESSBOOK:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-direct {v0, v1}, Lcom/google/zxing/client/result/ParsedResult;-><init>(Lcom/google/zxing/client/result/ParsedResultType;)V

    move-object/from16 v1, p1

    iput-object v1, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->names:[Ljava/lang/String;

    move-object/from16 v2, p2

    iput-object v2, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->nicknames:[Ljava/lang/String;

    move-object/from16 v3, p3

    iput-object v3, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->pronunciation:Ljava/lang/String;

    move-object/from16 v4, p4

    iput-object v4, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->phoneNumbers:[Ljava/lang/String;

    move-object/from16 v5, p5

    iput-object v5, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->phoneTypes:[Ljava/lang/String;

    move-object/from16 v6, p6

    iput-object v6, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->emails:[Ljava/lang/String;

    move-object/from16 v7, p7

    iput-object v7, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->emailTypes:[Ljava/lang/String;

    move-object/from16 v8, p8

    iput-object v8, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->instantMessenger:Ljava/lang/String;

    move-object/from16 v9, p9

    iput-object v9, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->note:Ljava/lang/String;

    move-object/from16 v10, p10

    iput-object v10, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->addresses:[Ljava/lang/String;

    move-object/from16 v11, p11

    iput-object v11, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->addressTypes:[Ljava/lang/String;

    move-object/from16 v12, p12

    iput-object v12, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->org:Ljava/lang/String;

    move-object/from16 v13, p13

    iput-object v13, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->birthday:Ljava/lang/String;

    move-object/from16 v14, p14

    iput-object v14, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->title:Ljava/lang/String;

    move-object/from16 v15, p15

    iput-object v15, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->urls:[Ljava/lang/String;

    move-object/from16 v1, p16

    iput-object v1, v0, Lcom/google/zxing/client/result/AddressBookParsedResult;->geo:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .registers 25

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    invoke-direct/range {v0 .. v16}, Lcom/google/zxing/client/result/AddressBookParsedResult;-><init>([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getAddressTypes()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->addressTypes:[Ljava/lang/String;

    return-object v0
.end method

.method public getAddresses()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->addresses:[Ljava/lang/String;

    return-object v0
.end method

.method public getBirthday()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->birthday:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayResult()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->names:[Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->nicknames:[Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->pronunciation:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->title:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->org:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->addresses:[Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->phoneNumbers:[Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->emails:[Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->instantMessenger:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->urls:[Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->birthday:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->geo:[Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V

    iget-object v1, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->note:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/google/zxing/client/result/AddressBookParsedResult;->maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getEmailTypes()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->emailTypes:[Ljava/lang/String;

    return-object v0
.end method

.method public getEmails()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->emails:[Ljava/lang/String;

    return-object v0
.end method

.method public getGeo()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->geo:[Ljava/lang/String;

    return-object v0
.end method

.method public getInstantMessenger()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->instantMessenger:Ljava/lang/String;

    return-object v0
.end method

.method public getNames()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->names:[Ljava/lang/String;

    return-object v0
.end method

.method public getNicknames()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->nicknames:[Ljava/lang/String;

    return-object v0
.end method

.method public getNote()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->note:Ljava/lang/String;

    return-object v0
.end method

.method public getOrg()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->org:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneNumbers()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->phoneNumbers:[Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneTypes()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->phoneTypes:[Ljava/lang/String;

    return-object v0
.end method

.method public getPronunciation()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->pronunciation:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getURLs()[Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/AddressBookParsedResult;->urls:[Ljava/lang/String;

    return-object v0
.end method
