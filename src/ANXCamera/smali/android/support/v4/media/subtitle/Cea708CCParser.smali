.class Landroid/support/v4/media/subtitle/Cea708CCParser;
.super Ljava/lang/Object;
.source "Cea708CCParser.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x1c
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;,
        Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindowAttr;,
        Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenLocation;,
        Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;,
        Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;,
        Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;,
        Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;,
        Landroid/support/v4/media/subtitle/Cea708CCParser$Const;,
        Landroid/support/v4/media/subtitle/Cea708CCParser$DisplayListener;
    }
.end annotation


# static fields
.field public static final CAPTION_EMIT_TYPE_BUFFER:I = 0x1

.field public static final CAPTION_EMIT_TYPE_COMMAND_CLW:I = 0x4

.field public static final CAPTION_EMIT_TYPE_COMMAND_CWX:I = 0x3

.field public static final CAPTION_EMIT_TYPE_COMMAND_DFX:I = 0x10

.field public static final CAPTION_EMIT_TYPE_COMMAND_DLC:I = 0xa

.field public static final CAPTION_EMIT_TYPE_COMMAND_DLW:I = 0x8

.field public static final CAPTION_EMIT_TYPE_COMMAND_DLY:I = 0x9

.field public static final CAPTION_EMIT_TYPE_COMMAND_DSW:I = 0x5

.field public static final CAPTION_EMIT_TYPE_COMMAND_HDW:I = 0x6

.field public static final CAPTION_EMIT_TYPE_COMMAND_RST:I = 0xb

.field public static final CAPTION_EMIT_TYPE_COMMAND_SPA:I = 0xc

.field public static final CAPTION_EMIT_TYPE_COMMAND_SPC:I = 0xd

.field public static final CAPTION_EMIT_TYPE_COMMAND_SPL:I = 0xe

.field public static final CAPTION_EMIT_TYPE_COMMAND_SWA:I = 0xf

.field public static final CAPTION_EMIT_TYPE_COMMAND_TGW:I = 0x7

.field public static final CAPTION_EMIT_TYPE_CONTROL:I = 0x2

.field private static final DEBUG:Z = false

.field private static final MUSIC_NOTE_CHAR:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "Cea708CCParser"


# instance fields
.field private final mBuilder:Ljava/lang/StringBuilder;

.field private mCommand:I

.field private mListener:Landroid/support/v4/media/subtitle/Cea708CCParser$DisplayListener;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/lang/String;

    const-string/jumbo v1, "\u266b"

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    sput-object v0, Landroid/support/v4/media/subtitle/Cea708CCParser;->MUSIC_NOTE_CHAR:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CCParser$DisplayListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mBuilder:Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    new-instance v0, Landroid/support/v4/media/subtitle/Cea708CCParser$1;

    invoke-direct {v0, p0}, Landroid/support/v4/media/subtitle/Cea708CCParser$1;-><init>(Landroid/support/v4/media/subtitle/Cea708CCParser;)V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mListener:Landroid/support/v4/media/subtitle/Cea708CCParser$DisplayListener;

    if-eqz p1, :cond_0

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mListener:Landroid/support/v4/media/subtitle/Cea708CCParser$DisplayListener;

    :cond_0
    return-void
.end method

.method private emitCaptionBuffer()V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mListener:Landroid/support/v4/media/subtitle/Cea708CCParser$DisplayListener;

    new-instance v1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    const/4 v2, 0x1

    iget-object v3, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-interface {v0, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser$DisplayListener;->emitEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mBuilder:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    :cond_0
    return-void
.end method

.method private emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionBuffer()V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mListener:Landroid/support/v4/media/subtitle/Cea708CCParser$DisplayListener;

    invoke-interface {v0, p1}, Landroid/support/v4/media/subtitle/Cea708CCParser$DisplayListener;->emitEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    return-void
.end method

.method private parseC0([BI)I
    .locals 3

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_2

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x1f

    if-gt v0, v2, :cond_2

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    if-ne v0, v1, :cond_1

    :try_start_0
    aget-byte v0, p1, p2

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mBuilder:Ljava/lang/StringBuilder;

    add-int/lit8 v1, p2, 0x1

    aget-byte p1, p1, v1

    int-to-char p1, p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/String;

    add-int/lit8 v1, p2, 0x2

    invoke-static {p1, p2, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    const-string v1, "EUC-KR"

    invoke-direct {v0, p1, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    goto :goto_1

    :catch_0
    move-exception p1

    const-string v0, "Cea708CCParser"

    const-string v1, "P16 Code - Could not find supported encoding"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_1
    add-int/lit8 p2, p2, 0x2

    goto :goto_2

    :cond_2
    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x10

    if-lt p1, v0, :cond_3

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x17

    if-gt p1, v0, :cond_3

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_3
    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    if-eqz p1, :cond_6

    const/4 v0, 0x3

    const/4 v1, 0x2

    if-eq p1, v0, :cond_5

    const/16 v0, 0x8

    if-eq p1, v0, :cond_4

    packed-switch p1, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    new-instance p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    invoke-direct {p1, v1, v0}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_2

    :pswitch_1
    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mBuilder:Ljava/lang/StringBuilder;

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    :pswitch_2
    new-instance p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    invoke-direct {p1, v1, v0}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_2

    :cond_4
    new-instance p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    invoke-direct {p1, v1, v0}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_2

    :cond_5
    new-instance p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    int-to-char v0, v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    invoke-direct {p1, v1, v0}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_2

    :cond_6
    nop

    :goto_2
    return p2

    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private parseC1([BI)I
    .locals 27

    move-object/from16 v0, p0

    iget v3, v0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/4 v4, 0x5

    const/16 v5, 0xf

    const/4 v6, 0x7

    const/4 v7, 0x6

    const/16 v8, 0xc

    const/4 v9, 0x0

    const/4 v10, 0x4

    const/4 v11, 0x3

    const/4 v12, 0x1

    packed-switch v3, :pswitch_data_0

    packed-switch v3, :pswitch_data_1

    goto/16 :goto_8

    :pswitch_0
    iget v3, v0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    add-int/lit16 v14, v3, -0x98

    aget-byte v3, p1, p2

    and-int/lit8 v3, v3, 0x20

    if-eqz v3, :cond_0

    move v15, v12

    goto :goto_0

    :cond_0
    nop

    move v15, v9

    :goto_0
    aget-byte v3, p1, p2

    and-int/lit8 v3, v3, 0x10

    if-eqz v3, :cond_1

    move/from16 v16, v12

    goto :goto_1

    :cond_1
    nop

    move/from16 v16, v9

    :goto_1
    aget-byte v3, p1, p2

    and-int/lit8 v3, v3, 0x8

    if-eqz v3, :cond_2

    move/from16 v17, v12

    goto :goto_2

    :cond_2
    nop

    move/from16 v17, v9

    :goto_2
    aget-byte v3, p1, p2

    and-int/lit8 v18, v3, 0x7

    add-int/lit8 v3, p2, 0x1

    aget-byte v4, p1, v3

    and-int/lit16 v4, v4, 0x80

    if-eqz v4, :cond_3

    move/from16 v19, v12

    goto :goto_3

    :cond_3
    nop

    move/from16 v19, v9

    :goto_3
    aget-byte v3, p1, v3

    and-int/lit8 v20, v3, 0x7f

    add-int/lit8 v3, p2, 0x2

    aget-byte v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    add-int/lit8 v4, p2, 0x3

    aget-byte v7, p1, v4

    and-int/lit16 v7, v7, 0xf0

    shr-int/lit8 v22, v7, 0x4

    aget-byte v4, p1, v4

    and-int/lit8 v23, v4, 0xf

    add-int/lit8 v4, p2, 0x4

    aget-byte v4, p1, v4

    and-int/lit8 v24, v4, 0x3f

    add-int/lit8 v4, p2, 0x5

    aget-byte v5, p1, v4

    and-int/lit8 v5, v5, 0x38

    shr-int/lit8 v26, v5, 0x3

    aget-byte v1, p1, v4

    and-int/lit8 v25, v1, 0x7

    add-int/lit8 v1, p2, 0x6

    new-instance v2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    const/16 v4, 0x10

    new-instance v5, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;

    move-object v13, v5

    move/from16 v21, v3

    invoke-direct/range {v13 .. v26}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;-><init>(IZZZIZIIIIIII)V

    invoke-direct {v2, v4, v5}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto/16 :goto_5

    :pswitch_1
    aget-byte v3, p1, p2

    and-int/lit16 v3, v3, 0xc0

    shr-int/2addr v3, v7

    aget-byte v6, p1, p2

    and-int/lit8 v6, v6, 0x30

    shr-int/2addr v6, v10

    aget-byte v13, p1, p2

    and-int/2addr v13, v8

    shr-int/lit8 v13, v13, 0x2

    aget-byte v14, p1, p2

    and-int/2addr v14, v11

    new-instance v15, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;

    invoke-direct {v15, v3, v6, v13, v14}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;-><init>(IIII)V

    add-int/lit8 v3, p2, 0x1

    aget-byte v6, p1, v3

    and-int/lit16 v6, v6, 0xc0

    shr-int/2addr v6, v7

    add-int/lit8 v7, p2, 0x2

    aget-byte v13, p1, v7

    and-int/lit16 v13, v13, 0x80

    shr-int/lit8 v4, v13, 0x5

    or-int v18, v6, v4

    aget-byte v4, p1, v3

    and-int/lit8 v4, v4, 0x30

    shr-int/2addr v4, v10

    aget-byte v6, p1, v3

    and-int/2addr v6, v8

    shr-int/lit8 v6, v6, 0x2

    aget-byte v3, p1, v3

    and-int/2addr v3, v11

    new-instance v13, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;

    invoke-direct {v13, v9, v4, v6, v3}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;-><init>(IIII)V

    aget-byte v3, p1, v7

    and-int/lit8 v3, v3, 0x40

    if-eqz v3, :cond_4

    move/from16 v19, v12

    goto :goto_4

    :cond_4
    nop

    move/from16 v19, v9

    :goto_4
    aget-byte v3, p1, v7

    and-int/lit8 v3, v3, 0x30

    shr-int/lit8 v20, v3, 0x4

    aget-byte v3, p1, v7

    and-int/2addr v3, v8

    shr-int/lit8 v21, v3, 0x2

    aget-byte v3, p1, v7

    and-int/lit8 v22, v3, 0x3

    add-int/lit8 v3, p2, 0x3

    aget-byte v4, p1, v3

    and-int/lit16 v4, v4, 0xf0

    shr-int/lit8 v24, v4, 0x4

    aget-byte v4, p1, v3

    and-int/2addr v4, v8

    shr-int/lit8 v23, v4, 0x2

    aget-byte v1, p1, v3

    and-int/lit8 v25, v1, 0x3

    add-int/lit8 v1, p2, 0x4

    new-instance v2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    new-instance v3, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindowAttr;

    move-object v4, v15

    move-object v15, v3

    move-object/from16 v16, v4

    move-object/from16 v17, v13

    invoke-direct/range {v15 .. v25}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindowAttr;-><init>(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;IZIIIIII)V

    invoke-direct {v2, v5, v3}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_5

    :pswitch_2
    aget-byte v3, p1, p2

    and-int/2addr v3, v5

    add-int/lit8 v4, p2, 0x1

    aget-byte v1, p1, v4

    and-int/lit8 v1, v1, 0x3f

    add-int/lit8 v2, p2, 0x2

    new-instance v4, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    const/16 v5, 0xe

    new-instance v6, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenLocation;

    invoke-direct {v6, v3, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenLocation;-><init>(II)V

    invoke-direct {v4, v5, v6}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v4}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto/16 :goto_9

    :pswitch_3
    aget-byte v3, p1, p2

    and-int/lit16 v3, v3, 0xc0

    shr-int/2addr v3, v7

    aget-byte v4, p1, p2

    and-int/lit8 v4, v4, 0x30

    shr-int/2addr v4, v10

    aget-byte v5, p1, p2

    and-int/2addr v5, v8

    shr-int/lit8 v5, v5, 0x2

    aget-byte v6, p1, p2

    and-int/2addr v6, v11

    new-instance v13, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;

    invoke-direct {v13, v3, v4, v5, v6}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;-><init>(IIII)V

    add-int/lit8 v2, p2, 0x1

    aget-byte v3, p1, v2

    and-int/lit16 v3, v3, 0xc0

    shr-int/2addr v3, v7

    aget-byte v4, p1, v2

    and-int/lit8 v4, v4, 0x30

    shr-int/2addr v4, v10

    aget-byte v5, p1, v2

    and-int/2addr v5, v8

    shr-int/lit8 v5, v5, 0x2

    aget-byte v6, p1, v2

    and-int/2addr v6, v11

    new-instance v7, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;

    invoke-direct {v7, v3, v4, v5, v6}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;-><init>(IIII)V

    add-int/2addr v2, v12

    aget-byte v3, p1, v2

    and-int/lit8 v3, v3, 0x30

    shr-int/2addr v3, v10

    aget-byte v4, p1, v2

    and-int/2addr v4, v8

    shr-int/lit8 v4, v4, 0x2

    aget-byte v1, p1, v2

    and-int/2addr v1, v11

    new-instance v5, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;

    invoke-direct {v5, v9, v3, v4, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;-><init>(IIII)V

    add-int/lit8 v1, v2, 0x1

    new-instance v2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    const/16 v3, 0xd

    new-instance v4, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;

    invoke-direct {v4, v13, v7, v5}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;-><init>(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionColor;)V

    invoke-direct {v2, v3, v4}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    nop

    :goto_5
    move v2, v1

    goto/16 :goto_9

    :pswitch_4
    aget-byte v3, p1, p2

    and-int/lit16 v3, v3, 0xf0

    shr-int/lit8 v16, v3, 0x4

    aget-byte v3, p1, p2

    and-int/lit8 v14, v3, 0x3

    aget-byte v3, p1, p2

    and-int/2addr v3, v8

    shr-int/lit8 v15, v3, 0x2

    add-int/lit8 v3, p2, 0x1

    aget-byte v4, p1, v3

    and-int/lit16 v4, v4, 0x80

    if-eqz v4, :cond_5

    move/from16 v20, v12

    goto :goto_6

    :cond_5
    nop

    move/from16 v20, v9

    :goto_6
    aget-byte v4, p1, v3

    and-int/lit8 v4, v4, 0x40

    if-eqz v4, :cond_6

    move/from16 v19, v12

    goto :goto_7

    :cond_6
    nop

    move/from16 v19, v9

    :goto_7
    aget-byte v4, p1, v3

    and-int/lit8 v4, v4, 0x38

    shr-int/lit8 v18, v4, 0x3

    aget-byte v1, p1, v3

    and-int/lit8 v17, v1, 0x7

    add-int/lit8 v1, p2, 0x2

    new-instance v2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    new-instance v3, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;

    move-object v13, v3

    invoke-direct/range {v13 .. v20}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;-><init>(IIIIIZZ)V

    invoke-direct {v2, v8, v3}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_5

    :pswitch_5
    new-instance v1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    const/16 v3, 0xb

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto/16 :goto_8

    :pswitch_6
    new-instance v1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    const/16 v3, 0xa

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto/16 :goto_8

    :pswitch_7
    aget-byte v1, p1, p2

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v2, p2, 0x1

    new-instance v3, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    const/16 v4, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v3, v4, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v3}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto/16 :goto_9

    :pswitch_8
    aget-byte v1, p1, p2

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v2, p2, 0x1

    new-instance v3, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    const/16 v4, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v3, v4, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v3}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_9

    :pswitch_9
    aget-byte v1, p1, p2

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v2, p2, 0x1

    new-instance v3, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v3, v6, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v3}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_9

    :pswitch_a
    aget-byte v1, p1, p2

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v2, p2, 0x1

    new-instance v3, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v3, v7, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v3}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_9

    :pswitch_b
    aget-byte v1, p1, p2

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v2, p2, 0x1

    new-instance v3, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v3, v4, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v3}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_9

    :pswitch_c
    aget-byte v1, p1, p2

    and-int/lit16 v1, v1, 0xff

    add-int/lit8 v2, p2, 0x1

    new-instance v3, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v3, v10, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v3}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    goto :goto_9

    :pswitch_d
    iget v1, v0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    add-int/lit8 v1, v1, -0x80

    new-instance v3, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v3, v11, v1}, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v3}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionEvent(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;)V

    nop

    :goto_8
    move/from16 v2, p2

    :goto_9
    return v2

    :pswitch_data_0
    .packed-switch 0x80
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x97
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private parseC2([BI)I
    .locals 1

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    if-ltz p1, :cond_0

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/4 v0, 0x7

    if-gt p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x8

    if-lt p1, v0, :cond_1

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0xf

    if-gt p1, v0, :cond_1

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x10

    if-lt p1, v0, :cond_2

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x17

    if-gt p1, v0, :cond_2

    add-int/lit8 p2, p2, 0x2

    goto :goto_0

    :cond_2
    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x18

    if-lt p1, v0, :cond_3

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x1f

    if-gt p1, v0, :cond_3

    add-int/lit8 p2, p2, 0x3

    :cond_3
    :goto_0
    return p2
.end method

.method private parseC3([BI)I
    .locals 1

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x80

    if-lt p1, v0, :cond_0

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x87

    if-gt p1, v0, :cond_0

    add-int/lit8 p2, p2, 0x4

    goto :goto_0

    :cond_0
    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x88

    if-lt p1, v0, :cond_1

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x8f

    if-gt p1, v0, :cond_1

    add-int/lit8 p2, p2, 0x5

    :cond_1
    :goto_0
    return p2
.end method

.method private parseExt1([BI)I
    .locals 3

    aget-byte v0, p1, p2

    const/16 v1, 0xff

    and-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    add-int/lit8 p2, p2, 0x1

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    if-ltz v0, :cond_0

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x1f

    if-gt v0, v2, :cond_0

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->parseC2([BI)I

    move-result p2

    goto :goto_0

    :cond_0
    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x80

    if-lt v0, v2, :cond_1

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x9f

    if-gt v0, v2, :cond_1

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->parseC3([BI)I

    move-result p2

    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x20

    if-lt v0, v2, :cond_2

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x7f

    if-gt v0, v2, :cond_2

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->parseG2([BI)I

    move-result p2

    goto :goto_0

    :cond_2
    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0xa0

    if-lt v0, v2, :cond_3

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    if-gt v0, v1, :cond_3

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->parseG3([BI)I

    move-result p2

    :cond_3
    :goto_0
    return p2
.end method

.method private parseG0([BI)I
    .locals 1

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x7f

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mBuilder:Ljava/lang/StringBuilder;

    sget-object v0, Landroid/support/v4/media/subtitle/Cea708CCParser;->MUSIC_NOTE_CHAR:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mBuilder:Ljava/lang/StringBuilder;

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_0
    return p2
.end method

.method private parseG1([BI)I
    .locals 1

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mBuilder:Ljava/lang/StringBuilder;

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return p2
.end method

.method private parseG2([BI)I
    .locals 1

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v0, 0x30

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    goto :goto_0

    :pswitch_1
    goto :goto_0

    :cond_0
    nop

    :goto_0
    return p2

    :pswitch_data_0
    .packed-switch 0x20
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private parseG3([BI)I
    .locals 0

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    return p2
.end method

.method private parseServiceBlockData([BI)I
    .locals 3

    aget-byte v0, p1, p2

    const/16 v1, 0xff

    and-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    add-int/lit8 p2, p2, 0x1

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x10

    if-ne v0, v2, :cond_0

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->parseExt1([BI)I

    move-result p2

    goto :goto_0

    :cond_0
    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    if-ltz v0, :cond_1

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x1f

    if-gt v0, v2, :cond_1

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->parseC0([BI)I

    move-result p2

    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x80

    if-lt v0, v2, :cond_2

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x9f

    if-gt v0, v2, :cond_2

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->parseC1([BI)I

    move-result p2

    goto :goto_0

    :cond_2
    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x20

    if-lt v0, v2, :cond_3

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0x7f

    if-gt v0, v2, :cond_3

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->parseG0([BI)I

    move-result p2

    goto :goto_0

    :cond_3
    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    const/16 v2, 0xa0

    if-lt v0, v2, :cond_4

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CCParser;->mCommand:I

    if-gt v0, v1, :cond_4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/subtitle/Cea708CCParser;->parseG1([BI)I

    move-result p2

    :cond_4
    :goto_0
    return p2
.end method


# virtual methods
.method public parse([B)V
    .locals 2

    nop

    const/4 v0, 0x0

    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/media/subtitle/Cea708CCParser;->parseServiceBlockData([BI)I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CCParser;->emitCaptionBuffer()V

    return-void
.end method
