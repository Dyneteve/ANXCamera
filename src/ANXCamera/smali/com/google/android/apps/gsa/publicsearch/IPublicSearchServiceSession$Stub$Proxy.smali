.class public Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession$Stub$Proxy;
.super Lcom/google/android/aidl/BaseProxy;
.source "IPublicSearchServiceSession.java"

# interfaces
.implements Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession$Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Proxy"
.end annotation


# direct methods
.method constructor <init>(Landroid/os/IBinder;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "remote"
        }
    .end annotation

    const-string v0, "com.google.android.apps.gsa.publicsearch.IPublicSearchServiceSession"

    invoke-direct {p0, p1, v0}, Lcom/google/android/aidl/BaseProxy;-><init>(Landroid/os/IBinder;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onGenericClientEvent([B)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "serializedClientEvent"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession$Stub$Proxy;->obtainAndWriteInterfaceToken()Landroid/os/Parcel;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeByteArray([B)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession$Stub$Proxy;->transactOneway(ILandroid/os/Parcel;)V

    return-void
.end method

.method public onGenericClientEventWithSystemParcelable([BLcom/google/android/apps/gsa/publicsearch/SystemParcelableWrapper;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "serializedClientEvent",
            "systemParcelableWrapper"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession$Stub$Proxy;->obtainAndWriteInterfaceToken()Landroid/os/Parcel;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeByteArray([B)V

    invoke-static {v0, p2}, Lcom/google/android/aidl/Codecs;->writeParcelable(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    const/4 p1, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/google/android/apps/gsa/publicsearch/IPublicSearchServiceSession$Stub$Proxy;->transactOneway(ILandroid/os/Parcel;)V

    return-void
.end method
