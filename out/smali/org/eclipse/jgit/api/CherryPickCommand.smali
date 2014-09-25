.class public Lorg/eclipse/jgit/api/CherryPickCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "CherryPickCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/api/CherryPickResult;",
        ">;"
    }
.end annotation


# instance fields
.field private commits:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private mainlineParentNumber:Ljava/lang/Integer;

.field private ourCommitName:Ljava/lang/String;

.field private reflogPrefix:Ljava/lang/String;

.field private strategy:Lorg/eclipse/jgit/merge/MergeStrategy;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 100
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 86
    const-string v0, "cherry-pick:"

    iput-object v0, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->reflogPrefix:Ljava/lang/String;

    .line 88
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->commits:Ljava/util/List;

    .line 90
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->ourCommitName:Ljava/lang/String;

    .line 92
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->RECURSIVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    iput-object v0, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 101
    return-void
.end method

.method private calculateOurName(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;
    .locals 3
    .parameter "headRef"

    .prologue
    .line 307
    iget-object v2, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->ourCommitName:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 308
    iget-object v0, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->ourCommitName:Ljava/lang/String;

    .line 312
    :goto_0
    return-object v0

    .line 310
    :cond_0
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    .line 311
    .local v1, targetRefName:Ljava/lang/String;
    invoke-static {v1}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 312
    .local v0, headName:Ljava/lang/String;
    goto :goto_0
.end method

.method private getParentCommit(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 7
    .parameter "srcCommit"
    .parameter "revWalk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/MultipleParentsNotAllowedException;,
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 202
    iget-object v1, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->mainlineParentNumber:Ljava/lang/Integer;

    if-nez v1, :cond_1

    .line 203
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v1

    if-eq v1, v6, :cond_0

    .line 204
    new-instance v1, Lorg/eclipse/jgit/api/errors/MultipleParentsNotAllowedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->canOnlyCherryPickCommitsWithOneParent:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/api/errors/MultipleParentsNotAllowedException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 209
    :cond_0
    invoke-virtual {p1, v5}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 219
    .local v0, srcParent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_0
    invoke-virtual {p2, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 220
    return-object v0

    .line 211
    .end local v0           #srcParent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->mainlineParentNumber:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v2

    if-le v1, v2, :cond_2

    .line 212
    new-instance v1, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->commitDoesNotHaveGivenParent:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v5

    iget-object v4, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->mainlineParentNumber:Ljava/lang/Integer;

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 215
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->mainlineParentNumber:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .restart local v0       #srcParent:Lorg/eclipse/jgit/revwalk/RevCommit;
    goto :goto_0
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
    .line 85
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CherryPickCommand;->call()Lorg/eclipse/jgit/api/CherryPickResult;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/api/CherryPickResult;
    .locals 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/NoMessageException;,
            Lorg/eclipse/jgit/api/errors/UnmergedPathsException;,
            Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;,
            Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;
        }
    .end annotation

    .prologue
    .line 120
    const/4 v12, 0x0

    .line 121
    .local v12, newHead:Lorg/eclipse/jgit/revwalk/RevCommit;
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    .line 122
    .local v5, cherryPickedRefs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/CherryPickCommand;->checkCallable()V

    .line 124
    new-instance v14, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CherryPickCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-direct {v14, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 128
    .local v14, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CherryPickCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    const-string v20, "HEAD"

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v8

    .line 129
    .local v8, headRef:Lorg/eclipse/jgit/lib/Ref;
    if-nez v8, :cond_0

    .line 130
    new-instance v19, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->commitOnRepoWithoutHEADCurrentlyNotSupported:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v19
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 187
    .end local v8           #headRef:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v7

    .line 188
    .local v7, e:Ljava/io/IOException;
    :try_start_1
    new-instance v19, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v20

    move-object/from16 v0, v20

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfCherryPickCommand:Ljava/lang/String;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput-object v7, v21, v22

    invoke-static/range {v20 .. v21}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v19
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 193
    .end local v7           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v19

    invoke-virtual {v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v19

    .line 133
    .restart local v8       #headRef:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    :try_start_2
    invoke-interface {v8}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v12

    .line 136
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CherryPickCommand;->commits:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_5

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/eclipse/jgit/lib/Ref;

    .line 139
    .local v15, src:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v15}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v17

    .line 140
    .local v17, srcObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v17, :cond_2

    .line 141
    invoke-interface {v15}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v17

    .line 142
    :cond_2
    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v16

    .line 145
    .local v16, srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v14}, Lorg/eclipse/jgit/api/CherryPickCommand;->getParentCommit(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v18

    .line 147
    .local v18, srcParent:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lorg/eclipse/jgit/api/CherryPickCommand;->calculateOurName(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;

    move-result-object v13

    .line 148
    .local v13, ourName:Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    const/16 v21, 0x7

    invoke-virtual/range {v20 .. v21}, Lorg/eclipse/jgit/lib/ObjectId;->abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 151
    .local v4, cherryPickName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CherryPickCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CherryPickCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/merge/MergeStrategy;->newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/Merger;

    move-result-object v10

    check-cast v10, Lorg/eclipse/jgit/merge/ResolveMerger;

    .line 152
    .local v10, merger:Lorg/eclipse/jgit/merge/ResolveMerger;
    new-instance v19, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CherryPickCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Lorg/eclipse/jgit/merge/ResolveMerger;->setWorkingTreeIterator(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    .line 153
    invoke-virtual/range {v18 .. v18}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Lorg/eclipse/jgit/merge/ResolveMerger;->setBase(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 154
    const/16 v19, 0x3

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    const-string v21, "BASE"

    aput-object v21, v19, v20

    const/16 v20, 0x1

    aput-object v13, v19, v20

    const/16 v20, 0x2

    aput-object v4, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Lorg/eclipse/jgit/merge/ResolveMerger;->setCommitNames([Ljava/lang/String;)V

    .line 156
    const/16 v19, 0x2

    move/from16 v0, v19

    new-array v0, v0, [Lorg/eclipse/jgit/lib/AnyObjectId;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v12, v19, v20

    const/16 v20, 0x1

    aput-object v16, v19, v20

    move-object/from16 v0, v19

    invoke-virtual {v10, v0}, Lorg/eclipse/jgit/merge/ResolveMerger;->merge([Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 157
    invoke-virtual {v12}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/revwalk/RevTree;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v19

    invoke-virtual {v10}, Lorg/eclipse/jgit/merge/ResolveMerger;->getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v19

    if-nez v19, :cond_1

    .line 160
    new-instance v6, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CherryPickCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-virtual {v12}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CherryPickCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v21

    invoke-virtual {v10}, Lorg/eclipse/jgit/merge/ResolveMerger;->getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v22

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    invoke-direct {v6, v0, v1, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 163
    .local v6, dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v6, v0}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V

    .line 164
    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z

    .line 165
    new-instance v19, Lorg/eclipse/jgit/api/Git;

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/CherryPickCommand;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/api/Git;->commit()Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v19

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getFullMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/api/CommitCommand;->setMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v19

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CherryPickCommand;->reflogPrefix:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/api/CommitCommand;->setReflogComment(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v19

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getAuthorIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/api/CommitCommand;->setAuthor(Lorg/eclipse/jgit/lib/PersonIdent;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/api/CommitCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v12

    .line 170
    invoke-interface {v5, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 172
    .end local v6           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    :cond_3
    invoke-virtual {v10}, Lorg/eclipse/jgit/merge/ResolveMerger;->failed()Z

    move-result v19

    if-eqz v19, :cond_4

    .line 173
    new-instance v19, Lorg/eclipse/jgit/api/CherryPickResult;

    invoke-virtual {v10}, Lorg/eclipse/jgit/merge/ResolveMerger;->getFailingPaths()Ljava/util/Map;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Lorg/eclipse/jgit/api/CherryPickResult;-><init>(Ljava/util/Map;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 193
    invoke-virtual {v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 195
    .end local v4           #cherryPickName:Ljava/lang/String;
    .end local v10           #merger:Lorg/eclipse/jgit/merge/ResolveMerger;
    .end local v13           #ourName:Ljava/lang/String;
    .end local v15           #src:Lorg/eclipse/jgit/lib/Ref;
    .end local v16           #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v17           #srcObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v18           #srcParent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_1
    return-object v19

    .line 177
    .restart local v4       #cherryPickName:Ljava/lang/String;
    .restart local v10       #merger:Lorg/eclipse/jgit/merge/ResolveMerger;
    .restart local v13       #ourName:Ljava/lang/String;
    .restart local v15       #src:Lorg/eclipse/jgit/lib/Ref;
    .restart local v16       #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v17       #srcObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v18       #srcParent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_4
    :try_start_3
    new-instance v19, Lorg/eclipse/jgit/merge/MergeMessageFormatter;

    invoke-direct/range {v19 .. v19}, Lorg/eclipse/jgit/merge/MergeMessageFormatter;-><init>()V

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getFullMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual {v10}, Lorg/eclipse/jgit/merge/ResolveMerger;->getUnmergedPaths()Ljava/util/List;

    move-result-object v21

    invoke-virtual/range {v19 .. v21}, Lorg/eclipse/jgit/merge/MergeMessageFormatter;->formatWithConflicts(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v11

    .line 181
    .local v11, message:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CherryPickCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lorg/eclipse/jgit/lib/Repository;->writeCherryPickHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 182
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CherryPickCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/lib/Repository;->writeMergeCommitMsg(Ljava/lang/String;)V

    .line 184
    sget-object v19, Lorg/eclipse/jgit/api/CherryPickResult;->CONFLICT:Lorg/eclipse/jgit/api/CherryPickResult;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 193
    invoke-virtual {v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto :goto_1

    .end local v4           #cherryPickName:Ljava/lang/String;
    .end local v10           #merger:Lorg/eclipse/jgit/merge/ResolveMerger;
    .end local v11           #message:Ljava/lang/String;
    .end local v13           #ourName:Ljava/lang/String;
    .end local v15           #src:Lorg/eclipse/jgit/lib/Ref;
    .end local v16           #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v17           #srcObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v18           #srcParent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_5
    invoke-virtual {v14}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 195
    new-instance v19, Lorg/eclipse/jgit/api/CherryPickResult;

    move-object/from16 v0, v19

    invoke-direct {v0, v12, v5}, Lorg/eclipse/jgit/api/CherryPickResult;-><init>(Lorg/eclipse/jgit/revwalk/RevCommit;Ljava/util/List;)V

    goto :goto_1
.end method

.method public include(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/CherryPickCommand;
    .locals 3
    .parameter "name"
    .parameter "commit"

    .prologue
    .line 252
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/CherryPickCommand;->include(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/api/CherryPickCommand;

    move-result-object v0

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/CherryPickCommand;
    .locals 1
    .parameter "commit"

    .prologue
    .line 241
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/api/CherryPickCommand;->include(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/CherryPickCommand;

    move-result-object v0

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/api/CherryPickCommand;
    .locals 1
    .parameter "commit"

    .prologue
    .line 230
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CherryPickCommand;->checkCallable()V

    .line 231
    iget-object v0, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->commits:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    return-object p0
.end method

.method public setMainlineParentNumber(I)Lorg/eclipse/jgit/api/CherryPickCommand;
    .locals 1
    .parameter "mainlineParentNumber"

    .prologue
    .line 302
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->mainlineParentNumber:Ljava/lang/Integer;

    .line 303
    return-object p0
.end method

.method public setOurCommitName(Ljava/lang/String;)Lorg/eclipse/jgit/api/CherryPickCommand;
    .locals 0
    .parameter "ourCommitName"

    .prologue
    .line 263
    iput-object p1, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->ourCommitName:Ljava/lang/String;

    .line 264
    return-object p0
.end method

.method public setReflogPrefix(Ljava/lang/String;)Lorg/eclipse/jgit/api/CherryPickCommand;
    .locals 0
    .parameter "prefix"

    .prologue
    .line 279
    iput-object p1, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->reflogPrefix:Ljava/lang/String;

    .line 280
    return-object p0
.end method

.method public setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/CherryPickCommand;
    .locals 0
    .parameter "strategy"

    .prologue
    .line 290
    iput-object p1, p0, Lorg/eclipse/jgit/api/CherryPickCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 291
    return-object p0
.end method
