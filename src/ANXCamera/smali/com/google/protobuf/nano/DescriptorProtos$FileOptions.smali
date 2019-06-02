.class public final Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;
.super Lcom/google/protobuf/nano/ExtendableMessageNano;
.source "DescriptorProtos.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/nano/DescriptorProtos;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FileOptions"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/protobuf/nano/DescriptorProtos$FileOptions$OptimizeMode;,
        Lcom/google/protobuf/nano/DescriptorProtos$FileOptions$CompatibilityLevel;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/nano/ExtendableMessageNano<",
        "Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile _emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;


# instance fields
.field public ccApiVersion:I

.field public ccEnableArenas:Z

.field public ccGenericServices:Z

.field public ccUtf8Verification:Z

.field public csharpNamespace:Ljava/lang/String;

.field public deprecated:Z

.field public goPackage:Ljava/lang/String;

.field public javaAltApiPackage:Ljava/lang/String;

.field public javaApiVersion:I

.field public javaEnableDualGenerateMutableApi:Z

.field public javaGenericServices:Z

.field public javaJava5Enums:Z

.field public javaMultipleFiles:Z

.field public javaMultipleFilesMutablePackage:Ljava/lang/String;

.field public javaMutableApi:Z

.field public javaOuterClassname:Ljava/lang/String;

.field public javaPackage:Ljava/lang/String;

.field public javaStringCheckUtf8:Z

.field public javaUseJavaproto2:Z

.field public javaUseJavastrings:Z

.field public javascriptPackage:Ljava/lang/String;

.field public objcClassPrefix:Ljava/lang/String;

.field public optimizeFor:I
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$FileOptions$OptimizeMode;
    .end annotation
.end field

.field public phpClassPrefix:Ljava/lang/String;

.field public phpGenericServices:Z

.field public phpNamespace:Ljava/lang/String;

.field public pyApiVersion:I

.field public pyGenericServices:Z

.field public swiftPrefix:Ljava/lang/String;

.field public szlApiVersion:I

.field public uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;-><init>()V

    invoke-virtual {p0}, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->clear()Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;

    return-void
.end method

.method public static checkCompatibilityLevelOrThrow(I)I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$FileOptions$CompatibilityLevel;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    if-ltz p0, :cond_0

    if-gtz p0, :cond_0

    return p0

    :cond_0
    const/16 v0, 0x64

    if-lt p0, v0, :cond_1

    if-gt p0, v0, :cond_1

    return p0

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/16 v1, 0x32

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is not a valid enum CompatibilityLevel"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkCompatibilityLevelOrThrow([I)[I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$FileOptions$CompatibilityLevel;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p0, v1

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->checkCompatibilityLevelOrThrow(I)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static checkOptimizeModeOrThrow(I)I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$FileOptions$OptimizeMode;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    const/4 v0, 0x1

    if-lt p0, v0, :cond_0

    const/4 v0, 0x3

    if-gt p0, v0, :cond_0

    return p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const/16 v1, 0x2c

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " is not a valid enum OptimizeMode"

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static checkOptimizeModeOrThrow([I)[I
    .locals 3
    .annotation build Lcom/google/protobuf/nano/NanoEnumValue;
        legacy = false
        value = Lcom/google/protobuf/nano/DescriptorProtos$FileOptions$OptimizeMode;
    .end annotation

    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "values"
        }
    .end annotation

    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I

    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p0, v1

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->checkOptimizeModeOrThrow(I)I

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public static emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;
    .locals 2

    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/protobuf/nano/InternalNano;->LAZY_INIT_LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;

    sput-object v1, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->_emptyArray:[Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;

    return-object v0
.end method

.method public static parseFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;

    move-result-object p0

    return-object p0
.end method

.method public static parseFrom([B)Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "data"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/nano/InvalidProtocolBufferNanoException;
        }
    .end annotation

    new-instance v0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;

    invoke-direct {v0}, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;-><init>()V

    invoke-static {v0, p0}, Lcom/google/protobuf/nano/MessageNano;->mergeFrom(Lcom/google/protobuf/nano/MessageNano;[B)Lcom/google/protobuf/nano/MessageNano;

    move-result-object p0

    check-cast p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;

    return-object p0
.end method


# virtual methods
.method public clear()Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;
    .locals 3

    const/4 v0, 0x2

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccApiVersion:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccUtf8Verification:Z

    const-string v2, ""

    iput-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaPackage:Ljava/lang/String;

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyApiVersion:I

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaApiVersion:I

    iput-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavaproto2:Z

    iput-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaJava5Enums:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavastrings:Z

    const-string v2, ""

    iput-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaAltApiPackage:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaEnableDualGenerateMutableApi:Z

    const-string v2, ""

    iput-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaOuterClassname:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFiles:Z

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaStringCheckUtf8:Z

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMutableApi:Z

    const-string v2, ""

    iput-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFilesMutablePackage:Ljava/lang/String;

    iput v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->optimizeFor:I

    const-string v2, ""

    iput-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->goPackage:Ljava/lang/String;

    const-string v2, ""

    iput-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javascriptPackage:Ljava/lang/String;

    iput v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->szlApiVersion:I

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccGenericServices:Z

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaGenericServices:Z

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyGenericServices:Z

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpGenericServices:Z

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->deprecated:Z

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccEnableArenas:Z

    const-string v0, ""

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->objcClassPrefix:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->csharpNamespace:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->swiftPrefix:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpClassPrefix:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpNamespace:Ljava/lang/String;

    invoke-static {}, Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;->emptyArray()[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->unknownFieldData:Lcom/google/protobuf/nano/FieldArray;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->cachedSize:I

    return-object p0
.end method

.method protected computeSerializedSize()I
    .locals 5

    invoke-super {p0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->computeSerializedSize()I

    move-result v0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaPackage:Ljava/lang/String;

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaPackage:Ljava/lang/String;

    const-string v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaPackage:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccApiVersion:I

    const/4 v3, 0x2

    if-eq v1, v3, :cond_1

    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccApiVersion:I

    invoke-static {v3, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyApiVersion:I

    if-eq v1, v3, :cond_2

    const/4 v1, 0x4

    iget v4, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyApiVersion:I

    invoke-static {v1, v4}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_2
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaApiVersion:I

    if-eq v1, v3, :cond_3

    const/4 v1, 0x5

    iget v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaApiVersion:I

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_3
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavaproto2:Z

    if-eq v1, v2, :cond_4

    const/4 v1, 0x6

    iget-boolean v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavaproto2:Z

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_4
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaJava5Enums:Z

    if-eq v1, v2, :cond_5

    const/4 v1, 0x7

    iget-boolean v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaJava5Enums:Z

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_5
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaOuterClassname:Ljava/lang/String;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaOuterClassname:Ljava/lang/String;

    const-string v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    const/16 v1, 0x8

    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaOuterClassname:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_6
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->optimizeFor:I

    if-eq v1, v2, :cond_7

    const/16 v1, 0x9

    iget v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->optimizeFor:I

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_7
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFiles:Z

    if-eqz v1, :cond_8

    const/16 v1, 0xa

    iget-boolean v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFiles:Z

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_8
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->goPackage:Ljava/lang/String;

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->goPackage:Ljava/lang/String;

    const-string v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    const/16 v1, 0xb

    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->goPackage:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_9
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javascriptPackage:Ljava/lang/String;

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javascriptPackage:Ljava/lang/String;

    const-string v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    const/16 v1, 0xc

    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javascriptPackage:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_a
    iget v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->szlApiVersion:I

    if-eq v1, v2, :cond_b

    const/16 v1, 0xe

    iget v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->szlApiVersion:I

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeInt32Size(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_b
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccGenericServices:Z

    if-eqz v1, :cond_c

    const/16 v1, 0x10

    iget-boolean v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccGenericServices:Z

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_c
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaGenericServices:Z

    if-eqz v1, :cond_d

    const/16 v1, 0x11

    iget-boolean v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaGenericServices:Z

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_d
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyGenericServices:Z

    if-eqz v1, :cond_e

    const/16 v1, 0x12

    iget-boolean v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyGenericServices:Z

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_e
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaAltApiPackage:Ljava/lang/String;

    if-eqz v1, :cond_f

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaAltApiPackage:Ljava/lang/String;

    const-string v3, ""

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    const/16 v1, 0x13

    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaAltApiPackage:Ljava/lang/String;

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_f
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavastrings:Z

    if-eqz v1, :cond_10

    const/16 v1, 0x15

    iget-boolean v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavastrings:Z

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_10
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->deprecated:Z

    if-eqz v1, :cond_11

    const/16 v1, 0x17

    iget-boolean v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->deprecated:Z

    invoke-static {v1, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_11
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccUtf8Verification:Z

    if-eq v1, v2, :cond_12

    const/16 v1, 0x18

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccUtf8Verification:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_12
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaEnableDualGenerateMutableApi:Z

    if-eqz v1, :cond_13

    const/16 v1, 0x1a

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaEnableDualGenerateMutableApi:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_13
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaStringCheckUtf8:Z

    if-eqz v1, :cond_14

    const/16 v1, 0x1b

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaStringCheckUtf8:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_14
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMutableApi:Z

    if-eqz v1, :cond_15

    const/16 v1, 0x1c

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMutableApi:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_15
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFilesMutablePackage:Ljava/lang/String;

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFilesMutablePackage:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    const/16 v1, 0x1d

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFilesMutablePackage:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_16
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccEnableArenas:Z

    if-eqz v1, :cond_17

    const/16 v1, 0x1f

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccEnableArenas:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_17
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->objcClassPrefix:Ljava/lang/String;

    if-eqz v1, :cond_18

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->objcClassPrefix:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    const/16 v1, 0x24

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->objcClassPrefix:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_18
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->csharpNamespace:Ljava/lang/String;

    if-eqz v1, :cond_19

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->csharpNamespace:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_19

    const/16 v1, 0x25

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->csharpNamespace:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_19
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->swiftPrefix:Ljava/lang/String;

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->swiftPrefix:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    const/16 v1, 0x27

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->swiftPrefix:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1a
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpClassPrefix:Ljava/lang/String;

    if-eqz v1, :cond_1b

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpClassPrefix:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1b

    const/16 v1, 0x28

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpClassPrefix:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1b
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpNamespace:Ljava/lang/String;

    if-eqz v1, :cond_1c

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpNamespace:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    const/16 v1, 0x29

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpNamespace:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeStringSize(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1c
    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpGenericServices:Z

    if-eqz v1, :cond_1d

    const/16 v1, 0x2a

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpGenericServices:Z

    invoke-static {v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeBoolSize(IZ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_1d
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    array-length v1, v1

    if-lez v1, :cond_1f

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    array-length v2, v2

    if-ge v1, v2, :cond_1f

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    aget-object v2, v2, v1

    if-eqz v2, :cond_1e

    const/16 v3, 0x3e7

    invoke-static {v3, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->computeMessageSize(ILcom/google/protobuf/nano/MessageNano;)I

    move-result v2

    add-int/2addr v0, v2

    :cond_1e
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1f
    return v0
.end method

.method public mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1, v0}, Lcom/google/protobuf/nano/ExtendableMessageNano;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    move-result v0

    if-nez v0, :cond_3

    return-object p0

    :sswitch_0
    const/16 v0, 0x1f3a

    invoke-static {p1, v0}, Lcom/google/protobuf/nano/WireFormatNano;->getRepeatedFieldArrayLength(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)I

    move-result v0

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    array-length v1, v1

    :goto_1
    add-int/2addr v0, v1

    new-array v0, v0, [Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    if-eqz v1, :cond_1

    iget-object v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    invoke-static {v3, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    :goto_2
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_2

    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;-><init>()V

    aput-object v2, v0, v1

    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readTag()I

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_2
    new-instance v2, Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    invoke-direct {v2}, Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;-><init>()V

    aput-object v2, v0, v1

    aget-object v1, v0, v1

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readMessage(Lcom/google/protobuf/nano/MessageNano;)V

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    goto/16 :goto_3

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpGenericServices:Z

    goto/16 :goto_3

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpNamespace:Ljava/lang/String;

    goto/16 :goto_3

    :sswitch_3
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpClassPrefix:Ljava/lang/String;

    goto/16 :goto_3

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->swiftPrefix:Ljava/lang/String;

    goto/16 :goto_3

    :sswitch_5
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->csharpNamespace:Ljava/lang/String;

    goto/16 :goto_3

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->objcClassPrefix:Ljava/lang/String;

    goto/16 :goto_3

    :sswitch_7
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccEnableArenas:Z

    goto/16 :goto_3

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFilesMutablePackage:Ljava/lang/String;

    goto/16 :goto_3

    :sswitch_9
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMutableApi:Z

    goto/16 :goto_3

    :sswitch_a
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaStringCheckUtf8:Z

    goto/16 :goto_3

    :sswitch_b
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaEnableDualGenerateMutableApi:Z

    goto/16 :goto_3

    :sswitch_c
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccUtf8Verification:Z

    goto/16 :goto_3

    :sswitch_d
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->deprecated:Z

    goto/16 :goto_3

    :sswitch_e
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavastrings:Z

    goto/16 :goto_3

    :sswitch_f
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaAltApiPackage:Ljava/lang/String;

    goto/16 :goto_3

    :sswitch_10
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyGenericServices:Z

    goto/16 :goto_3

    :sswitch_11
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaGenericServices:Z

    goto/16 :goto_3

    :sswitch_12
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccGenericServices:Z

    goto/16 :goto_3

    :sswitch_13
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->szlApiVersion:I

    goto :goto_3

    :sswitch_14
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javascriptPackage:Ljava/lang/String;

    goto :goto_3

    :sswitch_15
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->goPackage:Ljava/lang/String;

    goto :goto_3

    :sswitch_16
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFiles:Z

    goto :goto_3

    :sswitch_17
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->getPosition()I

    move-result v1

    :try_start_0
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v2

    invoke-static {v2}, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->checkOptimizeModeOrThrow(I)I

    move-result v2

    iput v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->optimizeFor:I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v2

    invoke-virtual {p1, v1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->rewindToPosition(I)V

    invoke-virtual {p0, p1, v0}, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->storeUnknownField(Lcom/google/protobuf/nano/CodedInputByteBufferNano;I)Z

    goto :goto_3

    :sswitch_18
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaOuterClassname:Ljava/lang/String;

    goto :goto_3

    :sswitch_19
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaJava5Enums:Z

    goto :goto_3

    :sswitch_1a
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readBool()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavaproto2:Z

    goto :goto_3

    :sswitch_1b
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaApiVersion:I

    goto :goto_3

    :sswitch_1c
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyApiVersion:I

    goto :goto_3

    :sswitch_1d
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readInt32()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccApiVersion:I

    goto :goto_3

    :sswitch_1e
    invoke-virtual {p1}, Lcom/google/protobuf/nano/CodedInputByteBufferNano;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaPackage:Ljava/lang/String;

    goto :goto_3

    :sswitch_1f
    return-object p0

    :cond_3
    :goto_3
    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1f
        0xa -> :sswitch_1e
        0x10 -> :sswitch_1d
        0x20 -> :sswitch_1c
        0x28 -> :sswitch_1b
        0x30 -> :sswitch_1a
        0x38 -> :sswitch_19
        0x42 -> :sswitch_18
        0x48 -> :sswitch_17
        0x50 -> :sswitch_16
        0x5a -> :sswitch_15
        0x62 -> :sswitch_14
        0x70 -> :sswitch_13
        0x80 -> :sswitch_12
        0x88 -> :sswitch_11
        0x90 -> :sswitch_10
        0x9a -> :sswitch_f
        0xa8 -> :sswitch_e
        0xb8 -> :sswitch_d
        0xc0 -> :sswitch_c
        0xd0 -> :sswitch_b
        0xd8 -> :sswitch_a
        0xe0 -> :sswitch_9
        0xea -> :sswitch_8
        0xf8 -> :sswitch_7
        0x122 -> :sswitch_6
        0x12a -> :sswitch_5
        0x13a -> :sswitch_4
        0x142 -> :sswitch_3
        0x14a -> :sswitch_2
        0x150 -> :sswitch_1
        0x1f3a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "input"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->mergeFrom(Lcom/google/protobuf/nano/CodedInputByteBufferNano;)Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;

    move-result-object p1

    return-object p1
.end method

.method public writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "output"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaPackage:Ljava/lang/String;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaPackage:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaPackage:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_0
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccApiVersion:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccApiVersion:I

    invoke-virtual {p1, v2, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_1
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyApiVersion:I

    if-eq v0, v2, :cond_2

    const/4 v0, 0x4

    iget v3, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyApiVersion:I

    invoke-virtual {p1, v0, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_2
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaApiVersion:I

    if-eq v0, v2, :cond_3

    const/4 v0, 0x5

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaApiVersion:I

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_3
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavaproto2:Z

    if-eq v0, v1, :cond_4

    const/4 v0, 0x6

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavaproto2:Z

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_4
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaJava5Enums:Z

    if-eq v0, v1, :cond_5

    const/4 v0, 0x7

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaJava5Enums:Z

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_5
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaOuterClassname:Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaOuterClassname:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const/16 v0, 0x8

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaOuterClassname:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_6
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->optimizeFor:I

    if-eq v0, v1, :cond_7

    const/16 v0, 0x9

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->optimizeFor:I

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_7
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFiles:Z

    if-eqz v0, :cond_8

    const/16 v0, 0xa

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFiles:Z

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_8
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->goPackage:Ljava/lang/String;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->goPackage:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    const/16 v0, 0xb

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->goPackage:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_9
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javascriptPackage:Ljava/lang/String;

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javascriptPackage:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const/16 v0, 0xc

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javascriptPackage:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_a
    iget v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->szlApiVersion:I

    if-eq v0, v1, :cond_b

    const/16 v0, 0xe

    iget v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->szlApiVersion:I

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeInt32(II)V

    :cond_b
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccGenericServices:Z

    if-eqz v0, :cond_c

    const/16 v0, 0x10

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccGenericServices:Z

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_c
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaGenericServices:Z

    if-eqz v0, :cond_d

    const/16 v0, 0x11

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaGenericServices:Z

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_d
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyGenericServices:Z

    if-eqz v0, :cond_e

    const/16 v0, 0x12

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->pyGenericServices:Z

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_e
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaAltApiPackage:Ljava/lang/String;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaAltApiPackage:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    const/16 v0, 0x13

    iget-object v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaAltApiPackage:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_f
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavastrings:Z

    if-eqz v0, :cond_10

    const/16 v0, 0x15

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaUseJavastrings:Z

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_10
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->deprecated:Z

    if-eqz v0, :cond_11

    const/16 v0, 0x17

    iget-boolean v2, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->deprecated:Z

    invoke-virtual {p1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_11
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccUtf8Verification:Z

    if-eq v0, v1, :cond_12

    const/16 v0, 0x18

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccUtf8Verification:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_12
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaEnableDualGenerateMutableApi:Z

    if-eqz v0, :cond_13

    const/16 v0, 0x1a

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaEnableDualGenerateMutableApi:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_13
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaStringCheckUtf8:Z

    if-eqz v0, :cond_14

    const/16 v0, 0x1b

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaStringCheckUtf8:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_14
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMutableApi:Z

    if-eqz v0, :cond_15

    const/16 v0, 0x1c

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMutableApi:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_15
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFilesMutablePackage:Ljava/lang/String;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFilesMutablePackage:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    const/16 v0, 0x1d

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->javaMultipleFilesMutablePackage:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_16
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccEnableArenas:Z

    if-eqz v0, :cond_17

    const/16 v0, 0x1f

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->ccEnableArenas:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_17
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->objcClassPrefix:Ljava/lang/String;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->objcClassPrefix:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    const/16 v0, 0x24

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->objcClassPrefix:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_18
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->csharpNamespace:Ljava/lang/String;

    if-eqz v0, :cond_19

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->csharpNamespace:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    const/16 v0, 0x25

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->csharpNamespace:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_19
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->swiftPrefix:Ljava/lang/String;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->swiftPrefix:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    const/16 v0, 0x27

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->swiftPrefix:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_1a
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpClassPrefix:Ljava/lang/String;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpClassPrefix:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    const/16 v0, 0x28

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpClassPrefix:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_1b
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpNamespace:Ljava/lang/String;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpNamespace:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    const/16 v0, 0x29

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpNamespace:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeString(ILjava/lang/String;)V

    :cond_1c
    iget-boolean v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpGenericServices:Z

    if-eqz v0, :cond_1d

    const/16 v0, 0x2a

    iget-boolean v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->phpGenericServices:Z

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeBool(IZ)V

    :cond_1d
    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    if-eqz v0, :cond_1f

    iget-object v0, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    array-length v0, v0

    if-lez v0, :cond_1f

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    array-length v1, v1

    if-ge v0, v1, :cond_1f

    iget-object v1, p0, Lcom/google/protobuf/nano/DescriptorProtos$FileOptions;->uninterpretedOption:[Lcom/google/protobuf/nano/DescriptorProtos$UninterpretedOption;

    aget-object v1, v1, v0

    if-eqz v1, :cond_1e

    const/16 v2, 0x3e7

    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->writeMessage(ILcom/google/protobuf/nano/MessageNano;)V

    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1f
    invoke-super {p0, p1}, Lcom/google/protobuf/nano/ExtendableMessageNano;->writeTo(Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
