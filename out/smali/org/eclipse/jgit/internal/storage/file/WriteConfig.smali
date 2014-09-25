.class Lorg/eclipse/jgit/internal/storage/file/WriteConfig;
.super Ljava/lang/Object;
.source "WriteConfig.java"


# static fields
.field static final KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/WriteConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final compression:I

.field private final fsyncObjectFiles:Z

.field private final fsyncRefFiles:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/WriteConfig$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 3
    .parameter "rc"

    .prologue
    const/4 v2, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    sget-object v0, Lorg/eclipse/jgit/lib/CoreConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/lib/Config;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/CoreConfig;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/CoreConfig;->getCompression()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->compression:I

    .line 66
    const-string v0, "core"

    const-string v1, "fsyncobjectfiles"

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->fsyncObjectFiles:Z

    .line 67
    const-string v0, "core"

    const-string v1, "fsyncreffiles"

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->fsyncRefFiles:Z

    .line 68
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/internal/storage/file/WriteConfig$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    return-void
.end method


# virtual methods
.method getCompression()I
    .locals 1

    .prologue
    .line 71
    iget v0, p0, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->compression:I

    return v0
.end method

.method getFSyncObjectFiles()Z
    .locals 1

    .prologue
    .line 75
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->fsyncObjectFiles:Z

    return v0
.end method

.method getFSyncRefFiles()Z
    .locals 1

    .prologue
    .line 79
    iget-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->fsyncRefFiles:Z

    return v0
.end method
