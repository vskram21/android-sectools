.class public Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;
.super Ljava/lang/Object;
.source "WorkingTreeOptions.java"


# static fields
.field public static final KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<",
            "Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final autoCRLF:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

.field private final checkStat:Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

.field private final fileMode:Z

.field private final symlinks:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    new-instance v0, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 4
    .parameter "rc"

    .prologue
    const/4 v3, 0x0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    const-string v0, "core"

    const-string v1, "filemode"

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->fileMode:Z

    .line 73
    const-string v0, "core"

    const-string v1, "autocrlf"

    sget-object v2, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->FALSE:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    invoke-virtual {p1, v0, v3, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getEnum(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->autoCRLF:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    .line 75
    const-string v0, "core"

    const-string v1, "checkstat"

    sget-object v2, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;->DEFAULT:Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    invoke-virtual {p1, v0, v3, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getEnum(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->checkStat:Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    .line 77
    const-string v0, "core"

    const-string v1, "symlinks"

    sget-object v2, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;->TRUE:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    invoke-virtual {p1, v0, v3, v1, v2}, Lorg/eclipse/jgit/lib/Config;->getEnum(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    iput-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->symlinks:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    .line 79
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/treewalk/WorkingTreeOptions$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    return-void
.end method


# virtual methods
.method public getAutoCRLF()Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->autoCRLF:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    return-object v0
.end method

.method public getCheckStat()Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->checkStat:Lorg/eclipse/jgit/lib/CoreConfig$CheckStat;

    return-object v0
.end method

.method public getSymLinks()Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->symlinks:Lorg/eclipse/jgit/lib/CoreConfig$SymLinks;

    return-object v0
.end method

.method public isFileMode()Z
    .locals 1

    .prologue
    .line 83
    iget-boolean v0, p0, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->fileMode:Z

    return v0
.end method
