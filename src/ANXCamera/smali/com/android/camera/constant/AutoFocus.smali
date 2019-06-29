.class public Lcom/android/camera/constant/AutoFocus;
.super Ljava/lang/Object;
.source "AutoFocus.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/constant/AutoFocus$FocusMode;
    }
.end annotation


# static fields
.field public static final LEGACY_AUTO:Ljava/lang/String; = "auto"

.field public static final LEGACY_CONTINUOUS_PICTURE:Ljava/lang/String; = "continuous-picture"

.field public static final LEGACY_CONTINUOUS_VIDEO:Ljava/lang/String; = "continuous-video"

.field public static final LEGACY_EDOF:Ljava/lang/String; = "edof"

.field public static final LEGACY_MACRO:Ljava/lang/String; = "macro"

.field public static final LEGACY_MANUAL:Ljava/lang/String; = "manual"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertToFocusMode(Ljava/lang/String;)I
    .locals 7

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x5

    const/4 v2, 0x2

    const/4 v3, 0x4

    const/4 v4, 0x1

    const/4 v5, 0x3

    const/4 v6, 0x0

    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v0, "continuous-picture"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    move p0, v5

    goto :goto_1

    :sswitch_1
    const-string v0, "macro"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    move p0, v4

    goto :goto_1

    :sswitch_2
    const-string v0, "edof"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    move p0, v3

    goto :goto_1

    :sswitch_3
    const-string v0, "auto"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    move p0, v6

    goto :goto_1

    :sswitch_4
    const-string v0, "continuous-video"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    move p0, v2

    goto :goto_1

    :sswitch_5
    const-string v0, "manual"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    move p0, v1

    goto :goto_1

    :cond_0
    :goto_0
    const/4 p0, -0x1

    :goto_1
    packed-switch p0, :pswitch_data_0

    return v6

    :pswitch_0
    return v6

    :pswitch_1
    return v1

    :pswitch_2
    return v3

    :pswitch_3
    return v5

    :pswitch_4
    return v2

    :pswitch_5
    return v4

    nop

    :sswitch_data_0
    .sparse-switch
        -0x4075183a -> :sswitch_5
        -0xb99cbc3 -> :sswitch_4
        0x2dddaf -> :sswitch_3
        0x2f6eb6 -> :sswitch_2
        0x62d9bcc -> :sswitch_1
        0x363d9440 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static convertToLegacyFocusModes([I)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget v3, p0, v2

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    const-string v3, "edof"

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :pswitch_1
    const-string v3, "continuous-picture"

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :pswitch_2
    const-string v3, "continuous-video"

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :pswitch_3
    const-string v3, "macro"

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :pswitch_4
    const-string v3, "auto"

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :pswitch_5
    const-string v3, "manual"

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    nop

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
