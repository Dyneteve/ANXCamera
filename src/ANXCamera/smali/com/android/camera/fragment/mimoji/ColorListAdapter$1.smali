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

.field final synthetic val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/ColorListAdapter;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    sget-object p1, Lcom/android/camera/fragment/mimoji/FragmentMimojiEdit;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "click item color:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v1, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " item ID:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v1, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v0, v0, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v1, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setInnerConfigSelectIndex(IF)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->access$000(Lcom/android/camera/fragment/mimoji/ColorListAdapter;)Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->val$avatarConfigInfo:Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    const/4 v1, 0x1

    invoke-interface {p1, v0, v1}, Lcom/android/camera/fragment/mimoji/AvatarConfigItemClick;->onConfigItemClick(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;Z)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$1;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->notifyDataSetChanged()V

    return-void
.end method
