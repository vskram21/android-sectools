.class Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;
.super Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;
.source "InMemoryRepository.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MemRefDatabase"
.end annotation


# instance fields
.field private final refs:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;)V
    .locals 1
    .parameter

    .prologue
    .line 185
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;->this$0:Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository;

    .line 186
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;)V

    .line 183
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;->refs:Ljava/util/concurrent/ConcurrentMap;

    .line 187
    return-void
.end method

.method private eq(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Z
    .locals 2
    .parameter "a"
    .parameter "b"

    .prologue
    .line 228
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-nez v0, :cond_0

    .line 229
    const/4 v0, 0x1

    .line 232
    :goto_0
    return v0

    .line 230
    :cond_0
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 231
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    goto :goto_0

    .line 232
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected compareAndPut(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Z
    .locals 5
    .parameter "oldRef"
    .parameter "newRef"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 206
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    .line 207
    .local v1, name:Ljava/lang/String;
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v3

    sget-object v4, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    if-ne v3, v4, :cond_2

    .line 208
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;->refs:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v1, p2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_1

    const/4 v2, 0x1

    .line 213
    :cond_1
    :goto_0
    return v2

    .line 209
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;->refs:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/Ref;

    .line 210
    .local v0, cur:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_1

    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;->eq(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 211
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;->refs:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v1, v0, p2}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0
.end method

.method protected compareAndRemove(Lorg/eclipse/jgit/lib/Ref;)Z
    .locals 3
    .parameter "oldRef"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    .line 220
    .local v1, name:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;->refs:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/Ref;

    .line 221
    .local v0, cur:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_0

    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;->eq(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 222
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;->refs:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2, v1, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    .line 224
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected scanAllRefs()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    new-instance v1, Lorg/eclipse/jgit/util/RefList$Builder;

    invoke-direct {v1}, Lorg/eclipse/jgit/util/RefList$Builder;-><init>()V

    .line 192
    .local v1, ids:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v3, Lorg/eclipse/jgit/util/RefList$Builder;

    invoke-direct {v3}, Lorg/eclipse/jgit/util/RefList$Builder;-><init>()V

    .line 193
    .local v3, sym:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/InMemoryRepository$MemRefDatabase;->refs:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v4}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/Ref;

    .line 194
    .local v2, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 195
    invoke-virtual {v3, v2}, Lorg/eclipse/jgit/util/RefList$Builder;->add(Lorg/eclipse/jgit/lib/Ref;)V

    .line 196
    :cond_0
    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/util/RefList$Builder;->add(Lorg/eclipse/jgit/lib/Ref;)V

    goto :goto_0

    .line 198
    .end local v2           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/util/RefList$Builder;->sort()V

    .line 199
    invoke-virtual {v3}, Lorg/eclipse/jgit/util/RefList$Builder;->sort()V

    .line 200
    new-instance v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/RefList$Builder;->toRefList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v5

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/RefList$Builder;->toRefList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;-><init>(Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)V

    return-object v4
.end method
