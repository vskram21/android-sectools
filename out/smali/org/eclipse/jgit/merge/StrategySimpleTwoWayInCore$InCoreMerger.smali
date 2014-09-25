.class Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;
.super Lorg/eclipse/jgit/merge/ThreeWayMerger;
.source "StrategySimpleTwoWayInCore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InCoreMerger"
.end annotation


# static fields
.field private static final T_BASE:I = 0x0

.field private static final T_OURS:I = 0x1

.field private static final T_THEIRS:I = 0x2


# instance fields
.field private builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

.field private final cache:Lorg/eclipse/jgit/dircache/DirCache;

.field private resultTree:Lorg/eclipse/jgit/lib/ObjectId;

.field private final tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "local"

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/merge/ThreeWayMerger;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 109
    new-instance v0, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    iput-object v0, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    .line 110
    invoke-static {}, Lorg/eclipse/jgit/dircache/DirCache;->newInCore()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    .line 111
    return-void
.end method

.method private add(II)V
    .locals 6
    .parameter "tree"
    .parameter "stage"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->getTree(I)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v1

    .line 173
    .local v1, i:Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    if-eqz v1, :cond_0

    .line 174
    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    iget-object v3, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v3, p1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 175
    iget-object v2, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    iget-object v3, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v3

    iget-object v4, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    iget-object v5, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v5, p1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v5

    invoke-virtual {v2, v3, p2, v4, v5}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->addTree([BILorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 186
    :cond_0
    :goto_0
    return-void

    .line 180
    :cond_1
    new-instance v0, Lorg/eclipse/jgit/dircache/DirCacheEntry;

    iget-object v2, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v2}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawPath()[B

    move-result-object v2

    invoke-direct {v0, v2, p2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;-><init>([BI)V

    .line 181
    .local v0, e:Lorg/eclipse/jgit/dircache/DirCacheEntry;
    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idBuffer()[B

    move-result-object v2

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;->idOffset()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setObjectIdFromRaw([BI)V

    .line 182
    iget-object v2, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v2, p1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getFileMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->setFileMode(Lorg/eclipse/jgit/lib/FileMode;)V

    .line 183
    iget-object v2, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v2, v0}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->add(Lorg/eclipse/jgit/dircache/DirCacheEntry;)V

    goto :goto_0
.end method

.method private getTree(I)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;
    .locals 2
    .parameter "tree"

    .prologue
    .line 189
    iget-object v0, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    const-class v1, Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    invoke-virtual {v0, p1, v1}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getTree(ILjava/lang/Class;)Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v0

    return-object v0
.end method

.method private static nonTree(I)Z
    .locals 1
    .parameter "mode"

    .prologue
    .line 168
    if-eqz p0, :cond_0

    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->TREE:Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/lib/FileMode;->equals(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getResultTreeId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->resultTree:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method protected mergeImpl()Z
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 115
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->mergeBase()Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/treewalk/AbstractTreeIterator;)I

    .line 116
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v9, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->sourceTrees:[Lorg/eclipse/jgit/revwalk/RevTree;

    aget-object v9, v9, v6

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 117
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    iget-object v9, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->sourceTrees:[Lorg/eclipse/jgit/revwalk/RevTree;

    aget-object v9, v9, v7

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->addTree(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    .line 119
    const/4 v0, 0x0

    .line 120
    .local v0, hasConflict:Z
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v8}, Lorg/eclipse/jgit/dircache/DirCache;->builder()Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    move-result-object v8

    iput-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    .line 121
    :cond_0
    :goto_0
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->next()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 122
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v8, v7}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v2

    .line 123
    .local v2, modeO:I
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v8, v10}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v3

    .line 124
    .local v3, modeT:I
    if-ne v2, v3, :cond_1

    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v8, v7, v10}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->idEqual(II)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 125
    invoke-direct {p0, v7, v6}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->add(II)V

    goto :goto_0

    .line 129
    :cond_1
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v8, v6}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->getRawMode(I)I

    move-result v1

    .line 130
    .local v1, modeB:I
    if-ne v1, v2, :cond_2

    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v8, v6, v7}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->idEqual(II)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 131
    invoke-direct {p0, v10, v6}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->add(II)V

    goto :goto_0

    .line 132
    :cond_2
    if-ne v1, v3, :cond_3

    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v8, v6, v10}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->idEqual(II)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 133
    invoke-direct {p0, v7, v6}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->add(II)V

    goto :goto_0

    .line 135
    :cond_3
    invoke-static {v1}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->nonTree(I)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 136
    invoke-direct {p0, v6, v7}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->add(II)V

    .line 137
    const/4 v0, 0x1

    .line 139
    :cond_4
    invoke-static {v2}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->nonTree(I)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 140
    invoke-direct {p0, v7, v10}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->add(II)V

    .line 141
    const/4 v0, 0x1

    .line 143
    :cond_5
    invoke-static {v3}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->nonTree(I)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 144
    const/4 v8, 0x3

    invoke-direct {p0, v10, v8}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->add(II)V

    .line 145
    const/4 v0, 0x1

    .line 147
    :cond_6
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->isSubtree()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 148
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->tw:Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;

    invoke-virtual {v8}, Lorg/eclipse/jgit/treewalk/NameConflictTreeWalk;->enterSubtree()V

    goto :goto_0

    .line 151
    .end local v1           #modeB:I
    .end local v2           #modeO:I
    .end local v3           #modeT:I
    :cond_7
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    invoke-virtual {v8}, Lorg/eclipse/jgit/dircache/DirCacheBuilder;->finish()V

    .line 152
    iput-object v11, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->builder:Lorg/eclipse/jgit/dircache/DirCacheBuilder;

    .line 154
    if-eqz v0, :cond_8

    .line 163
    :goto_1
    return v6

    .line 157
    :cond_8
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->getObjectInserter()Lorg/eclipse/jgit/lib/ObjectInserter;

    move-result-object v4

    .line 158
    .local v4, odi:Lorg/eclipse/jgit/lib/ObjectInserter;
    iget-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->cache:Lorg/eclipse/jgit/dircache/DirCache;

    invoke-virtual {v8, v4}, Lorg/eclipse/jgit/dircache/DirCache;->writeTree(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v8

    iput-object v8, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->resultTree:Lorg/eclipse/jgit/lib/ObjectId;

    .line 159
    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/ObjectInserter;->flush()V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/UnmergedPathException; {:try_start_0 .. :try_end_0} :catch_0

    move v6, v7

    .line 160
    goto :goto_1

    .line 161
    .end local v4           #odi:Lorg/eclipse/jgit/lib/ObjectInserter;
    :catch_0
    move-exception v5

    .line 162
    .local v5, upe:Lorg/eclipse/jgit/errors/UnmergedPathException;
    iput-object v11, p0, Lorg/eclipse/jgit/merge/StrategySimpleTwoWayInCore$InCoreMerger;->resultTree:Lorg/eclipse/jgit/lib/ObjectId;

    goto :goto_1
.end method
