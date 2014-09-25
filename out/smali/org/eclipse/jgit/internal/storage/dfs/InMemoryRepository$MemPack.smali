.class Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;
.super Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
.source "InMemoryRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MemPack"
.end annotation


# instance fields
.field private final fileMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackExt;",
            "[B>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;)V
    .locals 1
    .parameter "name"
    .parameter "repoDesc"

    .prologue
    .line 133
    invoke-direct {p0, p2, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;Ljava/lang/String;)V

    .line 129
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;->fileMap:Ljava/util/Map;

    .line 134
    return-void
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;)Ljava/util/Map;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;->fileMap:Ljava/util/Map;

    return-object v0
.end method
