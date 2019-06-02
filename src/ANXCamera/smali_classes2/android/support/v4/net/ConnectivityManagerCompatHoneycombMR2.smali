.class Landroid/support/v4/net/ConnectivityManagerCompatHoneycombMR2;
.super Ljava/lang/Object;
.source "ConnectivityManagerCompatHoneycombMR2.java"


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isActiveNetworkMetered(Landroid/net/ConnectivityManager;)Z
    .registers 4

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_8

    return v1

    :cond_8
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    packed-switch v2, :pswitch_data_14

    :pswitch_f
    return v1

    :pswitch_10
    const/4 v1, 0x0

    return v1

    :pswitch_12
    return v1

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_12
        :pswitch_10
        :pswitch_12
        :pswitch_12
        :pswitch_12
        :pswitch_12
        :pswitch_12
        :pswitch_10
        :pswitch_f
        :pswitch_10
    .end packed-switch
.end method
