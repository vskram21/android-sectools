.class public Lorg/eclipse/jgit/api/CommitCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "CommitCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/CommitCommand$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevCommit;",
        ">;"
    }
.end annotation


# instance fields
.field private all:Z

.field private amend:Z

.field private author:Lorg/eclipse/jgit/lib/PersonIdent;

.field private committer:Lorg/eclipse/jgit/lib/PersonIdent;

.field private insertChangeId:Z

.field private message:Ljava/lang/String;

.field private only:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private onlyProcessed:[Z

.field private parents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private reflogComment:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 126
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 106
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/CommitCommand;->only:Ljava/util/List;

    .line 118
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    .line 127
    return-void
.end method

.method private createTemporaryIndex(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/dircache/DirCache;
    .locals 32
    .parameter "headId"
    .parameter "index"
    .parameter "rw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 304
    const/16 v19, 0x0

    .line 307
    .local v19, inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v11

    .line 311
    .local v11, existingBuilder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    invoke-static {}, Lorg/eclipse/jgit/dircache/DirCache;->newInCore()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v17

    .line 312
    .local v17, inCoreIndex:Lorg/eclipse/jgit/dircache/DirCache;
    invoke-virtual/range {v17 .. v17}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v24

    .line 314
    .local v24, tempBuilder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->only:Ljava/util/List;

    move-object/from16 v27, v0

    invoke-interface/range {v27 .. v27}, Ljava/util/List;->size()I

    move-result v27

    move/from16 v0, v27

    new-array v0, v0, [Z

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/CommitCommand;->onlyProcessed:[Z

    .line 315
    const/4 v8, 0x1

    .line 317
    .local v8, emptyCommit:Z
    new-instance v26, Lorg/eclipse/jgit/treewalk/TreeWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v27, v0

    invoke-direct/range {v26 .. v27}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 318
    .local v26, treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    new-instance v27, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;

    move-object/from16 v0, v27

    invoke-direct {v0, v11}, Lorg/eclipse/jgit/dircache/DirCacheBuildIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCacheBuilder;)V

    invoke-virtual/range {v26 .. v27}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    move-result v6

    .line 319
    .local v6, dcIdx:I
    new-instance v27, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v28, v0

    invoke-direct/range {v27 .. v28}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual/range {v26 .. v27}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    move-result v12

    .line 320
    .local v12, fIdx:I
    const/4 v14, -0x1

    .line 321
    .local v14, hIdx:I
    if-eqz p1, :cond_0

    .line 322
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseTree(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v27

    invoke-virtual/range {v26 .. v27}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v14

    .line 323
    :cond_0
    const/16 v27, 0x1

    invoke-virtual/range {v26 .. v27}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 325
    const/16 v20, 0x0

    .line 326
    .local v20, lastAddedFile:Ljava/lang/String;
    :cond_1
    :goto_0
    invoke-virtual/range {v26 .. v26}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v27

    if-eqz v27, :cond_4

    .line 327
    invoke-virtual/range {v26 .. v26}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v22

    .line 329
    .local v22, path:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/CommitCommand;->lookupOnly(Ljava/lang/String;)I

    move-result v23

    .line 331
    .local v23, pos:I
    const/4 v15, 0x0

    .line 332
    .local v15, hTree:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    const/16 v27, -0x1

    move/from16 v0, v27

    if-eq v14, v0, :cond_2

    .line 333
    const-class v27, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v0, v14, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v15

    .end local v15           #hTree:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    check-cast v15, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;

    .line 335
    .restart local v15       #hTree:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    :cond_2
    const-class v27, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v0, v6, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v7

    check-cast v7, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 338
    .local v7, dcTree:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    if-ltz v23, :cond_10

    .line 341
    const-class v27, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v0, v12, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v13

    check-cast v13, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    .line 345
    .local v13, fTree:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    if-nez v7, :cond_3

    if-eqz v15, :cond_5

    :cond_3
    const/16 v25, 0x1

    .line 346
    .local v25, tracked:Z
    :goto_1
    if-nez v25, :cond_6

    .line 430
    .end local v7           #dcTree:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v13           #fTree:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    .end local v15           #hTree:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .end local v22           #path:Ljava/lang/String;
    .end local v23           #pos:I
    .end local v25           #tracked:Z
    :cond_4
    const/16 v16, 0x0

    .local v16, i:I
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->onlyProcessed:[Z

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v27, v0

    move/from16 v0, v16

    move/from16 v1, v27

    if-ge v0, v1, :cond_13

    .line 431
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->onlyProcessed:[Z

    move-object/from16 v27, v0

    aget-boolean v27, v27, v16

    if-nez v27, :cond_12

    .line 432
    new-instance v27, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v28

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->entryNotFoundByPath:Ljava/lang/String;

    move-object/from16 v28, v0

    const/16 v29, 0x1

    move/from16 v0, v29

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->only:Ljava/util/List;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    move/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v31

    aput-object v31, v29, v30

    invoke-static/range {v28 .. v29}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v28

    invoke-direct/range {v27 .. v28}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 345
    .end local v16           #i:I
    .restart local v7       #dcTree:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .restart local v13       #fTree:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    .restart local v15       #hTree:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .restart local v22       #path:Ljava/lang/String;
    .restart local v23       #pos:I
    :cond_5
    const/16 v25, 0x0

    goto :goto_1

    .line 351
    .restart local v25       #tracked:Z
    :cond_6
    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_1

    .line 354
    move-object/from16 v20, v22

    .line 356
    if-eqz v13, :cond_f

    .line 358
    new-instance v5, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-object/from16 v0, v22

    invoke-direct {v5, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;)V

    .line 359
    .local v5, dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v13}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->getEntryLength()J

    move-result-wide v9

    .line 360
    .local v9, entryLength:J
    invoke-virtual {v5, v9, v10}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(J)V

    .line 361
    invoke-virtual {v13}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->getEntryLastModified()J

    move-result-wide v27

    move-wide/from16 v0, v27

    invoke-virtual {v5, v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V

    .line 362
    invoke-virtual {v13, v7}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->getIndexFileMode(Lorg/eclipse/jgit/dircache/DirCacheIterator;)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 364
    if-eqz v7, :cond_7

    invoke-virtual {v13, v7}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v27

    if-nez v27, :cond_8

    :cond_7
    if-eqz v15, :cond_b

    invoke-virtual {v13, v15}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v27

    if-eqz v27, :cond_b

    :cond_8
    const/16 v21, 0x1

    .line 367
    .local v21, objectExists:Z
    :goto_3
    if-eqz v21, :cond_c

    .line 368
    invoke-virtual {v13}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 389
    :goto_4
    invoke-virtual {v11, v5}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 391
    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 393
    if-eqz v8, :cond_a

    if-eqz v15, :cond_9

    invoke-virtual {v15, v13}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v27

    if-eqz v27, :cond_9

    invoke-virtual {v15}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryRawMode()I

    move-result v27

    invoke-virtual {v13}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->getEntryRawMode()I

    move-result v28

    move/from16 v0, v27

    move/from16 v1, v28

    if-eq v0, v1, :cond_a

    .line 398
    :cond_9
    const/4 v8, 0x0

    .line 409
    .end local v5           #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v9           #entryLength:J
    .end local v21           #objectExists:Z
    :cond_a
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->onlyProcessed:[Z

    move-object/from16 v27, v0

    const/16 v28, 0x1

    aput-boolean v28, v27, v23

    goto/16 :goto_0

    .line 364
    .restart local v5       #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .restart local v9       #entryLength:J
    :cond_b
    const/16 v21, 0x0

    goto :goto_3

    .line 370
    .restart local v21       #objectExists:Z
    :cond_c
    sget-object v27, Lorg/eclipse/jgit/lib/FileMode;->GITLINK:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_d

    .line 371
    invoke-virtual {v13}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    goto :goto_4

    .line 374
    :cond_d
    if-nez v19, :cond_e

    .line 375
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v19

    .line 376
    :cond_e
    invoke-virtual {v13}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->getEntryContentLength()J

    move-result-wide v3

    .line 377
    .local v3, contentLength:J
    invoke-virtual {v13}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;->openEntryStream()Ljava/io/InputStream;

    move-result-object v18

    .line 379
    .local v18, inputStream:Ljava/io/InputStream;
    const/16 v27, 0x3

    :try_start_0
    move-object/from16 v0, v19

    move/from16 v1, v27

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v3, v4, v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 383
    invoke-virtual/range {v18 .. v18}, Ljava/io/InputStream;->close()V

    goto :goto_4

    :catchall_0
    move-exception v27

    invoke-virtual/range {v18 .. v18}, Ljava/io/InputStream;->close()V

    throw v27

    .line 403
    .end local v3           #contentLength:J
    .end local v5           #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v9           #entryLength:J
    .end local v18           #inputStream:Ljava/io/InputStream;
    .end local v21           #objectExists:Z
    :cond_f
    if-eqz v8, :cond_a

    if-eqz v15, :cond_a

    .line 405
    const/4 v8, 0x0

    goto :goto_5

    .line 412
    .end local v13           #fTree:Lorg/eclipse/jgit/treewalk/FileTreeIterator;
    .end local v25           #tracked:Z
    :cond_10
    if-eqz v15, :cond_11

    .line 414
    new-instance v5, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-object/from16 v0, v22

    invoke-direct {v5, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>(Ljava/lang/String;)V

    .line 415
    .restart local v5       #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v15}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 416
    invoke-virtual {v15}, Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 419
    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    .line 423
    .end local v5           #dcEntry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_11
    if-eqz v7, :cond_1

    .line 424
    invoke-virtual {v7}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto/16 :goto_0

    .line 430
    .end local v7           #dcTree:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v15           #hTree:Lorg/eclipse/jgit/treewalk/CanonicalTreeParser;
    .end local v22           #path:Ljava/lang/String;
    .end local v23           #pos:I
    .restart local v16       #i:I
    :cond_12
    add-int/lit8 v16, v16, 0x1

    goto/16 :goto_2

    .line 436
    :cond_13
    if-eqz v8, :cond_14

    .line 437
    new-instance v27, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v28

    move-object/from16 v0, v28

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->emptyCommit:Ljava/lang/String;

    move-object/from16 v28, v0

    invoke-direct/range {v27 .. v28}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 440
    :cond_14
    invoke-virtual {v11}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->commit()Z

    .line 442
    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->finish()V

    .line 443
    return-object v17
.end method

.method private insertChangeId(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 6
    .parameter "treeId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    const/4 v1, 0x0

    .line 290
    .local v1, firstParentId:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v2, p0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 291
    iget-object v2, p0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #firstParentId:Lorg/eclipse/jgit/lib/ObjectId;
    check-cast v1, Lorg/eclipse/jgit/lib/ObjectId;

    .line 292
    .restart local v1       #firstParentId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/api/CommitCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->committer:Lorg/eclipse/jgit/lib/PersonIdent;

    iget-object v4, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    invoke-static {p1, v1, v2, v3, v4}, Lorg/eclipse/jgit/util/ChangeIdUtil;->computeChangeId(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .line 294
    .local v0, changeId:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v2, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    invoke-static {v2, v0}, Lorg/eclipse/jgit/util/ChangeIdUtil;->insertId(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    .line 295
    if-eqz v0, :cond_1

    .line 296
    iget-object v2, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\nChange-Id: I"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectId;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\nChange-Id: I"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectId;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    .line 299
    :cond_1
    return-void
.end method

.method private lookupOnly(Ljava/lang/String;)I
    .locals 4
    .parameter "pathString"

    .prologue
    .line 459
    move-object v1, p1

    .line 461
    .local v1, p:Ljava/lang/String;
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->only:Ljava/util/List;

    invoke-static {v3, v1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v2

    .line 462
    .local v2, position:I
    if-ltz v2, :cond_0

    .line 469
    .end local v2           #position:I
    :goto_1
    return v2

    .line 464
    .restart local v2       #position:I
    :cond_0
    const-string v3, "/"

    invoke-virtual {v1, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 465
    .local v0, l:I
    const/4 v3, 0x1

    if-ge v0, v3, :cond_1

    .line 469
    const/4 v2, -0x1

    goto :goto_1

    .line 467
    :cond_1
    const/4 v3, 0x0

    invoke-virtual {v1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 468
    goto :goto_0
.end method

.method private processOptions(Lorg/eclipse/jgit/lib/RepositoryState;Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 9
    .parameter "state"
    .parameter "rw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/NoMessageException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 486
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->committer:Lorg/eclipse/jgit/lib/PersonIdent;

    if-nez v3, :cond_0

    .line 487
    new-instance v3, Lorg/eclipse/jgit/lib/PersonIdent;

    iget-object v4, p0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->committer:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 488
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->amend:Z

    if-nez v3, :cond_1

    .line 489
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->committer:Lorg/eclipse/jgit/lib/PersonIdent;

    iput-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 492
    :cond_1
    sget-object v3, Lorg/eclipse/jgit/lib/RepositoryState;->MERGING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    if-ne p1, v3, :cond_5

    .line 494
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->readMergeHeads()Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    .line 495
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    if-eqz v3, :cond_3

    .line 496
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_3

    .line 497
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/AnyObjectId;

    invoke-virtual {p2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v2

    .line 498
    .local v2, ro:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v3, v2, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v3, :cond_2

    .line 499
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    invoke-virtual {p2, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->peel(Lorg/eclipse/jgit/revwalk/RevObject;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    invoke-interface {v3, v1, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 496
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 501
    .end local v1           #i:I
    .end local v2           #ro:Lorg/eclipse/jgit/revwalk/RevObject;
    :catch_0
    move-exception v0

    .line 502
    .local v0, e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->exceptionOccurredDuringReadingOfGIT_DIR:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "MERGE_HEAD"

    aput-object v6, v5, v7

    aput-object v0, v5, v8

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 506
    .end local v0           #e:Ljava/io/IOException;
    :cond_3
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 508
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->readMergeCommitMsg()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 527
    :cond_4
    :goto_1
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    if-nez v3, :cond_6

    .line 530
    new-instance v3, Lorg/eclipse/jgit/api/errors/NoMessageException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->commitMessageNotSpecified:Ljava/lang/String;

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/api/errors/NoMessageException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 509
    :catch_1
    move-exception v0

    .line 510
    .restart local v0       #e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->exceptionOccurredDuringReadingOfGIT_DIR:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "MERGE_MSG"

    aput-object v6, v5, v7

    aput-object v0, v5, v8

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 515
    .end local v0           #e:Ljava/io/IOException;
    :cond_5
    sget-object v3, Lorg/eclipse/jgit/lib/RepositoryState;->SAFE:Lorg/eclipse/jgit/lib/RepositoryState;

    if-ne p1, v3, :cond_4

    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 517
    :try_start_2
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->readSquashCommitMsg()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    .line 518
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    if-eqz v3, :cond_4

    .line 519
    iget-object v3, p0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/Repository;->writeSquashCommitMsg(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    .line 520
    :catch_2
    move-exception v0

    .line 521
    .restart local v0       #e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->exceptionOccurredDuringReadingOfGIT_DIR:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "MERGE_MSG"

    aput-object v6, v5, v7

    aput-object v0, v5, v8

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 531
    .end local v0           #e:Ljava/io/IOException;
    :cond_6
    return-void
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
    .line 97
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CommitCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;,
            Lorg/eclipse/jgit/api/errors/NoMessageException;,
            Lorg/eclipse/jgit/api/errors/UnmergedPathsException;,
            Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;,
            Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/CommitCommand;->checkCallable()V

    .line 153
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->only:Ljava/util/List;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 155
    new-instance v22, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 158
    .local v22, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/lib/Repository;->getRepositoryState()Lorg/eclipse/jgit/lib/RepositoryState;

    move-result-object v23

    .line 159
    .local v23, state:Lorg/eclipse/jgit/lib/RepositoryState;
    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/RepositoryState;->canCommit()Z

    move-result v24

    if-nez v24, :cond_0

    .line 160
    new-instance v24, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->cannotCommitOnARepoWithState:Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/RepositoryState;->name()Ljava/lang/String;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-static/range {v25 .. v26}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;-><init>(Ljava/lang/String;)V

    throw v24
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/eclipse/jgit/errors/UnmergedPathException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 278
    .end local v23           #state:Lorg/eclipse/jgit/lib/RepositoryState;
    :catch_0
    move-exception v7

    .line 279
    .local v7, e:Lorg/eclipse/jgit/errors/UnmergedPathException;
    :try_start_1
    new-instance v24, Lorg/eclipse/jgit/api/errors/UnmergedPathsException;

    move-object/from16 v0, v24

    invoke-direct {v0, v7}, Lorg/eclipse/jgit/api/errors/UnmergedPathsException;-><init>(Ljava/lang/Throwable;)V

    throw v24
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 284
    .end local v7           #e:Lorg/eclipse/jgit/errors/UnmergedPathException;
    :catchall_0
    move-exception v24

    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/revwalk/RevWalk;->dispose()V

    throw v24

    .line 163
    .restart local v23       #state:Lorg/eclipse/jgit/lib/RepositoryState;
    :cond_0
    :try_start_2
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/CommitCommand;->processOptions(Lorg/eclipse/jgit/lib/RepositoryState;Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 165
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->all:Z

    move/from16 v24, v0

    if-eqz v24, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v24

    if-nez v24, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v24

    if-eqz v24, :cond_1

    .line 166
    new-instance v8, Lorg/eclipse/jgit/api/Git;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-direct {v8, v0}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Lorg/eclipse/jgit/errors/UnmergedPathException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 168
    .local v8, git:Lorg/eclipse/jgit/api/Git;
    :try_start_3
    invoke-virtual {v8}, Lorg/eclipse/jgit/api/Git;->add()Lorg/eclipse/jgit/api/AddCommand;

    move-result-object v24

    const-string v25, "."

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/api/AddCommand;->addFilepattern(Ljava/lang/String;)Lorg/eclipse/jgit/api/AddCommand;

    move-result-object v24

    const/16 v25, 0x1

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/api/AddCommand;->setUpdate(Z)Lorg/eclipse/jgit/api/AddCommand;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/api/AddCommand;->call()Lorg/eclipse/jgit/dircache/DirCache;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Lorg/eclipse/jgit/api/errors/NoFilepatternException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Lorg/eclipse/jgit/errors/UnmergedPathException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 177
    .end local v8           #git:Lorg/eclipse/jgit/api/Git;
    :cond_1
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const-string v25, "HEAD"

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v9

    .line 178
    .local v9, head:Lorg/eclipse/jgit/lib/Ref;
    if-nez v9, :cond_2

    .line 179
    new-instance v24, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->commitOnRepoWithoutHEADCurrentlyNotSupported:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-direct/range {v24 .. v25}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v24
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Lorg/eclipse/jgit/errors/UnmergedPathException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 280
    .end local v9           #head:Lorg/eclipse/jgit/lib/Ref;
    .end local v23           #state:Lorg/eclipse/jgit/lib/RepositoryState;
    :catch_1
    move-exception v7

    .line 281
    .local v7, e:Ljava/io/IOException;
    :try_start_5
    new-instance v24, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfCommitCommand:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v24
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 171
    .end local v7           #e:Ljava/io/IOException;
    .restart local v8       #git:Lorg/eclipse/jgit/api/Git;
    .restart local v23       #state:Lorg/eclipse/jgit/lib/RepositoryState;
    :catch_2
    move-exception v7

    .line 173
    .local v7, e:Lorg/eclipse/jgit/api/errors/NoFilepatternException;
    :try_start_6
    new-instance v24, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v7}, Lorg/eclipse/jgit/api/errors/NoFilepatternException;->getMessage()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v24

    .line 183
    .end local v7           #e:Lorg/eclipse/jgit/api/errors/NoFilepatternException;
    .end local v8           #git:Lorg/eclipse/jgit/api/Git;
    .restart local v9       #head:Lorg/eclipse/jgit/lib/Ref;
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const-string v25, "HEAD^{commit}"

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    .line 184
    .local v10, headId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v10, :cond_3

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->amend:Z

    move/from16 v24, v0

    if-eqz v24, :cond_3

    .line 185
    new-instance v24, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->commitAmendOnInitialNotPossible:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-direct/range {v24 .. v25}, Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 188
    :cond_3
    if-eqz v10, :cond_5

    .line 189
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->amend:Z

    move/from16 v24, v0

    if-eqz v24, :cond_8

    .line 190
    move-object/from16 v0, v22

    invoke-virtual {v0, v10}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v18

    .line 191
    .local v18, previousCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParents()[Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    .local v4, arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    array-length v14, v4

    .local v14, len$:I
    const/4 v11, 0x0

    .local v11, i$:I
    :goto_0
    if-ge v11, v14, :cond_4

    aget-object v16, v4, v11

    .line 192
    .local v16, p:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    move-object/from16 v24, v0

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v25

    invoke-interface/range {v24 .. v25}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 193
    .end local v16           #p:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    move-object/from16 v24, v0

    if-nez v24, :cond_5

    .line 194
    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/revwalk/RevCommit;->getAuthorIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/CommitCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 200
    .end local v4           #arr$:[Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v11           #i$:I
    .end local v14           #len$:I
    .end local v18           #previousCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_5
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Lorg/eclipse/jgit/errors/UnmergedPathException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    move-result-object v12

    .line 202
    .local v12, index:Lorg/eclipse/jgit/dircache/DirCache;
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->only:Ljava/util/List;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->isEmpty()Z

    move-result v24

    if-nez v24, :cond_6

    .line 203
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v10, v12, v1}, Lorg/eclipse/jgit/api/CommitCommand;->createTemporaryIndex(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v12

    .line 205
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    move-result-object v15

    .line 210
    .local v15, odi:Lorg/eclipse/jgit/lib/ObjectInserter;
    :try_start_8
    invoke-virtual {v12, v15}, Lorg/eclipse/jgit/dircache/DirCache;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v13

    .line 212
    .local v13, indexTreeId:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->insertChangeId:Z

    move/from16 v24, v0

    if-eqz v24, :cond_7

    .line 213
    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/eclipse/jgit/api/CommitCommand;->insertChangeId(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 216
    :cond_7
    new-instance v5, Lorg/eclipse/jgit/lib/CommitBuilder;

    invoke-direct {v5}, Lorg/eclipse/jgit/lib/CommitBuilder;-><init>()V

    .line 217
    .local v5, commit:Lorg/eclipse/jgit/lib/CommitBuilder;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->committer:Lorg/eclipse/jgit/lib/PersonIdent;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setCommitter(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setAuthor(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 219
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setMessage(Ljava/lang/String;)V

    .line 221
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setParentIds(Ljava/util/List;)V

    .line 222
    invoke-virtual {v5, v13}, Lorg/eclipse/jgit/lib/CommitBuilder;->setTreeId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 223
    invoke-virtual {v15, v5}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(Lorg/eclipse/jgit/lib/CommitBuilder;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    .line 224
    .local v6, commitId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {v15}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 226
    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v20

    .line 227
    .local v20, revCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const-string v25, "HEAD"

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v21

    .line 228
    .local v21, ru:Lorg/eclipse/jgit/lib/RefUpdate;
    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->reflogComment:Ljava/lang/String;

    move-object/from16 v24, v0

    if-eqz v24, :cond_9

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->reflogComment:Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 238
    :goto_2
    if-eqz v10, :cond_c

    .line 239
    move-object/from16 v0, v21

    invoke-virtual {v0, v10}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 242
    :goto_3
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/lib/RefUpdate;->forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v19

    .line 243
    .local v19, rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    sget-object v24, Lorg/eclipse/jgit/api/CommitCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v25

    aget v24, v24, v25

    packed-switch v24, :pswitch_data_0

    .line 268
    new-instance v24, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->updatingRefFailed:Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v26, 0x3

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const-string v28, "HEAD"

    aput-object v28, v26, v27

    const/16 v27, 0x1

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/ObjectId;->toString()Ljava/lang/String;

    move-result-object v28

    aput-object v28, v26, v27

    const/16 v27, 0x2

    aput-object v19, v26, v27

    invoke-static/range {v25 .. v26}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v24
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 273
    .end local v5           #commit:Lorg/eclipse/jgit/lib/CommitBuilder;
    .end local v6           #commitId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v13           #indexTreeId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v19           #rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .end local v20           #revCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v21           #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    :catchall_1
    move-exception v24

    :try_start_9
    invoke-virtual {v15}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    throw v24
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 276
    .end local v15           #odi:Lorg/eclipse/jgit/lib/ObjectInserter;
    :catchall_2
    move-exception v24

    :try_start_a
    invoke-virtual {v12}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    throw v24

    .line 196
    .end local v12           #index:Lorg/eclipse/jgit/dircache/DirCache;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, v24

    move/from16 v1, v25

    invoke-interface {v0, v1, v10}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
    .catch Lorg/eclipse/jgit/errors/UnmergedPathException; {:try_start_a .. :try_end_a} :catch_0
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1

    goto/16 :goto_1

    .line 232
    .restart local v5       #commit:Lorg/eclipse/jgit/lib/CommitBuilder;
    .restart local v6       #commitId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v12       #index:Lorg/eclipse/jgit/dircache/DirCache;
    .restart local v13       #indexTreeId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v15       #odi:Lorg/eclipse/jgit/lib/ObjectInserter;
    .restart local v20       #revCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v21       #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    :cond_9
    :try_start_b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->amend:Z

    move/from16 v24, v0

    if-eqz v24, :cond_a

    const-string v17, "commit (amend): "

    .line 235
    .local v17, prefix:Ljava/lang/String;
    :goto_4
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    goto/16 :goto_2

    .line 232
    .end local v17           #prefix:Ljava/lang/String;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->parents:Ljava/util/List;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v24

    if-nez v24, :cond_b

    const-string v17, "commit (initial): "

    goto :goto_4

    :cond_b
    const-string v17, "commit: "

    goto :goto_4

    .line 241
    :cond_c
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v24

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    goto/16 :goto_3

    .line 247
    .restart local v19       #rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :pswitch_0
    const/16 v24, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/CommitCommand;->setCallable(Z)V

    .line 248
    sget-object v24, Lorg/eclipse/jgit/lib/RepositoryState;->MERGING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    if-ne v0, v1, :cond_e

    .line 251
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->writeMergeCommitMsg(Ljava/lang/String;)V

    .line 252
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->writeMergeHeads(Ljava/util/List;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 273
    :cond_d
    :goto_5
    :try_start_c
    invoke-virtual {v15}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 276
    :try_start_d
    invoke-virtual {v12}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0
    .catch Lorg/eclipse/jgit/errors/UnmergedPathException; {:try_start_d .. :try_end_d} :catch_0
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_1

    .line 284
    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/revwalk/RevWalk;->dispose()V

    return-object v20

    .line 253
    :cond_e
    :try_start_e
    sget-object v24, Lorg/eclipse/jgit/lib/RepositoryState;->CHERRY_PICKING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    if-ne v0, v1, :cond_f

    .line 254
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->writeMergeCommitMsg(Ljava/lang/String;)V

    .line 255
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->writeCherryPickHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_5

    .line 256
    :cond_f
    sget-object v24, Lorg/eclipse/jgit/lib/RepositoryState;->REVERTING_RESOLVED:Lorg/eclipse/jgit/lib/RepositoryState;

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    if-ne v0, v1, :cond_d

    .line 257
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->writeMergeCommitMsg(Ljava/lang/String;)V

    .line 258
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CommitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->writeRevertHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_5

    .line 264
    :pswitch_1
    new-instance v24, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->couldNotLockHEAD:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/lib/RefUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v26

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/RefUpdate$Result;)V

    throw v24
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 243
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public getAuthor()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 632
    iget-object v0, p0, Lorg/eclipse/jgit/api/CommitCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    return-object v0
.end method

.method public getCommitter()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 590
    iget-object v0, p0, Lorg/eclipse/jgit/api/CommitCommand;->committer:Lorg/eclipse/jgit/lib/PersonIdent;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 548
    iget-object v0, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    return-object v0
.end method

.method public setAll(Z)Lorg/eclipse/jgit/api/CommitCommand;
    .locals 5
    .parameter "all"

    .prologue
    .line 646
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CommitCommand;->checkCallable()V

    .line 647
    iget-object v0, p0, Lorg/eclipse/jgit/api/CommitCommand;->only:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 648
    new-instance v0, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->illegalCombinationOfArguments:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "--all"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "--only"

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 651
    :cond_0
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CommitCommand;->all:Z

    .line 652
    return-object p0
.end method

.method public setAmend(Z)Lorg/eclipse/jgit/api/CommitCommand;
    .locals 0
    .parameter "amend"

    .prologue
    .line 664
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CommitCommand;->checkCallable()V

    .line 665
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CommitCommand;->amend:Z

    .line 666
    return-object p0
.end method

.method public setAuthor(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;
    .locals 1
    .parameter "name"
    .parameter "email"

    .prologue
    .line 621
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CommitCommand;->checkCallable()V

    .line 622
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/CommitCommand;->setAuthor(Lorg/eclipse/jgit/lib/PersonIdent;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v0

    return-object v0
.end method

.method public setAuthor(Lorg/eclipse/jgit/lib/PersonIdent;)Lorg/eclipse/jgit/api/CommitCommand;
    .locals 0
    .parameter "author"

    .prologue
    .line 604
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CommitCommand;->checkCallable()V

    .line 605
    iput-object p1, p0, Lorg/eclipse/jgit/api/CommitCommand;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 606
    return-object p0
.end method

.method public setCommitter(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;
    .locals 1
    .parameter "name"
    .parameter "email"

    .prologue
    .line 579
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CommitCommand;->checkCallable()V

    .line 580
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/CommitCommand;->setCommitter(Lorg/eclipse/jgit/lib/PersonIdent;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v0

    return-object v0
.end method

.method public setCommitter(Lorg/eclipse/jgit/lib/PersonIdent;)Lorg/eclipse/jgit/api/CommitCommand;
    .locals 0
    .parameter "committer"

    .prologue
    .line 562
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CommitCommand;->checkCallable()V

    .line 563
    iput-object p1, p0, Lorg/eclipse/jgit/api/CommitCommand;->committer:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 564
    return-object p0
.end method

.method public setInsertChangeId(Z)Lorg/eclipse/jgit/api/CommitCommand;
    .locals 0
    .parameter "insertChangeId"

    .prologue
    .line 705
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CommitCommand;->checkCallable()V

    .line 706
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CommitCommand;->insertChangeId:Z

    .line 707
    return-object p0
.end method

.method public setMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;
    .locals 0
    .parameter "message"

    .prologue
    .line 539
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CommitCommand;->checkCallable()V

    .line 540
    iput-object p1, p0, Lorg/eclipse/jgit/api/CommitCommand;->message:Ljava/lang/String;

    .line 541
    return-object p0
.end method

.method public setOnly(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;
    .locals 6
    .parameter "only"

    .prologue
    const/4 v5, 0x0

    .line 681
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CommitCommand;->checkCallable()V

    .line 682
    iget-boolean v1, p0, Lorg/eclipse/jgit/api/CommitCommand;->all:Z

    if-eqz v1, :cond_0

    .line 683
    new-instance v1, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->illegalCombinationOfArguments:Ljava/lang/String;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "--only"

    aput-object v4, v3, v5

    const/4 v4, 0x1

    const-string v5, "--all"

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 686
    :cond_0
    const-string v1, "/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 689
    .local v0, o:Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/api/CommitCommand;->only:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 690
    iget-object v1, p0, Lorg/eclipse/jgit/api/CommitCommand;->only:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 691
    :cond_1
    return-object p0

    .end local v0           #o:Ljava/lang/String;
    :cond_2
    move-object v0, p1

    .line 686
    goto :goto_0
.end method

.method public setReflogComment(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;
    .locals 0
    .parameter "reflogComment"

    .prologue
    .line 717
    iput-object p1, p0, Lorg/eclipse/jgit/api/CommitCommand;->reflogComment:Ljava/lang/String;

    .line 718
    return-object p0
.end method
