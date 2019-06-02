.class public Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawExtTexAttribute.java"


# instance fields
.field public mEffectPopup:Z

.field public mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

.field public mHeight:I

.field public mTextureTransform:[F

.field public mWidth:I

.field public mX:I

.field public mY:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    const/16 v0, 0x8

    iput v0, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTarget:I

    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mX:I

    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mY:I

    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mWidth:I

    iput p6, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mHeight:I

    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    iput-object p2, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTextureTransform:[F

    const/16 p1, 0x8

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTarget:I

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    iput-boolean p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mEffectPopup:Z

    const/16 p1, 0x8

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTarget:I

    return-void
.end method


# virtual methods
.method public init(Lcom/android/gallery3d/ui/ExtTexture;[FIIII)Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;
    .locals 0

    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mX:I

    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mY:I

    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mWidth:I

    iput p6, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mHeight:I

    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mExtTexture:Lcom/android/gallery3d/ui/ExtTexture;

    iput-object p2, p0, Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;->mTextureTransform:[F

    return-object p0
.end method
