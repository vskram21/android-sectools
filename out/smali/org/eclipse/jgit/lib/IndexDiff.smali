.class public Lorg/eclipse/jgit/lib/IndexDiff;
.super Ljava/lang/Object;
.source "IndexDiff.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/IndexDiff$1;,
        Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;,
        Lorg/eclipse/jgit/lib/IndexDiff$StageState;
    }
.end annotation


# static fields
.field private static final INDEX:I = 0x1

.field private static final TREE:I = 0x0

.field private static final WORKDIR:I = 0x2


# instance fields
.field private added:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private assumeUnchanged:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private changed:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private conflicts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/IndexDiff$StageState;",
            ">;"
        }
    .end annotation
.end field

.field private dirCache:Lorg/eclipse/jgit/dircache/DirCache;

.field private filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

.field private ignored:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private indexDiffFilter:Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;

.field private final initialWorkingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

.field private missing:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private modified:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private removed:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final repository:Lorg/eclipse/jgit/lib/Repository;

.field private final tree:Lorg/eclipse/jgit/revwalk/RevTree;

.field private untracked:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V
    .locals 3
    .parameter "repository"
    .parameter "revstr"
    .parameter "workingTreeIterator"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 283
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 245
    iput-object v2, p0, Lorg/eclipse/jgit/lib/IndexDiff;->filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 249
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->added:Ljava/util/Set;

    .line 251
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->changed:Ljava/util/Set;

    .line 253
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->removed:Ljava/util/Set;

    .line 255
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->missing:Ljava/util/Set;

    .line 257
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->modified:Ljava/util/Set;

    .line 259
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->untracked:Ljava/util/Set;

    .line 261
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->conflicts:Ljava/util/Map;

    .line 284
    iput-object p1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->repository:Lorg/eclipse/jgit/lib/Repository;

    .line 285
    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 286
    .local v0, objectId:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v0, :cond_0

    .line 287
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v1, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->tree:Lorg/eclipse/jgit/revwalk/RevTree;

    .line 290
    :goto_0
    iput-object p3, p0, Lorg/eclipse/jgit/lib/IndexDiff;->initialWorkingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 291
    return-void

    .line 289
    :cond_0
    iput-object v2, p0, Lorg/eclipse/jgit/lib/IndexDiff;->tree:Lorg/eclipse/jgit/revwalk/RevTree;

    goto :goto_0
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V
    .locals 2
    .parameter "repository"
    .parameter "objectId"
    .parameter "workingTreeIterator"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 304
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 245
    iput-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 249
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->added:Ljava/util/Set;

    .line 251
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->changed:Ljava/util/Set;

    .line 253
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->removed:Ljava/util/Set;

    .line 255
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->missing:Ljava/util/Set;

    .line 257
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->modified:Ljava/util/Set;

    .line 259
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->untracked:Ljava/util/Set;

    .line 261
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->conflicts:Ljava/util/Map;

    .line 305
    iput-object p1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->repository:Lorg/eclipse/jgit/lib/Repository;

    .line 306
    if-eqz p2, :cond_0

    .line 307
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->tree:Lorg/eclipse/jgit/revwalk/RevTree;

    .line 310
    :goto_0
    iput-object p3, p0, Lorg/eclipse/jgit/lib/IndexDiff;->initialWorkingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 311
    return-void

    .line 309
    :cond_0
    iput-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->tree:Lorg/eclipse/jgit/revwalk/RevTree;

    goto :goto_0
.end method

.method private addConflict(Ljava/lang/String;I)V
    .locals 5
    .parameter "path"
    .parameter "stage"

    .prologue
    .line 466
    iget-object v4, p0, Lorg/eclipse/jgit/lib/IndexDiff;->conflicts:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    .line 467
    .local v0, existingStageStates:Lorg/eclipse/jgit/lib/IndexDiff$StageState;
    const/4 v2, 0x0

    .line 468
    .local v2, stageMask:B
    if-eqz v0, :cond_0

    .line 469
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->getStageMask()I

    move-result v4

    or-int/2addr v4, v2

    int-to-byte v2, v4

    .line 471
    :cond_0
    add-int/lit8 v1, p2, -0x1

    .line 472
    .local v1, shifts:I
    const/4 v4, 0x1

    shl-int/2addr v4, v1

    or-int/2addr v4, v2

    int-to-byte v2, v4

    .line 473
    invoke-static {v2}, Lorg/eclipse/jgit/lib/IndexDiff$StageState;->fromMask(I)Lorg/eclipse/jgit/lib/IndexDiff$StageState;

    move-result-object v3

    .line 474
    .local v3, stageState:Lorg/eclipse/jgit/lib/IndexDiff$StageState;
    iget-object v4, p0, Lorg/eclipse/jgit/lib/IndexDiff;->conflicts:Ljava/util/Map;

    invoke-interface {v4, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 475
    return-void
.end method


# virtual methods
.method public diff()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 332
    const/4 v0, 0x0

    const-string v1, ""

    invoke-virtual {p0, v0, v2, v2, v1}, Lorg/eclipse/jgit/lib/IndexDiff;->diff(Lorg/eclipse/jgit/lib/ProgressMonitor;IILjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public diff(Lorg/eclipse/jgit/lib/ProgressMonitor;IILjava/lang/String;)Z
    .locals 13
    .parameter "monitor"
    .parameter "estWorkTreeSize"
    .parameter "estIndexSize"
    .parameter "title"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 359
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/Repository;->readDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v10

    iput-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->dirCache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 361
    new-instance v8, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->repository:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v8, v10}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 362
    .local v8, treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    const/4 v10, 0x1

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 364
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->tree:Lorg/eclipse/jgit/revwalk/RevTree;

    if-eqz v10, :cond_4

    .line 365
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->tree:Lorg/eclipse/jgit/revwalk/RevTree;

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 368
    :goto_0
    new-instance v10, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    iget-object v11, p0, Lorg/eclipse/jgit/lib/IndexDiff;->dirCache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 369
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->initialWorkingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 370
    new-instance v3, Ljava/util/ArrayList;

    const/4 v10, 0x4

    invoke-direct {v3, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 372
    .local v3, filters:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/treewalk/filter/TreeFilter;>;"
    if-eqz p1, :cond_1

    .line 375
    if-nez p3, :cond_0

    .line 376
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->dirCache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v10}, Lorg/eclipse/jgit/dircache/DirCache;->getEntryCount()I

    move-result p3

    .line 377
    :cond_0
    mul-int/lit8 v10, p3, 0xa

    div-int/lit8 v10, v10, 0x9

    mul-int/lit8 v11, p2, 0xa

    div-int/lit8 v11, v11, 0x9

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 379
    .local v6, total:I
    move-object/from16 v0, p4

    invoke-interface {p1, v0, v6}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 380
    new-instance v10, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;

    const/4 v11, 0x0

    invoke-direct {v10, p1, v6, v11}, Lorg/eclipse/jgit/lib/IndexDiff$ProgressReportingFilter;-><init>(Lorg/eclipse/jgit/lib/ProgressMonitor;ILorg/eclipse/jgit/lib/IndexDiff$1;)V

    invoke-interface {v3, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 383
    .end local v6           #total:I
    :cond_1
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    if-eqz v10, :cond_2

    .line 384
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-interface {v3, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 385
    :cond_2
    new-instance v10, Lorg/eclipse/jgit/treewalk/filter/SkipWorkTreeFilter;

    const/4 v11, 0x1

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/treewalk/filter/SkipWorkTreeFilter;-><init>(I)V

    invoke-interface {v3, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 386
    new-instance v10, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;

    const/4 v11, 0x1

    const/4 v12, 0x2

    invoke-direct {v10, v11, v12}, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;-><init>(II)V

    iput-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->indexDiffFilter:Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;

    .line 387
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->indexDiffFilter:Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;

    invoke-interface {v3, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 388
    invoke-static {v3}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;->create(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v10

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 389
    :cond_3
    :goto_1
    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v10

    if-eqz v10, :cond_c

    .line 390
    const/4 v10, 0x0

    const-class v11, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v8, v10, v11}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v7

    .line 392
    .local v7, treeIterator:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    const/4 v10, 0x1

    const-class v11, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual {v8, v10, v11}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 394
    .local v2, dirCacheIterator:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    const/4 v10, 0x2

    const-class v11, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v8, v10, v11}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v9

    check-cast v9, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 397
    .local v9, workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    if-eqz v2, :cond_5

    .line 398
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v1

    .line 400
    .local v1, dirCacheEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-eqz v1, :cond_5

    .line 401
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v5

    .line 402
    .local v5, stage:I
    if-lez v5, :cond_5

    .line 403
    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v4

    .line 404
    .local v4, path:Ljava/lang/String;
    invoke-direct {p0, v4, v5}, Lorg/eclipse/jgit/lib/IndexDiff;->addConflict(Ljava/lang/String;I)V

    goto :goto_1

    .line 367
    .end local v1           #dirCacheEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v2           #dirCacheIterator:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v3           #filters:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/treewalk/filter/TreeFilter;>;"
    .end local v4           #path:Ljava/lang/String;
    .end local v5           #stage:I
    .end local v7           #treeIterator:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v9           #workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    :cond_4
    new-instance v10, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;

    invoke-direct {v10}, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;-><init>()V

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    goto/16 :goto_0

    .line 410
    .restart local v2       #dirCacheIterator:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .restart local v3       #filters:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/treewalk/filter/TreeFilter;>;"
    .restart local v7       #treeIterator:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .restart local v9       #workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    :cond_5
    if-eqz v7, :cond_9

    .line 411
    if-eqz v2, :cond_8

    .line 412
    invoke-virtual {v7, v2}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v10

    if-eqz v10, :cond_6

    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryRawMode()I

    move-result v10

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getEntryRawMode()I

    move-result v11

    if-eq v10, v11, :cond_7

    .line 416
    :cond_6
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->changed:Ljava/util/Set;

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 437
    :cond_7
    :goto_2
    if-eqz v2, :cond_3

    .line 438
    if-nez v9, :cond_b

    .line 440
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->missing:Ljava/util/Set;

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 420
    :cond_8
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->removed:Ljava/util/Set;

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 421
    if-eqz v9, :cond_7

    .line 422
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->untracked:Ljava/util/Set;

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 425
    :cond_9
    if-eqz v2, :cond_a

    .line 427
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->added:Ljava/util/Set;

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 430
    :cond_a
    if-eqz v9, :cond_7

    invoke-virtual {v9}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isEntryIgnored()Z

    move-result v10

    if-nez v10, :cond_7

    .line 432
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->untracked:Ljava/util/Set;

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 442
    :cond_b
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v10

    const/4 v11, 0x1

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v12

    invoke-virtual {v9, v10, v11, v12}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 446
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->modified:Ljava/util/Set;

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 453
    .end local v2           #dirCacheIterator:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v7           #treeIterator:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v9           #workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    :cond_c
    if-eqz p1, :cond_d

    .line 454
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 456
    :cond_d
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->indexDiffFilter:Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;

    invoke-virtual {v10}, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->getIgnoredPaths()Ljava/util/Set;

    move-result-object v10

    iput-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->ignored:Ljava/util/Set;

    .line 457
    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->added:Ljava/util/Set;

    invoke-interface {v10}, Ljava/util/Set;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_e

    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->changed:Ljava/util/Set;

    invoke-interface {v10}, Ljava/util/Set;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_e

    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->removed:Ljava/util/Set;

    invoke-interface {v10}, Ljava/util/Set;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_e

    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->missing:Ljava/util/Set;

    invoke-interface {v10}, Ljava/util/Set;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_e

    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->modified:Ljava/util/Set;

    invoke-interface {v10}, Ljava/util/Set;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_e

    iget-object v10, p0, Lorg/eclipse/jgit/lib/IndexDiff;->untracked:Ljava/util/Set;

    invoke-interface {v10}, Ljava/util/Set;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_e

    .line 460
    const/4 v10, 0x0

    .line 462
    :goto_3
    return v10

    :cond_e
    const/4 v10, 0x1

    goto :goto_3
.end method

.method public getAdded()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 481
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->added:Ljava/util/Set;

    return-object v0
.end method

.method public getAssumeUnchanged()Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 553
    iget-object v2, p0, Lorg/eclipse/jgit/lib/IndexDiff;->assumeUnchanged:Ljava/util/Set;

    if-nez v2, :cond_2

    .line 554
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 555
    .local v1, unchanged:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/lib/IndexDiff;->dirCache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->getEntryCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 556
    iget-object v2, p0, Lorg/eclipse/jgit/lib/IndexDiff;->dirCache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/dircache/DirCache;->getEntry(I)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isAssumeValid()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 557
    iget-object v2, p0, Lorg/eclipse/jgit/lib/IndexDiff;->dirCache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/dircache/DirCache;->getEntry(I)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 555
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 558
    :cond_1
    iput-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->assumeUnchanged:Ljava/util/Set;

    .line 560
    .end local v0           #i:I
    .end local v1           #unchanged:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/lib/IndexDiff;->assumeUnchanged:Ljava/util/Set;

    return-object v2
.end method

.method public getChanged()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 488
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->changed:Ljava/util/Set;

    return-object v0
.end method

.method public getConflicting()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 524
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->conflicts:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getConflictingStageStates()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/IndexDiff$StageState;",
            ">;"
        }
    .end annotation

    .prologue
    .line 533
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->conflicts:Ljava/util/Map;

    return-object v0
.end method

.method public getIgnoredNotInIndex()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 546
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->ignored:Ljava/util/Set;

    return-object v0
.end method

.method public getIndexMode(Ljava/lang/String;)Lorg/eclipse/jgit/lib/FileMode;
    .locals 2
    .parameter "path"

    .prologue
    .line 578
    iget-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->dirCache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/dircache/DirCache;->getEntry(Ljava/lang/String;)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v0

    .line 579
    .local v0, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0
.end method

.method public getMissing()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 502
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->missing:Ljava/util/Set;

    return-object v0
.end method

.method public getModified()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 509
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->modified:Ljava/util/Set;

    return-object v0
.end method

.method public getRemoved()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 495
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->removed:Ljava/util/Set;

    return-object v0
.end method

.method public getUntracked()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 516
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->untracked:Ljava/util/Set;

    return-object v0
.end method

.method public getUntrackedFolders()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 567
    iget-object v0, p0, Lorg/eclipse/jgit/lib/IndexDiff;->indexDiffFilter:Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->indexDiffFilter:Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;->getUntrackedFolders()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    goto :goto_0
.end method

.method public setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V
    .locals 0
    .parameter "filter"

    .prologue
    .line 320
    iput-object p1, p0, Lorg/eclipse/jgit/lib/IndexDiff;->filter:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    .line 321
    return-void
.end method
