.class public Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;
.super Ljava/lang/Object;
.source "DfsPackCompactor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;
    }
.end annotation


# instance fields
.field private added:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private autoAddSize:I

.field private final exclude:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;",
            ">;"
        }
    .end annotation
.end field

.field private isBase:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final newPacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;",
            ">;"
        }
    .end annotation
.end field

.field private final newStats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;",
            ">;"
        }
    .end annotation
.end field

.field private final repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

.field private rw:Lorg/eclipse/jgit/revwalk/RevWalk;

.field private final srcPacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;)V
    .locals 3
    .parameter "repository"

    .prologue
    const/4 v2, 0x1

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    .line 113
    const/high16 v0, 0x50

    iput v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->autoAddSize:I

    .line 114
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->srcPacks:Ljava/util/List;

    .line 115
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->exclude:Ljava/util/List;

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->newPacks:Ljava/util/List;

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->newStats:Ljava/util/List;

    .line 118
    return-void
.end method

.method private addObjectsToPack(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 15
    .parameter "pw"
    .parameter "ctx"
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
        }
    .end annotation

    .prologue
    .line 290
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->srcPacks:Ljava/util/List;

    new-instance v4, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$2;

    invoke-direct {v4, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$2;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;)V

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 296
    new-instance v3, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p2

    invoke-direct {v3, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 297
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v4, "ADDED"

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->added:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 298
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v4, "IS_BASE"

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->isBase:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 299
    new-instance v8, Lorg/eclipse/jgit/util/BlockList;

    invoke-direct {v8}, Lorg/eclipse/jgit/util/BlockList;-><init>()V

    .line 301
    .local v8, baseObjects:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevObject;>;"
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->countingObjects:Ljava/lang/String;

    const/4 v4, 0x0

    move-object/from16 v0, p3

    invoke-interface {v0, v3, v4}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 302
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->srcPacks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    .line 303
    .local v1, src:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    move-object/from16 v0, p2

    invoke-direct {p0, v1, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->toInclude(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Ljava/util/List;

    move-result-object v14

    .line 304
    .local v14, want:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;>;"
    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 307
    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getReverseIdx(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;

    move-result-object v6

    .line 308
    .local v6, rev:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    new-instance v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;

    invoke-direct {v2, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)V

    .line 309
    .local v2, rep:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;

    .line 310
    .local v11, id:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;
    iget-wide v3, v11, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;->offset:J

    move-object/from16 v0, p2

    invoke-virtual {v1, v0, v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getObjectType(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;J)I

    move-result v13

    .line 311
    .local v13, type:I
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v3, v11, v13}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupAny(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v12

    .line 312
    .local v12, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->added:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v12, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 315
    const/4 v3, 0x1

    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 316
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 317
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->added:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v12, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 319
    iget-wide v3, v11, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;->offset:J

    move-object/from16 v5, p2

    invoke-virtual/range {v1 .. v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->representation(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;JLorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;)V

    .line 320
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->getFormat()I

    move-result v3

    if-nez v3, :cond_1

    .line 323
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;->getDeltaBase()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {v3, v4, v13}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupAny(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v7

    .line 324
    .local v7, base:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->added:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v7, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->isBase:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v7, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 325
    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 326
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->isBase:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v7, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    goto :goto_0

    .line 330
    .end local v1           #src:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    .end local v2           #rep:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjectRepresentation;
    .end local v6           #rev:Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;
    .end local v7           #base:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v11           #id:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;
    .end local v12           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v13           #type:I
    .end local v14           #want:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;>;"
    :cond_2
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/eclipse/jgit/revwalk/RevObject;

    .line 331
    .restart local v12       #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->added:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v12, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 332
    const/4 v3, 0x1

    move-object/from16 v0, p3

    invoke-interface {v0, v3}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 333
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->addObject(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 334
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->added:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v12, v3}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    goto :goto_1

    .line 337
    .end local v12           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_4
    invoke-interface/range {p3 .. p3}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 338
    return-void
.end method

.method private toInclude(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Ljava/util/List;
    .locals 11
    .parameter "src"
    .parameter "ctx"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 342
    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v6

    .line 343
    .local v6, srcIdx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    new-instance v7, Lorg/eclipse/jgit/util/BlockList;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectCount()J

    move-result-wide v8

    long-to-int v8, v8

    invoke-direct {v7, v8}, Lorg/eclipse/jgit/util/BlockList;-><init>(I)V

    .line 345
    .local v7, want:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;>;"
    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;

    .line 346
    .local v1, ent:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    .line 347
    .local v4, id:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v8, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupOrNull(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    .line 348
    .local v5, obj:Lorg/eclipse/jgit/revwalk/RevObject;
    if-eqz v5, :cond_1

    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->added:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v5, v8}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v8

    if-nez v8, :cond_0

    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->isBase:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v5, v8}, Lorg/eclipse/jgit/revwalk/RevObject;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 350
    :cond_1
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->exclude:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    .line 351
    .local v0, e:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    invoke-interface {v0, v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;->contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v8

    if-eqz v8, :cond_2

    goto :goto_0

    .line 353
    .end local v0           #e:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    :cond_3
    new-instance v8, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;->getOffset()J

    move-result-wide v9

    invoke-direct {v8, v4, v9, v10}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$ObjectIdWithOffset;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;J)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 355
    .end local v1           #ent:Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v4           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v5           #obj:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_4
    new-instance v8, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$3;

    invoke-direct {v8, p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$3;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;)V

    invoke-static {v7, v8}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 360
    return-object v7
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
    .line 277
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->srcPacks:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    .line 278
    .local v1, cnt:I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 279
    .local v0, all:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->srcPacks:Ljava/util/List;

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

    .line 280
    .local v3, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 281
    .end local v3           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_0
    return-object v0
.end method

.method private static writeIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)V
    .locals 5
    .parameter "objdb"
    .parameter "pack"
    .parameter "pw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 378
    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {p0, p1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->writeFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    move-result-object v1

    .line 380
    .local v1, out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;
    :try_start_0
    new-instance v0, Lorg/eclipse/jgit/util/io/CountingOutputStream;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/util/io/CountingOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 381
    .local v0, cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    invoke-virtual {p2, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeIndex(Ljava/io/OutputStream;)V

    .line 382
    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->addFileExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)V

    .line 383
    sget-object v2, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/io/CountingOutputStream;->getCount()J

    move-result-wide v3

    invoke-virtual {p1, v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;J)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 384
    invoke-virtual {p2}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getIndexVersion()I

    move-result v2

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setIndexVersion(I)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 386
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    .line 388
    return-void

    .line 386
    .end local v0           #cnt:Lorg/eclipse/jgit/util/io/CountingOutputStream;
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    throw v2
.end method

.method private static writePack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 2
    .parameter "objdb"
    .parameter "pack"
    .parameter "pw"
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 366
    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {p0, p1, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->writeFile(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackExt;)Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;

    move-result-object v0

    .line 368
    .local v0, out:Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;
    :try_start_0
    invoke-virtual {p2, p3, p3, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V

    .line 369
    sget-object v1, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->addFileExt(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 371
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    .line 373
    return-void

    .line 371
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsOutputStream;->close()V

    throw v1
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;
    .locals 1
    .parameter "pack"

    .prologue
    .line 133
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->srcPacks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    return-object p0
.end method

.method public autoAdd()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    move-result-object v4

    .line 149
    .local v4, objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->getPacks()[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v5, v0, v2

    .line 150
    .local v5, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackDescription()Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    move-result-object v1

    .line 151
    .local v1, d:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    sget-object v6, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v1, v6}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->getFileSize(Lorg/eclipse/jgit/internal/storage/pack/PackExt;)J

    move-result-wide v6

    iget v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->autoAddSize:I

    int-to-long v8, v8

    cmp-long v6, v6, v8

    if-gez v6, :cond_0

    .line 152
    invoke-virtual {p0, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->add(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;

    .line 149
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 154
    :cond_0
    invoke-virtual {p0, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->exclude(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;

    goto :goto_1

    .line 156
    .end local v1           #d:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .end local v5           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;
    :cond_1
    return-object p0
.end method

.method public compact(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 13
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    .line 205
    if-nez p1, :cond_0

    .line 206
    sget-object p1, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 208
    :cond_0
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;

    move-result-object v1

    .line 209
    .local v1, objdb:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    .line 211
    .local v0, ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;
    :try_start_0
    new-instance v3, Lorg/eclipse/jgit/storage/pack/PackConfig;

    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    invoke-direct {v3, v8}, Lorg/eclipse/jgit/storage/pack/PackConfig;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 212
    .local v3, pc:Lorg/eclipse/jgit/storage/pack/PackConfig;
    const/4 v8, 0x2

    invoke-virtual {v3, v8}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setIndexVersion(I)V

    .line 213
    const/4 v8, 0x0

    invoke-virtual {v3, v8}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setDeltaCompress(Z)V

    .line 214
    const/4 v8, 0x1

    invoke-virtual {v3, v8}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setReuseDeltas(Z)V

    .line 215
    const/4 v8, 0x1

    invoke-virtual {v3, v8}, Lorg/eclipse/jgit/storage/pack/PackConfig;->setReuseObjects(Z)V

    .line 217
    new-instance v4, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    invoke-direct {v4, v3, v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;-><init>(Lorg/eclipse/jgit/storage/pack/PackConfig;Lorg/eclipse/jgit/lib/ObjectReader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 219
    .local v4, pw:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    const/4 v8, 0x1

    :try_start_1
    invoke-virtual {v4, v8}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setDeltaBaseAsOffset(Z)V

    .line 220
    const/4 v8, 0x0

    invoke-virtual {v4, v8}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setReuseDeltaCommits(Z)V

    .line 222
    invoke-direct {p0, v4, v0, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->addObjectsToPack(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 223
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getObjectCount()J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v8, v8, v10

    if-nez v8, :cond_3

    .line 224
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->toPrune()Ljava/util/List;

    move-result-object v5

    .line 225
    .local v5, remove:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_1

    .line 226
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v8

    invoke-virtual {v1, v8, v5}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->commitPack(Ljava/util/Collection;Ljava/util/Collection;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 252
    :cond_1
    if-eqz v4, :cond_2

    .line 253
    :try_start_2
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 256
    :cond_2
    iput-object v12, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 257
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->release()V

    .line 259
    .end local v5           #remove:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;>;"
    :goto_0
    return-void

    .line 232
    :cond_3
    const/4 v6, 0x1

    .line 233
    .local v6, rollback:Z
    :try_start_3
    sget-object v8, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;->COMPACT:Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;

    invoke-virtual {v1, v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->newPack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase$PackSource;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result-object v2

    .line 235
    .local v2, pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    :try_start_4
    invoke-static {v1, v2, v4, p1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->writePack(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 236
    invoke-static {v1, v2, v4}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->writeIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)V

    .line 238
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getStatistics()Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;

    move-result-object v7

    .line 239
    .local v7, stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    .line 240
    const/4 v4, 0x0

    .line 242
    invoke-virtual {v2, v7}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;->setPackStats(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;

    .line 243
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->toPrune()Ljava/util/List;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->commitPack(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 244
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->newPacks:Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->newStats:Ljava/util/List;

    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 246
    const/4 v6, 0x0

    .line 248
    if-eqz v6, :cond_4

    .line 249
    :try_start_5
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-virtual {v1, v8}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->rollbackPack(Ljava/util/Collection;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 252
    :cond_4
    if-eqz v4, :cond_5

    .line 253
    :try_start_6
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 256
    :cond_5
    iput-object v12, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 257
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->release()V

    goto :goto_0

    .line 248
    .end local v7           #stats:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;
    :catchall_0
    move-exception v8

    if-eqz v6, :cond_6

    .line 249
    :try_start_7
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    invoke-virtual {v1, v9}, Lorg/eclipse/jgit/internal/storage/dfs/DfsObjDatabase;->rollbackPack(Ljava/util/Collection;)V

    :cond_6
    throw v8
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 252
    .end local v2           #pack:Lorg/eclipse/jgit/internal/storage/dfs/DfsPackDescription;
    .end local v6           #rollback:Z
    :catchall_1
    move-exception v8

    if-eqz v4, :cond_7

    .line 253
    :try_start_8
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    :cond_7
    throw v8
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 256
    .end local v3           #pc:Lorg/eclipse/jgit/storage/pack/PackConfig;
    .end local v4           #pw:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    :catchall_2
    move-exception v8

    iput-object v12, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->rw:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 257
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->release()V

    throw v8
.end method

.method public exclude(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;
    .locals 3
    .parameter "pack"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->repo:Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsRepository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;

    .line 184
    .local v0, ctx:Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;
    :try_start_0
    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackFile;->getPackIndex(Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 186
    .local v1, idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->release()V

    .line 188
    new-instance v2, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$1;

    invoke-direct {v2, p0, v1}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor$1;-><init>(Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->exclude(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;

    move-result-object v2

    return-object v2

    .line 186
    .end local v1           #idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsReader;->release()V

    throw v2
.end method

.method public exclude(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;)Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;
    .locals 1
    .parameter "set"

    .prologue
    .line 167
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->exclude:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    return-object p0
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
    .line 273
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->newStats:Ljava/util/List;

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
    .line 268
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->newPacks:Ljava/util/List;

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
    .line 263
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/dfs/DfsPackCompactor;->toPrune()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
