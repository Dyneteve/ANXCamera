.class public Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;
.super Ljava/lang/Object;
.source "Cea708CCParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/Cea708CCParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CaptionEvent"
.end annotation


# instance fields
.field public final obj:Ljava/lang/Object;

.field public final type:I


# direct methods
.method constructor <init>(ILjava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->type:I

    iput-object p2, p0, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionEvent;->obj:Ljava/lang/Object;

    return-void
.end method
