.class Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder$1;
.super Ljava/lang/Object;
.source "MimojiTypeAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;->setData(Lcom/android/camera/fragment/mimoji/MimojiTypeBean;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;I)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder$1;->this$0:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;

    iput p2, p0, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder$1;->this$0:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;->itemView:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder$1;->this$0:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_0

    :try_start_0
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder$1;->this$0:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    iget v0, p0, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder$1;->val$position:I

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->moveToPosition(I)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p1, "VIEW_"

    const-string v0, "recyclerview \u7c7b\u578b\u4e0d\u6b63\u786e"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void
.end method
