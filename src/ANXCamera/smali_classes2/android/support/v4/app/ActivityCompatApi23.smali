.class Landroid/support/v4/app/ActivityCompatApi23;
.super Ljava/lang/Object;
.source "ActivityCompat23.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/ActivityCompatApi23$RequestPermissionsRequestCodeValidator;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V
    .registers 4

    instance-of v0, p0, Landroid/support/v4/app/ActivityCompatApi23$RequestPermissionsRequestCodeValidator;

    if-eqz v0, :cond_a

    move-object v0, p0

    check-cast v0, Landroid/support/v4/app/ActivityCompatApi23$RequestPermissionsRequestCodeValidator;

    invoke-interface {v0, p2}, Landroid/support/v4/app/ActivityCompatApi23$RequestPermissionsRequestCodeValidator;->validateRequestPermissionsRequestCode(I)V

    :cond_a
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    return-void
.end method

.method public static shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z
    .registers 3

    invoke-virtual {p0, p1}, Landroid/app/Activity;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
