.class Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;
.super Ljava/lang/Object;
.source "EditLevelListAdapter.java"

# interfaces
.implements Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->onBindViewHolder(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener<",
        "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

.field final synthetic val$mimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;

.field final synthetic val$outerPosition:I


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;ILcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iput p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->val$outerPosition:I

    iput-object p3, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->val$mimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnRecyclerItemClickListener(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;I)V
    .locals 2

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$000(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/ClickCheck;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$000(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/ClickCheck;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/ClickCheck;->checkClickable()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iget v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->val$outerPosition:I

    invoke-static {p1, v0, p2}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$100(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;II)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->val$mimojiThumbnailAdapter:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;

    iget v1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->val$outerPosition:I

    invoke-virtual {p1, v0, v1, p2}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->updateSelectView(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;II)V

    return-void
.end method

.method public bridge synthetic OnRecyclerItemClickListener(Ljava/lang/Object;I)V
    .locals 0

    check-cast p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$1;->OnRecyclerItemClickListener(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;I)V

    return-void
.end method
