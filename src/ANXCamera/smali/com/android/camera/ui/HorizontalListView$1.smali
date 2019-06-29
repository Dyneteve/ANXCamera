.class Lcom/android/camera/ui/HorizontalListView$1;
.super Landroid/database/DataSetObserver;
.source "HorizontalListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/HorizontalListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/HorizontalListView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/HorizontalListView;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView$1;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$1;->this$0:Lcom/android/camera/ui/HorizontalListView;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView$1;->this$0:Lcom/android/camera/ui/HorizontalListView;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/android/camera/ui/HorizontalListView;->access$002(Lcom/android/camera/ui/HorizontalListView;Z)Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$1;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/ui/HorizontalListView;->invalidate()V

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$1;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public onInvalidated()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$1;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-static {v0}, Lcom/android/camera/ui/HorizontalListView;->access$100(Lcom/android/camera/ui/HorizontalListView;)V

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$1;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/ui/HorizontalListView;->invalidate()V

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView$1;->this$0:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V

    return-void
.end method
