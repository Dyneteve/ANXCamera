.class Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;
.super Ljava/lang/Object;
.source "ViewPropertyAnimatorCompat.java"

# interfaces
.implements Landroid/support/v4/view/ViewPropertyAnimatorCompat$ViewPropertyAnimatorCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/view/ViewPropertyAnimatorCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BaseViewPropertyAnimatorCompatImpl"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl$Starter;
    }
.end annotation


# instance fields
.field mStarterMap:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/view/View;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->mStarterMap:Ljava/util/WeakHashMap;

    return-void
.end method

.method static synthetic access$200(Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->startAnimation(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method private postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V
    .registers 6

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->mStarterMap:Ljava/util/WeakHashMap;

    if-eqz v1, :cond_e

    iget-object v1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->mStarterMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p2}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Ljava/lang/Runnable;

    :cond_e
    if-nez v0, :cond_27

    new-instance v1, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl$Starter;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, p2, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl$Starter;-><init>(Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorCompat$1;)V

    move-object v0, v1

    iget-object v1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->mStarterMap:Ljava/util/WeakHashMap;

    if-nez v1, :cond_22

    new-instance v1, Ljava/util/WeakHashMap;

    invoke-direct {v1}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->mStarterMap:Ljava/util/WeakHashMap;

    :cond_22
    iget-object v1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->mStarterMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p2, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_27
    invoke-virtual {p2, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    invoke-virtual {p2, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private removeStartMessage(Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->mStarterMap:Ljava/util/WeakHashMap;

    if-eqz v1, :cond_13

    iget-object v1, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->mStarterMap:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    check-cast v0, Ljava/lang/Runnable;

    if-eqz v0, :cond_13

    invoke-virtual {p1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_13
    return-void
.end method

.method private startAnimation(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V
    .registers 8

    const/high16 v0, 0x7e000000

    invoke-virtual {p2, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    instance-of v2, v0, Landroid/support/v4/view/ViewPropertyAnimatorListener;

    if-eqz v2, :cond_e

    move-object v1, v0

    check-cast v1, Landroid/support/v4/view/ViewPropertyAnimatorListener;

    :cond_e
    # getter for: Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mStartAction:Ljava/lang/Runnable;
    invoke-static {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->access$100(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Ljava/lang/Runnable;

    move-result-object v2

    # getter for: Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mEndAction:Ljava/lang/Runnable;
    invoke-static {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->access$000(Landroid/support/v4/view/ViewPropertyAnimatorCompat;)Ljava/lang/Runnable;

    move-result-object v3

    if-eqz v2, :cond_1b

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    :cond_1b
    if-eqz v1, :cond_23

    invoke-interface {v1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorListener;->onAnimationStart(Landroid/view/View;)V

    invoke-interface {v1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorListener;->onAnimationEnd(Landroid/view/View;)V

    :cond_23
    if-eqz v3, :cond_28

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    :cond_28
    iget-object v4, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->mStarterMap:Ljava/util/WeakHashMap;

    if-eqz v4, :cond_31

    iget-object v4, p0, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->mStarterMap:Ljava/util/WeakHashMap;

    invoke-virtual {v4, p2}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_31
    return-void
.end method


# virtual methods
.method public alpha(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public alphaBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public cancel(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public getDuration(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)J
    .registers 5

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getInterpolator(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)Landroid/view/animation/Interpolator;
    .registers 4

    const/4 v0, 0x0

    return-object v0
.end method

.method public getStartDelay(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)J
    .registers 5

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public rotation(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public rotationBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public rotationX(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public rotationXBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public rotationY(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public rotationYBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public scaleX(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public scaleXBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public scaleY(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public scaleYBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public setDuration(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;J)V
    .registers 5

    return-void
.end method

.method public setInterpolator(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;Landroid/view/animation/Interpolator;)V
    .registers 4

    return-void
.end method

.method public setListener(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorListener;)V
    .registers 5

    const/high16 v0, 0x7e000000

    invoke-virtual {p2, v0, p3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    return-void
.end method

.method public setStartDelay(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;J)V
    .registers 5

    return-void
.end method

.method public setUpdateListener(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;Landroid/support/v4/view/ViewPropertyAnimatorUpdateListener;)V
    .registers 4

    return-void
.end method

.method public start(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V
    .registers 3

    invoke-direct {p0, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->removeStartMessage(Landroid/view/View;)V

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->startAnimation(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public translationX(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public translationXBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public translationY(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public translationYBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public translationZ(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    return-void
.end method

.method public translationZBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    return-void
.end method

.method public withEndAction(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 4

    # setter for: Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mEndAction:Ljava/lang/Runnable;
    invoke-static {p1, p3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->access$002(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public withLayer(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V
    .registers 3

    return-void
.end method

.method public withStartAction(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 4

    # setter for: Landroid/support/v4/view/ViewPropertyAnimatorCompat;->mStartAction:Ljava/lang/Runnable;
    invoke-static {p1, p3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->access$102(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public x(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public xBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public y(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public yBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat$BaseViewPropertyAnimatorCompatImpl;->postStartMessage(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;)V

    return-void
.end method

.method public z(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    return-void
.end method

.method public zBy(Landroid/support/v4/view/ViewPropertyAnimatorCompat;Landroid/view/View;F)V
    .registers 4

    return-void
.end method
