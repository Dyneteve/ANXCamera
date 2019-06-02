.class public Lcom/android/gallery3d/ui/GLPaint;
.super Ljava/lang/Object;
.source "GLPaint.java"


# instance fields
.field private mColor:I

.field private mLineWidth:F


# direct methods
.method public constructor <init>(FI)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/gallery3d/ui/GLPaint;->mLineWidth:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/gallery3d/ui/GLPaint;->mColor:I

    iput p1, p0, Lcom/android/gallery3d/ui/GLPaint;->mLineWidth:F

    iput p2, p0, Lcom/android/gallery3d/ui/GLPaint;->mColor:I

    return-void
.end method


# virtual methods
.method public getColor()I
    .locals 1

    iget v0, p0, Lcom/android/gallery3d/ui/GLPaint;->mColor:I

    return v0
.end method

.method public getLineWidth()F
    .locals 1

    iget v0, p0, Lcom/android/gallery3d/ui/GLPaint;->mLineWidth:F

    return v0
.end method

.method public setColor(I)V
    .locals 0

    iput p1, p0, Lcom/android/gallery3d/ui/GLPaint;->mColor:I

    return-void
.end method

.method public setLineWidth(F)V
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/android/gallery3d/ui/Utils;->assertTrue(Z)V

    iput p1, p0, Lcom/android/gallery3d/ui/GLPaint;->mLineWidth:F

    return-void
.end method
