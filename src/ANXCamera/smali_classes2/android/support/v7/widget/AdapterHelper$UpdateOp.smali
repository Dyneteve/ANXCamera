.class Landroid/support/v7/widget/AdapterHelper$UpdateOp;
.super Ljava/lang/Object;
.source "AdapterHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/AdapterHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "UpdateOp"
.end annotation


# static fields
.field static final ADD:I = 0x0

.field static final MOVE:I = 0x3

.field static final POOL_SIZE:I = 0x1e

.field static final REMOVE:I = 0x1

.field static final UPDATE:I = 0x2


# instance fields
.field cmd:I

.field itemCount:I

.field payload:Ljava/lang/Object;

.field positionStart:I


# direct methods
.method constructor <init>(IIILjava/lang/Object;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    iput p2, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iput p3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iput-object p4, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method cmdToString()Ljava/lang/String;
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    packed-switch v0, :pswitch_data_14

    const-string v0, "??"

    return-object v0

    :pswitch_8
    const-string v0, "mv"

    return-object v0

    :pswitch_b
    const-string v0, "up"

    return-object v0

    :pswitch_e
    const-string v0, "rm"

    return-object v0

    :pswitch_11
    const-string v0, "add"

    return-object v0

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
    .end packed-switch
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_5c

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_12

    goto :goto_5c

    :cond_12
    move-object v2, p1

    check-cast v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;

    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    if-eq v3, v4, :cond_1c

    return v1

    :cond_1c
    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/4 v4, 0x3

    if-ne v3, v4, :cond_39

    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v4, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    sub-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-ne v3, v0, :cond_39

    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-ne v3, v4, :cond_39

    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-ne v3, v4, :cond_39

    return v0

    :cond_39
    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    if-eq v3, v4, :cond_40

    return v1

    :cond_40
    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    iget v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    if-eq v3, v4, :cond_47

    return v1

    :cond_47
    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    if-eqz v3, :cond_56

    iget-object v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    iget-object v4, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5b

    return v1

    :cond_56
    iget-object v3, v2, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    if-eqz v3, :cond_5b

    return v1

    :cond_5b
    return v0

    :cond_5c
    :goto_5c
    return v1
.end method

.method public hashCode()I
    .registers 5

    iget v0, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmd:I

    const/16 v1, 0x1f

    mul-int v2, v1, v0

    iget v3, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    add-int/2addr v2, v3

    mul-int/2addr v1, v2

    iget v0, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->cmdToString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ",s:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->positionStart:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "c:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->itemCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ",p:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v7/widget/AdapterHelper$UpdateOp;->payload:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
