.class public Lorg/eclipse/jgit/api/ResetCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "ResetCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/ResetCommand$1;,
        Lorg/eclipse/jgit/api/ResetCommand$ResetType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/lib/Ref;",
        ">;"
    }
.end annotation


# instance fields
.field private filepaths:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mode:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

.field private ref:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 131
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->ref:Ljava/lang/String;

    .line 124
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->filepaths:Ljava/util/Collection;

    .line 132
    return-void
.end method

.method private checkoutIndex(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 5
    .parameter "commitTree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 387
    iget-object v3, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v2

    .line 389
    .local v2, dc:Lorg/eclipse/jgit/dircache/DirCache;
    :try_start_0
    new-instance v1, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    iget-object v3, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v1, v3, v2, p1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 391
    .local v1, checkout:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 393
    :try_start_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_1 .. :try_end_1} :catch_0

    .line 399
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 401
    return-void

    .line 394
    :catch_0
    move-exception v0

    .line 395
    .local v0, cce:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    :try_start_2
    new-instance v3, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->getConflicts()Ljava/util/List;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;-><init>(Ljava/util/List;Lorg/eclipse/jgit/errors/CheckoutConflictException;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 399
    .end local v0           #cce:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    .end local v1           #checkout:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    throw v3
.end method

.method private getRefOrHEAD()Ljava/lang/String;
    .locals 1

    .prologue
    .line 297
    iget-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->ref:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 298
    iget-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->ref:Ljava/lang/String;

    .line 300
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "HEAD"

    goto :goto_0
.end method

.method private parseCommit(Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 8
    .parameter "commitId"

    .prologue
    .line 235
    new-instance v2, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v3, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 237
    .local v2, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 242
    .local v0, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 244
    return-object v0

    .line 238
    .end local v0           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :catch_0
    move-exception v1

    .line 239
    .local v1, e:Ljava/io/IOException;
    :try_start_1
    new-instance v3, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->cannotReadCommit:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectId;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 242
    .end local v1           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v3
.end method

.method private resetCherryPick()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 409
    iget-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->writeCherryPickHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 410
    iget-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->writeMergeCommitMsg(Ljava/lang/String;)V

    .line 411
    return-void
.end method

.method private resetIndex(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 10
    .parameter "commitTree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 341
    iget-object v8, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v2

    .line 342
    .local v2, dc:Lorg/eclipse/jgit/dircache/DirCache;
    const/4 v6, 0x0

    .line 344
    .local v6, walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :try_start_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v0

    .line 346
    .local v0, builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    new-instance v7, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v8, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v7, v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 347
    .end local v6           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .local v7, walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    if-eqz p1, :cond_3

    .line 348
    :try_start_1
    invoke-virtual {v7, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 351
    :goto_0
    new-instance v8, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-direct {v8, v2}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 352
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 354
    :cond_0
    :goto_1
    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 355
    const/4 v8, 0x0

    const-class v9, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v7, v8, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    .line 357
    .local v1, cIter:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    if-eqz v1, :cond_0

    .line 362
    new-instance v4, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawPath()[B

    move-result-object v8

    invoke-direct {v4, v8}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([B)V

    .line 363
    .local v4, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 364
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idBuffer()[B

    move-result-object v8

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idOffset()I

    move-result v9

    invoke-virtual {v4, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectIdFromRaw([BI)V

    .line 366
    const/4 v8, 0x1

    const-class v9, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual {v7, v8, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 368
    .local v3, dcIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    if-eqz v3, :cond_1

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 369
    invoke-virtual {v3}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v5

    .line 370
    .local v5, indexEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLastModified()J

    move-result-wide v8

    invoke-virtual {v4, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V

    .line 371
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLength()I

    move-result v8

    invoke-virtual {v4, v8}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(I)V

    .line 374
    .end local v5           #indexEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_1
    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 379
    .end local v1           #cIter:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v3           #dcIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v4           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :catchall_0
    move-exception v8

    move-object v6, v7

    .end local v0           #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .end local v7           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .restart local v6       #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :goto_2
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 380
    if-eqz v6, :cond_2

    .line 381
    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    :cond_2
    throw v8

    .line 350
    .end local v6           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .restart local v0       #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .restart local v7       #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :cond_3
    :try_start_2
    new-instance v8, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;

    invoke-direct {v8}, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;-><init>()V

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    goto :goto_0

    .line 377
    :cond_4
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->commit()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 379
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 380
    if-eqz v7, :cond_5

    .line 381
    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    .line 383
    :cond_5
    return-void

    .line 379
    .end local v0           #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .end local v7           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .restart local v6       #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :catchall_1
    move-exception v8

    goto :goto_2
.end method

.method private resetIndexForPaths(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 8
    .parameter "commitTree"

    .prologue
    .line 304
    const/4 v1, 0x0

    .line 306
    .local v1, dc:Lorg/eclipse/jgit/dircache/DirCache;
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v1

    .line 307
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v0

    .line 309
    .local v0, builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    new-instance v5, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v6, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 310
    .local v5, tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    new-instance v6, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    invoke-direct {v6, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCacheBuilder;)V

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 311
    if-eqz p1, :cond_2

    .line 312
    invoke-virtual {v5, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 315
    :goto_0
    iget-object v6, p0, Lorg/eclipse/jgit/api/ResetCommand;->filepaths:Ljava/util/Collection;

    invoke-static {v6}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 316
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 318
    :cond_0
    :goto_1
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 319
    const/4 v6, 0x1

    const-class v7, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    invoke-virtual {v5, v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    .line 322
    .local v4, tree:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    if-eqz v4, :cond_0

    .line 324
    new-instance v3, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawPath()[B

    move-result-object v6

    invoke-direct {v3, v6}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([B)V

    .line 325
    .local v3, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 326
    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 327
    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 332
    .end local v0           #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .end local v3           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v4           #tree:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .end local v5           #tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :catch_0
    move-exception v2

    .line 333
    .local v2, e:Ljava/io/IOException;
    :try_start_1
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 335
    .end local v2           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v6

    if-eqz v1, :cond_1

    .line 336
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    :cond_1
    throw v6

    .line 314
    .restart local v0       #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .restart local v5       #tw:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :cond_2
    :try_start_2
    new-instance v6, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;

    invoke-direct {v6}, Lorg/eclipse/jgit/treewalk/EmptyTreeIterator;-><init>()V

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    goto :goto_0

    .line 331
    :cond_3
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->commit()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 335
    if-eqz v1, :cond_4

    .line 336
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 338
    :cond_4
    return-void
.end method

.method private resetMerge()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 404
    iget-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->writeMergeHeads(Ljava/util/List;)V

    .line 405
    iget-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->writeMergeCommitMsg(Ljava/lang/String;)V

    .line 406
    return-void
.end method

.method private resetRevert()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 414
    iget-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->writeRevertHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 415
    iget-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/Repository;->writeMergeCommitMsg(Ljava/lang/String;)V

    .line 416
    return-void
.end method

.method private resolveRefToCommitId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 6

    .prologue
    .line 249
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lorg/eclipse/jgit/api/ResetCommand;->getRefOrHEAD()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "^{commit}"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 250
    :catch_0
    move-exception v0

    .line 251
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cannotRead:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-direct {p0}, Lorg/eclipse/jgit/api/ResetCommand;->getRefOrHEAD()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public addPath(Ljava/lang/String;)Lorg/eclipse/jgit/api/ResetCommand;
    .locals 5
    .parameter "path"

    .prologue
    .line 288
    iget-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->mode:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    if-eqz v0, :cond_0

    .line 289
    new-instance v0, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->illegalCombinationOfArguments:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "<paths>..."

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "[--mixed | --soft | --hard]"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->filepaths:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 293
    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ResetCommand;->call()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/lib/Ref;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/CheckoutConflictException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/ResetCommand;->checkCallable()V

    .line 146
    :try_start_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v13}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v12

    .line 147
    .local v12, state:Lorg/eclipse/jgit/lib/RepositoryState;
    sget-object v13, Lorg/eclipse/jgit/lib/RepositoryState;->MERGING:Lorg/eclipse/jgit/lib/RepositoryState;

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/lib/RepositoryState;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_0

    sget-object v13, Lorg/eclipse/jgit/lib/RepositoryState;->MERGING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/lib/RepositoryState;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    :cond_0
    const/4 v5, 0x1

    .line 149
    .local v5, merging:Z
    :goto_0
    sget-object v13, Lorg/eclipse/jgit/lib/RepositoryState;->CHERRY_PICKING:Lorg/eclipse/jgit/lib/RepositoryState;

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/lib/RepositoryState;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    sget-object v13, Lorg/eclipse/jgit/lib/RepositoryState;->CHERRY_PICKING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/lib/RepositoryState;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    :cond_1
    const/4 v1, 0x1

    .line 152
    .local v1, cherryPicking:Z
    :goto_1
    sget-object v13, Lorg/eclipse/jgit/lib/RepositoryState;->REVERTING:Lorg/eclipse/jgit/lib/RepositoryState;

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/lib/RepositoryState;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    sget-object v13, Lorg/eclipse/jgit/lib/RepositoryState;->REVERTING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/lib/RepositoryState;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    :cond_2
    const/4 v10, 0x1

    .line 155
    .local v10, reverting:Z
    :goto_2
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/ResetCommand;->resolveRefToCommitId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 157
    .local v2, commitId:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/api/ResetCommand;->ref:Ljava/lang/String;

    if-eqz v13, :cond_6

    if-nez v2, :cond_6

    .line 160
    new-instance v13, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Invalid ref "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/api/ResetCommand;->ref:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " specified"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v13
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    .end local v1           #cherryPicking:Z
    .end local v2           #commitId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v5           #merging:Z
    .end local v10           #reverting:Z
    .end local v12           #state:Lorg/eclipse/jgit/lib/RepositoryState;
    :catch_0
    move-exception v4

    .line 227
    .local v4, e:Ljava/io/IOException;
    new-instance v13, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v14

    iget-object v14, v14, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfResetCommand:Ljava/lang/String;

    invoke-direct {v13, v14, v4}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v13

    .line 147
    .end local v4           #e:Ljava/io/IOException;
    .restart local v12       #state:Lorg/eclipse/jgit/lib/RepositoryState;
    :cond_3
    const/4 v5, 0x0

    goto :goto_0

    .line 149
    .restart local v5       #merging:Z
    :cond_4
    const/4 v1, 0x0

    goto :goto_1

    .line 152
    .restart local v1       #cherryPicking:Z
    :cond_5
    const/4 v10, 0x0

    goto :goto_2

    .line 165
    .restart local v2       #commitId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v10       #reverting:Z
    :cond_6
    if-eqz v2, :cond_7

    .line 166
    :try_start_1
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/api/ResetCommand;->parseCommit(Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v13

    invoke-virtual {v13}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v3

    .line 170
    .local v3, commitTree:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_3
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/api/ResetCommand;->filepaths:Ljava/util/Collection;

    invoke-interface {v13}, Ljava/util/Collection;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_8

    .line 172
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/api/ResetCommand;->resetIndexForPaths(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 173
    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/api/ResetCommand;->setCallable(Z)V

    .line 174
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v14, "HEAD"

    invoke-virtual {v13, v14}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v9

    .line 225
    :goto_4
    return-object v9

    .line 168
    .end local v3           #commitTree:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_7
    const/4 v3, 0x0

    .restart local v3       #commitTree:Lorg/eclipse/jgit/lib/ObjectId;
    goto :goto_3

    .line 178
    :cond_8
    if-eqz v2, :cond_c

    .line 180
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v14, "HEAD"

    invoke-virtual {v13, v14}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v11

    .line 181
    .local v11, ru:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v11, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 183
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/ResetCommand;->getRefOrHEAD()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 184
    .local v8, refName:Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ": updating "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "HEAD"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 185
    .local v6, message:Ljava/lang/String;
    const/4 v13, 0x0

    invoke-virtual {v11, v6, v13}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 186
    invoke-virtual {v11}, Lorg/eclipse/jgit/lib/RefUpdate;->forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v13

    sget-object v14, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    if-ne v13, v14, :cond_9

    .line 187
    new-instance v13, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v14

    iget-object v14, v14, Lorg/eclipse/jgit/internal/JGitText;->cannotLock:Ljava/lang/String;

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v11}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 190
    :cond_9
    invoke-virtual {v11}, Lorg/eclipse/jgit/lib/RefUpdate;->getOldObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    .line 191
    .local v7, origHead:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v7, :cond_a

    .line 192
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v13, v7}, Lorg/eclipse/jgit/lib/Repository;->writeOrigHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 193
    :cond_a
    invoke-virtual {v11}, Lorg/eclipse/jgit/lib/RefUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v9

    .line 198
    .end local v6           #message:Ljava/lang/String;
    .end local v7           #origHead:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v8           #refName:Ljava/lang/String;
    .end local v11           #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    .local v9, result:Lorg/eclipse/jgit/lib/Ref;
    :goto_5
    sget-object v13, Lorg/eclipse/jgit/api/ResetCommand$1;->$SwitchMap$org$eclipse$jgit$api$ResetCommand$ResetType:[I

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/api/ResetCommand;->mode:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    invoke-virtual {v14}, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->ordinal()I

    move-result v14

    aget v13, v13, v14

    packed-switch v13, :pswitch_data_0

    .line 213
    :goto_6
    :pswitch_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/api/ResetCommand;->mode:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    sget-object v14, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->SOFT:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    if-eq v13, v14, :cond_b

    .line 214
    if-eqz v5, :cond_d

    .line 215
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/ResetCommand;->resetMerge()V

    .line 224
    :cond_b
    :goto_7
    const/4 v13, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/api/ResetCommand;->setCallable(Z)V

    goto/16 :goto_4

    .line 195
    .end local v9           #result:Lorg/eclipse/jgit/lib/Ref;
    :cond_c
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v14, "HEAD"

    invoke-virtual {v13, v14}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v9

    .restart local v9       #result:Lorg/eclipse/jgit/lib/Ref;
    goto :goto_5

    .line 200
    :pswitch_1
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/api/ResetCommand;->checkoutIndex(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_6

    .line 203
    :pswitch_2
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/api/ResetCommand;->resetIndex(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_6

    .line 209
    :pswitch_3
    new-instance v13, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v13}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v13

    .line 216
    :cond_d
    if-eqz v1, :cond_e

    .line 217
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/ResetCommand;->resetCherryPick()V

    goto :goto_7

    .line 218
    :cond_e
    if-eqz v10, :cond_f

    .line 219
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/ResetCommand;->resetRevert()V

    goto :goto_7

    .line 220
    :cond_f
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v13}, Lorg/eclipse/jgit/lib/Repository;->readSquashCommitMsg()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_b

    .line 221
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/api/ResetCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const/4 v14, 0x0

    invoke-virtual {v13, v14}, Lorg/eclipse/jgit/lib/Repository;->writeSquashCommitMsg(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_7

    .line 198
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method public setMode(Lorg/eclipse/jgit/api/ResetCommand$ResetType;)Lorg/eclipse/jgit/api/ResetCommand;
    .locals 5
    .parameter "mode"

    .prologue
    .line 273
    iget-object v0, p0, Lorg/eclipse/jgit/api/ResetCommand;->filepaths:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 274
    new-instance v0, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->illegalCombinationOfArguments:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "[--mixed | --soft | --hard]"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "<paths>..."

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 277
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/api/ResetCommand;->mode:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    .line 278
    return-object p0
.end method

.method public setRef(Ljava/lang/String;)Lorg/eclipse/jgit/api/ResetCommand;
    .locals 0
    .parameter "ref"

    .prologue
    .line 263
    iput-object p1, p0, Lorg/eclipse/jgit/api/ResetCommand;->ref:Ljava/lang/String;

    .line 264
    return-object p0
.end method
