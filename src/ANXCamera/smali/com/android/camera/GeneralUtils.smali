.class public Lcom/android/camera/GeneralUtils;
.super Ljava/lang/Object;
.source "GeneralUtils.java"


# static fields
.field public static final STREET_SNAP_CHANNEL_ID:Ljava/lang/String; = "com.android.camera.streetsnap"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static applyNotchFlag(Landroid/view/Window;)V
    .locals 1

    const/16 v0, 0x700

    invoke-virtual {p0, v0}, Landroid/view/Window;->addExtraFlags(I)V

    return-void
.end method

.method public static clearInterpolator(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method public static editModeTitleLayout()I
    .locals 1

    sget v0, Lmiui/R$layout;->edit_mode_title:I

    return v0
.end method

.method public static final isAppLocked(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    nop

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "access_control_lock_enabled"

    const/4 v2, -0x1

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    nop

    move v0, v1

    :goto_0
    if-eqz v0, :cond_2

    const-string v0, "security"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmiui/security/SecurityManager;

    invoke-virtual {p0, p1}, Lmiui/security/SecurityManager;->getApplicationAccessControlEnabled(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p0, p1}, Lmiui/security/SecurityManager;->checkAccessControlPass(Ljava/lang/String;)Z

    move-result p0

    if-eqz v0, :cond_1

    if-nez p0, :cond_1

    move v1, v2

    nop

    :cond_1
    return v1

    :cond_2
    return v1
.end method

.method public static miuiResArrayField(Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;
    .locals 1

    const-class v0, Landroid/miui/R$array;

    invoke-static {v0, p0, p1}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p0

    return-object p0
.end method

.method public static miuiResBoolField(Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;
    .locals 1

    const-class v0, Landroid/miui/R$bool;

    invoke-static {v0, p0, p1}, Lmiui/reflect/Field;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lmiui/reflect/Field;

    move-result-object p0

    return-object p0
.end method

.method public static miuiWidgetButtonDialog()I
    .locals 1

    sget v0, Lmiui/R$style;->Widget_Button_Dialog:I

    return v0
.end method

.method public static notifyForDetail(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    if-eqz p4, :cond_0

    const-string/jumbo p4, "video/*"

    goto :goto_0

    :cond_0
    const-string p4, "image/*"

    :goto_0
    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    const/4 p1, 0x0

    invoke-static {p0, p1, v0, p1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p4

    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p2

    invoke-virtual {p2, p3}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p2

    invoke-virtual {p2, p4}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p2

    const p3, 0x1080041

    invoke-virtual {p2, p3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object p2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    invoke-virtual {p2, p3, p4}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object p2

    const-string p3, "notification"

    invoke-virtual {p0, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/app/NotificationManager;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p4, 0x7f09000a

    invoke-virtual {p0, p4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    const-string p4, "com.android.camera.streetsnap"

    invoke-static {p3, p4, p0, p2}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->addChannelForNotificationBuilder(Landroid/app/NotificationManager;Ljava/lang/String;Ljava/lang/CharSequence;Landroid/app/Notification$Builder;)V

    invoke-virtual {p2}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    iget p2, p0, Landroid/app/Notification;->flags:I

    or-int/lit8 p2, p2, 0x10

    iput p2, p0, Landroid/app/Notification;->flags:I

    iget-object p2, p0, Landroid/app/Notification;->extraNotification:Landroid/app/MiuiNotification;

    invoke-virtual {p2, p1}, Landroid/app/MiuiNotification;->setMessageCount(I)V

    invoke-virtual {p3, p1, p0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    :goto_1
    return-void
.end method
