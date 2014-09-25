.class public Lorg/eclipse/jgit/merge/ResolveMerger;
.super Lorg/eclipse/jgit/merge/ThreeWayMerger;
.source "ResolveMerger.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;
    }
.end annotation


# static fields
.field protected static final T_BASE:I = 0x0

.field protected static final T_FILE:I = 0x4

.field protected static final T_INDEX:I = 0x3

.field protected static final T_OURS:I = 0x1

.field protected static final T_THEIRS:I = 0x2


# instance fields
.field protected builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

.field protected commitNames:[Ljava/lang/String;

.field protected dircache:Lorg/eclipse/jgit/dircache/DirCache;

.field protected enterSubtree:Z

.field protected failingPaths:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;",
            ">;"
        }
    .end annotation
.end field

.field protected implicitDirCache:Z

.field protected inCore:Z

.field protected mergeAlgorithm:Lorg/eclipse/jgit/merge/MergeAlgorithm;

.field protected mergeResults:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/MergeResult",
            "<+",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">;>;"
        }
    .end annotation
.end field

.field protected modifiedFiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected resultTree:Lorg/eclipse/jgit/lib/ObjectId;

.field protected toBeCheckedOut:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/dircache/DirCacheEntry;",
            ">;"
        }
    .end annotation
.end field

.field protected toBeDeleted:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

.field protected unmergedPaths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "local"

    .prologue
    .line 291
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/merge/ResolveMerger;-><init>(Lorg/eclipse/jgit/lib/Repository;Z)V

    .line 292
    return-void
.end method

.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;Z)V
    .locals 8
    .parameter "local"
    .parameter "inCore"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 270
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/merge/ThreeWayMerger;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 179
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->unmergedPaths:Ljava/util/List;

    .line 186
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->modifiedFiles:Ljava/util/List;

    .line 194
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->toBeCheckedOut:Ljava/util/Map;

    .line 202
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->toBeDeleted:Ljava/util/List;

    .line 210
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeResults:Ljava/util/Map;

    .line 217
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->failingPaths:Ljava/util/Map;

    .line 271
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v1

    const-string v2, "diff"

    const/4 v3, 0x0

    const-string v4, "algorithm"

    sget-object v5, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;->HISTOGRAM:Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    invoke-virtual {v1, v2, v3, v4, v5}, Lorg/eclipse/jgit/lib/StoredConfig;->getEnum(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Enum;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;

    .line 275
    .local v0, diffAlg:Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;
    new-instance v1, Lorg/eclipse/jgit/merge/MergeAlgorithm;

    invoke-static {v0}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->getAlgorithm(Lorg/eclipse/jgit/diff/DiffAlgorithm$SupportedAlgorithm;)Lorg/eclipse/jgit/diff/DiffAlgorithm;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/merge/MergeAlgorithm;-><init>(Lorg/eclipse/jgit/diff/DiffAlgorithm;)V

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeAlgorithm:Lorg/eclipse/jgit/merge/MergeAlgorithm;

    .line 276
    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "BASE"

    aput-object v2, v1, v6

    const-string v2, "OURS"

    aput-object v2, v1, v7

    const/4 v2, 0x2

    const-string v3, "THEIRS"

    aput-object v3, v1, v2

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->commitNames:[Ljava/lang/String;

    .line 277
    iput-boolean p2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->inCore:Z

    .line 279
    if-eqz p2, :cond_0

    .line 280
    iput-boolean v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->implicitDirCache:Z

    .line 281
    invoke-static {}, Lorg/eclipse/jgit/dircache/DirCache;->newInCore()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->dircache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 285
    :goto_0
    return-void

    .line 283
    :cond_0
    iput-boolean v7, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->implicitDirCache:Z

    goto :goto_0
.end method

.method private add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .locals 3
    .parameter "path"
    .parameter "p"
    .parameter "stage"
    .parameter "lastMod"
    .parameter "len"

    .prologue
    .line 397
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 398
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-direct {v0, p1, p3}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([BI)V

    .line 399
    .local v0, e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 400
    invoke-virtual {p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 401
    invoke-virtual {v0, p4, p5}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V

    .line 402
    invoke-virtual {v0, p6, p7}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(J)V

    .line 403
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 406
    .end local v0           #e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private checkout()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NoWorkTreeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/ObjectDatabase;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v5

    .line 310
    .local v5, r:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->toBeCheckedOut:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 312
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;>;"
    new-instance v1, Ljava/io/File;

    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v7

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {v1, v7, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 313
    .local v1, f:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/eclipse/jgit/merge/ResolveMerger;->createDir(Ljava/io/File;)V

    .line 314
    iget-object v7, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-static {v7, v1, v6, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkoutEntry(Lorg/eclipse/jgit/lib/Repository;Ljava/io/File;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 315
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->modifiedFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 330
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/dircache/DirCacheEntry;>;"
    .end local v1           #f:Ljava/io/File;
    .end local v4           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v6

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v6

    .line 320
    .restart local v4       #i$:Ljava/util/Iterator;
    :cond_0
    :try_start_1
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->toBeDeleted:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v3, v6, -0x1

    .local v3, i:I
    :goto_1
    if-ltz v3, :cond_2

    .line 321
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->toBeDeleted:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 322
    .local v2, fileName:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v6

    invoke-direct {v1, v6, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 323
    .restart local v1       #f:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v6

    if-nez v6, :cond_1

    .line 324
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_1

    .line 325
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->failingPaths:Ljava/util/Map;

    sget-object v7, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->COULD_NOT_DELETE:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    invoke-interface {v6, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    :cond_1
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->modifiedFiles:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 320
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 330
    .end local v1           #f:Ljava/io/File;
    .end local v2           #fileName:Ljava/lang/String;
    :cond_2
    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 332
    return-void
.end method

.method private contentMerge(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;)Lorg/eclipse/jgit/merge/MergeResult;
    .locals 5
    .parameter "base"
    .parameter "ours"
    .parameter "theirs"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;",
            "Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;",
            "Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;",
            ")",
            "Lorg/eclipse/jgit/merge/MergeResult",
            "<",
            "Lorg/eclipse/jgit/diff/RawText;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 681
    if-nez p1, :cond_0

    sget-object v0, Lorg/eclipse/jgit/diff/RawText;->EMPTY_TEXT:Lorg/eclipse/jgit/diff/RawText;

    .line 683
    .local v0, baseText:Lorg/eclipse/jgit/diff/RawText;
    :goto_0
    if-nez p2, :cond_1

    sget-object v1, Lorg/eclipse/jgit/diff/RawText;->EMPTY_TEXT:Lorg/eclipse/jgit/diff/RawText;

    .line 685
    .local v1, ourText:Lorg/eclipse/jgit/diff/RawText;
    :goto_1
    if-nez p3, :cond_2

    sget-object v2, Lorg/eclipse/jgit/diff/RawText;->EMPTY_TEXT:Lorg/eclipse/jgit/diff/RawText;

    .line 687
    .local v2, theirsText:Lorg/eclipse/jgit/diff/RawText;
    :goto_2
    iget-object v3, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeAlgorithm:Lorg/eclipse/jgit/merge/MergeAlgorithm;

    sget-object v4, Lorg/eclipse/jgit/diff/RawTextComparator;->DEFAULT:Lorg/eclipse/jgit/diff/RawTextComparator;

    invoke-virtual {v3, v4, v0, v1, v2}, Lorg/eclipse/jgit/merge/MergeAlgorithm;->merge(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/merge/MergeResult;

    move-result-object v3

    return-object v3

    .line 681
    .end local v0           #baseText:Lorg/eclipse/jgit/diff/RawText;
    .end local v1           #ourText:Lorg/eclipse/jgit/diff/RawText;
    .end local v2           #theirsText:Lorg/eclipse/jgit/diff/RawText;
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v3, v4}, Lorg/eclipse/jgit/merge/ResolveMerger;->getRawText(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/diff/RawText;

    move-result-object v0

    goto :goto_0

    .line 683
    .restart local v0       #baseText:Lorg/eclipse/jgit/diff/RawText;
    :cond_1
    invoke-virtual {p2}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v3, v4}, Lorg/eclipse/jgit/merge/ResolveMerger;->getRawText(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/diff/RawText;

    move-result-object v1

    goto :goto_1

    .line 685
    .restart local v1       #ourText:Lorg/eclipse/jgit/diff/RawText;
    :cond_2
    invoke-virtual {p3}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v3, v4}, Lorg/eclipse/jgit/merge/ResolveMerger;->getRawText(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/diff/RawText;

    move-result-object v2

    goto :goto_2
.end method

.method private createDir(Ljava/io/File;)V
    .locals 3
    .parameter "f"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 335
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/util/FS;->isDirectory(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_3

    .line 336
    move-object v0, p1

    .line 337
    .local v0, p:Ljava/io/File;
    :goto_0
    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/util/FS;->exists(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 338
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    goto :goto_0

    .line 339
    :cond_0
    if-eqz v0, :cond_1

    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/util/FS;->isDirectory(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 340
    :cond_1
    new-instance v1, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cannotCreateDirectory:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 341
    :cond_2
    invoke-static {v0}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    .line 342
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_3

    .line 343
    new-instance v1, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cannotCreateDirectory:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 345
    .end local v0           #p:Ljava/io/File;
    :cond_3
    return-void
.end method

.method private static getRawText(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/diff/RawText;
    .locals 2
    .parameter "id"
    .parameter "db"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 866
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 867
    new-instance v0, Lorg/eclipse/jgit/diff/RawText;

    const/4 v1, 0x0

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    .line 868
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/eclipse/jgit/diff/RawText;

    const/4 v1, 0x3

    invoke-virtual {p1, p0, v1}, Lorg/eclipse/jgit/lib/Repository;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    goto :goto_0
.end method

.method private static isGitLink(I)Z
    .locals 1
    .parameter "mode"

    .prologue
    .line 876
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v0

    return v0
.end method

.method private isIndexDirty()Z
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v0, 0x0

    const/4 v3, 0x1

    .line 692
    iget-boolean v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->inCore:Z

    if-eqz v4, :cond_1

    .line 704
    :cond_0
    :goto_0
    return v0

    .line 695
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v1

    .line 696
    .local v1, modeI:I
    iget-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4, v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v2

    .line 699
    .local v2, modeO:I
    invoke-static {v1}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_3

    if-ne v2, v1, :cond_2

    iget-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4, v5, v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->idEqual(II)Z

    move-result v4

    if-nez v4, :cond_3

    :cond_2
    move v0, v3

    .line 701
    .local v0, isDirty:Z
    :cond_3
    if-eqz v0, :cond_0

    .line 702
    iget-object v3, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->failingPaths:Ljava/util/Map;

    iget-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->DIRTY_INDEX:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private isWorktreeDirty(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;Lorg/eclipse/jgit/dircache/DirCacheEntry;)Z
    .locals 7
    .parameter "work"
    .parameter "ourDce"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x4

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 709
    if-nez p1, :cond_0

    .line 732
    :goto_0
    return v4

    .line 712
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v1

    .line 713
    .local v1, modeF:I
    iget-object v5, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v2

    .line 717
    .local v2, modeO:I
    if-eqz p2, :cond_4

    .line 718
    iget-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {p1, p2, v3, v4}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v0

    .line 726
    .local v0, isDirty:Z
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    const/16 v3, 0x4000

    if-ne v1, v3, :cond_2

    if-nez v2, :cond_2

    .line 728
    const/4 v0, 0x0

    .line 729
    :cond_2
    if-eqz v0, :cond_3

    .line 730
    iget-object v3, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->failingPaths:Ljava/util/Map;

    iget-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;->DIRTY_WORKTREE:Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    move v4, v0

    .line 732
    goto :goto_0

    .line 720
    .end local v0           #isDirty:Z
    :cond_4
    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->isModeDifferent(I)Z

    move-result v0

    .line 721
    .restart local v0       #isDirty:Z
    if-nez v0, :cond_1

    invoke-static {v1}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 722
    iget-object v5, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5, v6, v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->idEqual(II)Z

    move-result v5

    if-nez v5, :cond_5

    move v0, v3

    :goto_2
    goto :goto_1

    :cond_5
    move v0, v4

    goto :goto_2
.end method

.method private keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .locals 3
    .parameter "e"

    .prologue
    .line 419
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;I)V

    .line 421
    .local v0, newEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 422
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 423
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLastModified()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V

    .line 424
    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLength()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(I)V

    .line 425
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 426
    return-object v0
.end method

.method private mergeFileModes(III)I
    .locals 1
    .parameter "modeB"
    .parameter "modeO"
    .parameter "modeT"

    .prologue
    .line 853
    if-ne p2, p3, :cond_1

    .line 861
    .end local p2
    .end local p3
    :cond_0
    :goto_0
    return p2

    .line 855
    .restart local p2
    .restart local p3
    :cond_1
    if-ne p1, p2, :cond_2

    .line 857
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v0

    if-eq p3, v0, :cond_0

    move p2, p3

    goto :goto_0

    .line 858
    :cond_2
    if-ne p1, p3, :cond_4

    .line 860
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v0

    if-ne p2, v0, :cond_3

    .end local p3
    :goto_1
    move p2, p3

    goto :goto_0

    .restart local p3
    :cond_3
    move p3, p2

    goto :goto_1

    .line 861
    :cond_4
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result p2

    goto :goto_0
.end method

.method private static nonTree(I)Z
    .locals 1
    .parameter "mode"

    .prologue
    .line 872
    if-eqz p0, :cond_0

    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateIndex(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/merge/MergeResult;Ljava/io/File;)V
    .locals 12
    .parameter "base"
    .parameter "ours"
    .parameter "theirs"
    .parameter
    .parameter "of"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;",
            "Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;",
            "Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;",
            "Lorg/eclipse/jgit/merge/MergeResult",
            "<",
            "Lorg/eclipse/jgit/diff/RawText;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 753
    .local p4, result:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<Lorg/eclipse/jgit/diff/RawText;>;"
    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/merge/MergeResult;->containsConflicts()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 757
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v2

    const/4 v4, 0x1

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v8}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 758
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v2

    const/4 v4, 0x2

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    move-object v1, p0

    move-object v3, p2

    invoke-direct/range {v1 .. v8}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 759
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v2

    const/4 v4, 0x3

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    move-object v1, p0

    move-object v3, p3

    invoke-direct/range {v1 .. v8}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 760
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeResults:Ljava/util/Map;

    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 784
    :goto_0
    return-void

    .line 764
    :cond_0
    new-instance v9, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v9, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;)V

    .line 765
    .local v9, dce:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v1

    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v2

    iget-object v3, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v3

    invoke-direct {p0, v1, v2, v3}, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeFileModes(III)I

    move-result v11

    .line 769
    .local v11, newMode:I
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v1

    if-ne v11, v1, :cond_2

    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->REGULAR_FILE:Lorg/eclipse/jgit/lib/FileMode;

    :goto_1
    invoke-virtual {v9, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 771
    invoke-virtual/range {p5 .. p5}, Ljava/io/File;->lastModified()J

    move-result-wide v1

    invoke-virtual {v9, v1, v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V

    .line 772
    invoke-virtual/range {p5 .. p5}, Ljava/io/File;->length()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-virtual {v9, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(I)V

    .line 773
    new-instance v10, Ljava/io/FileInputStream;

    move-object/from16 v0, p5

    invoke-direct {v10, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 775
    .local v10, is:Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/ResolveMerger;->getObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual/range {p5 .. p5}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4, v10}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v9, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 778
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 779
    iget-boolean v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->inCore:Z

    if-eqz v1, :cond_1

    .line 780
    invoke-static/range {p5 .. p5}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    .line 782
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v1, v9}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto :goto_0

    .line 769
    .end local v10           #is:Ljava/io/InputStream;
    :cond_2
    invoke-static {v11}, Lorg/eclipse/jgit/lib/FileMode;->fromBits(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    goto :goto_1

    .line 778
    .restart local v10       #is:Ljava/io/InputStream;
    :catchall_0
    move-exception v1

    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 779
    iget-boolean v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->inCore:Z

    if-eqz v2, :cond_3

    .line 780
    invoke-static/range {p5 .. p5}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V

    :cond_3
    throw v1
.end method

.method private writeMergedFile(Lorg/eclipse/jgit/merge/MergeResult;)Ljava/io/File;
    .locals 9
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/merge/MergeResult",
            "<",
            "Lorg/eclipse/jgit/diff/RawText;",
            ">;)",
            "Ljava/io/File;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 799
    .local p1, result:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<Lorg/eclipse/jgit/diff/RawText;>;"
    new-instance v0, Lorg/eclipse/jgit/merge/MergeFormatter;

    invoke-direct {v0}, Lorg/eclipse/jgit/merge/MergeFormatter;-><init>()V

    .line 800
    .local v0, fmt:Lorg/eclipse/jgit/merge/MergeFormatter;
    const/4 v3, 0x0

    .line 802
    .local v3, of:Ljava/io/File;
    iget-boolean v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->inCore:Z

    if-nez v6, :cond_3

    .line 803
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v5

    .line 804
    .local v5, workTree:Ljava/io/File;
    if-nez v5, :cond_0

    .line 807
    new-instance v6, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v6}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v6

    .line 809
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v2

    .line 810
    .local v2, fs:Lorg/eclipse/jgit/util/FS;
    new-instance v3, Ljava/io/File;

    .end local v3           #of:Ljava/io/File;
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 811
    .restart local v3       #of:Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .line 812
    .local v4, parentFolder:Ljava/io/File;
    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/util/FS;->exists(Ljava/io/File;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 813
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 814
    :cond_1
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 816
    .local v1, fos:Ljava/io/FileOutputStream;
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->commitNames:[Ljava/lang/String;

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const-string v7, "UTF-8"

    invoke-virtual {v0, v1, p1, v6, v7}, Lorg/eclipse/jgit/merge/MergeFormatter;->formatMerge(Ljava/io/OutputStream;Lorg/eclipse/jgit/merge/MergeResult;Ljava/util/List;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 819
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 833
    .end local v1           #fos:Ljava/io/FileOutputStream;
    .end local v2           #fs:Lorg/eclipse/jgit/util/FS;
    .end local v4           #parentFolder:Ljava/io/File;
    .end local v5           #workTree:Ljava/io/File;
    :cond_2
    :goto_0
    return-object v3

    .line 819
    .restart local v1       #fos:Ljava/io/FileOutputStream;
    .restart local v2       #fs:Lorg/eclipse/jgit/util/FS;
    .restart local v4       #parentFolder:Ljava/io/File;
    .restart local v5       #workTree:Ljava/io/File;
    :catchall_0
    move-exception v6

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    throw v6

    .line 821
    .end local v1           #fos:Ljava/io/FileOutputStream;
    .end local v2           #fs:Lorg/eclipse/jgit/util/FS;
    .end local v4           #parentFolder:Ljava/io/File;
    .end local v5           #workTree:Ljava/io/File;
    :cond_3
    invoke-virtual {p1}, Lorg/eclipse/jgit/merge/MergeResult;->containsConflicts()Z

    move-result v6

    if-nez v6, :cond_2

    .line 824
    const-string v6, "merge_"

    const-string v7, "_temp"

    const/4 v8, 0x0

    invoke-static {v6, v7, v8}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    .line 825
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 827
    .restart local v1       #fos:Ljava/io/FileOutputStream;
    :try_start_1
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->commitNames:[Ljava/lang/String;

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    const-string v7, "UTF-8"

    invoke-virtual {v0, v1, p1, v6, v7}, Lorg/eclipse/jgit/merge/MergeFormatter;->formatMerge(Ljava/io/OutputStream;Lorg/eclipse/jgit/merge/MergeResult;Ljava/util/List;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 830
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    goto :goto_0

    :catchall_1
    move-exception v6

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    throw v6
.end method


# virtual methods
.method protected cleanUp()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NoWorkTreeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 361
    iget-boolean v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->inCore:Z

    if-eqz v6, :cond_1

    .line 362
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->modifiedFiles:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 383
    :cond_0
    return-void

    .line 366
    :cond_1
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->readDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    .line 367
    .local v0, dc:Lorg/eclipse/jgit/dircache/DirCache;
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getObjectDatabase()Lorg/eclipse/jgit/lib/ObjectDatabase;

    move-result-object v6

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/ObjectDatabase;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v5

    .line 368
    .local v5, or:Lorg/eclipse/jgit/lib/ObjectReader;
    iget-object v6, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->modifiedFiles:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 369
    .local v4, mpathsIt:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 370
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 371
    .local v3, mpath:Ljava/lang/String;
    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/dircache/DirCache;->getEntry(Ljava/lang/String;)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v1

    .line 372
    .local v1, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-eqz v1, :cond_2

    .line 374
    new-instance v2, Ljava/io/FileOutputStream;

    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v7

    invoke-direct {v6, v7, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v2, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 377
    .local v2, fos:Ljava/io/FileOutputStream;
    :try_start_0
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v6

    invoke-virtual {v6, v2}, Lorg/eclipse/jgit/lib/ObjectLoader;->copyTo(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 379
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 381
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 379
    :catchall_0
    move-exception v6

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    throw v6
.end method

.method public failed()Z
    .locals 1

    .prologue
    .line 953
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->failingPaths:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getCommitNames()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 898
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->commitNames:[Ljava/lang/String;

    return-object v0
.end method

.method public getFailingPaths()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;",
            ">;"
        }
    .end annotation

    .prologue
    .line 942
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->failingPaths:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->failingPaths:Ljava/util/Map;

    goto :goto_0
.end method

.method public getMergeResults()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/MergeResult",
            "<+",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 933
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeResults:Ljava/util/Map;

    return-object v0
.end method

.method public getModifiedFiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 916
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->modifiedFiles:Ljava/util/List;

    return-object v0
.end method

.method public getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 881
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->resultTree:Lorg/eclipse/jgit/lib/ObjectId;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->resultTree:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    goto :goto_0
.end method

.method public getToBeCheckedOut()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/dircache/DirCacheEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 926
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->toBeCheckedOut:Ljava/util/Map;

    return-object v0
.end method

.method public getUnmergedPaths()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 906
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->unmergedPaths:Ljava/util/List;

    return-object v0
.end method

.method protected mergeImpl()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 296
    iget-boolean v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->implicitDirCache:Z

    if-eqz v0, :cond_0

    .line 297
    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/ResolveMerger;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->dircache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 300
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeBase()Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->sourceTrees:[Lorg/eclipse/jgit/revwalk/RevTree;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->sourceTrees:[Lorg/eclipse/jgit/revwalk/RevTree;

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-virtual {p0, v0, v1, v2}, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeTrees(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/revwalk/RevTree;Lorg/eclipse/jgit/revwalk/RevTree;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 302
    iget-boolean v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->implicitDirCache:Z

    if-eqz v1, :cond_1

    .line 303
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->dircache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    :cond_1
    return v0

    .line 302
    :catchall_0
    move-exception v0

    iget-boolean v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->implicitDirCache:Z

    if-eqz v1, :cond_2

    .line 303
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->dircache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    :cond_2
    throw v0
.end method

.method protected mergeTreeWalk(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z
    .locals 10
    .parameter "treeWalk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 1058
    iget-object v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTreeCount()I

    move-result v0

    if-le v0, v9, :cond_1

    move v6, v7

    .line 1059
    .local v6, hasWorkingTreeIterator:Z
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1060
    const-class v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {p1, v8, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    const-class v0, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {p1, v7, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    const/4 v0, 0x2

    const-class v3, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {p1, v0, v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    const/4 v0, 0x3

    const-class v4, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    invoke-virtual {p1, v0, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    if-eqz v6, :cond_2

    const-class v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {p1, v9, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    move-object v5, v0

    :goto_1
    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/merge/ResolveMerger;->processEntry(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1067
    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/ResolveMerger;->cleanUp()V

    .line 1073
    :goto_2
    return v8

    .end local v6           #hasWorkingTreeIterator:Z
    :cond_1
    move v6, v8

    .line 1058
    goto :goto_0

    .line 1060
    .restart local v6       #hasWorkingTreeIterator:Z
    :cond_2
    const/4 v5, 0x0

    goto :goto_1

    .line 1070
    :cond_3
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->isSubtree()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->enterSubtree:Z

    if-eqz v0, :cond_0

    .line 1071
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->enterSubtree()V

    goto :goto_0

    :cond_4
    move v8, v7

    .line 1073
    goto :goto_2
.end method

.method protected mergeTrees(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;Lorg/eclipse/jgit/revwalk/RevTree;Lorg/eclipse/jgit/revwalk/RevTree;)Z
    .locals 5
    .parameter "baseTree"
    .parameter "headTree"
    .parameter "mergeTree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 1003
    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->dircache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    .line 1004
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCacheBuilder;)V

    .line 1006
    .local v0, buildIt:Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;
    new-instance v2, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v3, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->db:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    .line 1007
    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 1008
    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 1009
    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v2, p3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 1010
    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 1011
    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    if-eqz v2, :cond_0

    .line 1012
    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v3, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 1014
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeTreeWalk(Lorg/eclipse/jgit/treewalk/TreeWalk;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1044
    :goto_0
    return v1

    .line 1018
    :cond_1
    iget-boolean v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->inCore:Z

    if-nez v2, :cond_3

    .line 1022
    invoke-direct {p0}, Lorg/eclipse/jgit/merge/ResolveMerger;->checkout()V

    .line 1028
    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->commit()Z

    move-result v2

    if-nez v2, :cond_2

    .line 1029
    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/ResolveMerger;->cleanUp()V

    .line 1030
    new-instance v1, Lorg/eclipse/jgit/errors/IndexWriteException;

    invoke-direct {v1}, Lorg/eclipse/jgit/errors/IndexWriteException;-><init>()V

    throw v1

    .line 1032
    :cond_2
    iput-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    .line 1039
    :goto_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/ResolveMerger;->getUnmergedPaths()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/ResolveMerger;->failed()Z

    move-result v2

    if-nez v2, :cond_4

    .line 1040
    iget-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->dircache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/ResolveMerger;->getObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/dircache/DirCache;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->resultTree:Lorg/eclipse/jgit/lib/ObjectId;

    .line 1041
    const/4 v1, 0x1

    goto :goto_0

    .line 1035
    :cond_3
    iget-object v2, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->finish()V

    .line 1036
    iput-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    goto :goto_1

    .line 1043
    :cond_4
    iput-object v4, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->resultTree:Lorg/eclipse/jgit/lib/ObjectId;

    goto :goto_0
.end method

.method protected processEntry(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)Z
    .locals 24
    .parameter "base"
    .parameter "ours"
    .parameter "theirs"
    .parameter "index"
    .parameter "work"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 474
    const/4 v4, 0x1

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->enterSubtree:Z

    .line 475
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v20

    .line 476
    .local v20, modeO:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v21

    .line 477
    .local v21, modeT:I
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v19

    .line 479
    .local v19, modeB:I
    if-nez v20, :cond_0

    if-nez v21, :cond_0

    if-nez v19, :cond_0

    .line 481
    const/4 v4, 0x1

    .line 663
    :goto_0
    return v4

    .line 483
    :cond_0
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/merge/ResolveMerger;->isIndexDirty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 484
    const/4 v4, 0x0

    goto :goto_0

    .line 486
    :cond_1
    const/16 v23, 0x0

    .line 488
    .local v23, ourDce:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-eqz p4, :cond_2

    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v4

    if-nez v4, :cond_4

    .line 491
    :cond_2
    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 492
    new-instance v23, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .end local v23           #ourDce:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v4

    move-object/from16 v0, v23

    invoke-direct {v0, v4}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([B)V

    .line 493
    .restart local v23       #ourDce:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 494
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v4

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 500
    :cond_3
    :goto_1
    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-static/range {v21 .. v21}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_9

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v5, 0x1

    const/4 v6, 0x2

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->idEqual(II)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 502
    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_5

    .line 506
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/merge/ResolveMerger;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 508
    const/4 v4, 0x1

    goto :goto_0

    .line 497
    :cond_4
    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v23

    goto :goto_1

    .line 513
    :cond_5
    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeFileModes(III)I

    move-result v22

    .line 514
    .local v22, newMode:I
    sget-object v4, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v4

    move/from16 v0, v22

    if-eq v0, v4, :cond_8

    .line 515
    move/from16 v0, v22

    move/from16 v1, v20

    if-ne v0, v1, :cond_6

    .line 517
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/merge/ResolveMerger;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 529
    :goto_2
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 521
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/merge/ResolveMerger;->isWorktreeDirty(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;Lorg/eclipse/jgit/dircache/DirCacheEntry;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 522
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 525
    :cond_7
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x0

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p3

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v18

    .line 527
    .local v18, e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->toBeCheckedOut:Ljava/util/Map;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 533
    .end local v18           #e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_8
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x1

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 534
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x2

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p2

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 535
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x3

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p3

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 536
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->unmergedPaths:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 537
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeResults:Ljava/util/Map;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lorg/eclipse/jgit/merge/MergeResult;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/merge/MergeResult;-><init>(Ljava/util/List;)V

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 542
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 546
    .end local v22           #newMode:I
    :cond_9
    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_a

    move/from16 v0, v19

    move/from16 v1, v21

    if-ne v0, v1, :cond_a

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v5, 0x0

    const/4 v6, 0x2

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->idEqual(II)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 549
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/merge/ResolveMerger;->keep(Lorg/eclipse/jgit/dircache/DirCacheEntry;)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 551
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 554
    :cond_a
    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_f

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->idEqual(II)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 559
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/merge/ResolveMerger;->isWorktreeDirty(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;Lorg/eclipse/jgit/dircache/DirCacheEntry;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 560
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 561
    :cond_b
    invoke-static/range {v21 .. v21}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 565
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x0

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p3

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v18

    .line 567
    .restart local v18       #e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-eqz v18, :cond_c

    .line 568
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->toBeCheckedOut:Ljava/util/Map;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 569
    :cond_c
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 570
    .end local v18           #e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_d
    if-nez v21, :cond_f

    if-eqz v19, :cond_f

    .line 575
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTreeCount()I

    move-result v4

    const/4 v5, 0x4

    if-le v4, v5, :cond_e

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v4

    if-nez v4, :cond_e

    .line 576
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 577
    :cond_e
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->toBeDeleted:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 578
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 582
    :cond_f
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isSubtree()Z

    move-result v4

    if-eqz v4, :cond_14

    .line 587
    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_11

    invoke-static/range {v21 .. v21}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-nez v4, :cond_11

    .line 588
    invoke-static/range {v19 .. v19}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 589
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x1

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 590
    :cond_10
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x2

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p2

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 591
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->unmergedPaths:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 592
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->enterSubtree:Z

    .line 593
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 595
    :cond_11
    invoke-static/range {v21 .. v21}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_13

    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-nez v4, :cond_13

    .line 596
    invoke-static/range {v19 .. v19}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 597
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x1

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 598
    :cond_12
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x3

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p3

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 599
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->unmergedPaths:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 600
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->enterSubtree:Z

    .line 601
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 608
    :cond_13
    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-nez v4, :cond_14

    .line 609
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 615
    :cond_14
    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_1a

    invoke-static/range {v21 .. v21}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 617
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/merge/ResolveMerger;->isWorktreeDirty(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;Lorg/eclipse/jgit/dircache/DirCacheEntry;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 618
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 621
    :cond_15
    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/merge/ResolveMerger;->isGitLink(I)Z

    move-result v4

    if-nez v4, :cond_16

    invoke-static/range {v21 .. v21}, Lorg/eclipse/jgit/merge/ResolveMerger;->isGitLink(I)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 622
    :cond_16
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x1

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 623
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x2

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p2

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 624
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v5

    const/4 v7, 0x3

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v6, p3

    invoke-direct/range {v4 .. v11}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 625
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->unmergedPaths:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 626
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 629
    :cond_17
    invoke-direct/range {p0 .. p3}, Lorg/eclipse/jgit/merge/ResolveMerger;->contentMerge(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;)Lorg/eclipse/jgit/merge/MergeResult;

    move-result-object v8

    .line 630
    .local v8, result:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<Lorg/eclipse/jgit/diff/RawText;>;"
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/eclipse/jgit/merge/ResolveMerger;->writeMergedFile(Lorg/eclipse/jgit/merge/MergeResult;)Ljava/io/File;

    move-result-object v9

    .local v9, of:Ljava/io/File;
    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    .line 631
    invoke-direct/range {v4 .. v9}, Lorg/eclipse/jgit/merge/ResolveMerger;->updateIndex(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/merge/MergeResult;Ljava/io/File;)V

    .line 632
    invoke-virtual {v8}, Lorg/eclipse/jgit/merge/MergeResult;->containsConflicts()Z

    move-result v4

    if-eqz v4, :cond_18

    .line 633
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->unmergedPaths:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 634
    :cond_18
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->modifiedFiles:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 663
    .end local v8           #result:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<Lorg/eclipse/jgit/diff/RawText;>;"
    .end local v9           #of:Ljava/io/File;
    :cond_19
    :goto_3
    const/4 v4, 0x1

    goto/16 :goto_0

    .line 635
    :cond_1a
    move/from16 v0, v20

    move/from16 v1, v21

    if-eq v0, v1, :cond_19

    .line 637
    if-eqz v20, :cond_1b

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->idEqual(II)Z

    move-result v4

    if-eqz v4, :cond_1c

    :cond_1b
    if-eqz v21, :cond_19

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const/4 v5, 0x0

    const/4 v6, 0x2

    invoke-virtual {v4, v5, v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->idEqual(II)Z

    move-result v4

    if-nez v4, :cond_19

    .line 640
    :cond_1c
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v11

    const/4 v13, 0x1

    const-wide/16 v14, 0x0

    const-wide/16 v16, 0x0

    move-object/from16 v10, p0

    move-object/from16 v12, p1

    invoke-direct/range {v10 .. v17}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 641
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v11

    const/4 v13, 0x2

    const-wide/16 v14, 0x0

    const-wide/16 v16, 0x0

    move-object/from16 v10, p0

    move-object/from16 v12, p2

    invoke-direct/range {v10 .. v17}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 642
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v11

    const/4 v13, 0x3

    const-wide/16 v14, 0x0

    const-wide/16 v16, 0x0

    move-object/from16 v10, p0

    move-object/from16 v12, p3

    invoke-direct/range {v10 .. v17}, Lorg/eclipse/jgit/merge/ResolveMerger;->add([BLorg/eclipse/jgit/treewalk/CanonicalTreeParser;IJJ)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v18

    .line 646
    .restart local v18       #e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-nez v20, :cond_1e

    .line 648
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/merge/ResolveMerger;->isWorktreeDirty(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;Lorg/eclipse/jgit/dircache/DirCacheEntry;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 649
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 650
    :cond_1d
    invoke-static/range {v21 .. v21}, Lorg/eclipse/jgit/merge/ResolveMerger;->nonTree(I)Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 651
    if-eqz v18, :cond_1e

    .line 652
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->toBeCheckedOut:Ljava/util/Map;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v18

    invoke-interface {v4, v5, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 656
    :cond_1e
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->unmergedPaths:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 659
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->mergeResults:Ljava/util/Map;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/merge/ResolveMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {p0 .. p3}, Lorg/eclipse/jgit/merge/ResolveMerger;->contentMerge(Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;)Lorg/eclipse/jgit/merge/MergeResult;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_3
.end method

.method public setCommitNames([Ljava/lang/String;)V
    .locals 0
    .parameter "commitNames"

    .prologue
    .line 890
    iput-object p1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->commitNames:[Ljava/lang/String;

    .line 891
    return-void
.end method

.method public setDirCache(Lorg/eclipse/jgit/dircache/DirCache;)V
    .locals 1
    .parameter "dc"

    .prologue
    .line 970
    iput-object p1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->dircache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 971
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->implicitDirCache:Z

    .line 972
    return-void
.end method

.method public setWorkingTreeIterator(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V
    .locals 0
    .parameter "workingTreeIterator"

    .prologue
    .line 986
    iput-object p1, p0, Lorg/eclipse/jgit/merge/ResolveMerger;->workingTreeIterator:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 987
    return-void
.end method
