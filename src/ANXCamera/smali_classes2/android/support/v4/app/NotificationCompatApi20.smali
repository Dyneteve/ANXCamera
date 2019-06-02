.class Landroid/support/v4/app/NotificationCompatApi20;
.super Ljava/lang/Object;
.source "NotificationCompatApi20.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/NotificationCompatApi20$Builder;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addAction(Landroid/app/Notification$Builder;Landroid/support/v4/app/NotificationCompatBase$Action;)V
    .registers 7

    new-instance v0, Landroid/app/Notification$Action$Builder;

    invoke-virtual {p1}, Landroid/support/v4/app/NotificationCompatBase$Action;->getIcon()I

    move-result v1

    invoke-virtual {p1}, Landroid/support/v4/app/NotificationCompatBase$Action;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {p1}, Landroid/support/v4/app/NotificationCompatBase$Action;->getActionIntent()Landroid/app/PendingIntent;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Landroid/app/Notification$Action$Builder;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    invoke-virtual {p1}, Landroid/support/v4/app/NotificationCompatBase$Action;->getRemoteInputs()[Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;

    move-result-object v1

    if-eqz v1, :cond_2b

    invoke-virtual {p1}, Landroid/support/v4/app/NotificationCompatBase$Action;->getRemoteInputs()[Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;

    move-result-object v1

    invoke-static {v1}, Landroid/support/v4/app/RemoteInputCompatApi20;->fromCompat([Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;)[Landroid/app/RemoteInput;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_21
    if-ge v3, v2, :cond_2b

    aget-object v4, v1, v3

    invoke-virtual {v0, v4}, Landroid/app/Notification$Action$Builder;->addRemoteInput(Landroid/app/RemoteInput;)Landroid/app/Notification$Action$Builder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    :cond_2b
    invoke-virtual {p1}, Landroid/support/v4/app/NotificationCompatBase$Action;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_38

    invoke-virtual {p1}, Landroid/support/v4/app/NotificationCompatBase$Action;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Action$Builder;->addExtras(Landroid/os/Bundle;)Landroid/app/Notification$Action$Builder;

    :cond_38
    invoke-virtual {v0}, Landroid/app/Notification$Action$Builder;->build()Landroid/app/Notification$Action;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/app/Notification$Builder;->addAction(Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    return-void
.end method

.method public static getAction(Landroid/app/Notification;ILandroid/support/v4/app/NotificationCompatBase$Action$Factory;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;)Landroid/support/v4/app/NotificationCompatBase$Action;
    .registers 5

    iget-object v0, p0, Landroid/app/Notification;->actions:[Landroid/app/Notification$Action;

    aget-object v0, v0, p1

    invoke-static {v0, p2, p3}, Landroid/support/v4/app/NotificationCompatApi20;->getActionCompatFromAction(Landroid/app/Notification$Action;Landroid/support/v4/app/NotificationCompatBase$Action$Factory;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;)Landroid/support/v4/app/NotificationCompatBase$Action;

    move-result-object v0

    return-object v0
.end method

.method private static getActionCompatFromAction(Landroid/app/Notification$Action;Landroid/support/v4/app/NotificationCompatBase$Action$Factory;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;)Landroid/support/v4/app/NotificationCompatBase$Action;
    .registers 10

    invoke-virtual {p0}, Landroid/app/Notification$Action;->getRemoteInputs()[Landroid/app/RemoteInput;

    move-result-object v0

    invoke-static {v0, p2}, Landroid/support/v4/app/RemoteInputCompatApi20;->toCompat([Landroid/app/RemoteInput;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;)[Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;

    move-result-object v0

    iget v2, p0, Landroid/app/Notification$Action;->icon:I

    iget-object v3, p0, Landroid/app/Notification$Action;->title:Ljava/lang/CharSequence;

    iget-object v4, p0, Landroid/app/Notification$Action;->actionIntent:Landroid/app/PendingIntent;

    invoke-virtual {p0}, Landroid/app/Notification$Action;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    move-object v1, p1

    move-object v6, v0

    invoke-interface/range {v1 .. v6}, Landroid/support/v4/app/NotificationCompatBase$Action$Factory;->build(ILjava/lang/CharSequence;Landroid/app/PendingIntent;Landroid/os/Bundle;[Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;)Landroid/support/v4/app/NotificationCompatBase$Action;

    move-result-object v1

    return-object v1
.end method

.method private static getActionFromActionCompat(Landroid/support/v4/app/NotificationCompatBase$Action;)Landroid/app/Notification$Action;
    .registers 8

    new-instance v0, Landroid/app/Notification$Action$Builder;

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$Action;->getIcon()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$Action;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$Action;->getActionIntent()Landroid/app/PendingIntent;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Landroid/app/Notification$Action$Builder;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$Action;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Action$Builder;->addExtras(Landroid/os/Bundle;)Landroid/app/Notification$Action$Builder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompatBase$Action;->getRemoteInputs()[Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;

    move-result-object v1

    if-eqz v1, :cond_30

    invoke-static {v1}, Landroid/support/v4/app/RemoteInputCompatApi20;->fromCompat([Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput;)[Landroid/app/RemoteInput;

    move-result-object v2

    move-object v3, v2

    array-length v4, v3

    const/4 v5, 0x0

    :goto_26
    if-ge v5, v4, :cond_30

    aget-object v6, v3, v5

    invoke-virtual {v0, v6}, Landroid/app/Notification$Action$Builder;->addRemoteInput(Landroid/app/RemoteInput;)Landroid/app/Notification$Action$Builder;

    add-int/lit8 v5, v5, 0x1

    goto :goto_26

    :cond_30
    invoke-virtual {v0}, Landroid/app/Notification$Action$Builder;->build()Landroid/app/Notification$Action;

    move-result-object v2

    return-object v2
.end method

.method public static getActionsFromParcelableArrayList(Ljava/util/ArrayList;Landroid/support/v4/app/NotificationCompatBase$Action$Factory;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;)[Landroid/support/v4/app/NotificationCompatBase$Action;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/os/Parcelable;",
            ">;",
            "Landroid/support/v4/app/NotificationCompatBase$Action$Factory;",
            "Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;",
            ")[",
            "Landroid/support/v4/app/NotificationCompatBase$Action;"
        }
    .end annotation

    if-nez p0, :cond_4

    const/4 v0, 0x0

    return-object v0

    :cond_4
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-interface {p1, v0}, Landroid/support/v4/app/NotificationCompatBase$Action$Factory;->newArray(I)[Landroid/support/v4/app/NotificationCompatBase$Action;

    move-result-object v0

    const/4 v1, 0x0

    :goto_d
    array-length v2, v0

    if-ge v1, v2, :cond_1f

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Notification$Action;

    invoke-static {v2, p1, p2}, Landroid/support/v4/app/NotificationCompatApi20;->getActionCompatFromAction(Landroid/app/Notification$Action;Landroid/support/v4/app/NotificationCompatBase$Action$Factory;Landroid/support/v4/app/RemoteInputCompatBase$RemoteInput$Factory;)Landroid/support/v4/app/NotificationCompatBase$Action;

    move-result-object v3

    aput-object v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    :cond_1f
    return-object v0
.end method

.method public static getGroup(Landroid/app/Notification;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Landroid/app/Notification;->getGroup()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getLocalOnly(Landroid/app/Notification;)Z
    .registers 2

    iget v0, p0, Landroid/app/Notification;->flags:I

    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public static getParcelableArrayListForActions([Landroid/support/v4/app/NotificationCompatBase$Action;)Ljava/util/ArrayList;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/support/v4/app/NotificationCompatBase$Action;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroid/os/Parcelable;",
            ">;"
        }
    .end annotation

    if-nez p0, :cond_4

    const/4 v0, 0x0

    return-object v0

    :cond_4
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    move-object v1, p0

    array-length v2, v1

    const/4 v3, 0x0

    :goto_d
    if-ge v3, v2, :cond_1b

    aget-object v4, v1, v3

    invoke-static {v4}, Landroid/support/v4/app/NotificationCompatApi20;->getActionFromActionCompat(Landroid/support/v4/app/NotificationCompatBase$Action;)Landroid/app/Notification$Action;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    :cond_1b
    return-object v0
.end method

.method public static getSortKey(Landroid/app/Notification;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Landroid/app/Notification;->getSortKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static isGroupSummary(Landroid/app/Notification;)Z
    .registers 2

    iget v0, p0, Landroid/app/Notification;->flags:I

    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method
