.class public Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;
.super Ljava/lang/Object;
.source "SuperNightProcess.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arcsoft/supernight/SuperNightProcess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FaceInfo"
.end annotation


# instance fields
.field final synthetic a:Lcom/arcsoft/supernight/SuperNightProcess;

.field public faceNum:I

.field public faceOrientation:I

.field public faceRects:[Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lcom/arcsoft/supernight/SuperNightProcess;)V
    .locals 0

    iput-object p1, p0, Lcom/arcsoft/supernight/SuperNightProcess$FaceInfo;->a:Lcom/arcsoft/supernight/SuperNightProcess;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
