.class public final Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;
.source "LensSdkParamsProto.java"

# interfaces
.implements Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParamsOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$Builder<",
        "Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;",
        "Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;",
        ">;",
        "Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParamsOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-static {}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$000()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearAgsaVersionName()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$500(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V

    return-object p0
.end method

.method public clearArStickersAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$1000(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V

    return-object p0
.end method

.method public clearLensAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$800(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V

    return-object p0
.end method

.method public clearLensSdkVersion()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$200(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;)V

    return-object p0
.end method

.method public getAgsaVersionName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getAgsaVersionName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getAgsaVersionNameBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getAgsaVersionNameBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public getArStickersAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getArStickersAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;

    move-result-object v0

    return-object v0
.end method

.method public getLensAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getLensAvailabilityStatus()Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;

    move-result-object v0

    return-object v0
.end method

.method public getLensSdkVersion()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getLensSdkVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLensSdkVersionBytes()Lcom/google/protobuf/ByteString;
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->getLensSdkVersionBytes()Lcom/google/protobuf/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public hasAgsaVersionName()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->hasAgsaVersionName()Z

    move-result v0

    return v0
.end method

.method public hasArStickersAvailabilityStatus()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->hasArStickersAvailabilityStatus()Z

    move-result v0

    return v0
.end method

.method public hasLensAvailabilityStatus()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->hasLensAvailabilityStatus()Z

    move-result v0

    return v0
.end method

.method public hasLensSdkVersion()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-virtual {v0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->hasLensSdkVersion()Z

    move-result v0

    return v0
.end method

.method public setAgsaVersionName(Ljava/lang/String;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$400(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Ljava/lang/String;)V

    return-object p0
.end method

.method public setAgsaVersionNameBytes(Lcom/google/protobuf/ByteString;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$600(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/protobuf/ByteString;)V

    return-object p0
.end method

.method public setArStickersAvailabilityStatus(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$900(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)V

    return-object p0
.end method

.method public setLensAvailabilityStatus(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$700(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$LensAvailabilityStatus;)V

    return-object p0
.end method

.method public setLensSdkVersion(Ljava/lang/String;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$100(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Ljava/lang/String;)V

    return-object p0
.end method

.method public setLensSdkVersionBytes(Lcom/google/protobuf/ByteString;)Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;

    invoke-static {v0, p1}, Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;->access$300(Lcom/google/android/apps/lens/library/base/proto/LensSdkParamsProto$LensSdkParams;Lcom/google/protobuf/ByteString;)V

    return-object p0
.end method
