.class public Lorg/eclipse/jgit/api/StashCreateCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "StashCreateCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevCommit;",
        ">;"
    }
.end annotation


# static fields
.field private static final MSG_INDEX:Ljava/lang/String; = "index on {0}: {1} {2}"

.field private static final MSG_UNTRACKED:Ljava/lang/String; = "untracked files on {0}: {1} {2}"

.field private static final MSG_WORKING_DIR:Ljava/lang/String; = "WIP on {0}: {1} {2}"


# instance fields
.field private includeUntracked:Z

.field private indexMessage:Ljava/lang/String;

.field private person:Lorg/eclipse/jgit/lib/PersonIdent;

.field private ref:Ljava/lang/String;

.field private workingDirectoryMessage:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 119
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 103
    const-string v0, "index on {0}: {1} {2}"

    iput-object v0, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->indexMessage:Ljava/lang/String;

    .line 105
    const-string v0, "WIP on {0}: {1} {2}"

    iput-object v0, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->workingDirectoryMessage:Ljava/lang/String;

    .line 107
    const-string v0, "refs/stash"

    iput-object v0, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->ref:Ljava/lang/String;

    .line 120
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->person:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 121
    return-void
.end method

.method private createBuilder()Lorg/eclipse/jgit/lib/CommitBuilder;
    .locals 3

    .prologue
    .line 196
    new-instance v1, Lorg/eclipse/jgit/lib/CommitBuilder;

    invoke-direct {v1}, Lorg/eclipse/jgit/lib/CommitBuilder;-><init>()V

    .line 197
    .local v1, builder:Lorg/eclipse/jgit/lib/CommitBuilder;
    iget-object v0, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->person:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 198
    .local v0, author:Lorg/eclipse/jgit/lib/PersonIdent;
    if-nez v0, :cond_0

    .line 199
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    .end local v0           #author:Lorg/eclipse/jgit/lib/PersonIdent;
    iget-object v2, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 200
    .restart local v0       #author:Lorg/eclipse/jgit/lib/PersonIdent;
    :cond_0
    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setAuthor(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 201
    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setCommitter(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 202
    return-object v1
.end method

.method private getHead()Lorg/eclipse/jgit/lib/Ref;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 223
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v3, "HEAD"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 224
    .local v1, head:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v1, :cond_0

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    if-nez v2, :cond_1

    .line 225
    :cond_0
    new-instance v2, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->headRequiredToStash:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    .end local v1           #head:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v0

    .line 228
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->stashFailed:Ljava/lang/String;

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 226
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #head:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    return-object v1
.end method

.method private parseCommit(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 2
    .parameter "reader"
    .parameter "headId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 191
    .local v0, walk:Lorg/eclipse/jgit/revwalk/RevWalk;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRetainBody(Z)V

    .line 192
    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    return-object v1
.end method

.method private updateStashRef(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)V
    .locals 4
    .parameter "commitId"
    .parameter "refLogIdent"
    .parameter "refLogMessage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    iget-object v2, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->ref:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 219
    :goto_0
    return-void

    .line 209
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v3, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->ref:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 210
    .local v0, currentRef:Lorg/eclipse/jgit/lib/Ref;
    iget-object v2, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v3, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->ref:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v1

    .line 211
    .local v1, refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 212
    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 213
    const/4 v2, 0x0

    invoke-virtual {v1, p3, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 214
    if-eqz v0, :cond_1

    .line 215
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 218
    :goto_1
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0

    .line 217
    :cond_1
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

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
    .line 95
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/StashCreateCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 38
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 240
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/StashCreateCommand;->checkCallable()V

    .line 242
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/StashCreateCommand;->getHead()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v15

    .line 243
    .local v15, head:Lorg/eclipse/jgit/lib/Ref;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashCreateCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v34, v0

    invoke-virtual/range {v34 .. v34}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v25

    .line 245
    .local v25, reader:Lorg/eclipse/jgit/lib/ObjectReader;
    :try_start_0
    invoke-interface {v15}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v34

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move-object/from16 v2, v34

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/StashCreateCommand;->parseCommit(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v16

    .line 246
    .local v16, headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashCreateCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v34, v0

    invoke-virtual/range {v34 .. v34}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v5

    .line 247
    .local v5, cache:Lorg/eclipse/jgit/dircache/DirCache;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashCreateCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v34, v0

    invoke-virtual/range {v34 .. v34}, Lorg/eclipse/jgit/lib/Repository;->newObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v23

    .line 250
    .local v23, inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    :try_start_1
    new-instance v26, Lorg/eclipse/jgit/treewalk/TreeWalk;

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 251
    .local v26, treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    const/16 v34, 0x1

    move-object/from16 v0, v26

    move/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 252
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v34

    move-object/from16 v0, v26

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 253
    new-instance v34, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    move-object/from16 v0, v34

    invoke-direct {v0, v5}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 254
    new-instance v34, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashCreateCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v35, v0

    invoke-direct/range {v34 .. v35}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 255
    new-instance v34, Lorg/eclipse/jgit/treewalk/filter/SkipWorkTreeFilter;

    const/16 v35, 0x1

    invoke-direct/range {v34 .. v35}, Lorg/eclipse/jgit/treewalk/filter/SkipWorkTreeFilter;-><init>(I)V

    new-instance v35, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;

    const/16 v36, 0x1

    const/16 v37, 0x2

    invoke-direct/range {v35 .. v37}, Lorg/eclipse/jgit/treewalk/filter/IndexDiffFilter;-><init>(II)V

    invoke-static/range {v34 .. v35}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;->create(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v34

    move-object/from16 v0, v26

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 259
    invoke-virtual/range {v26 .. v26}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v34

    if-nez v34, :cond_0

    .line 260
    const/16 v34, 0x0

    .line 384
    :try_start_2
    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 385
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 396
    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    :goto_0
    return-object v34

    .line 262
    :cond_0
    :try_start_3
    new-instance v19, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct/range {v19 .. v19}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    .line 263
    .local v19, id:Lorg/eclipse/jgit/lib/MutableObjectId;
    new-instance v32, Ljava/util/ArrayList;

    invoke-direct/range {v32 .. v32}, Ljava/util/ArrayList;-><init>()V

    .line 264
    .local v32, wtEdits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;>;"
    new-instance v31, Ljava/util/ArrayList;

    invoke-direct/range {v31 .. v31}, Ljava/util/ArrayList;-><init>()V

    .line 265
    .local v31, wtDeletes:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    new-instance v27, Ljava/util/ArrayList;

    invoke-direct/range {v27 .. v27}, Ljava/util/ArrayList;-><init>()V

    .line 266
    .local v27, untracked:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/dircache/DirCacheEntry;>;"
    const/4 v14, 0x0

    .line 268
    .local v14, hasChanges:Z
    :cond_1
    const/16 v34, 0x0

    const-class v35, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-object/from16 v0, v26

    move/from16 v1, v34

    move-object/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v17

    .line 270
    .local v17, headIter:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    const/16 v34, 0x1

    const-class v35, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    move-object/from16 v0, v26

    move/from16 v1, v34

    move-object/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v22

    check-cast v22, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    .line 272
    .local v22, indexIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    const/16 v34, 0x2

    const-class v35, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    move-object/from16 v0, v26

    move/from16 v1, v34

    move-object/from16 v2, v35

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v33

    check-cast v33, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;

    .line 274
    .local v33, wtIter:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    if-eqz v22, :cond_2

    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->isMerged()Z

    move-result v34

    if-nez v34, :cond_2

    .line 276
    new-instance v34, Lorg/eclipse/jgit/api/errors/UnmergedPathsException;

    new-instance v35, Lorg/eclipse/jgit/errors/UnmergedPathException;

    invoke-virtual/range {v22 .. v22}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v36

    invoke-direct/range {v35 .. v36}, Lorg/eclipse/jgit/errors/UnmergedPathException;-><init>(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    invoke-direct/range {v34 .. v35}, Lorg/eclipse/jgit/api/errors/UnmergedPathsException;-><init>(Ljava/lang/Throwable;)V

    throw v34
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 384
    .end local v14           #hasChanges:Z
    .end local v17           #headIter:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .end local v19           #id:Lorg/eclipse/jgit/lib/MutableObjectId;
    .end local v22           #indexIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .end local v26           #treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .end local v27           #untracked:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/dircache/DirCacheEntry;>;"
    .end local v31           #wtDeletes:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v32           #wtEdits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;>;"
    .end local v33           #wtIter:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    :catchall_0
    move-exception v34

    :try_start_4
    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 385
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    throw v34
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 393
    .end local v5           #cache:Lorg/eclipse/jgit/dircache/DirCache;
    .end local v16           #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v23           #inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    :catch_0
    move-exception v9

    .line 394
    .local v9, e:Ljava/io/IOException;
    :try_start_5
    new-instance v34, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v35

    move-object/from16 v0, v35

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->stashFailed:Ljava/lang/String;

    move-object/from16 v35, v0

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    invoke-direct {v0, v1, v9}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v34
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 396
    .end local v9           #e:Ljava/io/IOException;
    :catchall_1
    move-exception v34

    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v34

    .line 279
    .restart local v5       #cache:Lorg/eclipse/jgit/dircache/DirCache;
    .restart local v14       #hasChanges:Z
    .restart local v16       #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v17       #headIter:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .restart local v19       #id:Lorg/eclipse/jgit/lib/MutableObjectId;
    .restart local v22       #indexIter:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    .restart local v23       #inserter:Lorg/eclipse/jgit/lib/ObjectInserter;
    .restart local v26       #treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    .restart local v27       #untracked:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/dircache/DirCacheEntry;>;"
    .restart local v31       #wtDeletes:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .restart local v32       #wtEdits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;>;"
    .restart local v33       #wtIter:Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;
    :cond_2
    if-eqz v33, :cond_7

    .line 280
    if-nez v22, :cond_4

    if-nez v17, :cond_4

    :try_start_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/StashCreateCommand;->includeUntracked:Z

    move/from16 v34, v0

    if-nez v34, :cond_4

    .line 315
    :cond_3
    :goto_1
    invoke-virtual/range {v26 .. v26}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result v34

    if-nez v34, :cond_1

    .line 317
    if-nez v14, :cond_9

    .line 318
    const/16 v34, 0x0

    .line 384
    :try_start_7
    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 385
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0

    .line 396
    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    goto/16 :goto_0

    .line 283
    :cond_4
    const/4 v14, 0x1

    .line 284
    if-eqz v22, :cond_5

    :try_start_8
    move-object/from16 v0, v33

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v34

    if-nez v34, :cond_3

    .line 286
    :cond_5
    if-eqz v17, :cond_6

    move-object/from16 v0, v33

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->idEqual(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)Z

    move-result v34

    if-nez v34, :cond_3

    .line 288
    :cond_6
    const/16 v34, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;I)V

    .line 289
    new-instance v12, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    invoke-virtual/range {v26 .. v26}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawPath()[B

    move-result-object v34

    move-object/from16 v0, v34

    invoke-direct {v12, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([B)V

    .line 291
    .local v12, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual/range {v33 .. v33}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryLength()J

    move-result-wide v34

    move-wide/from16 v0, v34

    invoke-virtual {v12, v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLength(J)V

    .line 292
    invoke-virtual/range {v33 .. v33}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryLastModified()J

    move-result-wide v34

    move-wide/from16 v0, v34

    invoke-virtual {v12, v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setLastModified(J)V

    .line 293
    invoke-virtual/range {v33 .. v33}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryFileMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v12, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 294
    invoke-virtual/range {v33 .. v33}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->getEntryContentLength()J

    move-result-wide v7

    .line 295
    .local v7, contentLength:J
    invoke-virtual/range {v33 .. v33}, Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;->openEntryStream()Ljava/io/InputStream;
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    move-result-object v20

    .line 297
    .local v20, in:Ljava/io/InputStream;
    const/16 v34, 0x3

    :try_start_9
    move-object/from16 v0, v23

    move/from16 v1, v34

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v7, v8, v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v12, v0}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 300
    :try_start_a
    invoke-virtual/range {v20 .. v20}, Ljava/io/InputStream;->close()V

    .line 303
    if-nez v22, :cond_8

    if-nez v17, :cond_8

    .line 304
    move-object/from16 v0, v27

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 312
    .end local v7           #contentLength:J
    .end local v12           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v20           #in:Ljava/io/InputStream;
    :cond_7
    :goto_2
    const/4 v14, 0x1

    .line 313
    if-nez v33, :cond_3

    if-eqz v17, :cond_3

    .line 314
    invoke-virtual/range {v26 .. v26}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v31

    move-object/from16 v1, v34

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 300
    .restart local v7       #contentLength:J
    .restart local v12       #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .restart local v20       #in:Ljava/io/InputStream;
    :catchall_2
    move-exception v34

    invoke-virtual/range {v20 .. v20}, Ljava/io/InputStream;->close()V

    throw v34

    .line 306
    :cond_8
    new-instance v34, Lorg/eclipse/jgit/api/StashCreateCommand$1;

    move-object/from16 v0, v34

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v12, v12}, Lorg/eclipse/jgit/api/StashCreateCommand$1;-><init>(Lorg/eclipse/jgit/api/StashCreateCommand;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    move-object/from16 v0, v32

    move-object/from16 v1, v34

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 320
    .end local v7           #contentLength:J
    .end local v12           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v20           #in:Ljava/io/InputStream;
    :cond_9
    invoke-interface {v15}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v34

    invoke-interface/range {v34 .. v34}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v34 .. v34}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 324
    .local v3, branch:Ljava/lang/String;
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/StashCreateCommand;->createBuilder()Lorg/eclipse/jgit/lib/CommitBuilder;

    move-result-object v4

    .line 325
    .local v4, builder:Lorg/eclipse/jgit/lib/CommitBuilder;
    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setParentId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 326
    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/dircache/DirCache;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setTreeId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 327
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashCreateCommand;->indexMessage:Ljava/lang/String;

    move-object/from16 v34, v0

    const/16 v35, 0x3

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    const/16 v36, 0x0

    aput-object v3, v35, v36

    const/16 v36, 0x1

    const/16 v37, 0x7

    move-object/from16 v0, v16

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v37

    aput-object v37, v35, v36

    const/16 v36, 0x2

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v37

    aput-object v37, v35, v36

    invoke-static/range {v34 .. v35}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setMessage(Ljava/lang/String;)V

    .line 330
    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(Lorg/eclipse/jgit/lib/CommitBuilder;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v21

    .line 333
    .local v21, indexCommit:Lorg/eclipse/jgit/lib/ObjectId;
    const/16 v29, 0x0

    .line 334
    .local v29, untrackedCommit:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-interface/range {v27 .. v27}, Ljava/util/List;->isEmpty()Z

    move-result v34

    if-nez v34, :cond_b

    .line 335
    invoke-static {}, Lorg/eclipse/jgit/dircache/DirCache;->newInCore()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v30

    .line 336
    .local v30, untrackedDirCache:Lorg/eclipse/jgit/dircache/DirCache;
    invoke-virtual/range {v30 .. v30}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v28

    .line 338
    .local v28, untrackedBuilder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    invoke-interface/range {v27 .. v27}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .local v18, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v34

    if-eqz v34, :cond_a

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 339
    .restart local v12       #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    move-object/from16 v0, v28

    invoke-virtual {v0, v12}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto :goto_3

    .line 340
    .end local v12           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_a
    invoke-virtual/range {v28 .. v28}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->finish()V

    .line 342
    const/16 v34, 0x0

    move/from16 v0, v34

    new-array v0, v0, [Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v34, v0

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setParentIds([Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 343
    move-object/from16 v0, v30

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/dircache/DirCache;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setTreeId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 344
    const-string v34, "untracked files on {0}: {1} {2}"

    const/16 v35, 0x3

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    const/16 v36, 0x0

    aput-object v3, v35, v36

    const/16 v36, 0x1

    const/16 v37, 0x7

    move-object/from16 v0, v16

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v37

    aput-object v37, v35, v36

    const/16 v36, 0x2

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v37

    aput-object v37, v35, v36

    invoke-static/range {v34 .. v35}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setMessage(Ljava/lang/String;)V

    .line 347
    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(Lorg/eclipse/jgit/lib/CommitBuilder;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v29

    .line 351
    .end local v18           #i$:Ljava/util/Iterator;
    .end local v28           #untrackedBuilder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;
    .end local v30           #untrackedDirCache:Lorg/eclipse/jgit/dircache/DirCache;
    :cond_b
    invoke-interface/range {v32 .. v32}, Ljava/util/List;->isEmpty()Z

    move-result v34

    if-eqz v34, :cond_c

    invoke-interface/range {v31 .. v31}, Ljava/util/List;->isEmpty()Z

    move-result v34

    if-nez v34, :cond_f

    .line 352
    :cond_c
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCache;->editor()Lorg/eclipse/jgit/dircache/DirCacheEditor;

    move-result-object v11

    .line 353
    .local v11, editor:Lorg/eclipse/jgit/dircache/DirCacheEditor;
    invoke-interface/range {v32 .. v32}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .restart local v18       #i$:Ljava/util/Iterator;
    :goto_4
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v34

    if-eqz v34, :cond_d

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;

    .line 354
    .local v10, edit:Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;
    invoke-virtual {v11, v10}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->add(Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;)V

    goto :goto_4

    .line 355
    .end local v10           #edit:Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;
    :cond_d
    invoke-interface/range {v31 .. v31}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_5
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v34

    if-eqz v34, :cond_e

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/String;

    .line 356
    .local v24, path:Ljava/lang/String;
    new-instance v34, Lorg/eclipse/jgit/dircache/DirCacheEditor$DeletePath;

    move-object/from16 v0, v34

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/dircache/DirCacheEditor$DeletePath;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v34

    invoke-virtual {v11, v0}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->add(Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;)V

    goto :goto_5

    .line 357
    .end local v24           #path:Ljava/lang/String;
    :cond_e
    invoke-virtual {v11}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->finish()V

    .line 359
    .end local v11           #editor:Lorg/eclipse/jgit/dircache/DirCacheEditor;
    .end local v18           #i$:Ljava/util/Iterator;
    :cond_f
    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setParentId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 360
    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->addParentId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 361
    if-eqz v29, :cond_10

    .line 362
    move-object/from16 v0, v29

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->addParentId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 363
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashCreateCommand;->workingDirectoryMessage:Ljava/lang/String;

    move-object/from16 v34, v0

    const/16 v35, 0x3

    move/from16 v0, v35

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v35, v0

    const/16 v36, 0x0

    aput-object v3, v35, v36

    const/16 v36, 0x1

    const/16 v37, 0x7

    move-object/from16 v0, v16

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v37

    aput-object v37, v35, v36

    const/16 v36, 0x2

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v37

    aput-object v37, v35, v36

    invoke-static/range {v34 .. v35}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setMessage(Ljava/lang/String;)V

    .line 367
    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Lorg/eclipse/jgit/dircache/DirCache;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/lib/CommitBuilder;->setTreeId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 368
    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(Lorg/eclipse/jgit/lib/CommitBuilder;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v6

    .line 369
    .local v6, commitId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V

    .line 371
    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/CommitBuilder;->getAuthor()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v34

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/CommitBuilder;->getMessage()Ljava/lang/String;

    move-result-object v35

    move-object/from16 v0, p0

    move-object/from16 v1, v34

    move-object/from16 v2, v35

    invoke-direct {v0, v6, v1, v2}, Lorg/eclipse/jgit/api/StashCreateCommand;->updateStashRef(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)V

    .line 375
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/StashCreateCommand;->includeUntracked:Z

    move/from16 v34, v0

    if-eqz v34, :cond_11

    .line 376
    invoke-interface/range {v27 .. v27}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .restart local v18       #i$:Ljava/util/Iterator;
    :goto_6
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v34

    if-eqz v34, :cond_11

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    .line 377
    .restart local v12       #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    new-instance v13, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashCreateCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v34, v0

    invoke-virtual/range {v34 .. v34}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v34

    invoke-virtual {v12}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v35

    move-object/from16 v0, v34

    move-object/from16 v1, v35

    invoke-direct {v13, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 379
    .local v13, file:Ljava/io/File;
    invoke-static {v13}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_6

    .line 384
    .end local v12           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    .end local v13           #file:Ljava/io/File;
    .end local v18           #i$:Ljava/util/Iterator;
    :cond_11
    :try_start_b
    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/ObjectInserter;->release()V

    .line 385
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 389
    new-instance v34, Lorg/eclipse/jgit/api/ResetCommand;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/StashCreateCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v35, v0

    invoke-direct/range {v34 .. v35}, Lorg/eclipse/jgit/api/ResetCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    sget-object v35, Lorg/eclipse/jgit/api/ResetCommand$ResetType;->HARD:Lorg/eclipse/jgit/api/ResetCommand$ResetType;

    invoke-virtual/range {v34 .. v35}, Lorg/eclipse/jgit/api/ResetCommand;->setMode(Lorg/eclipse/jgit/api/ResetCommand$ResetType;)Lorg/eclipse/jgit/api/ResetCommand;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Lorg/eclipse/jgit/api/ResetCommand;->call()Lorg/eclipse/jgit/lib/Ref;

    .line 392
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v6}, Lorg/eclipse/jgit/api/StashCreateCommand;->parseCommit(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_0

    move-result-object v34

    .line 396
    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    goto/16 :goto_0
.end method

.method public setIncludeUntracked(Z)Lorg/eclipse/jgit/api/StashCreateCommand;
    .locals 0
    .parameter "includeUntracked"

    .prologue
    .line 184
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->includeUntracked:Z

    .line 185
    return-object p0
.end method

.method public setIndexMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/StashCreateCommand;
    .locals 0
    .parameter "message"

    .prologue
    .line 133
    iput-object p1, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->indexMessage:Ljava/lang/String;

    .line 134
    return-object p0
.end method

.method public setPerson(Lorg/eclipse/jgit/lib/PersonIdent;)Lorg/eclipse/jgit/api/StashCreateCommand;
    .locals 0
    .parameter "person"

    .prologue
    .line 158
    iput-object p1, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->person:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 159
    return-object p0
.end method

.method public setRef(Ljava/lang/String;)Lorg/eclipse/jgit/api/StashCreateCommand;
    .locals 0
    .parameter "ref"

    .prologue
    .line 172
    iput-object p1, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->ref:Ljava/lang/String;

    .line 173
    return-object p0
.end method

.method public setWorkingDirectoryMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/StashCreateCommand;
    .locals 0
    .parameter "message"

    .prologue
    .line 147
    iput-object p1, p0, Lorg/eclipse/jgit/api/StashCreateCommand;->workingDirectoryMessage:Ljava/lang/String;

    .line 148
    return-object p0
.end method
