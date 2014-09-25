.class public Lorg/eclipse/jgit/api/MergeResult;
.super Ljava/lang/Object;
.source "MergeResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/MergeResult$1;,
        Lorg/eclipse/jgit/api/MergeResult$MergeStatus;
    }
.end annotation


# instance fields
.field private base:Lorg/eclipse/jgit/lib/ObjectId;

.field private checkoutConflicts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private conflicts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "[[I>;"
        }
    .end annotation
.end field

.field private description:Ljava/lang/String;

.field private failingPaths:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;",
            ">;"
        }
    .end annotation
.end field

.field private mergeStatus:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

.field private mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

.field private mergedCommits:[Lorg/eclipse/jgit/lib/ObjectId;

.field private newHead:Lorg/eclipse/jgit/lib/ObjectId;


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 349
    .local p1, checkoutConflicts:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 350
    iput-object p1, p0, Lorg/eclipse/jgit/api/MergeResult;->checkoutConflicts:Ljava/util/List;

    .line 351
    sget-object v0, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;->CHECKOUT_CONFLICT:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    iput-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->mergeStatus:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 352
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;)V
    .locals 8
    .parameter "newHead"
    .parameter "base"
    .parameter "mergedCommits"
    .parameter "mergeStatus"
    .parameter "mergeStrategy"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "[",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Lorg/eclipse/jgit/api/MergeResult$MergeStatus;",
            "Lorg/eclipse/jgit/merge/MergeStrategy;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/MergeResult",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 271
    .local p6, lowLevelResults:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult<*>;>;"
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lorg/eclipse/jgit/api/MergeResult;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/lang/String;)V

    .line 273
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/lang/String;)V
    .locals 9
    .parameter "newHead"
    .parameter "base"
    .parameter "mergedCommits"
    .parameter "mergeStatus"
    .parameter "mergeStrategy"
    .parameter
    .parameter "description"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "[",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Lorg/eclipse/jgit/api/MergeResult$MergeStatus;",
            "Lorg/eclipse/jgit/merge/MergeStrategy;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/MergeResult",
            "<*>;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 298
    .local p6, lowLevelResults:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult<*>;>;"
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lorg/eclipse/jgit/api/MergeResult;-><init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)V

    .line 300
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;[Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/api/MergeResult$MergeStatus;Lorg/eclipse/jgit/merge/MergeStrategy;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;)V
    .locals 4
    .parameter "newHead"
    .parameter "base"
    .parameter "mergedCommits"
    .parameter "mergeStatus"
    .parameter "mergeStrategy"
    .parameter
    .parameter
    .parameter "description"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "[",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            "Lorg/eclipse/jgit/api/MergeResult$MergeStatus;",
            "Lorg/eclipse/jgit/merge/MergeStrategy;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/MergeResult",
            "<*>;>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 328
    .local p6, lowLevelResults:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult<*>;>;"
    .local p7, failingPaths:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 329
    iput-object p1, p0, Lorg/eclipse/jgit/api/MergeResult;->newHead:Lorg/eclipse/jgit/lib/ObjectId;

    .line 330
    iput-object p3, p0, Lorg/eclipse/jgit/api/MergeResult;->mergedCommits:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 331
    iput-object p2, p0, Lorg/eclipse/jgit/api/MergeResult;->base:Lorg/eclipse/jgit/lib/ObjectId;

    .line 332
    iput-object p4, p0, Lorg/eclipse/jgit/api/MergeResult;->mergeStatus:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    .line 333
    iput-object p5, p0, Lorg/eclipse/jgit/api/MergeResult;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    .line 334
    iput-object p8, p0, Lorg/eclipse/jgit/api/MergeResult;->description:Ljava/lang/String;

    .line 335
    iput-object p7, p0, Lorg/eclipse/jgit/api/MergeResult;->failingPaths:Ljava/util/Map;

    .line 336
    if-eqz p6, :cond_0

    .line 337
    invoke-interface {p6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 339
    .local v1, result:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult<*>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/merge/MergeResult;

    invoke-virtual {p0, v2, v3}, Lorg/eclipse/jgit/api/MergeResult;->addConflict(Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult;)V

    goto :goto_0

    .line 340
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #result:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult<*>;>;"
    :cond_0
    return-void
.end method


# virtual methods
.method public addConflict(Ljava/lang/String;Lorg/eclipse/jgit/merge/MergeResult;)V
    .locals 9
    .parameter "path"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/MergeResult",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 426
    .local p2, lowLevelResult:Lorg/eclipse/jgit/merge/MergeResult;,"Lorg/eclipse/jgit/merge/MergeResult<*>;"
    invoke-virtual {p2}, Lorg/eclipse/jgit/merge/MergeResult;->containsConflicts()Z

    move-result v6

    if-nez v6, :cond_0

    .line 459
    :goto_0
    return-void

    .line 428
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/api/MergeResult;->conflicts:Ljava/util/Map;

    if-nez v6, :cond_1

    .line 429
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iput-object v6, p0, Lorg/eclipse/jgit/api/MergeResult;->conflicts:Ljava/util/Map;

    .line 430
    :cond_1
    const/4 v4, 0x0

    .line 432
    .local v4, nrOfConflicts:I
    invoke-virtual {p2}, Lorg/eclipse/jgit/merge/MergeResult;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/merge/MergeChunk;

    .line 433
    .local v3, mergeChunk:Lorg/eclipse/jgit/merge/MergeChunk;
    invoke-virtual {v3}, Lorg/eclipse/jgit/merge/MergeChunk;->getConflictState()Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->FIRST_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 434
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 437
    .end local v3           #mergeChunk:Lorg/eclipse/jgit/merge/MergeChunk;
    :cond_3
    const/4 v0, -0x1

    .line 438
    .local v0, currentConflict:I
    iget-object v6, p0, Lorg/eclipse/jgit/api/MergeResult;->mergedCommits:[Lorg/eclipse/jgit/lib/ObjectId;

    array-length v6, v6

    add-int/lit8 v6, v6, 0x1

    filled-new-array {v4, v6}, [I

    move-result-object v6

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v7, v6}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [[I

    .line 439
    .local v5, ret:[[I
    invoke-virtual {p2}, Lorg/eclipse/jgit/merge/MergeResult;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/merge/MergeChunk;

    .line 441
    .restart local v3       #mergeChunk:Lorg/eclipse/jgit/merge/MergeChunk;
    const/4 v1, 0x0

    .line 442
    .local v1, endOfChunk:I
    invoke-virtual {v3}, Lorg/eclipse/jgit/merge/MergeChunk;->getConflictState()Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->FIRST_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 443
    const/4 v6, -0x1

    if-le v0, v6, :cond_5

    .line 446
    aget-object v6, v5, v0

    iget-object v7, p0, Lorg/eclipse/jgit/api/MergeResult;->mergedCommits:[Lorg/eclipse/jgit/lib/ObjectId;

    array-length v7, v7

    aput v1, v6, v7

    .line 448
    :cond_5
    add-int/lit8 v0, v0, 0x1

    .line 449
    invoke-virtual {v3}, Lorg/eclipse/jgit/merge/MergeChunk;->getEnd()I

    move-result v1

    .line 450
    aget-object v6, v5, v0

    invoke-virtual {v3}, Lorg/eclipse/jgit/merge/MergeChunk;->getSequenceIndex()I

    move-result v7

    invoke-virtual {v3}, Lorg/eclipse/jgit/merge/MergeChunk;->getBegin()I

    move-result v8

    aput v8, v6, v7

    .line 452
    :cond_6
    invoke-virtual {v3}, Lorg/eclipse/jgit/merge/MergeChunk;->getConflictState()Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->NEXT_CONFLICTING_RANGE:Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;

    invoke-virtual {v6, v7}, Lorg/eclipse/jgit/merge/MergeChunk$ConflictState;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 453
    invoke-virtual {v3}, Lorg/eclipse/jgit/merge/MergeChunk;->getEnd()I

    move-result v6

    if-le v6, v1, :cond_7

    .line 454
    invoke-virtual {v3}, Lorg/eclipse/jgit/merge/MergeChunk;->getEnd()I

    move-result v1

    .line 455
    :cond_7
    aget-object v6, v5, v0

    invoke-virtual {v3}, Lorg/eclipse/jgit/merge/MergeChunk;->getSequenceIndex()I

    move-result v7

    invoke-virtual {v3}, Lorg/eclipse/jgit/merge/MergeChunk;->getBegin()I

    move-result v8

    aput v8, v6, v7

    goto :goto_2

    .line 458
    .end local v1           #endOfChunk:I
    .end local v3           #mergeChunk:Lorg/eclipse/jgit/merge/MergeChunk;
    :cond_8
    iget-object v6, p0, Lorg/eclipse/jgit/api/MergeResult;->conflicts:Ljava/util/Map;

    invoke-interface {v6, p1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0
.end method

.method public addConflict(Ljava/lang/String;[[I)V
    .locals 1
    .parameter "path"
    .parameter "conflictingRanges"

    .prologue
    .line 416
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->conflicts:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 417
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->conflicts:Ljava/util/Map;

    .line 418
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->conflicts:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 419
    return-void
.end method

.method public getBase()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 381
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->base:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getCheckoutConflicts()Ljava/util/List;
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
    .line 522
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->checkoutConflicts:Ljava/util/List;

    return-object v0
.end method

.method public getConflicts()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "[[I>;"
        }
    .end annotation

    .prologue
    .line 501
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->conflicts:Ljava/util/Map;

    return-object v0
.end method

.method public getFailingPaths()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/merge/ResolveMerger$MergeFailureReason;",
            ">;"
        }
    .end annotation

    .prologue
    .line 512
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->failingPaths:Ljava/util/Map;

    return-object v0
.end method

.method public getMergeStatus()Lorg/eclipse/jgit/api/MergeResult$MergeStatus;
    .locals 1

    .prologue
    .line 365
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->mergeStatus:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    return-object v0
.end method

.method public getMergedCommits()[Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 372
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->mergedCommits:[Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getNewHead()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 358
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->newHead:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public setConflicts(Ljava/util/Map;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "[[I>;)V"
        }
    .end annotation

    .prologue
    .line 407
    .local p1, conflicts:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;[[I>;"
    iput-object p1, p0, Lorg/eclipse/jgit/api/MergeResult;->conflicts:Ljava/util/Map;

    .line 408
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 11

    .prologue
    .line 387
    const/4 v3, 0x1

    .line 388
    .local v3, first:Z
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 389
    .local v2, commits:Ljava/lang/StringBuilder;
    iget-object v0, p0, Lorg/eclipse/jgit/api/MergeResult;->mergedCommits:[Lorg/eclipse/jgit/lib/ObjectId;

    .local v0, arr$:[Lorg/eclipse/jgit/lib/ObjectId;
    array-length v5, v0

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v1, v0, v4

    .line 390
    .local v1, commit:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v3, :cond_0

    .line 391
    const-string v6, ", "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    :goto_1
    invoke-static {v1}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 393
    :cond_0
    const/4 v3, 0x0

    goto :goto_1

    .line 396
    .end local v1           #commit:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v7, v6, Lorg/eclipse/jgit/internal/JGitText;->mergeUsingStrategyResultedInDescription:Ljava/lang/String;

    const/4 v6, 0x5

    new-array v8, v6, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v2, v8, v6

    const/4 v6, 0x1

    iget-object v9, p0, Lorg/eclipse/jgit/api/MergeResult;->base:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-static {v9}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v6

    const/4 v6, 0x2

    iget-object v9, p0, Lorg/eclipse/jgit/api/MergeResult;->mergeStrategy:Lorg/eclipse/jgit/merge/MergeStrategy;

    invoke-virtual {v9}, Lorg/eclipse/jgit/merge/MergeStrategy;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v6

    const/4 v6, 0x3

    iget-object v9, p0, Lorg/eclipse/jgit/api/MergeResult;->mergeStatus:Lorg/eclipse/jgit/api/MergeResult$MergeStatus;

    aput-object v9, v8, v6

    const/4 v9, 0x4

    iget-object v6, p0, Lorg/eclipse/jgit/api/MergeResult;->description:Ljava/lang/String;

    if-nez v6, :cond_2

    const-string v6, ""

    :goto_2
    aput-object v6, v8, v9

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    return-object v6

    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, ", "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v10, p0, Lorg/eclipse/jgit/api/MergeResult;->description:Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_2
.end method
