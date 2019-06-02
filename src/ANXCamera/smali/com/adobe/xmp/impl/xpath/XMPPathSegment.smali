.class public Lcom/adobe/xmp/impl/xpath/XMPPathSegment;
.super Ljava/lang/Object;
.source "XMPPathSegment.java"


# instance fields
.field private alias:Z

.field private aliasForm:I

.field private kind:I

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    iput p2, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->kind:I

    return-void
.end method


# virtual methods
.method public getAliasForm()I
    .locals 1

    iget v0, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->aliasForm:I

    return v0
.end method

.method public getKind()I
    .locals 1

    iget v0, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->kind:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    return-object v0
.end method

.method public isAlias()Z
    .locals 1

    iget-boolean v0, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->alias:Z

    return v0
.end method

.method public setAlias(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->alias:Z

    return-void
.end method

.method public setAliasForm(I)V
    .locals 0

    iput p1, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->aliasForm:I

    return-void
.end method

.method public setKind(I)V
    .locals 0

    iput p1, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->kind:I

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget v0, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->kind:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    return-object v0

    :pswitch_0
    iget-object v0, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    return-object v0

    :pswitch_1
    iget-object v0, p0, Lcom/adobe/xmp/impl/xpath/XMPPathSegment;->name:Ljava/lang/String;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
