.class public Lcom/ss/android/ttve/common/TEProgramObject;
.super Ljava/lang/Object;
.source "TEProgramObject.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "TEProgramObject"


# instance fields
.field private mFragmentShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

.field private mProgramID:I

.field private mVertexShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result v0

    iput v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lcom/ss/android/ttve/common/TEProgramObject;
    .locals 1

    new-instance v0, Lcom/ss/android/ttve/common/TEProgramObject;

    invoke-direct {v0}, Lcom/ss/android/ttve/common/TEProgramObject;-><init>()V

    invoke-virtual {v0, p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->init(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEProgramObject;->release()V

    const/4 v0, 0x0

    :cond_0
    return-object v0
.end method


# virtual methods
.method public attributeLocation(Ljava/lang/String;)I
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public bind()V
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    return-void
.end method

.method public bindAttribLocation(Ljava/lang/String;I)V
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    invoke-static {v0, p2, p1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    return-void
.end method

.method public getProgramID()I
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    return v0
.end method

.method public getUniformLoc(Ljava/lang/String;)I
    .locals 5

    iget v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    if-gez v0, :cond_0

    const-string v1, "TEProgramObject"

    const-string v2, "uniform name %s does not exist"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return v0
.end method

.method public init(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    invoke-virtual {p0, p1, p2, v0}, Lcom/ss/android/ttve/common/TEProgramObject;->init(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result p1

    return p1
.end method

.method public init(Ljava/lang/String;Ljava/lang/String;I)Z
    .locals 2

    if-nez p3, :cond_0

    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result p3

    :cond_0
    if-nez p3, :cond_1

    const-string v0, "TEProgramObject"

    const-string v1, "Invalid Program ID! Check if the context is binded!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mVertexShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mVertexShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->release()V

    :cond_2
    iget-object v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mFragmentShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mFragmentShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    invoke-virtual {v0}, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->release()V

    :cond_3
    new-instance v0, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    const v1, 0x8b31

    invoke-direct {v0, p1, v1}, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mVertexShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    new-instance p1, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    const v0, 0x8b30

    invoke-direct {p1, p2, v0}, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mFragmentShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    iget-object p1, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mVertexShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->getShaderID()I

    move-result p1

    invoke-static {p3, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    iget-object p1, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mFragmentShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    invoke-virtual {p1}, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->getShaderID()I

    move-result p1

    invoke-static {p3, p1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    const-string p1, "AttachShaders..."

    invoke-static {p1}, Lcom/ss/android/ttve/common/TECommon;->checkGLError(Ljava/lang/String;)V

    invoke-static {p3}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    const/4 p1, 0x1

    new-array p2, p1, [I

    const/4 v0, 0x0

    aput v0, p2, v0

    const v1, 0x8b82

    invoke-static {p3, v1, p2, v0}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    iget-object v1, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mVertexShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    invoke-virtual {v1}, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->release()V

    iget-object v1, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mFragmentShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    invoke-virtual {v1}, Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;->release()V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mVertexShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    iput-object v1, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mFragmentShader:Lcom/ss/android/ttve/common/TEProgramObject$ShaderObject;

    aget p2, p2, v0

    if-eq p2, p1, :cond_4

    invoke-static {p3}, Landroid/opengl/GLES20;->glGetProgramInfoLog(I)Ljava/lang/String;

    move-result-object p1

    const-string p2, "TEProgramObject"

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_4
    iget p2, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    if-eq p2, p3, :cond_5

    iget p2, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    if-eqz p2, :cond_5

    iget p2, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    invoke-static {p2}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    :cond_5
    iput p3, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    return p1
.end method

.method public final release()V
    .locals 1

    iget v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ttve/common/TEProgramObject;->mProgramID:I

    :cond_0
    return-void
.end method

.method public sendUniformMat2(Ljava/lang/String;IZ[F)V
    .locals 1

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {p1, p2, p3, p4, v0}, Landroid/opengl/GLES20;->glUniformMatrix2fv(IIZ[FI)V

    return-void
.end method

.method public sendUniformMat3(Ljava/lang/String;IZ[F)V
    .locals 1

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {p1, p2, p3, p4, v0}, Landroid/opengl/GLES20;->glUniformMatrix3fv(IIZ[FI)V

    return-void
.end method

.method public sendUniformMat4(Ljava/lang/String;IZ[F)V
    .locals 1

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x0

    invoke-static {p1, p2, p3, p4, v0}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    return-void
.end method

.method public sendUniformf(Ljava/lang/String;F)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    return-void
.end method

.method public sendUniformf(Ljava/lang/String;FF)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    return-void
.end method

.method public sendUniformf(Ljava/lang/String;FFF)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3, p4}, Landroid/opengl/GLES20;->glUniform3f(IFFF)V

    return-void
.end method

.method public sendUniformf(Ljava/lang/String;FFFF)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3, p4, p5}, Landroid/opengl/GLES20;->glUniform4f(IFFFF)V

    return-void
.end method

.method public sendUniformi(Ljava/lang/String;I)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    return-void
.end method

.method public sendUniformi(Ljava/lang/String;II)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3}, Landroid/opengl/GLES20;->glUniform2i(III)V

    return-void
.end method

.method public sendUniformi(Ljava/lang/String;III)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3, p4}, Landroid/opengl/GLES20;->glUniform3i(IIII)V

    return-void
.end method

.method public sendUniformi(Ljava/lang/String;IIII)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/ss/android/ttve/common/TEProgramObject;->getUniformLoc(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1, p2, p3, p4, p5}, Landroid/opengl/GLES20;->glUniform4i(IIIII)V

    return-void
.end method
