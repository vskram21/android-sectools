.class public Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
.super Ljava/lang/Object;
.source "BaseRepositoryBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<B:",
        "Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;",
        "R:",
        "Lorg/eclipse/jgit/lib/Repository;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private alternateObjectDirectories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private bare:Z

.field private ceilingDirectories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private config:Lorg/eclipse/jgit/lib/Config;

.field private fs:Lorg/eclipse/jgit/util/FS;

.field private gitDir:Ljava/io/File;

.field private indexFile:Ljava/io/File;

.field private mustExist:Z

.field private objectDirectory:Ljava/io/File;

.field private workTree:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 89
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getSymRef(Ljava/io/File;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Ljava/io/File;
    .locals 10
    .parameter "workTree"
    .parameter "dotGit"
    .parameter "fs"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v9, 0x0

    .line 105
    invoke-static {p1}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;)[B

    move-result-object v0

    .line 106
    .local v0, content:[B
    invoke-static {v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->isSymRef([B)Z

    move-result v5

    if-nez v5, :cond_0

    .line 107
    new-instance v5, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->invalidGitdirRef:Ljava/lang/String;

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 110
    :cond_0
    const/16 v4, 0x8

    .line 111
    .local v4, pathStart:I
    invoke-static {v0, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v3

    .line 112
    .local v3, lineEnd:I
    add-int/lit8 v5, v3, -0x1

    aget-byte v5, v0, v5

    const/16 v6, 0xa

    if-ne v5, v6, :cond_1

    .line 113
    add-int/lit8 v3, v3, -0x1

    .line 114
    :cond_1
    if-ne v3, v4, :cond_2

    .line 115
    new-instance v5, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->invalidGitdirRef:Ljava/lang/String;

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 118
    :cond_2
    invoke-static {v0, v4, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v2

    .line 119
    .local v2, gitdirPath:Ljava/lang/String;
    invoke-virtual {p2, p0, v2}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 120
    .local v1, gitdirFile:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isAbsolute()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 123
    .end local v1           #gitdirFile:Ljava/io/File;
    :goto_0
    return-object v1

    .restart local v1       #gitdirFile:Ljava/io/File;
    :cond_3
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v1

    goto :goto_0
.end method

.method private guessWorkTreeOrFail()Ljava/io/File;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    const/4 v2, 0x0

    .line 691
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getConfig()Lorg/eclipse/jgit/lib/Config;

    move-result-object v0

    .line 695
    .local v0, cfg:Lorg/eclipse/jgit/lib/Config;
    const-string v3, "core"

    const-string v4, "worktree"

    invoke-virtual {v0, v3, v2, v4}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 697
    .local v1, path:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 698
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->safeFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v2

    .line 721
    :goto_0
    return-object v2

    .line 703
    :cond_0
    const-string v3, "core"

    const-string v4, "bare"

    invoke-virtual {v0, v3, v2, v4}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 704
    const-string v3, "core"

    const-string v4, "bare"

    const/4 v5, 0x1

    invoke-virtual {v0, v3, v4, v5}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 705
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setBare()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    goto :goto_0

    .line 708
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    goto :goto_0

    .line 711
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, ".git"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 715
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    goto :goto_0

    .line 720
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setBare()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    goto :goto_0
.end method

.method private static isSymRef([B)Z
    .locals 5
    .parameter "ref"

    .prologue
    const/16 v4, 0x69

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 91
    array-length v2, p0

    const/16 v3, 0x9

    if-ge v2, v3, :cond_0

    .line 93
    :goto_0
    return v1

    :cond_0
    aget-byte v2, p0, v1

    const/16 v3, 0x67

    if-ne v2, v3, :cond_1

    aget-byte v2, p0, v0

    if-ne v2, v4, :cond_1

    const/4 v2, 0x2

    aget-byte v2, p0, v2

    const/16 v3, 0x74

    if-ne v2, v3, :cond_1

    const/4 v2, 0x3

    aget-byte v2, p0, v2

    const/16 v3, 0x64

    if-ne v2, v3, :cond_1

    const/4 v2, 0x4

    aget-byte v2, p0, v2

    if-ne v2, v4, :cond_1

    const/4 v2, 0x5

    aget-byte v2, p0, v2

    const/16 v3, 0x72

    if-ne v2, v3, :cond_1

    const/4 v2, 0x6

    aget-byte v2, p0, v2

    const/16 v3, 0x3a

    if-ne v2, v3, :cond_1

    const/4 v2, 0x7

    aget-byte v2, p0, v2

    const/16 v3, 0x20

    if-ne v2, v3, :cond_1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_1
    move v0, v1

    goto :goto_1
.end method


# virtual methods
.method public addAlternateObjectDirectories(Ljava/util/Collection;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/io/File;",
            ">;)TB;"
        }
    .end annotation

    .prologue
    .line 238
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    .local p1, inList:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/io/File;>;"
    if-eqz p1, :cond_0

    .line 239
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 240
    .local v1, path:Ljava/io/File;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->addAlternateObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    goto :goto_0

    .line 242
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #path:Ljava/io/File;
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v2

    return-object v2
.end method

.method public addAlternateObjectDirectories([Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 5
    .parameter "inList"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/io/File;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 257
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    if-eqz p1, :cond_0

    .line 258
    move-object v0, p1

    .local v0, arr$:[Ljava/io/File;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 259
    .local v3, path:Ljava/io/File;
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->addAlternateObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 258
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 261
    .end local v0           #arr$:[Ljava/io/File;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #path:Ljava/io/File;
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v4

    return-object v4
.end method

.method public addAlternateObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "other"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 218
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    if-eqz p1, :cond_1

    .line 219
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->alternateObjectDirectories:Ljava/util/List;

    if-nez v0, :cond_0

    .line 220
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->alternateObjectDirectories:Ljava/util/List;

    .line 221
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->alternateObjectDirectories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 223
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public addCeilingDirectories(Ljava/util/Collection;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/io/File;",
            ">;)TB;"
        }
    .end annotation

    .prologue
    .line 449
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    .local p1, inList:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/io/File;>;"
    if-eqz p1, :cond_0

    .line 450
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 451
    .local v1, path:Ljava/io/File;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->addCeilingDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    goto :goto_0

    .line 453
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #path:Ljava/io/File;
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v2

    return-object v2
.end method

.method public addCeilingDirectories([Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 5
    .parameter "inList"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/io/File;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 468
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    if-eqz p1, :cond_0

    .line 469
    move-object v0, p1

    .local v0, arr$:[Ljava/io/File;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 470
    .local v3, path:Ljava/io/File;
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->addCeilingDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 469
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 472
    .end local v0           #arr$:[Ljava/io/File;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #path:Ljava/io/File;
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v4

    return-object v4
.end method

.method public addCeilingDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "root"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 429
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    if-eqz p1, :cond_1

    .line 430
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->ceilingDirectories:Ljava/util/List;

    if-nez v0, :cond_0

    .line 431
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->ceilingDirectories:Ljava/util/List;

    .line 432
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->ceilingDirectories:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 434
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public build()Lorg/eclipse/jgit/lib/Repository;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 573
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setup()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;-><init>(Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;)V

    .line 574
    .local v0, repo:Lorg/eclipse/jgit/lib/Repository;,"TR;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->isMustExist()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectDatabase;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 575
    new-instance v1, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/io/File;)V

    throw v1

    .line 576
    :cond_0
    return-object v0
.end method

.method public findGitDir()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TB;"
        }
    .end annotation

    .prologue
    .line 489
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    .line 490
    new-instance v0, Ljava/io/File;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->findGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 491
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public findGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 3
    .parameter "current"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 510
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v2

    if-nez v2, :cond_1

    .line 511
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->safeFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v1

    .line 512
    .local v1, tryFS:Lorg/eclipse/jgit/util/FS;
    :cond_0
    if-eqz p1, :cond_1

    .line 513
    new-instance v0, Ljava/io/File;

    const-string v2, ".git"

    invoke-direct {v0, p1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 514
    .local v0, dir:Ljava/io/File;
    invoke-static {v0, v1}, Lorg/eclipse/jgit/lib/RepositoryCache$FileKey;->isGitRepository(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 515
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 531
    .end local v0           #dir:Ljava/io/File;
    .end local v1           #tryFS:Lorg/eclipse/jgit/util/FS;
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v2

    return-object v2

    .line 517
    .restart local v0       #dir:Ljava/io/File;
    .restart local v1       #tryFS:Lorg/eclipse/jgit/util/FS;
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 519
    :try_start_0
    invoke-static {p1, v0, v1}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getSymRef(Ljava/io/File;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 521
    :catch_0
    move-exception v2

    .line 525
    :cond_3
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    .line 526
    if-eqz p1, :cond_0

    iget-object v2, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->ceilingDirectories:Ljava/util/List;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->ceilingDirectories:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method

.method public getAlternateObjectDirectories()[Ljava/io/File;
    .locals 2

    .prologue
    .line 266
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->alternateObjectDirectories:Ljava/util/List;

    .line 267
    .local v0, alts:Ljava/util/List;,"Ljava/util/List<Ljava/io/File;>;"
    if-nez v0, :cond_0

    .line 268
    const/4 v1, 0x0

    .line 269
    :goto_0
    return-object v1

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/io/File;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/io/File;

    goto :goto_0
.end method

.method protected getConfig()Lorg/eclipse/jgit/lib/Config;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 654
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->config:Lorg/eclipse/jgit/lib/Config;

    if-nez v0, :cond_0

    .line 655
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->loadConfig()Lorg/eclipse/jgit/lib/Config;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->config:Lorg/eclipse/jgit/lib/Config;

    .line 656
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->config:Lorg/eclipse/jgit/lib/Config;

    return-object v0
.end method

.method public getFS()Lorg/eclipse/jgit/util/FS;
    .locals 1

    .prologue
    .line 164
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->fs:Lorg/eclipse/jgit/util/FS;

    return-object v0
.end method

.method public getGitDir()Ljava/io/File;
    .locals 1

    .prologue
    .line 186
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->gitDir:Ljava/io/File;

    return-object v0
.end method

.method public getIndexFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 345
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->indexFile:Ljava/io/File;

    return-object v0
.end method

.method public getObjectDirectory()Ljava/io/File;
    .locals 1

    .prologue
    .line 204
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->objectDirectory:Ljava/io/File;

    return-object v0
.end method

.method public getWorkTree()Ljava/io/File;
    .locals 1

    .prologue
    .line 324
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->workTree:Ljava/io/File;

    return-object v0
.end method

.method public isBare()Z
    .locals 1

    .prologue
    .line 289
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->bare:Z

    return v0
.end method

.method public isMustExist()Z
    .locals 1

    .prologue
    .line 307
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->mustExist:Z

    return v0
.end method

.method protected loadConfig()Lorg/eclipse/jgit/lib/Config;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 670
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 675
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->safeFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v4

    const-string v5, "config"

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 676
    .local v2, path:Ljava/io/File;
    new-instance v0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->safeFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 678
    .local v0, cfg:Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    :try_start_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->load()V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_0 .. :try_end_0} :catch_0

    .line 686
    .end local v0           #cfg:Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    .end local v2           #path:Ljava/io/File;
    :goto_0
    return-object v0

    .line 679
    .restart local v0       #cfg:Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    .restart local v2       #path:Ljava/io/File;
    :catch_0
    move-exception v1

    .line 680
    .local v1, err:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->repositoryConfigFileInvalid:Ljava/lang/String;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual {v1}, Lorg/eclipse/jgit/errors/ConfigInvalidException;->getMessage()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 686
    .end local v0           #cfg:Lorg/eclipse/jgit/storage/file/FileBasedConfig;
    .end local v1           #err:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    .end local v2           #path:Ljava/io/File;
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/lib/Config;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/Config;-><init>()V

    goto :goto_0
.end method

.method public readEnvironment()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TB;"
        }
    .end annotation

    .prologue
    .line 359
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->readEnvironment(Lorg/eclipse/jgit/util/SystemReader;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public readEnvironment(Lorg/eclipse/jgit/util/SystemReader;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 6
    .parameter "sr"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/SystemReader;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 375
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v5

    if-nez v5, :cond_0

    .line 376
    const-string v5, "GIT_DIR"

    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 377
    .local v4, val:Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 378
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 381
    .end local v4           #val:Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getObjectDirectory()Ljava/io/File;

    move-result-object v5

    if-nez v5, :cond_1

    .line 382
    const-string v5, "GIT_OBJECT_DIRECTORY"

    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 383
    .restart local v4       #val:Ljava/lang/String;
    if-eqz v4, :cond_1

    .line 384
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 387
    .end local v4           #val:Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getAlternateObjectDirectories()[Ljava/io/File;

    move-result-object v5

    if-nez v5, :cond_2

    .line 388
    const-string v5, "GIT_ALTERNATE_OBJECT_DIRECTORIES"

    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 389
    .restart local v4       #val:Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 390
    sget-object v5, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    .line 391
    .local v3, path:Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->addAlternateObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 390
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 395
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #path:Ljava/lang/String;
    .end local v4           #val:Ljava/lang/String;
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getWorkTree()Ljava/io/File;

    move-result-object v5

    if-nez v5, :cond_3

    .line 396
    const-string v5, "GIT_WORK_TREE"

    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 397
    .restart local v4       #val:Ljava/lang/String;
    if-eqz v4, :cond_3

    .line 398
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setWorkTree(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 401
    .end local v4           #val:Ljava/lang/String;
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getIndexFile()Ljava/io/File;

    move-result-object v5

    if-nez v5, :cond_4

    .line 402
    const-string v5, "GIT_INDEX_FILE"

    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 403
    .restart local v4       #val:Ljava/lang/String;
    if-eqz v4, :cond_4

    .line 404
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setIndexFile(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 407
    .end local v4           #val:Ljava/lang/String;
    :cond_4
    iget-object v5, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->ceilingDirectories:Ljava/util/List;

    if-nez v5, :cond_5

    .line 408
    const-string v5, "GIT_CEILING_DIRECTORIES"

    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 409
    .restart local v4       #val:Ljava/lang/String;
    if-eqz v4, :cond_5

    .line 410
    sget-object v5, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .restart local v0       #arr$:[Ljava/lang/String;
    array-length v2, v0

    .restart local v2       #len$:I
    const/4 v1, 0x0

    .restart local v1       #i$:I
    :goto_1
    if-ge v1, v2, :cond_5

    aget-object v3, v0, v1

    .line 411
    .restart local v3       #path:Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v5}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->addCeilingDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 410
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 415
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #path:Ljava/lang/String;
    .end local v4           #val:Ljava/lang/String;
    :cond_5
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v5

    return-object v5
.end method

.method protected requireGitDirOrWorkTree()V
    .locals 2

    .prologue
    .line 581
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getWorkTree()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    .line 582
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->eitherGitDirOrWorkTreeRequired:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 584
    :cond_0
    return-void
.end method

.method protected safeFS()Lorg/eclipse/jgit/util/FS;
    .locals 1

    .prologue
    .line 726
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    goto :goto_0
.end method

.method protected final self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TB;"
        }
    .end annotation

    .prologue
    .line 732
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    return-object p0
.end method

.method public setBare()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TB;"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    const/4 v0, 0x0

    .line 281
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setIndexFile(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 282
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setWorkTree(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 283
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->bare:Z

    .line 284
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setFS(Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "fs"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/util/FS;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->fs:Lorg/eclipse/jgit/util/FS;

    .line 159
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "gitDir"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 179
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->gitDir:Ljava/io/File;

    .line 180
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->config:Lorg/eclipse/jgit/lib/Config;

    .line 181
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setIndexFile(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "indexFile"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 339
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->indexFile:Ljava/io/File;

    .line 340
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setMustExist(Z)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "mustExist"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TB;"
        }
    .end annotation

    .prologue
    .line 301
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iput-boolean p1, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->mustExist:Z

    .line 302
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "objectDirectory"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 198
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->objectDirectory:Ljava/io/File;

    .line 199
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setWorkTree(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "workTree"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 318
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->workTree:Ljava/io/File;

    .line 319
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setup()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TB;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 550
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->requireGitDirOrWorkTree()V

    .line 551
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setupGitDir()V

    .line 552
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setupWorkTree()V

    .line 553
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setupInternals()V

    .line 554
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected setupGitDir()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 595
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getWorkTree()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 596
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getWorkTree()Ljava/io/File;

    move-result-object v1

    const-string v2, ".git"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 597
    .local v0, dotGit:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_1

    .line 598
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 602
    .end local v0           #dotGit:Ljava/io/File;
    :cond_0
    :goto_0
    return-void

    .line 600
    .restart local v0       #dotGit:Ljava/io/File;
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getWorkTree()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->safeFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getSymRef(Ljava/io/File;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    goto :goto_0
.end method

.method protected setupInternals()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 642
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getObjectDirectory()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 643
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->safeFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "objects"

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 644
    :cond_0
    return-void
.end method

.method protected setupWorkTree()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 615
    .local p0, this:Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;,"Lorg/eclipse/jgit/lib/BaseRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v0

    if-nez v0, :cond_0

    .line 616
    sget-object v0, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setFS(Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 620
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->isBare()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getWorkTree()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_1

    .line 621
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->guessWorkTreeOrFail()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setWorkTree(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 623
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->isBare()Z

    move-result v0

    if-nez v0, :cond_3

    .line 628
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_2

    .line 629
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getWorkTree()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 630
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getIndexFile()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_3

    .line 631
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "index"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setIndexFile(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 633
    :cond_3
    return-void
.end method
