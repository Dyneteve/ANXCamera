.class interface abstract Lcom/google/android/aidl/TransactionInterceptor;
.super Ljava/lang/Object;
.source "TransactionInterceptor.java"


# virtual methods
.method public abstract interceptTransaction(Lcom/google/android/aidl/BaseStub;ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "stub",
            "code",
            "data",
            "reply",
            "flags"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
