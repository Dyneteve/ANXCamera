.class public Lcom/mi/config/b;
.super Ljava/lang/Object;
.source "Device.java"


# static fields
.field public static final IS_HONGMI:Z

.field public static final IS_MI2A:Z

.field public static final IS_XIAOMI:Z

.field public static final qA:Z

.field public static final qB:Z

.field public static final qC:Z

.field public static final qD:Z

.field public static final qE:Z

.field public static final qF:Z

.field public static final qG:Z

.field public static final qH:Z

.field public static final qI:Z

.field public static final qJ:Z

.field public static final qK:Z

.field public static final qL:Z

.field public static final qM:Z

.field public static final qN:Z

.field public static final qO:Z

.field public static final qP:Z

.field public static final qQ:Z

.field public static final qR:Z

.field public static final qS:Z

.field public static final qT:Z

.field public static final qU:Z

.field public static final qV:Z

.field public static final qW:Z

.field public static final qX:Z

.field public static final qY:Z

.field public static final qZ:Z

.field public static final qp:Ljava/lang/String;

.field public static final qq:Ljava/lang/String; = "qcom"

.field public static final qr:Ljava/lang/String; = "mediatek"

.field public static final qt:Ljava/lang/String; = "leadcore"

.field public static final qu:Ljava/lang/String; = "nvidia"

.field public static final qv:Ljava/lang/String; = "intel"

.field private static final qw:I = 0x64

.field public static final qx:Ljava/lang/String;

.field public static final qy:Z

.field public static final qz:Z

.field public static final rA:Z

.field public static final rB:Z

.field public static final rC:Z

.field public static final rD:Z

.field public static final rE:Z

.field public static final rF:Z

.field public static final rG:Z

.field public static final rH:Z

.field public static final rI:Z

.field public static final rJ:Z

.field public static final rK:Z

.field public static final rL:Z

.field public static final rM:Z

.field public static final rN:Z

.field public static final rO:Z

.field public static final rP:Z

.field private static final rQ:I = 0x1

.field private static final rR:I = 0x4

.field private static final rS:I = 0x8

.field private static rT:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final ra:Z

.field public static final rb:Z

.field public static final rc:Z

.field public static final rd:Z

.field public static final re:Z

.field public static final rf:Z

.field public static final rg:Z

.field public static final rh:Z

.field public static final ri:Z

.field public static final rj:Z

.field public static final rk:Z

.field public static final rl:Z

.field public static final rm:Z

.field public static final rn:Z

.field public static final ro:Z

.field public static final rp:Z

.field public static final rq:Z

.field public static final rr:Z

.field public static final rs:Z

.field public static final rt:Z

.field public static final ru:Z

.field public static final rv:Z

.field public static final rw:Z

.field public static final rx:Z

.field public static final ry:Z

.field public static final rz:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    sget-object v0, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    sput-object v0, Lcom/mi/config/b;->qp:Ljava/lang/String;

    sget-object v0, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    sput-object v0, Lcom/mi/config/b;->qx:Ljava/lang/String;

    sget-boolean v0, Lmiui/os/Build;->IS_MITWO:Z

    sput-boolean v0, Lcom/mi/config/b;->qy:Z

    sget-boolean v0, Lmiui/os/Build;->IS_MI2A:Z

    sput-boolean v0, Lcom/mi/config/b;->IS_MI2A:Z

    const-string v0, "pisces"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qz:Z

    const-string v0, "cancro"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    sget-object v0, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    const-string v3, "MI 3"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    sput-boolean v0, Lcom/mi/config/b;->qA:Z

    sget-boolean v0, Lcom/mi/config/b;->qA:Z

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/mi/config/b;->qz:Z

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move v0, v2

    goto :goto_2

    :cond_2
    :goto_1
    move v0, v1

    :goto_2
    sput-boolean v0, Lcom/mi/config/b;->qB:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO:Z

    if-eqz v0, :cond_3

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_A:Z

    if-nez v0, :cond_3

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_S:Z

    if-nez v0, :cond_3

    move v0, v1

    goto :goto_3

    :cond_3
    move v0, v2

    :goto_3
    sput-boolean v0, Lcom/mi/config/b;->qC:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_S:Z

    sput-boolean v0, Lcom/mi/config/b;->qD:Z

    sget-boolean v0, Lcom/mi/config/b;->qC:Z

    if-nez v0, :cond_5

    sget-boolean v0, Lcom/mi/config/b;->qD:Z

    if-eqz v0, :cond_4

    goto :goto_4

    :cond_4
    move v0, v2

    goto :goto_5

    :cond_5
    :goto_4
    move v0, v1

    :goto_5
    sput-boolean v0, Lcom/mi/config/b;->qE:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOS_LTE_MTK:Z

    sput-boolean v0, Lcom/mi/config/b;->qF:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_A:Z

    sput-boolean v0, Lcom/mi/config/b;->qG:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE:Z

    sput-boolean v0, Lcom/mi/config/b;->qH:Z

    const-string v0, "gucci"

    sget-object v3, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qI:Z

    const-string v0, "hermes"

    sget-object v3, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qJ:Z

    const-string v0, "hennessy"

    sget-object v3, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qK:Z

    const-string v0, "dior"

    sget-object v3, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qL:Z

    const-string v0, "kenzo"

    sget-object v3, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qM:Z

    const-string v0, "kate"

    sget-object v3, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qN:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_7

    const-string v0, "HM2014816"

    sget-object v3, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_6

    :cond_6
    move v1, v2

    nop

    :cond_7
    :goto_6
    sput-boolean v1, Lcom/mi/config/b;->qO:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_LC:Z

    sput-boolean v0, Lcom/mi/config/b;->qP:Z

    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    sput-boolean v0, Lcom/mi/config/b;->qQ:Z

    sget-boolean v0, Lmiui/os/Build;->IS_MIPAD:Z

    sput-boolean v0, Lcom/mi/config/b;->qR:Z

    sget-boolean v0, Lmiui/os/Build;->IS_MIFIVE:Z

    sput-boolean v0, Lcom/mi/config/b;->qS:Z

    const-string v0, "leo"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qT:Z

    const-string v0, "ferrari"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qU:Z

    const-string v0, "ido"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qV:Z

    const-string v0, "aqua"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qW:Z

    const-string v0, "gemini"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qX:Z

    const-string v0, "gold"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qY:Z

    const-string v0, "capricorn"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->qZ:Z

    const-string v0, "natrium"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->ra:Z

    const-string v0, "lithium"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rb:Z

    const-string v0, "scorpio"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rc:Z

    const-string v0, "libra"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rd:Z

    const-string v0, "land"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->re:Z

    const-string v0, "hydrogen"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rf:Z

    const-string v0, "helium"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rg:Z

    const-string v0, "omega"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rh:Z

    sget-object v0, Lcom/mi/config/b;->qp:Ljava/lang/String;

    const-string v1, "nike"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->ri:Z

    sget-object v0, Lcom/mi/config/b;->qp:Ljava/lang/String;

    const-string v1, "mark"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rj:Z

    sget-object v0, Lcom/mi/config/b;->qp:Ljava/lang/String;

    const-string v1, "prada"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rk:Z

    sget-object v0, Lcom/mi/config/b;->qp:Ljava/lang/String;

    const-string v1, "mido"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rl:Z

    const-string v0, "rolex"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rm:Z

    const-string v0, "sagit"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rn:Z

    const-string v0, "centaur"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->ro:Z

    const-string v0, "achilles"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rp:Z

    const-string v0, "jason"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rq:Z

    const-string v0, "tiffany"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rr:Z

    const-string v0, "ulysse"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rs:Z

    const-string v0, "oxygen"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rt:Z

    const-string v0, "chiron"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->ru:Z

    const-string v0, "ugg"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rv:Z

    const-string v0, "vince"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rw:Z

    const-string v0, "whyred"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rx:Z

    const-string v0, "beryllium"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->ry:Z

    const-string v0, "violet"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rz:Z

    const-string v0, "pisces"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rA:Z

    const-string v0, "is_hongmi"

    invoke-static {v0, v2}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->IS_HONGMI:Z

    const-string v0, "is_xiaomi"

    invoke-static {v0, v2}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->IS_XIAOMI:Z

    const-string v0, "hammerhead"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rB:Z

    const-string v0, "santoni"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rC:Z

    const-string v0, "polaris"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rD:Z

    const-string v0, "sirius"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rE:Z

    const-string v0, "dipper"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rF:Z

    const-string v0, "ursa"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rG:Z

    const-string v0, "equuleus"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rH:Z

    const-string v0, "andromeda"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rI:Z

    const-string v0, "perseus"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rJ:Z

    const-string v0, "cepheus"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rK:Z

    const-string v0, "grus"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rL:Z

    const-string v0, "pine"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rM:Z

    const-string v0, "pyxis"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rN:Z

    sget-boolean v0, Lmiui/os/Build;->IS_STABLE_VERSION:Z

    sput-boolean v0, Lcom/mi/config/b;->rO:Z

    sget-boolean v0, Lmiui/os/Build;->IS_CM_CUSTOMIZATION_TEST:Z

    sput-boolean v0, Lcom/mi/config/b;->rP:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static fZ()Z
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fZ()Z

    move-result v0

    return v0
.end method

.method public static gN()Z
    .locals 2

    invoke-static {}, Lcom/mi/config/b;->iH()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const-string v0, "support_camera_movie_solid"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gO()Z
    .locals 2

    const-string v0, "is_camera_use_still_effect_image"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static gP()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->qP:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    const-string v0, "is_need_force_recycle_effect"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public static gQ()Z
    .locals 2

    const-string v0, "support_camera_shader_effect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gR()Z
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->gS()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static gS()Z
    .locals 2

    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-eqz v0, :cond_1

    const-string v0, "ro.miui.region"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    const-string v1, "KR"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0

    :cond_0
    const-string v1, "KR"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static gT()Z
    .locals 2

    const-string v0, "support_camera_burst_shoot"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gU()Z
    .locals 2

    const-string v0, "support_camera_skin_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gV()Z
    .locals 2

    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "support_camera_age_detection"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static gW()Z
    .locals 2

    const-string v0, "support_camera_record_location"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gX()Z
    .locals 2

    sget v0, Lcom/android/camera/Util;->sWindowHeight:I

    int-to-float v0, v0

    sget v1, Lcom/android/camera/Util;->sWindowWidth:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    cmpl-float v0, v0, v1

    const/4 v1, 0x0

    if-ltz v0, :cond_0

    const-string v0, "is_18x9_ratio_screen"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static gY()Z
    .locals 2

    const-string v0, "support_camera_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static gZ()Z
    .locals 2

    const-string v0, "support_camera_new_style_time_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getBurstShootCount()I
    .locals 2

    const-string v0, "burst_shoot_count"

    const/16 v1, 0x64

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getGivenName()Ljava/lang/String;
    .locals 3

    invoke-static {}, Lcom/mi/config/b;->iH()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "_l"

    return-object v0

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    const-string v1, "c_0x18"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/mi/config/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, ""

    return-object v0

    :cond_1
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "BROWN EDITION"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "Explorer"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "ROY"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "_b"

    return-object v0

    :cond_3
    invoke-static {}, Lcom/mi/config/b;->iI()Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "_s"

    return-object v0

    :cond_4
    const-string v0, ""

    return-object v0

    :cond_5
    :goto_0
    const-string v0, "_a"

    return-object v0
.end method

.method public static gg()Z
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gg()Z

    move-result v0

    return v0
.end method

.method public static hA()Z
    .locals 2

    invoke-static {}, Lcom/mi/config/b;->he()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x15

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static hB()Z
    .locals 2

    const-string v0, "is_camera_freeze_after_hdr_capture"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hC()Z
    .locals 2

    const-string v0, "is_camera_face_detection_need_orientation"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hD()Z
    .locals 1

    sget-boolean v0, Lcom/mi/config/b;->IS_XIAOMI:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_HONGMI:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static hE()Z
    .locals 2

    const-string v0, "is_capture_stop_face_detection"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hF()Z
    .locals 2

    const-string v0, "is_camera_hold_blur_background"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hG()Z
    .locals 2

    const-string v0, "support_camera_peaking_mf"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hH()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->qG:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qP:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qA:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qH:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qC:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qD:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qF:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qy:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_MI2A:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qB:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qQ:Z

    if-nez v0, :cond_0

    const-string v0, "is_video_snapshot_size_limit"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static hI()Z
    .locals 2

    const-string v0, "is_surface_size_limit"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hJ()Z
    .locals 1

    sget-boolean v0, Lcom/mi/config/b;->qy:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_MI2A:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static hK()Z
    .locals 2

    const-string v0, "support_camera_gradienter"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hL()I
    .locals 2

    const-string v0, "camera_hibernation_timeout_in_minutes"

    sget v1, Lcom/android/camera/AutoLockManager;->HIBERNATION_TIMEOUT:I

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static hM()Z
    .locals 2

    const-string v0, "is_camera_lower_qrscan_frequency"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hN()Z
    .locals 2

    const-string v0, "is_camera_preview_with_subthread_looper"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hO()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static hP()Z
    .locals 2

    const-string v0, "is_camera_app_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hQ()Z
    .locals 2

    const-string v0, "support_edge_handgrip"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hR()Z
    .locals 2

    const-string v0, "support_camera_tilt_shift"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hS()Z
    .locals 2

    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "support_camera_quick_snap"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static hT()Ljava/lang/String;
    .locals 1

    const-string v0, "camera_continuous_shot_callback_class"

    invoke-static {v0}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static hU()Ljava/lang/String;
    .locals 1

    const-string v0, "camera_continuous_shot_callback_setter"

    invoke-static {v0}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static hV()Z
    .locals 2

    const-string v0, "is_hal_does_caf_when_flash_on"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hW()Z
    .locals 2

    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "support_camera_magic_mirror"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static hX()Z
    .locals 1

    sget-boolean v0, Lcom/mi/config/b;->qM:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v0, :cond_1

    :cond_0
    sget-boolean v0, Lcom/mi/config/b;->re:Z

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static hY()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static hZ()Z
    .locals 2

    const-string v0, "support_camera_square_mode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ha()Z
    .locals 2

    const-string v0, "support_camera_face_info_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hb()Z
    .locals 2

    const-string v0, "support_camera_video_pause"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hc()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->rP:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "support_camera_boost_brightness"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static hd()Z
    .locals 2

    const-string v0, "is_lower_size_effect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static he()Z
    .locals 2

    const-string v0, "qcom"

    const-string v1, "vendor"

    invoke-static {v1}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static hf()Z
    .locals 2

    const-string v0, "nvidia"

    const-string v1, "vendor"

    invoke-static {v1}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static hg()Z
    .locals 2

    const-string v0, "leadcore"

    const-string v1, "vendor"

    invoke-static {v1}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static hh()Z
    .locals 2

    const-string v0, "support_dual_sd_card"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hi()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static hj()Z
    .locals 2

    const-string v0, "support_camera_aohdr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hk()Z
    .locals 2

    const-string v0, "support_camera_hfr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hl()Z
    .locals 2

    const-string v0, "support_chroma_flash"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hm()Z
    .locals 2

    const-string v0, "support_object_track"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hn()Z
    .locals 2

    const-string v0, "support_camera_4k_quality"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ho()Z
    .locals 2

    const-string v0, "support_camera_ubifocus"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hp()Z
    .locals 3

    const-string v0, "camera_supported_asd"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, 0x1

    and-int/2addr v0, v2

    if-eqz v0, :cond_0

    move v1, v2

    nop

    :cond_0
    return v1
.end method

.method public static hq()Z
    .locals 2

    const-string v0, "camera_supported_asd"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    and-int/lit8 v0, v0, 0xd

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static hr()Z
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fj()Z

    move-result v0

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_HONGMI:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static hs()Z
    .locals 2

    const-string v0, "camera_supported_asd"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static ht()Z
    .locals 2

    const-string v0, "is_support_tele_asd_night"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/mi/config/b;->hu()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static hu()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static hv()Z
    .locals 2

    const-string v0, "support_camera_manual_function"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hw()Z
    .locals 2

    const-string v0, "support_camera_audio_focus"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hx()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->qG:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qP:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qA:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qH:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qC:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qD:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qF:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qy:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_MI2A:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qB:Z

    if-nez v0, :cond_0

    const-string v0, "is_front_video_quality_1080p"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static hy()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static hz()Z
    .locals 2

    const-string v0, "support_camera_torch_capture"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iA()Z
    .locals 2

    const-string v0, "support_mi_face_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iB()Z
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->iz()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/mi/config/b;->iA()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static iC()Z
    .locals 2

    const-string v0, "use_legacy_normal_filter"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iD()Z
    .locals 2

    const-string v0, "enable_algorithm_in_file_suffix"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iE()Z
    .locals 2

    const-string v0, "support_realtime_manual_exposure_time"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iF()Z
    .locals 2

    const-string v0, "support_picture_watermark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iG()Z
    .locals 2

    const-string v0, "sensor_has_latency"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iH()Z
    .locals 3

    const-string v0, "onc"

    sget-object v1, Lcom/mi/config/b;->qp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const-string v0, "ro.boot.hwversion"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const/16 v2, 0x32

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v2, v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public static iI()Z
    .locals 2

    sget-object v0, Lcom/mi/config/b;->qp:Ljava/lang/String;

    const-string v1, "lavender"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "India_48_5"

    const-string v1, "ro.boot.hwc"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static iJ()Z
    .locals 1

    sget-boolean v0, Lcom/mi/config/b;->rJ:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static iK()Z
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->iJ()Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->rN:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->rL:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static ia()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->qA:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qQ:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->qG:Z

    if-nez v0, :cond_0

    const-string v0, "is_new_hdr_param_key_used"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static ib()Z
    .locals 2

    const-string v0, "support_full_size_panorama"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static ic()Z
    .locals 2

    const-string v0, "is_hrf_video_capture_support"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/mi/config/b;->isMTKPlatform()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static id()Z
    .locals 2

    const-string v0, "support_hfr_video_pause"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ie()Z
    .locals 2

    const-string v0, "is_support_stereo"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static if()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/mi/config/b;->rT:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/mi/config/b;->rT:Ljava/util/ArrayList;

    const-string v0, "fp_nav_event_name_list"

    invoke-static {v0}, Lcom/mi/config/d;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v1, Lcom/mi/config/b;->rT:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    :cond_0
    sget-object v0, Lcom/mi/config/b;->rT:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static ig()Z
    .locals 2

    const-string v0, "is_full_size_effect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ih()Z
    .locals 2

    const-string v0, "support_camera_burst_shoot_denoise"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ii()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static ij()Z
    .locals 2

    const-string v0, "is_camera_isp_rotated"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ik()Z
    .locals 2

    const-string v0, "is_support_fhd_fhr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static il()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->rx:Z

    if-eqz v0, :cond_0

    const-string v0, "ro.boot.hwc"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "India"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_0
    const-string v0, "is_front_remosic_sensor"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static im()Z
    .locals 1

    sget-boolean v0, Lcom/mi/config/b;->rb:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->ru:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->rD:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public static in()Z
    .locals 2

    const-string v0, "support_psensor_pocket_mode"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ip()Z
    .locals 2

    const-string v0, "is_rgb888_egl_prefer"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iq()Z
    .locals 2

    const-string v0, "support_front_flash"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ir()Z
    .locals 2

    invoke-static {}, Lcom/mi/config/b;->iq()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const-string v0, "support_video_front_flash"

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private static is()Z
    .locals 2

    const-string v0, "ro.hardware.fp.fod"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isMTKPlatform()Z
    .locals 2

    const-string v0, "mediatek"

    const-string v1, "vendor"

    invoke-static {v1}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isPad()Z
    .locals 2

    const-string v0, "is_pad"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportSuperResolution()Z
    .locals 2

    const-string v0, "support_super_resolution"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isSupportedOpticalZoom()Z
    .locals 2

    const-string v0, "is_support_optical_zoom"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static it()Z
    .locals 2

    const-string v0, "front_fingerprint_sensor"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/mi/config/b;->is()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public static iu()Z
    .locals 2

    invoke-static {}, Lcom/mi/config/b;->it()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gF()Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    invoke-static {}, Lcom/mi/config/b;->if()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/mi/config/b;->if()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    return v0

    :cond_2
    return v1
.end method

.method public static iv()Z
    .locals 2

    const-string v0, "support_screen_light"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iw()Z
    .locals 2

    const-string v0, "support_camera_dynamic_light_spot"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ix()Z
    .locals 2

    const-string v0, "support_front_beauty_mfnr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iy()Z
    .locals 2

    const-string v0, "support_video_hfr_mode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iz()Z
    .locals 2

    const-string v0, "support_3d_face_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static r(Z)Z
    .locals 2

    const-string v0, "ro.miui.customized.region"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "fr_sfr"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    return p0
.end method
