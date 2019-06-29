.class public interface abstract annotation Landroidx/versionedparcelable/h;
.super Ljava/lang/Object;
.source "VersionedParcelize.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Landroidx/versionedparcelable/h;
        A = false
        B = false
        C = false
        D = {}
        E = ""
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract A()Z
.end method

.method public abstract B()Z
.end method

.method public abstract C()Z
.end method

.method public abstract D()[I
.end method

.method public abstract E()Ljava/lang/String;
.end method
