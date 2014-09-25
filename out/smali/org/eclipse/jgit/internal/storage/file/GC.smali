.class public Lorg/eclipse/jgit/internal/storage/file/GC;
.super Ljava/lang/Object;
.source "GC.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;
    }
.end annotation


# static fields
.field private static final PRUNE_EXPIRE_DEFAULT:Ljava/lang/String; = "2.weeks.ago"


# instance fields
.field private expire:Ljava/util/Date;

.field private expireAgeMillis:J

.field private lastPackedRefs:Ljava/util/Map;
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

.field private lastRepackTime:J

.field private pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

.field private final repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileRepository;)V
    .locals 2
    .parameter "repo"

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->expireAgeMillis:J

    .line 143
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    .line 144
    sget-object v0, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 145
    return-void
.end method

.method private deleteOldPacks(Ljava/util/Collection;Ljava/util/Collection;)V
    .locals 6
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackFile;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackFile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 182
    .local p1, oldPacks:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/file/PackFile;>;"
    .local p2, newPacks:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/file/PackFile;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 183
    .local v4, oldPack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackName()Ljava/lang/String;

    move-result-object v3

    .line 186
    .local v3, oldName:Ljava/lang/String;
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 187
    .local v2, newPack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_0

    .line 190
    .end local v2           #newPack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_2
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->shouldBeKept()Z

    move-result v5

    if-nez v5, :cond_0

    .line 191
    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->close()V

    .line 192
    invoke-direct {p0, v3}, Lorg/eclipse/jgit/internal/storage/file/GC;->prunePack(Ljava/lang/String;)V

    goto :goto_0

    .line 197
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v3           #oldName:Ljava/lang/String;
    .end local v4           #oldPack:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_3
    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->close()V

    .line 198
    return-void
.end method

.method private static equals(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Z
    .locals 2
    .parameter "r1"
    .parameter "r2"

    .prologue
    const/4 v0, 0x0

    .line 465
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 474
    :cond_0
    :goto_0
    return v0

    .line 467
    :cond_1
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 468
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 470
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0

    .line 472
    :cond_2
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v1

    if-nez v1, :cond_0

    .line 474
    invoke-interface {p0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    goto :goto_0
.end method

.method private getAllRefs()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
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
    .line 601
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    .line 602
    .local v2, ret:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/RefDatabase;->getAdditionalRefs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/Ref;

    .line 603
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 604
    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    return-object v2
.end method

.method private listNonHEADIndexObjects()Ljava/util/Set;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 618
    const/4 v4, 0x0

    .line 620
    .local v4, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getIndexFile()Ljava/io/File;

    move-result-object v7

    if-nez v7, :cond_0

    .line 621
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/NoWorkTreeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 665
    :goto_0
    return-object v3

    .line 622
    :catch_0
    move-exception v0

    .line 623
    .local v0, e:Lorg/eclipse/jgit/errors/NoWorkTreeException;
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v3

    goto :goto_0

    .line 625
    .end local v0           #e:Lorg/eclipse/jgit/errors/NoWorkTreeException;
    :cond_0
    new-instance v6, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 627
    .local v6, treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :try_start_1
    new-instance v7, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    iget-object v8, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->readDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 628
    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    const-string v8, "HEAD"

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 629
    .local v1, headID:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v1, :cond_1

    .line 630
    new-instance v5, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v7, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-direct {v5, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 631
    .end local v4           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .local v5, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_2
    invoke-virtual {v5, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 632
    invoke-virtual {v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->dispose()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 633
    const/4 v4, 0x0

    .line 636
    .end local v5           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v4       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :cond_1
    :try_start_3
    sget-object v7, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ANY_DIFF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 637
    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 638
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 640
    .local v3, ret:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :goto_1
    :sswitch_0
    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 641
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 642
    .local v2, objectId:Lorg/eclipse/jgit/lib/ObjectId;
    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v7

    const v8, 0xf000

    and-int/2addr v7, v8

    sparse-switch v7, :sswitch_data_0

    .line 652
    new-instance v8, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v9, v7, Lorg/eclipse/jgit/internal/JGitText;->corruptObjectInvalidMode3:Ljava/lang/String;

    const/4 v7, 0x4

    new-array v10, v7, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v11, "%o"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual {v6, v14}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v7

    const/4 v11, 0x1

    if-nez v2, :cond_3

    const-string v7, "null"

    :goto_2
    aput-object v7, v10, v11

    const/4 v7, 0x2

    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v7

    const/4 v7, 0x3

    iget-object v11, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {v11}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getIndexFile()Ljava/io/File;

    move-result-object v11

    aput-object v11, v10, v7

    invoke-static {v9, v10}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v8, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 663
    .end local v1           #headID:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v2           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v3           #ret:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :catchall_0
    move-exception v7

    :goto_3
    if-eqz v4, :cond_2

    .line 664
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->dispose()V

    .line 665
    :cond_2
    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    throw v7

    .line 649
    .restart local v1       #headID:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v2       #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v3       #ret:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    :sswitch_1
    :try_start_4
    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 652
    :cond_3
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v7

    goto :goto_2

    .line 663
    .end local v2           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_4
    if-eqz v4, :cond_5

    .line 664
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->dispose()V

    .line 665
    :cond_5
    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    goto/16 :goto_0

    .line 663
    .end local v3           #ret:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    .end local v4           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v5       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :catchall_1
    move-exception v7

    move-object v4, v5

    .end local v5           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v4       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    goto :goto_3

    .line 642
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x4000 -> :sswitch_1
        0x8000 -> :sswitch_1
        0xa000 -> :sswitch_1
        0xe000 -> :sswitch_0
    .end sparse-switch
.end method

.method private listRefLogObjects(Lorg/eclipse/jgit/lib/Ref;J)Ljava/util/Set;
    .locals 8
    .parameter "ref"
    .parameter "minTime"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Ref;",
            "J)",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 575
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getReflogReader(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ReflogReader;

    move-result-object v6

    invoke-interface {v6}, Lorg/eclipse/jgit/lib/ReflogReader;->getReverseEntries()Ljava/util/List;

    move-result-object v5

    .line 577
    .local v5, rlEntries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/ReflogEntry;>;"
    if-eqz v5, :cond_0

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 578
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v4

    .line 590
    :cond_1
    return-object v4

    .line 579
    :cond_2
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 580
    .local v4, ret:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/ReflogEntry;

    .line 581
    .local v0, e:Lorg/eclipse/jgit/lib/ReflogEntry;
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/ReflogEntry;->getWho()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/PersonIdent;->getWhen()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    cmp-long v6, v6, p2

    if-ltz v6, :cond_1

    .line 583
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/ReflogEntry;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 584
    .local v2, newId:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v2, :cond_4

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v6, v2}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 585
    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 586
    :cond_4
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/ReflogEntry;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 587
    .local v3, oldId:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v3, :cond_3

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v6, v3}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 588
    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private nameFor(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .parameter "name"
    .parameter "ext"

    .prologue
    .line 821
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectsDirectory()Ljava/io/File;

    move-result-object v1

    const-string v2, "pack"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 822
    .local v0, packdir:Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "pack-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v1
.end method

.method private static objectIdSet(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    .locals 1
    .parameter "idx"

    .prologue
    .line 968
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/GC$2;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/internal/storage/file/GC$2;-><init>(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V

    return-object v0
.end method

.method private prunePack(Ljava/lang/String;)V
    .locals 9
    .parameter "packName"

    .prologue
    .line 211
    invoke-static {}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->values()[Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    move-result-object v3

    .line 215
    .local v3, extensions:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    const/4 v1, 0x6

    .line 216
    .local v1, deleteOptions:I
    move-object v0, v3

    .local v0, arr$:[Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    :try_start_0
    array-length v6, v0

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_0
    if-ge v5, v6, :cond_0

    aget-object v2, v0, v5

    .line 217
    .local v2, ext:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    sget-object v7, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v7, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 218
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getExtension()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, p1, v7}, Lorg/eclipse/jgit/internal/storage/file/GC;->nameFor(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 219
    .local v4, f:Ljava/io/File;
    invoke-static {v4, v1}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 224
    .end local v2           #ext:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    .end local v4           #f:Ljava/io/File;
    :cond_0
    or-int/lit8 v1, v1, 0x8

    .line 225
    move-object v0, v3

    array-length v6, v0

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v6, :cond_3

    aget-object v2, v0, v5

    .line 226
    .restart local v2       #ext:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    sget-object v7, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->PACK:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual {v7, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 227
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getExtension()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, p1, v7}, Lorg/eclipse/jgit/internal/storage/file/GC;->nameFor(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 228
    .restart local v4       #f:Ljava/io/File;
    invoke-static {v4, v1}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    .end local v4           #f:Ljava/io/File;
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 216
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 231
    .end local v2           #ext:Lorg/eclipse/jgit/internal/storage/pack/PackExt;
    .end local v5           #i$:I
    .end local v6           #len$:I
    :catch_0
    move-exception v7

    .line 234
    :cond_3
    return-void
.end method

.method private removeReferenced(Ljava/util/Map;Lorg/eclipse/jgit/revwalk/ObjectWalk;)V
    .locals 2
    .parameter
    .parameter "w"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Ljava/io/File;",
            ">;",
            "Lorg/eclipse/jgit/revwalk/ObjectWalk;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 448
    .local p1, id2File:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/io/File;>;"
    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 449
    .local v0, ro:Lorg/eclipse/jgit/revwalk/RevObject;
    :goto_0
    if-eqz v0, :cond_2

    .line 450
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevObject;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 451
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 462
    :cond_0
    return-void

    .line 453
    :cond_1
    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    goto :goto_0

    .line 455
    :cond_2
    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->nextObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    .line 456
    :goto_1
    if-eqz v0, :cond_0

    .line 457
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevObject;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 458
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 460
    :cond_3
    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->nextObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    goto :goto_1
.end method

.method private writePack(Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/util/List;)Lorg/eclipse/jgit/internal/storage/file/PackFile;
    .locals 32
    .parameter
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/util/Set",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;",
            ">;)",
            "Lorg/eclipse/jgit/internal/storage/file/PackFile;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 672
    .local p1, want:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p2, have:Ljava/util/Set;,"Ljava/util/Set<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p3, tagTargets:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    .local p4, excludeObjects:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;>;"
    const/16 v26, 0x0

    .line 673
    .local v26, tmpPack:Ljava/io/File;
    new-instance v24, Ljava/util/TreeMap;

    new-instance v27, Lorg/eclipse/jgit/internal/storage/file/GC$1;

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/GC$1;-><init>(Lorg/eclipse/jgit/internal/storage/file/GC;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 689
    .local v24, tmpExts:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/internal/storage/pack/PackExt;Ljava/io/File;>;"
    new-instance v17, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v27, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v27

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 692
    .local v17, pw:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;
    const/16 v27, 0x1

    :try_start_0
    move-object/from16 v0, v17

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setDeltaBaseAsOffset(Z)V

    .line 693
    const/16 v27, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setReuseDeltaCommits(Z)V

    .line 694
    if-eqz p3, :cond_0

    .line 695
    move-object/from16 v0, v17

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->setTagTargets(Ljava/util/Set;)V

    .line 696
    :cond_0
    if-eqz p4, :cond_3

    .line 697
    invoke-interface/range {p4 .. p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    .line 698
    .local v11, idx:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->excludeObjects(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 810
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v11           #idx:Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
    :catchall_0
    move-exception v27

    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    .line 811
    if-eqz v26, :cond_1

    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->exists()Z

    move-result v28

    if-eqz v28, :cond_1

    .line 812
    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->delete()Z

    .line 813
    :cond_1
    invoke-interface/range {v24 .. v24}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v28

    invoke-interface/range {v28 .. v28}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_16

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/io/File;

    .line 814
    .local v23, tmpExt:Ljava/io/File;
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->exists()Z

    move-result v28

    if-eqz v28, :cond_2

    .line 815
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 699
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v23           #tmpExt:Ljava/io/File;
    :cond_3
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v27, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v27

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->preparePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/util/Set;Ljava/util/Set;)V

    .line 700
    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->getObjectCount()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v27

    const-wide/16 v29, 0x0

    cmp-long v27, v27, v29

    if-nez v27, :cond_6

    .line 701
    const/16 v27, 0x0

    .line 810
    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    .line 811
    if-eqz v26, :cond_4

    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->exists()Z

    move-result v28

    if-eqz v28, :cond_4

    .line 812
    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->delete()Z

    .line 813
    :cond_4
    invoke-interface/range {v24 .. v24}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v28

    invoke-interface/range {v28 .. v28}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_5
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_17

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/io/File;

    .line 814
    .restart local v23       #tmpExt:Ljava/io/File;
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->exists()Z

    move-result v28

    if-eqz v28, :cond_5

    .line 815
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    goto :goto_2

    .line 704
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v23           #tmpExt:Ljava/io/File;
    :cond_6
    :try_start_2
    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->computeName()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/lib/ObjectId;->getName()Ljava/lang/String;

    move-result-object v10

    .line 705
    .local v10, id:Ljava/lang/String;
    new-instance v16, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectsDirectory()Ljava/io/File;

    move-result-object v27

    const-string v28, "pack"

    move-object/from16 v0, v16

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 706
    .local v16, packdir:Ljava/io/File;
    const-string v27, "gc_"

    const-string v28, ".pack_tmp"

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v26

    .line 707
    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v27

    const/16 v28, 0x0

    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x2e

    invoke-virtual/range {v29 .. v30}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v29

    invoke-virtual/range {v27 .. v29}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    .line 709
    .local v20, tmpBase:Ljava/lang/String;
    new-instance v25, Ljava/io/File;

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ".idx_tmp"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v25

    move-object/from16 v1, v16

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 710
    .local v25, tmpIdx:Ljava/io/File;
    sget-object v27, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    move-object/from16 v0, v24

    move-object/from16 v1, v27

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 712
    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->createNewFile()Z

    move-result v27

    if-nez v27, :cond_7

    .line 713
    new-instance v27, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v28

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->cannotCreateIndexfile:Ljava/lang/String;

    move-object/from16 v28, v0

    const/16 v29, 0x1

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v31

    aput-object v31, v29, v30

    invoke-static/range {v28 .. v29}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    invoke-direct/range {v27 .. v28}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 717
    :cond_7
    new-instance v8, Ljava/io/FileOutputStream;

    move-object/from16 v0, v26

    invoke-direct {v8, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 718
    .local v8, fos:Ljava/io/FileOutputStream;
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    .line 719
    .local v4, channel:Ljava/nio/channels/FileChannel;
    invoke-static {v4}, Ljava/nio/channels/Channels;->newOutputStream(Ljava/nio/channels/WritableByteChannel;)Ljava/io/OutputStream;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v5

    .line 721
    .local v5, channelStream:Ljava/io/OutputStream;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v27, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v28, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-virtual {v0, v1, v2, v5}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writePack(Lorg/eclipse/jgit/lib/ProgressMonitor;Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 723
    const/16 v27, 0x1

    :try_start_4
    move/from16 v0, v27

    invoke-virtual {v4, v0}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 724
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 725
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 729
    new-instance v8, Ljava/io/FileOutputStream;

    .end local v8           #fos:Ljava/io/FileOutputStream;
    move-object/from16 v0, v25

    invoke-direct {v8, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 730
    .restart local v8       #fos:Ljava/io/FileOutputStream;
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v12

    .line 731
    .local v12, idxChannel:Ljava/nio/channels/FileChannel;
    invoke-static {v12}, Ljava/nio/channels/Channels;->newOutputStream(Ljava/nio/channels/WritableByteChannel;)Ljava/io/OutputStream;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v13

    .line 733
    .local v13, idxStream:Ljava/io/OutputStream;
    :try_start_5
    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeIndex(Ljava/io/OutputStream;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 735
    const/16 v27, 0x1

    :try_start_6
    move/from16 v0, v27

    invoke-virtual {v12, v0}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 736
    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V

    .line 737
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 740
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v27, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->prepareBitmapIndex(Lorg/eclipse/jgit/lib/ProgressMonitor;)Z

    move-result v27

    if-eqz v27, :cond_9

    .line 741
    new-instance v21, Ljava/io/File;

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v27

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    const-string v28, ".bitmap_tmp"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 742
    .local v21, tmpBitmapIdx:Ljava/io/File;
    sget-object v27, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->BITMAP_INDEX:Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    move-object/from16 v0, v24

    move-object/from16 v1, v27

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 744
    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->createNewFile()Z

    move-result v27

    if-nez v27, :cond_8

    .line 745
    new-instance v27, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v28

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->cannotCreateIndexfile:Ljava/lang/String;

    move-object/from16 v28, v0

    const/16 v29, 0x1

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v31

    aput-object v31, v29, v30

    invoke-static/range {v28 .. v29}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    invoke-direct/range {v27 .. v28}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 723
    .end local v12           #idxChannel:Ljava/nio/channels/FileChannel;
    .end local v13           #idxStream:Ljava/io/OutputStream;
    .end local v21           #tmpBitmapIdx:Ljava/io/File;
    :catchall_1
    move-exception v27

    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v4, v0}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 724
    invoke-virtual {v5}, Ljava/io/OutputStream;->close()V

    .line 725
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    throw v27

    .line 735
    .restart local v12       #idxChannel:Ljava/nio/channels/FileChannel;
    .restart local v13       #idxStream:Ljava/io/OutputStream;
    :catchall_2
    move-exception v27

    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v12, v0}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 736
    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V

    .line 737
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    throw v27

    .line 749
    .restart local v21       #tmpBitmapIdx:Ljava/io/File;
    :cond_8
    new-instance v8, Ljava/io/FileOutputStream;

    .end local v8           #fos:Ljava/io/FileOutputStream;
    move-object/from16 v0, v21

    invoke-direct {v8, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 750
    .restart local v8       #fos:Ljava/io/FileOutputStream;
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v12

    .line 751
    invoke-static {v12}, Ljava/nio/channels/Channels;->newOutputStream(Ljava/nio/channels/WritableByteChannel;)Ljava/io/OutputStream;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v13

    .line 753
    :try_start_7
    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeBitmapIndex(Ljava/io/OutputStream;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 755
    const/16 v27, 0x1

    :try_start_8
    move/from16 v0, v27

    invoke-virtual {v12, v0}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 756
    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V

    .line 757
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    .line 762
    .end local v21           #tmpBitmapIdx:Ljava/io/File;
    :cond_9
    const-string v27, ".pack"

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v10, v1}, Lorg/eclipse/jgit/internal/storage/file/GC;->nameFor(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v19

    .line 768
    .local v19, realPack:Ljava/io/File;
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v27

    if-eqz v27, :cond_b

    .line 769
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getPacks()Ljava/util/Collection;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_a
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_b

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 770
    .local v15, p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v27

    invoke-virtual {v15}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_a

    .line 771
    invoke-virtual {v15}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->close()V

    .line 774
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v15           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_b
    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->setReadOnly()Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 775
    const/4 v6, 0x1

    .line 777
    .local v6, delete:Z
    :try_start_9
    move-object/from16 v0, v26

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V

    .line 778
    const/4 v6, 0x0

    .line 779
    invoke-interface/range {v24 .. v24}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9       #i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_f

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/util/Map$Entry;

    .line 780
    .local v22, tmpEntry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Lorg/eclipse/jgit/internal/storage/pack/PackExt;Ljava/io/File;>;"
    invoke-interface/range {v22 .. v22}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/io/File;

    .line 781
    .restart local v23       #tmpExt:Ljava/io/File;
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->setReadOnly()Z

    .line 783
    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "."

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-interface/range {v22 .. v22}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lorg/eclipse/jgit/internal/storage/pack/PackExt;

    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/internal/storage/pack/PackExt;->getExtension()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v28

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-direct {v0, v10, v1}, Lorg/eclipse/jgit/internal/storage/file/GC;->nameFor(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    move-result-object v18

    .line 786
    .local v18, realExt:Ljava/io/File;
    :try_start_a
    move-object/from16 v0, v23

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0

    goto :goto_3

    .line 787
    :catch_0
    move-exception v7

    .line 788
    .local v7, e:Ljava/io/IOException;
    :try_start_b
    new-instance v14, Ljava/io/File;

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v27

    new-instance v28, Ljava/lang/StringBuilder;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    const-string v29, ".new"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v27

    move-object/from16 v1, v28

    invoke-direct {v14, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 790
    .local v14, newExt:Ljava/io/File;
    move-object/from16 v0, v23

    invoke-virtual {v0, v14}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v27

    if-nez v27, :cond_c

    .line 791
    move-object/from16 v14, v23

    .line 792
    :cond_c
    new-instance v27, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v28

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->panicCantRenameIndexFile:Ljava/lang/String;

    move-object/from16 v28, v0

    const/16 v29, 0x2

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    aput-object v14, v29, v30

    const/16 v30, 0x1

    aput-object v18, v29, v30

    invoke-static/range {v28 .. v29}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    invoke-direct/range {v27 .. v28}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v27
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 799
    .end local v7           #e:Ljava/io/IOException;
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v14           #newExt:Ljava/io/File;
    .end local v18           #realExt:Ljava/io/File;
    .end local v22           #tmpEntry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Lorg/eclipse/jgit/internal/storage/pack/PackExt;Ljava/io/File;>;"
    .end local v23           #tmpExt:Ljava/io/File;
    :catchall_3
    move-exception v27

    if-eqz v6, :cond_12

    .line 800
    :try_start_c
    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->exists()Z

    move-result v28

    if-eqz v28, :cond_d

    .line 801
    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->delete()Z

    .line 802
    :cond_d
    invoke-interface/range {v24 .. v24}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v28

    invoke-interface/range {v28 .. v28}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_e
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_12

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/io/File;

    .line 803
    .restart local v23       #tmpExt:Ljava/io/File;
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->exists()Z

    move-result v28

    if-eqz v28, :cond_e

    .line 804
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    goto :goto_4

    .line 755
    .end local v6           #delete:Z
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v19           #realPack:Ljava/io/File;
    .end local v23           #tmpExt:Ljava/io/File;
    .restart local v21       #tmpBitmapIdx:Ljava/io/File;
    :catchall_4
    move-exception v27

    const/16 v28, 0x1

    move/from16 v0, v28

    invoke-virtual {v12, v0}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 756
    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V

    .line 757
    invoke-virtual {v8}, Ljava/io/FileOutputStream;->close()V

    throw v27

    .line 799
    .end local v21           #tmpBitmapIdx:Ljava/io/File;
    .restart local v6       #delete:Z
    .restart local v9       #i$:Ljava/util/Iterator;
    .restart local v19       #realPack:Ljava/io/File;
    :cond_f
    if-eqz v6, :cond_13

    .line 800
    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->exists()Z

    move-result v27

    if-eqz v27, :cond_10

    .line 801
    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->delete()Z

    .line 802
    :cond_10
    invoke-interface/range {v24 .. v24}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_11
    :goto_5
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_13

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/io/File;

    .line 803
    .restart local v23       #tmpExt:Ljava/io/File;
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->exists()Z

    move-result v27

    if-eqz v27, :cond_11

    .line 804
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    goto :goto_5

    .line 805
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v23           #tmpExt:Ljava/io/File;
    :cond_12
    throw v27

    .line 808
    .restart local v9       #i$:Ljava/util/Iterator;
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->openPack(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    move-result-object v27

    .line 810
    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->release()V

    .line 811
    if-eqz v26, :cond_14

    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->exists()Z

    move-result v28

    if-eqz v28, :cond_14

    .line 812
    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->delete()Z

    .line 813
    :cond_14
    invoke-interface/range {v24 .. v24}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v28

    invoke-interface/range {v28 .. v28}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_15
    :goto_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v28

    if-eqz v28, :cond_17

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/io/File;

    .line 814
    .restart local v23       #tmpExt:Ljava/io/File;
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->exists()Z

    move-result v28

    if-eqz v28, :cond_15

    .line 815
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    goto :goto_6

    .line 816
    .end local v4           #channel:Ljava/nio/channels/FileChannel;
    .end local v5           #channelStream:Ljava/io/OutputStream;
    .end local v6           #delete:Z
    .end local v8           #fos:Ljava/io/FileOutputStream;
    .end local v10           #id:Ljava/lang/String;
    .end local v12           #idxChannel:Ljava/nio/channels/FileChannel;
    .end local v13           #idxStream:Ljava/io/OutputStream;
    .end local v16           #packdir:Ljava/io/File;
    .end local v19           #realPack:Ljava/io/File;
    .end local v20           #tmpBase:Ljava/lang/String;
    .end local v23           #tmpExt:Ljava/io/File;
    .end local v25           #tmpIdx:Ljava/io/File;
    :cond_16
    throw v27

    :cond_17
    return-object v27
.end method


# virtual methods
.method public gc()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackFile;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 163
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    const/4 v2, 0x6

    invoke-interface {v1, v2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->start(I)V

    .line 164
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/GC;->packRefs()V

    .line 166
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/GC;->repack()Ljava/util/Collection;

    move-result-object v0

    .line 167
    .local v0, newPacks:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/file/PackFile;>;"
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/internal/storage/file/GC;->prune(Ljava/util/Set;)V

    .line 169
    return-object v0
.end method

.method public getStatistics()Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 888
    new-instance v17, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;-><init>(Lorg/eclipse/jgit/internal/storage/file/GC;)V

    .line 889
    .local v17, ret:Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getPacks()Ljava/util/Collection;

    move-result-object v14

    .line 890
    .local v14, packs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/file/PackFile;>;"
    invoke-interface {v14}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 891
    .local v7, f:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    move-object/from16 v0, v17

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackedObjects:J

    move-wide/from16 v19, v0

    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getIndex()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectCount()J

    move-result-wide v21

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v17

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackedObjects:J

    .line 892
    move-object/from16 v0, v17

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackFiles:J

    move-wide/from16 v19, v0

    const-wide/16 v21, 0x1

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v17

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackFiles:J

    .line 893
    move-object/from16 v0, v17

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->sizeOfPackedObjects:J

    move-wide/from16 v19, v0

    invoke-virtual {v7}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getPackFile()Ljava/io/File;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->length()J

    move-result-wide v21

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v17

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->sizeOfPackedObjects:J

    goto :goto_0

    .line 895
    .end local v7           #f:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectsDirectory()Ljava/io/File;

    move-result-object v13

    .line 896
    .local v13, objDir:Ljava/io/File;
    invoke-virtual {v13}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v8

    .line 897
    .local v8, fanout:[Ljava/lang/String;
    if-eqz v8, :cond_4

    array-length v0, v8

    move/from16 v19, v0

    if-lez v19, :cond_4

    .line 898
    move-object v3, v8

    .local v3, arr$:[Ljava/lang/String;
    array-length v11, v3

    .local v11, len$:I
    const/4 v9, 0x0

    .local v9, i$:I
    move v10, v9

    .end local v3           #arr$:[Ljava/lang/String;
    .end local v9           #i$:I
    .end local v11           #len$:I
    .local v10, i$:I
    :goto_1
    if-ge v10, v11, :cond_4

    aget-object v5, v3, v10

    .line 899
    .local v5, d:Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_2

    .line 898
    .end local v10           #i$:I
    :cond_1
    add-int/lit8 v9, v10, 0x1

    .restart local v9       #i$:I
    move v10, v9

    .end local v9           #i$:I
    .restart local v10       #i$:I
    goto :goto_1

    .line 901
    :cond_2
    new-instance v19, Ljava/io/File;

    move-object/from16 v0, v19

    invoke-direct {v0, v13, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v6

    .line 902
    .local v6, entries:[Ljava/io/File;
    if-eqz v6, :cond_1

    .line 904
    move-object v4, v6

    .local v4, arr$:[Ljava/io/File;
    array-length v12, v4

    .local v12, len$:I
    const/4 v9, 0x0

    .end local v10           #i$:I
    .restart local v9       #i$:I
    :goto_2
    if-ge v9, v12, :cond_1

    aget-object v7, v4, v9

    .line 905
    .local v7, f:Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x26

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_3

    .line 904
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 907
    :cond_3
    move-object/from16 v0, v17

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfLooseObjects:J

    move-wide/from16 v19, v0

    const-wide/16 v21, 0x1

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v17

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfLooseObjects:J

    .line 908
    move-object/from16 v0, v17

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->sizeOfLooseObjects:J

    move-wide/from16 v19, v0

    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v21

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v17

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->sizeOfLooseObjects:J

    goto :goto_3

    .line 913
    .end local v4           #arr$:[Ljava/io/File;
    .end local v5           #d:Ljava/lang/String;
    .end local v6           #entries:[Ljava/io/File;
    .end local v7           #f:Ljava/io/File;
    .end local v9           #i$:I
    .end local v12           #len$:I
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v16

    .line 914
    .local v16, refDb:Lorg/eclipse/jgit/lib/RefDatabase;
    const-string v19, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :cond_5
    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_9

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/eclipse/jgit/lib/Ref;

    .line 915
    .local v15, r:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v15}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v18

    .line 916
    .local v18, storage:Lorg/eclipse/jgit/lib/Ref$Storage;
    sget-object v19, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_6

    sget-object v19, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE_PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_7

    .line 917
    :cond_6
    move-object/from16 v0, v17

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfLooseRefs:J

    move-wide/from16 v19, v0

    const-wide/16 v21, 0x1

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v17

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfLooseRefs:J

    .line 918
    :cond_7
    sget-object v19, Lorg/eclipse/jgit/lib/Ref$Storage;->PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-eq v0, v1, :cond_8

    sget-object v19, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE_PACKED:Lorg/eclipse/jgit/lib/Ref$Storage;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_5

    .line 919
    :cond_8
    move-object/from16 v0, v17

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackedRefs:J

    move-wide/from16 v19, v0

    const-wide/16 v21, 0x1

    add-long v19, v19, v21

    move-wide/from16 v0, v19

    move-object/from16 v2, v17

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/file/GC$RepoStatistics;->numberOfPackedRefs:J

    goto :goto_4

    .line 922
    .end local v15           #r:Lorg/eclipse/jgit/lib/Ref;
    .end local v18           #storage:Lorg/eclipse/jgit/lib/Ref$Storage;
    :cond_9
    return-object v17
.end method

.method public packRefs()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 484
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v4

    const-string v5, "refs/"

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    .line 485
    .local v2, refs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 486
    .local v3, refsToBePacked:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->packRefs:Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Collection;->size()I

    move-result v6

    invoke-interface {v4, v5, v6}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 488
    :try_start_0
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/Ref;

    .line 489
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Ref$Storage;->isLoose()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 490
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 491
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    const/4 v5, 0x1

    invoke-interface {v4, v5}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 495
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    :catchall_0
    move-exception v4

    iget-object v5, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v5}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    throw v4

    .line 493
    .restart local v0       #i$:Ljava/util/Iterator;
    :cond_1
    :try_start_1
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;

    invoke-virtual {v4, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory;->pack(Ljava/util/List;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 495
    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v4}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 497
    return-void
.end method

.method public prune(Ljava/util/Set;)V
    .locals 34
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 303
    .local p1, objectsToKeep:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    const-wide v10, 0x7fffffffffffffffL

    .line 305
    .local v10, expireDate:J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->expire:Ljava/util/Date;

    move-object/from16 v30, v0

    if-nez v30, :cond_1

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->expireAgeMillis:J

    move-wide/from16 v30, v0

    const-wide/16 v32, -0x1

    cmp-long v30, v30, v32

    if-nez v30, :cond_1

    .line 306
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getConfig()Lorg/eclipse/jgit/storage/file/FileBasedConfig;

    move-result-object v30

    const-string v31, "gc"

    const/16 v32, 0x0

    const-string v33, "pruneexpire"

    invoke-virtual/range {v30 .. v33}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 309
    .local v28, pruneExpireStr:Ljava/lang/String;
    if-nez v28, :cond_0

    .line 310
    const-string v28, "2.weeks.ago"

    .line 311
    :cond_0
    const/16 v30, 0x0

    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Lorg/eclipse/jgit/util/SystemReader;->getLocale()Ljava/util/Locale;

    move-result-object v31

    move-object/from16 v0, v28

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/util/GitDateParser;->parse(Ljava/lang/String;Ljava/util/Calendar;Ljava/util/Locale;)Ljava/util/Date;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/internal/storage/file/GC;->expire:Ljava/util/Date;

    .line 313
    const-wide/16 v30, -0x1

    move-wide/from16 v0, v30

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/eclipse/jgit/internal/storage/file/GC;->expireAgeMillis:J

    .line 315
    .end local v28           #pruneExpireStr:Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->expire:Ljava/util/Date;

    move-object/from16 v30, v0

    if-eqz v30, :cond_2

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->expire:Ljava/util/Date;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    .line 317
    :cond_2
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->expireAgeMillis:J

    move-wide/from16 v30, v0

    const-wide/16 v32, -0x1

    cmp-long v30, v30, v32

    if-eqz v30, :cond_3

    .line 318
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v30

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->expireAgeMillis:J

    move-wide/from16 v32, v0

    sub-long v10, v30, v32

    .line 322
    :cond_3
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 323
    .local v8, deletionCandidates:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/io/File;>;"
    const/16 v19, 0x0

    .line 324
    .local v19, indexObjects:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectsDirectory()Ljava/io/File;

    move-result-object v26

    .line 325
    .local v26, objects:Ljava/io/File;
    invoke-virtual/range {v26 .. v26}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v14

    .line 326
    .local v14, fanout:[Ljava/lang/String;
    if-eqz v14, :cond_a

    array-length v0, v14

    move/from16 v30, v0

    if-lez v30, :cond_a

    .line 327
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v30, v0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v31

    move-object/from16 v0, v31

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->pruneLooseUnreferencedObjects:Ljava/lang/String;

    move-object/from16 v31, v0

    array-length v0, v14

    move/from16 v32, v0

    invoke-interface/range {v30 .. v32}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 330
    move-object v4, v14

    .local v4, arr$:[Ljava/lang/String;
    :try_start_0
    array-length v0, v4

    move/from16 v20, v0

    .local v20, len$:I
    const/16 v16, 0x0

    .local v16, i$:I
    move/from16 v17, v16

    .end local v4           #arr$:[Ljava/lang/String;
    .end local v16           #i$:I
    .end local v20           #len$:I
    .local v17, i$:I
    :goto_0
    move/from16 v0, v17

    move/from16 v1, v20

    if-ge v0, v1, :cond_9

    aget-object v7, v4, v17

    .line 331
    .local v7, d:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v30, v0

    const/16 v31, 0x1

    invoke-interface/range {v30 .. v31}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 332
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v30

    const/16 v31, 0x2

    move/from16 v0, v30

    move/from16 v1, v31

    if-eq v0, v1, :cond_5

    .line 330
    .end local v17           #i$:I
    :cond_4
    add-int/lit8 v16, v17, 0x1

    .restart local v16       #i$:I
    move/from16 v17, v16

    .end local v16           #i$:I
    .restart local v17       #i$:I
    goto :goto_0

    .line 334
    :cond_5
    new-instance v30, Ljava/io/File;

    move-object/from16 v0, v30

    move-object/from16 v1, v26

    invoke-direct {v0, v1, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual/range {v30 .. v30}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v9

    .line 335
    .local v9, entries:[Ljava/io/File;
    if-eqz v9, :cond_4

    .line 337
    move-object v5, v9

    .local v5, arr$:[Ljava/io/File;
    array-length v0, v5

    move/from16 v21, v0

    .local v21, len$:I
    const/16 v16, 0x0

    .end local v17           #i$:I
    .restart local v16       #i$:I
    :goto_1
    move/from16 v0, v16

    move/from16 v1, v21

    if-ge v0, v1, :cond_4

    aget-object v12, v5, v16

    .line 338
    .local v12, f:Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    .line 339
    .local v13, fName:Ljava/lang/String;
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v30

    const/16 v31, 0x26

    move/from16 v0, v30

    move/from16 v1, v31

    if-eq v0, v1, :cond_7

    .line 337
    :cond_6
    :goto_2
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 341
    :cond_7
    invoke-virtual {v12}, Ljava/io/File;->lastModified()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v30

    cmp-long v30, v30, v10

    if-gez v30, :cond_6

    .line 344
    :try_start_1
    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v30

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v30 .. v30}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v18

    .line 345
    .local v18, id:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v30

    if-nez v30, :cond_6

    .line 347
    if-nez v19, :cond_8

    .line 348
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/GC;->listNonHEADIndexObjects()Ljava/util/Set;

    move-result-object v19

    .line 349
    :cond_8
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v30

    if-nez v30, :cond_6

    .line 351
    move-object/from16 v0, v18

    invoke-interface {v8, v0, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 352
    .end local v18           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_0
    move-exception v25

    .line 355
    .local v25, notAnObject:Ljava/lang/IllegalArgumentException;
    goto :goto_2

    .line 360
    .end local v5           #arr$:[Ljava/io/File;
    .end local v7           #d:Ljava/lang/String;
    .end local v9           #entries:[Ljava/io/File;
    .end local v12           #f:Ljava/io/File;
    .end local v13           #fName:Ljava/lang/String;
    .end local v16           #i$:I
    .end local v21           #len$:I
    .end local v25           #notAnObject:Ljava/lang/IllegalArgumentException;
    .restart local v17       #i$:I
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v30, v0

    invoke-interface/range {v30 .. v30}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 363
    .end local v17           #i$:I
    :cond_a
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v30

    if-eqz v30, :cond_c

    .line 433
    :cond_b
    :goto_3
    return-void

    .line 360
    :catchall_0
    move-exception v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    throw v30

    .line 371
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->lastPackedRefs:Ljava/util/Map;

    move-object/from16 v30, v0

    if-eqz v30, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->lastPackedRefs:Ljava/util/Map;

    move-object/from16 v30, v0

    invoke-interface/range {v30 .. v30}, Ljava/util/Map;->isEmpty()Z

    move-result v30

    if-eqz v30, :cond_f

    .line 372
    :cond_d
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/GC;->getAllRefs()Ljava/util/Map;

    move-result-object v24

    .line 384
    .local v24, newRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    :cond_e
    invoke-interface/range {v24 .. v24}, Ljava/util/Map;->isEmpty()Z

    move-result v30

    if-nez v30, :cond_13

    .line 390
    new-instance v29, Lorg/eclipse/jgit/revwalk/ObjectWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v30, v0

    invoke-direct/range {v29 .. v30}, Lorg/eclipse/jgit/revwalk/ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 392
    .local v29, w:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    :try_start_2
    invoke-interface/range {v24 .. v24}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_11

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/lib/Ref;

    .line 393
    .local v6, cr:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevObject;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_4

    .line 399
    .end local v6           #cr:Lorg/eclipse/jgit/lib/Ref;
    .end local v16           #i$:Ljava/util/Iterator;
    :catchall_1
    move-exception v30

    invoke-virtual/range {v29 .. v29}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->dispose()V

    throw v30

    .line 374
    .end local v24           #newRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v29           #w:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    :cond_f
    new-instance v24, Ljava/util/HashMap;

    invoke-direct/range {v24 .. v24}, Ljava/util/HashMap;-><init>()V

    .line 375
    .restart local v24       #newRefs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/GC;->getAllRefs()Ljava/util/Map;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .line 376
    .local v15, i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;>;"
    :cond_10
    :goto_5
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_e

    .line 377
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/util/Map$Entry;

    .line 378
    .local v23, newEntry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->lastPackedRefs:Ljava/util/Map;

    move-object/from16 v30, v0

    invoke-interface/range {v23 .. v23}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v31

    invoke-interface/range {v30 .. v31}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lorg/eclipse/jgit/lib/Ref;

    .line 379
    .local v27, old:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface/range {v23 .. v23}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Lorg/eclipse/jgit/lib/Ref;

    move-object/from16 v0, v30

    move-object/from16 v1, v27

    invoke-static {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/GC;->equals(Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/Ref;)Z

    move-result v30

    if-nez v30, :cond_10

    .line 380
    invoke-interface/range {v23 .. v23}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v30

    invoke-interface/range {v23 .. v23}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v31

    move-object/from16 v0, v24

    move-object/from16 v1, v30

    move-object/from16 v2, v31

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    .line 394
    .end local v15           #i:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;>;"
    .end local v23           #newEntry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    .end local v27           #old:Lorg/eclipse/jgit/lib/Ref;
    .restart local v16       #i$:Ljava/util/Iterator;
    .restart local v29       #w:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    :cond_11
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->lastPackedRefs:Ljava/util/Map;

    move-object/from16 v30, v0

    if-eqz v30, :cond_12

    .line 395
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->lastPackedRefs:Ljava/util/Map;

    move-object/from16 v30, v0

    invoke-interface/range {v30 .. v30}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_6
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_12

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lorg/eclipse/jgit/lib/Ref;

    .line 396
    .local v22, lpr:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface/range {v22 .. v22}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_6

    .line 397
    .end local v22           #lpr:Lorg/eclipse/jgit/lib/Ref;
    :cond_12
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v8, v1}, Lorg/eclipse/jgit/internal/storage/file/GC;->removeReferenced(Ljava/util/Map;Lorg/eclipse/jgit/revwalk/ObjectWalk;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 399
    invoke-virtual/range {v29 .. v29}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->dispose()V

    .line 403
    .end local v16           #i$:Ljava/util/Iterator;
    .end local v29           #w:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    :cond_13
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v30

    if-nez v30, :cond_b

    .line 411
    new-instance v29, Lorg/eclipse/jgit/revwalk/ObjectWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v30, v0

    invoke-direct/range {v29 .. v30}, Lorg/eclipse/jgit/revwalk/ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 413
    .restart local v29       #w:Lorg/eclipse/jgit/revwalk/ObjectWalk;
    :try_start_4
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/GC;->getAllRefs()Ljava/util/Map;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :cond_14
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_15

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 414
    .local v3, ar:Lorg/eclipse/jgit/lib/Ref;
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->lastRepackTime:J

    move-wide/from16 v30, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v30

    invoke-direct {v0, v3, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/GC;->listRefLogObjects(Lorg/eclipse/jgit/lib/Ref;J)Ljava/util/Set;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, i$:Ljava/util/Iterator;
    :goto_7
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_14

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/eclipse/jgit/lib/ObjectId;

    .line 415
    .restart local v18       #id:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, v29

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevObject;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_7

    .line 421
    .end local v3           #ar:Lorg/eclipse/jgit/lib/Ref;
    .end local v17           #i$:Ljava/util/Iterator;
    .end local v18           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :catchall_2
    move-exception v30

    invoke-virtual/range {v29 .. v29}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->dispose()V

    throw v30

    .line 416
    :cond_15
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->lastPackedRefs:Ljava/util/Map;

    move-object/from16 v30, v0

    if-eqz v30, :cond_16

    .line 417
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->lastPackedRefs:Ljava/util/Map;

    move-object/from16 v30, v0

    invoke-interface/range {v30 .. v30}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .restart local v16       #i$:Ljava/util/Iterator;
    :goto_8
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_16

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lorg/eclipse/jgit/lib/Ref;

    .line 418
    .restart local v22       #lpr:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface/range {v22 .. v22}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_8

    .line 419
    .end local v16           #i$:Ljava/util/Iterator;
    .end local v22           #lpr:Lorg/eclipse/jgit/lib/Ref;
    :cond_16
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v8, v1}, Lorg/eclipse/jgit/internal/storage/file/GC;->removeReferenced(Ljava/util/Map;Lorg/eclipse/jgit/revwalk/ObjectWalk;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 421
    invoke-virtual/range {v29 .. v29}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->dispose()V

    .line 424
    invoke-interface {v8}, Ljava/util/Map;->isEmpty()Z

    move-result v30

    if-nez v30, :cond_b

    .line 429
    invoke-interface {v8}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v30

    invoke-interface/range {v30 .. v30}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .restart local v16       #i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v30

    if-eqz v30, :cond_17

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/io/File;

    .line 430
    .restart local v12       #f:Ljava/io/File;
    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    goto :goto_9

    .line 432
    .end local v12           #f:Ljava/io/File;
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->close()V

    goto/16 :goto_3
.end method

.method public prunePacked()V
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 244
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-result-object v16

    .line 245
    .local v16, objdb:Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getPacks()Ljava/util/Collection;

    move-result-object v19

    .line 246
    .local v19, packs:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/file/PackFile;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectsDirectory()Ljava/io/File;

    move-result-object v17

    .line 247
    .local v17, objects:Ljava/io/File;
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v7

    .line 249
    .local v7, fanout:[Ljava/lang/String;
    if-eqz v7, :cond_7

    array-length v0, v7

    move/from16 v20, v0

    if-lez v20, :cond_7

    .line 250
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v20, v0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v21

    move-object/from16 v0, v21

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->pruneLoosePackedObjects:Ljava/lang/String;

    move-object/from16 v21, v0

    array-length v0, v7

    move/from16 v22, v0

    invoke-interface/range {v20 .. v22}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 252
    move-object v2, v7

    .local v2, arr$:[Ljava/lang/String;
    :try_start_0
    array-length v13, v2

    .local v13, len$:I
    const/4 v9, 0x0

    .local v9, i$:I
    move v11, v9

    .end local v2           #arr$:[Ljava/lang/String;
    .end local v9           #i$:I
    .end local v13           #len$:I
    .local v11, i$:I
    :goto_0
    if-ge v11, v13, :cond_6

    aget-object v4, v2, v11

    .line 253
    .local v4, d:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    invoke-interface/range {v20 .. v21}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 254
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v20

    const/16 v21, 0x2

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_1

    .line 252
    .end local v11           #i$:I
    :cond_0
    add-int/lit8 v9, v11, 0x1

    .restart local v9       #i$:I
    move v11, v9

    .end local v9           #i$:I
    .restart local v11       #i$:I
    goto :goto_0

    .line 256
    :cond_1
    new-instance v20, Ljava/io/File;

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v6

    .line 257
    .local v6, entries:[Ljava/lang/String;
    if-eqz v6, :cond_0

    .line 259
    move-object v3, v6

    .local v3, arr$:[Ljava/lang/String;
    array-length v14, v3

    .local v14, len$:I
    const/4 v9, 0x0

    .end local v11           #i$:I
    .restart local v9       #i$:I
    move v10, v9

    .end local v9           #i$:I
    .local v10, i$:I
    :goto_1
    if-ge v10, v14, :cond_0

    aget-object v5, v3, v10

    .line 260
    .local v5, e:Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v20

    const/16 v21, 0x26

    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_3

    .line 259
    .end local v10           #i$:I
    :cond_2
    :goto_2
    add-int/lit8 v9, v10, 0x1

    .restart local v9       #i$:I
    move v10, v9

    .end local v9           #i$:I
    .restart local v10       #i$:I
    goto :goto_1

    .line 264
    :cond_3
    :try_start_1
    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/lib/ObjectId;->fromString(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v12

    .line 270
    .local v12, id:Lorg/eclipse/jgit/lib/ObjectId;
    const/4 v8, 0x0

    .line 271
    .local v8, found:Z
    :try_start_2
    invoke-interface/range {v19 .. v19}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .end local v10           #i$:I
    .local v9, i$:Ljava/util/Iterator;
    :cond_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 272
    .local v18, p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v20

    if-eqz v20, :cond_4

    .line 273
    const/4 v8, 0x1

    .line 276
    .end local v18           #p:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_5
    if-eqz v8, :cond_2

    .line 277
    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->fileFor(Lorg/eclipse/jgit/lib/AnyObjectId;)Ljava/io/File;

    move-result-object v20

    const/16 v21, 0xe

    invoke-static/range {v20 .. v21}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 283
    .end local v3           #arr$:[Ljava/lang/String;
    .end local v4           #d:Ljava/lang/String;
    .end local v5           #e:Ljava/lang/String;
    .end local v6           #entries:[Ljava/lang/String;
    .end local v8           #found:Z
    .end local v9           #i$:Ljava/util/Iterator;
    .end local v12           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v14           #len$:I
    :catchall_0
    move-exception v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    throw v20

    .line 265
    .restart local v3       #arr$:[Ljava/lang/String;
    .restart local v4       #d:Ljava/lang/String;
    .restart local v5       #e:Ljava/lang/String;
    .restart local v6       #entries:[Ljava/lang/String;
    .restart local v10       #i$:I
    .restart local v14       #len$:I
    :catch_0
    move-exception v15

    .line 268
    .local v15, notAnObject:Ljava/lang/IllegalArgumentException;
    goto :goto_2

    .line 283
    .end local v3           #arr$:[Ljava/lang/String;
    .end local v4           #d:Ljava/lang/String;
    .end local v5           #e:Ljava/lang/String;
    .end local v6           #entries:[Ljava/lang/String;
    .end local v10           #i$:I
    .end local v14           #len$:I
    .end local v15           #notAnObject:Ljava/lang/IllegalArgumentException;
    .restart local v11       #i$:I
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    move-object/from16 v20, v0

    invoke-interface/range {v20 .. v20}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 286
    .end local v11           #i$:I
    :cond_7
    return-void
.end method

.method public repack()Ljava/util/Collection;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackFile;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 514
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getPacks()Ljava/util/Collection;

    move-result-object v17

    .line 516
    .local v17, toBeDeleted:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/internal/storage/file/PackFile;>;"
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    .line 517
    .local v15, time:J
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/GC;->getAllRefs()Ljava/util/Map;

    move-result-object v11

    .line 519
    .local v11, refsBefore:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 520
    .local v3, allHeads:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 521
    .local v9, nonHeads:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    new-instance v14, Ljava/util/HashSet;

    invoke-direct {v14}, Ljava/util/HashSet;-><init>()V

    .line 522
    .local v14, tagTargets:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/GC;->listNonHEADIndexObjects()Ljava/util/Set;

    move-result-object v8

    .line 524
    .local v8, indexObjects:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {v11}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/lib/Ref;

    .line 525
    .local v10, ref:Lorg/eclipse/jgit/lib/Ref;
    const-wide/16 v18, 0x0

    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-direct {v0, v10, v1, v2}, Lorg/eclipse/jgit/internal/storage/file/GC;->listRefLogObjects(Lorg/eclipse/jgit/lib/Ref;J)Ljava/util/Set;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v9, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 526
    invoke-interface {v10}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v18

    if-nez v18, :cond_0

    invoke-interface {v10}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v18

    if-eqz v18, :cond_0

    .line 528
    invoke-interface {v10}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v18

    const-string v19, "refs/heads/"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 529
    invoke-interface {v10}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 532
    :goto_1
    invoke-interface {v10}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v18

    if-eqz v18, :cond_0

    .line 533
    invoke-interface {v10}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v14, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 531
    :cond_1
    invoke-interface {v10}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v9, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 536
    .end local v10           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 537
    .local v4, excluded:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->repo:Lorg/eclipse/jgit/internal/storage/file/FileRepository;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/internal/storage/file/FileRepository;->getObjectDatabase()Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/internal/storage/file/ObjectDirectory;->getPacks()Ljava/util/Collection;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_3
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/internal/storage/file/PackFile;

    .line 538
    .local v5, f:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->shouldBeKept()Z

    move-result v18

    if-eqz v18, :cond_3

    .line 539
    invoke-virtual {v5}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getIndex()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lorg/eclipse/jgit/internal/storage/file/GC;->objectIdSet(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 541
    .end local v5           #f:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_4
    invoke-interface {v14, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 542
    invoke-interface {v9, v8}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 544
    new-instance v13, Ljava/util/ArrayList;

    const/16 v18, 0x2

    move/from16 v0, v18

    invoke-direct {v13, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 545
    .local v13, ret:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/internal/storage/file/PackFile;>;"
    const/4 v6, 0x0

    .line 546
    .local v6, heads:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_5

    .line 547
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v3, v1, v14, v4}, Lorg/eclipse/jgit/internal/storage/file/GC;->writePack(Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/util/List;)Lorg/eclipse/jgit/internal/storage/file/PackFile;

    move-result-object v6

    .line 549
    if-eqz v6, :cond_5

    .line 550
    invoke-interface {v13, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 551
    const/16 v18, 0x0

    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/file/PackFile;->getIndex()Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lorg/eclipse/jgit/internal/storage/file/GC;->objectIdSet(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;

    move-result-object v19

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-interface {v4, v0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 554
    :cond_5
    invoke-interface {v9}, Ljava/util/Set;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_6

    .line 555
    move-object/from16 v0, p0

    invoke-direct {v0, v9, v3, v14, v4}, Lorg/eclipse/jgit/internal/storage/file/GC;->writePack(Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Ljava/util/List;)Lorg/eclipse/jgit/internal/storage/file/PackFile;

    move-result-object v12

    .line 556
    .local v12, rest:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    if-eqz v12, :cond_6

    .line 557
    invoke-interface {v13, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 559
    .end local v12           #rest:Lorg/eclipse/jgit/internal/storage/file/PackFile;
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v13}, Lorg/eclipse/jgit/internal/storage/file/GC;->deleteOldPacks(Ljava/util/Collection;Ljava/util/Collection;)V

    .line 560
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/internal/storage/file/GC;->prunePacked()V

    .line 562
    move-object/from16 v0, p0

    iput-object v11, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->lastPackedRefs:Ljava/util/Map;

    .line 563
    move-object/from16 v0, p0

    iput-wide v15, v0, Lorg/eclipse/jgit/internal/storage/file/GC;->lastRepackTime:J

    .line 564
    return-object v13
.end method

.method public setExpire(Ljava/util/Date;)V
    .locals 2
    .parameter "expire"

    .prologue
    .line 963
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->expire:Ljava/util/Date;

    .line 964
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->expireAgeMillis:J

    .line 965
    return-void
.end method

.method public setExpireAgeMillis(J)V
    .locals 1
    .parameter "expireAgeMillis"

    .prologue
    .line 946
    iput-wide p1, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->expireAgeMillis:J

    .line 947
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->expire:Ljava/util/Date;

    .line 948
    return-void
.end method

.method public setProgressMonitor(Lorg/eclipse/jgit/lib/ProgressMonitor;)Lorg/eclipse/jgit/internal/storage/file/GC;
    .locals 0
    .parameter "pm"

    .prologue
    .line 932
    if-nez p1, :cond_0

    sget-object p1, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .end local p1
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/GC;->pm:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 933
    return-object p0
.end method
