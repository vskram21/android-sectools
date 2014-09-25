.class public abstract Lorg/eclipse/jgit/lib/RefUpdate;
.super Ljava/lang/Object;
.source "RefUpdate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/RefUpdate$Result;,
        Lorg/eclipse/jgit/lib/RefUpdate$Store;
    }
.end annotation


# instance fields
.field private checkConflicting:Z

.field private detachingSymbolicRef:Z

.field private expValue:Lorg/eclipse/jgit/lib/ObjectId;

.field private force:Z

.field private newValue:Lorg/eclipse/jgit/lib/ObjectId;

.field private oldValue:Lorg/eclipse/jgit/lib/ObjectId;

.field private final ref:Lorg/eclipse/jgit/lib/Ref;

.field private refLogIdent:Lorg/eclipse/jgit/lib/PersonIdent;

.field private refLogIncludeResult:Z

.field private refLogMessage:Ljava/lang/String;

.field private result:Lorg/eclipse/jgit/lib/RefUpdate$Result;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Ref;)V
    .locals 1
    .parameter "ref"

    .prologue
    .line 192
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 166
    sget-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 181
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->checkConflicting:Z

    .line 193
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RefUpdate;->ref:Lorg/eclipse/jgit/lib/Ref;

    .line 194
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->oldValue:Lorg/eclipse/jgit/lib/ObjectId;

    .line 195
    const-string v0, ""

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->refLogMessage:Ljava/lang/String;

    .line 196
    return-void
.end method

.method private requireCanDoUpdate()V
    .locals 2

    .prologue
    .line 428
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->newValue:Lorg/eclipse/jgit/lib/ObjectId;

    if-nez v0, :cond_0

    .line 429
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->aNewObjectIdIsRequired:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 430
    :cond_0
    return-void
.end method

.method private static safeParse(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 2
    .parameter "rw"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 651
    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 658
    :cond_0
    :goto_0
    return-object v1

    .line 652
    :catch_0
    move-exception v0

    .line 658
    .local v0, e:Lorg/eclipse/jgit/errors/MissingObjectException;
    goto :goto_0
.end method

.method private updateImpl(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/RefUpdate$Store;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 5
    .parameter "walk"
    .parameter "store"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 604
    iget-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->oldValue:Lorg/eclipse/jgit/lib/ObjectId;

    if-nez v3, :cond_0

    iget-boolean v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->checkConflicting:Z

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefDatabase;->isNameConflicting(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 605
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 633
    :goto_0
    return-object v3

    .line 607
    :cond_0
    const/4 v3, 0x1

    :try_start_0
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->tryLock(Z)Z

    move-result v3

    if-nez v3, :cond_1

    .line 608
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 633
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    goto :goto_0

    .line 609
    :cond_1
    :try_start_1
    iget-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->expValue:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v3, :cond_3

    .line 611
    iget-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->oldValue:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v3, :cond_2

    iget-object v1, p0, Lorg/eclipse/jgit/lib/RefUpdate;->oldValue:Lorg/eclipse/jgit/lib/ObjectId;

    .line 612
    .local v1, o:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_1
    iget-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->expValue:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-static {v3, v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 613
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 633
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    goto :goto_0

    .line 611
    .end local v1           #o:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_2
    :try_start_2
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    goto :goto_1

    .line 615
    :cond_3
    iget-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->oldValue:Lorg/eclipse/jgit/lib/ObjectId;

    if-nez v3, :cond_4

    .line 616
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {p2, v3}, Lorg/eclipse/jgit/lib/RefUpdate$Store;->execute(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .line 633
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    goto :goto_0

    .line 618
    :cond_4
    :try_start_3
    iget-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->newValue:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-static {p1, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->safeParse(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    .line 619
    .local v0, newObj:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->oldValue:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-static {p1, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->safeParse(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v2

    .line 620
    .local v2, oldObj:Lorg/eclipse/jgit/revwalk/RevObject;
    if-ne v0, v2, :cond_5

    iget-boolean v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->detachingSymbolicRef:Z

    if-nez v3, :cond_5

    .line 621
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NO_CHANGE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {p2, v3}, Lorg/eclipse/jgit/lib/RefUpdate$Store;->execute(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v3

    .line 633
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    goto :goto_0

    .line 623
    :cond_5
    :try_start_4
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->isForceUpdate()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 624
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FORCED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {p2, v3}, Lorg/eclipse/jgit/lib/RefUpdate$Store;->execute(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v3

    .line 633
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    goto :goto_0

    .line 626
    :cond_6
    :try_start_5
    instance-of v3, v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v3, :cond_7

    instance-of v3, v2, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v3, :cond_7

    .line 627
    check-cast v2, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v2           #oldObj:Lorg/eclipse/jgit/revwalk/RevObject;
    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v0           #newObj:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {p1, v2, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 628
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FAST_FORWARD:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {p2, v3}, Lorg/eclipse/jgit/lib/RefUpdate$Store;->execute(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-object v3

    .line 633
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    goto :goto_0

    .line 631
    :cond_7
    :try_start_6
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->REJECTED:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 633
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    goto/16 :goto_0

    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    throw v3
.end method


# virtual methods
.method public delete()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 513
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 515
    .local v0, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/RefUpdate;->delete(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 517
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v1
.end method

.method public delete(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 5
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 531
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    .line 532
    .local v1, myName:Ljava/lang/String;
    const-string v3, "refs/heads/"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 533
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v3

    const-string v4, "HEAD"

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefDatabase;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 534
    .local v0, head:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 535
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 536
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 537
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->REJECTED_CURRENT_BRANCH:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    iput-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 542
    .end local v0           #head:Lorg/eclipse/jgit/lib/Ref;
    :goto_0
    return-object v3

    :cond_1
    :try_start_0
    new-instance v3, Lorg/eclipse/jgit/lib/RefUpdate$2;

    invoke-direct {v3, p0}, Lorg/eclipse/jgit/lib/RefUpdate$2;-><init>(Lorg/eclipse/jgit/lib/RefUpdate;)V

    invoke-direct {p0, p1, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->updateImpl(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/RefUpdate$Store;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 548
    :catch_0
    move-exception v2

    .line 549
    .local v2, x:Ljava/io/IOException;
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->IO_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    iput-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 550
    throw v2
.end method

.method public disableRefLog()V
    .locals 1

    .prologue
    .line 387
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->refLogMessage:Ljava/lang/String;

    .line 388
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->refLogIncludeResult:Z

    .line 389
    return-void
.end method

.method protected abstract doDelete(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract doLink(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract doUpdate(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 443
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->force:Z

    .line 444
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->update()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v0

    return-object v0
.end method

.method public getExpectedOldObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 293
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->expValue:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 252
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 266
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->newValue:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getOldObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 403
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->oldValue:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getRef()Lorg/eclipse/jgit/lib/Ref;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->ref:Lorg/eclipse/jgit/lib/Ref;

    return-object v0
.end method

.method protected abstract getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;
.end method

.method public getRefLogIdent()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 328
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->refLogIdent:Lorg/eclipse/jgit/lib/PersonIdent;

    return-object v0
.end method

.method public getRefLogMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 354
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->refLogMessage:Ljava/lang/String;

    return-object v0
.end method

.method protected abstract getRepository()Lorg/eclipse/jgit/lib/Repository;
.end method

.method public getResult()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 1

    .prologue
    .line 424
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    return-object v0
.end method

.method public isForceUpdate()Z
    .locals 1

    .prologue
    .line 313
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->force:Z

    return v0
.end method

.method protected isRefLogIncludingResult()Z
    .locals 1

    .prologue
    .line 359
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->refLogIncludeResult:Z

    return v0
.end method

.method public link(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 8
    .parameter "target"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 567
    const-string v3, "refs/"

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 568
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->illegalArgumentNotA:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "refs/"

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 569
    :cond_0
    iget-boolean v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->checkConflicting:Z

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefDatabase;->isNameConflicting(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 570
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 594
    :goto_0
    return-object v3

    .line 572
    :cond_1
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->tryLock(Z)Z

    move-result v3

    if-nez v3, :cond_2

    .line 573
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 594
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    goto :goto_0

    .line 575
    :cond_2
    :try_start_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/RefDatabase;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    .line 576
    .local v1, old:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v1, :cond_3

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 577
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 578
    .local v0, dst:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 579
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NO_CHANGE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    iput-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 594
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    goto :goto_0

    .line 582
    .end local v0           #dst:Lorg/eclipse/jgit/lib/Ref;
    :cond_3
    if-eqz v1, :cond_4

    :try_start_2
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 583
    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->setOldObjectId(Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 585
    :cond_4
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/lib/RefDatabase;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 586
    .restart local v0       #dst:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_5

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 587
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 589
    :cond_5
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/lib/RefUpdate;->doLink(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 594
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    goto :goto_0

    .line 590
    .end local v0           #dst:Lorg/eclipse/jgit/lib/Ref;
    .end local v1           #old:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v2

    .line 591
    .local v2, x:Ljava/io/IOException;
    :try_start_3
    sget-object v3, Lorg/eclipse/jgit/lib/RefUpdate$Result;->IO_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    iput-object v3, p0, Lorg/eclipse/jgit/lib/RefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 592
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 594
    .end local v2           #x:Ljava/io/IOException;
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->unlock()V

    throw v3
.end method

.method public setCheckConflicting(Z)V
    .locals 0
    .parameter "check"

    .prologue
    .line 645
    iput-boolean p1, p0, Lorg/eclipse/jgit/lib/RefUpdate;->checkConflicting:Z

    .line 646
    return-void
.end method

.method public setDetachingSymbolicRef()V
    .locals 1

    .prologue
    .line 273
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->detachingSymbolicRef:Z

    .line 274
    return-void
.end method

.method public setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "id"

    .prologue
    .line 304
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->expValue:Lorg/eclipse/jgit/lib/ObjectId;

    .line 305
    return-void

    .line 304
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setForceUpdate(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 323
    iput-boolean p1, p0, Lorg/eclipse/jgit/lib/RefUpdate;->force:Z

    .line 324
    return-void
.end method

.method public setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "id"

    .prologue
    .line 283
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->newValue:Lorg/eclipse/jgit/lib/ObjectId;

    .line 284
    return-void
.end method

.method protected setOldObjectId(Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 0
    .parameter "old"

    .prologue
    .line 413
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RefUpdate;->oldValue:Lorg/eclipse/jgit/lib/ObjectId;

    .line 414
    return-void
.end method

.method public setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)V
    .locals 0
    .parameter "pi"

    .prologue
    .line 344
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RefUpdate;->refLogIdent:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 345
    return-void
.end method

.method public setRefLogMessage(Ljava/lang/String;Z)V
    .locals 1
    .parameter "msg"
    .parameter "appendStatus"

    .prologue
    .line 374
    if-nez p1, :cond_0

    if-nez p2, :cond_0

    .line 375
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->disableRefLog()V

    .line 383
    :goto_0
    return-void

    .line 376
    :cond_0
    if-nez p1, :cond_1

    if-eqz p2, :cond_1

    .line 377
    const-string v0, ""

    iput-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->refLogMessage:Ljava/lang/String;

    .line 378
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/RefUpdate;->refLogIncludeResult:Z

    goto :goto_0

    .line 380
    :cond_1
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RefUpdate;->refLogMessage:Ljava/lang/String;

    .line 381
    iput-boolean p2, p0, Lorg/eclipse/jgit/lib/RefUpdate;->refLogIncludeResult:Z

    goto :goto_0
.end method

.method protected abstract tryLock(Z)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract unlock()V
.end method

.method public update()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 463
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 465
    .local v0, rw:Lorg/eclipse/jgit/revwalk/RevWalk;
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 467
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v1
.end method

.method public update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 2
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 484
    invoke-direct {p0}, Lorg/eclipse/jgit/lib/RefUpdate;->requireCanDoUpdate()V

    .line 486
    :try_start_0
    new-instance v1, Lorg/eclipse/jgit/lib/RefUpdate$1;

    invoke-direct {v1, p0}, Lorg/eclipse/jgit/lib/RefUpdate$1;-><init>(Lorg/eclipse/jgit/lib/RefUpdate;)V

    invoke-direct {p0, p1, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->updateImpl(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/RefUpdate$Store;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/lib/RefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 494
    :catch_0
    move-exception v0

    .line 495
    .local v0, x:Ljava/io/IOException;
    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->IO_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    iput-object v1, p0, Lorg/eclipse/jgit/lib/RefUpdate;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 496
    throw v0
.end method
