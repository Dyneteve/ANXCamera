.class Lcom/android/camera/fragment/mimoji/FragmentMimoji$1;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "FragmentMimoji.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimoji;->initView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$1;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$1;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->access$000(Lcom/android/camera/fragment/mimoji/FragmentMimoji;)Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;

    move-result-object p1

    const/4 p2, -0x2

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p2, v0}, Lcom/android/camera/fragment/mimoji/BubbleEditMimojiPresenter;->processBubbleAni(IILandroid/view/View;)V

    return-void
.end method
