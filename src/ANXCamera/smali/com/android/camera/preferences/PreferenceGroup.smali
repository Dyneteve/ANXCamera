.class public Lcom/android/camera/preferences/PreferenceGroup;
.super Lcom/android/camera/preferences/CameraPreference;
.source "PreferenceGroup.java"


# instance fields
.field private list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/camera/preferences/CameraPreference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/preferences/CameraPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera/preferences/PreferenceGroup;->list:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public addChild(Lcom/android/camera/preferences/CameraPreference;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/preferences/PreferenceGroup;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public findPreference(Ljava/lang/String;)Lcom/android/camera/preferences/ListPreference;
    .locals 3

    iget-object v0, p0, Lcom/android/camera/preferences/PreferenceGroup;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/preferences/CameraPreference;

    instance-of v2, v1, Lcom/android/camera/preferences/ListPreference;

    if-eqz v2, :cond_1

    check-cast v1, Lcom/android/camera/preferences/ListPreference;

    invoke-virtual {v1}, Lcom/android/camera/preferences/ListPreference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_0
    goto :goto_1

    :cond_1
    instance-of v2, v1, Lcom/android/camera/preferences/PreferenceGroup;

    if-eqz v2, :cond_2

    check-cast v1, Lcom/android/camera/preferences/PreferenceGroup;

    invoke-virtual {v1, p1}, Lcom/android/camera/preferences/PreferenceGroup;->findPreference(Ljava/lang/String;)Lcom/android/camera/preferences/ListPreference;

    move-result-object v1

    if-eqz v1, :cond_2

    return-object v1

    :cond_2
    :goto_1
    goto :goto_0

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method public get(I)Lcom/android/camera/preferences/CameraPreference;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/preferences/PreferenceGroup;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/preferences/CameraPreference;

    return-object p1
.end method

.method public removePreference(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/preferences/PreferenceGroup;->list:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    return-void
.end method

.method public size()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/preferences/PreferenceGroup;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
