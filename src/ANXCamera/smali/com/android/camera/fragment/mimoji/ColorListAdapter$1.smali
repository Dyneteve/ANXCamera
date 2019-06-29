.class Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;
.super Ljava/lang/Object;
.source "ColorListAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/ColorListAdapter;->onBindViewHolder(Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

.field final synthetic val$argbEvaluator:Landroid/animation/ArgbEvaluator;

.field final synthetic val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

.field final synthetic val$circleImageView:Lcom/android/camera/fragment/mimoji/CircleImageView;

.field final synthetic val$position:I

.field final synthetic val$viewHolder:Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/ColorListAdapter;ILandroid/animation/ArgbEvaluator;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;Lcom/android/camera/fragment/mimoji/CircleImageView;Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    iput p2, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$position:I

    iput-object p3, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$argbEvaluator:Landroid/animation/ArgbEvaluator;

    iput-object p4, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iput-object p5, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$circleImageView:Lcom/android/camera/fragment/mimoji/CircleImageView;

    iput-object p6, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$viewHolder:Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->access$000(Lcom/android/camera/fragment/mimoji/ColorListAdapter;)Lcom/android/camera/fragment/mimoji/ClickCheck;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->access$000(Lcom/android/camera/fragment/mimoji/ColorListAdapter;)Lcom/android/camera/fragment/mimoji/ClickCheck;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/ClickCheck;->checkClickable()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    iget p1, p1, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mLastPosion:I

    iget v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$position:I

    if-eq p1, v0, :cond_5

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$argbEvaluator:Landroid/animation/ArgbEvaluator;

    if-nez p1, :cond_1

    goto/16 :goto_1

    :cond_1
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget p1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p1

    const/16 v0, 0x12

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v1, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setInnerConfigSelectIndex(IF)V

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p1

    const/16 v0, 0xf

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v1, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setInnerConfigSelectIndex(IF)V

    :cond_2
    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v0, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v1, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setInnerConfigSelectIndex(IF)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$circleImageView:Lcom/android/camera/fragment/mimoji/CircleImageView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/CircleImageView;->updateView(Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$viewHolder:Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    iget v1, v1, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mLastPosion:I

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;

    if-eqz p1, :cond_3

    iget-object p1, p1, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;->ivColor:Lcom/android/camera/fragment/mimoji/CircleImageView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/android/camera/fragment/mimoji/CircleImageView;->updateView(Z)V

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    iget v1, v1, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mLastPosion:I

    invoke-virtual {p1, v1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->notifyItemChanged(I)V

    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    iget v1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$position:I

    iput v1, p1, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->mLastPosion:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->access$100(Lcom/android/camera/fragment/mimoji/ColorListAdapter;)Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

    move-result-object p1

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v2, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$position:I

    invoke-interface {p1, v1, v0, v2}, Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;->onConfigItemClick(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;ZI)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->access$200(Lcom/android/camera/fragment/mimoji/ColorListAdapter;)Lcom/android/camera/fragment/mimoji/ColorListAdapter$OnItemClickListener;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->access$200(Lcom/android/camera/fragment/mimoji/ColorListAdapter;)Lcom/android/camera/fragment/mimoji/ColorListAdapter$OnItemClickListener;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$position:I

    invoke-interface {p1, v0}, Lcom/android/camera/fragment/mimoji/ColorListAdapter$OnItemClickListener;->onItemClick(I)V

    :cond_4
    return-void

    :cond_5
    :goto_1
    return-void
.end method
