.class Landroid/support/v4/text/ICUCompatIcs;
.super Ljava/lang/Object;
.source "ICUCompatIcs.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ICUCompatIcs"

.field private static sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

.field private static sGetScriptMethod:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    :try_start_0
    const-string v0, "libcore.icu.ICU"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_26

    const-string v1, "getScript"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Landroid/support/v4/text/ICUCompatIcs;->sGetScriptMethod:Ljava/lang/reflect/Method;

    const-string v1, "addLikelySubtags"

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Landroid/support/v4/text/ICUCompatIcs;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_26} :catch_27

    :cond_26
    goto :goto_32

    :catch_27
    move-exception v0

    const/4 v1, 0x0

    sput-object v1, Landroid/support/v4/text/ICUCompatIcs;->sGetScriptMethod:Ljava/lang/reflect/Method;

    sput-object v1, Landroid/support/v4/text/ICUCompatIcs;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

    const-string v1, "ICUCompatIcs"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_32
    return-void
.end method

.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addLikelySubtags(Ljava/util/Locale;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    :try_start_4
    sget-object v1, Landroid/support/v4/text/ICUCompatIcs;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_25

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    sget-object v2, Landroid/support/v4/text/ICUCompatIcs;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_17
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_17} :catch_1f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_17} :catch_18

    return-object v2

    :catch_18
    move-exception v1

    const-string v2, "ICUCompatIcs"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_26

    :catch_1f
    move-exception v1

    const-string v2, "ICUCompatIcs"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_25
    nop

    :goto_26
    return-object v0
.end method

.method private static getScript(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const/4 v0, 0x0

    :try_start_1
    sget-object v1, Landroid/support/v4/text/ICUCompatIcs;->sGetScriptMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_21

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    sget-object v2, Landroid/support/v4/text/ICUCompatIcs;->sGetScriptMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v2, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_13
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_13} :catch_1b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_13} :catch_14

    return-object v2

    :catch_14
    move-exception v1

    const-string v2, "ICUCompatIcs"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_22

    :catch_1b
    move-exception v1

    const-string v2, "ICUCompatIcs"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_21
    nop

    :goto_22
    return-object v0
.end method

.method public static maximizeAndGetScript(Ljava/util/Locale;)Ljava/lang/String;
    .registers 3

    invoke-static {p0}, Landroid/support/v4/text/ICUCompatIcs;->addLikelySubtags(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-static {v0}, Landroid/support/v4/text/ICUCompatIcs;->getScript(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_b
    const/4 v1, 0x0

    return-object v1
.end method
