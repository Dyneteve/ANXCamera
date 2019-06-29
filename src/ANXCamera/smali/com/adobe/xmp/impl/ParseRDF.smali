.class public Lcom/adobe/xmp/impl/ParseRDF;
.super Ljava/lang/Object;
.source "ParseRDF.java"

# interfaces
.implements Lcom/adobe/xmp/XMPConst;
.implements Lcom/adobe/xmp/XMPError;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final DEFAULT_PREFIX:Ljava/lang/String; = "_dflt"

.field public static final RDFTERM_ABOUT:I = 0x3

.field public static final RDFTERM_ABOUT_EACH:I = 0xa

.field public static final RDFTERM_ABOUT_EACH_PREFIX:I = 0xb

.field public static final RDFTERM_BAG_ID:I = 0xc

.field public static final RDFTERM_DATATYPE:I = 0x7

.field public static final RDFTERM_DESCRIPTION:I = 0x8

.field public static final RDFTERM_FIRST_CORE:I = 0x1

.field public static final RDFTERM_FIRST_OLD:I = 0xa

.field public static final RDFTERM_FIRST_SYNTAX:I = 0x1

.field public static final RDFTERM_ID:I = 0x2

.field public static final RDFTERM_LAST_CORE:I = 0x7

.field public static final RDFTERM_LAST_OLD:I = 0xc

.field public static final RDFTERM_LAST_SYNTAX:I = 0x9

.field public static final RDFTERM_LI:I = 0x9

.field public static final RDFTERM_NODE_ID:I = 0x6

.field public static final RDFTERM_OTHER:I = 0x0

.field public static final RDFTERM_PARSE_TYPE:I = 0x4

.field public static final RDFTERM_RDF:I = 0x1

.field public static final RDFTERM_RESOURCE:I = 0x5


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {}, Lcom/adobe/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/adobe/xmp/XMPSchemaRegistry;

    move-result-object v0

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xca

    if-eqz v1, :cond_9

    const-string v3, "http://purl.org/dc/1.1/"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v1, "http://purl.org/dc/elements/1.1/"

    :cond_0
    invoke-interface {v0, v1}, Lcom/adobe/xmp/XMPSchemaRegistry;->getNamespacePrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_1
    const-string v3, "_dflt"

    :goto_0
    invoke-interface {v0, v1, v3}, Lcom/adobe/xmp/XMPSchemaRegistry;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    nop

    new-instance v3, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v3}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    nop

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz p4, :cond_3

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    const-string v6, "_dflt"

    invoke-static {p1, v1, v6, v5}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/adobe/xmp/impl/XMPNode;->setImplicit(Z)V

    nop

    invoke-interface {v0, p2}, Lcom/adobe/xmp/XMPSchemaRegistry;->findAlias(Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPAliasInfo;

    move-result-object v0

    if-eqz v0, :cond_3

    nop

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p0

    invoke-virtual {p0, v5}, Lcom/adobe/xmp/impl/XMPNode;->setHasAliases(Z)V

    invoke-virtual {p1, v5}, Lcom/adobe/xmp/impl/XMPNode;->setHasAliases(Z)V

    move v4, v5

    :cond_3
    const-string p0, "rdf:li"

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    const-string v0, "rdf:value"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    new-instance v1, Lcom/adobe/xmp/impl/XMPNode;

    invoke-direct {v1, p2, p3, v3}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    invoke-virtual {v1, v4}, Lcom/adobe/xmp/impl/XMPNode;->setAlias(Z)V

    if-nez v0, :cond_4

    invoke-virtual {p1, v1}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_1

    :cond_4
    invoke-virtual {p1, v5, v1}, Lcom/adobe/xmp/impl/XMPNode;->addChild(ILcom/adobe/xmp/impl/XMPNode;)V

    :goto_1
    if-eqz v0, :cond_6

    if-nez p4, :cond_5

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p2

    invoke-virtual {p2}, Lcom/adobe/xmp/options/PropertyOptions;->isStruct()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-virtual {p1, v5}, Lcom/adobe/xmp/impl/XMPNode;->setHasValueChild(Z)V

    goto :goto_2

    :cond_5
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Misplaced rdf:value element"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_6
    :goto_2
    if-eqz p0, :cond_8

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p0

    invoke-virtual {p0}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result p0

    if-eqz p0, :cond_7

    const-string p0, "[]"

    invoke-virtual {v1, p0}, Lcom/adobe/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    goto :goto_3

    :cond_7
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Misplaced rdf:li element"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_8
    :goto_3
    return-object v1

    :cond_9
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "XML namespace required for all elements and attributes"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method private static addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const-string/jumbo v0, "xml:lang"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    nop

    new-instance v1, Lcom/adobe/xmp/impl/XMPNode;

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/adobe/xmp/impl/Utils;->normalizeLangValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :cond_0
    const/4 v0, 0x0

    invoke-direct {v1, p1, p2, v0}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    invoke-virtual {p0, v1}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    return-object v1
.end method

.method private static fixupQualifiedNode(Lcom/adobe/xmp/impl/XMPNode;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    nop

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v1

    nop

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1, v0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/adobe/xmp/impl/XMPNode;->removeQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    invoke-virtual {p0, v2}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_0

    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 v0, 0xcb

    const-string v1, "Redundant xml:lang for rdf:value element"

    invoke-direct {p0, v1, v0}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_1
    :goto_0
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getQualifierLength()I

    move-result v2

    if-gt v0, v2, :cond_2

    invoke-virtual {v1, v0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifier(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x2

    :goto_1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v2

    if-gt v0, v2, :cond_3

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    nop

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->setHasValueChild(Z)V

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/adobe/xmp/options/PropertyOptions;->setStruct(Z)Lcom/adobe/xmp/options/PropertyOptions;

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/adobe/xmp/options/PropertyOptions;->mergeWith(Lcom/adobe/xmp/options/PropertyOptions;)V

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->removeChildren()V

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {p0, v1}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_2

    :cond_4
    return-void
.end method

.method private static getRDFTermKind(Lorg/w3c/dom/Node;)I
    .locals 3

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    const-string v2, "about"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "ID"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    instance-of v2, p0, Lorg/w3c/dom/Attr;

    if-eqz v2, :cond_1

    const-string v2, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    check-cast p0, Lorg/w3c/dom/Attr;

    invoke-interface {p0}, Lorg/w3c/dom/Attr;->getOwnerElement()Lorg/w3c/dom/Element;

    move-result-object p0

    invoke-interface {p0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-string v1, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    :cond_1
    const-string p0, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const-string p0, "li"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/16 p0, 0x9

    return p0

    :cond_2
    const-string p0, "parseType"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    const/4 p0, 0x4

    return p0

    :cond_3
    const-string p0, "Description"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    const/16 p0, 0x8

    return p0

    :cond_4
    const-string p0, "about"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    const/4 p0, 0x3

    return p0

    :cond_5
    const-string p0, "resource"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    const/4 p0, 0x5

    return p0

    :cond_6
    const-string p0, "RDF"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7

    const/4 p0, 0x1

    return p0

    :cond_7
    const-string p0, "ID"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    const/4 p0, 0x2

    return p0

    :cond_8
    const-string p0, "nodeID"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_9

    const/4 p0, 0x6

    return p0

    :cond_9
    const-string p0, "datatype"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_a

    const/4 p0, 0x7

    return p0

    :cond_a
    const-string p0, "aboutEach"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_b

    const/16 p0, 0xa

    return p0

    :cond_b
    const-string p0, "aboutEachPrefix"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_c

    const/16 p0, 0xb

    return p0

    :cond_c
    const-string p0, "bagID"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_d

    const/16 p0, 0xc

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method

.method private static isCoreSyntaxTerm(I)Z
    .locals 2

    const/4 v0, 0x1

    if-gt v0, p0, :cond_0

    const/4 v1, 0x7

    if-gt p0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isOldTerm(I)Z
    .locals 1

    const/16 v0, 0xa

    if-gt v0, p0, :cond_0

    const/16 v0, 0xc

    if-gt p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isPropertyElementName(I)Z
    .locals 1

    const/16 v0, 0x8

    if-eq p0, v0, :cond_1

    invoke-static {p0}, Lcom/adobe/xmp/impl/ParseRDF;->isOldTerm(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/adobe/xmp/impl/ParseRDF;->isCoreSyntaxTerm(I)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return p0
.end method

.method private static isWhitespaceNode(Lorg/w3c/dom/Node;)Z
    .locals 3

    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    return v1

    :cond_0
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object p0

    move v0, v1

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_1

    return v1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method static parse(Lorg/w3c/dom/Node;)Lcom/adobe/xmp/impl/XMPMetaImpl;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Lcom/adobe/xmp/impl/XMPMetaImpl;

    invoke-direct {v0}, Lcom/adobe/xmp/impl/XMPMetaImpl;-><init>()V

    invoke-static {v0, p0}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_RDF(Lcom/adobe/xmp/impl/XMPMetaImpl;Lorg/w3c/dom/Node;)V

    return-object v0
.end method

.method private static rdf_EmptyPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    move-object v0, p0

    nop

    nop

    nop

    nop

    nop

    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v1

    const/16 v2, 0xca

    if-nez v1, :cond_16

    const/4 v1, 0x0

    const/4 v3, 0x0

    move v4, v1

    move v5, v4

    move v7, v5

    move v8, v7

    move-object v6, v3

    move v3, v8

    :goto_0
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v9

    const/4 v10, 0x2

    const/4 v11, 0x1

    if-ge v3, v9, :cond_a

    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v9

    invoke-interface {v9, v3}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    const-string/jumbo v12, "xmlns"

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v12

    if-nez v12, :cond_0

    const-string/jumbo v12, "xmlns"

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-static {v9}, Lcom/adobe/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v12

    const/16 v13, 0xcb

    if-eqz v12, :cond_6

    if-eq v12, v10, :cond_5

    packed-switch v12, :pswitch_data_0

    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Unrecognized attribute of empty property element"

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :pswitch_0
    if-nez v5, :cond_1

    nop

    nop

    move v8, v11

    goto :goto_1

    :cond_1
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Empty property element can\'t have both rdf:resource and rdf:nodeID"

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :pswitch_1
    if-nez v8, :cond_4

    if-nez v4, :cond_3

    nop

    if-nez v4, :cond_2

    nop

    move-object v6, v9

    :cond_2
    move v5, v11

    goto :goto_1

    :cond_3
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Empty property element can\'t have both rdf:value and rdf:resource"

    invoke-direct {v0, v1, v13}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_4
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Empty property element can\'t have both rdf:resource and rdf:nodeID"

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_5
    goto :goto_1

    :cond_6
    const-string/jumbo v10, "value"

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    const-string v10, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    if-nez v5, :cond_7

    nop

    nop

    move-object v6, v9

    move v4, v11

    goto :goto_1

    :cond_7
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Empty property element can\'t have both rdf:value and rdf:resource"

    invoke-direct {v0, v1, v13}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :cond_8
    const-string/jumbo v10, "xml:lang"

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_9

    nop

    move v7, v11

    :cond_9
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_a
    const-string v3, ""

    move-object v8, p1

    move-object/from16 v9, p2

    move/from16 v12, p3

    invoke-static {v0, v8, v9, v3, v12}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v3

    nop

    if-nez v4, :cond_c

    if-eqz v5, :cond_b

    goto :goto_2

    :cond_b
    if-eqz v7, :cond_e

    invoke-virtual {v3}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4, v11}, Lcom/adobe/xmp/options/PropertyOptions;->setStruct(Z)Lcom/adobe/xmp/options/PropertyOptions;

    goto :goto_4

    :cond_c
    :goto_2
    if-eqz v6, :cond_d

    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    :cond_d
    const-string v5, ""

    :goto_3
    invoke-virtual {v3, v5}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    if-nez v4, :cond_e

    invoke-virtual {v3}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4, v11}, Lcom/adobe/xmp/options/PropertyOptions;->setURI(Z)Lcom/adobe/xmp/options/PropertyOptions;

    :cond_e
    move v11, v1

    :goto_4
    move v4, v1

    :goto_5
    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v5

    if-ge v4, v5, :cond_15

    invoke-interface/range {p2 .. p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v5

    invoke-interface {v5, v4}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    if-eq v5, v6, :cond_14

    const-string/jumbo v7, "xmlns"

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_14

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_f

    const-string/jumbo v7, "xmlns"

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f

    goto :goto_6

    :cond_f
    invoke-static {v5}, Lcom/adobe/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v7

    if-eqz v7, :cond_11

    if-eq v7, v10, :cond_10

    packed-switch v7, :pswitch_data_1

    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Unrecognized attribute of empty property element"

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    :pswitch_2
    const-string v7, "rdf:resource"

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v7, v5}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_6

    :cond_10
    :pswitch_3
    goto :goto_6

    :cond_11
    if-nez v11, :cond_12

    nop

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v7, v5}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_6

    :cond_12
    const-string/jumbo v7, "xml:lang"

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13

    const-string/jumbo v7, "xml:lang"

    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v7, v5}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_6

    :cond_13
    invoke-interface {v5}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v3, v5, v7, v1}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    nop

    :cond_14
    :goto_6
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_5

    :cond_15
    return-void

    :cond_16
    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "Nested content not allowed with rdf:resource or property attributes"

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x5
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private static rdf_LiteralPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0, p3}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p0

    const/4 p1, 0x0

    move p3, p1

    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v0

    const/16 v1, 0xca

    if-ge p3, v0, :cond_4

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    invoke-interface {v0, p3}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    const-string/jumbo v2, "xmlns"

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "xmlns"

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "xml:lang"

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string/jumbo v1, "xml:lang"

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v1, v0}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_1

    :cond_1
    const-string v0, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "ID"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "datatype"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Invalid attribute for literal property element"

    invoke-direct {p0, p1, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_3
    :goto_1
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_4
    const-string p3, ""

    :goto_2
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    if-ge p1, v0, :cond_6

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_5

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    :cond_5
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Invalid child of literal property element"

    invoke-direct {p0, p1, v1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_6
    invoke-virtual {p0, p3}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    return-void
.end method

.method private static rdf_NodeElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_1

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0xca

    const-string p2, "Node element must be rdf:Description or typed node"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_1
    :goto_0
    if-eqz p3, :cond_3

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0xcb

    const-string p2, "Top level typed node not allowed"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_3
    :goto_1
    invoke-static {p0, p1, p2, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_NodeElementAttrs(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    invoke-static {p0, p1, p2, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_PropertyElementList(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    return-void
.end method

.method private static rdf_NodeElementAttrs(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    nop

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v2

    if-ge v0, v2, :cond_7

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    invoke-interface {v2, v0}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    const-string/jumbo v3, "xmlns"

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    const-string/jumbo v3, "xmlns"

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    :cond_0
    invoke-static {v2}, Lcom/adobe/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v3

    if-eqz v3, :cond_5

    const/4 v4, 0x6

    const/16 v5, 0xca

    if-eq v3, v4, :cond_1

    packed-switch v3, :pswitch_data_0

    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Invalid nodeElement attribute"

    invoke-direct {p0, p1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_1
    :pswitch_0
    if-gtz v1, :cond_4

    add-int/lit8 v1, v1, 0x1

    if-eqz p3, :cond_6

    const/4 v4, 0x3

    if-ne v3, v4, :cond_6

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0xcb

    const-string p2, "Mismatched top level rdf:about values"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_3
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/adobe/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Mutally exclusive about, ID, nodeID attributes"

    invoke-direct {p0, p1, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_5
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, p1, v2, v3, p3}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    nop

    :cond_6
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_7
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static rdf_NodeElementList(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/xmp/impl/ParseRDF;->isWhitespaceNode(Lorg/w3c/dom/Node;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    invoke-static {p0, p1, v1, v2}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_NodeElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static rdf_ParseTypeCollectionPropertyElement()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "ParseTypeCollection property element not allowed"

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static rdf_ParseTypeLiteralPropertyElement()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "ParseTypeLiteral property element not allowed"

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static rdf_ParseTypeOtherPropertyElement()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    new-instance v0, Lcom/adobe/xmp/XMPException;

    const-string v1, "ParseTypeOther property element not allowed"

    const/16 v2, 0xcb

    invoke-direct {v0, v1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method private static rdf_ParseTypeResourcePropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const-string v0, ""

    invoke-static {p0, p1, p2, v0, p3}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object p3

    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Lcom/adobe/xmp/options/PropertyOptions;->setStruct(Z)Lcom/adobe/xmp/options/PropertyOptions;

    const/4 p3, 0x0

    move v0, p3

    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_4

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    const-string/jumbo v2, "xmlns"

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "xmlns"

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "xml:lang"

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string/jumbo v2, "xml:lang"

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v2, v1}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_1

    :cond_1
    const-string v1, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "ID"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "parseType"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0xca

    const-string p2, "Invalid attribute for ParseTypeResource property element"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    invoke-static {p0, p1, p2, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_PropertyElementList(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getHasValueChild()Z

    move-result p0

    if-eqz p0, :cond_5

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParseRDF;->fixupQualifiedNode(Lcom/adobe/xmp/impl/XMPNode;)V

    :cond_5
    return-void
.end method

.method private static rdf_PropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-static {p2}, Lcom/adobe/xmp/impl/ParseRDF;->getRDFTermKind(Lorg/w3c/dom/Node;)I

    move-result v0

    invoke-static {v0}, Lcom/adobe/xmp/impl/ParseRDF;->isPropertyElementName(I)Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v3, v1

    move v1, v2

    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v4

    if-ge v1, v4, :cond_3

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    const-string/jumbo v5, "xmlns"

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_2

    const-string/jumbo v5, "xmlns"

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_0
    if-nez v3, :cond_1

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    :cond_1
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    if-eqz v3, :cond_4

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v3}, Lorg/w3c/dom/NamedNodeMap;->removeNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    goto :goto_1

    :cond_4
    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v1

    const/4 v3, 0x3

    if-le v1, v3, :cond_5

    invoke-static {p0, p1, p2, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_EmptyPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto/16 :goto_7

    :cond_5
    move v1, v2

    :goto_2
    invoke-interface {v0}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v4

    if-ge v1, v4, :cond_e

    invoke-interface {v0, v1}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "xml:lang"

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    const-string v4, "ID"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    const-string v4, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    goto :goto_3

    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_7
    :goto_3
    const-string v0, "datatype"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-static {p0, p1, p2, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_LiteralPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto :goto_5

    :cond_8
    const-string v0, "parseType"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    const-string v0, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_4

    :cond_9
    const-string v0, "Literal"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-static {}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_ParseTypeLiteralPropertyElement()V

    goto :goto_5

    :cond_a
    const-string v0, "Resource"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {p0, p1, p2, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_ParseTypeResourcePropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto :goto_5

    :cond_b
    const-string p0, "Collection"

    invoke-virtual {p0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_c

    invoke-static {}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_ParseTypeCollectionPropertyElement()V

    goto :goto_5

    :cond_c
    invoke-static {}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_ParseTypeOtherPropertyElement()V

    goto :goto_5

    :cond_d
    :goto_4
    invoke-static {p0, p1, p2, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_EmptyPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    :goto_5
    return-void

    :cond_e
    invoke-interface {p2}, Lorg/w3c/dom/Node;->hasChildNodes()Z

    move-result v0

    if-eqz v0, :cond_11

    :goto_6
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v0

    if-ge v2, v0, :cond_10

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-interface {v0, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v0

    if-eq v0, v3, :cond_f

    invoke-static {p0, p1, p2, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_ResourcePropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    return-void

    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_10
    invoke-static {p0, p1, p2, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_LiteralPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    goto :goto_7

    :cond_11
    invoke-static {p0, p1, p2, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_EmptyPropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    :goto_7
    return-void

    :cond_12
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0xca

    const-string p2, "Invalid property element name"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method private static rdf_PropertyElementList(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/xmp/impl/ParseRDF;->isWhitespaceNode(Lorg/w3c/dom/Node;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    invoke-static {p0, p1, v1, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_PropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0xca

    const-string p2, "Expected property element node not found"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_2
    return-void
.end method

.method static rdf_RDF(Lcom/adobe/xmp/impl/XMPMetaImpl;Lorg/w3c/dom/Node;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    invoke-interface {p1}, Lorg/w3c/dom/Node;->hasAttributes()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    invoke-static {p0, v0, p1}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_NodeElementList(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;)V

    return-void

    :cond_0
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0xca

    const-string v0, "Invalid attributes of rdf:RDF element"

    invoke-direct {p0, v0, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method

.method private static rdf_ResourcePropertyElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    if-eqz p3, :cond_0

    const-string v0, "iX:changes"

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, ""

    invoke-static {p0, p1, p2, v0, p3}, Lcom/adobe/xmp/impl/ParseRDF;->addChildNode(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object p1

    const/4 p3, 0x0

    move v0, p3

    :goto_0
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v1

    const/16 v2, 0xca

    if-ge v0, v1, :cond_5

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    const-string/jumbo v3, "xmlns"

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getPrefix()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    const-string/jumbo v3, "xmlns"

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    invoke-interface {v1}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "xml:lang"

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string/jumbo v2, "xml:lang"

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v2, v1}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_1

    :cond_2
    const-string v1, "ID"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Invalid attribute for resource property element"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_4
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    nop

    nop

    move v0, p3

    move v1, v0

    :goto_2
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    invoke-interface {v3}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v0, v3, :cond_10

    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    invoke-interface {v3, v0}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/xmp/impl/ParseRDF;->isWhitespaceNode(Lorg/w3c/dom/Node;)Z

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_f

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v4

    if-ne v4, v5, :cond_d

    if-nez v1, :cond_d

    const-string v1, "http://www.w3.org/1999/02/22-rdf-syntax-ns#"

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getLocalName()Ljava/lang/String;

    move-result-object v4

    if-eqz v1, :cond_6

    const-string v6, "Bag"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArray(Z)Lcom/adobe/xmp/options/PropertyOptions;

    goto :goto_3

    :cond_6
    if-eqz v1, :cond_7

    const-string v6, "Seq"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArray(Z)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArrayOrdered(Z)Lcom/adobe/xmp/options/PropertyOptions;

    goto :goto_3

    :cond_7
    if-eqz v1, :cond_8

    const-string v6, "Alt"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArray(Z)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArrayOrdered(Z)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArrayAlternate(Z)Lcom/adobe/xmp/options/PropertyOptions;

    goto :goto_3

    :cond_8
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setStruct(Z)Lcom/adobe/xmp/options/PropertyOptions;

    if-nez v1, :cond_a

    const-string v1, "Description"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    invoke-interface {v3}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_9

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x3a

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, "rdf:type"

    invoke-static {p1, v4, v1}, Lcom/adobe/xmp/impl/ParseRDF;->addQualifierNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/XMPNode;

    goto :goto_3

    :cond_9
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const/16 p1, 0xcb

    const-string p2, "All XML elements must be in a namespace"

    invoke-direct {p0, p2, p1}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_a
    :goto_3
    invoke-static {p0, p1, v3, p3}, Lcom/adobe/xmp/impl/ParseRDF;->rdf_NodeElement(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/impl/XMPNode;Lorg/w3c/dom/Node;Z)V

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getHasValueChild()Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-static {p1}, Lcom/adobe/xmp/impl/ParseRDF;->fixupQualifiedNode(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_4

    :cond_b
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAlternate()Z

    move-result v1

    if-eqz v1, :cond_c

    invoke-static {p1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->detectAltText(Lcom/adobe/xmp/impl/XMPNode;)V

    :cond_c
    :goto_4
    nop

    nop

    move v1, v5

    goto :goto_5

    :cond_d
    if-eqz v1, :cond_e

    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Invalid child of resource property element"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_e
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Children of resource property element must be XML elements"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0

    :cond_f
    :goto_5
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2

    :cond_10
    if-eqz v1, :cond_11

    return-void

    :cond_11
    new-instance p0, Lcom/adobe/xmp/XMPException;

    const-string p1, "Missing child of resource property element"

    invoke-direct {p0, p1, v2}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw p0
.end method
