.class public Lorg/eclipse/jgit/api/CheckoutCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "CheckoutCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/CheckoutCommand$3;,
        Lorg/eclipse/jgit/api/CheckoutCommand$Stage;
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
.field private checkoutAllPaths:Z

.field private checkoutStage:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

.field private createBranch:Z

.field private force:Z

.field private name:Ljava/lang/String;

.field private orphan:Z

.field private paths:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

.field private startPoint:Ljava/lang/String;

.field private status:Lorg/eclipse/jgit/api/CheckoutResult;

.field private upstreamMode:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "repo"

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 182
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 158
    iput-boolean v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->force:Z

    .line 160
    iput-boolean v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->createBranch:Z

    .line 162
    iput-boolean v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->orphan:Z

    .line 166
    iput-object v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startPoint:Ljava/lang/String;

    .line 170
    iput-object v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutStage:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    .line 183
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->paths:Ljava/util/List;

    .line 184
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/api/CheckoutCommand;)Lorg/eclipse/jgit/api/CheckoutCommand$Stage;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutStage:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    return-object v0
.end method

.method static synthetic access$200(Lorg/eclipse/jgit/api/CheckoutCommand;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 128
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutPath(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V

    return-void
.end method

.method private checkOptions()V
    .locals 2

    .prologue
    .line 677
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutStage:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->isCheckoutIndex()Z

    move-result v0

    if-nez v0, :cond_0

    .line 678
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Checking out ours/theirs is only possible when checking out index, not when switching branches."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 681
    :cond_0
    return-void
.end method

.method private checkoutPath(Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 8
    .parameter "entry"
    .parameter "reader"

    .prologue
    const/4 v5, 0x1

    .line 455
    new-instance v1, Ljava/io/File;

    iget-object v3, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v3

    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 456
    .local v1, file:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .line 458
    .local v2, parentDir:Ljava/io/File;
    const/4 v3, 0x1

    :try_start_0
    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/FileUtils;->mkdirs(Ljava/io/File;Z)V

    .line 459
    iget-object v3, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-static {v3, v1, p1, p2}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkoutEntry(Lorg/eclipse/jgit/lib/Repository;Ljava/io/File;Lorg/eclipse/jgit/dircache/DirCacheEntry;Lorg/eclipse/jgit/lib/ObjectReader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 465
    return-void

    .line 460
    :catch_0
    move-exception v0

    .line 461
    .local v0, e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->checkoutConflictWithFile:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getPathString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private checkoutPathsFromCommit(Lorg/eclipse/jgit/treewalk/TreeWalk;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 8
    .parameter "treeWalk"
    .parameter "dc"
    .parameter "commit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 437
    invoke-virtual {p3}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 438
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v5

    .line 439
    .local v5, r:Lorg/eclipse/jgit/lib/ObjectReader;
    invoke-virtual {p2}, Lorg/eclipse/jgit/dircache/DirCache;->editor()Lorg/eclipse/jgit/dircache/DirCacheEditor;

    move-result-object v6

    .line 440
    .local v6, editor:Lorg/eclipse/jgit/dircache/DirCacheEditor;
    :goto_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 441
    invoke-virtual {p1, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 442
    .local v3, blobId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p1, v7}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v4

    .line 443
    .local v4, mode:Lorg/eclipse/jgit/lib/FileMode;
    new-instance v0, Lorg/eclipse/jgit/api/CheckoutCommand$2;

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v2

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/api/CheckoutCommand$2;-><init>(Lorg/eclipse/jgit/api/CheckoutCommand;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/ObjectReader;)V

    invoke-virtual {v6, v0}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->add(Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;)V

    goto :goto_0

    .line 451
    .end local v3           #blobId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v4           #mode:Lorg/eclipse/jgit/lib/FileMode;
    :cond_0
    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->commit()Z

    .line 452
    return-void
.end method

.method private checkoutPathsFromIndex(Lorg/eclipse/jgit/treewalk/TreeWalk;Lorg/eclipse/jgit/dircache/DirCache;)V
    .locals 6
    .parameter "treeWalk"
    .parameter "dc"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 404
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheIterator;

    invoke-direct {v0, p2}, Lorg/eclipse/jgit/dircache/DirCacheIterator;-><init>(Lorg/eclipse/jgit/dircache/DirCache;)V

    .line 405
    .local v0, dci:Lorg/eclipse/jgit/dircache/DirCacheIterator;
    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 407
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v3

    .line 408
    .local v3, r:Lorg/eclipse/jgit/lib/ObjectReader;
    invoke-virtual {p2}, Lorg/eclipse/jgit/dircache/DirCache;->editor()Lorg/eclipse/jgit/dircache/DirCacheEditor;

    move-result-object v1

    .line 409
    .local v1, editor:Lorg/eclipse/jgit/dircache/DirCacheEditor;
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 410
    invoke-virtual {v0}, Lorg/eclipse/jgit/dircache/DirCacheIterator;->getDirCacheEntry()Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v2

    .line 412
    .local v2, entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getStage()I

    move-result v4

    const/4 v5, 0x1

    if-gt v4, v5, :cond_0

    .line 414
    :cond_1
    new-instance v4, Lorg/eclipse/jgit/api/CheckoutCommand$1;

    invoke-virtual {p1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getPathString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p0, v5, v3}, Lorg/eclipse/jgit/api/CheckoutCommand$1;-><init>(Lorg/eclipse/jgit/api/CheckoutCommand;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectReader;)V

    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->add(Lorg/eclipse/jgit/dircache/DirCacheEditor$PathEdit;)V

    goto :goto_0

    .line 432
    .end local v2           #entry:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    :cond_2
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCacheEditor;->commit()Z

    .line 433
    return-void
.end method

.method private getBranchName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 506
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    const-string v1, "refs/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 507
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    .line 509
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "refs/heads/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getShortBranchName(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;
    .locals 2
    .parameter "headRef"

    .prologue
    .line 323
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 324
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/ObjectId;->getName()Ljava/lang/String;

    move-result-object v0

    .line 325
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private getStartPoint()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/AmbiguousObjectException;,
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 473
    iget-object v2, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v2, :cond_1

    .line 474
    iget-object v2, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 486
    :cond_0
    return-object v1

    .line 475
    :cond_1
    const/4 v1, 0x0

    .line 477
    .local v1, result:Lorg/eclipse/jgit/lib/ObjectId;
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v2, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startPoint:Ljava/lang/String;

    if-nez v2, :cond_2

    const-string v2, "HEAD"

    :goto_0
    invoke-virtual {v3, v2}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/AmbiguousObjectException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 482
    if-nez v1, :cond_0

    .line 483
    new-instance v3, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v4, v2, Lorg/eclipse/jgit/internal/JGitText;->refNotResolved:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v5, v2, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v2, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startPoint:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startPoint:Ljava/lang/String;

    :goto_1
    aput-object v2, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 477
    :cond_2
    :try_start_1
    iget-object v2, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startPoint:Ljava/lang/String;
    :try_end_1
    .catch Lorg/eclipse/jgit/errors/AmbiguousObjectException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 479
    :catch_0
    move-exception v0

    .line 480
    .local v0, e:Lorg/eclipse/jgit/errors/AmbiguousObjectException;
    throw v0

    .line 483
    .end local v0           #e:Lorg/eclipse/jgit/errors/AmbiguousObjectException;
    :cond_3
    const-string v2, "HEAD"

    goto :goto_1
.end method

.method private isCheckoutIndex()Z
    .locals 1

    .prologue
    .line 468
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startPoint:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private processOptions()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/InvalidRefNameException;,
            Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 491
    iget-boolean v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutAllPaths:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->paths:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    iget-boolean v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->orphan:Z

    if-eqz v1, :cond_4

    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "refs/heads/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/Repository;->isValidRefName(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 494
    :cond_2
    new-instance v2, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v3, v1, Lorg/eclipse/jgit/internal/JGitText;->branchNameInvalid:Ljava/lang/String;

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    if-nez v1, :cond_3

    const-string v1, "<null>"

    :goto_0
    aput-object v1, v4, v5

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lorg/eclipse/jgit/api/errors/InvalidRefNameException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_3
    iget-object v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    goto :goto_0

    .line 497
    :cond_4
    iget-boolean v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->orphan:Z

    if-eqz v1, :cond_5

    .line 498
    iget-object v1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->getBranchName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 499
    .local v0, refToCheck:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_5

    .line 500
    new-instance v1, Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->refAlreadyExists:Ljava/lang/String;

    new-array v3, v4, [Ljava/lang/Object;

    iget-object v4, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 503
    .end local v0           #refToCheck:Lorg/eclipse/jgit/lib/Ref;
    :cond_5
    return-void
.end method


# virtual methods
.method public addPath(Ljava/lang/String;)Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 1
    .parameter "path"

    .prologue
    .line 342
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkCallable()V

    .line 343
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->paths:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 344
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
    .line 128
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->call()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/lib/Ref;
    .locals 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/RefAlreadyExistsException;,
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;,
            Lorg/eclipse/jgit/api/errors/InvalidRefNameException;,
            Lorg/eclipse/jgit/api/errors/CheckoutConflictException;
        }
    .end annotation

    .prologue
    .line 202
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkCallable()V

    .line 204
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->processOptions()V

    .line 205
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutAllPaths:Z

    move/from16 v24, v0

    if-nez v24, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->paths:Ljava/util/List;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->isEmpty()Z

    move-result v24

    if-nez v24, :cond_2

    .line 206
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutPaths()Lorg/eclipse/jgit/api/CheckoutCommand;

    .line 207
    new-instance v24, Lorg/eclipse/jgit/api/CheckoutResult;

    sget-object v25, Lorg/eclipse/jgit/api/CheckoutResult$Status;->OK:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->paths:Ljava/util/List;

    move-object/from16 v26, v0

    invoke-direct/range {v24 .. v26}, Lorg/eclipse/jgit/api/CheckoutResult;-><init>(Lorg/eclipse/jgit/api/CheckoutResult$Status;Ljava/util/List;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    .line 208
    const/16 v24, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/CheckoutCommand;->setCallable(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    const/16 v17, 0x0

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    move-object/from16 v24, v0

    if-nez v24, :cond_1

    .line 318
    sget-object v24, Lorg/eclipse/jgit/api/CheckoutResult;->ERROR_RESULT:Lorg/eclipse/jgit/api/CheckoutResult;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    :cond_1
    :goto_0
    return-object v17

    .line 212
    :cond_2
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->createBranch:Z

    move/from16 v24, v0

    if-eqz v24, :cond_4

    .line 213
    new-instance v8, Lorg/eclipse/jgit/api/Git;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-direct {v8, v0}, Lorg/eclipse/jgit/api/Git;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 214
    .local v8, git:Lorg/eclipse/jgit/api/Git;
    invoke-virtual {v8}, Lorg/eclipse/jgit/api/Git;->branchCreate()Lorg/eclipse/jgit/api/CreateBranchCommand;

    move-result-object v4

    .line 215
    .local v4, command:Lorg/eclipse/jgit/api/CreateBranchCommand;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->setName(Ljava/lang/String;)Lorg/eclipse/jgit/api/CreateBranchCommand;

    .line 216
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->getStartPoint()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->setStartPoint(Ljava/lang/String;)Lorg/eclipse/jgit/api/CreateBranchCommand;

    .line 217
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->upstreamMode:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    move-object/from16 v24, v0

    if-eqz v24, :cond_3

    .line 218
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->upstreamMode:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/api/CreateBranchCommand;->setUpstreamMode(Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;)Lorg/eclipse/jgit/api/CreateBranchCommand;

    .line 219
    :cond_3
    invoke-virtual {v4}, Lorg/eclipse/jgit/api/CreateBranchCommand;->call()Lorg/eclipse/jgit/lib/Ref;

    .line 222
    .end local v4           #command:Lorg/eclipse/jgit/api/CreateBranchCommand;
    .end local v8           #git:Lorg/eclipse/jgit/api/Git;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const-string v25, "HEAD"

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v11

    .line 223
    .local v11, headRef:Lorg/eclipse/jgit/lib/Ref;
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/eclipse/jgit/api/CheckoutCommand;->getShortBranchName(Lorg/eclipse/jgit/lib/Ref;)Ljava/lang/String;

    move-result-object v21

    .line 224
    .local v21, shortHeadRef:Ljava/lang/String;
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "checkout: moving from "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 226
    .local v18, refLogMessage:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->orphan:Z

    move/from16 v24, v0

    if-eqz v24, :cond_a

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->startPoint:Ljava/lang/String;

    move-object/from16 v24, v0

    if-nez v24, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v24, v0

    if-nez v24, :cond_7

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const-string v25, "HEAD"

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v24

    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->getBranchName()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/RefUpdate;->link(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v16

    .line 230
    .local v16, r:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    sget-object v24, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NEW:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    sget-object v25, Lorg/eclipse/jgit/lib/RefUpdate$Result;->FORCED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-static/range {v24 .. v25}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_6

    .line 231
    new-instance v24, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->checkoutUnexpectedResult:Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    invoke-virtual/range {v16 .. v16}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->name()Ljava/lang/String;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-static/range {v25 .. v26}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v24
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 314
    .end local v11           #headRef:Lorg/eclipse/jgit/lib/Ref;
    .end local v16           #r:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .end local v18           #refLogMessage:Ljava/lang/String;
    .end local v21           #shortHeadRef:Ljava/lang/String;
    :catch_0
    move-exception v13

    .line 315
    .local v13, ioe:Ljava/io/IOException;
    :try_start_2
    new-instance v24, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v13}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v13}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v24
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 317
    .end local v13           #ioe:Ljava/io/IOException;
    :catchall_0
    move-exception v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    move-object/from16 v25, v0

    if-nez v25, :cond_5

    .line 318
    sget-object v25, Lorg/eclipse/jgit/api/CheckoutResult;->ERROR_RESULT:Lorg/eclipse/jgit/api/CheckoutResult;

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    :cond_5
    throw v24

    .line 234
    .restart local v11       #headRef:Lorg/eclipse/jgit/lib/Ref;
    .restart local v16       #r:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .restart local v18       #refLogMessage:Ljava/lang/String;
    .restart local v21       #shortHeadRef:Ljava/lang/String;
    :cond_6
    :try_start_3
    sget-object v24, Lorg/eclipse/jgit/api/CheckoutResult;->NOT_TRIED_RESULT:Lorg/eclipse/jgit/api/CheckoutResult;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const-string v25, "HEAD"

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v17

    .line 317
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    move-object/from16 v24, v0

    if-nez v24, :cond_1

    .line 318
    sget-object v24, Lorg/eclipse/jgit/api/CheckoutResult;->ERROR_RESULT:Lorg/eclipse/jgit/api/CheckoutResult;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    goto/16 :goto_0

    .line 237
    .end local v16           #r:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :cond_7
    :try_start_4
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->getStartPoint()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 245
    .local v3, branch:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_8
    new-instance v20, Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 246
    .local v20, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    invoke-interface {v11}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v10

    .line 247
    .local v10, headId:Lorg/eclipse/jgit/lib/AnyObjectId;
    if-nez v10, :cond_b

    const/4 v9, 0x0

    .line 249
    .local v9, headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_1
    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v14

    .line 250
    .local v14, newCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v9, :cond_c

    const/4 v12, 0x0

    .line 252
    .local v12, headTree:Lorg/eclipse/jgit/revwalk/RevTree;
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    move-result-object v5

    .line 254
    .local v5, dc:Lorg/eclipse/jgit/dircache/DirCache;
    :try_start_5
    new-instance v6, Lorg/eclipse/jgit/dircache/DirCacheCheckout;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    invoke-virtual {v14}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v6, v0, v12, v5, v1}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;-><init>(Lorg/eclipse/jgit/lib/Repository;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 256
    .local v6, dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    const/16 v24, 0x1

    move/from16 v0, v24

    invoke-virtual {v6, v0}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->setFailOnConflict(Z)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 258
    :try_start_6
    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->checkout()Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1
    .catch Lorg/eclipse/jgit/errors/CheckoutConflictException; {:try_start_6 .. :try_end_6} :catch_1

    .line 265
    :try_start_7
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v17

    .line 268
    .local v17, ref:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v17, :cond_9

    invoke-interface/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v24

    const-string v25, "refs/heads/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-nez v24, :cond_9

    .line 269
    const/16 v17, 0x0

    .line 270
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-static/range {v24 .. v24}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 271
    .local v22, toName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v25, v0

    const-string v26, "HEAD"

    if-nez v17, :cond_d

    const/16 v24, 0x1

    :goto_3
    move-object/from16 v0, v25

    move-object/from16 v1, v26

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v19

    .line 272
    .local v19, refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->force:Z

    move/from16 v24, v0

    move-object/from16 v0, v19

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setForceUpdate(Z)V

    .line 273
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, " to "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 275
    if-eqz v17, :cond_e

    .line 276
    invoke-interface/range {v17 .. v17}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->link(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v23

    .line 285
    .local v23, updateResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :goto_4
    const/16 v24, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/api/CheckoutCommand;->setCallable(Z)V

    .line 287
    const/4 v15, 0x0

    .line 288
    .local v15, ok:Z
    sget-object v24, Lorg/eclipse/jgit/api/CheckoutCommand$3;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v25

    aget v24, v24, v25

    packed-switch v24, :pswitch_data_0

    .line 301
    :goto_5
    if-nez v15, :cond_10

    .line 302
    new-instance v24, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->checkoutUnexpectedResult:Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    invoke-virtual/range {v23 .. v23}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->name()Ljava/lang/String;

    move-result-object v28

    aput-object v28, v26, v27

    invoke-static/range {v25 .. v26}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 239
    .end local v3           #branch:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v5           #dc:Lorg/eclipse/jgit/dircache/DirCache;
    .end local v6           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .end local v9           #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v10           #headId:Lorg/eclipse/jgit/lib/AnyObjectId;
    .end local v12           #headTree:Lorg/eclipse/jgit/revwalk/RevTree;
    .end local v14           #newCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v15           #ok:Z
    .end local v17           #ref:Lorg/eclipse/jgit/lib/Ref;
    .end local v19           #refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    .end local v20           #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    .end local v22           #toName:Ljava/lang/String;
    .end local v23           #updateResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 240
    .restart local v3       #branch:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v3, :cond_8

    .line 241
    new-instance v24, Lorg/eclipse/jgit/api/errors/RefNotFoundException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v25

    move-object/from16 v0, v25

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->refNotResolved:Ljava/lang/String;

    move-object/from16 v25, v0

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    move-object/from16 v28, v0

    aput-object v28, v26, v27

    invoke-static/range {v25 .. v26}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lorg/eclipse/jgit/api/errors/RefNotFoundException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 247
    .restart local v10       #headId:Lorg/eclipse/jgit/lib/AnyObjectId;
    .restart local v20       #revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    :cond_b
    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v9

    goto/16 :goto_1

    .line 250
    .restart local v9       #headCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v14       #newCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_c
    invoke-virtual {v9}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0

    move-result-object v12

    goto/16 :goto_2

    .line 259
    .restart local v5       #dc:Lorg/eclipse/jgit/dircache/DirCache;
    .restart local v6       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v12       #headTree:Lorg/eclipse/jgit/revwalk/RevTree;
    :catch_1
    move-exception v7

    .line 260
    .local v7, e:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    :try_start_8
    new-instance v24, Lorg/eclipse/jgit/api/CheckoutResult;

    sget-object v25, Lorg/eclipse/jgit/api/CheckoutResult$Status;->CONFLICTS:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->getConflicts()Ljava/util/List;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Lorg/eclipse/jgit/api/CheckoutResult;-><init>(Lorg/eclipse/jgit/api/CheckoutResult$Status;Ljava/util/List;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    .line 262
    new-instance v24, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;

    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->getConflicts()Ljava/util/List;

    move-result-object v25

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/api/errors/CheckoutConflictException;-><init>(Ljava/util/List;Lorg/eclipse/jgit/errors/CheckoutConflictException;)V

    throw v24
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 265
    .end local v6           #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .end local v7           #e:Lorg/eclipse/jgit/errors/CheckoutConflictException;
    :catchall_1
    move-exception v24

    :try_start_9
    invoke-virtual {v5}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    throw v24

    .line 271
    .restart local v6       #dco:Lorg/eclipse/jgit/dircache/DirCacheCheckout;
    .restart local v17       #ref:Lorg/eclipse/jgit/lib/Ref;
    .restart local v22       #toName:Ljava/lang/String;
    :cond_d
    const/16 v24, 0x0

    goto/16 :goto_3

    .line 277
    .restart local v19       #refUpdate:Lorg/eclipse/jgit/lib/RefUpdate;
    :cond_e
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->orphan:Z

    move/from16 v24, v0

    if-eqz v24, :cond_f

    .line 278
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->getBranchName()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->link(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v23

    .line 279
    .restart local v23       #updateResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    move-object/from16 v24, v0

    const-string v25, "HEAD"

    invoke-virtual/range {v24 .. v25}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v17

    goto/16 :goto_4

    .line 281
    .end local v23           #updateResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :cond_f
    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 282
    invoke-virtual/range {v19 .. v19}, Lorg/eclipse/jgit/lib/RefUpdate;->forceUpdate()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v23

    .restart local v23       #updateResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    goto/16 :goto_4

    .line 290
    .restart local v15       #ok:Z
    :pswitch_0
    const/4 v15, 0x1

    .line 291
    goto/16 :goto_5

    .line 295
    :pswitch_1
    const/4 v15, 0x1

    .line 296
    goto/16 :goto_5

    .line 306
    :cond_10
    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->getToBeDeleted()Ljava/util/List;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->isEmpty()Z

    move-result v24

    if-nez v24, :cond_11

    .line 307
    new-instance v24, Lorg/eclipse/jgit/api/CheckoutResult;

    sget-object v25, Lorg/eclipse/jgit/api/CheckoutResult$Status;->NONDELETED:Lorg/eclipse/jgit/api/CheckoutResult$Status;

    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->getToBeDeleted()Ljava/util/List;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Lorg/eclipse/jgit/api/CheckoutResult;-><init>(Lorg/eclipse/jgit/api/CheckoutResult$Status;Ljava/util/List;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0

    .line 317
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    move-object/from16 v24, v0

    if-nez v24, :cond_1

    .line 318
    sget-object v24, Lorg/eclipse/jgit/api/CheckoutResult;->ERROR_RESULT:Lorg/eclipse/jgit/api/CheckoutResult;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    goto/16 :goto_0

    .line 310
    :cond_11
    :try_start_a
    new-instance v24, Lorg/eclipse/jgit/api/CheckoutResult;

    new-instance v25, Ljava/util/ArrayList;

    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->getUpdated()Ljava/util/Map;

    move-result-object v26

    invoke-interface/range {v26 .. v26}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v6}, Lorg/eclipse/jgit/dircache/DirCacheCheckout;->getRemoved()Ljava/util/List;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Lorg/eclipse/jgit/api/CheckoutResult;-><init>(Ljava/util/List;Ljava/util/List;)V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0

    goto :goto_6

    .line 288
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method protected checkoutPaths()Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/RefNotFoundException;
        }
    .end annotation

    .prologue
    .line 378
    new-instance v2, Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v4, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v2, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 379
    .local v2, revWalk:Lorg/eclipse/jgit/revwalk/RevWalk;
    iget-object v4, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v1

    .line 381
    .local v1, dc:Lorg/eclipse/jgit/dircache/DirCache;
    :try_start_0
    new-instance v3, Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 382
    .local v3, treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 383
    iget-boolean v4, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutAllPaths:Z

    if-nez v4, :cond_0

    .line 384
    iget-object v4, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->paths:Ljava/util/List;

    invoke-static {v4}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->createFromStrings(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 386
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->isCheckoutIndex()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 387
    invoke-direct {p0, v3, v1}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutPathsFromIndex(Lorg/eclipse/jgit/treewalk/TreeWalk;Lorg/eclipse/jgit/dircache/DirCache;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 393
    :goto_0
    :try_start_2
    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 396
    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 397
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 399
    return-object p0

    .line 389
    :cond_1
    :try_start_3
    invoke-direct {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->getStartPoint()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 390
    .local v0, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-direct {p0, v3, v1, v0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutPathsFromCommit(Lorg/eclipse/jgit/treewalk/TreeWalk;Lorg/eclipse/jgit/dircache/DirCache;Lorg/eclipse/jgit/revwalk/RevCommit;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 393
    .end local v0           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :catchall_0
    move-exception v4

    :try_start_4
    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/TreeWalk;->release()V

    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 396
    .end local v3           #treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;
    :catchall_1
    move-exception v4

    invoke-virtual {v1}, Lorg/eclipse/jgit/dircache/DirCache;->unlock()V

    .line 397
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    throw v4
.end method

.method public getResult()Lorg/eclipse/jgit/api/CheckoutResult;
    .locals 1

    .prologue
    .line 671
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    if-nez v0, :cond_0

    .line 672
    sget-object v0, Lorg/eclipse/jgit/api/CheckoutResult;->NOT_TRIED_RESULT:Lorg/eclipse/jgit/api/CheckoutResult;

    .line 673
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->status:Lorg/eclipse/jgit/api/CheckoutResult;

    goto :goto_0
.end method

.method public setAllPaths(Z)Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 0
    .parameter "all"

    .prologue
    .line 365
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutAllPaths:Z

    .line 366
    return-object p0
.end method

.method public setCreateBranch(Z)Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 0
    .parameter "createBranch"

    .prologue
    .line 550
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkCallable()V

    .line 551
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->createBranch:Z

    .line 552
    return-object p0
.end method

.method public setForce(Z)Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 0
    .parameter "force"

    .prologue
    .line 586
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkCallable()V

    .line 587
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->force:Z

    .line 588
    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 0
    .parameter "name"

    .prologue
    .line 530
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkCallable()V

    .line 531
    iput-object p1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->name:Ljava/lang/String;

    .line 532
    return-object p0
.end method

.method public setOrphan(Z)Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 0
    .parameter "orphan"

    .prologue
    .line 570
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkCallable()V

    .line 571
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->orphan:Z

    .line 572
    return-object p0
.end method

.method public setStage(Lorg/eclipse/jgit/api/CheckoutCommand$Stage;)Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 0
    .parameter "stage"

    .prologue
    .line 661
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkCallable()V

    .line 662
    iput-object p1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->checkoutStage:Lorg/eclipse/jgit/api/CheckoutCommand$Stage;

    .line 663
    invoke-direct {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkOptions()V

    .line 664
    return-object p0
.end method

.method public setStartPoint(Ljava/lang/String;)Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 1
    .parameter "startPoint"

    .prologue
    .line 605
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkCallable()V

    .line 606
    iput-object p1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startPoint:Ljava/lang/String;

    .line 607
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 608
    invoke-direct {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkOptions()V

    .line 609
    return-object p0
.end method

.method public setStartPoint(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 1
    .parameter "startCommit"

    .prologue
    .line 626
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkCallable()V

    .line 627
    iput-object p1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 628
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->startPoint:Ljava/lang/String;

    .line 629
    invoke-direct {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkOptions()V

    .line 630
    return-object p0
.end method

.method public setUpstreamMode(Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;)Lorg/eclipse/jgit/api/CheckoutCommand;
    .locals 0
    .parameter "mode"

    .prologue
    .line 644
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/CheckoutCommand;->checkCallable()V

    .line 645
    iput-object p1, p0, Lorg/eclipse/jgit/api/CheckoutCommand;->upstreamMode:Lorg/eclipse/jgit/api/CreateBranchCommand$SetupUpstreamMode;

    .line 646
    return-object p0
.end method
