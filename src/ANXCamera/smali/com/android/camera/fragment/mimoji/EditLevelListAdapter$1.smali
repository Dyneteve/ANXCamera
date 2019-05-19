.class Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;
.super Ljava/lang/Object;
.source "EditLevelListAdapter.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->onBindViewHolder(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

.field final synthetic val$mimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

.field final synthetic val$outerPosition:I


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;ILcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iput p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->val$outerPosition:I

    iput-object p3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->val$mimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iget p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->val$outerPosition:I

    invoke-static {p1, p2, p3}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$000(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;II)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$100(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/fragment/mimoji/ItfGvOnItemClickListener;->notifyUIChanged()V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->val$mimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;

    iget p4, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->val$outerPosition:I

    invoke-virtual {p1, p2, p4, p3}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->updateSelectView(Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;II)V

    return-void
.end method
