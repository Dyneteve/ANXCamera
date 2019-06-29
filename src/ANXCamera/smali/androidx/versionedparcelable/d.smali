.class public Landroidx/versionedparcelable/d;
.super Ljava/lang/Object;
.source "ParcelUtils.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroidx/versionedparcelable/g;)Landroid/os/Parcelable;
    .locals 1

    new-instance v0, Landroidx/versionedparcelable/ParcelImpl;

    invoke-direct {v0, p0}, Landroidx/versionedparcelable/ParcelImpl;-><init>(Landroidx/versionedparcelable/g;)V

    return-object v0
.end method

.method public static a(Landroid/os/Parcelable;)Landroidx/versionedparcelable/g;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/g;",
            ">(",
            "Landroid/os/Parcelable;",
            ")TT;"
        }
    .end annotation

    instance-of v0, p0, Landroidx/versionedparcelable/ParcelImpl;

    if-eqz v0, :cond_0

    check-cast p0, Landroidx/versionedparcelable/ParcelImpl;

    invoke-virtual {p0}, Landroidx/versionedparcelable/ParcelImpl;->o()Landroidx/versionedparcelable/g;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid parcel"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a(Ljava/io/InputStream;)Landroidx/versionedparcelable/g;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroidx/versionedparcelable/g;",
            ">(",
            "Ljava/io/InputStream;",
            ")TT;"
        }
    .end annotation

    new-instance v0, Landroidx/versionedparcelable/f;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/versionedparcelable/f;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v0}, Landroidx/versionedparcelable/f;->y()Landroidx/versionedparcelable/g;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroidx/versionedparcelable/g;Ljava/io/OutputStream;)V
    .locals 2

    new-instance v0, Landroidx/versionedparcelable/f;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1}, Landroidx/versionedparcelable/f;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v0, p0}, Landroidx/versionedparcelable/f;->b(Landroidx/versionedparcelable/g;)V

    invoke-virtual {v0}, Landroidx/versionedparcelable/f;->q()V

    return-void
.end method
