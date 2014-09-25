.class public abstract Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;
.super Lorg/eclipse/jgit/lib/ObjectDatabase;
.source "DfsObjDatabase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;,
        Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;
    }
.end annotation


# static fields
.field private static final NO_PACKS:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;


# instance fields
.field private final packList:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;",
            ">;"
        }
    .end annotation
.end field

.field private readerOptions:Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

.field private final repository:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 63
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    const/4 v1, 0x0

    new-array v1, v1, [Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;-><init>([Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V

    sput-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;)V
    .locals 2
    .parameter "repository"
    .parameter "options"

    .prologue
    .line 135
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/ObjectDatabase;-><init>()V

    .line 136
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->repository:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    .line 137
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    .line 138
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->readerOptions:Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    .line 139
    return-void
.end method

.method private static reuseMap(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;)Ljava/util/Map;
    .locals 7
    .parameter "old"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;",
            ")",
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 385
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 387
    .local v1, forReuse:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v4, v0, v2

    .line 388
    .local v4, p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->invalid()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 392
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->close()V

    .line 387
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 396
    :cond_1
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v6

    invoke-interface {v1, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 397
    .local v5, prior:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    if-eqz v5, :cond_0

    .line 404
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v6

    invoke-interface {v1, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 405
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->close()V

    goto :goto_1

    .line 408
    .end local v4           #p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .end local v5           #prior:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_2
    return-object v1
.end method

.method private scanPacks(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;)Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;
    .locals 4
    .parameter "original"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 339
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    monitor-enter v3

    .line 341
    :cond_0
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    .line 342
    .local v1, o:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;
    if-eq v1, p1, :cond_1

    .line 346
    monitor-exit v3

    move-object v0, v1

    .line 354
    :goto_0
    return-object v0

    .line 348
    :cond_1
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->scanPacksImpl(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;)Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    move-result-object v0

    .line 349
    .local v0, n:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;
    if-ne v0, v1, :cond_2

    .line 350
    monitor-exit v3

    goto :goto_0

    .line 352
    .end local v0           #n:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;
    .end local v1           #o:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 351
    .restart local v0       #n:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;
    .restart local v1       #o:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;
    :cond_2
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 352
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 353
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getRepository()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    move-result-object v2

    new-instance v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedEvent;

    invoke-direct {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedEvent;-><init>()V

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->fireEvent(Lorg/eclipse/jgit/events/RepositoryEvent;)V

    goto :goto_0
.end method

.method private scanPacksImpl(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;)Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;
    .locals 10
    .parameter "old"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 358
    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getInstance()Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    move-result-object v0

    .line 359
    .local v0, cache:Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;
    invoke-static {p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->reuseMap(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;)Ljava/util/Map;

    move-result-object v2

    .line 360
    .local v2, forReuse:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->listPacks()Ljava/util/List;

    move-result-object v8

    .line 361
    .local v8, scanned:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    invoke-static {v8}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 363
    new-instance v5, Ljava/util/ArrayList;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v9

    invoke-direct {v5, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 364
    .local v5, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;>;"
    const/4 v3, 0x0

    .line 365
    .local v3, foundNew:Z
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 366
    .local v1, dsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 367
    .local v6, oldPack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    if-eqz v6, :cond_0

    .line 368
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 370
    :cond_0
    const/4 v9, 0x0

    invoke-virtual {v0, v1, v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getOrCreate(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v9

    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 371
    const/4 v3, 0x1

    goto :goto_0

    .line 375
    .end local v1           #dsc:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .end local v6           #oldPack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_1
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 376
    .local v7, p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->close()V

    goto :goto_1

    .line 377
    .end local v7           #p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_2
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 378
    new-instance p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    .end local p1
    sget-object v9, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    iget-object v9, v9, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-direct {p1, v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;-><init>([Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V

    .line 381
    :cond_3
    :goto_2
    return-object p1

    .line 379
    .restart local p1
    :cond_4
    if-eqz v3, :cond_3

    .line 381
    new-instance p1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    .end local p1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-interface {v5, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    invoke-direct {p1, v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;-><init>([Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V

    goto :goto_2
.end method


# virtual methods
.method addPack(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V
    .locals 11
    .parameter "newPack"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 312
    :cond_0
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    .line 313
    .local v4, o:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;
    sget-object v7, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    if-ne v4, v7, :cond_2

    .line 319
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->scanPacks(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;)Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    move-result-object v4

    .line 324
    iget-object v0, v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v5, v0, v1

    .line 325
    .local v5, p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    if-ne v5, p1, :cond_1

    .line 335
    .end local v0           #arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v5           #p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :goto_1
    return-void

    .line 324
    .restart local v0       #arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .restart local v1       #i$:I
    .restart local v2       #len$:I
    .restart local v5       #p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 330
    .end local v0           #arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v5           #p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_2
    iget-object v7, v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    array-length v7, v7

    add-int/lit8 v7, v7, 0x1

    new-array v6, v7, [Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 331
    .local v6, packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    aput-object p1, v6, v10

    .line 332
    iget-object v7, v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    const/4 v8, 0x1

    iget-object v9, v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    array-length v9, v9

    invoke-static {v7, v10, v6, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 333
    new-instance v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    invoke-direct {v3, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;-><init>([Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V

    .line 334
    .local v3, n:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v7, v4, v3}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    goto :goto_1
.end method

.method protected clearCache()V
    .locals 2

    .prologue
    .line 413
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 414
    return-void
.end method

.method public close()V
    .locals 2

    .prologue
    .line 419
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 424
    return-void
.end method

.method protected commitPack(Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 2
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    .local p1, desc:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    .local p2, replaces:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->commitPackImpl(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 224
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getRepository()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    move-result-object v0

    new-instance v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedEvent;

    invoke-direct {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPacksChangedEvent;-><init>()V

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->fireEvent(Lorg/eclipse/jgit/events/RepositoryEvent;)V

    .line 225
    return-void
.end method

.method protected abstract commitPackImpl(Ljava/util/Collection;Ljava/util/Collection;)V
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getCurrentPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->packList:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    return-object v0
.end method

.method public getPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    sget-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->NO_PACKS:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->scanPacks(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;)Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackList;->packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    return-object v0
.end method

.method public getReaderOptions()Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->readerOptions:Lorg/eclipse/jgit/internal/storage/dfs/DfsReaderOptions;

    return-object v0
.end method

.method protected getRepository()Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->repository:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    return-object v0
.end method

.method protected abstract listPacks()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public newInserter()Lorg/eclipse/jgit/lib/ObjectInserter;
    .locals 1

    .prologue
    .line 153
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsInserter;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;)V

    return-object v0
.end method

.method protected abstract newPack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public newReader()Lorg/eclipse/jgit/lib/ObjectReader;
    .locals 1

    .prologue
    .line 148
    new-instance v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;)V

    return-object v0
.end method

.method protected abstract openFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/ReadableChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract rollbackPack(Ljava/util/Collection;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            ">;)V"
        }
    .end annotation
.end method

.method protected abstract writeFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
