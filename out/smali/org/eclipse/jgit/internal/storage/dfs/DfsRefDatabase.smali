.class public abstract Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;
.super Lorg/eclipse/jgit/lib/RefDatabase;
.source "DfsRefDatabase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    }
.end annotation


# instance fields
.field private final cache:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;",
            ">;"
        }
    .end annotation
.end field

.field private final repository:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;)V
    .locals 1
    .parameter "repository"

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/RefDatabase;-><init>()V

    .line 80
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->repository:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    .line 81
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->cache:Ljava/util/concurrent/atomic/AtomicReference;

    .line 82
    return-void
.end method

.method private doPeel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;
    .locals 7
    .parameter "leaf"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 186
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->repository:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 188
    .local v1, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    .line 189
    .local v0, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v2, v0, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v2, :cond_0

    .line 190
    new-instance v2, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v3

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevObject;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 202
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :goto_0
    return-object v2

    .line 196
    :cond_0
    :try_start_1
    new-instance v2, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v3

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 202
    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto :goto_0

    .end local v0           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v2
.end method

.method private getOneRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 4
    .parameter "refName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->read()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    move-result-object v0

    .line 108
    .local v0, curr:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 109
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v1, :cond_0

    .line 110
    const/4 v2, 0x0

    iget-object v3, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    invoke-direct {p0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->resolve(Lorg/eclipse/jgit/lib/Ref;ILorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 111
    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    return-object v1
.end method

.method private read()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 298
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->cache:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    .line 299
    .local v0, c:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    if-nez v0, :cond_0

    .line 300
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->scanAllRefs()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    move-result-object v0

    .line 301
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->cache:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 303
    :cond_0
    return-object v0
.end method

.method private static recreate(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;
    .locals 2
    .parameter "old"
    .parameter "leaf"

    .prologue
    .line 207
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 208
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    invoke-static {v1, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->recreate(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 209
    .local v0, dst:Lorg/eclipse/jgit/lib/Ref;
    new-instance p1, Lorg/eclipse/jgit/lib/SymbolicRef;

    .end local p1
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1, v0}, Lorg/eclipse/jgit/lib/SymbolicRef;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V

    .line 211
    .end local v0           #dst:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    return-object p1
.end method

.method private resolve(Lorg/eclipse/jgit/lib/Ref;ILorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;
    .locals 3
    .parameter "ref"
    .parameter "depth"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Ref;",
            "I",
            "Lorg/eclipse/jgit/util/RefList",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
            "Lorg/eclipse/jgit/lib/Ref;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p3, loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    const/4 v1, 0x0

    .line 147
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v2

    if-nez v2, :cond_1

    .line 162
    .end local p1
    :cond_0
    :goto_0
    return-object p1

    .line 150
    .restart local p1
    :cond_1
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 152
    .local v0, dst:Lorg/eclipse/jgit/lib/Ref;
    const/4 v2, 0x5

    if-gt v2, p2, :cond_2

    move-object p1, v1

    .line 153
    goto :goto_0

    .line 155
    :cond_2
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 156
    if-eqz v0, :cond_0

    .line 159
    add-int/lit8 v2, p2, 0x1

    invoke-direct {p0, v0, v2, p3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->resolve(Lorg/eclipse/jgit/lib/Ref;ILorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 160
    if-nez v0, :cond_3

    move-object p1, v1

    .line 161
    goto :goto_0

    .line 162
    :cond_3
    new-instance v1, Lorg/eclipse/jgit/lib/SymbolicRef;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/lib/SymbolicRef;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V

    move-object p1, v1

    goto :goto_0
.end method


# virtual methods
.method protected cachePeeledState(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)V
    .locals 1
    .parameter "oldLeaf"
    .parameter "newLeaf"

    .prologue
    .line 359
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->compareAndPut(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 363
    :goto_0
    return-void

    .line 360
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method clearCache()V
    .locals 2

    .prologue
    .line 274
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->cache:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 275
    return-void
.end method

.method public close()V
    .locals 0

    .prologue
    .line 270
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->clearCache()V

    .line 271
    return-void
.end method

.method protected abstract compareAndPut(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract compareAndRemove(Lorg/eclipse/jgit/lib/Ref;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public create()V
    .locals 0

    .prologue
    .line 266
    return-void
.end method

.method exists()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->read()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAdditionalRefs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 116
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    .locals 8
    .parameter "needle"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->read()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    move-result-object v1

    .line 96
    .local v1, curr:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    sget-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->SEARCH_PATH:[Ljava/lang/String;

    .local v0, arr$:[Ljava/lang/String;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 97
    .local v4, prefix:Ljava/lang/String;
    iget-object v6, v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/util/RefList;->get(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    .line 98
    .local v5, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v5, :cond_0

    .line 99
    const/4 v6, 0x0

    iget-object v7, v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    invoke-direct {p0, v5, v6, v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->resolve(Lorg/eclipse/jgit/lib/Ref;ILorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    .line 103
    .end local v4           #prefix:Ljava/lang/String;
    .end local v5           #ref:Lorg/eclipse/jgit/lib/Ref;
    :goto_1
    return-object v5

    .line 96
    .restart local v4       #prefix:Ljava/lang/String;
    .restart local v5       #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 103
    .end local v4           #prefix:Ljava/lang/String;
    .end local v5           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    const/4 v5, 0x0

    goto :goto_1
.end method

.method public getRefs(Ljava/lang/String;)Ljava/util/Map;
    .locals 10
    .parameter "prefix"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->read()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    move-result-object v0

    .line 122
    .local v0, curr:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    invoke-static {}, Lorg/eclipse/jgit/util/RefList;->emptyList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v4

    .line 123
    .local v4, packed:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v2, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    .line 124
    .local v2, loose:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v6, Lorg/eclipse/jgit/util/RefList$Builder;

    iget-object v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->sym:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v8}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v8

    invoke-direct {v6, v8}, Lorg/eclipse/jgit/util/RefList$Builder;-><init>(I)V

    .line 126
    .local v6, sym:Lorg/eclipse/jgit/util/RefList$Builder;,"Lorg/eclipse/jgit/util/RefList$Builder<Lorg/eclipse/jgit/lib/Ref;>;"
    const/4 v1, 0x0

    .local v1, idx:I
    :goto_0
    iget-object v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->sym:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v8}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v8

    if-ge v1, v8, :cond_2

    .line 127
    iget-object v8, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->sym:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v8, v1}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    .line 128
    .local v5, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    .line 129
    .local v3, name:Ljava/lang/String;
    const/4 v8, 0x0

    invoke-direct {p0, v5, v8, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->resolve(Lorg/eclipse/jgit/lib/Ref;ILorg/eclipse/jgit/util/RefList;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    .line 130
    if-eqz v5, :cond_1

    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    if-eqz v8, :cond_1

    .line 131
    invoke-virtual {v6, v5}, Lorg/eclipse/jgit/util/RefList$Builder;->add(Lorg/eclipse/jgit/lib/Ref;)V

    .line 126
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 136
    :cond_1
    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v7

    .line 137
    .local v7, toRemove:I
    if-ltz v7, :cond_0

    .line 138
    invoke-virtual {v2, v7}, Lorg/eclipse/jgit/util/RefList;->remove(I)Lorg/eclipse/jgit/util/RefList;

    move-result-object v2

    goto :goto_1

    .line 142
    .end local v3           #name:Ljava/lang/String;
    .end local v5           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v7           #toRemove:I
    :cond_2
    new-instance v8, Lorg/eclipse/jgit/util/RefMap;

    invoke-virtual {v6}, Lorg/eclipse/jgit/util/RefList$Builder;->toRefList()Lorg/eclipse/jgit/util/RefList;

    move-result-object v9

    invoke-direct {v8, p1, v4, v2, v9}, Lorg/eclipse/jgit/util/RefMap;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/util/RefList;)V

    return-object v8
.end method

.method protected getRepository()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->repository:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    return-object v0
.end method

.method public isNameConflicting(Ljava/lang/String;)Z
    .locals 9
    .parameter "refName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    const/16 v8, 0x2f

    .line 244
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->read()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    move-result-object v7

    iget-object v0, v7, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    .line 247
    .local v0, all:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual {p1, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 248
    .local v2, lastSlash:I
    :goto_0
    if-lez v2, :cond_2

    .line 249
    invoke-virtual {p1, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 250
    .local v3, needle:Ljava/lang/String;
    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/util/RefList;->contains(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 260
    .end local v3           #needle:Ljava/lang/String;
    :cond_0
    :goto_1
    return v5

    .line 252
    .restart local v3       #needle:Ljava/lang/String;
    :cond_1
    add-int/lit8 v7, v2, -0x1

    invoke-virtual {p1, v8, v7}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v2

    .line 253
    goto :goto_0

    .line 256
    .end local v3           #needle:Ljava/lang/String;
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 257
    .local v4, prefix:Ljava/lang/String;
    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    neg-int v1, v7

    .line 258
    .local v1, idx:I
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/RefList;->size()I

    move-result v7

    if-ge v1, v7, :cond_3

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v7

    invoke-interface {v7}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    :cond_3
    move v5, v6

    .line 260
    goto :goto_1
.end method

.method public newRename(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefRename;
    .locals 3
    .parameter "fromName"
    .parameter "toName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 237
    invoke-virtual {p0, p1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v1

    .line 238
    .local v1, src:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {p0, p2, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v0

    .line 239
    .local v0, dst:Lorg/eclipse/jgit/lib/RefUpdate;
    new-instance v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename;

    invoke-direct {v2, v1, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename;-><init>(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)V

    return-object v2
.end method

.method public newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;
    .locals 6
    .parameter "refName"
    .parameter "detach"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    const/4 v0, 0x0

    .line 218
    .local v0, detachingSymbolicRef:Z
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->getOneRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 219
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    if-nez v1, :cond_1

    .line 220
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    sget-object v4, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    const/4 v5, 0x0

    invoke-direct {v1, v4, p1, v5}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .restart local v1       #ref:Lorg/eclipse/jgit/lib/Ref;
    move-object v2, v1

    .line 224
    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    .local v2, ref:Lorg/eclipse/jgit/lib/Ref;
    :goto_0
    if-eqz v0, :cond_3

    .line 225
    new-instance v1, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v4, Lorg/eclipse/jgit/lib/Ref$Storage;->NEW:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-direct {v1, v4, p1, v5}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 228
    .end local v2           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v1       #ref:Lorg/eclipse/jgit/lib/Ref;
    :goto_1
    new-instance v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;

    invoke-direct {v3, p0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;Lorg/eclipse/jgit/lib/Ref;)V

    .line 229
    .local v3, update:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;
    if-eqz v0, :cond_0

    .line 230
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;->setDetachingSymbolicRef()V

    .line 231
    :cond_0
    return-object v3

    .line 222
    .end local v3           #update:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefUpdate;
    :cond_1
    if-eqz p2, :cond_2

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v0, 0x1

    :goto_2
    move-object v2, v1

    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v2       #ref:Lorg/eclipse/jgit/lib/Ref;
    goto :goto_0

    .end local v2           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v1       #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    const/4 v0, 0x0

    goto :goto_2

    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v2       #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_3
    move-object v1, v2

    .end local v2           #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v1       #ref:Lorg/eclipse/jgit/lib/Ref;
    goto :goto_1
.end method

.method public peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;
    .locals 7
    .parameter "ref"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 167
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v4

    .line 168
    .local v4, oldLeaf:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->isPeeled()Z

    move-result v5

    if-nez v5, :cond_0

    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    if-nez v5, :cond_1

    .line 181
    .end local p1
    :cond_0
    :goto_0
    return-object p1

    .line 171
    .restart local p1
    :cond_1
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->doPeel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    .line 173
    .local v2, newLeaf:Lorg/eclipse/jgit/lib/Ref;
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->read()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    move-result-object v0

    .line 174
    .local v0, cur:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    invoke-interface {v4}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/util/RefList;->find(Ljava/lang/String;)I

    move-result v1

    .line 175
    .local v1, idx:I
    if-ltz v1, :cond_2

    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v5, v1}, Lorg/eclipse/jgit/util/RefList;->get(I)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    if-ne v5, v4, :cond_2

    .line 176
    iget-object v5, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->ids:Lorg/eclipse/jgit/util/RefList;

    invoke-virtual {v5, v1, v2}, Lorg/eclipse/jgit/util/RefList;->set(ILorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/util/RefList;

    move-result-object v3

    .line 177
    .local v3, newList:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->cache:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v6, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    invoke-direct {v6, v3, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;-><init>(Lorg/eclipse/jgit/util/RefList;Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;)V

    invoke-virtual {v5, v0, v6}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    invoke-virtual {p0, v4, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->cachePeeledState(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)V

    .line 181
    .end local v3           #newList:Lorg/eclipse/jgit/util/RefList;,"Lorg/eclipse/jgit/util/RefList<Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_2
    invoke-static {p1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->recreate(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object p1

    goto :goto_0
.end method

.method removed(Ljava/lang/String;)V
    .locals 3
    .parameter "refName"

    .prologue
    .line 290
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->cache:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    .line 291
    .local v1, oldCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    if-nez v1, :cond_1

    .line 295
    :goto_0
    return-void

    .line 293
    :cond_1
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->remove(Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    move-result-object v0

    .line 294
    .local v0, newCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->cache:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method

.method protected abstract scanAllRefs()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method stored(Lorg/eclipse/jgit/lib/Ref;)V
    .locals 3
    .parameter "ref"

    .prologue
    .line 280
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->cache:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    .line 281
    .local v1, oldCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    if-nez v1, :cond_1

    .line 285
    :goto_0
    return-void

    .line 283
    :cond_1
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;->put(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;

    move-result-object v0

    .line 284
    .local v0, newCache:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase$RefCache;
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->cache:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method
