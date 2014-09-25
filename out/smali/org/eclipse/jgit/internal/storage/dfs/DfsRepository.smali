.class public abstract Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;
.super Lorg/eclipse/jgit/lib/Repository;
.source "DfsRepository.java"


# instance fields
.field private final config:Lorg/eclipse/jgit/internal/storage/dfs/DfsConfig;

.field private final description:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;)V
    .locals 1
    .parameter "builder"

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/Repository;-><init>(Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;)V

    .line 70
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsConfig;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsConfig;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->config:Lorg/eclipse/jgit/internal/storage/dfs/DfsConfig;

    .line 71
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->getRepositoryDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->description:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    .line 72
    return-void
.end method


# virtual methods
.method public create(Z)V
    .locals 7
    .parameter "bare"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 98
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 99
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->repositoryAlreadyExists:Ljava/lang/String;

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, ""

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 102
    :cond_0
    const-string v0, "refs/heads/master"

    .line 103
    .local v0, master:Ljava/lang/String;
    const-string v2, "HEAD"

    invoke-virtual {p0, v2, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->updateRef(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/lib/RefUpdate;->link(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v1

    .line 104
    .local v1, result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    sget-object v2, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    if-eq v1, v2, :cond_1

    .line 105
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->name()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 106
    :cond_1
    return-void
.end method

.method public exists()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->exists()Z

    move-result v0

    return v0
.end method

.method public getConfig()Lorg/eclipse/jgit/lib/StoredConfig;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->config:Lorg/eclipse/jgit/internal/storage/dfs/DfsConfig;

    return-object v0
.end method

.method public getDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->description:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    return-object v0
.end method

.method public abstract getObjectDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;
.end method

.method public bridge synthetic getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    move-result-object v0

    return-object v0
.end method

.method public abstract getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;
.end method

.method public bridge synthetic getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;
    .locals 1

    .prologue
    .line 57
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v0

    return-object v0
.end method

.method public getReflogReader(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ReflogReader;
    .locals 1
    .parameter "refName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public notifyIndexChanged()V
    .locals 0

    .prologue
    .line 123
    return-void
.end method

.method public scanForRepoChanges()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->clearCache()V

    .line 116
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->clearCache()V

    .line 117
    return-void
.end method
