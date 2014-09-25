.class public Lorg/eclipse/jgit/revplot/PlotCommitList;
.super Lorg/eclipse/jgit/revwalk/RevCommitList;
.source "PlotCommitList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<",
        "L:Lorg/eclipse/jgit/revplot/PlotLane;",
        ">",
        "Lorg/eclipse/jgit/revwalk/RevCommitList",
        "<",
        "Lorg/eclipse/jgit/revplot/PlotCommit",
        "<T",
        "L;",
        ">;>;"
    }
.end annotation


# static fields
.field static final MAX_LENGTH:I = 0x19


# instance fields
.field private final activeLanes:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lorg/eclipse/jgit/revplot/PlotLane;",
            ">;"
        }
    .end annotation
.end field

.field private final freePositions:Ljava/util/TreeSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeSet",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final laneLength:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lorg/eclipse/jgit/revplot/PlotLane;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private positionsAllocated:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    const/16 v1, 0x20

    .line 71
    invoke-direct {p0}, Lorg/eclipse/jgit/revwalk/RevCommitList;-><init>()V

    .line 77
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->freePositions:Ljava/util/TreeSet;

    .line 79
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->activeLanes:Ljava/util/HashSet;

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->laneLength:Ljava/util/HashMap;

    return-void
.end method

.method private static addBlockedPosition(Ljava/util/BitSet;Lorg/eclipse/jgit/revplot/PlotCommit;)V
    .locals 6
    .parameter "blockedPositions"
    .parameter "rObj"

    .prologue
    .line 331
    if-eqz p1, :cond_2

    .line 332
    invoke-virtual {p1}, Lorg/eclipse/jgit/revplot/PlotCommit;->getLane()Lorg/eclipse/jgit/revplot/PlotLane;

    move-result-object v3

    .line 334
    .local v3, lane:Lorg/eclipse/jgit/revplot/PlotLane;
    if-eqz v3, :cond_0

    .line 335
    invoke-virtual {v3}, Lorg/eclipse/jgit/revplot/PlotLane;->getPosition()I

    move-result v5

    invoke-virtual {p0, v5}, Ljava/util/BitSet;->set(I)V

    .line 339
    :cond_0
    iget-object v0, p1, Lorg/eclipse/jgit/revplot/PlotCommit;->forkingOffLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    .local v0, arr$:[Lorg/eclipse/jgit/revplot/PlotLane;
    array-length v4, v0

    .local v4, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v4, :cond_1

    aget-object v2, v0, v1

    .line 340
    .local v2, l:Lorg/eclipse/jgit/revplot/PlotLane;
    invoke-virtual {v2}, Lorg/eclipse/jgit/revplot/PlotLane;->getPosition()I

    move-result v5

    invoke-virtual {p0, v5}, Ljava/util/BitSet;->set(I)V

    .line 339
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 341
    .end local v2           #l:Lorg/eclipse/jgit/revplot/PlotLane;
    :cond_1
    iget-object v0, p1, Lorg/eclipse/jgit/revplot/PlotCommit;->mergingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    array-length v4, v0

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v4, :cond_2

    aget-object v2, v0, v1

    .line 342
    .restart local v2       #l:Lorg/eclipse/jgit/revplot/PlotLane;
    invoke-virtual {v2}, Lorg/eclipse/jgit/revplot/PlotLane;->getPosition()I

    move-result v5

    invoke-virtual {p0, v5}, Ljava/util/BitSet;->set(I)V

    .line 341
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 344
    .end local v0           #arr$:[Lorg/eclipse/jgit/revplot/PlotLane;
    .end local v1           #i$:I
    .end local v2           #l:Lorg/eclipse/jgit/revplot/PlotLane;
    .end local v3           #lane:Lorg/eclipse/jgit/revplot/PlotLane;
    .end local v4           #len$:I
    :cond_2
    return-void
.end method

.method private closeLane(Lorg/eclipse/jgit/revplot/PlotLane;)V
    .locals 2
    .parameter "lane"

    .prologue
    .line 347
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->activeLanes:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 348
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/revplot/PlotCommitList;->recycleLane(Lorg/eclipse/jgit/revplot/PlotLane;)V

    .line 349
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->laneLength:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->freePositions:Ljava/util/TreeSet;

    invoke-virtual {p1}, Lorg/eclipse/jgit/revplot/PlotLane;->getPosition()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 352
    :cond_0
    return-void
.end method

.method private continueActiveLanes(Lorg/eclipse/jgit/revplot/PlotCommit;)V
    .locals 3
    .parameter "currCommit"

    .prologue
    .line 202
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    iget-object v2, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->activeLanes:Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/revplot/PlotLane;

    .line 203
    .local v1, lane:Lorg/eclipse/jgit/revplot/PlotLane;
    iget-object v2, p1, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    if-eq v1, v2, :cond_0

    .line 204
    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/revplot/PlotCommit;->addPassingLane(Lorg/eclipse/jgit/revplot/PlotLane;)V

    goto :goto_0

    .line 205
    .end local v1           #lane:Lorg/eclipse/jgit/revplot/PlotLane;
    :cond_1
    return-void
.end method

.method private drawLaneToChild(ILorg/eclipse/jgit/revplot/PlotCommit;Lorg/eclipse/jgit/revplot/PlotLane;)V
    .locals 2
    .parameter "commitIndex"
    .parameter "child"
    .parameter "laneToContinue"

    .prologue
    .line 320
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    add-int/lit8 v0, p1, -0x1

    .local v0, r:I
    :goto_0
    if-ltz v0, :cond_0

    .line 321
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revplot/PlotCommitList;->get(I)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/revplot/PlotCommit;

    .line 322
    .local v1, rObj:Lorg/eclipse/jgit/revplot/PlotCommit;
    if-ne v1, p2, :cond_1

    .line 327
    .end local v1           #rObj:Lorg/eclipse/jgit/revplot/PlotCommit;
    :cond_0
    return-void

    .line 324
    .restart local v1       #rObj:Lorg/eclipse/jgit/revplot/PlotCommit;
    :cond_1
    if-eqz v1, :cond_2

    .line 325
    invoke-virtual {v1, p3}, Lorg/eclipse/jgit/revplot/PlotCommit;->addPassingLane(Lorg/eclipse/jgit/revplot/PlotLane;)V

    .line 320
    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method private getFreePosition(Ljava/util/BitSet;)I
    .locals 5
    .parameter "blockedPositions"

    .prologue
    .line 378
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->freePositions:Ljava/util/TreeSet;

    invoke-virtual {v3}, Ljava/util/TreeSet;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 379
    iget v3, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->positionsAllocated:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->positionsAllocated:I

    .line 391
    :goto_0
    return v3

    .line 381
    :cond_0
    if-eqz p1, :cond_3

    .line 382
    iget-object v3, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->freePositions:Ljava/util/TreeSet;

    invoke-virtual {v3}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 383
    .local v2, pos:Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/util/BitSet;->get(I)Z

    move-result v3

    if-nez v3, :cond_1

    .line 384
    iget-object v3, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->freePositions:Ljava/util/TreeSet;

    invoke-virtual {v3, v2}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    .line 385
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_0

    .line 387
    .end local v2           #pos:Ljava/lang/Integer;
    :cond_2
    iget v3, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->positionsAllocated:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->positionsAllocated:I

    goto :goto_0

    .line 389
    .end local v0           #i$:Ljava/util/Iterator;
    :cond_3
    iget-object v3, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->freePositions:Ljava/util/TreeSet;

    invoke-virtual {v3}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 390
    .local v1, min:Ljava/lang/Integer;
    iget-object v3, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->freePositions:Ljava/util/TreeSet;

    invoke-virtual {v3, v1}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    .line 391
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_0
.end method

.method private handleBlockedLanes(ILorg/eclipse/jgit/revplot/PlotCommit;Lorg/eclipse/jgit/revplot/PlotCommit;)V
    .locals 11
    .parameter "index"
    .parameter "currCommit"
    .parameter "childOnLane"

    .prologue
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    const/4 v10, 0x0

    .line 221
    iget-object v6, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    .local v6, arr$:[Lorg/eclipse/jgit/revplot/PlotCommit;
    array-length v9, v6

    .local v9, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_0
    if-ge v8, v9, :cond_3

    aget-object v4, v6, v8

    .line 222
    .local v4, child:Lorg/eclipse/jgit/revplot/PlotCommit;
    if-ne v4, p3, :cond_0

    .line 221
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 227
    :cond_0
    invoke-virtual {v4, v10}, Lorg/eclipse/jgit/revplot/PlotCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    if-eq v0, p2, :cond_1

    const/4 v7, 0x1

    .line 228
    .local v7, childIsMerge:Z
    :goto_2
    if-eqz v7, :cond_2

    .line 229
    iget-object v5, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    .local v5, laneToUse:Lorg/eclipse/jgit/revplot/PlotLane;
    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 230
    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/revplot/PlotCommitList;->handleMerge(ILorg/eclipse/jgit/revplot/PlotCommit;Lorg/eclipse/jgit/revplot/PlotCommit;Lorg/eclipse/jgit/revplot/PlotCommit;Lorg/eclipse/jgit/revplot/PlotLane;)Lorg/eclipse/jgit/revplot/PlotLane;

    move-result-object v5

    .line 232
    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/revplot/PlotCommit;->addMergingLane(Lorg/eclipse/jgit/revplot/PlotLane;)V

    goto :goto_1

    .end local v5           #laneToUse:Lorg/eclipse/jgit/revplot/PlotLane;
    .end local v7           #childIsMerge:Z
    :cond_1
    move v7, v10

    .line 227
    goto :goto_2

    .line 238
    .restart local v7       #childIsMerge:Z
    :cond_2
    iget-object v5, v4, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    .line 239
    .restart local v5       #laneToUse:Lorg/eclipse/jgit/revplot/PlotLane;
    invoke-virtual {p2, v5}, Lorg/eclipse/jgit/revplot/PlotCommit;->addForkingOffLane(Lorg/eclipse/jgit/revplot/PlotLane;)V

    goto :goto_1

    .line 242
    .end local v4           #child:Lorg/eclipse/jgit/revplot/PlotCommit;
    .end local v5           #laneToUse:Lorg/eclipse/jgit/revplot/PlotLane;
    .end local v7           #childIsMerge:Z
    :cond_3
    return-void
.end method

.method private handleMerge(ILorg/eclipse/jgit/revplot/PlotCommit;Lorg/eclipse/jgit/revplot/PlotCommit;Lorg/eclipse/jgit/revplot/PlotCommit;Lorg/eclipse/jgit/revplot/PlotLane;)Lorg/eclipse/jgit/revplot/PlotLane;
    .locals 8
    .parameter "index"
    .parameter "currCommit"
    .parameter "childOnLane"
    .parameter "child"
    .parameter "laneToUse"

    .prologue
    .line 250
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    move v1, p1

    .line 252
    .local v1, childIndex:I
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    .line 253
    .local v0, blockedPositions:Ljava/util/BitSet;
    add-int/lit8 v4, p1, -0x1

    .local v4, r:I
    :goto_0
    if-ltz v4, :cond_0

    .line 254
    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/revplot/PlotCommitList;->get(I)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/revplot/PlotCommit;

    .line 255
    .local v5, rObj:Lorg/eclipse/jgit/revplot/PlotCommit;
    if-ne v5, p4, :cond_3

    .line 256
    move v1, v4

    .line 264
    .end local v5           #rObj:Lorg/eclipse/jgit/revplot/PlotCommit;
    :cond_0
    invoke-virtual {p5}, Lorg/eclipse/jgit/revplot/PlotLane;->getPosition()I

    move-result v6

    invoke-virtual {v0, v6}, Ljava/util/BitSet;->get(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 270
    const/4 v2, 0x0

    .line 271
    .local v2, needDetour:Z
    if-eqz p3, :cond_1

    .line 272
    add-int/lit8 v4, p1, -0x1

    :goto_1
    if-le v4, v1, :cond_1

    .line 273
    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/revplot/PlotCommitList;->get(I)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/revplot/PlotCommit;

    .line 274
    .restart local v5       #rObj:Lorg/eclipse/jgit/revplot/PlotCommit;
    if-ne v5, p3, :cond_4

    .line 275
    const/4 v2, 0x1

    .line 281
    .end local v5           #rObj:Lorg/eclipse/jgit/revplot/PlotCommit;
    :cond_1
    if-eqz v2, :cond_5

    .line 287
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revplot/PlotCommitList;->nextFreeLane(Ljava/util/BitSet;)Lorg/eclipse/jgit/revplot/PlotLane;

    move-result-object p5

    .line 288
    invoke-virtual {p2, p5}, Lorg/eclipse/jgit/revplot/PlotCommit;->addForkingOffLane(Lorg/eclipse/jgit/revplot/PlotLane;)V

    .line 289
    invoke-direct {p0, p5}, Lorg/eclipse/jgit/revplot/PlotCommitList;->closeLane(Lorg/eclipse/jgit/revplot/PlotLane;)V

    .line 306
    .end local v2           #needDetour:Z
    :cond_2
    :goto_2
    invoke-direct {p0, p1, p4, p5}, Lorg/eclipse/jgit/revplot/PlotCommitList;->drawLaneToChild(ILorg/eclipse/jgit/revplot/PlotCommit;Lorg/eclipse/jgit/revplot/PlotLane;)V

    .line 307
    return-object p5

    .line 259
    .restart local v5       #rObj:Lorg/eclipse/jgit/revplot/PlotCommit;
    :cond_3
    invoke-static {v0, v5}, Lorg/eclipse/jgit/revplot/PlotCommitList;->addBlockedPosition(Ljava/util/BitSet;Lorg/eclipse/jgit/revplot/PlotCommit;)V

    .line 253
    add-int/lit8 v4, v4, -0x1

    goto :goto_0

    .line 272
    .restart local v2       #needDetour:Z
    :cond_4
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    .line 298
    .end local v5           #rObj:Lorg/eclipse/jgit/revplot/PlotCommit;
    :cond_5
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revplot/PlotCommitList;->getFreePosition(Ljava/util/BitSet;)I

    move-result v3

    .line 299
    .local v3, newPos:I
    iget-object v6, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->freePositions:Ljava/util/TreeSet;

    invoke-virtual {p5}, Lorg/eclipse/jgit/revplot/PlotLane;->getPosition()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    .line 301
    iput v3, p5, Lorg/eclipse/jgit/revplot/PlotLane;->position:I

    goto :goto_2
.end method

.method private nextFreeLane()Lorg/eclipse/jgit/revplot/PlotLane;
    .locals 1

    .prologue
    .line 361
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/revplot/PlotCommitList;->nextFreeLane(Ljava/util/BitSet;)Lorg/eclipse/jgit/revplot/PlotLane;

    move-result-object v0

    return-object v0
.end method

.method private nextFreeLane(Ljava/util/BitSet;)Lorg/eclipse/jgit/revplot/PlotLane;
    .locals 3
    .parameter "blockedPositions"

    .prologue
    .line 365
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/revplot/PlotCommitList;->createLane()Lorg/eclipse/jgit/revplot/PlotLane;

    move-result-object v0

    .line 366
    .local v0, p:Lorg/eclipse/jgit/revplot/PlotLane;
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revplot/PlotCommitList;->getFreePosition(Ljava/util/BitSet;)I

    move-result v1

    iput v1, v0, Lorg/eclipse/jgit/revplot/PlotLane;->position:I

    .line 367
    iget-object v1, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->activeLanes:Ljava/util/HashSet;

    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 368
    iget-object v1, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->laneLength:Ljava/util/HashMap;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    return-object v0
.end method

.method private setupChildren(Lorg/eclipse/jgit/revplot/PlotCommit;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/revplot/PlotCommit",
            "<T",
            "L;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 355
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    .local p1, currCommit:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    invoke-virtual {p1}, Lorg/eclipse/jgit/revplot/PlotCommit;->getParentCount()I

    move-result v1

    .line 356
    .local v1, nParents:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 357
    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revplot/PlotCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/revplot/PlotCommit;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/revplot/PlotCommit;->addChild(Lorg/eclipse/jgit/revplot/PlotCommit;)V

    .line 356
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 358
    :cond_0
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 87
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    invoke-super {p0}, Lorg/eclipse/jgit/revwalk/RevCommitList;->clear()V

    .line 88
    const/4 v0, 0x0

    iput v0, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->positionsAllocated:I

    .line 89
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->freePositions:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->clear()V

    .line 90
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->activeLanes:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 91
    iget-object v0, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->laneLength:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 92
    return-void
.end method

.method protected createLane()Lorg/eclipse/jgit/revplot/PlotLane;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()T",
            "L;"
        }
    .end annotation

    .prologue
    .line 399
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    new-instance v0, Lorg/eclipse/jgit/revplot/PlotLane;

    invoke-direct {v0}, Lorg/eclipse/jgit/revplot/PlotLane;-><init>()V

    return-object v0
.end method

.method protected enter(ILorg/eclipse/jgit/revplot/PlotCommit;)V
    .locals 12
    .parameter "index"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/eclipse/jgit/revplot/PlotCommit",
            "<T",
            "L;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    .local p2, currCommit:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    const/4 v11, 0x0

    .line 126
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/revplot/PlotCommitList;->setupChildren(Lorg/eclipse/jgit/revplot/PlotCommit;)V

    .line 128
    invoke-virtual {p2}, Lorg/eclipse/jgit/revplot/PlotCommit;->getChildCount()I

    move-result v7

    .line 129
    .local v7, nChildren:I
    if-nez v7, :cond_0

    .line 130
    invoke-direct {p0}, Lorg/eclipse/jgit/revplot/PlotCommitList;->nextFreeLane()Lorg/eclipse/jgit/revplot/PlotLane;

    move-result-object v9

    iput-object v9, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    .line 131
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/revplot/PlotCommitList;->continueActiveLanes(Lorg/eclipse/jgit/revplot/PlotCommit;)V

    .line 199
    :goto_0
    return-void

    .line 135
    :cond_0
    const/4 v9, 0x1

    if-ne v7, v9, :cond_2

    iget-object v9, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    aget-object v9, v9, v11

    invoke-virtual {v9}, Lorg/eclipse/jgit/revplot/PlotCommit;->getParentCount()I

    move-result v9

    const/4 v10, 0x2

    if-ge v9, v10, :cond_2

    .line 140
    iget-object v9, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    aget-object v1, v9, v11

    .line 141
    .local v1, c:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    iget-object v9, v1, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    iput-object v9, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    .line 142
    iget-object v9, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->laneLength:Ljava/util/HashMap;

    iget-object v10, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 143
    .local v5, len:Ljava/lang/Integer;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 144
    iget-object v9, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->laneLength:Ljava/util/HashMap;

    iget-object v10, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    invoke-virtual {v9, v10, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    .end local v1           #c:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    .end local v5           #len:Ljava/lang/Integer;
    :cond_1
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/revplot/PlotCommitList;->continueActiveLanes(Lorg/eclipse/jgit/revplot/PlotCommit;)V

    goto :goto_0

    .line 160
    :cond_2
    const/4 v8, 0x0

    .line 161
    .local v8, reservedLane:Lorg/eclipse/jgit/revplot/PlotLane;
    const/4 v2, 0x0

    .line 162
    .local v2, childOnReservedLane:Lorg/eclipse/jgit/revplot/PlotCommit;
    const/4 v6, -0x1

    .line 164
    .local v6, lengthOfReservedLane:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    if-ge v4, v7, :cond_4

    .line 166
    iget-object v9, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    aget-object v1, v9, v4

    .line 167
    .restart local v1       #c:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    invoke-virtual {v1, v11}, Lorg/eclipse/jgit/revplot/PlotCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v9

    if-ne v9, p2, :cond_3

    .line 168
    iget-object v9, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->laneLength:Ljava/util/HashMap;

    iget-object v10, v1, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    invoke-virtual {v9, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    .line 171
    .restart local v5       #len:Ljava/lang/Integer;
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-le v9, v6, :cond_3

    .line 172
    iget-object v8, v1, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    .line 173
    move-object v2, v1

    .line 174
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 164
    .end local v5           #len:Ljava/lang/Integer;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 179
    .end local v1           #c:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    :cond_4
    if-eqz v8, :cond_6

    .line 180
    iput-object v8, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    .line 181
    iget-object v9, p0, Lorg/eclipse/jgit/revplot/PlotCommitList;->laneLength:Ljava/util/HashMap;

    add-int/lit8 v10, v6, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v9, v8, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    invoke-direct {p0, p1, p2, v2}, Lorg/eclipse/jgit/revplot/PlotCommitList;->handleBlockedLanes(ILorg/eclipse/jgit/revplot/PlotCommit;Lorg/eclipse/jgit/revplot/PlotCommit;)V

    .line 191
    :goto_2
    const/4 v4, 0x0

    :goto_3
    if-ge v4, v7, :cond_1

    .line 192
    iget-object v9, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->children:[Lorg/eclipse/jgit/revplot/PlotCommit;

    aget-object v0, v9, v4

    .line 193
    .local v0, c:Lorg/eclipse/jgit/revplot/PlotCommit;
    invoke-virtual {v0, v11}, Lorg/eclipse/jgit/revplot/PlotCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/revplot/PlotCommit;

    .line 194
    .local v3, firstParent:Lorg/eclipse/jgit/revplot/PlotCommit;
    iget-object v9, v3, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    if-eqz v9, :cond_5

    iget-object v9, v3, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    iget-object v10, v0, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    if-eq v9, v10, :cond_5

    .line 195
    iget-object v9, v0, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    invoke-direct {p0, v9}, Lorg/eclipse/jgit/revplot/PlotCommitList;->closeLane(Lorg/eclipse/jgit/revplot/PlotLane;)V

    .line 191
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 185
    .end local v0           #c:Lorg/eclipse/jgit/revplot/PlotCommit;
    .end local v3           #firstParent:Lorg/eclipse/jgit/revplot/PlotCommit;
    :cond_6
    invoke-direct {p0}, Lorg/eclipse/jgit/revplot/PlotCommitList;->nextFreeLane()Lorg/eclipse/jgit/revplot/PlotLane;

    move-result-object v9

    iput-object v9, p2, Lorg/eclipse/jgit/revplot/PlotCommit;->lane:Lorg/eclipse/jgit/revplot/PlotLane;

    .line 186
    const/4 v9, 0x0

    invoke-direct {p0, p1, p2, v9}, Lorg/eclipse/jgit/revplot/PlotCommitList;->handleBlockedLanes(ILorg/eclipse/jgit/revplot/PlotCommit;Lorg/eclipse/jgit/revplot/PlotCommit;)V

    goto :goto_2
.end method

.method protected bridge synthetic enter(ILorg/eclipse/jgit/revwalk/RevCommit;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 71
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    check-cast p2, Lorg/eclipse/jgit/revplot/PlotCommit;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/revplot/PlotCommitList;->enter(ILorg/eclipse/jgit/revplot/PlotCommit;)V

    return-void
.end method

.method public findPassingThrough(Lorg/eclipse/jgit/revplot/PlotCommit;Ljava/util/Collection;)V
    .locals 4
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/revplot/PlotCommit",
            "<T",
            "L;",
            ">;",
            "Ljava/util/Collection",
            "<T",
            "L;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 120
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    .local p1, currCommit:Lorg/eclipse/jgit/revplot/PlotCommit;,"Lorg/eclipse/jgit/revplot/PlotCommit<TL;>;"
    .local p2, result:Ljava/util/Collection;,"Ljava/util/Collection<TL;>;"
    iget-object v0, p1, Lorg/eclipse/jgit/revplot/PlotCommit;->passingLanes:[Lorg/eclipse/jgit/revplot/PlotLane;

    .local v0, arr$:[Lorg/eclipse/jgit/revplot/PlotLane;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 121
    .local v3, p:Lorg/eclipse/jgit/revplot/PlotLane;
    invoke-interface {p2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 120
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 122
    .end local v3           #p:Lorg/eclipse/jgit/revplot/PlotLane;
    :cond_0
    return-void
.end method

.method protected recycleLane(Lorg/eclipse/jgit/revplot/PlotLane;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(T",
            "L;",
            ")V"
        }
    .end annotation

    .prologue
    .line 410
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    .local p1, lane:Lorg/eclipse/jgit/revplot/PlotLane;,"TL;"
    return-void
.end method

.method public source(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 5
    .parameter "w"

    .prologue
    .line 96
    .local p0, this:Lorg/eclipse/jgit/revplot/PlotCommitList;,"Lorg/eclipse/jgit/revplot/PlotCommitList<TL;>;"
    instance-of v0, p1, Lorg/eclipse/jgit/revplot/PlotWalk;

    if-nez v0, :cond_0

    .line 97
    new-instance v0, Ljava/lang/ClassCastException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->classCastNotA:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-class v4, Lorg/eclipse/jgit/revplot/PlotWalk;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_0
    invoke-super {p0, p1}, Lorg/eclipse/jgit/revwalk/RevCommitList;->source(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 99
    return-void
.end method
