.class public Lorg/eclipse/jgit/api/MergeCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "MergeCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/MergeCommand$1;,
        Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/api/MergeResult;",
        ">;"
    }
.end annotation


# instance fields
.field private commit:Ljava/lang/Boolean;

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

.field private fastForwardMode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

.field private mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

.field private squash:Ljava/lang/Boolean;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 205
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 99
    sget-object v0, Lorg/eclipse/jgit/merge/MergeStrategy;->RECURSIVE:Lorg/eclipse/jgit/merge/ThreeWayMergeStrategy;

    iput-object v0, p0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 101
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/MergeCommand;->commits:Ljava/util/List;

    .line 206
    return-void
.end method

.method private checkParameters()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/InvalidMergeHeadsException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 419
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeCommand;->squash:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeCommand;->fastForwardMode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    sget-object v1, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->NO_FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    if-ne v0, v1, :cond_0

    .line 420
    new-instance v0, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->cannotCombineSquashWithNoff:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 424
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeCommand;->commits:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eq v0, v5, :cond_2

    .line 425
    new-instance v1, Lorg/eclipse/jgit/api/errors/InvalidMergeHeadsException;

    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeCommand;->commits:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->noMergeHeadSpecified:Ljava/lang/String;

    :goto_0
    invoke-direct {v1, v0}, Lorg/eclipse/jgit/api/errors/InvalidMergeHeadsException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_1
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->mergeStrategyDoesNotSupportHeads:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    invoke-virtual {v4}, Lorg/eclipse/jgit/merge/MergeStrategy;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    iget-object v3, p0, Lorg/eclipse/jgit/api/MergeCommand;->commits:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v0, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 431
    :cond_2
    return-void
.end method

.method private fallBackToConfiguration()V
    .locals 2

    .prologue
    .line 438
    iget-object v1, p0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v1}, Lorg/eclipse/jgit/merge/MergeConfig;->getConfigForCurrentBranch(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/MergeConfig;

    move-result-object v0

    .line 439
    .local v0, config:Lorg/eclipse/jgit/merge/MergeConfig;
    iget-object v1, p0, Lorg/eclipse/jgit/api/MergeCommand;->squash:Ljava/lang/Boolean;

    if-nez v1, :cond_0

    .line 440
    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeConfig;->isSquash()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/api/MergeCommand;->squash:Ljava/lang/Boolean;

    .line 441
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/api/MergeCommand;->commit:Ljava/lang/Boolean;

    if-nez v1, :cond_1

    .line 442
    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeConfig;->isCommit()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/api/MergeCommand;->commit:Ljava/lang/Boolean;

    .line 443
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/api/MergeCommand;->fastForwardMode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    if-nez v1, :cond_2

    .line 444
    invoke-virtual {v0}, Lorg/eclipse/jgit/merge/MergeConfig;->getFastForwardMode()Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/api/MergeCommand;->fastForwardMode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    .line 445
    :cond_2
    return-void
.end method

.method private updateHead(Ljava/lang/StringBuilder;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 7
    .parameter "refLogMessage"
    .parameter "newHeadId"
    .parameter "oldHeadID"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 450
    iget-object v2, p0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v3, "HEAD"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v1

    .line 451
    .local v1, refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 452
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v6}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 453
    invoke-virtual {v1, p3}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 454
    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->update()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v0

    .line 455
    .local v0, rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    sget-object v2, Lorg/eclipse/jgit/api/MergeCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 464
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->updatingRefFailed:Ljava/lang/String;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "HEAD"

    aput-object v5, v4, v6

    const/4 v5, 0x1

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/ObjectId;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 461
    :pswitch_0
    new-instance v2, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->couldNotLockHEAD:Ljava/lang/String;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v4

    invoke-direct {v2, v3, v4, v0}, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/RefUpdate$Result;)V

    throw v2

    .line 458
    :pswitch_1
    return-void

    .line 455
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
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
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/MergeCommand;->call()Lorg/eclipse/jgit/api/MergeResult;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/api/MergeResult;
    .locals 53
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;,
            Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;,
            Lorg/eclipse/jgit/api/errors/CheckoutConflictException;,
            Lorg/eclipse/jgit/api/errors/InvalidMergeHeadsException;,
            Lorg/eclipse/jgit/api/errors/WrongRepositoryStateException;,
            Lorg/eclipse/jgit/api/errors/NoMessageException;
        }
    .end annotation

    .prologue
    .line 220
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/MergeCommand;->checkCallable()V

    .line 221
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/MergeCommand;->fallBackToConfiguration()V

    .line 222
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/MergeCommand;->checkParameters()V

    .line 224
    const/16 v48, 0x0

    .line 225
    .local v48, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    const/16 v34, 0x0

    .line 227
    .local v34, dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v5, "HEAD"

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v37

    .line 228
    .local v37, head:Lorg/eclipse/jgit/lib/Ref;
    if-nez v37, :cond_1

    .line 229
    new-instance v3, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->commitOnRepoWithoutHEADCurrentlyNotSupported:Ljava/lang/String;

    invoke-direct {v3, v5}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5

    .line 403
    .end local v37           #head:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v36

    .line 404
    .local v36, e:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    :goto_0
    if-nez v34, :cond_19

    :try_start_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v33

    .line 406
    .local v33, conflicts:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :goto_1
    new-instance v3, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-direct {v3, v0, v1}, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;-><init>(Ljava/util/List;Lorg/eclipse/jgit/errors/CheckoutConflictException;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 413
    .end local v33           #conflicts:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v36           #e:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    :catchall_0
    move-exception v3

    :goto_2
    if-eqz v48, :cond_0

    .line 414
    invoke-virtual/range {v48 .. v48}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :cond_0
    throw v3

    .line 231
    .restart local v37       #head:Lorg/eclipse/jgit/lib/Ref;
    :cond_1
    :try_start_2
    new-instance v45, Ljava/lang/StringBuilder;

    const-string v3, "merge "

    move-object/from16 v0, v45

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 234
    .local v45, refLogMessage:Ljava/lang/StringBuilder;
    new-instance v49, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v0, v49

    invoke-direct {v0, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5

    .line 237
    .end local v48           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .local v49, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->commits:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v44

    check-cast v44, Lorg/eclipse/jgit/lib/Ref;

    .line 239
    .local v44, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface/range {v44 .. v44}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v45

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v0, v44

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/lib/Repository;->peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v44

    .line 243
    invoke-interface/range {v44 .. v44}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v43

    .line 244
    .local v43, objectId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v43, :cond_2

    .line 245
    invoke-interface/range {v44 .. v44}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v43

    .line 247
    :cond_2
    move-object/from16 v0, v49

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    .line 249
    .local v4, srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-interface/range {v37 .. v37}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v38

    .line 250
    .local v38, headId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v38, :cond_6

    .line 251
    move-object/from16 v0, v49

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 252
    new-instance v35, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v5

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v7

    move-object/from16 v0, v35

    invoke-direct {v0, v3, v5, v7}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    .line 254
    .end local v34           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .local v35, dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    const/4 v3, 0x1

    :try_start_4
    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V

    .line 255
    invoke-virtual/range {v35 .. v35}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z

    .line 256
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-interface/range {v37 .. v37}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v46

    .line 258
    .local v46, refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    move-object/from16 v0, v46

    move-object/from16 v1, v43

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 259
    const/4 v3, 0x0

    move-object/from16 v0, v46

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 260
    const-string v3, "initial pull"

    const/4 v5, 0x0

    move-object/from16 v0, v46

    invoke-virtual {v0, v3, v5}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 261
    invoke-virtual/range {v46 .. v46}, Lorg/eclipse/jgit/lib/RefUpdate;->update()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v3

    sget-object v5, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    if-eq v3, v5, :cond_3

    .line 262
    new-instance v3, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->commitOnRepoWithoutHEADCurrentlyNotSupported:Ljava/lang/String;

    invoke-direct {v3, v5}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 403
    .end local v46           #refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    :catch_1
    move-exception v36

    move-object/from16 v34, v35

    .end local v35           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v34       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    move-object/from16 v48, v49

    .end local v49           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v48       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    goto/16 :goto_0

    .line 264
    .end local v34           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .end local v48           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v35       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v46       #refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    .restart local v49       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :cond_3
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/api/MergeCommand;->setCallable(Z)V

    .line 265
    new-instance v3, Lorg/eclipse/jgit/api/MergeResult;

    const/4 v5, 0x2

    new-array v6, v5, [Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v5, 0x0

    const/4 v7, 0x0

    aput-object v7, v6, v5

    const/4 v5, 0x1

    aput-object v4, v6, v5

    sget-object v7, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAST_FORWARD:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v5, v4

    invoke-direct/range {v3 .. v10}, Lorg/eclipse/jgit/api/MergeResult;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 413
    if-eqz v49, :cond_4

    .line 414
    invoke-virtual/range {v49 .. v49}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :cond_4
    move-object/from16 v34, v35

    .end local v35           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v34       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    move-object v15, v3

    .end local v46           #refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    :cond_5
    :goto_3
    return-object v15

    .line 270
    :cond_6
    :try_start_5
    move-object/from16 v0, v49

    move-object/from16 v1, v38

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v6

    .line 272
    .local v6, headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, v49

    invoke-virtual {v0, v4, v6}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 273
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/api/MergeCommand;->setCallable(Z)V

    .line 274
    new-instance v5, Lorg/eclipse/jgit/api/MergeResult;

    const/4 v3, 0x2

    new-array v8, v3, [Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v3, 0x0

    aput-object v6, v8, v3

    const/4 v3, 0x1

    aput-object v4, v8, v3

    sget-object v9, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->ALREADY_UP_TO_DATE:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v7, v4

    invoke-direct/range {v5 .. v12}, Lorg/eclipse/jgit/api/MergeResult;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    .line 413
    if-eqz v49, :cond_7

    .line 414
    invoke-virtual/range {v49 .. v49}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :cond_7
    move-object v15, v5

    goto :goto_3

    .line 277
    :cond_8
    :try_start_6
    move-object/from16 v0, v49

    invoke-virtual {v0, v6, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v3

    if-eqz v3, :cond_b

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->fastForwardMode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    sget-object v5, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->NO_FF:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    if-eq v3, v5, :cond_b

    .line 281
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ": "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v5, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAST_FORWARD:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v45

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    new-instance v35, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v7

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v10

    move-object/from16 v0, v35

    invoke-direct {v0, v3, v5, v7, v10}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 285
    .end local v34           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v35       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    const/4 v3, 0x1

    :try_start_7
    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V

    .line 286
    invoke-virtual/range {v35 .. v35}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z

    .line 287
    const/4 v14, 0x0

    .line 288
    .local v14, msg:Ljava/lang/String;
    const/4 v9, 0x0

    .line 289
    .local v9, base:Lorg/eclipse/jgit/lib/ObjectId;
    const/4 v11, 0x0

    .line 290
    .local v11, mergeStatus:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->squash:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_a

    .line 291
    move-object/from16 v0, p0

    move-object/from16 v1, v45

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v4, v2}, Lorg/eclipse/jgit/api/MergeCommand;->updateHead(Ljava/lang/StringBuilder;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 292
    move-object v9, v4

    move-object v8, v4

    .line 293
    .local v8, newHead:Lorg/eclipse/jgit/lib/ObjectId;
    sget-object v11, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAST_FORWARD:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 304
    :goto_4
    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/api/MergeCommand;->setCallable(Z)V

    .line 305
    new-instance v7, Lorg/eclipse/jgit/api/MergeResult;

    const/4 v3, 0x2

    new-array v10, v3, [Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v3, 0x0

    aput-object v6, v10, v3

    const/4 v3, 0x1

    aput-object v4, v10, v3

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    const/4 v13, 0x0

    invoke-direct/range {v7 .. v14}, Lorg/eclipse/jgit/api/MergeResult;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    .line 413
    if-eqz v49, :cond_9

    .line 414
    invoke-virtual/range {v49 .. v49}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :cond_9
    move-object/from16 v34, v35

    .end local v35           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v34       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    move-object v15, v7

    goto/16 :goto_3

    .line 295
    .end local v8           #newHead:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v34           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v35       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    :cond_a
    :try_start_8
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v14, v3, Lorg/eclipse/jgit/internal/JGitText;->squashCommitNotUpdatingHEAD:Ljava/lang/String;

    .line 296
    move-object/from16 v9, v38

    move-object/from16 v8, v38

    .line 297
    .restart local v8       #newHead:Lorg/eclipse/jgit/lib/ObjectId;
    sget-object v11, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAST_FORWARD_SQUASHED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 298
    move-object/from16 v0, v49

    invoke-static {v0, v4, v6}, Lorg/eclipse/jgit/revwalk/RevWalkUtils;->find(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Ljava/util/List;

    move-result-object v51

    .line 300
    .local v51, squashedCommits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    new-instance v3, Lorg/eclipse/jgit/merge/SquashMessageFormatter;

    invoke-direct {v3}, Lorg/eclipse/jgit/merge/SquashMessageFormatter;-><init>()V

    move-object/from16 v0, v51

    move-object/from16 v1, v37

    invoke-virtual {v3, v0, v1}, Lorg/eclipse/jgit/merge/SquashMessageFormatter;->format(Ljava/util/List;Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;

    move-result-object v50

    .line 302
    .local v50, squashMessage:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v0, v50

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/lib/Repository;->writeSquashCommitMsg(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_2

    goto :goto_4

    .line 407
    .end local v6           #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v8           #newHead:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v9           #base:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v11           #mergeStatus:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;
    .end local v14           #msg:Ljava/lang/String;
    .end local v50           #squashMessage:Ljava/lang/String;
    .end local v51           #squashedCommits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    :catch_2
    move-exception v36

    move-object/from16 v34, v35

    .end local v35           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v34       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    move-object/from16 v48, v49

    .line 408
    .end local v4           #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v37           #head:Lorg/eclipse/jgit/lib/Ref;
    .end local v38           #headId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v43           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v44           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v45           #refLogMessage:Ljava/lang/StringBuilder;
    .end local v49           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .local v36, e:Ljava/io/IOException;
    .restart local v48       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :goto_5
    :try_start_9
    new-instance v3, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->exceptionCaughtDuringExecutionOfMergeCommand:Ljava/lang/String;

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v36, v7, v10

    invoke-static {v5, v7}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v36

    invoke-direct {v3, v5, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 309
    .end local v36           #e:Ljava/io/IOException;
    .end local v48           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v4       #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v6       #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v37       #head:Lorg/eclipse/jgit/lib/Ref;
    .restart local v38       #headId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v43       #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v44       #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v45       #refLogMessage:Ljava/lang/StringBuilder;
    .restart local v49       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :cond_b
    :try_start_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->fastForwardMode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    sget-object v5, Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;->FF_ONLY:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    if-ne v3, v5, :cond_c

    .line 310
    new-instance v15, Lorg/eclipse/jgit/api/MergeResult;

    const/4 v3, 0x2

    new-array v0, v3, [Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v18, v0

    const/4 v3, 0x0

    aput-object v6, v18, v3

    const/4 v3, 0x1

    aput-object v4, v18, v3

    sget-object v19, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->ABORTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v16, v6

    move-object/from16 v17, v4

    invoke-direct/range {v15 .. v22}, Lorg/eclipse/jgit/api/MergeResult;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/lang/String;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_a .. :try_end_a} :catch_3
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4

    .line 413
    if-eqz v49, :cond_5

    .line 414
    invoke-virtual/range {v49 .. v49}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    goto/16 :goto_3

    .line 314
    :cond_c
    :try_start_b
    const-string v39, ""

    .line 315
    .local v39, mergeMessage:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->squash:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_12

    .line 316
    new-instance v3, Lorg/eclipse/jgit/merge/MergeMessageFormatter;

    invoke-direct {v3}, Lorg/eclipse/jgit/merge/MergeMessageFormatter;-><init>()V

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/api/MergeCommand;->commits:Ljava/util/List;

    move-object/from16 v0, v37

    invoke-virtual {v3, v5, v0}, Lorg/eclipse/jgit/merge/MergeMessageFormatter;->format(Ljava/util/List;Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;

    move-result-object v39

    .line 318
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v0, v39

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/lib/Repository;->writeMergeCommitMsg(Ljava/lang/String;)V

    .line 319
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const/4 v5, 0x1

    new-array v5, v5, [Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v7, 0x0

    invoke-interface/range {v44 .. v44}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    aput-object v10, v5, v7

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/lib/Repository;->writeMergeHeads(Ljava/util/List;)V

    .line 327
    :goto_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/merge/MergeStrategy;->newMerger(Lorg/eclipse/jgit/lib/Repository;)Lorg/eclipse/jgit/merge/Merger;

    move-result-object v41

    .line 329
    .local v41, merger:Lorg/eclipse/jgit/merge/Merger;
    const/16 v23, 0x0

    .line 330
    .local v23, lowLevelResults:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult<*>;>;"
    const/16 v24, 0x0

    .line 331
    .local v24, failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    const/16 v52, 0x0

    .line 332
    .local v52, unmergedPaths:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, v41

    instance-of v3, v0, Lorg/eclipse/jgit/merge/ResolveMerger;

    if-eqz v3, :cond_13

    .line 333
    move-object/from16 v0, v41

    check-cast v0, Lorg/eclipse/jgit/merge/ResolveMerger;

    move-object/from16 v47, v0

    .line 334
    .local v47, resolveMerger:Lorg/eclipse/jgit/merge/ResolveMerger;
    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v7, "BASE"

    aput-object v7, v3, v5

    const/4 v5, 0x1

    const-string v7, "HEAD"

    aput-object v7, v3, v5

    const/4 v5, 0x2

    invoke-interface/range {v44 .. v44}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v3, v5

    move-object/from16 v0, v47

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/merge/ResolveMerger;->setCommitNames([Ljava/lang/String;)V

    .line 336
    new-instance v3, Lorg/eclipse/jgit/treewalk/FileTreeIterator;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v3, v5}, Lorg/eclipse/jgit/treewalk/FileTreeIterator;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    move-object/from16 v0, v47

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/merge/ResolveMerger;->setWorkingTreeIterator(Lorg/eclipse/jgit/treewalk/WorkingTreeIterator;)V

    .line 337
    const/4 v3, 0x2

    new-array v3, v3, [Lorg/eclipse/jgit/lib/AnyObjectId;

    const/4 v5, 0x0

    aput-object v6, v3, v5

    const/4 v5, 0x1

    aput-object v4, v3, v5

    move-object/from16 v0, v41

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/merge/Merger;->merge([Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v42

    .line 338
    .local v42, noProblems:Z
    invoke-virtual/range {v47 .. v47}, Lorg/eclipse/jgit/merge/ResolveMerger;->getMergeResults()Ljava/util/Map;

    move-result-object v23

    .line 340
    invoke-virtual/range {v47 .. v47}, Lorg/eclipse/jgit/merge/ResolveMerger;->getFailingPaths()Ljava/util/Map;

    move-result-object v24

    .line 341
    invoke-virtual/range {v47 .. v47}, Lorg/eclipse/jgit/merge/ResolveMerger;->getUnmergedPaths()Ljava/util/List;

    move-result-object v52

    .line 344
    .end local v47           #resolveMerger:Lorg/eclipse/jgit/merge/ResolveMerger;
    :goto_7
    const-string v3, ": Merge made by "

    move-object/from16 v0, v45

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    move-object/from16 v0, v49

    invoke-virtual {v0, v6, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v3

    if-nez v3, :cond_14

    .line 346
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    invoke-virtual {v3}, Lorg/eclipse/jgit/merge/MergeStrategy;->getName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v45

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    :goto_8
    const/16 v3, 0x2e

    move-object/from16 v0, v45

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 350
    if-eqz v42, :cond_15

    .line 351
    new-instance v35, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v7, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v7

    invoke-virtual/range {v41 .. v41}, Lorg/eclipse/jgit/merge/Merger;->getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    move-object/from16 v0, v35

    invoke-direct {v0, v3, v5, v7, v10}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_b .. :try_end_b} :catch_3
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_4

    .line 354
    .end local v34           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v35       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    const/4 v3, 0x1

    :try_start_c
    move-object/from16 v0, v35

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V

    .line 355
    invoke-virtual/range {v35 .. v35}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z

    .line 357
    const/4 v14, 0x0

    .line 358
    .restart local v14       #msg:Ljava/lang/String;
    const/16 v16, 0x0

    .line 359
    .local v16, newHeadId:Lorg/eclipse/jgit/lib/ObjectId;
    const/4 v11, 0x0

    .line 360
    .restart local v11       #mergeStatus:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->commit:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_d

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->squash:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 361
    sget-object v11, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED_SQUASHED_NOT_COMMITTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 363
    :cond_d
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->commit:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_e

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->squash:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_e

    .line 364
    sget-object v11, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED_NOT_COMMITTED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 366
    :cond_e
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->commit:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_f

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->squash:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_f

    .line 367
    new-instance v3, Lorg/eclipse/jgit/api/Git;

    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/MergeCommand;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v5

    invoke-direct {v3, v5}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    invoke-virtual {v3}, Lorg/eclipse/jgit/api/Git;->commit()Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v3

    invoke-virtual/range {v45 .. v45}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/api/CommitCommand;->setReflogComment(Ljava/lang/String;)Lorg/eclipse/jgit/api/CommitCommand;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/api/CommitCommand;->call()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v16

    .line 370
    sget-object v11, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 372
    :cond_f
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->commit:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_10

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->squash:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_10

    .line 373
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v14, v3, Lorg/eclipse/jgit/internal/JGitText;->squashCommitNotUpdatingHEAD:Ljava/lang/String;

    .line 374
    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v16

    .line 375
    sget-object v11, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->MERGED_SQUASHED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 377
    :cond_10
    new-instance v15, Lorg/eclipse/jgit/api/MergeResult;

    const/16 v17, 0x0

    const/4 v3, 0x2

    new-array v0, v3, [Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v18, v0

    const/4 v3, 0x0

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    aput-object v5, v18, v3

    const/4 v3, 0x1

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    aput-object v5, v18, v3

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v19, v11

    move-object/from16 v22, v14

    invoke-direct/range {v15 .. v22}, Lorg/eclipse/jgit/api/MergeResult;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_c .. :try_end_c} :catch_1
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_2

    .line 413
    if-eqz v49, :cond_11

    .line 414
    invoke-virtual/range {v49 .. v49}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :cond_11
    move-object/from16 v34, v35

    .end local v35           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v34       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    goto/16 :goto_3

    .line 321
    .end local v11           #mergeStatus:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;
    .end local v14           #msg:Ljava/lang/String;
    .end local v16           #newHeadId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v23           #lowLevelResults:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult<*>;>;"
    .end local v24           #failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    .end local v41           #merger:Lorg/eclipse/jgit/merge/Merger;
    .end local v42           #noProblems:Z
    .end local v52           #unmergedPaths:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_12
    :try_start_d
    move-object/from16 v0, v49

    invoke-static {v0, v4, v6}, Lorg/eclipse/jgit/revwalk/RevWalkUtils;->find(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Ljava/util/List;

    move-result-object v51

    .line 323
    .restart local v51       #squashedCommits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    new-instance v3, Lorg/eclipse/jgit/merge/SquashMessageFormatter;

    invoke-direct {v3}, Lorg/eclipse/jgit/merge/SquashMessageFormatter;-><init>()V

    move-object/from16 v0, v51

    move-object/from16 v1, v37

    invoke-virtual {v3, v0, v1}, Lorg/eclipse/jgit/merge/SquashMessageFormatter;->format(Ljava/util/List;Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;

    move-result-object v50

    .line 325
    .restart local v50       #squashMessage:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v0, v50

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/lib/Repository;->writeSquashCommitMsg(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 403
    .end local v4           #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v6           #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v38           #headId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v39           #mergeMessage:Ljava/lang/String;
    .end local v43           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v44           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v50           #squashMessage:Ljava/lang/String;
    .end local v51           #squashedCommits:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/revwalk/RevCommit;>;"
    :catch_3
    move-exception v36

    move-object/from16 v48, v49

    .end local v49           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v48       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    goto/16 :goto_0

    .line 343
    .end local v48           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v4       #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v6       #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v23       #lowLevelResults:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult<*>;>;"
    .restart local v24       #failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    .restart local v38       #headId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v39       #mergeMessage:Ljava/lang/String;
    .restart local v41       #merger:Lorg/eclipse/jgit/merge/Merger;
    .restart local v43       #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v44       #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v49       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v52       #unmergedPaths:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_13
    const/4 v3, 0x2

    new-array v3, v3, [Lorg/eclipse/jgit/lib/AnyObjectId;

    const/4 v5, 0x0

    aput-object v6, v3, v5

    const/4 v5, 0x1

    aput-object v4, v3, v5

    move-object/from16 v0, v41

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/merge/Merger;->merge([Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v42

    .restart local v42       #noProblems:Z
    goto/16 :goto_7

    .line 348
    :cond_14
    const-string v3, "recursive"

    move-object/from16 v0, v45

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_8

    .line 407
    .end local v4           #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v6           #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v23           #lowLevelResults:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult<*>;>;"
    .end local v24           #failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    .end local v38           #headId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v39           #mergeMessage:Ljava/lang/String;
    .end local v41           #merger:Lorg/eclipse/jgit/merge/Merger;
    .end local v42           #noProblems:Z
    .end local v43           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v44           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v52           #unmergedPaths:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :catch_4
    move-exception v36

    move-object/from16 v48, v49

    .end local v49           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v48       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    goto/16 :goto_5

    .line 382
    .end local v48           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v4       #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v6       #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v23       #lowLevelResults:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult<*>;>;"
    .restart local v24       #failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    .restart local v38       #headId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v39       #mergeMessage:Ljava/lang/String;
    .restart local v41       #merger:Lorg/eclipse/jgit/merge/Merger;
    .restart local v42       #noProblems:Z
    .restart local v43       #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v44       #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v49       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v52       #unmergedPaths:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :cond_15
    if-eqz v24, :cond_17

    .line 383
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/lib/Repository;->writeMergeCommitMsg(Ljava/lang/String;)V

    .line 384
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Lorg/eclipse/jgit/lib/Repository;->writeMergeHeads(Ljava/util/List;)V

    .line 385
    new-instance v17, Lorg/eclipse/jgit/api/MergeResult;

    const/16 v18, 0x0

    invoke-virtual/range {v41 .. v41}, Lorg/eclipse/jgit/merge/Merger;->getBaseCommitId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v19

    const/4 v3, 0x2

    new-array v0, v3, [Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v20, v0

    const/4 v3, 0x0

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    aput-object v5, v20, v3

    const/4 v3, 0x1

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    aput-object v5, v20, v3

    sget-object v21, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->FAILED:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v22, v0

    const/16 v25, 0x0

    invoke-direct/range {v17 .. v25}, Lorg/eclipse/jgit/api/MergeResult;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_d .. :try_end_d} :catch_3
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_4

    .line 413
    if-eqz v49, :cond_16

    .line 414
    invoke-virtual/range {v49 .. v49}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :cond_16
    move-object/from16 v15, v17

    goto/16 :goto_3

    .line 391
    :cond_17
    :try_start_e
    new-instance v3, Lorg/eclipse/jgit/merge/MergeMessageFormatter;

    invoke-direct {v3}, Lorg/eclipse/jgit/merge/MergeMessageFormatter;-><init>()V

    move-object/from16 v0, v39

    move-object/from16 v1, v52

    invoke-virtual {v3, v0, v1}, Lorg/eclipse/jgit/merge/MergeMessageFormatter;->formatWithConflicts(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v40

    .line 394
    .local v40, mergeMessageWithConflicts:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/eclipse/jgit/api/MergeCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v0, v40

    invoke-virtual {v3, v0}, Lorg/eclipse/jgit/lib/Repository;->writeMergeCommitMsg(Ljava/lang/String;)V

    .line 395
    new-instance v25, Lorg/eclipse/jgit/api/MergeResult;

    const/16 v26, 0x0

    invoke-virtual/range {v41 .. v41}, Lorg/eclipse/jgit/merge/Merger;->getBaseCommitId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v27

    const/4 v3, 0x2

    new-array v0, v3, [Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v28, v0

    const/4 v3, 0x0

    invoke-virtual {v6}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    aput-object v5, v28, v3

    const/4 v3, 0x1

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    aput-object v5, v28, v3

    sget-object v29, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->CONFLICTING:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    move-object/from16 v30, v0

    const/16 v32, 0x0

    move-object/from16 v31, v23

    invoke-direct/range {v25 .. v32}, Lorg/eclipse/jgit/api/MergeResult;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/lang/String;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_e .. :try_end_e} :catch_3
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_4

    .line 413
    if-eqz v49, :cond_18

    .line 414
    invoke-virtual/range {v49 .. v49}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    :cond_18
    move-object/from16 v15, v25

    goto/16 :goto_3

    .line 404
    .end local v4           #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v6           #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v23           #lowLevelResults:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult<*>;>;"
    .end local v24           #failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    .end local v37           #head:Lorg/eclipse/jgit/lib/Ref;
    .end local v38           #headId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v39           #mergeMessage:Ljava/lang/String;
    .end local v40           #mergeMessageWithConflicts:Ljava/lang/String;
    .end local v41           #merger:Lorg/eclipse/jgit/merge/Merger;
    .end local v42           #noProblems:Z
    .end local v43           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v44           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v45           #refLogMessage:Ljava/lang/StringBuilder;
    .end local v49           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .end local v52           #unmergedPaths:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .local v36, e:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    .restart local v48       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :cond_19
    :try_start_f
    invoke-virtual/range {v34 .. v34}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->getConflicts()Ljava/util/List;
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    move-result-object v33

    goto/16 :goto_1

    .line 413
    .end local v36           #e:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    .end local v48           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v37       #head:Lorg/eclipse/jgit/lib/Ref;
    .restart local v45       #refLogMessage:Ljava/lang/StringBuilder;
    .restart local v49       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :catchall_1
    move-exception v3

    move-object/from16 v48, v49

    .end local v49           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v48       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    goto/16 :goto_2

    .end local v34           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .end local v48           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v4       #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v35       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v38       #headId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v43       #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v44       #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v49       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :catchall_2
    move-exception v3

    move-object/from16 v34, v35

    .end local v35           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v34       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    move-object/from16 v48, v49

    .end local v49           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .restart local v48       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    goto/16 :goto_2

    .line 407
    .end local v4           #srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v37           #head:Lorg/eclipse/jgit/lib/Ref;
    .end local v38           #headId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v43           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v44           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v45           #refLogMessage:Ljava/lang/StringBuilder;
    :catch_5
    move-exception v36

    goto/16 :goto_5
.end method

.method public include(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/MergeCommand;
    .locals 3
    .parameter "name"
    .parameter "commit"

    .prologue
    .line 510
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;

    sget-object v1, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/MergeCommand;->include(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/api/MergeCommand;

    move-result-object v0

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/MergeCommand;
    .locals 1
    .parameter "commit"

    .prologue
    .line 499
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/api/MergeCommand;->include(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/MergeCommand;

    move-result-object v0

    return-object v0
.end method

.method public include(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/api/MergeCommand;
    .locals 1
    .parameter "commit"

    .prologue
    .line 488
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/MergeCommand;->checkCallable()V

    .line 489
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeCommand;->commits:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 490
    return-object p0
.end method

.method public setCommit(Z)Lorg/eclipse/jgit/api/MergeCommand;
    .locals 1
    .parameter "commit"

    .prologue
    .line 565
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/MergeCommand;->commit:Ljava/lang/Boolean;

    .line 566
    return-object p0
.end method

.method public setFastForward(Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;)Lorg/eclipse/jgit/api/MergeCommand;
    .locals 0
    .parameter "fastForwardMode"

    .prologue
    .line 545
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/MergeCommand;->checkCallable()V

    .line 546
    iput-object p1, p0, Lorg/eclipse/jgit/api/MergeCommand;->fastForwardMode:Lorg/eclipse/jgit/api/MergeCommand$FastForwardMode;

    .line 547
    return-object p0
.end method

.method public setSquash(Z)Lorg/eclipse/jgit/api/MergeCommand;
    .locals 1
    .parameter "squash"

    .prologue
    .line 530
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/MergeCommand;->checkCallable()V

    .line 531
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/MergeCommand;->squash:Ljava/lang/Boolean;

    .line 532
    return-object p0
.end method

.method public setStrategy(Lorg/eclipse/jgit/merge/MergeStrategy;)Lorg/eclipse/jgit/api/MergeCommand;
    .locals 0
    .parameter "mergeStrategy"

    .prologue
    .line 477
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/MergeCommand;->checkCallable()V

    .line 478
    iput-object p1, p0, Lorg/eclipse/jgit/api/MergeCommand;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 479
    return-object p0
.end method
