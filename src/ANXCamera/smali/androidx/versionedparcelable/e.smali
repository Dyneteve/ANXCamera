.class Landroidx/versionedparcelable/e;
.super Landroidx/versionedparcelable/VersionedParcel;
.source "VersionedParcelParcel.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "VersionedParcelParcel"


# instance fields
.field private final aB:Landroid/util/SparseIntArray;

.field private aC:I

.field private aD:I

.field private final mEnd:I

.field private final mOffset:I

.field private final mParcel:Landroid/os/Parcel;

.field private final mPrefix:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    invoke-virtual {p1}, Landroid/os/Parcel;->dataSize()I

    move-result v1

    const-string v2, ""

    invoke-direct {p0, p1, v0, v1, v2}, Landroidx/versionedparcelable/e;-><init>(Landroid/os/Parcel;IILjava/lang/String;)V

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;IILjava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Landroidx/versionedparcelable/VersionedParcel;-><init>()V

    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Landroidx/versionedparcelable/e;->aB:Landroid/util/SparseIntArray;

    const/4 v0, -0x1

    iput v0, p0, Landroidx/versionedparcelable/e;->aC:I

    const/4 v0, 0x0

    iput v0, p0, Landroidx/versionedparcelable/e;->aD:I

    iput-object p1, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    iput p2, p0, Landroidx/versionedparcelable/e;->mOffset:I

    iput p3, p0, Landroidx/versionedparcelable/e;->mEnd:I

    iget p1, p0, Landroidx/versionedparcelable/e;->mOffset:I

    iput p1, p0, Landroidx/versionedparcelable/e;->aD:I

    iput-object p4, p0, Landroidx/versionedparcelable/e;->mPrefix:Ljava/lang/String;

    return-void
.end method

.method private f(I)I
    .locals 3

    :goto_0
    iget v0, p0, Landroidx/versionedparcelable/e;->aD:I

    iget v1, p0, Landroidx/versionedparcelable/e;->mEnd:I

    if-ge v0, v1, :cond_1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    iget v1, p0, Landroidx/versionedparcelable/e;->aD:I

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iget-object v1, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iget v2, p0, Landroidx/versionedparcelable/e;->aD:I

    add-int/2addr v2, v0

    iput v2, p0, Landroidx/versionedparcelable/e;->aD:I

    if-ne v1, p1, :cond_0

    iget-object p1, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result p1

    return p1

    :cond_0
    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method


# virtual methods
.method public b(Landroid/os/Parcelable;)V
    .locals 2

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method

.method public d(I)Z
    .locals 1

    invoke-direct {p0, p1}, Landroidx/versionedparcelable/e;->f(I)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->setDataPosition(I)V

    const/4 p1, 0x1

    return p1
.end method

.method public e(I)V
    .locals 2

    invoke-virtual {p0}, Landroidx/versionedparcelable/e;->q()V

    iput p1, p0, Landroidx/versionedparcelable/e;->aC:I

    iget-object v0, p0, Landroidx/versionedparcelable/e;->aB:Landroid/util/SparseIntArray;

    iget-object v1, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseIntArray;->put(II)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/e;->writeInt(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/e;->writeInt(I)V

    return-void
.end method

.method public q()V
    .locals 4

    iget v0, p0, Landroidx/versionedparcelable/e;->aC:I

    if-ltz v0, :cond_0

    iget-object v0, p0, Landroidx/versionedparcelable/e;->aB:Landroid/util/SparseIntArray;

    iget v1, p0, Landroidx/versionedparcelable/e;->aC:I

    invoke-virtual {v0, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    iget-object v1, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    sub-int v2, v1, v0

    iget-object v3, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v3, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, v2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    :cond_0
    return-void
.end method

.method protected r()Landroidx/versionedparcelable/VersionedParcel;
    .locals 6

    new-instance v0, Landroidx/versionedparcelable/e;

    iget-object v1, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    iget-object v2, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v2}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    iget v3, p0, Landroidx/versionedparcelable/e;->aD:I

    iget v4, p0, Landroidx/versionedparcelable/e;->mOffset:I

    if-ne v3, v4, :cond_0

    iget v3, p0, Landroidx/versionedparcelable/e;->mEnd:I

    goto :goto_0

    :cond_0
    iget v3, p0, Landroidx/versionedparcelable/e;->aD:I

    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Landroidx/versionedparcelable/e;->mPrefix:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "  "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroidx/versionedparcelable/e;-><init>(Landroid/os/Parcel;IILjava/lang/String;)V

    return-object v0
.end method

.method public readBoolean()Z
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public readBundle()Landroid/os/Bundle;
    .locals 2

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public readByteArray()[B
    .locals 2

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-array v0, v0, [B

    iget-object v1, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v0}, Landroid/os/Parcel;->readByteArray([B)V

    return-object v0
.end method

.method public readDouble()D
    .locals 2

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat()F
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    return v0
.end method

.method public readInt()I
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    return v0
.end method

.method public readLong()J
    .locals 2

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    return-wide v0
.end method

.method public readString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readStrongBinder()Landroid/os/IBinder;
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method public s()Landroid/os/Parcelable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">()TT;"
        }
    .end annotation

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    return-object v0
.end method

.method public writeBoolean(Z)V
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method

.method public writeBundle(Landroid/os/Bundle;)V
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    return-void
.end method

.method public writeByteArray([B)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    array-length v1, p1

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeByteArray([B)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    :goto_0
    return-void
.end method

.method public writeByteArray([BII)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    array-length v1, p1

    invoke-virtual {v0, v1}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/Parcel;->writeByteArray([BII)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    :goto_0
    return-void
.end method

.method public writeDouble(D)V
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1, p2}, Landroid/os/Parcel;->writeDouble(D)V

    return-void
.end method

.method public writeFloat(F)V
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeFloat(F)V

    return-void
.end method

.method public writeInt(I)V
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method

.method public writeLong(J)V
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1, p2}, Landroid/os/Parcel;->writeLong(J)V

    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method

.method public writeStrongBinder(Landroid/os/IBinder;)V
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeStrongBinder(Landroid/os/IBinder;)V

    return-void
.end method

.method public writeStrongInterface(Landroid/os/IInterface;)V
    .locals 1

    iget-object v0, p0, Landroidx/versionedparcelable/e;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeStrongInterface(Landroid/os/IInterface;)V

    return-void
.end method
