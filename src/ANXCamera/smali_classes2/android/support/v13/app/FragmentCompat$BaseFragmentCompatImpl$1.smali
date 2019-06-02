.class Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;
.super Ljava/lang/Object;
.source "FragmentCompat.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;->requestPermissions(Landroid/app/Fragment;[Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;

.field final synthetic val$fragment:Landroid/app/Fragment;

.field final synthetic val$permissions:[Ljava/lang/String;

.field final synthetic val$requestCode:I


# direct methods
.method constructor <init>(Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;[Ljava/lang/String;Landroid/app/Fragment;I)V
    .registers 5

    iput-object p1, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->this$0:Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl;

    iput-object p2, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$permissions:[Ljava/lang/String;

    iput-object p3, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$fragment:Landroid/app/Fragment;

    iput p4, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$requestCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 8

    iget-object v0, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$permissions:[Ljava/lang/String;

    array-length v0, v0

    new-array v0, v0, [I

    iget-object v1, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$fragment:Landroid/app/Fragment;

    invoke-virtual {v1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_29

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$permissions:[Ljava/lang/String;

    array-length v4, v4

    const/4 v5, 0x0

    :goto_19
    if-ge v5, v4, :cond_28

    iget-object v6, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$permissions:[Ljava/lang/String;

    aget-object v6, v6, v5

    invoke-virtual {v2, v6, v3}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    aput v6, v0, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_19

    :cond_28
    goto :goto_2d

    :cond_29
    const/4 v2, -0x1

    invoke-static {v0, v2}, Ljava/util/Arrays;->fill([II)V

    :goto_2d
    iget-object v2, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$fragment:Landroid/app/Fragment;

    check-cast v2, Landroid/support/v13/app/FragmentCompat$OnRequestPermissionsResultCallback;

    iget v3, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$requestCode:I

    iget-object v4, p0, Landroid/support/v13/app/FragmentCompat$BaseFragmentCompatImpl$1;->val$permissions:[Ljava/lang/String;

    invoke-interface {v2, v3, v4, v0}, Landroid/support/v13/app/FragmentCompat$OnRequestPermissionsResultCallback;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    return-void
.end method
