.class public final Landroid/support/fragment/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/fragment/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final CoordinatorLayout:[I

.field public static final CoordinatorLayout_Layout:[I

.field public static CoordinatorLayout_Layout_android_layout_gravity:I

.field public static CoordinatorLayout_Layout_layout_anchor:I

.field public static CoordinatorLayout_Layout_layout_anchorGravity:I

.field public static CoordinatorLayout_Layout_layout_behavior:I

.field public static CoordinatorLayout_Layout_layout_dodgeInsetEdges:I

.field public static CoordinatorLayout_Layout_layout_insetEdge:I

.field public static CoordinatorLayout_Layout_layout_keyline:I

.field public static CoordinatorLayout_keylines:I

.field public static CoordinatorLayout_statusBarBackground:I

.field public static final FontFamily:[I

.field public static final FontFamilyFont:[I

.field public static FontFamilyFont_android_font:I

.field public static FontFamilyFont_android_fontStyle:I

.field public static FontFamilyFont_android_fontVariationSettings:I

.field public static FontFamilyFont_android_fontWeight:I

.field public static FontFamilyFont_android_ttcIndex:I

.field public static FontFamilyFont_font:I

.field public static FontFamilyFont_fontStyle:I

.field public static FontFamilyFont_fontVariationSettings:I

.field public static FontFamilyFont_fontWeight:I

.field public static FontFamilyFont_ttcIndex:I

.field public static FontFamily_fontProviderAuthority:I

.field public static FontFamily_fontProviderCerts:I

.field public static FontFamily_fontProviderFetchStrategy:I

.field public static FontFamily_fontProviderFetchTimeout:I

.field public static FontFamily_fontProviderPackage:I

.field public static FontFamily_fontProviderQuery:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v0, 0x2

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Landroid/support/fragment/R$styleable;->CoordinatorLayout:[I

    const/4 v1, 0x0

    sput v1, Landroid/support/fragment/R$styleable;->CoordinatorLayout_keylines:I

    const/4 v2, 0x1

    sput v2, Landroid/support/fragment/R$styleable;->CoordinatorLayout_statusBarBackground:I

    const/4 v3, 0x7

    new-array v4, v3, [I

    fill-array-data v4, :array_1

    sput-object v4, Landroid/support/fragment/R$styleable;->CoordinatorLayout_Layout:[I

    sput v1, Landroid/support/fragment/R$styleable;->CoordinatorLayout_Layout_layout_anchor:I

    sput v2, Landroid/support/fragment/R$styleable;->CoordinatorLayout_Layout_layout_anchorGravity:I

    sput v0, Landroid/support/fragment/R$styleable;->CoordinatorLayout_Layout_layout_behavior:I

    const/4 v4, 0x3

    sput v4, Landroid/support/fragment/R$styleable;->CoordinatorLayout_Layout_layout_dodgeInsetEdges:I

    const/4 v5, 0x4

    sput v5, Landroid/support/fragment/R$styleable;->CoordinatorLayout_Layout_layout_insetEdge:I

    const/4 v6, 0x5

    sput v6, Landroid/support/fragment/R$styleable;->CoordinatorLayout_Layout_layout_keyline:I

    const/4 v7, 0x6

    sput v7, Landroid/support/fragment/R$styleable;->CoordinatorLayout_Layout_android_layout_gravity:I

    new-array v8, v7, [I

    fill-array-data v8, :array_2

    sput-object v8, Landroid/support/fragment/R$styleable;->FontFamily:[I

    sput v1, Landroid/support/fragment/R$styleable;->FontFamily_fontProviderAuthority:I

    sput v2, Landroid/support/fragment/R$styleable;->FontFamily_fontProviderCerts:I

    sput v0, Landroid/support/fragment/R$styleable;->FontFamily_fontProviderFetchStrategy:I

    sput v4, Landroid/support/fragment/R$styleable;->FontFamily_fontProviderFetchTimeout:I

    sput v5, Landroid/support/fragment/R$styleable;->FontFamily_fontProviderPackage:I

    sput v6, Landroid/support/fragment/R$styleable;->FontFamily_fontProviderQuery:I

    const/16 v8, 0xa

    new-array v8, v8, [I

    fill-array-data v8, :array_3

    sput-object v8, Landroid/support/fragment/R$styleable;->FontFamilyFont:[I

    sput v1, Landroid/support/fragment/R$styleable;->FontFamilyFont_font:I

    sput v2, Landroid/support/fragment/R$styleable;->FontFamilyFont_fontStyle:I

    sput v0, Landroid/support/fragment/R$styleable;->FontFamilyFont_fontVariationSettings:I

    sput v4, Landroid/support/fragment/R$styleable;->FontFamilyFont_fontWeight:I

    sput v5, Landroid/support/fragment/R$styleable;->FontFamilyFont_ttcIndex:I

    sput v6, Landroid/support/fragment/R$styleable;->FontFamilyFont_android_font:I

    sput v7, Landroid/support/fragment/R$styleable;->FontFamilyFont_android_fontWeight:I

    sput v3, Landroid/support/fragment/R$styleable;->FontFamilyFont_android_fontStyle:I

    const/16 v0, 0x8

    sput v0, Landroid/support/fragment/R$styleable;->FontFamilyFont_android_ttcIndex:I

    const/16 v0, 0x9

    sput v0, Landroid/support/fragment/R$styleable;->FontFamilyFont_android_fontVariationSettings:I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x10100b3
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x1010532
        0x1010533
        0x101053f
        0x101056f
        0x1010570
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
