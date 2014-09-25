.class public Lorg/eclipse/jgit/api/StashApplyCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "StashApplyCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/lib/ObjectId;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_REF:Ljava/lang/String; = "stash@{0}"


# instance fields
.field private applyIndex:Z

.field private applyUntracked:Z

.field private ignoreRepositoryState:Z

.field private stashRef:Ljava/lang/String;

.field private strategy:Lorg/eclipse/jgit/merge/MergeStrategy;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    const/4 v0, 0x1

    .line 107
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 93
    iput-boolean v0, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->applyIndex:Z

    .line 95
    iput-boolean v0, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->applyUntracked:Z

    .line 99
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->RECURSIVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    iput-object v0, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 108
    return-void
.end method

.method private checkoutPath(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 7
    .parameter "entry"
    .parameter "reader"

    .prologue
    .line 372
    :try_start_0
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 373
    .local v1, file:Ljava/io/File;
    iget-object v2, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v2, v1, p1, p2}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkoutEntry(Lorg/eclipse/jgit/lib/Repository;Ljava/io/File;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 379
    return-void

    .line 374
    .end local v1           #file:Ljava/io/File;
    :catch_0
    move-exception v0

    .line 375
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->checkoutConflictWithFile:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private getStashId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 135
    iget-object v3, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->stashRef:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->stashRef:Ljava/lang/String;

    .line 138
    .local v1, revision:Ljava/lang/String;
    :goto_0
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 143
    .local v2, stashId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v2, :cond_1

    .line 144
    new-instance v3, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->stashResolveFailed:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 135
    .end local v1           #revision:Ljava/lang/String;
    .end local v2           #stashId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    const-string v1, "stash@{0}"

    goto :goto_0

    .line 139
    .restart local v1       #revision:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 140
    .local v0, e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->stashResolveFailed:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 146
    .end local v0           #e:Ljava/io/IOException;
    .restart local v2       #stashId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    return-object v2
.end method

.method private resetIndex(Lorg/eclipse/jgit/revwalk/RevTree;)V
    .locals 10
    .parameter "tree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    iget-object v8, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v2

    .line 290
    .local v2, dc:Lorg/eclipse/jgit/dircache/DirCache;
    const/4 v6, 0x0

    .line 292
    .local v6, walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :try_start_0
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v0

    .line 294
    .local v0, builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    new-instance v7, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v8, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v7, v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 295
    .end local v6           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .local v7, walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :try_start_1
    invoke-virtual {v7, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 296
    new-instance v8, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-direct {v8, v2}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 297
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 299
    :cond_0
    :goto_0
    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 300
    const/4 v8, 0x0

    const-class v9, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v7, v8, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    .line 302
    .local v1, cIter:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    if-eqz v1, :cond_0

    .line 307
    new-instance v4, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawPath()[B

    move-result-object v8

    invoke-direct {v4, v8}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([B)V

    .line 308
    .local v4, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 309
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idBuffer()[B

    move-result-object v8

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idOffset()I

    move-result v9

    invoke-virtual {v4, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectIdFromRaw([BI)V

    .line 311
    const/4 v8, 0x1

    const-class v9, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-virtual {v7, v8, v9}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 313
    .local v3, dcIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    if-eqz v3, :cond_1

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 314
    invoke-virtual {v3}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v5

    .line 315
    .local v5, indexEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLastModified()J

    move-result-wide v8

    invoke-virtual {v4, v8, v9}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V

    .line 316
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getLength()I

    move-result v8

    invoke-virtual {v4, v8}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(I)V

    .line 319
    .end local v5           #indexEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_1
    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 324
    .end local v1           #cIter:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v3           #dcIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v4           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :catchall_0
    move-exception v8

    move-object v6, v7

    .end local v0           #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .end local v7           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .restart local v6       #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :goto_1
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 325
    if-eqz v6, :cond_2

    .line 326
    invoke-virtual {v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    :cond_2
    throw v8

    .line 322
    .end local v6           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .restart local v0       #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .restart local v7       #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :cond_3
    :try_start_2
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->commit()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 324
    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 325
    if-eqz v7, :cond_4

    .line 326
    invoke-virtual {v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    .line 328
    :cond_4
    return-void

    .line 324
    .end local v0           #builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .end local v7           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .restart local v6       #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :catchall_1
    move-exception v8

    goto :goto_1
.end method

.method private resetUntracked(Lorg/eclipse/jgit/revwalk/RevTree;)V
    .locals 8
    .parameter "tree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CheckoutConflictException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 332
    const/4 v4, 0x0

    .line 334
    .local v4, walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :try_start_0
    new-instance v5, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v6, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 335
    .end local v4           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .local v5, walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :try_start_1
    invoke-virtual {v5, p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 336
    new-instance v6, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    iget-object v7, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 337
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 339
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v3

    .line 341
    .local v3, reader:Lorg/eclipse/jgit/lib/ObjectReader;
    :cond_0
    :goto_0
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 342
    const/4 v6, 0x0

    const-class v7, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v5, v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    .line 344
    .local v0, cIter:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    if-eqz v0, :cond_0

    .line 348
    new-instance v1, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawPath()[B

    move-result-object v6

    invoke-direct {v1, v6}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([B)V

    .line 349
    .local v1, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 350
    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idBuffer()[B

    move-result-object v6

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idOffset()I

    move-result v7

    invoke-virtual {v1, v6, v7}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectIdFromRaw([BI)V

    .line 352
    const/4 v6, 0x1

    const-class v7, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    invoke-virtual {v5, v6, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    .line 354
    .local v2, fIter:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    if-eqz v2, :cond_2

    .line 355
    const/4 v6, 0x1

    invoke-virtual {v2, v1, v6, v3}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->isModified(Lorg/eclipse/jgit/dircache/DirCacheEntry;ZLorg/eclipse/jgit/lib/ObjectReader;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 357
    new-instance v6, Lorg/eclipse/jgit/errors/CheckoutConflictException;

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/eclipse/jgit/errors/CheckoutConflictException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 365
    .end local v0           #cIter:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v1           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v2           #fIter:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    .end local v3           #reader:Lorg/eclipse/jgit/lib/ObjectReader;
    :catchall_0
    move-exception v6

    move-object v4, v5

    .end local v5           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .restart local v4       #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :goto_1
    if-eqz v4, :cond_1

    .line 366
    invoke-virtual {v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    :cond_1
    throw v6

    .line 362
    .end local v4           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .restart local v0       #cIter:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .restart local v1       #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .restart local v2       #fIter:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    .restart local v3       #reader:Lorg/eclipse/jgit/lib/ObjectReader;
    .restart local v5       #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :cond_2
    :try_start_2
    invoke-direct {p0, v1, v3}, Lorg/eclipse/jgit/api/StashApplyCommand;->checkoutPath(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 365
    .end local v0           #cIter:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v1           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v2           #fIter:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    :cond_3
    if-eqz v5, :cond_4

    .line 366
    invoke-virtual {v5}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    .line 368
    :cond_4
    return-void

    .line 365
    .end local v3           #reader:Lorg/eclipse/jgit/lib/ObjectReader;
    .end local v5           #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .restart local v4       #walk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :catchall_1
    move-exception v6

    goto :goto_1
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 87
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/StashApplyCommand;->call()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;,
            Lorg/eclipse/jgit/api/errors/StashApplyFailureException;
        }
    .end annotation

    .prologue
    .line 162
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/StashApplyCommand;->checkCallable()V

    .line 164
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->ignoreRepositoryState:Z

    move/from16 v19, v0

    if-nez v19, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v19

    sget-object v20, Lorg/eclipse/jgit/lib/RepositoryState;->SAFE:Lorg/eclipse/jgit/lib/RepositoryState;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-eq v0, v1, :cond_0

    .line 166
    new-instance v19, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->stashApplyOnUnsafeRepository:Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 170
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v10

    .line 172
    .local v10, reader:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_0
    new-instance v11, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v11, v10}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 174
    .local v11, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    const-string v20, "HEAD"

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    .line 175
    .local v5, headCommit:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v5, :cond_1

    .line 176
    new-instance v19, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->stashApplyWithoutHead:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v19
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/eclipse/jgit/api/errors/JGitInternalException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 250
    .end local v5           #headCommit:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v11           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :catch_0
    move-exception v4

    .line 251
    .local v4, e:Lorg/eclipse/jgit/api/errors/JGitInternalException;
    :try_start_1
    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 255
    .end local v4           #e:Lorg/eclipse/jgit/api/errors/JGitInternalException;
    :catchall_0
    move-exception v19

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v19

    .line 178
    .restart local v5       #headCommit:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v11       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :cond_1
    :try_start_2
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/StashApplyCommand;->getStashId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v14

    .line 179
    .local v14, stashId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v11, v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v12

    .line 180
    .local v12, stashCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v12}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v19

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_2

    invoke-virtual {v12}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v19

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_3

    .line 182
    :cond_2
    new-instance v19, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->stashCommitIncorrectNumberOfParents:Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    invoke-virtual {v14}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    const/16 v22, 0x1

    invoke-virtual {v12}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    aput-object v23, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v19
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Lorg/eclipse/jgit/api/errors/JGitInternalException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 252
    .end local v5           #headCommit:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v11           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .end local v12           #stashCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v14           #stashId:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_1
    move-exception v4

    .line 253
    .local v4, e:Ljava/io/IOException;
    :try_start_3
    new-instance v19, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->stashApplyFailed:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v4}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v19
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 187
    .end local v4           #e:Ljava/io/IOException;
    .restart local v5       #headCommit:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v11       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v12       #stashCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v14       #stashId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_3
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    const-string v20, "HEAD^{tree}"

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    .line 188
    .local v6, headTree:Lorg/eclipse/jgit/lib/ObjectId;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v12, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v15

    .line 190
    .local v15, stashIndexCommit:Lorg/eclipse/jgit/lib/ObjectId;
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v12, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v13

    .line 191
    .local v13, stashHeadCommit:Lorg/eclipse/jgit/lib/ObjectId;
    const/16 v16, 0x0

    .line 192
    .local v16, untrackedCommit:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->applyUntracked:Z

    move/from16 v19, v0

    if-eqz v19, :cond_4

    invoke-virtual {v12}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v19

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_4

    .line 193
    const/16 v19, 0x2

    move/from16 v0, v19

    invoke-virtual {v12, v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v16

    .line 195
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/merge/MergeStrategy;->newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/Merger;

    move-result-object v8

    check-cast v8, Lorg/eclipse/jgit/merge/ResolveMerger;

    .line 196
    .local v8, merger:Lorg/eclipse/jgit/merge/ResolveMerger;
    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const-string v21, "stashed HEAD"

    aput-object v21, v19, v20

    const/16 v20, 0x1

    const-string v21, "HEAD"

    aput-object v21, v19, v20

    const/16 v20, 0x2

    const-string v21, "stash"

    aput-object v21, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/merge/ResolveMerger;->setCommitNames([Ljava/lang/String;)V

    .line 198
    invoke-virtual {v8, v13}, Lorg/eclipse/jgit/merge/ResolveMerger;->setBase(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 199
    new-instance v19, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/merge/ResolveMerger;->setWorkingTreeIterator(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    .line 200
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Lorg/eclipse/jgit/lib/AnyObjectId;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v5, v19, v20

    const/16 v20, 0x1

    aput-object v12, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/merge/ResolveMerger;->merge([Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v19

    if-eqz v19, :cond_9

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v2

    .line 202
    .local v2, dc:Lorg/eclipse/jgit/dircache/DirCache;
    new-instance v3, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-virtual {v8}, Lorg/eclipse/jgit/merge/ResolveMerger;->getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v3, v0, v6, v2, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 204
    .local v3, dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V

    .line 205
    invoke-virtual {v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z

    .line 206
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->applyIndex:Z

    move/from16 v19, v0

    if-eqz v19, :cond_5

    .line 207
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    invoke-virtual/range {v19 .. v21}, Lorg/eclipse/jgit/merge/MergeStrategy;->newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/Merger;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/merge/ResolveMerger;

    .line 209
    .local v7, ixMerger:Lorg/eclipse/jgit/merge/ResolveMerger;
    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const-string v21, "stashed HEAD"

    aput-object v21, v19, v20

    const/16 v20, 0x1

    const-string v21, "HEAD"

    aput-object v21, v19, v20

    const/16 v20, 0x2

    const-string v21, "stashed index"

    aput-object v21, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Lorg/eclipse/jgit/merge/ResolveMerger;->setCommitNames([Ljava/lang/String;)V

    .line 211
    invoke-virtual {v7, v13}, Lorg/eclipse/jgit/merge/ResolveMerger;->setBase(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 212
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Lorg/eclipse/jgit/lib/AnyObjectId;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v5, v19, v20

    const/16 v20, 0x1

    aput-object v15, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Lorg/eclipse/jgit/merge/ResolveMerger;->merge([Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v9

    .line 213
    .local v9, ok:Z
    if-eqz v9, :cond_7

    .line 214
    invoke-virtual {v7}, Lorg/eclipse/jgit/merge/ResolveMerger;->getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/StashApplyCommand;->resetIndex(Lorg/eclipse/jgit/revwalk/RevTree;)V

    .line 222
    .end local v7           #ixMerger:Lorg/eclipse/jgit/merge/ResolveMerger;
    .end local v9           #ok:Z
    :cond_5
    if-eqz v16, :cond_6

    .line 223
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashApplyCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    invoke-virtual/range {v19 .. v21}, Lorg/eclipse/jgit/merge/MergeStrategy;->newMerger(Lorg/eclipse/jgit/lib/Repository;Z)Lorg/eclipse/jgit/merge/Merger;

    move-result-object v17

    check-cast v17, Lorg/eclipse/jgit/merge/ResolveMerger;

    .line 225
    .local v17, untrackedMerger:Lorg/eclipse/jgit/merge/ResolveMerger;
    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const-string v21, "stashed HEAD"

    aput-object v21, v19, v20

    const/16 v20, 0x1

    const-string v21, "HEAD"

    aput-object v21, v19, v20

    const/16 v20, 0x2

    const-string v21, "untracked files"

    aput-object v21, v19, v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/merge/ResolveMerger;->setCommitNames([Ljava/lang/String;)V

    .line 227
    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Lorg/eclipse/jgit/merge/ResolveMerger;->setBase(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 228
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Lorg/eclipse/jgit/lib/AnyObjectId;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v5, v19, v20

    const/16 v20, 0x1

    aput-object v16, v19, v20

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/merge/ResolveMerger;->merge([Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Lorg/eclipse/jgit/api/errors/JGitInternalException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    move-result v9

    .line 230
    .restart local v9       #ok:Z
    if-eqz v9, :cond_8

    .line 232
    :try_start_5
    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/merge/ResolveMerger;->getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v18

    .line 235
    .local v18, untrackedTree:Lorg/eclipse/jgit/revwalk/RevTree;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/StashApplyCommand;->resetUntracked(Lorg/eclipse/jgit/revwalk/RevTree;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lorg/eclipse/jgit/api/errors/JGitInternalException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 255
    .end local v9           #ok:Z
    .end local v17           #untrackedMerger:Lorg/eclipse/jgit/merge/ResolveMerger;
    .end local v18           #untrackedTree:Lorg/eclipse/jgit/revwalk/RevTree;
    :cond_6
    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    return-object v14

    .line 217
    .restart local v7       #ixMerger:Lorg/eclipse/jgit/merge/ResolveMerger;
    .restart local v9       #ok:Z
    :cond_7
    :try_start_6
    new-instance v19, Lorg/eclipse/jgit/api/errors/StashApplyFailureException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->stashApplyConflict:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/api/errors/StashApplyFailureException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 236
    .end local v7           #ixMerger:Lorg/eclipse/jgit/merge/ResolveMerger;
    .restart local v17       #untrackedMerger:Lorg/eclipse/jgit/merge/ResolveMerger;
    :catch_2
    move-exception v4

    .line 237
    .local v4, e:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    new-instance v19, Lorg/eclipse/jgit/api/errors/StashApplyFailureException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->stashApplyConflict:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/api/errors/StashApplyFailureException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 241
    .end local v4           #e:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    :cond_8
    new-instance v19, Lorg/eclipse/jgit/api/errors/StashApplyFailureException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->stashApplyConflict:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/api/errors/StashApplyFailureException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 245
    .end local v2           #dc:Lorg/eclipse/jgit/dircache/DirCache;
    .end local v3           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .end local v9           #ok:Z
    .end local v17           #untrackedMerger:Lorg/eclipse/jgit/merge/ResolveMerger;
    :cond_9
    new-instance v19, Lorg/eclipse/jgit/api/errors/StashApplyFailureException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->stashApplyConflict:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/api/errors/StashApplyFailureException;-><init>(Ljava/lang/String;)V

    throw v19
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Lorg/eclipse/jgit/api/errors/JGitInternalException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
.end method

.method public ignoreRepositoryState(Z)Lorg/eclipse/jgit/api/StashApplyCommand;
    .locals 0
    .parameter "ignoreRepositoryState"

    .prologue
    .line 130
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->ignoreRepositoryState:Z

    .line 131
    return-object p0
.end method

.method public setApplyIndex(Z)V
    .locals 0
    .parameter "applyIndex"

    .prologue
    .line 264
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->applyIndex:Z

    .line 265
    return-void
.end method

.method public setApplyUntracked(Z)V
    .locals 0
    .parameter "applyUntracked"

    .prologue
    .line 285
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->applyUntracked:Z

    .line 286
    return-void
.end method

.method public setStashRef(Ljava/lang/String;)Lorg/eclipse/jgit/api/StashApplyCommand;
    .locals 0
    .parameter "stashRef"

    .prologue
    .line 120
    iput-object p1, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->stashRef:Ljava/lang/String;

    .line 121
    return-object p0
.end method

.method public setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/StashApplyCommand;
    .locals 0
    .parameter "strategy"

    .prologue
    .line 275
    iput-object p1, p0, Lorg/eclipse/jgit/api/StashApplyCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 276
    return-object p0
.end method
