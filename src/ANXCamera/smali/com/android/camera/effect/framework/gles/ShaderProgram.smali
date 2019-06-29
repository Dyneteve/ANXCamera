.class public Lcom/android/camera/effect/framework/gles/ShaderProgram;
.super Ljava/lang/Object;
.source "ShaderProgram.java"

# interfaces
.implements Lcom/android/camera/effect/framework/gles/IShaderProgram;


# static fields
.field private static INVALID_VALUE:I


# instance fields
.field private attributes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private programHandle:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, -0x1

    sput v0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->INVALID_VALUE:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget v0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->INVALID_VALUE:I

    iput v0, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->programHandle:I

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->attributes:Ljava/util/HashMap;

    return-void
.end method

.method private loadShader(ILjava/lang/String;)I
    .locals 2

    invoke-static {p1}, Landroid/opengl/GLES20;->glCreateShader(I)I

    move-result p1

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    invoke-static {p1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    const/4 p2, 0x1

    new-array p2, p2, [I

    const/4 v0, 0x0

    const v1, 0x8b81

    invoke-static {p1, v1, p2, v0}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    aget p2, p2, v0

    if-eqz p2, :cond_0

    return p1

    :cond_0
    invoke-static {p1}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Shader compilation failed with: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public create(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    sget v0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->INVALID_VALUE:I

    if-eqz p1, :cond_0

    const v0, 0x8b31

    invoke-direct {p0, v0, p1}, Lcom/android/camera/effect/framework/gles/ShaderProgram;->loadShader(ILjava/lang/String;)I

    move-result v0

    :cond_0
    const/4 p1, 0x0

    if-nez v0, :cond_1

    iput p1, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->programHandle:I

    return-void

    :cond_1
    sget v1, Lcom/android/camera/effect/framework/gles/ShaderProgram;->INVALID_VALUE:I

    if-eqz p2, :cond_2

    const v1, 0x8b30

    invoke-direct {p0, v1, p2}, Lcom/android/camera/effect/framework/gles/ShaderProgram;->loadShader(ILjava/lang/String;)I

    move-result v1

    :cond_2
    if-nez v1, :cond_3

    iput p1, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->programHandle:I

    return-void

    :cond_3
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    move-result p1

    iput p1, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->programHandle:I

    iget p1, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->programHandle:I

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glAttachShader(II)V

    iget p1, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->programHandle:I

    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    iget p1, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->programHandle:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    return-void
.end method

.method public getAttributeLocation(Ljava/lang/String;)I
    .locals 3

    iget-object v0, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->attributes:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->attributes:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_0
    iget v0, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->programHandle:I

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->programHandle:I

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    :cond_1
    if-eq v0, v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->attributes:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can\'t find a location for attribute "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getProgramHandle()I
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->programHandle:I

    return v0
.end method

.method public unUse()V
    .locals 1

    const/4 v0, 0x0

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    return-void
.end method

.method public use()V
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/framework/gles/ShaderProgram;->programHandle:I

    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    return-void
.end method
