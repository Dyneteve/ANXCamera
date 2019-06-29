.class public final Landroid/support/v4/database/CursorWindowCompat;
.super Ljava/lang/Object;
.source "CursorWindowCompat.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/String;J)Landroid/database/CursorWindow;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-static {}, Landroid/support/v4/os/BuildCompat;->isAtLeastP()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/database/CursorWindow;

    invoke-direct {v0, p1, p2, p3}, Landroid/database/CursorWindow;-><init>(Ljava/lang/String;J)V

    return-object v0

    :cond_0
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0xf

    if-lt p2, p3, :cond_1

    new-instance p2, Landroid/database/CursorWindow;

    invoke-direct {p2, p1}, Landroid/database/CursorWindow;-><init>(Ljava/lang/String;)V

    return-object p2

    :cond_1
    new-instance p1, Landroid/database/CursorWindow;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Landroid/database/CursorWindow;-><init>(Z)V

    return-object p1
.end method
