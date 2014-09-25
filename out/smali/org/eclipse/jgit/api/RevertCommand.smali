.class public Lorg/eclipse/jgit/api/RevertCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "RevertCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevCommit;",
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

.field private failingResult:Lorg/eclipse/jgit/api/MergeResult;

.field private ourCommitName:Ljava/lang/String;

.field private revertedRefs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

.field private unmergedPaths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 88
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/RevertCommand;->commits:Ljava/util/List;

    .line 90
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/api/RevertCommand;->ourCommitName:Ljava/lang/String;

    .line 92
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/RevertCommand;->revertedRefs:Ljava/util/List;

    .line 98
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->RECURSIVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    iput-object v0, p0, Lorg/eclipse/jgit/api/RevertCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 105
    return-void
.end method

.method private calculateOurName(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;
    .locals 3
    .parameter "headRef"

    .prologue
    .line 273
    iget-object v2, p0, Lorg/eclipse/jgit/api/RevertCommand;->ourCommitName:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 274
    iget-object v0, p0, Lorg/eclipse/jgit/api/RevertCommand;->ourCommitName:Ljava/lang/String;

    .line 278
    :goto_0
    return-object v0

    .line 276
    :cond_0
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v2

    invoke-interface {v2}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    .line 277
    .local v1, targetRefName:Ljava/lang/String;
    invoke-static {v1}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 278
    .local v0, headName:Ljava/lang/String;
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
    .line 87
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RevertCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/NoMessageException;,
            Lorg/eclipse/jgit/api/errors/UnmergedPathsException;,
            Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;,
            Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;,
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 126
    const/16 v18, 0x0

    .line 127
    .local v18, newHead:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/RevertCommand;->checkCallable()V

    .line 129
    new-instance v21, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v0, v21

    invoke-direct {v0, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 133
    .local v21, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v3, "HEAD"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v14

    .line 134
    .local v14, headRef:Lorg/eclipse/jgit/lib/Ref;
    if-nez v14, :cond_0

    .line 135
    new-instance v2, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->commitOnRepoWithoutHEADCurrentlyNotSupported:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 217
    .end local v14           #headRef:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v12

    .line 218
    .local v12, e:Ljava/io/IOException;
    :try_start_1
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfRevertCommand:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v12, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v12}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 223
    .end local v12           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v2

    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v2

    .line 137
    .restart local v14       #headRef:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    :try_start_2
    invoke-interface {v14}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v13

    .line 139
    .local v13, headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v18, v13

    .line 142
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->commits:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lorg/eclipse/jgit/lib/Ref;

    .line 145
    .local v24, src:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface/range {v24 .. v24}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v26

    .line 146
    .local v26, srcObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v26, :cond_2

    .line 147
    invoke-interface/range {v24 .. v24}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v26

    .line 148
    :cond_2
    move-object/from16 v0, v21

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v25

    .line 151
    .local v25, srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_3

    .line 152
    new-instance v2, Lorg/eclipse/jgit/api/errors/MultipleParentsNotAllowedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->canOnlyRevertCommitsWithOneParent:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/revwalk/RevCommit;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/errors/MultipleParentsNotAllowedException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 158
    :cond_3
    const/4 v2, 0x0

    move-object/from16 v0, v25

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v27

    .line 159
    .local v27, srcParent:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, v21

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 161
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/eclipse/jgit/api/RevertCommand;->calculateOurName(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;

    move-result-object v20

    .line 162
    .local v20, ourName:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    const/4 v4, 0x7

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/ObjectId;->abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    .line 165
    .local v22, revertName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/RevertCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/merge/MergeStrategy;->newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/Merger;

    move-result-object v16

    check-cast v16, Lorg/eclipse/jgit/merge/ResolveMerger;

    .line 166
    .local v16, merger:Lorg/eclipse/jgit/merge/ResolveMerger;
    new-instance v2, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/RevertCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/merge/ResolveMerger;->setWorkingTreeIterator(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    .line 167
    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/merge/ResolveMerger;->setBase(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 168
    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "BASE"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v20, v2, v3

    const/4 v3, 0x2

    aput-object v22, v2, v3

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/merge/ResolveMerger;->setCommitNames([Ljava/lang/String;)V

    .line 171
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Revert \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/revwalk/RevCommit;->getShortMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    .line 173
    .local v23, shortMessage:Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "This reverts commit "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/ObjectId;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    .line 176
    .local v19, newMessage:Ljava/lang/String;
    const/4 v2, 0x2

    new-array v2, v2, [Lorg/eclipse/jgit/lib/AnyObjectId;

    const/4 v3, 0x0

    aput-object v13, v2, v3

    const/4 v3, 0x1

    aput-object v27, v2, v3

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/merge/ResolveMerger;->merge([Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 177
    invoke-virtual {v13}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevTree;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/merge/ResolveMerger;->getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 180
    new-instance v11, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v13}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/RevertCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/merge/ResolveMerger;->getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-direct {v11, v2, v3, v4, v5}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 183
    .local v11, dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V

    .line 184
    invoke-virtual {v11}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z

    .line 185
    new-instance v2, Lorg/eclipse/jgit/api/Git;

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/RevertCommand;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/Git;->commit()Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/api/CommitCommand;->setMessage(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "revert: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v23

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/api/CommitCommand;->setReflogComment(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/api/CommitCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v18

    .line 188
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->revertedRefs:Ljava/util/List;

    move-object/from16 v0, v24

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 190
    .end local v11           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    :cond_4
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/merge/ResolveMerger;->getUnmergedPaths()Ljava/util/List;

    move-result-object v2

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->unmergedPaths:Ljava/util/List;

    .line 191
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/merge/ResolveMerger;->getFailingPaths()Ljava/util/Map;

    move-result-object v9

    .line 193
    .local v9, failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    if-eqz v9, :cond_6

    .line 194
    new-instance v2, Lorg/eclipse/jgit/api/MergeResult;

    const/4 v3, 0x0

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/merge/ResolveMerger;->getBaseCommitId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v6, 0x0

    invoke-virtual {v13}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    aput-object v7, v5, v6

    sget-object v6, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAILED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/eclipse/jgit/api/RevertCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/merge/ResolveMerger;->getMergeResults()Ljava/util/Map;

    move-result-object v8

    const/4 v10, 0x0

    invoke-direct/range {v2 .. v10}, Lorg/eclipse/jgit/api/MergeResult;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->failingResult:Lorg/eclipse/jgit/api/MergeResult;

    .line 207
    :goto_1
    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/merge/ResolveMerger;->failed()Z

    move-result v2

    if-nez v2, :cond_5

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->unmergedPaths:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 208
    new-instance v2, Lorg/eclipse/jgit/merge/MergeMessageFormatter;

    invoke-direct {v2}, Lorg/eclipse/jgit/merge/MergeMessageFormatter;-><init>()V

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/merge/ResolveMerger;->getUnmergedPaths()Ljava/util/List;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v2, v0, v3}, Lorg/eclipse/jgit/merge/MergeMessageFormatter;->formatWithConflicts(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v17

    .line 211
    .local v17, message:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual/range {v25 .. v25}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->writeRevertHead(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 212
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/lib/Repository;->writeMergeCommitMsg(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 214
    .end local v17           #message:Ljava/lang/String;
    :cond_5
    const/16 v18, 0x0

    .line 223
    .end local v18           #newHead:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 225
    .end local v9           #failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    .end local v16           #merger:Lorg/eclipse/jgit/merge/ResolveMerger;
    .end local v19           #newMessage:Ljava/lang/String;
    .end local v20           #ourName:Ljava/lang/String;
    .end local v22           #revertName:Ljava/lang/String;
    .end local v23           #shortMessage:Ljava/lang/String;
    .end local v24           #src:Lorg/eclipse/jgit/lib/Ref;
    .end local v25           #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v26           #srcObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v27           #srcParent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_2
    return-object v18

    .line 201
    .restart local v9       #failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    .restart local v16       #merger:Lorg/eclipse/jgit/merge/ResolveMerger;
    .restart local v18       #newHead:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v19       #newMessage:Ljava/lang/String;
    .restart local v20       #ourName:Ljava/lang/String;
    .restart local v22       #revertName:Ljava/lang/String;
    .restart local v23       #shortMessage:Ljava/lang/String;
    .restart local v24       #src:Lorg/eclipse/jgit/lib/Ref;
    .restart local v25       #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v26       #srcObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v27       #srcParent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_6
    :try_start_3
    new-instance v2, Lorg/eclipse/jgit/api/MergeResult;

    const/4 v3, 0x0

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/merge/ResolveMerger;->getBaseCommitId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v6, 0x0

    invoke-virtual {v13}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-virtual/range {v27 .. v27}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    aput-object v7, v5, v6

    sget-object v6, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->CONFLICTING:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/eclipse/jgit/api/RevertCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/merge/ResolveMerger;->getMergeResults()Ljava/util/Map;

    move-result-object v8

    const/4 v10, 0x0

    invoke-direct/range {v2 .. v10}, Lorg/eclipse/jgit/api/MergeResult;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/eclipse/jgit/api/RevertCommand;->failingResult:Lorg/eclipse/jgit/api/MergeResult;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_1

    .line 223
    .end local v9           #failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    .end local v16           #merger:Lorg/eclipse/jgit/merge/ResolveMerger;
    .end local v19           #newMessage:Ljava/lang/String;
    .end local v20           #ourName:Ljava/lang/String;
    .end local v22           #revertName:Ljava/lang/String;
    .end local v23           #shortMessage:Ljava/lang/String;
    .end local v24           #src:Lorg/eclipse/jgit/lib/Ref;
    .end local v25           #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v26           #srcObjectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v27           #srcParent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_7
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto :goto_2
.end method

.method public getFailingResult()Lorg/eclipse/jgit/api/MergeResult;
    .locals 1

    .prologue
    .line 295
    iget-object v0, p0, Lorg/eclipse/jgit/api/RevertCommand;->failingResult:Lorg/eclipse/jgit/api/MergeResult;

    return-object v0
.end method

.method public getRevertedRefs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation

    .prologue
    .line 287
    iget-object v0, p0, Lorg/eclipse/jgit/api/RevertCommand;->revertedRefs:Ljava/util/List;

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
    .line 302
    iget-object v0, p0, Lorg/eclipse/jgit/api/RevertCommand;->unmergedPaths:Ljava/util/List;

    return-object v0
.end method

.method public include(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/RevertCommand;
    .locals 3
    .parameter "name"
    .parameter "commit"

    .prologue
    .line 257
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/RevertCommand;->include(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/api/RevertCommand;

    move-result-object v0

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/RevertCommand;
    .locals 1
    .parameter "commit"

    .prologue
    .line 246
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/api/RevertCommand;->include(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/RevertCommand;

    move-result-object v0

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/api/RevertCommand;
    .locals 1
    .parameter "commit"

    .prologue
    .line 235
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RevertCommand;->checkCallable()V

    .line 236
    iget-object v0, p0, Lorg/eclipse/jgit/api/RevertCommand;->commits:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 237
    return-object p0
.end method

.method public setOurCommitName(Ljava/lang/String;)Lorg/eclipse/jgit/api/RevertCommand;
    .locals 0
    .parameter "ourCommitName"

    .prologue
    .line 268
    iput-object p1, p0, Lorg/eclipse/jgit/api/RevertCommand;->ourCommitName:Ljava/lang/String;

    .line 269
    return-object p0
.end method

.method public setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/RevertCommand;
    .locals 0
    .parameter "strategy"

    .prologue
    .line 312
    iput-object p1, p0, Lorg/eclipse/jgit/api/RevertCommand;->strategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 313
    return-object p0
.end method
