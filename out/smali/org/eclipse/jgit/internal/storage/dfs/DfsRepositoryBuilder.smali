.class public abstract Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;
.super Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
.source "DfsRepositoryBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<B:",
        "Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;",
        "R:",
        "Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;",
        ">",
        "Lorg/eclipse/jgit/lib/BaseRepositoryBuilder",
        "<TB;TR;>;"
    }
.end annotation


# instance fields
.field private readerOptions:Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

.field private repoDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAlternateObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;
    .locals 2
    .parameter "other"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 144
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Alternates not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic addAlternateObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->addAlternateObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public abstract build()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;
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
.end method

.method public bridge synthetic build()Lorg/eclipse/jgit/lib/Repository;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->build()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    move-result-object v0

    return-object v0
.end method

.method public getReaderOptions()Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;
    .locals 1

    .prologue
    .line 67
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->readerOptions:Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    return-object v0
.end method

.method public getRepositoryDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;
    .locals 1

    .prologue
    .line 84
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->repoDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    return-object v0
.end method

.method public setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;
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
    .line 130
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    if-eqz p1, :cond_0

    .line 131
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 132
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    return-object v0
.end method

.method public bridge synthetic setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setIndexFile(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;
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
    .line 156
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    if-eqz p1, :cond_0

    .line 157
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 158
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    return-object v0
.end method

.method public bridge synthetic setIndexFile(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->setIndexFile(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;
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
    .line 137
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    if-eqz p1, :cond_0

    .line 138
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 139
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    return-object v0
.end method

.method public bridge synthetic setObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->setObjectDirectory(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setReaderOptions(Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;
    .locals 1
    .parameter "opt"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->readerOptions:Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    .line 79
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    return-object v0
.end method

.method public setRepositoryDescription(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;
    .locals 1
    .parameter "desc"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;",
            ")TB;"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->repoDesc:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    .line 96
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    return-object v0
.end method

.method public setWorkTree(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;
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
    .line 149
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    if-eqz p1, :cond_0

    .line 150
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    .line 151
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    return-object v0
.end method

.method public bridge synthetic setWorkTree(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .parameter "x0"

    .prologue
    .line 59
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->setWorkTree(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method

.method public setup()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;
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
    .line 101
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    invoke-super {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;->setup()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    .line 102
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->getReaderOptions()Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    move-result-object v0

    if-nez v0, :cond_0

    .line 103
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;-><init>()V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->setReaderOptions(Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    .line 104
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->getRepositoryDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    move-result-object v0

    if-nez v0, :cond_1

    .line 105
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;-><init>()V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->setRepositoryDescription(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    .line 106
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->self()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    return-object v0
.end method

.method public bridge synthetic setup()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    .local p0, this:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;,"Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder<TB;TR;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;->setup()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    move-result-object v0

    return-object v0
.end method
