.class public Lorg/eclipse/jgit/lib/CoreConfig;
.super Ljava/lang/Object;
.source "CoreConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;,
        Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;,
        Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;
    }
.end annotation


# static fields
.field public static final KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<",
            "Lorg/eclipse/jgit/lib/CoreConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final compression:I

.field private final excludesfile:Ljava/lang/String;

.field private final logAllRefUpdates:Z

.field private final packIndexVersion:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    new-instance v0, Lorg/eclipse/jgit/lib/CoreConfig$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/CoreConfig$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/lib/CoreConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 3
    .parameter "rc"

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    const-string v0, "core"

    const-string v1, "compression"

    const/4 v2, -0x1

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/CoreConfig;->compression:I

    .line 119
    const-string v0, "pack"

    const-string v1, "indexversion"

    const/4 v2, 0x2

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/lib/CoreConfig;->packIndexVersion:I

    .line 121
    const-string v0, "core"

    const-string v1, "logallrefupdates"

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/CoreConfig;->logAllRefUpdates:Z

    .line 123
    const-string v0, "core"

    const/4 v1, 0x0

    const-string v2, "excludesfile"

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/CoreConfig;->excludesfile:Ljava/lang/String;

    .line 125
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/lib/CoreConfig$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/CoreConfig;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    return-void
.end method


# virtual methods
.method public getCompression()I
    .locals 1

    .prologue
    .line 131
    iget v0, p0, Lorg/eclipse/jgit/lib/CoreConfig;->compression:I

    return v0
.end method

.method public getExcludesFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lorg/eclipse/jgit/lib/CoreConfig;->excludesfile:Ljava/lang/String;

    return-object v0
.end method

.method public getPackIndexVersion()I
    .locals 1

    .prologue
    .line 138
    iget v0, p0, Lorg/eclipse/jgit/lib/CoreConfig;->packIndexVersion:I

    return v0
.end method

.method public isLogAllRefUpdates()Z
    .locals 1

    .prologue
    .line 145
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/CoreConfig;->logAllRefUpdates:Z

    return v0
.end method
