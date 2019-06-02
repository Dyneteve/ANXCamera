.class public Lcom/ss/android/ttve/model/FilterBean;
.super Ljava/lang/Object;
.source "FilterBean.java"


# instance fields
.field private mIntensity:F

.field private mLeftResPath:Ljava/lang/String;

.field private mPosition:F

.field private mRightResPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    const-string v0, ""

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/ss/android/ttve/model/FilterBean;-><init>(Ljava/lang/String;F)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;F)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p1, v0, p2}, Lcom/ss/android/ttve/model/FilterBean;-><init>(Ljava/lang/String;Ljava/lang/String;FF)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;FF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p4, p0, Lcom/ss/android/ttve/model/FilterBean;->mIntensity:F

    iput-object p1, p0, Lcom/ss/android/ttve/model/FilterBean;->mLeftResPath:Ljava/lang/String;

    iput-object p2, p0, Lcom/ss/android/ttve/model/FilterBean;->mRightResPath:Ljava/lang/String;

    iput p3, p0, Lcom/ss/android/ttve/model/FilterBean;->mPosition:F

    return-void
.end method


# virtual methods
.method public getIntensity()F
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/model/FilterBean;->mIntensity:F

    return v0
.end method

.method public getLeftResPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/model/FilterBean;->mLeftResPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPosition()F
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/model/FilterBean;->mPosition:F

    return v0
.end method

.method public getRightResPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/ttve/model/FilterBean;->mRightResPath:Ljava/lang/String;

    return-object v0
.end method

.method public setIntensity(F)V
    .locals 0

    iput p1, p0, Lcom/ss/android/ttve/model/FilterBean;->mIntensity:F

    return-void
.end method

.method public setLeftResPath(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ttve/model/FilterBean;->mLeftResPath:Ljava/lang/String;

    return-void
.end method

.method public setPosition(F)V
    .locals 0

    iput p1, p0, Lcom/ss/android/ttve/model/FilterBean;->mPosition:F

    return-void
.end method

.method public setRightResPath(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/ttve/model/FilterBean;->mRightResPath:Ljava/lang/String;

    return-void
.end method
