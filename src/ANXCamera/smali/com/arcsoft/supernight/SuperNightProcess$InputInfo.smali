.class public Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;
.super Ljava/lang/Object;
.source "SuperNightProcess.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arcsoft/supernight/SuperNightProcess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "InputInfo"
.end annotation


# instance fields
.field final synthetic a:Lcom/arcsoft/supernight/SuperNightProcess;

.field public cameraState:I

.field public curIndex:I

.field public imgNum:I

.field public inputFd:[I

.field public inputImages:[Lcom/arcsoft/supernight/RawImage;

.field public inputImagesEV:[F


# direct methods
.method public constructor <init>(Lcom/arcsoft/supernight/SuperNightProcess;)V
    .locals 1

    iput-object p1, p0, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->a:Lcom/arcsoft/supernight/SuperNightProcess;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 p1, 0x14

    new-array v0, p1, [Lcom/arcsoft/supernight/RawImage;

    iput-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->inputImages:[Lcom/arcsoft/supernight/RawImage;

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->inputImagesEV:[F

    new-array p1, p1, [I

    iput-object p1, p0, Lcom/arcsoft/supernight/SuperNightProcess$InputInfo;->inputFd:[I

    return-void
.end method
