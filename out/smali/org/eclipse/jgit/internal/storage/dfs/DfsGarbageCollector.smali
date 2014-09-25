.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;
.super Ljava/lang/Object;
.source "DfsGarbageCollector.java"


# instance fields
.field private allHeads:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private coalesceGarbageLimit:J

.field private ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

.field private final newPackDesc:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            ">;"
        }
    .end annotation
.end field

.field private final newPackObj:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;",
            ">;"
        }
    .end annotation
.end field

.field private final newPackStats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;",
            ">;"
        }
    .end annotation
.end field

.field private nonHeads:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private final objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

.field private packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

.field private packsBefore:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;",
            ">;"
        }
    .end annotation
.end field

.field private final refdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

.field private refsBefore:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private final repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

.field private tagTargets:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;)V
    .locals 3
    .parameter "repository"

    .prologue
    const/4 v2, 0x4

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    const-wide/32 v0, 0x3200000

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->coalesceGarbageLimit:J

    .line 113
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    .line 114
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->getRefDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->refdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    .line 115
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackDesc:Ljava/util/List;

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackStats:Ljava/util/List;

    .line 118
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackObj:Ljava/util/List;

    .line 120
    new-instance v0, Lorg/eclipse/jgit/storage/pack/PackConfig;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/storage/pack/PackConfig;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 121
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setIndexVersion(I)V

    .line 122
    return-void
.end method

.method private anyPackHas(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 3
    .parameter "id"

    .prologue
    .line 337
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackObj:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    .line 338
    .local v1, packedObjs:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    invoke-interface {v1, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 339
    const/4 v2, 0x1

    .line 340
    .end local v1           #packedObjs:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static isHead(Lorg/eclipse/jgit/lib/Ref;)Z
    .locals 2
    .parameter "ref"

    .prologue
    .line 344
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "refs/heads/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private newPackWriter()Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    .locals 3

    .prologue
    .line 355
    new-instance v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 356
    .local v0, pw:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setDeltaBaseAsOffset(Z)V

    .line 357
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setReuseDeltaCommits(Z)V

    .line 358
    return-object v0
.end method

.method private objectsBefore()I
    .locals 7

    .prologue
    .line 348
    const/4 v0, 0x0

    .line 349
    .local v0, cnt:I
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packsBefore:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 350
    .local v2, p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    int-to-long v3, v0

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getObjectCount()J

    move-result-wide v5

    add-long/2addr v3, v5

    long-to-int v0, v3

    goto :goto_0

    .line 351
    .end local v2           #p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_0
    return v0
.end method

.method private packGarbage(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 14
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 304
    new-instance v0, Lorg/eclipse/jgit/storage/pack/PackConfig;

    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-direct {v0, v10}, Lorg/eclipse/jgit/storage/pack/PackConfig;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;)V

    .line 305
    .local v0, cfg:Lorg/eclipse/jgit/storage/pack/PackConfig;
    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setReuseDeltas(Z)V

    .line 306
    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setReuseObjects(Z)V

    .line 307
    invoke-virtual {v0, v12}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setDeltaCompress(Z)V

    .line 308
    invoke-virtual {v0, v12}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setBuildBitmaps(Z)V

    .line 310
    new-instance v8, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    invoke-direct {v8, v0, v10}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 311
    .local v8, pw:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    invoke-virtual {v8, v11}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setDeltaBaseAsOffset(Z)V

    .line 312
    invoke-virtual {v8, v11}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setReuseDeltaCommits(Z)V

    .line 314
    :try_start_0
    new-instance v7, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    invoke-direct {v7, v10}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 315
    .local v7, pool:Lorg/eclipse/jgit/revwalk/RevWalk;
    const-string v10, "Finding garbage"

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->objectsBefore()I

    move-result v11

    invoke-interface {p1, v10, v11}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 316
    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packsBefore:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 317
    .local v6, oldPack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    invoke-virtual {v6, v10}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v5

    .line 318
    .local v5, oldIdx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    .line 319
    .local v1, ent:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    const/4 v10, 0x1

    invoke-interface {p1, v10}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 320
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    .line 321
    .local v4, id:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v7, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupOrNull(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v10

    if-nez v10, :cond_1

    invoke-direct {p0, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->anyPackHas(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v10

    if-nez v10, :cond_1

    .line 324
    iget-object v10, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->getOffset()J

    move-result-wide v11

    invoke-virtual {v6, v10, v11, v12}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getObjectType(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;J)I

    move-result v9

    .line 325
    .local v9, type:I
    invoke-virtual {v7, v4, v9}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupAny(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v10

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 332
    .end local v1           #ent:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v4           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v5           #oldIdx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    .end local v6           #oldPack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .end local v7           #pool:Lorg/eclipse/jgit/revwalk/RevWalk;
    .end local v9           #type:I
    :catchall_0
    move-exception v10

    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    throw v10

    .line 328
    .restart local v7       #pool:Lorg/eclipse/jgit/revwalk/RevWalk;
    :cond_2
    :try_start_1
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 329
    const-wide/16 v10, 0x0

    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getObjectCount()J

    move-result-wide v12

    cmp-long v10, v10, v12

    if-gez v10, :cond_3

    .line 330
    sget-object v10, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->UNREACHABLE_GARBAGE:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    invoke-direct {p0, v10, v8, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->writePack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 332
    :cond_3
    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    .line 334
    return-void
.end method

.method private packHeads(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 5
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 272
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->allHeads:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 284
    :goto_0
    return-void

    .line 275
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackWriter()Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    move-result-object v0

    .line 277
    .local v0, pw:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->tagTargets:Ljava/util/Set;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setTagTargets(Ljava/util/Set;)V

    .line 278
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->allHeads:Ljava/util/Set;

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;Ljava/util/Set;)V

    .line 279
    const-wide/16 v1, 0x0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getObjectCount()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-gez v1, :cond_1

    .line 280
    sget-object v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->GC:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    invoke-direct {p0, v1, v0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->writePack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    throw v1
.end method

.method private packRest(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 7
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 287
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->nonHeads:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 300
    :goto_0
    return-void

    .line 290
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackWriter()Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    move-result-object v2

    .line 292
    .local v2, pw:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackObj:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    .line 293
    .local v1, packedObjs:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    invoke-virtual {v2, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 298
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #packedObjs:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    throw v3

    .line 294
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_1
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->nonHeads:Ljava/util/Set;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->allHeads:Ljava/util/Set;

    invoke-virtual {v2, p1, v3, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;Ljava/util/Set;)V

    .line 295
    const-wide/16 v3, 0x0

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getObjectCount()J

    move-result-wide v5

    cmp-long v3, v3, v5

    if-gez v3, :cond_2

    .line 296
    sget-object v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->GC:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    invoke-direct {p0, v3, v2, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->writePack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 298
    :cond_2
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    goto :goto_0
.end method

.method private packsToRebuild()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v6

    .line 237
    .local v6, packs:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    new-instance v4, Ljava/util/ArrayList;

    array-length v7, v6

    invoke-direct {v4, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 238
    .local v4, out:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;>;"
    move-object v0, v6

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v5, v0, v2

    .line 239
    .local v5, p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v1

    .line 240
    .local v1, d:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getPackSource()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    move-result-object v7

    sget-object v8, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->UNREACHABLE_GARBAGE:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    if-eq v7, v8, :cond_1

    .line 241
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 242
    :cond_1
    sget-object v7, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v1, v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)J

    move-result-wide v7

    iget-wide v9, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->coalesceGarbageLimit:J

    cmp-long v7, v7, v9

    if-gez v7, :cond_0

    .line 243
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 245
    .end local v1           #d:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .end local v5           #p:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_2
    return-object v4
.end method

.method private toPrune()Ljava/util/List;
    .locals 5
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
    .line 264
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packsBefore:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    .line 265
    .local v1, cnt:I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 266
    .local v0, all:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packsBefore:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 267
    .local v3, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 268
    .end local v3           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_0
    return-object v0
.end method

.method private writePack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .locals 9
    .parameter "source"
    .parameter "pw"
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 364
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    move-result-object v6

    invoke-virtual {v6, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->newPack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v3

    .line 365
    .local v3, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackDesc:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 367
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    sget-object v7, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v6, v3, v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->writeFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    move-result-object v2

    .line 369
    .local v2, out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;
    :try_start_0
    invoke-virtual {p2, p3, p3, v2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V

    .line 370
    sget-object v6, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->addFileExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 372
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    .line 375
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    sget-object v7, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v6, v3, v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->writeFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    move-result-object v2

    .line 377
    :try_start_1
    new-instance v0, Lorg/eclipse/jgit/util/io/CountingOutputStream;

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/util/io/CountingOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 378
    .local v0, cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    invoke-virtual {p2, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeIndex(Ljava/io/OutputStream;)V

    .line 379
    sget-object v6, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->addFileExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)V

    .line 380
    sget-object v6, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/CountingOutputStream;->getCount()J

    move-result-wide v7

    invoke-virtual {v3, v6, v7, v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 381
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getIndexVersion()I

    move-result v6

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setIndexVersion(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 383
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    .line 386
    invoke-virtual {p2, p3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->prepareBitmapIndex(Lorg/eclipse/jgit/lib/ProgressMonitor;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 387
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    sget-object v7, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v6, v3, v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->writeFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    move-result-object v2

    .line 389
    :try_start_2
    new-instance v1, Lorg/eclipse/jgit/util/io/CountingOutputStream;

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/util/io/CountingOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 390
    .end local v0           #cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    .local v1, cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    :try_start_3
    invoke-virtual {p2, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeBitmapIndex(Ljava/io/OutputStream;)V

    .line 391
    sget-object v6, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->addFileExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)V

    .line 392
    sget-object v6, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v1}, Lorg/eclipse/jgit/util/io/CountingOutputStream;->getCount()J

    move-result-wide v7

    invoke-virtual {v3, v6, v7, v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 394
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    move-object v0, v1

    .line 398
    .end local v1           #cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    .restart local v0       #cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    :cond_0
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getObjectSet()Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;

    move-result-object v4

    .line 400
    .local v4, packedObjs:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;>;"
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackObj:Ljava/util/List;

    new-instance v7, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector$1;

    invoke-direct {v7, p0, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector$1;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;)V

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 406
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getStatistics()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-result-object v5

    .line 407
    .local v5, stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;
    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setPackStats(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 408
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackStats:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 410
    invoke-static {}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getInstance()Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v3, v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsBlockCache;->getOrCreate(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackKey;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 411
    return-object v3

    .line 372
    .end local v0           #cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    .end local v4           #packedObjs:Lorg/eclipse/jgit/lib/ObjectIdOwnerMap;,"Lorg/eclipse/jgit/lib/ObjectIdOwnerMap<Lorg/eclipse/jgit/lib/ObjectIdOwnerMap$Entry;>;"
    .end local v5           #stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;
    :catchall_0
    move-exception v6

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    throw v6

    .line 383
    :catchall_1
    move-exception v6

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    throw v6

    .line 394
    .restart local v0       #cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    :catchall_2
    move-exception v6

    :goto_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    throw v6

    .end local v0           #cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    .restart local v1       #cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    :catchall_3
    move-exception v6

    move-object v0, v1

    .end local v1           #cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    .restart local v0       #cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    goto :goto_0
.end method


# virtual methods
.method public getCoalesceGarbageLimit()J
    .locals 2

    .prologue
    .line 141
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->coalesceGarbageLimit:J

    return-wide v0
.end method

.method public getNewPackStatistics()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;",
            ">;"
        }
    .end annotation

    .prologue
    .line 260
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackStats:Ljava/util/List;

    return-object v0
.end method

.method public getNewPacks()Ljava/util/List;
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
    .line 255
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackDesc:Ljava/util/List;

    return-object v0
.end method

.method public getPackConfig()Lorg/eclipse/jgit/storage/pack/PackConfig;
    .locals 1

    .prologue
    .line 126
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    return-object v0
.end method

.method public getSourcePacks()Ljava/util/List;
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
    .line 250
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->toPrune()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public pack(Lorg/eclipse/jgit/lib/ProgressMonitor;)Z
    .locals 7
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 188
    if-nez p1, :cond_0

    .line 189
    sget-object p1, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 190
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    invoke-virtual {v3}, Lorg/eclipse/jgit/storage/pack/PackConfig;->getIndexVersion()I

    move-result v3

    const/4 v4, 0x2

    if-eq v3, v4, :cond_1

    .line 191
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Only index version 2"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 193
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    .line 195
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->refdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->clearCache()V

    .line 196
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->clearCache()V

    .line 198
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->refdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;

    const-string v4, ""

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->refsBefore:Ljava/util/Map;

    .line 199
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packsToRebuild()Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packsBefore:Ljava/util/List;

    .line 200
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packsBefore:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-eqz v3, :cond_2

    .line 231
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->release()V

    :goto_0
    return v6

    .line 203
    :cond_2
    :try_start_1
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->allHeads:Ljava/util/Set;

    .line 204
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->nonHeads:Ljava/util/Set;

    .line 205
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->tagTargets:Ljava/util/Set;

    .line 206
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->refsBefore:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/Ref;

    .line 207
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v3

    if-nez v3, :cond_3

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 209
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->isHead(Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 210
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->allHeads:Ljava/util/Set;

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 213
    :goto_2
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 214
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->tagTargets:Ljava/util/Set;

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 231
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    :catchall_0
    move-exception v3

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->release()V

    throw v3

    .line 212
    .restart local v0       #i$:Ljava/util/Iterator;
    .restart local v1       #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_4
    :try_start_2
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->nonHeads:Ljava/util/Set;

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 216
    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_5
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->tagTargets:Ljava/util/Set;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->allHeads:Ljava/util/Set;

    invoke-interface {v3, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 218
    const/4 v2, 0x1

    .line 220
    .local v2, rollback:Z
    :try_start_3
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packHeads(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 221
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packRest(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 222
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packGarbage(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 223
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackDesc:Ljava/util/List;

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->toPrune()Ljava/util/List;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->commitPack(Ljava/util/Collection;Ljava/util/Collection;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 224
    const/4 v2, 0x0

    .line 227
    if-eqz v2, :cond_6

    .line 228
    :try_start_4
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackDesc:Ljava/util/List;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->rollbackPack(Ljava/util/Collection;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 231
    :cond_6
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->release()V

    goto/16 :goto_0

    .line 227
    :catchall_1
    move-exception v3

    if-eqz v2, :cond_7

    .line 228
    :try_start_5
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->newPackDesc:Ljava/util/List;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->rollbackPack(Ljava/util/Collection;)V

    :cond_7
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method

.method public setCoalesceGarbageLimit(J)Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;
    .locals 0
    .parameter "limit"

    .prologue
    .line 167
    iput-wide p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->coalesceGarbageLimit:J

    .line 168
    return-object p0
.end method

.method public setPackConfig(Lorg/eclipse/jgit/storage/pack/PackConfig;)Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;
    .locals 0
    .parameter "newConfig"

    .prologue
    .line 135
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsGarbageCollector;->packConfig:Lorg/eclipse/jgit/storage/pack/PackConfig;

    .line 136
    return-object p0
.end method
