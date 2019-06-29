.class public abstract Landroidx/versionedparcelable/VersionedParcel;
.super Ljava/lang/Object;
.source "VersionedParcel.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/versionedparcelable/VersionedParcel$ParcelException;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "VersionedParcel"

.field private static final TYPE_STRING:I = 0x4

.field private static final ao:I = -0x1

.field private static final ap:I = -0x2

.field private static final aq:I = -0x3

.field private static final ar:I = -0x4

.field private static final as:I = -0x5

.field private static final at:I = -0x6

.field private static final au:I = -0x7

.field private static final av:I = -0x9

.field private static final aw:I = 0x1

.field private static final ax:I = 0x2

.field private static final ay:I = 0x3

.field private static final az:I = 0x5


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static a(Ljava/lang/String;Landroidx/versionedparcelable/VersionedParcel;)Landroidx/versionedparcelable/g;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/g;",
            ">(",
            "Ljava/lang/String;",
            "Landroidx/versionedparcelable/VersionedParcel;",
            ")TT;"
        }
    .end annotation

    :try_start_0
    const-class v0, Landroidx/versionedparcelable/VersionedParcel;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v1, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object p0

    const-string v0, "read"

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroidx/versionedparcelable/VersionedParcel;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0, v0, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    const/4 v0, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v4

    invoke-virtual {p0, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/versionedparcelable/g;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered ClassNotFoundException"

    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered NoSuchMethodException"

    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :catch_2
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    instance-of p1, p1, Ljava/lang/RuntimeException;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    check-cast p0, Ljava/lang/RuntimeException;

    throw p0

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered InvocationTargetException"

    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :catch_3
    move-exception p0

    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered IllegalAccessException"

    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method private static a(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/versionedparcelable/g;",
            ">;)",
            "Ljava/lang/Class;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "%s.%sParcelizer"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const/4 v4, 0x1

    aput-object v0, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    invoke-static {v0, v3, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method protected static a(Landroidx/versionedparcelable/g;Landroidx/versionedparcelable/VersionedParcel;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/g;",
            ">(TT;",
            "Landroidx/versionedparcelable/VersionedParcel;",
            ")V"
        }
    .end annotation

    :try_start_0
    invoke-static {p0}, Landroidx/versionedparcelable/VersionedParcel;->d(Landroidx/versionedparcelable/g;)Ljava/lang/Class;

    move-result-object v0

    const-string/jumbo v1, "write"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-class v4, Landroidx/versionedparcelable/VersionedParcel;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v5

    aput-object p1, v2, v6

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    return-void

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered ClassNotFoundException"

    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :catch_1
    move-exception p0

    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered NoSuchMethodException"

    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :catch_2
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    instance-of p1, p1, Ljava/lang/RuntimeException;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    check-cast p0, Ljava/lang/RuntimeException;

    throw p0

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered InvocationTargetException"

    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :catch_3
    move-exception p0

    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "VersionedParcel encountered IllegalAccessException"

    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method private b(ILjava/lang/String;)Ljava/lang/Exception;
    .locals 0

    invoke-direct {p0, p1, p2}, Landroidx/versionedparcelable/VersionedParcel;->c(ILjava/lang/String;)Ljava/lang/Exception;

    move-result-object p1

    return-object p1
.end method

.method private c(Ljava/lang/Object;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)I"
        }
    .end annotation

    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 p1, 0x4

    return p1

    :cond_0
    instance-of v0, p1, Landroid/os/Parcelable;

    if-eqz v0, :cond_1

    const/4 p1, 0x2

    return p1

    :cond_1
    instance-of v0, p1, Landroidx/versionedparcelable/g;

    if-eqz v0, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    instance-of v0, p1, Ljava/io/Serializable;

    if-eqz v0, :cond_3

    const/4 p1, 0x3

    return p1

    :cond_3
    instance-of v0, p1, Landroid/os/IBinder;

    if-eqz v0, :cond_4

    const/4 p1, 0x5

    return p1

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " cannot be VersionedParcelled"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private c(ILjava/lang/String;)Ljava/lang/Exception;
    .locals 3

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown exception code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " msg "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    return-object v0

    :pswitch_1
    new-instance p1, Ljava/lang/SecurityException;

    invoke-direct {p1, p2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    return-object p1

    :pswitch_2
    new-instance p1, Landroid/os/BadParcelableException;

    invoke-direct {p1, p2}, Landroid/os/BadParcelableException;-><init>(Ljava/lang/String;)V

    return-object p1

    :pswitch_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object p1

    :pswitch_4
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    return-object p1

    :pswitch_5
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    return-object p1

    :pswitch_6
    new-instance p1, Landroid/os/NetworkOnMainThreadException;

    invoke-direct {p1}, Landroid/os/NetworkOnMainThreadException;-><init>()V

    return-object p1

    :pswitch_7
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    return-object p1

    :pswitch_8
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->s()Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Ljava/lang/Exception;

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch -0x9
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private c(Landroidx/versionedparcelable/g;)V
    .locals 3

    nop

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Landroidx/versionedparcelable/VersionedParcel;->a(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " does not have a Parcelizer"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static d(Landroidx/versionedparcelable/g;)Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/g;",
            ">(TT;)",
            "Ljava/lang/Class;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-static {p0}, Landroidx/versionedparcelable/VersionedParcel;->a(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p0

    return-object p0
.end method

.method protected static getRootCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    .locals 1
    .param p0    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method private readExceptionCode()I
    .locals 1

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v0

    return v0
.end method

.method private writeSerializable(Ljava/io/Serializable;)V
    .locals 4

    if-nez p1, :cond_0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_0
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v2, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeByteArray([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    nop

    return-void

    :catch_0
    move-exception p1

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "VersionedParcelable encountered IOException writing serializable object (name = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public a(Landroid/os/Parcelable;I)Landroid/os/Parcelable;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">(TT;I)TT;"
        }
    .end annotation

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->s()Landroid/os/Parcelable;

    move-result-object p1

    return-object p1
.end method

.method public a(BI)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    return-void
.end method

.method public a(DI)V
    .locals 0

    invoke-virtual {p0, p3}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1, p2}, Landroidx/versionedparcelable/VersionedParcel;->writeDouble(D)V

    return-void
.end method

.method public a(FI)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeFloat(F)V

    return-void
.end method

.method public a(II)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    return-void
.end method

.method public a(JI)V
    .locals 0

    invoke-virtual {p0, p3}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1, p2}, Landroidx/versionedparcelable/VersionedParcel;->writeLong(J)V

    return-void
.end method

.method public a(Landroid/os/Bundle;I)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeBundle(Landroid/os/Bundle;)V

    return-void
.end method

.method public a(Landroid/os/IBinder;I)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeStrongBinder(Landroid/os/IBinder;)V

    return-void
.end method

.method public a(Landroid/os/IInterface;I)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeStrongInterface(Landroid/os/IInterface;)V

    return-void
.end method

.method public a(Landroid/util/Size;I)V
    .locals 0
    .annotation build Landroid/support/annotation/RequiresApi;
        api = 0x15
    .end annotation

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    if-eqz p1, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->writeBoolean(Z)V

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result p2

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    :cond_1
    return-void
.end method

.method public a(Landroid/util/SizeF;I)V
    .locals 0
    .annotation build Landroid/support/annotation/RequiresApi;
        api = 0x15
    .end annotation

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    if-eqz p1, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->writeBoolean(Z)V

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/util/SizeF;->getWidth()F

    move-result p2

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->writeFloat(F)V

    invoke-virtual {p1}, Landroid/util/SizeF;->getHeight()F

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeFloat(F)V

    :cond_1
    return-void
.end method

.method public a(Landroid/util/SparseBooleanArray;I)V
    .locals 2

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    if-nez p1, :cond_0

    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->size()I

    move-result p2

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_1

    invoke-virtual {p1, v0}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v1

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    invoke-virtual {p1, v0}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v1

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeBoolean(Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public a(Landroidx/versionedparcelable/g;I)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->b(Landroidx/versionedparcelable/g;)V

    return-void
.end method

.method public a(Ljava/io/Serializable;I)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-direct {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeSerializable(Ljava/io/Serializable;)V

    return-void
.end method

.method public a(Ljava/lang/Exception;I)V
    .locals 3

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    if-nez p1, :cond_0

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->writeNoException()V

    return-void

    :cond_0
    const/4 p2, 0x0

    instance-of v0, p1, Landroid/os/Parcelable;

    const/16 v1, -0x9

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    const-class v2, Landroid/os/Parcelable;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    if-ne v0, v2, :cond_1

    nop

    move p2, v1

    goto :goto_0

    :cond_1
    instance-of v0, p1, Ljava/lang/SecurityException;

    if-eqz v0, :cond_2

    const/4 p2, -0x1

    goto :goto_0

    :cond_2
    instance-of v0, p1, Landroid/os/BadParcelableException;

    if-eqz v0, :cond_3

    const/4 p2, -0x2

    goto :goto_0

    :cond_3
    instance-of v0, p1, Ljava/lang/IllegalArgumentException;

    if-eqz v0, :cond_4

    const/4 p2, -0x3

    goto :goto_0

    :cond_4
    instance-of v0, p1, Ljava/lang/NullPointerException;

    if-eqz v0, :cond_5

    const/4 p2, -0x4

    goto :goto_0

    :cond_5
    instance-of v0, p1, Ljava/lang/IllegalStateException;

    if-eqz v0, :cond_6

    const/4 p2, -0x5

    goto :goto_0

    :cond_6
    instance-of v0, p1, Landroid/os/NetworkOnMainThreadException;

    if-eqz v0, :cond_7

    const/4 p2, -0x6

    goto :goto_0

    :cond_7
    instance-of v0, p1, Ljava/lang/UnsupportedOperationException;

    if-eqz v0, :cond_8

    const/4 p2, -0x7

    :cond_8
    :goto_0
    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    if-nez p2, :cond_a

    instance-of p2, p1, Ljava/lang/RuntimeException;

    if-eqz p2, :cond_9

    check-cast p1, Ljava/lang/RuntimeException;

    throw p1

    :cond_9
    new-instance p2, Ljava/lang/RuntimeException;

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    :cond_a
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    if-eq p2, v1, :cond_b

    goto :goto_1

    :cond_b
    check-cast p1, Landroid/os/Parcelable;

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->b(Landroid/os/Parcelable;)V

    :goto_1
    return-void
.end method

.method public a(Ljava/lang/String;I)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;I)V"
        }
    .end annotation

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    if-nez p1, :cond_0

    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    return-void

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p2

    nop

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    if-lez p2, :cond_1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->c(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    packed-switch v1, :pswitch_data_0

    goto :goto_5

    :goto_0
    :pswitch_0
    if-ge v0, p2, :cond_1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/IBinder;

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeStrongBinder(Landroid/os/IBinder;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :goto_1
    :pswitch_1
    if-ge v0, p2, :cond_1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :goto_2
    :pswitch_2
    if-ge v0, p2, :cond_1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/Serializable;

    invoke-direct {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeSerializable(Ljava/io/Serializable;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :goto_3
    :pswitch_3
    if-ge v0, p2, :cond_1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->b(Landroid/os/Parcelable;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :goto_4
    :pswitch_4
    if-ge v0, p2, :cond_1

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/versionedparcelable/g;

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->b(Landroidx/versionedparcelable/g;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_1
    :goto_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public a(ZI)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeBoolean(Z)V

    return-void
.end method

.method public a(ZZ)V
    .locals 0

    return-void
.end method

.method public a([BI)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeByteArray([B)V

    return-void
.end method

.method public a([BIII)V
    .locals 0

    invoke-virtual {p0, p4}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1, p2, p3}, Landroidx/versionedparcelable/VersionedParcel;->writeByteArray([BII)V

    return-void
.end method

.method public a([CI)V
    .locals 2

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    if-eqz p1, :cond_1

    array-length p2, p1

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_0

    aget-char v1, p1, v0

    invoke-virtual {p0, v1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    :goto_1
    return-void
.end method

.method public a([DI)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeDoubleArray([D)V

    return-void
.end method

.method public a([FI)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeFloatArray([F)V

    return-void
.end method

.method public a([II)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeIntArray([I)V

    return-void
.end method

.method public a([JI)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeLongArray([J)V

    return-void
.end method

.method public a([Ljava/lang/Object;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I)V"
        }
    .end annotation

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeArray([Ljava/lang/Object;)V

    return-void
.end method

.method public a([ZI)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeBooleanArray([Z)V

    return-void
.end method

.method protected a([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_0

    return-object v1

    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v3

    if-gez v0, :cond_1

    return-object v1

    :cond_1
    packed-switch v3, :pswitch_data_0

    goto :goto_5

    :goto_0
    :pswitch_0
    if-lez v0, :cond_2

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :goto_1
    :pswitch_1
    if-lez v0, :cond_2

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :goto_2
    :pswitch_2
    if-lez v0, :cond_2

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    :goto_3
    :pswitch_3
    if-lez v0, :cond_2

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->s()Landroid/os/Parcelable;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    :goto_4
    :pswitch_4
    if-lez v0, :cond_2

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->y()Landroidx/versionedparcelable/g;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    :cond_2
    :goto_5
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public b(BI)B
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result p1

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    return p1
.end method

.method public b(DI)D
    .locals 0

    invoke-virtual {p0, p3}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p3

    if-nez p3, :cond_0

    return-wide p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readDouble()D

    move-result-wide p1

    return-wide p1
.end method

.method public b(FI)F
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readFloat()F

    move-result p1

    return p1
.end method

.method public b(JI)J
    .locals 0

    invoke-virtual {p0, p3}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p3

    if-nez p3, :cond_0

    return-wide p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readLong()J

    move-result-wide p1

    return-wide p1
.end method

.method public b(Landroid/os/Bundle;I)Landroid/os/Bundle;
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readBundle()Landroid/os/Bundle;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/os/IBinder;I)Landroid/os/IBinder;
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/util/Size;I)Landroid/util/Size;
    .locals 1
    .annotation build Landroid/support/annotation/RequiresApi;
        api = 0x15
    .end annotation

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readBoolean()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result p1

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result p2

    new-instance v0, Landroid/util/Size;

    invoke-direct {v0, p1, p2}, Landroid/util/Size;-><init>(II)V

    return-object v0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public b(Landroid/util/SizeF;I)Landroid/util/SizeF;
    .locals 1
    .annotation build Landroid/support/annotation/RequiresApi;
        api = 0x15
    .end annotation

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readBoolean()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readFloat()F

    move-result p1

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readFloat()F

    move-result p2

    new-instance v0, Landroid/util/SizeF;

    invoke-direct {v0, p1, p2}, Landroid/util/SizeF;-><init>(FF)V

    return-object v0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public b(Landroid/util/SparseBooleanArray;I)Landroid/util/SparseBooleanArray;
    .locals 3

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result p1

    if-gez p1, :cond_1

    const/4 p1, 0x0

    return-object p1

    :cond_1
    new-instance p2, Landroid/util/SparseBooleanArray;

    invoke-direct {p2, p1}, Landroid/util/SparseBooleanArray;-><init>(I)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_2

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v1

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readBoolean()Z

    move-result v2

    invoke-virtual {p2, v1, v2}, Landroid/util/SparseBooleanArray;->put(IZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-object p2
.end method

.method public b(Landroidx/versionedparcelable/g;I)Landroidx/versionedparcelable/g;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/g;",
            ">(TT;I)TT;"
        }
    .end annotation

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->y()Landroidx/versionedparcelable/g;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/lang/Exception;I)Ljava/lang/Exception;
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-direct {p0}, Landroidx/versionedparcelable/VersionedParcel;->readExceptionCode()I

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Landroidx/versionedparcelable/VersionedParcel;->b(ILjava/lang/String;)Ljava/lang/Exception;

    move-result-object p1

    return-object p1

    :cond_1
    return-object p1
.end method

.method public b(Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/util/List;I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;I)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result p1

    const/4 p2, 0x0

    if-gez p1, :cond_1

    return-object p2

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v1

    if-gez p1, :cond_2

    return-object p2

    :cond_2
    packed-switch v1, :pswitch_data_0

    goto :goto_5

    :goto_0
    :pswitch_0
    if-lez p1, :cond_3

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    :goto_1
    :pswitch_1
    if-lez p1, :cond_3

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    :goto_2
    :pswitch_2
    if-lez p1, :cond_3

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readSerializable()Ljava/io/Serializable;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, -0x1

    goto :goto_2

    :goto_3
    :pswitch_3
    if-lez p1, :cond_3

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->s()Landroid/os/Parcelable;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, -0x1

    goto :goto_3

    :goto_4
    :pswitch_4
    if-lez p1, :cond_3

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->y()Landroidx/versionedparcelable/g;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 p1, p1, -0x1

    goto :goto_4

    :cond_3
    :goto_5
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected abstract b(Landroid/os/Parcelable;)V
.end method

.method protected b(Landroidx/versionedparcelable/g;)V
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-direct {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->c(Landroidx/versionedparcelable/g;)V

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->r()Landroidx/versionedparcelable/VersionedParcel;

    move-result-object v0

    invoke-static {p1, v0}, Landroidx/versionedparcelable/VersionedParcel;->a(Landroidx/versionedparcelable/g;Landroidx/versionedparcelable/VersionedParcel;)V

    invoke-virtual {v0}, Landroidx/versionedparcelable/VersionedParcel;->q()V

    return-void
.end method

.method public b(ZI)Z
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readBoolean()Z

    move-result p1

    return p1
.end method

.method public b([BI)[B
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readByteArray()[B

    move-result-object p1

    return-object p1
.end method

.method public b([CI)[C
    .locals 2

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result p1

    if-gez p1, :cond_1

    const/4 p1, 0x0

    return-object p1

    :cond_1
    new-array p2, p1, [C

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_2

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v1

    int-to-char v1, v1

    aput-char v1, p2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-object p2
.end method

.method public b([DI)[D
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->x()[D

    move-result-object p1

    return-object p1
.end method

.method public b([FI)[F
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->w()[F

    move-result-object p1

    return-object p1
.end method

.method public b([II)[I
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->u()[I

    move-result-object p1

    return-object p1
.end method

.method public b([JI)[J
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->v()[J

    move-result-object p1

    return-object p1
.end method

.method public b([Ljava/lang/Object;I)[Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I)[TT;"
        }
    .end annotation

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->a([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public b([ZI)[Z
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->t()[Z

    move-result-object p1

    return-object p1
.end method

.method protected abstract d(I)Z
.end method

.method protected abstract e(I)V
.end method

.method public p()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected abstract q()V
.end method

.method protected abstract r()Landroidx/versionedparcelable/VersionedParcel;
.end method

.method protected abstract readBoolean()Z
.end method

.method protected abstract readBundle()Landroid/os/Bundle;
.end method

.method protected abstract readByteArray()[B
.end method

.method protected abstract readDouble()D
.end method

.method protected abstract readFloat()F
.end method

.method protected abstract readInt()I
.end method

.method public readInt(II)I
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->d(I)Z

    move-result p2

    if-nez p2, :cond_0

    return p1

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result p1

    return p1
.end method

.method protected abstract readLong()J
.end method

.method protected readSerializable()Ljava/io/Serializable;
    .locals 5

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readString()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readByteArray()[B

    move-result-object v1

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    :try_start_0
    new-instance v1, Landroidx/versionedparcelable/VersionedParcel$1;

    invoke-direct {v1, p0, v2}, Landroidx/versionedparcelable/VersionedParcel$1;-><init>(Landroidx/versionedparcelable/VersionedParcel;Ljava/io/InputStream;)V

    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/Serializable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "VersionedParcelable encountered ClassNotFoundException reading a Serializable object (name = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :catch_1
    move-exception v1

    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "VersionedParcelable encountered IOException reading a Serializable object (name = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected abstract readString()Ljava/lang/String;
.end method

.method protected abstract readStrongBinder()Landroid/os/IBinder;
.end method

.method protected abstract s()Landroid/os/Parcelable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">()TT;"
        }
    .end annotation
.end method

.method protected t()[Z
    .locals 5

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-array v1, v0, [Z

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_2

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    move v4, v2

    :goto_1
    aput-boolean v4, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method protected u()[I
    .locals 4

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method protected v()[J
    .locals 5

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-array v1, v0, [J

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readLong()J

    move-result-wide v3

    aput-wide v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method protected w()[F
    .locals 4

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-array v1, v0, [F

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readFloat()F

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method protected writeArray([Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    return-void

    :cond_0
    array-length v0, p1

    nop

    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    if-lez v0, :cond_1

    const/4 v1, 0x0

    aget-object v2, p1, v1

    invoke-direct {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->c(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    packed-switch v2, :pswitch_data_0

    goto :goto_5

    :goto_0
    :pswitch_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    check-cast v2, Landroid/os/IBinder;

    invoke-virtual {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->writeStrongBinder(Landroid/os/IBinder;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :goto_1
    :pswitch_1
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->writeString(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :goto_2
    :pswitch_2
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    check-cast v2, Ljava/io/Serializable;

    invoke-direct {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->writeSerializable(Ljava/io/Serializable;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :goto_3
    :pswitch_3
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    check-cast v2, Landroid/os/Parcelable;

    invoke-virtual {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->b(Landroid/os/Parcelable;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :goto_4
    :pswitch_4
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    check-cast v2, Landroidx/versionedparcelable/g;

    invoke-virtual {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->b(Landroidx/versionedparcelable/g;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_1
    :goto_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected abstract writeBoolean(Z)V
.end method

.method protected writeBooleanArray([Z)V
    .locals 3

    if-eqz p1, :cond_1

    array-length v0, p1

    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-boolean v2, p1, v1

    invoke-virtual {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    :goto_1
    return-void
.end method

.method protected abstract writeBundle(Landroid/os/Bundle;)V
.end method

.method protected abstract writeByteArray([B)V
.end method

.method protected abstract writeByteArray([BII)V
.end method

.method protected abstract writeDouble(D)V
.end method

.method protected writeDoubleArray([D)V
    .locals 4

    if-eqz p1, :cond_1

    array-length v0, p1

    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-wide v2, p1, v1

    invoke-virtual {p0, v2, v3}, Landroidx/versionedparcelable/VersionedParcel;->writeDouble(D)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    :goto_1
    return-void
.end method

.method protected abstract writeFloat(F)V
.end method

.method protected writeFloatArray([F)V
    .locals 3

    if-eqz p1, :cond_1

    array-length v0, p1

    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p1, v1

    invoke-virtual {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->writeFloat(F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    :goto_1
    return-void
.end method

.method protected abstract writeInt(I)V
.end method

.method protected writeIntArray([I)V
    .locals 3

    if-eqz p1, :cond_1

    array-length v0, p1

    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p1, v1

    invoke-virtual {p0, v2}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    :goto_1
    return-void
.end method

.method protected abstract writeLong(J)V
.end method

.method protected writeLongArray([J)V
    .locals 4

    if-eqz p1, :cond_1

    array-length v0, p1

    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-wide v2, p1, v1

    invoke-virtual {p0, v2, v3}, Landroidx/versionedparcelable/VersionedParcel;->writeLong(J)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    :goto_1
    return-void
.end method

.method protected writeNoException()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/versionedparcelable/VersionedParcel;->writeInt(I)V

    return-void
.end method

.method public writeParcelable(Landroid/os/Parcelable;I)V
    .locals 0

    invoke-virtual {p0, p2}, Landroidx/versionedparcelable/VersionedParcel;->e(I)V

    invoke-virtual {p0, p1}, Landroidx/versionedparcelable/VersionedParcel;->b(Landroid/os/Parcelable;)V

    return-void
.end method

.method protected abstract writeString(Ljava/lang/String;)V
.end method

.method protected abstract writeStrongBinder(Landroid/os/IBinder;)V
.end method

.method protected abstract writeStrongInterface(Landroid/os/IInterface;)V
.end method

.method protected x()[D
    .locals 5

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readInt()I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-array v1, v0, [D

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readDouble()D

    move-result-wide v3

    aput-wide v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method protected y()Landroidx/versionedparcelable/g;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/g;",
            ">()TT;"
        }
    .end annotation

    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->readString()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroidx/versionedparcelable/VersionedParcel;->r()Landroidx/versionedparcelable/VersionedParcel;

    move-result-object v1

    invoke-static {v0, v1}, Landroidx/versionedparcelable/VersionedParcel;->a(Ljava/lang/String;Landroidx/versionedparcelable/VersionedParcel;)Landroidx/versionedparcelable/g;

    move-result-object v0

    return-object v0
.end method
