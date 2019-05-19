.class public Lorg/jcodec/containers/mp4/MP4Util$Movie;
.super Ljava/lang/Object;
.source "MP4Util.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jcodec/containers/mp4/MP4Util;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Movie"
.end annotation


# instance fields
.field private ftyp:Lorg/jcodec/containers/mp4/boxes/FileTypeBox;

.field private moov:Lorg/jcodec/containers/mp4/boxes/MovieBox;


# direct methods
.method public constructor <init>(Lorg/jcodec/containers/mp4/boxes/FileTypeBox;Lorg/jcodec/containers/mp4/boxes/MovieBox;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/jcodec/containers/mp4/MP4Util$Movie;->ftyp:Lorg/jcodec/containers/mp4/boxes/FileTypeBox;

    iput-object p2, p0, Lorg/jcodec/containers/mp4/MP4Util$Movie;->moov:Lorg/jcodec/containers/mp4/boxes/MovieBox;

    return-void
.end method

.method static synthetic access$000(Lorg/jcodec/containers/mp4/MP4Util$Movie;)Lorg/jcodec/containers/mp4/boxes/MovieBox;
    .locals 0

    iget-object p0, p0, Lorg/jcodec/containers/mp4/MP4Util$Movie;->moov:Lorg/jcodec/containers/mp4/boxes/MovieBox;

    return-object p0
.end method


# virtual methods
.method public getFtyp()Lorg/jcodec/containers/mp4/boxes/FileTypeBox;
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/MP4Util$Movie;->ftyp:Lorg/jcodec/containers/mp4/boxes/FileTypeBox;

    return-object v0
.end method

.method public getMoov()Lorg/jcodec/containers/mp4/boxes/MovieBox;
    .locals 1

    iget-object v0, p0, Lorg/jcodec/containers/mp4/MP4Util$Movie;->moov:Lorg/jcodec/containers/mp4/boxes/MovieBox;

    return-object v0
.end method
