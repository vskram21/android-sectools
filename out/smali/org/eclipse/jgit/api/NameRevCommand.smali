.class public Lorg/eclipse/jgit/api/NameRevCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "NameRevCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/Map",
        "<",
        "Lorg/eclipse/jgit/lib/ObjectId;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# static fields
.field private static final COMMIT_TIME_SLOP:I = 0x15180

.field private static final MERGE_COST:I = 0xffff


# instance fields
.field private mergeCost:I

.field private final prefixes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private refs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end field

.field private final revs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private final walk:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "repo"

    .prologue
    const/4 v1, 0x2

    .line 125
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 126
    const v0, 0xffff

    iput v0, p0, Lorg/eclipse/jgit/api/NameRevCommand;->mergeCost:I

    .line 127
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/NameRevCommand;->prefixes:Ljava/util/List;

    .line 128
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/NameRevCommand;->revs:Ljava/util/List;

    .line 129
    new-instance v0, Lorg/eclipse/jgit/api/NameRevCommand$1;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/api/NameRevCommand$1;-><init>(Lorg/eclipse/jgit/api/NameRevCommand;Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/NameRevCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 135
    return-void
.end method

.method private addPrefix(Ljava/lang/String;Ljava/util/Map;Lorg/eclipse/jgit/revwalk/FIFORevQueue;)V
    .locals 3
    .parameter "prefix"
    .parameter
    .parameter "pending"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Ljava/lang/String;",
            ">;",
            "Lorg/eclipse/jgit/revwalk/FIFORevQueue;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 326
    .local p2, nonCommits:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/api/NameRevCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/Ref;

    .line 327
    .local v1, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-direct {p0, v1, p2, p3}, Lorg/eclipse/jgit/api/NameRevCommand;->addRef(Lorg/eclipse/jgit/lib/Ref;Ljava/util/Map;Lorg/eclipse/jgit/revwalk/FIFORevQueue;)V

    goto :goto_0

    .line 328
    .end local v1           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_0
    return-void
.end method

.method private addPrefixes(Ljava/util/Map;Lorg/eclipse/jgit/revwalk/FIFORevQueue;)V
    .locals 3
    .parameter
    .parameter "pending"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Ljava/lang/String;",
            ">;",
            "Lorg/eclipse/jgit/revwalk/FIFORevQueue;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 317
    .local p1, nonCommits:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/api/NameRevCommand;->prefixes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 318
    iget-object v2, p0, Lorg/eclipse/jgit/api/NameRevCommand;->prefixes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 319
    .local v1, prefix:Ljava/lang/String;
    invoke-direct {p0, v1, p1, p2}, Lorg/eclipse/jgit/api/NameRevCommand;->addPrefix(Ljava/lang/String;Ljava/util/Map;Lorg/eclipse/jgit/revwalk/FIFORevQueue;)V

    goto :goto_0

    .line 320
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #prefix:Ljava/lang/String;
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/api/NameRevCommand;->refs:Ljava/util/List;

    if-nez v2, :cond_1

    .line 321
    const-string v2, "refs/"

    invoke-direct {p0, v2, p1, p2}, Lorg/eclipse/jgit/api/NameRevCommand;->addPrefix(Ljava/lang/String;Ljava/util/Map;Lorg/eclipse/jgit/revwalk/FIFORevQueue;)V

    .line 322
    :cond_1
    return-void
.end method

.method private addRef(Lorg/eclipse/jgit/lib/Ref;Ljava/util/Map;Lorg/eclipse/jgit/revwalk/FIFORevQueue;)V
    .locals 5
    .parameter "ref"
    .parameter
    .parameter "pending"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Ref;",
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Ljava/lang/String;",
            ">;",
            "Lorg/eclipse/jgit/revwalk/FIFORevQueue;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 332
    .local p2, nonCommits:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    if-nez v3, :cond_1

    .line 348
    :cond_0
    :goto_0
    return-void

    .line 334
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/api/NameRevCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    .line 335
    .local v1, o:Lorg/eclipse/jgit/revwalk/RevObject;
    :goto_1
    instance-of v3, v1, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v3, :cond_2

    move-object v2, v1

    .line 336
    check-cast v2, Lorg/eclipse/jgit/revwalk/RevTag;

    .line 337
    .local v2, t:Lorg/eclipse/jgit/revwalk/RevTag;
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    invoke-virtual {v2}, Lorg/eclipse/jgit/revwalk/RevTag;->getObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    .line 339
    iget-object v3, p0, Lorg/eclipse/jgit/api/NameRevCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v3, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_1

    .line 341
    .end local v2           #t:Lorg/eclipse/jgit/revwalk/RevTag;
    :cond_2
    instance-of v3, v1, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;

    if-eqz v3, :cond_4

    move-object v0, v1

    .line 342
    check-cast v0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;

    .line 343
    .local v0, c:Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;
    #getter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;
    invoke-static {v0}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$200(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    .line 344
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    #setter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;
    invoke-static {v0, v3}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$202(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;Ljava/lang/String;)Ljava/lang/String;

    .line 345
    :cond_3
    invoke-virtual {p3, v0}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_0

    .line 346
    .end local v0           #c:Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;
    :cond_4
    invoke-interface {p2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 347
    invoke-interface {p1}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private compare(Ljava/lang/String;JLjava/lang/String;J)J
    .locals 8
    .parameter "leftTip"
    .parameter "leftCost"
    .parameter "rightTip"
    .parameter "rightCost"

    .prologue
    .line 368
    sub-long v0, p2, p5

    .line 369
    .local v0, c:J
    const-wide/16 v6, 0x0

    cmp-long v6, v0, v6

    if-nez v6, :cond_0

    iget-object v6, p0, Lorg/eclipse/jgit/api/NameRevCommand;->prefixes:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 382
    .end local v0           #c:J
    :cond_0
    :goto_0
    return-wide v0

    .line 371
    .restart local v0       #c:J
    :cond_1
    const/4 v3, -0x1

    .line 372
    .local v3, li:I
    const/4 v5, -0x1

    .line 373
    .local v5, ri:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    iget-object v6, p0, Lorg/eclipse/jgit/api/NameRevCommand;->prefixes:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v2, v6, :cond_4

    .line 374
    iget-object v6, p0, Lorg/eclipse/jgit/api/NameRevCommand;->prefixes:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 375
    .local v4, prefix:Ljava/lang/String;
    if-gez v3, :cond_2

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 376
    move v3, v2

    .line 377
    :cond_2
    if-gez v5, :cond_3

    invoke-virtual {p4, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 378
    move v5, v2

    .line 373
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 382
    .end local v4           #prefix:Ljava/lang/String;
    :cond_4
    sub-int v6, v3, v5

    int-to-long v0, v6

    goto :goto_0
.end method

.method private minCommitTime()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 351
    const v3, 0x7fffffff

    .line 352
    .local v3, min:I
    iget-object v5, p0, Lorg/eclipse/jgit/api/NameRevCommand;->revs:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 353
    .local v2, id:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v5, p0, Lorg/eclipse/jgit/api/NameRevCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v5, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    .line 354
    .local v4, o:Lorg/eclipse/jgit/revwalk/RevObject;
    :goto_1
    instance-of v5, v4, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v5, :cond_1

    .line 355
    check-cast v4, Lorg/eclipse/jgit/revwalk/RevTag;

    .end local v4           #o:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevTag;->getObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    .line 356
    .restart local v4       #o:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v5, p0, Lorg/eclipse/jgit/api/NameRevCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v5, v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_1

    .line 358
    :cond_1
    instance-of v5, v4, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v5, :cond_0

    move-object v0, v4

    .line 359
    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 360
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v5

    if-ge v5, v3, :cond_0

    .line 361
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v3

    goto :goto_0

    .line 364
    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v4           #o:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_2
    return v3
.end method

.method private static simplify(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "refName"

    .prologue
    .line 386
    const-string v0, "refs/heads/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 387
    const-string v0, "refs/heads/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 392
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 388
    .restart local p0
    :cond_1
    const-string v0, "refs/tags/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 389
    const-string v0, "refs/tags/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 390
    :cond_2
    const-string v0, "refs/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 391
    const-string v0, "refs/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method


# virtual methods
.method public add(Ljava/lang/Iterable;)Lorg/eclipse/jgit/api/NameRevCommand;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)",
            "Lorg/eclipse/jgit/api/NameRevCommand;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/api/errors/JGitInternalException;
        }
    .end annotation

    .prologue
    .line 240
    .local p1, ids:Ljava/lang/Iterable;,"Ljava/lang/Iterable<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/ObjectId;

    .line 241
    .local v1, id:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/api/NameRevCommand;->add(Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/api/NameRevCommand;

    goto :goto_0

    .line 242
    .end local v1           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    return-object p0
.end method

.method public add(Lorg/eclipse/jgit/lib/ObjectId;)Lorg/eclipse/jgit/api/NameRevCommand;
    .locals 3
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/api/errors/JGitInternalException;
        }
    .end annotation

    .prologue
    .line 212
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/NameRevCommand;->checkCallable()V

    .line 214
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/api/NameRevCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 220
    iget-object v1, p0, Lorg/eclipse/jgit/api/NameRevCommand;->revs:Ljava/util/List;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 221
    return-object p0

    .line 215
    :catch_0
    move-exception v0

    .line 216
    .local v0, e:Lorg/eclipse/jgit/errors/MissingObjectException;
    throw v0

    .line 217
    .end local v0           #e:Lorg/eclipse/jgit/errors/MissingObjectException;
    :catch_1
    move-exception v0

    .line 218
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public addAnnotatedTags()Lorg/eclipse/jgit/api/NameRevCommand;
    .locals 6

    .prologue
    .line 276
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/NameRevCommand;->checkCallable()V

    .line 277
    iget-object v4, p0, Lorg/eclipse/jgit/api/NameRevCommand;->refs:Ljava/util/List;

    if-nez v4, :cond_0

    .line 278
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lorg/eclipse/jgit/api/NameRevCommand;->refs:Ljava/util/List;

    .line 280
    :cond_0
    :try_start_0
    iget-object v4, p0, Lorg/eclipse/jgit/api/NameRevCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v4

    const-string v5, "refs/tags/"

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 281
    .local v3, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 282
    .local v2, id:Lorg/eclipse/jgit/lib/ObjectId;
    if-eqz v2, :cond_1

    iget-object v4, p0, Lorg/eclipse/jgit/api/NameRevCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    instance-of v4, v4, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v4, :cond_1

    .line 283
    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/api/NameRevCommand;->addRef(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/api/NameRevCommand;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 285
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v3           #ref:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v0

    .line 286
    .local v0, e:Ljava/io/IOException;
    new-instance v4, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 288
    .end local v0           #e:Ljava/io/IOException;
    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_2
    return-object p0
.end method

.method public addPrefix(Ljava/lang/String;)Lorg/eclipse/jgit/api/NameRevCommand;
    .locals 1
    .parameter "prefix"

    .prologue
    .line 257
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/NameRevCommand;->checkCallable()V

    .line 258
    iget-object v0, p0, Lorg/eclipse/jgit/api/NameRevCommand;->prefixes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    return-object p0
.end method

.method public addRef(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/api/NameRevCommand;
    .locals 1
    .parameter "ref"

    .prologue
    .line 303
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/NameRevCommand;->checkCallable()V

    .line 304
    iget-object v0, p0, Lorg/eclipse/jgit/api/NameRevCommand;->refs:Ljava/util/List;

    if-nez v0, :cond_0

    .line 305
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/NameRevCommand;->refs:Ljava/util/List;

    .line 306
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/NameRevCommand;->refs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
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
    .line 76
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/NameRevCommand;->call()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/Map;
    .locals 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 140
    :try_start_0
    new-instance v18, Ljava/util/HashMap;

    invoke-direct/range {v18 .. v18}, Ljava/util/HashMap;-><init>()V

    .line 141
    .local v18, nonCommits:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    new-instance v21, Lorg/eclipse/jgit/revwalk/FIFORevQueue;

    invoke-direct/range {v21 .. v21}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;-><init>()V

    .line 142
    .local v21, pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/NameRevCommand;->refs:Ljava/util/List;

    if-eqz v4, :cond_0

    .line 143
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/NameRevCommand;->refs:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lorg/eclipse/jgit/lib/Ref;

    .line 144
    .local v22, ref:Lorg/eclipse/jgit/lib/Ref;
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v18

    move-object/from16 v3, v21

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/api/NameRevCommand;->addRef(Lorg/eclipse/jgit/lib/Ref;Ljava/util/Map;Lorg/eclipse/jgit/revwalk/FIFORevQueue;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 190
    .end local v15           #i$:Ljava/util/Iterator;
    .end local v18           #nonCommits:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    .end local v21           #pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    .end local v22           #ref:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v13

    .line 191
    .local v13, e:Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/NameRevCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->reset()V

    .line 192
    new-instance v4, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v13}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v13}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 146
    .end local v13           #e:Ljava/io/IOException;
    .restart local v18       #nonCommits:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    .restart local v21       #pending:Lorg/eclipse/jgit/revwalk/FIFORevQueue;
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v21

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/api/NameRevCommand;->addPrefixes(Ljava/util/Map;Lorg/eclipse/jgit/revwalk/FIFORevQueue;)V

    .line 147
    invoke-direct/range {p0 .. p0}, Lorg/eclipse/jgit/api/NameRevCommand;->minCommitTime()I

    move-result v4

    const v5, 0x15180

    sub-int v12, v4, v5

    .line 150
    .local v12, cutoff:I
    :cond_1
    invoke-virtual/range {v21 .. v21}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v11

    check-cast v11, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;

    .line 151
    .local v11, c:Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;
    if-nez v11, :cond_3

    .line 172
    new-instance v23, Ljava/util/LinkedHashMap;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/NameRevCommand;->revs:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    move-object/from16 v0, v23

    invoke-direct {v0, v4}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 174
    .local v23, result:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/NameRevCommand;->revs:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .restart local v15       #i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/eclipse/jgit/lib/ObjectId;

    .line 175
    .local v16, id:Lorg/eclipse/jgit/lib/ObjectId;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/NameRevCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v19

    .line 176
    .local v19, o:Lorg/eclipse/jgit/revwalk/RevObject;
    move-object/from16 v0, v19

    instance-of v4, v0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;

    if-eqz v4, :cond_8

    .line 177
    move-object/from16 v0, v19

    check-cast v0, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;

    move-object v11, v0

    .line 178
    #getter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;
    invoke-static {v11}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$200(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 179
    #calls: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->format()Ljava/lang/StringBuilder;
    invoke-static {v11}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$300(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/api/NameRevCommand;->simplify(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 153
    .end local v15           #i$:Ljava/util/Iterator;
    .end local v16           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v19           #o:Lorg/eclipse/jgit/revwalk/RevObject;
    .end local v23           #result:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    :cond_3
    invoke-virtual {v11}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->getCommitTime()I

    move-result v4

    if-lt v4, v12, :cond_1

    .line 155
    const/4 v14, 0x0

    .local v14, i:I
    :goto_2
    invoke-virtual {v11}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->getParentCount()I

    move-result v4

    if-ge v14, v4, :cond_1

    .line 156
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/NameRevCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v11, v14}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v20

    check-cast v20, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;

    .line 157
    .local v20, p:Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;
    #getter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->cost:J
    invoke-static {v11}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$100(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)J

    move-result-wide v8

    if-lez v14, :cond_6

    move-object/from16 v0, p0

    iget v4, v0, Lorg/eclipse/jgit/api/NameRevCommand;->mergeCost:I

    :goto_3
    int-to-long v4, v4

    add-long v6, v8, v4

    .line 158
    .local v6, cost:J
    #getter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;
    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$200(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_4

    #getter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;
    invoke-static {v11}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$200(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)Ljava/lang/String;

    move-result-object v5

    #getter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;
    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$200(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)Ljava/lang/String;

    move-result-object v8

    #getter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->cost:J
    invoke-static/range {v20 .. v20}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$100(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)J

    move-result-wide v9

    move-object/from16 v4, p0

    invoke-direct/range {v4 .. v10}, Lorg/eclipse/jgit/api/NameRevCommand;->compare(Ljava/lang/String;JLjava/lang/String;J)J

    move-result-wide v4

    const-wide/16 v8, 0x0

    cmp-long v4, v4, v8

    if-gez v4, :cond_5

    .line 159
    :cond_4
    if-lez v14, :cond_7

    .line 160
    #calls: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->format()Ljava/lang/StringBuilder;
    invoke-static {v11}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$300(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x5e

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    add-int/lit8 v5, v14, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v20

    #setter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;
    invoke-static {v0, v4}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$202(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;Ljava/lang/String;)Ljava/lang/String;

    .line 161
    const/4 v4, 0x0

    move-object/from16 v0, v20

    #setter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->distance:I
    invoke-static {v0, v4}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$402(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;I)I

    .line 166
    :goto_4
    move-object/from16 v0, v20

    #setter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->cost:J
    invoke-static {v0, v6, v7}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$102(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;J)J

    .line 167
    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/FIFORevQueue;->add(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 155
    :cond_5
    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    .line 157
    .end local v6           #cost:J
    :cond_6
    const/4 v4, 0x1

    goto :goto_3

    .line 163
    .restart local v6       #cost:J
    :cond_7
    #getter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;
    invoke-static {v11}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$200(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v20

    #setter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->tip:Ljava/lang/String;
    invoke-static {v0, v4}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$202(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;Ljava/lang/String;)Ljava/lang/String;

    .line 164
    #getter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->distance:I
    invoke-static {v11}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$400(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, v20

    #setter for: Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->distance:I
    invoke-static {v0, v4}, Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;->access$402(Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;I)I

    goto :goto_4

    .line 181
    .end local v6           #cost:J
    .end local v14           #i:I
    .end local v20           #p:Lorg/eclipse/jgit/api/NameRevCommand$NameRevCommit;
    .restart local v15       #i$:Ljava/util/Iterator;
    .restart local v16       #id:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v19       #o:Lorg/eclipse/jgit/revwalk/RevObject;
    .restart local v23       #result:Ljava/util/Map;,"Ljava/util/Map<Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;>;"
    :cond_8
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 182
    .local v17, name:Ljava/lang/String;
    if-eqz v17, :cond_2

    .line 183
    invoke-static/range {v17 .. v17}, Lorg/eclipse/jgit/api/NameRevCommand;->simplify(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v23

    move-object/from16 v1, v16

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 187
    .end local v16           #id:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v17           #name:Ljava/lang/String;
    .end local v19           #o:Lorg/eclipse/jgit/revwalk/RevObject;
    :cond_9
    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/api/NameRevCommand;->setCallable(Z)V

    .line 188
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/eclipse/jgit/api/NameRevCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 189
    return-object v23
.end method

.method setMergeCost(I)Lorg/eclipse/jgit/api/NameRevCommand;
    .locals 0
    .parameter "cost"

    .prologue
    .line 311
    iput p1, p0, Lorg/eclipse/jgit/api/NameRevCommand;->mergeCost:I

    .line 312
    return-object p0
.end method
