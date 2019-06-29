.class Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;
.super Lcom/android/camera/fragment/CommonRecyclerViewHolder;
.source "FragmentMimoji.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MimojiItemHolder"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;-><init>(Landroid/view/View;)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->getAdapterPosition()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x2

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    invoke-static {v1}, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->access$400(Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter$MimojiItemHolder;->this$1:Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;

    iget-object v2, v2, Lcom/android/camera/fragment/mimoji/FragmentMimoji$MimojiItemAdapter;->this$0:Lcom/android/camera/fragment/mimoji/FragmentMimoji;

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v0, p1, v3}, Lcom/android/camera/fragment/mimoji/FragmentMimoji;->onItemSelected(Lcom/android/camera/fragment/mimoji/MimojiInfo;ILandroid/view/View;Z)V

    :cond_0
    return-void
.end method
