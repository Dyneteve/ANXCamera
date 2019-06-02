.class public final Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$ExtendableBuilder;
.source "ClientEventProto.java"

# interfaces
.implements Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProtoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$ExtendableBuilder<",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$Builder;",
        ">;",
        "Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProtoOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-static {}, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;->access$000()Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$ExtendableBuilder;-><init>(Lcom/google/protobuf/GeneratedMessageLite$ExtendableMessage;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearEventId()Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$Builder;
    .locals 1

    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;

    invoke-static {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;->access$200(Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;)V

    return-object p0
.end method

.method public getEventId()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;->getEventId()I

    move-result v0

    return v0
.end method

.method public hasEventId()Z
    .locals 1

    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;

    invoke-virtual {v0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;->hasEventId()Z

    move-result v0

    return v0
.end method

.method public setEventId(I)Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$Builder;->copyOnWrite()V

    iget-object v0, p0, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto$Builder;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;

    invoke-static {v0, p1}, Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;->access$100(Lcom/google/android/apps/gsa/search/shared/service/proto/ClientEventProto;I)V

    return-object p0
.end method
