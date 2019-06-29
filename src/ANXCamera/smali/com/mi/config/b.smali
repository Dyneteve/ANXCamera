.class public Lcom/mi/config/b;
.super Ljava/lang/Object;
.source "Device.java"


# static fields
.field public static final IS_HONGMI:Z

.field public static final IS_MI2A:Z

.field public static final IS_XIAOMI:Z

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

.field public static final rQ:Z

.field public static final rR:Z

.field public static final rS:Z

.field public static final rT:Z

.field public static final rU:Z

.field public static final rV:Z

.field public static final rW:Z

.field public static final rX:Z

.field public static final rY:Z

.field public static final rZ:Z

.field public static final rp:Ljava/lang/String;

.field public static final rq:Ljava/lang/String; = "qcom"

.field public static final rr:Ljava/lang/String; = "mediatek"

.field public static final rs:Ljava/lang/String; = "leadcore"

.field public static final rt:Ljava/lang/String; = "nvidia"

.field public static final ru:Ljava/lang/String; = "intel"

.field private static final rv:I = 0x64

.field public static final rw:Ljava/lang/String;

.field public static final rx:Z

.field public static final ry:Z

.field public static final rz:Z

.field public static final sA:Z

.field public static final sB:Z

.field public static final sC:Z

.field public static final sD:Z

.field public static final sE:Z

.field public static final sF:Z

.field public static final sG:Z

.field public static final sH:Z

.field public static final sI:Z

.field public static final sJ:Z

.field public static final sK:Z

.field public static final sL:Z

.field public static final sM:Z

.field public static final sN:Z

.field public static final sO:Z

.field public static final sP:Z

.field public static final sQ:Z

.field private static final sR:I = 0x1

.field private static final sS:I = 0x4

.field private static final sT:I = 0x8

.field private static sU:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final sb:Z

.field public static final sc:Z

.field public static final se:Z

.field public static final sf:Z

.field public static final sg:Z

.field public static final sh:Z

.field public static final si:Z

.field public static final sj:Z

.field public static final sk:Z

.field public static final sl:Z

.field public static final sm:Z

.field public static final sn:Z

.field public static final so:Z

.field public static final sp:Z

.field public static final sq:Z

.field public static final sr:Z

.field public static final ss:Z

.field public static final st:Z

.field public static final su:Z

.field public static final sv:Z

.field public static final sw:Z

.field public static final sx:Z

.field public static final sy:Z

.field public static final sz:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    sget-object v0, Lmiui/os/Build;->DEVICE:Ljava/lang/String;

    sput-object v0, Lcom/mi/config/b;->rp:Ljava/lang/String;

    sget-object v0, Lmiui/os/Build;->MODEL:Ljava/lang/String;

    sput-object v0, Lcom/mi/config/b;->rw:Ljava/lang/String;

    sget-boolean v0, Lmiui/os/Build;->IS_MITWO:Z

    sput-boolean v0, Lcom/mi/config/b;->rx:Z

    sget-boolean v0, Lmiui/os/Build;->IS_MI2A:Z

    sput-boolean v0, Lcom/mi/config/b;->IS_MI2A:Z

    const-string v0, "pisces"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->ry:Z

    const-string v0, "cancro"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

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
    sput-boolean v0, Lcom/mi/config/b;->rz:Z

    sget-boolean v0, Lcom/mi/config/b;->rz:Z

    if-nez v0, :cond_2

    sget-boolean v0, Lcom/mi/config/b;->ry:Z

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    move v0, v2

    goto :goto_2

    :cond_2
    :goto_1
    move v0, v1

    :goto_2
    sput-boolean v0, Lcom/mi/config/b;->rA:Z

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
    sput-boolean v0, Lcom/mi/config/b;->rB:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_S:Z

    sput-boolean v0, Lcom/mi/config/b;->rC:Z

    sget-boolean v0, Lcom/mi/config/b;->rB:Z

    if-nez v0, :cond_5

    sget-boolean v0, Lcom/mi/config/b;->rC:Z

    if-eqz v0, :cond_4

    goto :goto_4

    :cond_4
    move v0, v2

    goto :goto_5

    :cond_5
    :goto_4
    move v0, v1

    :goto_5
    sput-boolean v0, Lcom/mi/config/b;->rD:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOS_LTE_MTK:Z

    sput-boolean v0, Lcom/mi/config/b;->rE:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWO_A:Z

    sput-boolean v0, Lcom/mi/config/b;->rF:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_THREE:Z

    sput-boolean v0, Lcom/mi/config/b;->rG:Z

    const-string v0, "gucci"

    sget-object v3, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rH:Z

    const-string v0, "hermes"

    sget-object v3, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rI:Z

    const-string v0, "hennessy"

    sget-object v3, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rJ:Z

    const-string v0, "dior"

    sget-object v3, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rK:Z

    const-string v0, "kenzo"

    sget-object v3, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rL:Z

    const-string v0, "kate"

    sget-object v3, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rM:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_7

    const-string v0, "HM2014816"

    sget-object v3, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    goto :goto_6

    :cond_6
    move v1, v2

    nop

    :cond_7
    :goto_6
    sput-boolean v1, Lcom/mi/config/b;->rN:Z

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX_LC:Z

    sput-boolean v0, Lcom/mi/config/b;->rO:Z

    sget-boolean v0, Lmiui/os/Build;->IS_MIFOUR:Z

    sput-boolean v0, Lcom/mi/config/b;->rP:Z

    sget-boolean v0, Lmiui/os/Build;->IS_MIPAD:Z

    sput-boolean v0, Lcom/mi/config/b;->rQ:Z

    sget-boolean v0, Lmiui/os/Build;->IS_MIFIVE:Z

    sput-boolean v0, Lcom/mi/config/b;->rR:Z

    const-string v0, "leo"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rS:Z

    const-string v0, "ferrari"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rT:Z

    const-string v0, "ido"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rU:Z

    const-string v0, "aqua"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rV:Z

    const-string v0, "gemini"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rW:Z

    const-string v0, "gold"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rX:Z

    const-string v0, "capricorn"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rY:Z

    const-string v0, "natrium"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->rZ:Z

    const-string v0, "lithium"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sb:Z

    const-string v0, "scorpio"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sc:Z

    const-string v0, "libra"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->se:Z

    const-string v0, "land"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sf:Z

    const-string v0, "hydrogen"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sg:Z

    const-string v0, "helium"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sh:Z

    const-string v0, "omega"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->si:Z

    sget-object v0, Lcom/mi/config/b;->rp:Ljava/lang/String;

    const-string v1, "nike"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sj:Z

    sget-object v0, Lcom/mi/config/b;->rp:Ljava/lang/String;

    const-string v1, "mark"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sk:Z

    sget-object v0, Lcom/mi/config/b;->rp:Ljava/lang/String;

    const-string v1, "prada"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sl:Z

    sget-object v0, Lcom/mi/config/b;->rp:Ljava/lang/String;

    const-string v1, "mido"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sm:Z

    const-string v0, "rolex"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sn:Z

    const-string v0, "sagit"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->so:Z

    const-string v0, "centaur"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sp:Z

    const-string v0, "achilles"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sq:Z

    const-string v0, "jason"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sr:Z

    const-string v0, "tiffany"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->ss:Z

    const-string/jumbo v0, "ulysse"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->st:Z

    const-string v0, "oxygen"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->su:Z

    const-string v0, "chiron"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sv:Z

    const-string/jumbo v0, "ugg"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sw:Z

    const-string/jumbo v0, "vince"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sx:Z

    const-string/jumbo v0, "whyred"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sy:Z

    const-string v0, "beryllium"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sz:Z

    const-string/jumbo v0, "violet"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sA:Z

    const-string v0, "pisces"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sB:Z

    const-string v0, "is_hongmi"

    invoke-static {v0, v2}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->IS_HONGMI:Z

    const-string v0, "is_xiaomi"

    invoke-static {v0, v2}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->IS_XIAOMI:Z

    const-string v0, "hammerhead"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sC:Z

    const-string v0, "santoni"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sD:Z

    const-string v0, "polaris"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sE:Z

    const-string v0, "sirius"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sF:Z

    const-string v0, "dipper"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sG:Z

    const-string/jumbo v0, "ursa"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sH:Z

    const-string v0, "equuleus"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sI:Z

    const-string v0, "andromeda"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sJ:Z

    const-string v0, "perseus"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sK:Z

    const-string v0, "cepheus"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sL:Z

    const-string v0, "grus"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sM:Z

    const-string v0, "pine"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sN:Z

    const-string v0, "pyxis"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/mi/config/b;->sO:Z

    sget-boolean v0, Lmiui/os/Build;->IS_STABLE_VERSION:Z

    sput-boolean v0, Lcom/mi/config/b;->sP:Z

    sget-boolean v0, Lmiui/os/Build;->IS_CM_CUSTOMIZATION_TEST:Z

    sput-boolean v0, Lcom/mi/config/b;->sQ:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static gE()Z
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gE()Z

    move-result v0

    return v0
.end method

.method public static gL()Z
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gL()Z

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

    invoke-static {}, Lcom/mi/config/b;->ju()Z

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

    if-nez v0, :cond_6

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
    invoke-static {}, Lcom/mi/config/b;->jw()Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "_s"

    return-object v0

    :cond_4
    invoke-static {}, Lcom/mi/config/b;->jv()Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "_global"

    return-object v0

    :cond_5
    const-string v0, ""

    return-object v0

    :cond_6
    :goto_0
    const-string v0, "_a"

    return-object v0
.end method

.method public static hA()Z
    .locals 2

    invoke-static {}, Lcom/mi/config/b;->ju()Z

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

.method public static hB()Z
    .locals 2

    const-string v0, "is_camera_use_still_effect_image"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static hC()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->rO:Z

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

.method public static hD()Z
    .locals 2

    const-string v0, "support_camera_shader_effect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hE()Z
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->hF()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static hF()Z
    .locals 2

    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/android/camera/Util;->sRegion:Ljava/lang/String;

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

.method public static hG()Z
    .locals 2

    const-string v0, "support_camera_burst_shoot"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hH()Z
    .locals 2

    const-string v0, "support_camera_skin_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hI()Z
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

.method public static hJ()Z
    .locals 2

    const-string v0, "support_camera_record_location"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hK()Z
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

.method public static hL()Z
    .locals 2

    const-string v0, "support_camera_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hM()Z
    .locals 2

    const-string v0, "support_camera_new_style_time_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hN()Z
    .locals 2

    const-string v0, "support_camera_face_info_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hO()Z
    .locals 2

    const-string v0, "support_camera_video_pause"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hP()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->sQ:Z

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

.method public static hQ()Z
    .locals 2

    const-string v0, "is_lower_size_effect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hR()Z
    .locals 2

    const-string v0, "qcom"

    const-string/jumbo v1, "vendor"

    invoke-static {v1}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static hS()Z
    .locals 2

    const-string v0, "nvidia"

    const-string/jumbo v1, "vendor"

    invoke-static {v1}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static hT()Z
    .locals 2

    const-string v0, "leadcore"

    const-string/jumbo v1, "vendor"

    invoke-static {v1}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static hU()Z
    .locals 2

    const-string v0, "support_dual_sd_card"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hV()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static hW()Z
    .locals 2

    const-string v0, "support_camera_aohdr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hX()Z
    .locals 2

    const-string v0, "support_camera_hfr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hY()Z
    .locals 2

    const-string v0, "support_chroma_flash"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static hZ()Z
    .locals 2

    const-string v0, "support_object_track"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iA()Z
    .locals 2

    const-string v0, "is_camera_lower_qrscan_frequency"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iB()Z
    .locals 2

    const-string v0, "is_camera_preview_with_subthread_looper"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iC()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static iD()Z
    .locals 2

    const-string v0, "is_camera_app_water_mark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iE()Z
    .locals 2

    const-string v0, "support_edge_handgrip"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iF()Z
    .locals 2

    const-string v0, "support_camera_tilt_shift"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iG()Z
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

.method public static iH()Ljava/lang/String;
    .locals 1

    const-string v0, "camera_continuous_shot_callback_class"

    invoke-static {v0}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static iI()Ljava/lang/String;
    .locals 1

    const-string v0, "camera_continuous_shot_callback_setter"

    invoke-static {v0}, Lcom/mi/config/d;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static iJ()Z
    .locals 2

    const-string v0, "is_hal_does_caf_when_flash_on"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iK()Z
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

.method public static iL()Z
    .locals 1

    sget-boolean v0, Lcom/mi/config/b;->rL:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    if-nez v0, :cond_1

    :cond_0
    sget-boolean v0, Lcom/mi/config/b;->sf:Z

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static iM()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public static iN()Z
    .locals 2

    const-string v0, "support_camera_square_mode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iO()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->rz:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rP:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rF:Z

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

.method public static iP()Z
    .locals 2

    const-string v0, "support_full_size_panorama"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static iQ()Z
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

.method public static iR()Z
    .locals 2

    const-string v0, "support_hfr_video_pause"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iS()Z
    .locals 2

    const-string v0, "is_support_stereo"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iT()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/mi/config/b;->sU:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/mi/config/b;->sU:Ljava/util/ArrayList;

    const-string v0, "fp_nav_event_name_list"

    invoke-static {v0}, Lcom/mi/config/d;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v1, Lcom/mi/config/b;->sU:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    :cond_0
    sget-object v0, Lcom/mi/config/b;->sU:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static iU()Z
    .locals 2

    const-string v0, "is_full_size_effect"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iV()Z
    .locals 2

    const-string v0, "support_camera_burst_shoot_denoise"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iW()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static iX()Z
    .locals 2

    const-string v0, "is_camera_isp_rotated"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iY()Z
    .locals 2

    const-string v0, "is_support_fhd_fhr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iZ()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->sy:Z

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

.method public static ia()Z
    .locals 2

    const-string v0, "support_camera_4k_quality"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ib()Z
    .locals 2

    const-string v0, "support_camera_ubifocus"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ic()Z
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

.method public static id()Z
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

.method public static ie()Z
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fL()Z

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

.method public static if()Z
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

.method public static ig()Z
    .locals 2

    const-string v0, "is_support_tele_asd_night"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/mi/config/b;->ih()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1
.end method

.method public static ih()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static ii()Z
    .locals 2

    const-string v0, "support_camera_manual_function"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ij()Z
    .locals 2

    const-string v0, "support_camera_audio_focus"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ik()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->rF:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rO:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rz:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rG:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rB:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rC:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rE:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rx:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_MI2A:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rA:Z

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

.method public static il()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public static im()Z
    .locals 2

    const-string v0, "support_camera_torch_capture"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static in()Z
    .locals 2

    invoke-static {}, Lcom/mi/config/b;->hR()Z

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

.method public static ip()Z
    .locals 2

    const-string v0, "is_camera_freeze_after_hdr_capture"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iq()Z
    .locals 2

    const-string v0, "is_camera_face_detection_need_orientation"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ir()Z
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

.method public static is()Z
    .locals 2

    const-string v0, "is_capture_stop_face_detection"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isMTKPlatform()Z
    .locals 2

    const-string v0, "mediatek"

    const-string/jumbo v1, "vendor"

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

.method public static it()Z
    .locals 2

    const-string v0, "is_camera_hold_blur_background"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iu()Z
    .locals 2

    const-string v0, "support_camera_peaking_mf"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iv()Z
    .locals 2

    sget-boolean v0, Lcom/mi/config/b;->rF:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rO:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lmiui/os/Build;->IS_HONGMI_TWOX:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rz:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rG:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rB:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rC:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rE:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rx:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->IS_MI2A:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rA:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/mi/config/b;->rP:Z

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

.method public static iw()Z
    .locals 2

    const-string v0, "is_surface_size_limit"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ix()Z
    .locals 1

    sget-boolean v0, Lcom/mi/config/b;->rx:Z

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

.method public static iy()Z
    .locals 2

    const-string v0, "support_camera_gradienter"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static iz()I
    .locals 2

    const-string v0, "camera_hibernation_timeout_in_minutes"

    sget v1, Lcom/android/camera/AutoLockManager;->HIBERNATION_TIMEOUT:I

    invoke-static {v0, v1}, Lcom/mi/config/d;->getInteger(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static ja()Z
    .locals 1

    sget-boolean v0, Lcom/mi/config/b;->sb:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->sv:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->sE:Z

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

.method public static jb()Z
    .locals 2

    const-string v0, "support_psensor_pocket_mode"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static jc()Z
    .locals 2

    const-string v0, "is_rgb888_egl_prefer"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static jd()Z
    .locals 2

    const-string v0, "support_front_flash"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static je()Z
    .locals 2

    invoke-static {}, Lcom/mi/config/b;->jd()Z

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

.method private static jf()Z
    .locals 2

    const-string v0, "ro.hardware.fp.fod"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static jg()Z
    .locals 2

    const-string v0, "front_fingerprint_sensor"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/mi/config/b;->jf()Z

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

.method public static jh()Z
    .locals 2

    invoke-static {}, Lcom/mi/config/b;->jg()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->hk()Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    invoke-static {}, Lcom/mi/config/b;->iT()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/mi/config/b;->iT()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x1

    return v0

    :cond_2
    return v1
.end method

.method public static ji()Z
    .locals 2

    const-string v0, "support_screen_light"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static jj()Z
    .locals 2

    const-string v0, "support_camera_dynamic_light_spot"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static jk()Z
    .locals 2

    const-string v0, "support_front_beauty_mfnr"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static jl()Z
    .locals 2

    const-string v0, "support_video_hfr_mode"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static jm()Z
    .locals 2

    const-string v0, "support_3d_face_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static jn()Z
    .locals 2

    const-string v0, "support_mi_face_beauty"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static jo()Z
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->jm()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/mi/config/b;->jn()Z

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

.method public static jp()Z
    .locals 2

    const-string/jumbo v0, "use_legacy_normal_filter"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static jq()Z
    .locals 2

    const-string v0, "enable_algorithm_in_file_suffix"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static jr()Z
    .locals 2

    const-string v0, "support_realtime_manual_exposure_time"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static js()Z
    .locals 2

    const-string v0, "support_picture_watermark"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static jt()Z
    .locals 2

    const-string v0, "sensor_has_latency"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/mi/config/d;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static ju()Z
    .locals 3

    const-string v0, "onc"

    sget-object v1, Lcom/mi/config/b;->rp:Ljava/lang/String;

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

.method public static jv()Z
    .locals 2

    sget-object v0, Lcom/mi/config/b;->rp:Ljava/lang/String;

    const-string v1, "raphael"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

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

.method public static jw()Z
    .locals 2

    sget-object v0, Lcom/mi/config/b;->rp:Ljava/lang/String;

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

.method public static jx()Z
    .locals 1

    sget-boolean v0, Lcom/mi/config/b;->sK:Z

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

.method public static jy()Z
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->jx()Z

    move-result v0

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->sO:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/mi/config/b;->sM:Z

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
