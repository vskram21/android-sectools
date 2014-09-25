.class Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;
.super Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;
.source "InMemoryRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MemObjDatabase"
.end annotation


# instance fields
.field private packs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;)V
    .locals 1
    .parameter
    .parameter "repo"

    .prologue
    .line 69
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;

    .line 70
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;-><init>()V

    invoke-direct {p0, p2, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;)V

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;->packs:Ljava/util/List;

    .line 71
    return-void
.end method


# virtual methods
.method protected declared-synchronized commitPackImpl(Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, desc:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    .local p2, replace:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;->packs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 93
    .local v0, n:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 94
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;->packs:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 95
    if-eqz p2, :cond_0

    .line 96
    invoke-interface {v0, p2}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 97
    :cond_0
    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;->packs:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    monitor-exit p0

    return-void

    .line 92
    .end local v0           #n:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method protected declared-synchronized listPacks()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;->packs:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected newPack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 4
    .parameter "source"

    .prologue
    .line 80
    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;->access$000()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v1

    .line 81
    .local v1, id:I
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pack-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;->getRepository()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->getDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;)V

    .line 84
    .local v0, desc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setPackSource(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v2

    return-object v2
.end method

.method protected openFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;
    .locals 4
    .parameter "desc"
    .parameter "ext"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    move-object v1, p1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;

    .line 109
    .local v1, memPack:Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;
    #getter for: Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;->fileMap:Ljava/util/Map;
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;->access$100(Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 110
    .local v0, file:[B
    if-nez v0, :cond_0

    .line 111
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getFileName(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 112
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;

    invoke-direct {v2, v0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;-><init>([B)V

    return-object v2
.end method

.method protected rollbackPack(Ljava/util/Collection;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p1, desc:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    return-void
.end method

.method protected writeFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;
    .locals 2
    .parameter "desc"
    .parameter "ext"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    move-object v0, p1

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;

    .line 119
    .local v0, memPack:Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;
    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase$1;

    invoke-direct {v1, p0, v0, p2}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase$1;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)V

    return-object v1
.end method
