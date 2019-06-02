.class Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;
.super Ljava/lang/Object;
.source "TextDirectionHeuristicsCompat.java"

# interfaces
.implements Landroid/support/v4/text/TextDirectionHeuristicsCompat$TextDirectionAlgorithm;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/text/TextDirectionHeuristicsCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AnyStrong"
.end annotation


# static fields
.field public static final INSTANCE_LTR:Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;

.field public static final INSTANCE_RTL:Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;


# instance fields
.field private final mLookForRtl:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;-><init>(Z)V

    sput-object v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->INSTANCE_RTL:Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;

    new-instance v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;-><init>(Z)V

    sput-object v0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->INSTANCE_LTR:Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;

    return-void
.end method

.method private constructor <init>(Z)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->mLookForRtl:Z

    return-void
.end method


# virtual methods
.method public checkRtl(Ljava/lang/CharSequence;II)I
    .registers 8

    const/4 v0, 0x0

    move v1, p2

    add-int v2, p2, p3

    :goto_4
    if-ge v1, v2, :cond_29

    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->getDirectionality(C)B

    move-result v3

    # invokes: Landroid/support/v4/text/TextDirectionHeuristicsCompat;->isRtlText(I)I
    invoke-static {v3}, Landroid/support/v4/text/TextDirectionHeuristicsCompat;->access$200(I)I

    move-result v3

    packed-switch v3, :pswitch_data_30

    goto :goto_26

    :pswitch_16
    iget-boolean v3, p0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->mLookForRtl:Z

    if-nez v3, :cond_1c

    const/4 v3, 0x1

    return v3

    :cond_1c
    const/4 v0, 0x1

    goto :goto_26

    :pswitch_1e
    iget-boolean v3, p0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->mLookForRtl:Z

    if-eqz v3, :cond_24

    const/4 v3, 0x0

    return v3

    :cond_24
    const/4 v0, 0x1

    nop

    :goto_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_29
    if-eqz v0, :cond_2e

    iget-boolean v1, p0, Landroid/support/v4/text/TextDirectionHeuristicsCompat$AnyStrong;->mLookForRtl:Z

    return v1

    :cond_2e
    const/4 v1, 0x2

    return v1

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_16
    .end packed-switch
.end method
