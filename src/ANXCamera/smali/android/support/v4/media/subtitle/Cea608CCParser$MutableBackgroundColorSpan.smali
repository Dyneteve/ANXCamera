.class public Landroid/support/v4/media/subtitle/Cea608CCParser$MutableBackgroundColorSpan;
.super Landroid/text/style/CharacterStyle;
.source "Cea608CCParser.java"

# interfaces
.implements Landroid/text/style/UpdateAppearance;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/Cea608CCParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MutableBackgroundColorSpan"
.end annotation


# instance fields
.field private mColor:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Landroid/text/style/CharacterStyle;-><init>()V

    iput p1, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$MutableBackgroundColorSpan;->mColor:I

    return-void
.end method


# virtual methods
.method public getBackgroundColor()I
    .locals 1

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$MutableBackgroundColorSpan;->mColor:I

    return v0
.end method

.method public setBackgroundColor(I)V
    .locals 0

    iput p1, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$MutableBackgroundColorSpan;->mColor:I

    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 1

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$MutableBackgroundColorSpan;->mColor:I

    iput v0, p1, Landroid/text/TextPaint;->bgColor:I

    return-void
.end method
