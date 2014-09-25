.class public Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;
.super Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;
.source "FileRepositoryBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/lib/BaseRepositoryBuilder",
        "<",
        "Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;",
        "Lorg/eclipse/jgit/lib/Repository;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 73
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;-><init>()V

    return-void
.end method

.method public static create(Ljava/io/File;)Lorg/eclipse/jgit/lib/Repository;
    .locals 1
    .parameter "gitDir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    new-instance v0, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;

    invoke-direct {v0}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;-><init>()V

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->setGitDir(Ljava/io/File;)Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;

    invoke-virtual {v0}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->readEnvironment()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;

    invoke-virtual {v0}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->build()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public build()Lorg/eclipse/jgit/lib/Repository;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->setup()Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;-><init>(Lorg/eclipse/jgit/lib/BaseRepositoryBuilder;)V

    .line 93
    .local v0, repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;
    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->isMustExist()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 94
    new-instance v1, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileRepositoryBuilder;->getGitDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/errors/RepositoryNotFoundException;-><init>(Ljava/io/File;)V

    throw v1

    .line 95
    :cond_0
    return-object v0
.end method
