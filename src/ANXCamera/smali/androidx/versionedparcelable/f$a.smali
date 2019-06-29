.class Landroidx/versionedparcelable/f$a;
.super Ljava/lang/Object;
.source "VersionedParcelStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/versionedparcelable/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final aS:Ljava/io/ByteArrayOutputStream;

.field private final aT:Ljava/io/DataOutputStream;

.field private final aU:I

.field private final aV:Ljava/io/DataOutputStream;


# direct methods
.method constructor <init>(ILjava/io/DataOutputStream;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Landroidx/versionedparcelable/f$a;->aS:Ljava/io/ByteArrayOutputStream;

    new-instance v0, Ljava/io/DataOutputStream;

    iget-object v1, p0, Landroidx/versionedparcelable/f$a;->aS:Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Landroidx/versionedparcelable/f$a;->aT:Ljava/io/DataOutputStream;

    iput p1, p0, Landroidx/versionedparcelable/f$a;->aU:I

    iput-object p2, p0, Landroidx/versionedparcelable/f$a;->aV:Ljava/io/DataOutputStream;

    return-void
.end method

.method static synthetic a(Landroidx/versionedparcelable/f$a;)Ljava/io/ByteArrayOutputStream;
    .locals 0

    iget-object p0, p0, Landroidx/versionedparcelable/f$a;->aS:Ljava/io/ByteArrayOutputStream;

    return-object p0
.end method

.method static synthetic b(Landroidx/versionedparcelable/f$a;)Ljava/io/DataOutputStream;
    .locals 0

    iget-object p0, p0, Landroidx/versionedparcelable/f$a;->aT:Ljava/io/DataOutputStream;

    return-object p0
.end method


# virtual methods
.method z()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Landroidx/versionedparcelable/f$a;->aT:Ljava/io/DataOutputStream;

    invoke-virtual {v0}, Ljava/io/DataOutputStream;->flush()V

    iget-object v0, p0, Landroidx/versionedparcelable/f$a;->aS:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    iget v1, p0, Landroidx/versionedparcelable/f$a;->aU:I

    shl-int/lit8 v1, v1, 0x10

    const v2, 0xffff

    if-lt v0, v2, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v0

    :goto_0
    or-int/2addr v1, v3

    iget-object v3, p0, Landroidx/versionedparcelable/f$a;->aV:Ljava/io/DataOutputStream;

    invoke-virtual {v3, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    if-lt v0, v2, :cond_1

    iget-object v1, p0, Landroidx/versionedparcelable/f$a;->aV:Ljava/io/DataOutputStream;

    invoke-virtual {v1, v0}, Ljava/io/DataOutputStream;->writeInt(I)V

    :cond_1
    iget-object v0, p0, Landroidx/versionedparcelable/f$a;->aS:Ljava/io/ByteArrayOutputStream;

    iget-object v1, p0, Landroidx/versionedparcelable/f$a;->aV:Ljava/io/DataOutputStream;

    invoke-virtual {v0, v1}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    return-void
.end method
