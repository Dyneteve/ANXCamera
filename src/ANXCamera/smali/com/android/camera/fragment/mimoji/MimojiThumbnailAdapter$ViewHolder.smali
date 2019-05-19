.class Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "MimojiThumbnailAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field imageView:Landroid/widget/ImageView;

.field selectView:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;->this$0:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const p1, 0x7f0d00f5

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;->imageView:Landroid/widget/ImageView;

    const p1, 0x7f0d00f6

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;->selectView:Landroid/widget/ImageView;

    return-void
.end method
