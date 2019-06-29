.class public Lcom/adobe/xmp/impl/XMPMetaImpl;
.super Ljava/lang/Object;
.source "XMPMetaImpl.java"

# interfaces
.implements Lcom/adobe/xmp/XMPConst;
.implements Lcom/adobe/xmp/XMPMeta;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final VALUE_BASE64:I = 0x7

.field private static final VALUE_BOOLEAN:I = 0x1

.field private static final VALUE_CALENDAR:I = 0x6

.field private static final VALUE_DATE:I = 0x5

.field private static final VALUE_DOUBLE:I = 0x4

.field private static final VALUE_INTEGER:I = 0x2

.field private static final VALUE_LONG:I = 0x3

.field private static final VALUE_STRING:I


# instance fields
.field private packetHeader:Ljava/lang/String;

.field private tree:Lcom/adobe/xmp/impl/XMPNode;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->packetHeader:Ljava/lang/String;

    new-instance v1, Lcom/adobe/xmp/impl/XMPNode;

    invoke-direct {v1, v0, v0, v0}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    iput-object v1, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    return-void
.end method

.method public constructor <init>(Lcom/adobe/xmp/impl/XMPNode;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->packetHeader:Ljava/lang/String;

    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    return-void
.end method

.method private doSetArrayItem(Lcom/adobe/xmp/impl/XMPNode;ILjava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Lcom/adobe/xmp/impl/XMPNode;

    const-string v1, "[]"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    invoke-static {p4, p3}, Lcom/adobe/xmp/impl/XMPNodeUtils;->verifySetOptions(Lcom/adobe/xmp/options/PropertyOptions;Ljava/lang/Object;)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p4

    const/4 v1, 0x1

    if-eqz p5, :cond_0

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v2

    add-int/2addr v2, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v2

    :goto_0
    const/4 v3, -0x1

    if-ne p2, v3, :cond_1

    nop

    move p2, v2

    :cond_1
    if-gt v1, p2, :cond_3

    if-gt p2, v2, :cond_3

    if-nez p5, :cond_2

    invoke-virtual {p1, p2}, Lcom/adobe/xmp/impl/XMPNode;->removeChild(I)V

    :cond_2
    invoke-virtual {p1, p2, v0}, Lcom/adobe/xmp/impl/XMPNode;->addChild(ILcom/adobe/xmp/impl/XMPNode;)V

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p3, p4, p1}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;Z)V

    return-void

    :cond_3
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const/16 p2, 0x68

    const-string p3, "Array index out of bounds"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1
.end method

.method private evaluateNodeValue(ILcom/adobe/xmp/impl/XMPNode;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-virtual {p2}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    packed-switch p1, :pswitch_data_0

    if-nez v0, :cond_1

    invoke-virtual {p2}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p1

    invoke-virtual {p1}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :pswitch_0
    invoke-static {v0}, Lcom/adobe/xmp/XMPUtils;->decodeBase64(Ljava/lang/String;)[B

    move-result-object p1

    goto :goto_1

    :pswitch_1
    invoke-static {v0}, Lcom/adobe/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;

    move-result-object p1

    invoke-interface {p1}, Lcom/adobe/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object p1

    goto :goto_1

    :pswitch_2
    invoke-static {v0}, Lcom/adobe/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;

    move-result-object p1

    goto :goto_1

    :pswitch_3
    new-instance p1, Ljava/lang/Double;

    invoke-static {v0}, Lcom/adobe/xmp/XMPUtils;->convertToDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-direct {p1, v0, v1}, Ljava/lang/Double;-><init>(D)V

    goto :goto_1

    :pswitch_4
    new-instance p1, Ljava/lang/Long;

    invoke-static {v0}, Lcom/adobe/xmp/XMPUtils;->convertToLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-direct {p1, v0, v1}, Ljava/lang/Long;-><init>(J)V

    goto :goto_1

    :pswitch_5
    new-instance p1, Ljava/lang/Integer;

    invoke-static {v0}, Lcom/adobe/xmp/XMPUtils;->convertToInteger(Ljava/lang/String;)I

    move-result p2

    invoke-direct {p1, p2}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_1

    :pswitch_6
    new-instance p1, Ljava/lang/Boolean;

    invoke-static {v0}, Lcom/adobe/xmp/XMPUtils;->convertToBoolean(Ljava/lang/String;)Z

    move-result p2

    invoke-direct {p1, p2}, Ljava/lang/Boolean;-><init>(Z)V

    goto :goto_1

    :cond_0
    const-string v0, ""

    :cond_1
    :goto_0
    move-object p1, v0

    :goto_1
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public appendArrayItem(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    if-nez p3, :cond_0

    new-instance p3, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {p3}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    :cond_0
    invoke-virtual {p3}, Lcom/adobe/xmp/options/PropertyOptions;->isOnlyArrayOptions()Z

    move-result v0

    const/16 v1, 0x67

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    invoke-static {p3, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->verifySetOptions(Lcom/adobe/xmp/options/PropertyOptions;Ljava/lang/Object;)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p3

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v2, 0x0

    invoke-static {p2, p1, v2, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p2

    const/16 v0, 0x66

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p1

    invoke-virtual {p1}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result p1

    if-eqz p1, :cond_1

    :goto_0
    move-object v2, p2

    goto :goto_1

    :cond_1
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const-string p2, "The named property is not an array"

    invoke-direct {p1, p2, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_2
    invoke-virtual {p3}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result p2

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v1, 0x1

    invoke-static {p2, p1, v1, p3}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p2

    if-eqz p2, :cond_3

    goto :goto_0

    :goto_1
    const/4 v3, -0x1

    const/4 v6, 0x1

    move-object v1, p0

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v1 .. v6}, Lcom/adobe/xmp/impl/XMPMetaImpl;->doSetArrayItem(Lcom/adobe/xmp/impl/XMPNode;ILjava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Z)V

    return-void

    :cond_3
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const-string p2, "Failure creating array node"

    invoke-direct {p1, p2, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_4
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const-string p2, "Explicit arrayOptions required to create new array"

    invoke-direct {p1, p2, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_5
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const-string p2, "Only array form flags allowed for arrayOptions"

    invoke-direct {p1, p2, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1
.end method

.method public appendArrayItem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/xmp/impl/XMPMetaImpl;->appendArrayItem(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    new-instance v1, Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-direct {v1, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;-><init>(Lcom/adobe/xmp/impl/XMPNode;)V

    return-object v1
.end method

.method public countArrayItems(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p2, p1, v0, v1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p2

    invoke-virtual {p2}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result p1

    return p1

    :cond_1
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const/16 p2, 0x66

    const-string v0, "The named property is not an array"

    invoke-direct {p1, v0, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1
.end method

.method public deleteArrayItem(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    :try_start_0
    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    invoke-static {p2, p3}, Lcom/adobe/xmp/XMPPathFactory;->composeArrayItemPath(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->deleteProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    :goto_0
    return-void
.end method

.method public deleteProperty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    :try_start_0
    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p2, p1, v0, v1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->deleteNode(Lcom/adobe/xmp/impl/XMPNode;)V
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    goto :goto_0

    :catch_0
    move-exception p1

    :goto_0
    return-void
.end method

.method public deleteQualifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    :try_start_0
    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p3, p4}, Lcom/adobe/xmp/XMPPathFactory;->composeQualifierPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->deleteProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    :goto_0
    return-void
.end method

.method public deleteStructField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    :try_start_0
    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertStructName(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p3, p4}, Lcom/adobe/xmp/XMPPathFactory;->composeStructFieldPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->deleteProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    :goto_0
    return-void
.end method

.method public doesArrayItemExist(Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 0

    :try_start_0
    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    invoke-static {p2, p3}, Lcom/adobe/xmp/XMPPathFactory;->composeArrayItemPath(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    const/4 p1, 0x0

    return p1
.end method

.method public doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v1, 0x0

    invoke-static {p2, p1, v0, v1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    nop

    :cond_0
    return v0

    :catch_0
    move-exception p1

    return v0
.end method

.method public doesQualifierExist(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    :try_start_0
    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    invoke-static {p3, p4}, Lcom/adobe/xmp/XMPPathFactory;->composeQualifierPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    const/4 p1, 0x0

    return p1
.end method

.method public doesStructFieldExist(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    :try_start_0
    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertStructName(Ljava/lang/String;)V

    invoke-static {p3, p4}, Lcom/adobe/xmp/XMPPathFactory;->composeStructFieldPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    const/4 p1, 0x0

    return p1
.end method

.method public dumpObject()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/adobe/xmp/impl/XMPNode;->dumpNode(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getArrayItem(Ljava/lang/String;Ljava/lang/String;I)Lcom/adobe/xmp/properties/XMPProperty;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    invoke-static {p2, p3}, Lcom/adobe/xmp/XMPPathFactory;->composeArrayItemPath(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPProperty;

    move-result-object p1

    return-object p1
.end method

.method public getLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPProperty;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    invoke-static {p4}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSpecificLang(Ljava/lang/String;)V

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    invoke-static {p3}, Lcom/adobe/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    :cond_0
    move-object p3, v0

    :goto_0
    invoke-static {p4}, Lcom/adobe/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v1, 0x0

    invoke-static {p2, p1, v1, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    if-nez p1, :cond_1

    return-object v0

    :cond_1
    invoke-static {p1, p3, p4}, Lcom/adobe/xmp/impl/XMPNodeUtils;->chooseLocalizedText(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object p1

    aget-object p2, p1, v1

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const/4 p3, 0x1

    aget-object p1, p1, p3

    check-cast p1, Lcom/adobe/xmp/impl/XMPNode;

    if-eqz p2, :cond_2

    new-instance p2, Lcom/adobe/xmp/impl/XMPMetaImpl$1;

    invoke-direct {p2, p0, p1}, Lcom/adobe/xmp/impl/XMPMetaImpl$1;-><init>(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;)V

    return-object p2

    :cond_2
    return-object v0
.end method

.method public getObjectName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public getPacketHeader()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->packetHeader:Ljava/lang/String;

    return-object v0
.end method

.method public getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPProperty;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getProperty(Ljava/lang/String;Ljava/lang/String;I)Lcom/adobe/xmp/properties/XMPProperty;

    move-result-object p1

    return-object p1
.end method

.method protected getProperty(Ljava/lang/String;Ljava/lang/String;I)Lcom/adobe/xmp/properties/XMPProperty;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p2, p1, v1, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    if-eqz p1, :cond_2

    if-eqz p3, :cond_1

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p2

    invoke-virtual {p2}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const/16 p2, 0x66

    const-string p3, "Property must be simple when a value type is requested"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_1
    :goto_0
    invoke-direct {p0, p3, p1}, Lcom/adobe/xmp/impl/XMPMetaImpl;->evaluateNodeValue(ILcom/adobe/xmp/impl/XMPNode;)Ljava/lang/Object;

    move-result-object p2

    new-instance p3, Lcom/adobe/xmp/impl/XMPMetaImpl$2;

    invoke-direct {p3, p0, p2, p1}, Lcom/adobe/xmp/impl/XMPMetaImpl$2;-><init>(Lcom/adobe/xmp/impl/XMPMetaImpl;Ljava/lang/Object;Lcom/adobe/xmp/impl/XMPNode;)V

    return-object p3

    :cond_2
    return-object v0
.end method

.method public getPropertyBase64(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x7

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    return-object p1
.end method

.method public getPropertyBoolean(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    return-object p1
.end method

.method public getPropertyCalendar(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Calendar;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x6

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Calendar;

    return-object p1
.end method

.method public getPropertyDate(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x5

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/adobe/xmp/XMPDateTime;

    return-object p1
.end method

.method public getPropertyDouble(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Double;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x4

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Double;

    return-object p1
.end method

.method public getPropertyInteger(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x2

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    return-object p1
.end method

.method public getPropertyLong(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Long;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x3

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    return-object p1
.end method

.method protected getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p2, p1, v1, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    if-eqz p1, :cond_2

    if-eqz p3, :cond_1

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p2

    invoke-virtual {p2}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const/16 p2, 0x66

    const-string p3, "Property must be simple when a value type is requested"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_1
    :goto_0
    invoke-direct {p0, p3, p1}, Lcom/adobe/xmp/impl/XMPMetaImpl;->evaluateNodeValue(ILcom/adobe/xmp/impl/XMPNode;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_2
    return-object v0
.end method

.method public getPropertyString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getPropertyObject(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getQualifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPProperty;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p3, p4}, Lcom/adobe/xmp/XMPPathFactory;->composeQualifierPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPProperty;

    move-result-object p1

    return-object p1
.end method

.method public getRoot()Lcom/adobe/xmp/impl/XMPNode;
    .locals 1

    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    return-object v0
.end method

.method public getStructField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPProperty;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertStructName(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p3, p4}, Lcom/adobe/xmp/XMPPathFactory;->composeStructFieldPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPProperty;

    move-result-object p1

    return-object p1
.end method

.method public insertArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/xmp/impl/XMPMetaImpl;->insertArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public insertArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p2, p1, v0, v1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v3

    if-eqz v3, :cond_0

    const/4 v7, 0x1

    move-object v2, p0

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v2 .. v7}, Lcom/adobe/xmp/impl/XMPMetaImpl;->doSetArrayItem(Lcom/adobe/xmp/impl/XMPNode;ILjava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Z)V

    return-void

    :cond_0
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const/16 p2, 0x66

    const-string p3, "Specified array does not exist"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1
.end method

.method public iterator()Lcom/adobe/xmp/XMPIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->iterator(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/IteratorOptions;)Lcom/adobe/xmp/XMPIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator(Lcom/adobe/xmp/options/IteratorOptions;)Lcom/adobe/xmp/XMPIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, p1}, Lcom/adobe/xmp/impl/XMPMetaImpl;->iterator(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/IteratorOptions;)Lcom/adobe/xmp/XMPIterator;

    move-result-object p1

    return-object p1
.end method

.method public iterator(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/IteratorOptions;)Lcom/adobe/xmp/XMPIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Lcom/adobe/xmp/impl/XMPIteratorImpl;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/adobe/xmp/impl/XMPIteratorImpl;-><init>(Lcom/adobe/xmp/impl/XMPMetaImpl;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/IteratorOptions;)V

    return-object v0
.end method

.method public normalize(Lcom/adobe/xmp/options/ParseOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    if-nez p1, :cond_0

    new-instance p1, Lcom/adobe/xmp/options/ParseOptions;

    invoke-direct {p1}, Lcom/adobe/xmp/options/ParseOptions;-><init>()V

    :cond_0
    invoke-static {p0, p1}, Lcom/adobe/xmp/impl/XMPNormalizer;->process(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/options/ParseOptions;)Lcom/adobe/xmp/XMPMeta;

    return-void
.end method

.method public setArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setArrayItem(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p2, p1, v0, v1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v3

    if-eqz v3, :cond_0

    const/4 v7, 0x0

    move-object v2, p0

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v2 .. v7}, Lcom/adobe/xmp/impl/XMPMetaImpl;->doSetArrayItem(Lcom/adobe/xmp/impl/XMPNode;ILjava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;Z)V

    return-void

    :cond_0
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const/16 p2, 0x66

    const-string p3, "Specified array does not exist"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1
.end method

.method public setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertArrayName(Ljava/lang/String;)V

    invoke-static {p4}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSpecificLang(Ljava/lang/String;)V

    const/4 p6, 0x0

    if-eqz p3, :cond_0

    invoke-static {p3}, Lcom/adobe/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    goto :goto_0

    :cond_0
    move-object p3, p6

    :goto_0
    invoke-static {p4}, Lcom/adobe/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    new-instance v0, Lcom/adobe/xmp/options/PropertyOptions;

    const/16 v1, 0x1e00

    invoke-direct {v0, v1}, Lcom/adobe/xmp/options/PropertyOptions;-><init>(I)V

    const/4 v1, 0x1

    invoke-static {p2, p1, v1, v0}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    const/16 p2, 0x66

    if-eqz p1, :cond_12

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/adobe/xmp/options/PropertyOptions;->setArrayAltText(Z)Lcom/adobe/xmp/options/PropertyOptions;

    goto :goto_1

    :cond_1
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const-string p3, "Specified property is no alt-text array"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_2
    :goto_1
    nop

    nop

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->hasQualifier()Z

    move-result v4

    if-eqz v4, :cond_4

    const-string/jumbo v4, "xml:lang"

    invoke-virtual {v2, v1}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string/jumbo v4, "x-default"

    invoke-virtual {v2, v1}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    nop

    nop

    nop

    move p2, v1

    goto :goto_3

    :cond_3
    goto :goto_2

    :cond_4
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const-string p3, "Language qualifier must be first"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_5
    move-object v2, p6

    move p2, v3

    :goto_3
    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v0

    if-le v0, v1, :cond_6

    invoke-virtual {p1, v2}, Lcom/adobe/xmp/impl/XMPNode;->removeChild(Lcom/adobe/xmp/impl/XMPNode;)V

    invoke-virtual {p1, v1, v2}, Lcom/adobe/xmp/impl/XMPNode;->addChild(ILcom/adobe/xmp/impl/XMPNode;)V

    :cond_6
    invoke-static {p1, p3, p4}, Lcom/adobe/xmp/impl/XMPNodeUtils;->chooseLocalizedText(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object p3

    aget-object v0, p3, v3

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    aget-object p3, p3, v1

    check-cast p3, Lcom/adobe/xmp/impl/XMPNode;

    const-string/jumbo v3, "x-default"

    invoke-virtual {v3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    packed-switch v0, :pswitch_data_0

    new-instance p1, Lcom/adobe/xmp/XMPException;

    const/16 p2, 0x9

    const-string p3, "Unexpected result from ChooseLocalizedText"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1

    :pswitch_0
    invoke-static {p1, p4, p5}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v3, :cond_10

    goto/16 :goto_6

    :pswitch_1
    if-eqz v2, :cond_7

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result p3

    if-ne p3, v1, :cond_7

    invoke-virtual {v2, p5}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    :cond_7
    invoke-static {p1, p4, p5}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_7

    :pswitch_2
    invoke-static {p1, p4, p5}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v3, :cond_10

    goto/16 :goto_6

    :pswitch_3
    if-eqz p2, :cond_8

    if-eq v2, p3, :cond_8

    if-eqz v2, :cond_8

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p4, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_8

    invoke-virtual {v2, p5}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    :cond_8
    invoke-virtual {p3, p5}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    goto :goto_7

    :pswitch_4
    if-nez v3, :cond_a

    if-eqz p2, :cond_9

    if-eq v2, p3, :cond_9

    if-eqz v2, :cond_9

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p4, p6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_9

    invoke-virtual {v2, p5}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    :cond_9
    invoke-virtual {p3, p5}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    goto :goto_7

    :cond_a
    nop

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object p3

    :cond_b
    :goto_4
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_e

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/adobe/xmp/impl/XMPNode;

    if-eq p4, v2, :cond_b

    invoke-virtual {p4}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v2, :cond_c

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v3

    goto :goto_5

    :cond_c
    move-object v3, p6

    :goto_5
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d

    goto :goto_4

    :cond_d
    invoke-virtual {p4, p5}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    goto :goto_4

    :cond_e
    if-eqz v2, :cond_10

    invoke-virtual {v2, p5}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    goto :goto_7

    :pswitch_5
    const-string/jumbo p2, "x-default"

    invoke-static {p1, p2, p5}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    nop

    if-nez v3, :cond_f

    invoke-static {p1, p4, p5}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    :cond_f
    :goto_6
    move p2, v1

    :cond_10
    :goto_7
    if-nez p2, :cond_11

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result p2

    if-ne p2, v1, :cond_11

    const-string/jumbo p2, "x-default"

    invoke-static {p1, p2, p5}, Lcom/adobe/xmp/impl/XMPNodeUtils;->appendLangItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)V

    :cond_11
    return-void

    :cond_12
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const-string p3, "Failed to find or create array node"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method setNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    if-eqz p4, :cond_0

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->clear()V

    :cond_0
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p4

    invoke-virtual {p4, p3}, Lcom/adobe/xmp/options/PropertyOptions;->mergeWith(Lcom/adobe/xmp/options/PropertyOptions;)V

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p3

    invoke-virtual {p3}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result p3

    if-nez p3, :cond_1

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/XMPNodeUtils;->setNodeValue(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    if-gtz p2, :cond_2

    goto :goto_0

    :cond_2
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const/16 p2, 0x66

    const-string p3, "Composite nodes can\'t have values"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1

    :cond_3
    :goto_0
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->removeChildren()V

    :goto_1
    return-void
.end method

.method public setObjectName(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {v0, p1}, Lcom/adobe/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public setPacketHeader(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->packetHeader:Ljava/lang/String;

    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    invoke-static {p4, p3}, Lcom/adobe/xmp/impl/XMPNodeUtils;->verifySetOptions(Lcom/adobe/xmp/options/PropertyOptions;Ljava/lang/Object;)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p4

    invoke-static {p1, p2}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object p1

    iget-object p2, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    const/4 v0, 0x1

    invoke-static {p2, p1, v0, p4}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p3, p4, p2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;Z)V

    return-void

    :cond_0
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const/16 p2, 0x66

    const-string p3, "Specified property does not exist"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1
.end method

.method public setPropertyBase64(Ljava/lang/String;Ljava/lang/String;[B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyBase64(Ljava/lang/String;Ljava/lang/String;[BLcom/adobe/xmp/options/PropertyOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyBoolean(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    if-eqz p3, :cond_0

    const-string p3, "True"

    goto :goto_0

    :cond_0
    const-string p3, "False"

    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyBoolean(Ljava/lang/String;Ljava/lang/String;ZLcom/adobe/xmp/options/PropertyOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    if-eqz p3, :cond_0

    const-string p3, "True"

    goto :goto_0

    :cond_0
    const-string p3, "False"

    :goto_0
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyCalendar(Ljava/lang/String;Ljava/lang/String;Ljava/util/Calendar;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyCalendar(Ljava/lang/String;Ljava/lang/String;Ljava/util/Calendar;Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyDate(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/XMPDateTime;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyDate(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/XMPDateTime;Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyDouble(Ljava/lang/String;Ljava/lang/String;D)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p3, p4}, Ljava/lang/Double;-><init>(D)V

    const/4 p3, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyDouble(Ljava/lang/String;Ljava/lang/String;DLcom/adobe/xmp/options/PropertyOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p3, p4}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {p0, p1, p2, v0, p5}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyInteger(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p3}, Ljava/lang/Integer;-><init>(I)V

    const/4 p3, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyInteger(Ljava/lang/String;Ljava/lang/String;ILcom/adobe/xmp/options/PropertyOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p3}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {p0, p1, p2, v0, p4}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyLong(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p3, p4}, Ljava/lang/Long;-><init>(J)V

    const/4 p3, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setPropertyLong(Ljava/lang/String;Ljava/lang/String;JLcom/adobe/xmp/options/PropertyOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p3, p4}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {p0, p1, p2, v0, p5}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setQualifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setQualifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setQualifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertPropName(Ljava/lang/String;)V

    invoke-virtual {p0, p1, p2}, Lcom/adobe/xmp/impl/XMPMetaImpl;->doesPropertyExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p3, p4}, Lcom/adobe/xmp/XMPPathFactory;->composeQualifierPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2, p5, p6}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void

    :cond_0
    new-instance p1, Lcom/adobe/xmp/XMPException;

    const/16 p2, 0x66

    const-string p3, "Specified property does not exist!"

    invoke-direct {p1, p3, p2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p1
.end method

.method public setStructField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setStructField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public setStructField(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertSchemaNS(Ljava/lang/String;)V

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParameterAsserts;->assertStructName(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p3, p4}, Lcom/adobe/xmp/XMPPathFactory;->composeStructFieldPath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2, p5, p6}, Lcom/adobe/xmp/impl/XMPMetaImpl;->setProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Lcom/adobe/xmp/options/PropertyOptions;)V

    return-void
.end method

.method public sort()V
    .locals 1

    iget-object v0, p0, Lcom/adobe/xmp/impl/XMPMetaImpl;->tree:Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->sort()V

    return-void
.end method
