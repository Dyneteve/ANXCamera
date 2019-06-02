.class public Lcom/ss/android/ttve/common/TEEncodeParams;
.super Ljava/lang/Object;
.source "TEEncodeParams.java"


# static fields
.field public static final ENCODE_LEVEL_FAST:I = 0x4

.field public static final ENCODE_LEVEL_FASTER:I = 0x3

.field public static final ENCODE_LEVEL_MEDIUM:I = 0x5

.field public static final ENCODE_LEVEL_PLACEBO:I = 0x9

.field public static final ENCODE_LEVEL_SLOW:I = 0x6

.field public static final ENCODE_LEVEL_SLOWER:I = 0x7

.field public static final ENCODE_LEVEL_SUPERFAST:I = 0x1

.field public static final ENCODE_LEVEL_ULTRAFAST:I = 0x0

.field public static final ENCODE_LEVEL_VERYFAST:I = 0x2

.field public static final ENCODE_LEVEL_VERYSLOW:I = 0x8

.field public static final MUSIC_LOOP_ALWAYS:I = 0x1

.field public static final MUSIC_LOOP_ONLY_ONCE:I


# instance fields
.field public audioBitrate:I

.field public encodeLevel:I

.field public fps:I

.field public gopSize:I

.field public hasBFrame:Z

.field public musicLoopType:I

.field public outputSize:Lcom/ss/android/ttve/common/TESizei;

.field public speed:F

.field public strAudioFilePath:Ljava/lang/String;

.field public strVideoFilePath:Ljava/lang/String;

.field public useHWEncoder:Z

.field public videoBitrate:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/ss/android/ttve/common/TESizei;FZIII)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->musicLoopType:I

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->videoBitrate:I

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->audioBitrate:I

    const/16 v1, 0x1e

    iput v1, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->fps:I

    iput v1, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->gopSize:I

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->encodeLevel:I

    iput-boolean v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->hasBFrame:Z

    iput-object p1, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->strVideoFilePath:Ljava/lang/String;

    iput-object p2, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->outputSize:Lcom/ss/android/ttve/common/TESizei;

    iput p3, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->speed:F

    iput-boolean p4, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->useHWEncoder:Z

    iput p5, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->musicLoopType:I

    iput p6, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->fps:I

    iput p7, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->gopSize:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/ss/android/ttve/common/TESizei;FZIIIIIIZ)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->musicLoopType:I

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->videoBitrate:I

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->audioBitrate:I

    const/16 v1, 0x1e

    iput v1, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->fps:I

    iput v1, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->gopSize:I

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->encodeLevel:I

    iput-boolean v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->hasBFrame:Z

    iput-object p1, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->strVideoFilePath:Ljava/lang/String;

    iput-object p2, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->outputSize:Lcom/ss/android/ttve/common/TESizei;

    iput p3, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->speed:F

    iput-boolean p4, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->useHWEncoder:Z

    iput p5, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->musicLoopType:I

    iput p6, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->fps:I

    iput p7, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->gopSize:I

    iput p8, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->videoBitrate:I

    iput p9, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->audioBitrate:I

    iput p10, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->encodeLevel:I

    iput-boolean p11, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->hasBFrame:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/ttve/common/TESizei;FZ)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->musicLoopType:I

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->videoBitrate:I

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->audioBitrate:I

    const/16 v1, 0x1e

    iput v1, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->fps:I

    iput v1, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->gopSize:I

    iput v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->encodeLevel:I

    iput-boolean v0, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->hasBFrame:Z

    iput-object p1, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->strVideoFilePath:Ljava/lang/String;

    iput-object p2, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->strAudioFilePath:Ljava/lang/String;

    iput-object p3, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->outputSize:Lcom/ss/android/ttve/common/TESizei;

    iput p4, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->speed:F

    iput-boolean p5, p0, Lcom/ss/android/ttve/common/TEEncodeParams;->useHWEncoder:Z

    return-void
.end method
