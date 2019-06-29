.class public Landroid/support/v4/app/Person$Builder;
.super Ljava/lang/Object;
.source "Person.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/Person;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mIcon:Landroid/support/v4/graphics/drawable/IconCompat;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mIsBot:Z

.field private mIsImportant:Z

.field private mKey:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mName:Ljava/lang/CharSequence;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mUri:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Landroid/support/v4/app/Person;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Landroid/support/v4/app/Person;->access$700(Landroid/support/v4/app/Person;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/app/Person$Builder;->mName:Ljava/lang/CharSequence;

    invoke-static {p1}, Landroid/support/v4/app/Person;->access$800(Landroid/support/v4/app/Person;)Landroid/support/v4/graphics/drawable/IconCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/app/Person$Builder;->mIcon:Landroid/support/v4/graphics/drawable/IconCompat;

    invoke-static {p1}, Landroid/support/v4/app/Person;->access$900(Landroid/support/v4/app/Person;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/app/Person$Builder;->mUri:Ljava/lang/String;

    invoke-static {p1}, Landroid/support/v4/app/Person;->access$1000(Landroid/support/v4/app/Person;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v4/app/Person$Builder;->mKey:Ljava/lang/String;

    invoke-static {p1}, Landroid/support/v4/app/Person;->access$1100(Landroid/support/v4/app/Person;)Z

    move-result v0

    iput-boolean v0, p0, Landroid/support/v4/app/Person$Builder;->mIsBot:Z

    invoke-static {p1}, Landroid/support/v4/app/Person;->access$1200(Landroid/support/v4/app/Person;)Z

    move-result p1

    iput-boolean p1, p0, Landroid/support/v4/app/Person$Builder;->mIsImportant:Z

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v4/app/Person;Landroid/support/v4/app/Person$1;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v4/app/Person$Builder;-><init>(Landroid/support/v4/app/Person;)V

    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/app/Person$Builder;)Ljava/lang/CharSequence;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/app/Person$Builder;->mName:Ljava/lang/CharSequence;

    return-object p0
.end method

.method static synthetic access$100(Landroid/support/v4/app/Person$Builder;)Landroid/support/v4/graphics/drawable/IconCompat;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/app/Person$Builder;->mIcon:Landroid/support/v4/graphics/drawable/IconCompat;

    return-object p0
.end method

.method static synthetic access$200(Landroid/support/v4/app/Person$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/app/Person$Builder;->mUri:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Landroid/support/v4/app/Person$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/app/Person$Builder;->mKey:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Landroid/support/v4/app/Person$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Landroid/support/v4/app/Person$Builder;->mIsBot:Z

    return p0
.end method

.method static synthetic access$500(Landroid/support/v4/app/Person$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Landroid/support/v4/app/Person$Builder;->mIsImportant:Z

    return p0
.end method


# virtual methods
.method public build()Landroid/support/v4/app/Person;
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Landroid/support/v4/app/Person;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/support/v4/app/Person;-><init>(Landroid/support/v4/app/Person$Builder;Landroid/support/v4/app/Person$1;)V

    return-object v0
.end method

.method public setBot(Z)Landroid/support/v4/app/Person$Builder;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-boolean p1, p0, Landroid/support/v4/app/Person$Builder;->mIsBot:Z

    return-object p0
.end method

.method public setIcon(Landroid/support/v4/graphics/drawable/IconCompat;)Landroid/support/v4/app/Person$Builder;
    .locals 0
    .param p1    # Landroid/support/v4/graphics/drawable/IconCompat;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Landroid/support/v4/app/Person$Builder;->mIcon:Landroid/support/v4/graphics/drawable/IconCompat;

    return-object p0
.end method

.method public setImportant(Z)Landroid/support/v4/app/Person$Builder;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-boolean p1, p0, Landroid/support/v4/app/Person$Builder;->mIsImportant:Z

    return-object p0
.end method

.method public setKey(Ljava/lang/String;)Landroid/support/v4/app/Person$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Landroid/support/v4/app/Person$Builder;->mKey:Ljava/lang/String;

    return-object p0
.end method

.method public setName(Ljava/lang/CharSequence;)Landroid/support/v4/app/Person$Builder;
    .locals 0
    .param p1    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Landroid/support/v4/app/Person$Builder;->mName:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setUri(Ljava/lang/String;)Landroid/support/v4/app/Person$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Landroid/support/v4/app/Person$Builder;->mUri:Ljava/lang/String;

    return-object p0
.end method
