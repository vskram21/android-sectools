.class public Lorg/eclipse/jgit/transport/TransferConfig;
.super Ljava/lang/Object;
.source "TransferConfig.java"


# static fields
.field public static final KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<",
            "Lorg/eclipse/jgit/transport/TransferConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final allowTipSha1InWant:Z

.field private final fetchFsck:Z

.field private final hideRefs:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    new-instance v0, Lorg/eclipse/jgit/transport/TransferConfig$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/TransferConfig$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/TransferConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 5
    .parameter "rc"

    .prologue
    const/4 v4, 0x0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    const-string v0, "fetch"

    const-string v1, "fsckobjects"

    const-string v2, "transfer"

    const-string v3, "fsckobjects"

    invoke-virtual {p1, v2, v3, v4}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/TransferConfig;->fetchFsck:Z

    .line 79
    const-string v0, "uploadpack"

    const-string v1, "allowtipsha1inwant"

    invoke-virtual {p1, v0, v1, v4}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/TransferConfig;->allowTipSha1InWant:Z

    .line 81
    const-string v0, "uploadpack"

    const/4 v1, 0x0

    const-string v2, "hiderefs"

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/TransferConfig;->hideRefs:[Ljava/lang/String;

    .line 82
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/transport/TransferConfig$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/TransferConfig;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 71
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/transport/TransferConfig;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    .line 72
    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/transport/TransferConfig;)[Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 58
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransferConfig;->hideRefs:[Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public getRefFilter()Lorg/eclipse/jgit/transport/RefFilter;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/eclipse/jgit/transport/TransferConfig;->hideRefs:[Ljava/lang/String;

    array-length v0, v0

    if-nez v0, :cond_0

    .line 105
    sget-object v0, Lorg/eclipse/jgit/transport/RefFilter;->DEFAULT:Lorg/eclipse/jgit/transport/RefFilter;

    .line 107
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/eclipse/jgit/transport/TransferConfig$2;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/TransferConfig$2;-><init>(Lorg/eclipse/jgit/transport/TransferConfig;)V

    goto :goto_0
.end method

.method public isAllowTipSha1InWant()Z
    .locals 1

    .prologue
    .line 96
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/TransferConfig;->allowTipSha1InWant:Z

    return v0
.end method

.method public isFsckObjects()Z
    .locals 1

    .prologue
    .line 88
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/TransferConfig;->fetchFsck:Z

    return v0
.end method
