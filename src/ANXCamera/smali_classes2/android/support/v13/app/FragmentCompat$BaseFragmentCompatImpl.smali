.class Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;
.super Ljava/lang/Object;
.source "FragmentCompat.java"

# interfaces
.implements Landroid/support/v13/app/FragmentCompat$FragmentCompatImpl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v13/app/FragmentCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BaseFragmentCompatImpl"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public requestPermissions(Landroid/app/Fragment;[Ljava/lang/String;I)V
    .registers 6

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;

    invoke-direct {v1, p0, p2, p1, p3}, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;-><init>(Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;[Ljava/lang/String;Landroid/app/Fragment;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public setMenuVisibility(Landroid/app/Fragment;Z)V
    .registers 3

    return-void
.end method

.method public setUserVisibleHint(Landroid/app/Fragment;Z)V
    .registers 3

    return-void
.end method

.method public shouldShowRequestPermissionRationale(Landroid/app/Fragment;Ljava/lang/String;)Z
    .registers 4

    const/4 v0, 0x0

    return v0
.end method
