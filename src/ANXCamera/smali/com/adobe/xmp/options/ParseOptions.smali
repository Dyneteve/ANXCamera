.class public final Lcom/adobe/xmp/options/ParseOptions;
.super Lcom/adobe/xmp/options/Options;
.source "ParseOptions.java"


# static fields
.field public static final ACCEPT_LATIN_1:I = 0x10

.field public static final FIX_CONTROL_CHARS:I = 0x8

.field public static final OMIT_NORMALIZATION:I = 0x20

.field public static final REQUIRE_XMP_META:I = 0x1

.field public static final STRICT_ALIASING:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/adobe/xmp/options/Options;-><init>()V

    const/16 v0, 0x18

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/adobe/xmp/options/ParseOptions;->setOption(IZ)V

    return-void
.end method


# virtual methods
.method protected defineOptionName(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_4

    const/4 v0, 0x4

    if-eq p1, v0, :cond_3

    const/16 v0, 0x8

    if-eq p1, v0, :cond_2

    const/16 v0, 0x10

    if-eq p1, v0, :cond_1

    const/16 v0, 0x20

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const-string p1, "OMIT_NORMALIZATION"

    return-object p1

    :cond_1
    const-string p1, "ACCEPT_LATIN_1"

    return-object p1

    :cond_2
    const-string p1, "FIX_CONTROL_CHARS"

    return-object p1

    :cond_3
    const-string p1, "STRICT_ALIASING"

    return-object p1

    :cond_4
    const-string p1, "REQUIRE_XMP_META"

    return-object p1
.end method

.method public getAcceptLatin1()Z
    .locals 1

    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/ParseOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getFixControlChars()Z
    .locals 1

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/ParseOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getOmitNormalization()Z
    .locals 1

    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/ParseOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getRequireXMPMeta()Z
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/ParseOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method public getStrictAliasing()Z
    .locals 1

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/adobe/xmp/options/ParseOptions;->getOption(I)Z

    move-result v0

    return v0
.end method

.method protected getValidOptions()I
    .locals 1

    const/16 v0, 0x3d

    return v0
.end method

.method public setAcceptLatin1(Z)Lcom/adobe/xmp/options/ParseOptions;
    .locals 1

    const/16 v0, 0x10

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/ParseOptions;->setOption(IZ)V

    return-object p0
.end method

.method public setFixControlChars(Z)Lcom/adobe/xmp/options/ParseOptions;
    .locals 1

    const/16 v0, 0x8

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/ParseOptions;->setOption(IZ)V

    return-object p0
.end method

.method public setOmitNormalization(Z)Lcom/adobe/xmp/options/ParseOptions;
    .locals 1

    const/16 v0, 0x20

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/ParseOptions;->setOption(IZ)V

    return-object p0
.end method

.method public setRequireXMPMeta(Z)Lcom/adobe/xmp/options/ParseOptions;
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/ParseOptions;->setOption(IZ)V

    return-object p0
.end method

.method public setStrictAliasing(Z)Lcom/adobe/xmp/options/ParseOptions;
    .locals 1

    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1}, Lcom/adobe/xmp/options/ParseOptions;->setOption(IZ)V

    return-object p0
.end method
