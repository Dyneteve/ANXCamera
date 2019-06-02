.class Lcom/android/camera/effect/renders/FocusPeakingSecondPassRender;
.super Lcom/android/camera/effect/renders/ConvolutionEffectRender;
.source "FocusPeakingRender.java"


# static fields
.field private static final FRAG:Ljava/lang/String; = "precision mediump float; \nuniform vec2 uStep; \nuniform vec3 uPeakColor; \nuniform sampler2D sTexture; \nvarying vec2 vTexCoord; \nvec3 neighbor_color() { \n    vec3 sum = vec3(0.0, 0.0, 0.0); \n    vec2 step = uStep; \n    //sum += texture2D(sTexture, vTexCoord -                  step).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(0.0,    -step.y)).rgb; \n    //sum += texture2D(sTexture, vTexCoord + vec2(step.x, -step.y)).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(step.x,     0.0)).rgb; \n    sum += texture2D(sTexture, vTexCoord                        ).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(-step.x,    0.0)).rgb; \n    //sum += texture2D(sTexture, vTexCoord + vec2(-step.x, step.y)).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(0.0,     step.y)).rgb; \n    //sum += texture2D(sTexture, vTexCoord +                  step).rgb; \n    return sum; \n} \nvoid main() { \n    vec3 sum = neighbor_color(); \n    if (any(greaterThan(sum, vec3(0.0, 0.0, 0.0)))) { \n        gl_FragColor.rgb = uPeakColor; \n        gl_FragColor.a = 1.0; \n    } else { \n        gl_FragColor.rgb = vec3(0.0, 0.0, 0.0); \n        gl_FragColor.a = 0.0; \n    } \n}"


# instance fields
.field private mPeakColor:I

.field private mUniformPeakColorH:I


# direct methods
.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/effect/renders/ConvolutionEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;)V

    const/high16 p1, -0x10000

    iput p1, p0, Lcom/android/camera/effect/renders/FocusPeakingSecondPassRender;->mPeakColor:I

    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/GLCanvas;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/effect/renders/ConvolutionEffectRender;-><init>(Lcom/android/gallery3d/ui/GLCanvas;I)V

    const/high16 p1, -0x10000

    iput p1, p0, Lcom/android/camera/effect/renders/FocusPeakingSecondPassRender;->mPeakColor:I

    return-void
.end method


# virtual methods
.method public getFragShaderString()Ljava/lang/String;
    .locals 1

    const-string v0, "precision mediump float; \nuniform vec2 uStep; \nuniform vec3 uPeakColor; \nuniform sampler2D sTexture; \nvarying vec2 vTexCoord; \nvec3 neighbor_color() { \n    vec3 sum = vec3(0.0, 0.0, 0.0); \n    vec2 step = uStep; \n    //sum += texture2D(sTexture, vTexCoord -                  step).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(0.0,    -step.y)).rgb; \n    //sum += texture2D(sTexture, vTexCoord + vec2(step.x, -step.y)).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(step.x,     0.0)).rgb; \n    sum += texture2D(sTexture, vTexCoord                        ).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(-step.x,    0.0)).rgb; \n    //sum += texture2D(sTexture, vTexCoord + vec2(-step.x, step.y)).rgb; \n    sum += texture2D(sTexture, vTexCoord + vec2(0.0,     step.y)).rgb; \n    //sum += texture2D(sTexture, vTexCoord +                  step).rgb; \n    return sum; \n} \nvoid main() { \n    vec3 sum = neighbor_color(); \n    if (any(greaterThan(sum, vec3(0.0, 0.0, 0.0)))) { \n        gl_FragColor.rgb = uPeakColor; \n        gl_FragColor.a = 1.0; \n    } else { \n        gl_FragColor.rgb = vec3(0.0, 0.0, 0.0); \n        gl_FragColor.a = 0.0; \n    } \n}"

    return-object v0
.end method

.method protected initShader()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->initShader()V

    iget v0, p0, Lcom/android/camera/effect/renders/FocusPeakingSecondPassRender;->mProgram:I

    const-string v1, "uPeakColor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/renders/FocusPeakingSecondPassRender;->mUniformPeakColorH:I

    return-void
.end method

.method protected initShaderValue(Z)V
    .locals 3

    invoke-super {p0, p1}, Lcom/android/camera/effect/renders/ConvolutionEffectRender;->initShaderValue(Z)V

    iget p1, p0, Lcom/android/camera/effect/renders/FocusPeakingSecondPassRender;->mUniformPeakColorH:I

    iget v0, p0, Lcom/android/camera/effect/renders/FocusPeakingSecondPassRender;->mPeakColor:I

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/effect/renders/FocusPeakingSecondPassRender;->mPeakColor:I

    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/android/camera/effect/renders/FocusPeakingSecondPassRender;->mPeakColor:I

    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    int-to-float v2, v2

    invoke-static {p1, v0, v1, v2}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    return-void
.end method

.method protected setBlendEnabled(Z)V
    .locals 0

    const/16 p1, 0xbe2

    invoke-static {p1}, Landroid/opengl/GLES20;->glEnable(I)V

    return-void
.end method

.method public setPeakColor(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/effect/renders/FocusPeakingSecondPassRender;->mPeakColor:I

    return-void
.end method
