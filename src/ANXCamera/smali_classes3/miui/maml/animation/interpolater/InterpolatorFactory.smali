.class public Lmiui/maml/animation/interpolater/InterpolatorFactory;
.super Ljava/lang/Object;
.source "InterpolatorFactory.java"


# static fields
.field public static final LOG_TAG:Ljava/lang/String; = "InterpolatorFactory"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;)Landroid/view/animation/Interpolator;
    .registers 16
    .param p0, "easeType"    # Ljava/lang/String;

    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    .line 13
    return-object v1

    .line 16
    :cond_8
    const/16 v0, 0x28

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 17
    .local v0, "leftBracket":I
    const/16 v2, 0x29

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 18
    .local v2, "rightBracket":I
    const/4 v3, 0x0

    .line 19
    .local v3, "firstParam":F
    const/4 v4, 0x0

    .line 20
    .local v4, "secondParam":F
    const/4 v5, 0x0

    .line 21
    .local v5, "hasFirstParam":Z
    const/4 v6, 0x0

    .line 22
    .local v6, "hasSecondParam":Z
    const/4 v7, -0x1

    if-eq v0, v7, :cond_5f

    if-eq v2, v7, :cond_5f

    .line 23
    const/4 v5, 0x1

    .line 24
    add-int/lit8 v8, v0, 0x1

    invoke-virtual {p0, v8, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 26
    .local v8, "params":Ljava/lang/String;
    move-object v9, v8

    .line 27
    .local v9, "firstParamStr":Ljava/lang/String;
    const-string v10, ""

    .line 28
    .local v10, "secondParamStr":Ljava/lang/String;
    const-string v11, ","

    invoke-virtual {v8, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v11

    .line 29
    .local v11, "comma":I
    if-eq v11, v7, :cond_3b

    .line 30
    const/4 v6, 0x1

    .line 31
    const/4 v7, 0x0

    invoke-virtual {v8, v7, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 32
    add-int/lit8 v7, v11, 0x1

    invoke-virtual {v8, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    .line 35
    :cond_3b
    :try_start_3b
    invoke-static {v9}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7

    move v3, v7

    .line 36
    if-eqz v6, :cond_47

    .line 37
    invoke-static {v10}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7
    :try_end_46
    .catch Ljava/lang/NumberFormatException; {:try_start_3b .. :try_end_46} :catch_48

    move v4, v7

    .line 41
    :cond_47
    goto :goto_5f

    .line 39
    :catch_48
    move-exception v7

    .line 40
    .local v7, "e":Ljava/lang/NumberFormatException;
    const-string v12, "InterpolatorFactory"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "parse error:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .end local v7    # "e":Ljava/lang/NumberFormatException;
    .end local v8    # "params":Ljava/lang/String;
    .end local v9    # "firstParamStr":Ljava/lang/String;
    .end local v10    # "secondParamStr":Ljava/lang/String;
    .end local v11    # "comma":I
    :cond_5f
    :goto_5f
    const-string v7, "BackEaseIn"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6d

    .line 45
    new-instance v1, Lmiui/maml/animation/interpolater/BackEaseInInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/BackEaseInInterpolater;-><init>()V

    return-object v1

    .line 46
    :cond_6d
    const-string v7, "BackEaseOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7b

    .line 47
    new-instance v1, Lmiui/maml/animation/interpolater/BackEaseOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/BackEaseOutInterpolater;-><init>()V

    return-object v1

    .line 48
    :cond_7b
    const-string v7, "BackEaseInOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_89

    .line 49
    new-instance v1, Lmiui/maml/animation/interpolater/BackEaseInOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/BackEaseInOutInterpolater;-><init>()V

    return-object v1

    .line 50
    :cond_89
    const-string v7, "BackEaseIn"

    invoke-virtual {p0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_99

    if-eqz v5, :cond_99

    .line 51
    new-instance v1, Lmiui/maml/animation/interpolater/BackEaseInInterpolater;

    invoke-direct {v1, v3}, Lmiui/maml/animation/interpolater/BackEaseInInterpolater;-><init>(F)V

    return-object v1

    .line 52
    :cond_99
    const-string v7, "BackEaseOut"

    invoke-virtual {p0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a9

    if-eqz v5, :cond_a9

    .line 53
    new-instance v1, Lmiui/maml/animation/interpolater/BackEaseOutInterpolater;

    invoke-direct {v1, v3}, Lmiui/maml/animation/interpolater/BackEaseOutInterpolater;-><init>(F)V

    return-object v1

    .line 54
    :cond_a9
    const-string v7, "BackEaseInOut"

    invoke-virtual {p0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b9

    if-eqz v5, :cond_b9

    .line 55
    new-instance v1, Lmiui/maml/animation/interpolater/BackEaseInOutInterpolater;

    invoke-direct {v1, v3}, Lmiui/maml/animation/interpolater/BackEaseInOutInterpolater;-><init>(F)V

    return-object v1

    .line 56
    :cond_b9
    const-string v7, "BounceEaseIn"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_c7

    .line 57
    new-instance v1, Lmiui/maml/animation/interpolater/BounceEaseInInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/BounceEaseInInterpolater;-><init>()V

    return-object v1

    .line 58
    :cond_c7
    const-string v7, "BounceEaseOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_d5

    .line 59
    new-instance v1, Lmiui/maml/animation/interpolater/BounceEaseOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/BounceEaseOutInterpolater;-><init>()V

    return-object v1

    .line 60
    :cond_d5
    const-string v7, "BounceEaseInOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_e3

    .line 61
    new-instance v1, Lmiui/maml/animation/interpolater/BounceEaseInOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/BounceEaseInOutInterpolater;-><init>()V

    return-object v1

    .line 62
    :cond_e3
    const-string v7, "CircEaseIn"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_f1

    .line 63
    new-instance v1, Lmiui/maml/animation/interpolater/CircEaseInInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/CircEaseInInterpolater;-><init>()V

    return-object v1

    .line 64
    :cond_f1
    const-string v7, "CircEaseOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_ff

    .line 65
    new-instance v1, Lmiui/maml/animation/interpolater/CircEaseOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/CircEaseOutInterpolater;-><init>()V

    return-object v1

    .line 66
    :cond_ff
    const-string v7, "CircEaseInOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_10d

    .line 67
    new-instance v1, Lmiui/maml/animation/interpolater/CircEaseInOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/CircEaseInOutInterpolater;-><init>()V

    return-object v1

    .line 68
    :cond_10d
    const-string v7, "CubicEaseIn"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_11b

    .line 69
    new-instance v1, Lmiui/maml/animation/interpolater/CubicEaseInInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/CubicEaseInInterpolater;-><init>()V

    return-object v1

    .line 70
    :cond_11b
    const-string v7, "CubicEaseOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_129

    .line 71
    new-instance v1, Lmiui/maml/animation/interpolater/CubicEaseOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/CubicEaseOutInterpolater;-><init>()V

    return-object v1

    .line 72
    :cond_129
    const-string v7, "CubicEaseInOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_137

    .line 73
    new-instance v1, Lmiui/maml/animation/interpolater/CubicEaseInOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/CubicEaseInOutInterpolater;-><init>()V

    return-object v1

    .line 74
    :cond_137
    const-string v7, "ElasticEaseIn"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_145

    .line 75
    new-instance v1, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;-><init>()V

    return-object v1

    .line 76
    :cond_145
    const-string v7, "ElasticEaseOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_153

    .line 77
    new-instance v1, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;-><init>()V

    return-object v1

    .line 78
    :cond_153
    const-string v7, "ElasticEaseInOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_161

    .line 79
    new-instance v1, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;-><init>()V

    return-object v1

    .line 80
    :cond_161
    const-string v7, "ElasticEaseIn"

    invoke-virtual {p0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_171

    if-eqz v6, :cond_171

    .line 81
    new-instance v1, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;

    invoke-direct {v1, v3, v4}, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;-><init>(FF)V

    return-object v1

    .line 82
    :cond_171
    const-string v7, "ElasticEaseOut"

    invoke-virtual {p0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_181

    if-eqz v6, :cond_181

    .line 83
    new-instance v1, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;

    invoke-direct {v1, v3, v4}, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;-><init>(FF)V

    return-object v1

    .line 84
    :cond_181
    const-string v7, "ElasticEaseInOut"

    invoke-virtual {p0, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_191

    if-eqz v6, :cond_191

    .line 85
    new-instance v1, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;

    invoke-direct {v1, v3, v4}, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;-><init>(FF)V

    return-object v1

    .line 86
    :cond_191
    const-string v7, "ExpoEaseIn"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_19f

    .line 87
    new-instance v1, Lmiui/maml/animation/interpolater/ExpoEaseInInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/ExpoEaseInInterpolater;-><init>()V

    return-object v1

    .line 88
    :cond_19f
    const-string v7, "ExpoEaseOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1ad

    .line 89
    new-instance v1, Lmiui/maml/animation/interpolater/ExpoEaseOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/ExpoEaseOutInterpolater;-><init>()V

    return-object v1

    .line 90
    :cond_1ad
    const-string v7, "ExpoEaseInOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1bb

    .line 91
    new-instance v1, Lmiui/maml/animation/interpolater/ExpoEaseInOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/ExpoEaseInOutInterpolater;-><init>()V

    return-object v1

    .line 92
    :cond_1bb
    const-string v7, "QuadEaseIn"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1c9

    .line 93
    new-instance v1, Lmiui/maml/animation/interpolater/QuadEaseInInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/QuadEaseInInterpolater;-><init>()V

    return-object v1

    .line 94
    :cond_1c9
    const-string v7, "QuadEaseOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1d7

    .line 95
    new-instance v1, Lmiui/maml/animation/interpolater/QuadEaseOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/QuadEaseOutInterpolater;-><init>()V

    return-object v1

    .line 96
    :cond_1d7
    const-string v7, "QuadEaseInOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1e5

    .line 97
    new-instance v1, Lmiui/maml/animation/interpolater/QuadEaseInOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/QuadEaseInOutInterpolater;-><init>()V

    return-object v1

    .line 98
    :cond_1e5
    const-string v7, "QuartEaseIn"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1f3

    .line 99
    new-instance v1, Lmiui/maml/animation/interpolater/QuartEaseInInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/QuartEaseInInterpolater;-><init>()V

    return-object v1

    .line 100
    :cond_1f3
    const-string v7, "QuartEaseOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_201

    .line 101
    new-instance v1, Lmiui/maml/animation/interpolater/QuartEaseOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/QuartEaseOutInterpolater;-><init>()V

    return-object v1

    .line 102
    :cond_201
    const-string v7, "QuartEaseInOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_20f

    .line 103
    new-instance v1, Lmiui/maml/animation/interpolater/QuartEaseInOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/QuartEaseInOutInterpolater;-><init>()V

    return-object v1

    .line 104
    :cond_20f
    const-string v7, "QuintEaseIn"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_21d

    .line 105
    new-instance v1, Lmiui/maml/animation/interpolater/QuintEaseInInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/QuintEaseInInterpolater;-><init>()V

    return-object v1

    .line 106
    :cond_21d
    const-string v7, "QuintEaseOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_22b

    .line 107
    new-instance v1, Lmiui/maml/animation/interpolater/QuintEaseOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/QuintEaseOutInterpolater;-><init>()V

    return-object v1

    .line 108
    :cond_22b
    const-string v7, "QuintEaseInOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_239

    .line 109
    new-instance v1, Lmiui/maml/animation/interpolater/QuintEaseInOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/QuintEaseInOutInterpolater;-><init>()V

    return-object v1

    .line 110
    :cond_239
    const-string v7, "SineEaseIn"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_247

    .line 111
    new-instance v1, Lmiui/maml/animation/interpolater/SineEaseInInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/SineEaseInInterpolater;-><init>()V

    return-object v1

    .line 112
    :cond_247
    const-string v7, "SineEaseOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_255

    .line 113
    new-instance v1, Lmiui/maml/animation/interpolater/SineEaseOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/SineEaseOutInterpolater;-><init>()V

    return-object v1

    .line 114
    :cond_255
    const-string v7, "SineEaseInOut"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_263

    .line 115
    new-instance v1, Lmiui/maml/animation/interpolater/SineEaseInOutInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/SineEaseInOutInterpolater;-><init>()V

    return-object v1

    .line 116
    :cond_263
    const-string v7, "Linear"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_271

    .line 117
    new-instance v1, Lmiui/maml/animation/interpolater/LinearInterpolater;

    invoke-direct {v1}, Lmiui/maml/animation/interpolater/LinearInterpolater;-><init>()V

    return-object v1

    .line 119
    :cond_271
    return-object v1
.end method
