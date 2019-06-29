.class Landroidx/versionedparcelable/f$b;
.super Ljava/lang/Object;
.source "VersionedParcelStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/versionedparcelable/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field private final aU:I

.field private final aW:Ljava/io/DataInputStream;

.field private final mSize:I


# direct methods
.method constructor <init>(IILjava/io/DataInputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Landroidx/versionedparcelable/f$b;->mSize:I

    iput p1, p0, Landroidx/versionedparcelable/f$b;->aU:I

    iget p1, p0, Landroidx/versionedparcelable/f$b;->mSize:I

    new-array p1, p1, [B

    invoke-virtual {p3, p1}, Ljava/io/DataInputStream;->readFully([B)V

    new-instance p2, Ljava/io/DataInputStream;

    new-instance p3, Ljava/io/ByteArrayInputStream;

    invoke-direct {p3, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p2, p3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object p2, p0, Landroidx/versionedparcelable/f$b;->aW:Ljava/io/DataInputStream;

    return-void
.end method

.method static synthetic a(Landroidx/versionedparcelable/f$b;)Ljava/io/DataInputStream;
    .locals 0

    iget-object p0, p0, Landroidx/versionedparcelable/f$b;->aW:Ljava/io/DataInputStream;

    return-object p0
.end method

.method static synthetic b(Landroidx/versionedparcelable/f$b;)I
    .locals 0

    iget p0, p0, Landroidx/versionedparcelable/f$b;->aU:I

    return p0
.end method
