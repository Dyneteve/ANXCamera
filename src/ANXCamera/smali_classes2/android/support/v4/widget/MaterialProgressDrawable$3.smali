.class Landroid/support/v4/widget/MaterialProgressDrawable$3;
.super Ljava/lang/Object;
.source "MaterialProgressDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Drawable$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/widget/MaterialProgressDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/widget/MaterialProgressDrawable;


# direct methods
.method constructor <init>(Landroid/support/v4/widget/MaterialProgressDrawable;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v4/widget/MaterialProgressDrawable$3;->this$0:Landroid/support/v4/widget/MaterialProgressDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/widget/MaterialProgressDrawable$3;->this$0:Landroid/support/v4/widget/MaterialProgressDrawable;

    invoke-virtual {v0}, Landroid/support/v4/widget/MaterialProgressDrawable;->invalidateSelf()V

    return-void
.end method

.method public scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 6

    iget-object v0, p0, Landroid/support/v4/widget/MaterialProgressDrawable$3;->this$0:Landroid/support/v4/widget/MaterialProgressDrawable;

    invoke-virtual {v0, p2, p3, p4}, Landroid/support/v4/widget/MaterialProgressDrawable;->scheduleSelf(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v4/widget/MaterialProgressDrawable$3;->this$0:Landroid/support/v4/widget/MaterialProgressDrawable;

    invoke-virtual {v0, p2}, Landroid/support/v4/widget/MaterialProgressDrawable;->unscheduleSelf(Ljava/lang/Runnable;)V

    return-void
.end method
