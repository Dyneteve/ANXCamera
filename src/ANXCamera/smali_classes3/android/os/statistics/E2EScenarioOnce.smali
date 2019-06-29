.class public Landroid/os/statistics/E2EScenarioOnce;
.super Landroid/os/statistics/MacroscopicEvent;
.source "E2EScenarioOnce.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/statistics/MacroscopicEvent<",
        "Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;",
        ">;"
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Landroid/os/statistics/E2EScenarioOnce;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/os/statistics/E2EScenarioOnce$1;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioOnce$1;-><init>()V

    sput-object v0, Landroid/os/statistics/E2EScenarioOnce;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    new-instance v0, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;

    invoke-direct {v0}, Landroid/os/statistics/E2EScenarioOnce$E2EScenarioOnceDetails;-><init>()V

    const v1, 0x10005

    invoke-direct {p0, v1, v0}, Landroid/os/statistics/MacroscopicEvent;-><init>(ILandroid/os/statistics/PerfEvent$DetailFields;)V

    return-void
.end method
