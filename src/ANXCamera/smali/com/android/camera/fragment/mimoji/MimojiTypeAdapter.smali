.class public Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;
.super Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;
.source "MimojiTypeAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;,
        Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$OnSelectListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/ui/autoselectview/AutoSelectAdapter<",
        "Lcom/android/camera/fragment/mimoji/MimojiTypeBean;",
        ">;"
    }
.end annotation


# instance fields
.field private onSelectListener:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$OnSelectListener;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/fragment/mimoji/MimojiTypeBean;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;-><init>(Ljava/util/ArrayList;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/ui/autoselectview/AutoSelectViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/ui/autoselectview/AutoSelectViewHolder;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f040049

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;

    invoke-direct {p2, p1}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$TypeViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public onSelectedPositionFinish(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->onSelectListener:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$OnSelectListener;

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->getItemCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->onSelectListener:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$OnSelectListener;

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->getDataList()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/mimoji/MimojiTypeBean;

    invoke-virtual {v1}, Lcom/android/camera/fragment/mimoji/MimojiTypeBean;->getASAvatarConfigType()Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$OnSelectListener;->onSelectListener(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigType;I)V

    :cond_0
    return-void
.end method

.method public setOnSelectListener(Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$OnSelectListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter;->onSelectListener:Lcom/android/camera/fragment/mimoji/MimojiTypeAdapter$OnSelectListener;

    return-void
.end method
