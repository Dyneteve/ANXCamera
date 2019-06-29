.class final Landroid/support/v4/media/SessionToken2ImplLegacy;
.super Ljava/lang/Object;
.source "SessionToken2ImplLegacy.java"

# interfaces
.implements Landroid/support/v4/media/SessionToken2$SupportLibraryImpl;


# instance fields
.field private final mLegacyToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;


# direct methods
.method constructor <init>(Landroid/support/v4/media/session/MediaSessionCompat$Token;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/SessionToken2ImplLegacy;->mLegacyToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    return-void
.end method

.method public static fromBundle(Landroid/os/Bundle;)Landroid/support/v4/media/SessionToken2ImplLegacy;
    .locals 1
    .param p0    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string v0, "android.media.token.LEGACY"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    new-instance v0, Landroid/support/v4/media/SessionToken2ImplLegacy;

    invoke-static {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Token;->fromBundle(Landroid/os/Bundle;)Landroid/support/v4/media/session/MediaSessionCompat$Token;

    move-result-object p0

    invoke-direct {v0, p0}, Landroid/support/v4/media/SessionToken2ImplLegacy;-><init>(Landroid/support/v4/media/session/MediaSessionCompat$Token;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Landroid/support/v4/media/SessionToken2ImplLegacy;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    check-cast p1, Landroid/support/v4/media/SessionToken2ImplLegacy;

    iget-object v0, p0, Landroid/support/v4/media/SessionToken2ImplLegacy;->mLegacyToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    iget-object p1, p1, Landroid/support/v4/media/SessionToken2ImplLegacy;->mLegacyToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/session/MediaSessionCompat$Token;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getBinder()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/SessionToken2ImplLegacy;->mLegacyToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    return-object v0
.end method

.method public getComponentName()Landroid/content/ComponentName;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getServiceName()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getSessionId()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getUid()I
    .locals 1

    const/4 v0, -0x1

    return v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/SessionToken2ImplLegacy;->mLegacyToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    invoke-virtual {v0}, Landroid/support/v4/media/session/MediaSessionCompat$Token;->hashCode()I

    move-result v0

    return v0
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.media.token.type"

    const/16 v2, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "android.media.token.LEGACY"

    iget-object v2, p0, Landroid/support/v4/media/SessionToken2ImplLegacy;->mLegacyToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    invoke-virtual {v2}, Landroid/support/v4/media/session/MediaSessionCompat$Token;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SessionToken2 {legacyToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Landroid/support/v4/media/SessionToken2ImplLegacy;->mLegacyToken:Landroid/support/v4/media/session/MediaSessionCompat$Token;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
