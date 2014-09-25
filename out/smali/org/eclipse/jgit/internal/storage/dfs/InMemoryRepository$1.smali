.class Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$1;
.super Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;
.source "InMemoryRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder",
        "<",
        "Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;",
        "Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$1;->build()Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;

    move-result-object v0

    return-object v0
.end method

.method public build()Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bridge synthetic build()Lorg/eclipse/jgit/lib/Repository;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$1;->build()Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;

    move-result-object v0

    return-object v0
.end method
