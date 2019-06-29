.class public final Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$Builder;
.source "LensServiceEventData.java"

# interfaces
.implements Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventDataOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$Builder<",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;",
        ">;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventDataOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-static {}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->access$000()Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$Builder;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearServiceApiVersion()Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    invoke-static {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->access$200(Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;)V

    return-object p0
.end method

.method public getServiceApiVersion()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->getServiceApiVersion()I

    move-result v0

    return v0
.end method

.method public hasServiceApiVersion()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->hasServiceApiVersion()Z

    move-result v0

    return v0
.end method

.method public setServiceApiVersion(I)Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;

    invoke-static {v0, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;->access$100(Lcom/google/android/apps/gsa/search/shared/service/proto/LensServiceEventData;I)V

    return-object p0
.end method
