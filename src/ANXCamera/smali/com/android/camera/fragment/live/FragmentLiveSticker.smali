.class public Lcom/android/camera/fragment/live/FragmentLiveSticker;
.super Lcom/android/camera/fragment/live/FragmentLiveBase;
.source "FragmentLiveSticker.java"

# interfaces
.implements Lcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;
    }
.end annotation


# static fields
.field private static final FRAGMENT_INFO:I = 0xffc

.field private static final MAIN_URI:Ljava/lang/String; = "snssdk1128://feed/"

.field private static final MARKET_URI:Ljava/lang/String; = "market://details?id=com.ss.android.ugc.aweme&back=true&ref=camera&startDownload=false"

.field private static final MIN_SUPPORT_VERSION:I = 0x140

.field private static final MORE_URI:Ljava/lang/String; = "snssdk1128://openRecord/?recordOrigin=system&recordParam=withStickerPanel&gd_label=open_camera&label="

.field private static final PACKAGE_NAME:Ljava/lang/String; = "com.ss.android.ugc.aweme"

.field private static final STICKER_ITEM_SIZE:I = 0xa

.field private static final TAG:Ljava/lang/String; = "FragmentLiveSticker"

.field private static final sLocalStickerList:[Lcom/android/camera/sticker/LiveStickerInfo;

.field private static final sMoreSticker:Lcom/android/camera/sticker/LiveStickerInfo;

.field private static final sNoneSticker:Lcom/android/camera/sticker/LiveStickerInfo;

.field private static sPersistStickerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

.field private mDownloadHelper:Lcom/android/camera/network/resource/LiveDownloadHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/camera/network/resource/LiveDownloadHelper<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloadListener:Lcom/android/camera/network/resource/OnLiveDownloadListener;

.field mFutureSelectIndex:I

.field private mItemWidth:I

.field private mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

.field private mNoneItemView:Landroid/view/View;

.field private mNoneSelectView:Landroid/view/View;

.field private mRootView:Landroid/view/View;

.field mSelectIndex:I

.field private mStickerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mStickerListView:Landroid/support/v7/widget/RecyclerView;

.field private mTotalWidth:I

.field private mUpdatingView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/camera/sticker/LiveStickerInfo;

    new-instance v1, Lcom/android/camera/sticker/LiveStickerInfo;

    const-string v2, "\u7626\u8eab"

    const-string v3, "0eb0e0214f7bc7f7bbfb4e9f4dba7f99"

    const-string v4, "f2e24fea41e33a1c0fc9a79b8d3b91e2.png"

    const-string v5, "\u4fdd\u6301\u5168\u8eab\u5728\u753b\u9762\u4e2d\u54e6"

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/sticker/LiveStickerInfo;

    const-string v2, "\u661f\u7a7a\u55b5"

    const-string v3, "a75682e81788cc12f68682b9c9067f70"

    const-string v4, "8ca064318882fa610f4623b852accd36.png"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/android/camera/sticker/LiveStickerInfo;

    const-string v2, "\u6d6e\u751f\u82e5\u68a6"

    const-string v3, "24991e783f23920397ac8aeed15994c2"

    const-string v4, "e42237f75eeff4e5162f9b0130492e36.png"

    invoke-direct {v1, v2, v3, v4}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sput-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sLocalStickerList:[Lcom/android/camera/sticker/LiveStickerInfo;

    new-instance v0, Lcom/android/camera/sticker/LiveStickerInfo;

    const-string v1, ""

    const-string v2, ""

    const-string v3, "off.png"

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sNoneSticker:Lcom/android/camera/sticker/LiveStickerInfo;

    new-instance v0, Lcom/android/camera/sticker/LiveStickerInfo;

    const-string v1, ""

    const-string v2, ""

    const v3, 0x7f020134

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/sticker/LiveStickerInfo;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    sput-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sMoreSticker:Lcom/android/camera/sticker/LiveStickerInfo;

    new-instance v0, Ljava/util/ArrayList;

    sget-object v1, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sLocalStickerList:[Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sPersistStickerList:Ljava/util/List;

    sget-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sPersistStickerList:Ljava/util/List;

    sget-object v1, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sMoreSticker:Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveBase;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    sget-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sPersistStickerList:Ljava/util/List;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    new-instance v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$7;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$7;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mDownloadListener:Lcom/android/camera/network/resource/OnLiveDownloadListener;

    new-instance v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$8;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$8;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mDownloadHelper:Lcom/android/camera/network/resource/LiveDownloadHelper;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/live/FragmentLiveSticker;)Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/live/FragmentLiveSticker;Ljava/util/List;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->updateStickerList(Ljava/util/List;)V

    return-void
.end method

.method static synthetic access$200()[Lcom/android/camera/sticker/LiveStickerInfo;
    .locals 1

    sget-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sLocalStickerList:[Lcom/android/camera/sticker/LiveStickerInfo;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/live/FragmentLiveSticker;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->showNetworkErrorHint()V

    return-void
.end method

.method private reload()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mUpdatingView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->setSelectIndex(I)V

    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->updateData()V

    return-void
.end method

.method private scrollIfNeed(I)Z
    .locals 4

    nop

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findFirstVisibleItemPosition()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq p1, v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    move v0, p1

    goto :goto_2

    :cond_2
    :goto_0
    add-int/lit8 v0, p1, 0x1

    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v3}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->getItemCount()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_2

    :cond_3
    :goto_1
    add-int/lit8 v0, p1, -0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    :goto_2
    if-eq v0, p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->scrollToPosition(I)V

    return v2

    :cond_4
    return v1
.end method

.method private setItemInCenter(I)V
    .locals 2

    iget v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mTotalWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mItemWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v1, p1, v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->scrollToPositionWithOffset(II)V

    return-void
.end method

.method private showNetworkErrorHint()V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f090235

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x50

    invoke-static {v0, v1, v2}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method

.method private updateData()V
    .locals 4

    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveStickerInternalChannel()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isLiveStickerInternalChannel()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "local_test"

    goto :goto_0

    :cond_0
    const-string v1, "default"

    :goto_0
    new-instance v2, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;

    const-string v3, "default"

    invoke-direct {v2, v1, v3}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveSticker$6;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$6;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V

    invoke-virtual {v2, v0, v1}, Lcom/android/camera/network/live/TTLiveStickerResourceRequest;->execute(ZLcom/android/camera/network/net/base/ResponseListener;)V

    return-void
.end method

.method private updateStickerList(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    sget-object v1, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sLocalStickerList:[Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    sget-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sMoreSticker:Lcom/android/camera/sticker/LiveStickerInfo;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    sput-object p1, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sPersistStickerList:Ljava/util/List;

    :cond_0
    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSticker()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    move v2, v1

    :goto_0
    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v2, v3, :cond_2

    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/sticker/LiveStickerInfo;

    iget-object v3, v3, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iput v2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mNoneSelectView:Landroid/view/View;

    iget v2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    const/16 v3, 0x8

    if-ne v2, p1, :cond_3

    move p1, v1

    goto :goto_2

    :cond_3
    move p1, v3

    :goto_2
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iget v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->setSelectIndex(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyDataSetChanged()V

    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->setItemInCenter(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mUpdatingView:Landroid/view/View;

    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xffc

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f040026

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 7

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mRootView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a011e

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mItemWidth:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mTotalWidth:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result p1

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mRootView:Landroid/view/View;

    const v1, 0x7f0d008f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mUpdatingView:Landroid/view/View;

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mRootView:Landroid/view/View;

    const v1, 0x7f0d008e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mRootView:Landroid/view/View;

    const v1, 0x7f0d008c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mNoneItemView:Landroid/view/View;

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mRootView:Landroid/view/View;

    const v1, 0x7f0d008d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mNoneSelectView:Landroid/view/View;

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-static {}, Lcom/android/camera/CameraSettings;->getCurrentLiveSticker()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    move v3, v2

    :goto_0
    iget-object v4, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_1

    iget-object v4, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/sticker/LiveStickerInfo;

    iget-object v4, v4, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iput v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mNoneSelectView:Landroid/view/View;

    iget v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    if-ne v3, v0, :cond_2

    move v3, v2

    goto :goto_2

    :cond_2
    const/16 v3, 0x8

    :goto_2
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mNoneItemView:Landroid/view/View;

    new-instance v3, Lcom/android/camera/fragment/live/FragmentLiveSticker$1;

    invoke-direct {v3, p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$1;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    iget v5, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    new-instance v6, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;

    invoke-direct {v6, p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$2;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;)V

    invoke-direct {v1, v3, v4, v5, v6}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;-><init>(Landroid/content/Context;Ljava/util/List;ILandroid/widget/AdapterView$OnItemClickListener;)V

    iput-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    new-instance v1, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "live_sticker_list"

    invoke-direct {v1, v3, v4}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->setOrientation(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    new-instance v3, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;

    invoke-direct {v3, p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$3;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;Z)V

    invoke-virtual {v1, v3}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    new-instance p1, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {p1}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    const-wide/16 v3, 0x96

    invoke-virtual {p1, v3, v4}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    invoke-virtual {p1, v3, v4}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    invoke-virtual {p1, v3, v4}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    invoke-virtual {p1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setSupportsChangeAnimations(Z)V

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerListView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->setItemInCenter(I)V

    invoke-static {}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/LiveResourceDownloadManager;

    move-result-object p1

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mDownloadListener:Lcom/android/camera/network/resource/OnLiveDownloadListener;

    invoke-virtual {p1, v1}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->addDownloadListener(Lcom/android/camera/network/resource/OnLiveDownloadListener;)V

    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    if-ne p1, v0, :cond_3

    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->reload()V

    :cond_3
    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/fragment/live/FragmentLiveBase;->onDestroy()V

    invoke-static {}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/LiveResourceDownloadManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mDownloadListener:Lcom/android/camera/network/resource/OnLiveDownloadListener;

    invoke-virtual {v0, v1}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->removeDownloadListener(Lcom/android/camera/network/resource/OnLiveDownloadListener;)V

    return-void
.end method

.method protected onItemSelected(ILandroid/view/View;)V
    .locals 5

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mFutureSelectIndex:I

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mStickerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/sticker/LiveStickerInfo;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sNoneSticker:Lcom/android/camera/sticker/LiveStickerInfo;

    :goto_0
    invoke-virtual {v0}, Lcom/android/camera/sticker/LiveStickerInfo;->getDownloadState()I

    move-result v1

    const-string v2, "FragmentLiveSticker"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "select sticker "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v0, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v4, v0, Lcom/android/camera/sticker/LiveStickerInfo;->isLocal:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, v0, Lcom/android/camera/sticker/LiveStickerInfo;->url:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v2, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sMoreSticker:Lcom/android/camera/sticker/LiveStickerInfo;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v0, v2, :cond_4

    nop

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    const-string v1, "snssdk1128://openRecord/?recordOrigin=system&recordParam=withStickerPanel&gd_label=open_camera&label="

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p2, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v0, 0x10000

    invoke-virtual {p1, p2, v0}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_1

    goto :goto_1

    :cond_1
    :try_start_0
    const-string v0, "com.ss.android.ugc.aweme"

    invoke-virtual {p1, v0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    iget p1, p1, Landroid/content/pm/PackageInfo;->versionCode:I

    const/16 v0, 0x140

    if-ge p1, v0, :cond_2

    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    const-string v1, "snssdk1128://feed/"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-object p2, p1

    :cond_2
    move v3, v4

    goto :goto_1

    :catch_0
    move-exception p1

    nop

    :goto_1
    if-eqz v3, :cond_3

    new-instance p2, Landroid/content/Intent;

    const-string p1, "android.intent.action.VIEW"

    const-string v0, "market://details?id=com.ss.android.ugc.aweme&back=true&ref=camera&startDownload=false"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p2, p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    :cond_3
    invoke-static {v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveStickerMore(Z)V

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_7

    :cond_4
    iget-boolean v2, v0, Lcom/android/camera/sticker/LiveStickerInfo;->isLocal:Z

    if-nez v2, :cond_8

    const/4 v2, 0x5

    if-ne v1, v2, :cond_5

    goto :goto_3

    :cond_5
    if-eq v1, v3, :cond_7

    const/4 v2, 0x3

    if-ne v1, v2, :cond_6

    goto :goto_2

    :cond_6
    const/4 p2, 0x2

    if-eq v1, p2, :cond_f

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-static {v1, v4, p0}, Lcom/android/camera/fragment/CtaNoticeFragment;->checkCta(Landroid/app/FragmentManager;ZLcom/android/camera/fragment/CtaNoticeFragment$OnCtaNoticeClickListener;)Z

    move-result v1

    if-eqz v1, :cond_f

    iput p2, v0, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->scrollIfNeed(I)Z

    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {p2, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyItemChanged(I)V

    invoke-static {}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->getInstance()Lcom/android/camera/network/resource/LiveResourceDownloadManager;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mDownloadHelper:Lcom/android/camera/network/resource/LiveDownloadHelper;

    invoke-virtual {p1, v0, p2}, Lcom/android/camera/network/resource/LiveResourceDownloadManager;->download(Lcom/android/camera/network/resource/LiveResource;Lcom/android/camera/network/resource/LiveDownloadHelper;)V

    goto/16 :goto_7

    :cond_7
    :goto_2
    new-instance v1, Lcom/android/camera/fragment/live/FragmentLiveSticker$5;

    invoke-direct {v1, p0, v0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$5;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;Lcom/android/camera/sticker/LiveStickerInfo;)V

    invoke-static {v1}, Lio/reactivex/Completable;->fromAction(Lio/reactivex/functions/Action;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v1

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v2

    invoke-virtual {v1, v2}, Lio/reactivex/Completable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v1

    new-instance v2, Lcom/android/camera/fragment/live/FragmentLiveSticker$4;

    invoke-direct {v2, p0, v0, p1, p2}, Lcom/android/camera/fragment/live/FragmentLiveSticker$4;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker;Lcom/android/camera/sticker/LiveStickerInfo;ILandroid/view/View;)V

    invoke-virtual {v1, v2}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/CompletableObserver;)V

    goto/16 :goto_7

    :cond_8
    :goto_3
    iget p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mNoneSelectView:Landroid/view/View;

    sget-object v1, Lcom/android/camera/fragment/live/FragmentLiveSticker;->sNoneSticker:Lcom/android/camera/sticker/LiveStickerInfo;

    const/16 v2, 0x8

    if-ne v0, v1, :cond_9

    move v1, v4

    goto :goto_4

    :cond_9
    move v1, v2

    :goto_4
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iget v1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-virtual {p1, v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->setSelectIndex(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyItemChanged(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mAdapter:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iget p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyItemChanged(I)V

    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker;->mSelectIndex:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->scrollIfNeed(I)Z

    iget-object p1, v0, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    iget-object p2, v0, Lcom/android/camera/sticker/LiveStickerInfo;->name:Ljava/lang/String;

    iget-object v1, v0, Lcom/android/camera/sticker/LiveStickerInfo;->hint:Ljava/lang/String;

    invoke-static {p1, p2, v1}, Lcom/android/camera/CameraSettings;->setCurrentLiveSticker(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xb2

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;

    if-eqz p1, :cond_a

    iget-object p2, v0, Lcom/android/camera/sticker/LiveStickerInfo;->hash:Ljava/lang/String;

    invoke-interface {p1, p2}, Lcom/android/camera/protocol/ModeProtocol$StickerProtocol;->onStickerChanged(Ljava/lang/String;)V

    :cond_a
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xa6

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz p1, :cond_e

    iget-object p2, v0, Lcom/android/camera/sticker/LiveStickerInfo;->hint:Ljava/lang/String;

    if-eqz p2, :cond_b

    iget-object p2, v0, Lcom/android/camera/sticker/LiveStickerInfo;->hint:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_c

    :cond_b
    iget-object p2, v0, Lcom/android/camera/sticker/LiveStickerInfo;->hintIcon:Ljava/lang/String;

    if-eqz p2, :cond_d

    iget-object p2, v0, Lcom/android/camera/sticker/LiveStickerInfo;->hintIcon:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_c

    goto :goto_5

    :cond_c
    iget-object p2, v0, Lcom/android/camera/sticker/LiveStickerInfo;->hint:Ljava/lang/String;

    iget-object v0, v0, Lcom/android/camera/sticker/LiveStickerInfo;->hintIcon:Ljava/lang/String;

    const/16 v1, 0x1388

    invoke-interface {p1, v4, p2, v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setCenterHint(ILjava/lang/String;Ljava/lang/String;I)V

    goto :goto_6

    :cond_d
    :goto_5
    const/4 p2, 0x0

    invoke-interface {p1, v2, p2, p2, v4}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->setCenterHint(ILjava/lang/String;Ljava/lang/String;I)V

    :cond_e
    :goto_6
    nop

    :cond_f
    :goto_7
    return-void
.end method

.method public onNegativeClick(Landroid/content/DialogInterface;I)V
    .locals 0

    return-void
.end method

.method public onPositiveClick(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker;->reload()V

    return-void
.end method
