.class public Lcom/arcsoft/supernight/SuperNightProcess$Param;
.super Ljava/lang/Object;
.source "SuperNightProcess.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arcsoft/supernight/SuperNightProcess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Param"
.end annotation


# instance fields
.field final synthetic a:Lcom/arcsoft/supernight/SuperNightProcess;

.field public curveBrightness:I

.field public curveContrast:I

.field public curveHighlight:I

.field public curveMid:I

.field public curveShadow:I

.field public edgeSharpIntensity:I

.field public noiseLength:I

.field public sharpIntensity:I


# direct methods
.method public constructor <init>(Lcom/arcsoft/supernight/SuperNightProcess;)V
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/supernight/SuperNightProcess$Param;->a:Lcom/arcsoft/supernight/SuperNightProcess;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
