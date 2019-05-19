.class public Lcom/sensetime/stmobile/model/STRect;
.super Ljava/lang/Object;
.source "STRect.java"


# instance fields
.field private bottom:I

.field private left:I

.field private right:I

.field private top:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/sensetime/stmobile/model/STRect;->left:I

    iput p2, p0, Lcom/sensetime/stmobile/model/STRect;->top:I

    iput p3, p0, Lcom/sensetime/stmobile/model/STRect;->right:I

    iput p4, p0, Lcom/sensetime/stmobile/model/STRect;->bottom:I

    return-void
.end method
