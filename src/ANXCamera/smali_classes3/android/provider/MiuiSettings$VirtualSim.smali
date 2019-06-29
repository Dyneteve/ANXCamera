.class public final Landroid/provider/MiuiSettings$VirtualSim;
.super Ljava/lang/Object;
.source "MiuiSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/provider/MiuiSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VirtualSim"
.end annotation


# static fields
.field public static final DC_ONLY_VIRTUAL_SIM:I = 0x1

.field public static final MISIM_ID:Ljava/lang/String; = "misim_id"

.field public static final MISIM_IMSI:Ljava/lang/String; = "misim_imsi"

.field public static final NORMAL_VIRTUAL_SIM:I = 0x0

.field public static final STATUS_DISABLING:I = 0x1

.field public static final STATUS_ENABLING:I = 0x0

.field public static final STATUS_NORMAL:I = 0x2

.field public static final VIRTUAL_SIM_ICCID:Ljava/lang/String; = "virtual_sim_iccid"

.field public static final VIRTUAL_SIM_IMSI:Ljava/lang/String; = "virtual_sim_imsi"

.field public static final VIRTUAL_SIM_NETWORK_TYPE:Ljava/lang/String; = "virtual_sim_network_type"

.field public static final VIRTUAL_SIM_SLOT_ID:Ljava/lang/String; = "virtual_sim_slot_id"

.field public static final VIRTUAL_SIM_STATUS:Ljava/lang/String; = "virtual_sim_status"

.field public static final VIRTUAL_SIM_TYPE:Ljava/lang/String; = "virtual_sim_type"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMiSimId(Landroid/content/Context;)J
    .registers 5

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "misim_id"

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lmiui/provider/ExtraSettings$Secure;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getSupportNetworkType(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_network_type"

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVirtualSimIccId(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_iccid"

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVirtualSimImsi(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_imsi"

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getVirtualSimSlotId(Landroid/content/Context;)I
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_slot_id"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getVirtualSimStatus(Landroid/content/Context;)I
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_status"

    const/4 v2, 0x2

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getVirtualSimType(Landroid/content/Context;)I
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_type"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static isMiSimEnabled(Landroid/content/Context;)Z
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "misim_imsi"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_24

    invoke-static {p0}, Landroid/provider/MiuiSettings$VirtualSim;->isVirtualSimEnabled(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-static {p0}, Landroid/provider/MiuiSettings$VirtualSim;->getVirtualSimImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    const/4 v1, 0x1

    goto :goto_25

    :cond_24
    const/4 v1, 0x0

    :goto_25
    return v1
.end method

.method public static isSupport4G(Landroid/content/Context;)Z
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_network_type"

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lmiui/provider/ExtraSettings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1e

    const-string v1, "4G"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1c

    goto :goto_1e

    :cond_1c
    const/4 v1, 0x0

    goto :goto_1f

    :cond_1e
    :goto_1e
    const/4 v1, 0x1

    :goto_1f
    return v1
.end method

.method public static isVirtualSimEnabled(Landroid/content/Context;)Z
    .registers 2

    invoke-static {p0}, Landroid/provider/MiuiSettings$VirtualSim;->getVirtualSimImsi(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static setMiSimId(Landroid/content/Context;J)V
    .registers 5

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "misim_id"

    invoke-static {v0, v1, p1, p2}, Lmiui/provider/ExtraSettings$Secure;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    return-void
.end method

.method public static setMiSimImsi(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "misim_imsi"

    invoke-static {v0, v1, p1}, Lmiui/provider/ExtraSettings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method

.method public static setSupportNetworkType(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_network_type"

    invoke-static {v0, v1, p1}, Lmiui/provider/ExtraSettings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method

.method public static setVirtualSimIccId(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_iccid"

    invoke-static {v0, v1, p1}, Lmiui/provider/ExtraSettings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method

.method public static setVirtualSimImsi(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_imsi"

    invoke-static {v0, v1, p1}, Lmiui/provider/ExtraSettings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method

.method public static setVirtualSimSlotId(Landroid/content/Context;I)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_slot_id"

    invoke-static {v0, v1, p1}, Lmiui/provider/ExtraSettings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    return-void
.end method

.method public static setVirtualSimStatus(Landroid/content/Context;I)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_status"

    invoke-static {v0, v1, p1}, Lmiui/provider/ExtraSettings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    return-void
.end method

.method public static setVirtualSimType(Landroid/content/Context;I)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string/jumbo v1, "virtual_sim_type"

    invoke-static {v0, v1, p1}, Lmiui/provider/ExtraSettings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    return-void
.end method
