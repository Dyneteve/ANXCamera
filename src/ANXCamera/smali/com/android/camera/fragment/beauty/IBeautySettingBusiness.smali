.class public interface abstract Lcom/android/camera/fragment/beauty/IBeautySettingBusiness;
.super Ljava/lang/Object;
.source "IBeautySettingBusiness.java"

# interfaces
.implements Lcom/android/camera/fragment/beauty/IBeautyBusiness;


# virtual methods
.method public abstract clearBeauty()V
.end method

.method public abstract getDefaultProgressByCurrentItem()I
.end method

.method public abstract getProgressByCurrentItem()I
.end method

.method public abstract getSupportedTypeArray(Ljava/lang/String;)Ljava/util/List;
    .param p1    # Ljava/lang/String;
        .annotation build Lcom/android/camera/data/data/runing/ComponentRunningShine$ShineType;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;"
        }
    .end annotation
.end method

.method public abstract resetBeauty()V
.end method

.method public abstract setCurrentType(Ljava/lang/String;)V
.end method

.method public abstract setProgressForCurrentItem(I)V
.end method

.method public abstract updateExtraTable()V
.end method
