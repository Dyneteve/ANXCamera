.class public Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "ColorListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/mimoji/ColorListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ViewHolder"
.end annotation


# instance fields
.field ivColor:Lcom/android/camera/fragment/mimoji/CircleImageView;

.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/mimoji/ColorListAdapter;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;->this$0:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const p1, 0x7f0d00ef

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/mimoji/CircleImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/ColorListAdapter$ViewHolder;->ivColor:Lcom/android/camera/fragment/mimoji/CircleImageView;

    return-void
.end method
