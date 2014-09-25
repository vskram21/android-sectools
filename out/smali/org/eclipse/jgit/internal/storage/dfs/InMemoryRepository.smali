.class public Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;
.super Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;
.source "InMemoryRepository.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$ByteArrayReadableChannel;,
        Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;,
        Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemPack;,
        Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;
    }
.end annotation


# static fields
.field private static final packId:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

.field private final refdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;->packId:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;)V
    .locals 1
    .parameter "repoDesc"

    .prologue
    .line 45
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$1;-><init>()V

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$1;->setRepositoryDescription(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryDescription;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepositoryBuilder;)V

    .line 52
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;

    invoke-direct {v0, p0, p0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemObjDatabase;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    .line 53
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;->refdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    .line 54
    return-void
.end method

.method static synthetic access$000()Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;->packId:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method


# virtual methods
.method public getObjectDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    return-object v0
.end method

.method public bridge synthetic getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    move-result-object v0

    return-object v0
.end method

.method public getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;->refdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    return-object v0
.end method

.method public bridge synthetic getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;
    .locals 1

    .prologue
    .line 30
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v0

    return-object v0
.end method
