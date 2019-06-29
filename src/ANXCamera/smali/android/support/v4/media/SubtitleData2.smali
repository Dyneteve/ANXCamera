.class public final Landroid/support/v4/media/SubtitleData2;
.super Ljava/lang/Object;
.source "SubtitleData2.java"


# static fields
.field public static final MIMETYPE_TEXT_CEA_608:Ljava/lang/String; = "text/cea-608"

.field public static final MIMETYPE_TEXT_CEA_708:Ljava/lang/String; = "text/cea-708"

.field public static final MIMETYPE_TEXT_VTT:Ljava/lang/String; = "text/vtt"

.field private static final TAG:Ljava/lang/String; = "SubtitleData2"


# instance fields
.field private mData:[B

.field private mDurationUs:J

.field private mStartTimeUs:J

.field private mTrackIndex:I


# direct methods
.method public constructor <init>(IJJ[B)V
    .locals 0
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroid/support/v4/media/SubtitleData2;->mTrackIndex:I

    iput-wide p2, p0, Landroid/support/v4/media/SubtitleData2;->mStartTimeUs:J

    iput-wide p4, p0, Landroid/support/v4/media/SubtitleData2;->mDurationUs:J

    iput-object p6, p0, Landroid/support/v4/media/SubtitleData2;->mData:[B

    return-void
.end method

.method public constructor <init>(Landroid/media/SubtitleData;)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1c
    .end annotation

    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/media/SubtitleData;->getTrackIndex()I

    move-result v0

    iput v0, p0, Landroid/support/v4/media/SubtitleData2;->mTrackIndex:I

    invoke-virtual {p1}, Landroid/media/SubtitleData;->getStartTimeUs()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/support/v4/media/SubtitleData2;->mStartTimeUs:J

    invoke-virtual {p1}, Landroid/media/SubtitleData;->getDurationUs()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/support/v4/media/SubtitleData2;->mDurationUs:J

    invoke-virtual {p1}, Landroid/media/SubtitleData;->getData()[B

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/media/SubtitleData2;->mData:[B

    return-void
.end method


# virtual methods
.method public getData()[B
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/SubtitleData2;->mData:[B

    return-object v0
.end method

.method public getDurationUs()J
    .locals 2

    iget-wide v0, p0, Landroid/support/v4/media/SubtitleData2;->mDurationUs:J

    return-wide v0
.end method

.method public getStartTimeUs()J
    .locals 2

    iget-wide v0, p0, Landroid/support/v4/media/SubtitleData2;->mStartTimeUs:J

    return-wide v0
.end method

.method public getTrackIndex()I
    .locals 1

    iget v0, p0, Landroid/support/v4/media/SubtitleData2;->mTrackIndex:I

    return v0
.end method
