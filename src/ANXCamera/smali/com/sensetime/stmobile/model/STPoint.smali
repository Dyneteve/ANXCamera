.class public Lcom/sensetime/stmobile/model/STPoint;
.super Ljava/lang/Object;
.source "STPoint.java"


# instance fields
.field private x:F

.field private y:F


# direct methods
.method public constructor <init>(FF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/sensetime/stmobile/model/STPoint;->x:F

    iput p2, p0, Lcom/sensetime/stmobile/model/STPoint;->y:F

    return-void
.end method


# virtual methods
.method public getX()F
    .locals 1

    iget v0, p0, Lcom/sensetime/stmobile/model/STPoint;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    iget v0, p0, Lcom/sensetime/stmobile/model/STPoint;->y:F

    return v0
.end method

.method public setX(F)V
    .locals 0

    iput p1, p0, Lcom/sensetime/stmobile/model/STPoint;->x:F

    return-void
.end method

.method public setY(F)V
    .locals 0

    iput p1, p0, Lcom/sensetime/stmobile/model/STPoint;->y:F

    return-void
.end method
