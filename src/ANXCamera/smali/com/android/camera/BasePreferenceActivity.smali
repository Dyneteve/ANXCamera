.class public abstract Lcom/android/camera/BasePreferenceActivity;
.super Lmiui/preference/PreferenceActivity;
.source "BasePreferenceActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/BasePreferenceActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lmiui/preference/PreferenceActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected addPreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;Landroid/preference/Preference;)Z
    .locals 0

    invoke-virtual {p1, p2}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p1

    instance-of p2, p1, Landroid/preference/PreferenceGroup;

    if-eqz p2, :cond_0

    check-cast p1, Landroid/preference/PreferenceGroup;

    invoke-virtual {p1, p3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public changeRequestOrientation()V
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->ja()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->setRequestedOrientation(I)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->setRequestedOrientation(I)V

    :goto_0
    return-void
.end method

.method public filterUnsupportedOptions(Landroid/preference/PreferenceGroup;Lcom/android/camera/ui/PreviewListPreference;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/preference/PreferenceGroup;",
            "Lcom/android/camera/ui/PreviewListPreference;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p3, :cond_2

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2, p3}, Lcom/android/camera/ui/PreviewListPreference;->filterUnsupported(Ljava/util/List;)V

    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getEntries()[Ljava/lang/CharSequence;

    move-result-object p3

    array-length p3, p3

    if-gt p3, v1, :cond_1

    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    return-void

    :cond_1
    invoke-virtual {p0, p2}, Lcom/android/camera/BasePreferenceActivity;->resetIfInvalid(Landroid/preference/ListPreference;)V

    return-void

    :cond_2
    :goto_0
    invoke-virtual {p2}, Lcom/android/camera/ui/PreviewListPreference;->getKey()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    return-void
.end method

.method protected abstract getPreferenceXml()I
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lmiui/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/android/camera/Util;->updateDeviceConfig(Landroid/content/Context;)V

    invoke-static {}, Lcom/android/camera/preferences/CameraSettingPreferences;->instance()Lcom/android/camera/preferences/CameraSettingPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {p0}, Lcom/android/camera/BasePreferenceActivity;->changeRequestOrientation()V

    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/BasePreferenceActivity;->onSettingChanged(I)V

    iget-object v1, p0, Lcom/android/camera/BasePreferenceActivity;->mPreferences:Lcom/android/camera/preferences/CameraSettingPreferences;

    invoke-virtual {v1}, Lcom/android/camera/preferences/CameraSettingPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    instance-of v3, p2, Ljava/lang/String;

    if-eqz v3, :cond_0

    move-object v3, p2

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    :cond_0
    instance-of v3, p2, Ljava/lang/Boolean;

    if-eqz v3, :cond_1

    move-object v3, p2

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    :cond_1
    instance-of v3, p2, Ljava/lang/Integer;

    if-eqz v3, :cond_2

    move-object v3, p2

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    :cond_2
    instance-of v3, p2, Ljava/lang/Long;

    if-eqz v3, :cond_3

    move-object v3, p2

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    :cond_3
    instance-of v3, p2, Ljava/lang/Float;

    if-eqz v3, :cond_4

    move-object v3, p2

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    :goto_0
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackPreferenceChange(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lcom/android/camera/BasePreferenceActivity;->updateConflictPreference(Landroid/preference/Preference;)V

    return v0

    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "unhandled new value with type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected onSettingChanged(I)V
    .locals 1

    sget-object v0, Lcom/android/camera/CameraSettings;->sCameraChangeManager:Lcom/android/camera/ChangeManager;

    invoke-virtual {v0, p1}, Lcom/android/camera/ChangeManager;->request(I)V

    return-void
.end method

.method protected registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V
    .locals 4

    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p1, v1}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    instance-of v3, v2, Landroid/preference/PreferenceGroup;

    if-eqz v3, :cond_0

    check-cast v2, Landroid/preference/PreferenceGroup;

    invoke-virtual {p0, v2, p2}, Lcom/android/camera/BasePreferenceActivity;->registerListener(Landroid/preference/PreferenceGroup;Landroid/preference/Preference$OnPreferenceChangeListener;)V

    goto :goto_1

    :cond_0
    invoke-virtual {v2, p2}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected removeFromGroup(Landroid/preference/Preference;Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    instance-of v0, p1, Landroid/preference/PreferenceGroup;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/preference/PreferenceGroup;

    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    :cond_0
    return-void
.end method

.method protected removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z
    .locals 6

    invoke-virtual {p1, p2}, Landroid/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p1, v0}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_2

    invoke-virtual {p1, v3}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v4

    instance-of v5, v4, Landroid/preference/PreferenceGroup;

    if-eqz v5, :cond_1

    check-cast v4, Landroid/preference/PreferenceGroup;

    invoke-virtual {p0, v4, p2}, Lcom/android/camera/BasePreferenceActivity;->removePreference(Landroid/preference/PreferenceGroup;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    return v1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v2
.end method

.method protected resetIfInvalid(Landroid/preference/ListPreference;)V
    .locals 2

    invoke-virtual {p1}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/preference/ListPreference;->setValueIndex(I)V

    :cond_0
    return-void
.end method

.method protected abstract updateConflictPreference(Landroid/preference/Preference;)V
.end method

.method public updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V
    .locals 7

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_3

    invoke-virtual {p1, v2}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v3

    instance-of v4, v3, Landroid/preference/CheckBoxPreference;

    if-eqz v4, :cond_1

    move-object v4, v3

    check-cast v4, Landroid/preference/CheckBoxPreference;

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v6

    invoke-interface {p2, v5, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setPersistent(Z)V

    goto :goto_1

    :cond_1
    instance-of v4, v3, Landroid/preference/PreferenceGroup;

    if-eqz v4, :cond_2

    check-cast v3, Landroid/preference/PreferenceGroup;

    invoke-virtual {p0, v3, p2}, Lcom/android/camera/BasePreferenceActivity;->updatePreferences(Landroid/preference/PreferenceGroup;Landroid/content/SharedPreferences;)V

    goto :goto_1

    :cond_2
    sget-object v4, Lcom/android/camera/BasePreferenceActivity;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "no need update preference for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method
