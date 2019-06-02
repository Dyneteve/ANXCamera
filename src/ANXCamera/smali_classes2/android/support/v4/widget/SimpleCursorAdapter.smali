.class public Landroid/support/v4/widget/SimpleCursorAdapter;
.super Landroid/support/v4/widget/ResourceCursorAdapter;
.source "SimpleCursorAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/SimpleCursorAdapter$CursorToStringConverter;,
        Landroid/support/v4/widget/SimpleCursorAdapter$ViewBinder;
    }
.end annotation


# instance fields
.field private mCursorToStringConverter:Landroid/support/v4/widget/SimpleCursorAdapter$CursorToStringConverter;

.field protected mFrom:[I

.field mOriginalFrom:[Ljava/lang/String;

.field private mStringConversionColumn:I

.field protected mTo:[I

.field private mViewBinder:Landroid/support/v4/widget/SimpleCursorAdapter$ViewBinder;


# direct methods
.method public constructor <init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[I)V
    .registers 7
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v4/widget/ResourceCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;)V

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mStringConversionColumn:I

    iput-object p5, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mTo:[I

    iput-object p4, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mOriginalFrom:[Ljava/lang/String;

    invoke-direct {p0, p4}, Landroid/support/v4/widget/SimpleCursorAdapter;->findColumns([Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V
    .registers 8

    invoke-direct {p0, p1, p2, p3, p6}, Landroid/support/v4/widget/ResourceCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;I)V

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mStringConversionColumn:I

    iput-object p5, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mTo:[I

    iput-object p4, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mOriginalFrom:[Ljava/lang/String;

    invoke-direct {p0, p4}, Landroid/support/v4/widget/SimpleCursorAdapter;->findColumns([Ljava/lang/String;)V

    return-void
.end method

.method private findColumns([Ljava/lang/String;)V
    .registers 7

    iget-object v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_25

    array-length v0, p1

    iget-object v1, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mFrom:[I

    if-eqz v1, :cond_e

    iget-object v1, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mFrom:[I

    array-length v1, v1

    if-eq v1, v0, :cond_12

    :cond_e
    new-array v1, v0, [I

    iput-object v1, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mFrom:[I

    :cond_12
    const/4 v1, 0x0

    :goto_13
    if-ge v1, v0, :cond_24

    iget-object v2, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mFrom:[I

    iget-object v3, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mCursor:Landroid/database/Cursor;

    aget-object v4, p1, v1

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    :cond_24
    goto :goto_28

    :cond_25
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mFrom:[I

    :goto_28
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .registers 15

    iget-object v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mViewBinder:Landroid/support/v4/widget/SimpleCursorAdapter$ViewBinder;

    iget-object v1, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mTo:[I

    array-length v1, v1

    iget-object v2, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mFrom:[I

    iget-object v3, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mTo:[I

    const/4 v4, 0x0

    :goto_a
    if-ge v4, v1, :cond_66

    aget v5, v3, v4

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_63

    const/4 v6, 0x0

    if-eqz v0, :cond_1d

    aget v7, v2, v4

    invoke-interface {v0, v5, p3, v7}, Landroid/support/v4/widget/SimpleCursorAdapter$ViewBinder;->setViewValue(Landroid/view/View;Landroid/database/Cursor;I)Z

    move-result v6

    :cond_1d
    if-nez v6, :cond_63

    aget v7, v2, v4

    invoke-interface {p3, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_29

    const-string v7, ""

    :cond_29
    instance-of v8, v5, Landroid/widget/TextView;

    if-eqz v8, :cond_34

    move-object v8, v5

    check-cast v8, Landroid/widget/TextView;

    invoke-virtual {p0, v8, v7}, Landroid/support/v4/widget/SimpleCursorAdapter;->setViewText(Landroid/widget/TextView;Ljava/lang/String;)V

    goto :goto_63

    :cond_34
    instance-of v8, v5, Landroid/widget/ImageView;

    if-eqz v8, :cond_3f

    move-object v8, v5

    check-cast v8, Landroid/widget/ImageView;

    invoke-virtual {p0, v8, v7}, Landroid/support/v4/widget/SimpleCursorAdapter;->setViewImage(Landroid/widget/ImageView;Ljava/lang/String;)V

    goto :goto_63

    :cond_3f
    new-instance v8, Ljava/lang/IllegalStateException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, " is not a "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, " view that can be bounds by this SimpleCursorAdapter"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_63
    :goto_63
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    :cond_66
    return-void
.end method

.method public changeCursorAndColumns(Landroid/database/Cursor;[Ljava/lang/String;[I)V
    .registers 5

    iput-object p2, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mOriginalFrom:[Ljava/lang/String;

    iput-object p3, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mTo:[I

    invoke-super {p0, p1}, Landroid/support/v4/widget/ResourceCursorAdapter;->changeCursor(Landroid/database/Cursor;)V

    iget-object v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mOriginalFrom:[Ljava/lang/String;

    invoke-direct {p0, v0}, Landroid/support/v4/widget/SimpleCursorAdapter;->findColumns([Ljava/lang/String;)V

    return-void
.end method

.method public convertToString(Landroid/database/Cursor;)Ljava/lang/CharSequence;
    .registers 4

    iget-object v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mCursorToStringConverter:Landroid/support/v4/widget/SimpleCursorAdapter$CursorToStringConverter;

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mCursorToStringConverter:Landroid/support/v4/widget/SimpleCursorAdapter$CursorToStringConverter;

    invoke-interface {v0, p1}, Landroid/support/v4/widget/SimpleCursorAdapter$CursorToStringConverter;->convertToString(Landroid/database/Cursor;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0

    :cond_b
    iget v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mStringConversionColumn:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_17

    iget v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mStringConversionColumn:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_17
    invoke-super {p0, p1}, Landroid/support/v4/widget/ResourceCursorAdapter;->convertToString(Landroid/database/Cursor;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getCursorToStringConverter()Landroid/support/v4/widget/SimpleCursorAdapter$CursorToStringConverter;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mCursorToStringConverter:Landroid/support/v4/widget/SimpleCursorAdapter$CursorToStringConverter;

    return-object v0
.end method

.method public getStringConversionColumn()I
    .registers 2

    iget v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mStringConversionColumn:I

    return v0
.end method

.method public getViewBinder()Landroid/support/v4/widget/SimpleCursorAdapter$ViewBinder;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mViewBinder:Landroid/support/v4/widget/SimpleCursorAdapter$ViewBinder;

    return-object v0
.end method

.method public setCursorToStringConverter(Landroid/support/v4/widget/SimpleCursorAdapter$CursorToStringConverter;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mCursorToStringConverter:Landroid/support/v4/widget/SimpleCursorAdapter$CursorToStringConverter;

    return-void
.end method

.method public setStringConversionColumn(I)V
    .registers 2

    iput p1, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mStringConversionColumn:I

    return-void
.end method

.method public setViewBinder(Landroid/support/v4/widget/SimpleCursorAdapter$ViewBinder;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mViewBinder:Landroid/support/v4/widget/SimpleCursorAdapter$ViewBinder;

    return-void
.end method

.method public setViewImage(Landroid/widget/ImageView;Ljava/lang/String;)V
    .registers 5

    :try_start_0
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_7} :catch_8

    goto :goto_10

    :catch_8
    move-exception v0

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    :goto_10
    return-void
.end method

.method public setViewText(Landroid/widget/TextView;Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .registers 4

    invoke-super {p0, p1}, Landroid/support/v4/widget/ResourceCursorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/widget/SimpleCursorAdapter;->mOriginalFrom:[Ljava/lang/String;

    invoke-direct {p0, v1}, Landroid/support/v4/widget/SimpleCursorAdapter;->findColumns([Ljava/lang/String;)V

    return-object v0
.end method
