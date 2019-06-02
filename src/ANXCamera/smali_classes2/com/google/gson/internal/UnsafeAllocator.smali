.class public abstract Lcom/google/gson/internal/UnsafeAllocator;
.super Ljava/lang/Object;
.source "UnsafeAllocator.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create()Lcom/google/gson/internal/UnsafeAllocator;
    .registers 9

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    :try_start_3
    const-string v3, "sun.misc.Unsafe"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "theUnsafe"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v6, "allocateInstance"

    new-array v7, v2, [Ljava/lang/Class;

    const-class v8, Ljava/lang/Class;

    aput-object v8, v7, v1

    invoke-virtual {v3, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    new-instance v7, Lcom/google/gson/internal/UnsafeAllocator$1;

    invoke-direct {v7, v6, v5}, Lcom/google/gson/internal/UnsafeAllocator$1;-><init>(Ljava/lang/reflect/Method;Ljava/lang/Object;)V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_27} :catch_28

    return-object v7

    :catch_28
    move-exception v3

    const/4 v3, 0x2

    :try_start_2a
    const-class v4, Ljava/io/ObjectInputStream;

    const-string v5, "newInstance"

    new-array v6, v3, [Ljava/lang/Class;

    const-class v7, Ljava/lang/Class;

    aput-object v7, v6, v1

    const-class v7, Ljava/lang/Class;

    aput-object v7, v6, v2

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-instance v5, Lcom/google/gson/internal/UnsafeAllocator$2;

    invoke-direct {v5, v4}, Lcom/google/gson/internal/UnsafeAllocator$2;-><init>(Ljava/lang/reflect/Method;)V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_44} :catch_45

    return-object v5

    :catch_45
    move-exception v4

    :try_start_46
    const-class v4, Ljava/io/ObjectStreamClass;

    const-string v5, "getConstructorId"

    new-array v6, v2, [Ljava/lang/Class;

    const-class v7, Ljava/lang/Class;

    aput-object v7, v6, v1

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v5, v2, [Ljava/lang/Object;

    const-class v6, Ljava/lang/Object;

    aput-object v6, v5, v1

    invoke-virtual {v4, v0, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const-class v5, Ljava/io/ObjectStreamClass;

    const-string v6, "newInstance"

    new-array v3, v3, [Ljava/lang/Class;

    const-class v7, Ljava/lang/Class;

    aput-object v7, v3, v1

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v1, v3, v2

    invoke-virtual {v5, v6, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-instance v2, Lcom/google/gson/internal/UnsafeAllocator$3;

    invoke-direct {v2, v1, v0}, Lcom/google/gson/internal/UnsafeAllocator$3;-><init>(Ljava/lang/reflect/Method;I)V
    :try_end_81
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_81} :catch_82

    return-object v2

    :catch_82
    move-exception v0

    new-instance v0, Lcom/google/gson/internal/UnsafeAllocator$4;

    invoke-direct {v0}, Lcom/google/gson/internal/UnsafeAllocator$4;-><init>()V

    return-object v0
.end method


# virtual methods
.method public abstract newInstance(Ljava/lang/Class;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
