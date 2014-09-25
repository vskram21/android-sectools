.class public Lorg/eclipse/jgit/blame/BlameGenerator;
.super Ljava/lang/Object;
.source "BlameGenerator.java"


# instance fields
.field private SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

.field private final idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

.field private outCandidate:Lorg/eclipse/jgit/blame/Candidate;

.field private outRegion:Lorg/eclipse/jgit/blame/Region;

.field private queue:Lorg/eclipse/jgit/blame/Candidate;

.field private reader:Lorg/eclipse/jgit/lib/ObjectReader;

.field private remaining:I

.field private renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

.field private final repository:Lorg/eclipse/jgit/lib/Repository;

.field private final resultPath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

.field private revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

.field private textComparator:Lorg/eclipse/jgit/diff/RawTextComparator;

.field private treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)V
    .locals 1
    .parameter "repository"
    .parameter "path"

    .prologue
    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    new-instance v0, Lorg/eclipse/jgit/diff/HistogramDiff;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/HistogramDiff;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    .line 135
    sget-object v0, Lorg/eclipse/jgit/diff/RawTextComparator;->DEFAULT:Lorg/eclipse/jgit/diff/RawTextComparator;

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->textComparator:Lorg/eclipse/jgit/diff/RawTextComparator;

    .line 160
    iput-object p1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->repository:Lorg/eclipse/jgit/lib/Repository;

    .line 161
    invoke-static {p2}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->resultPath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    .line 163
    new-instance v0, Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/MutableObjectId;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    .line 164
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->setFollowFileRenames(Z)Lorg/eclipse/jgit/blame/BlameGenerator;

    .line 165
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->initRevPool(Z)V

    .line 167
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->remaining:I

    .line 168
    return-void
.end method

.method private blameEntireRegionOnParent(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 1
    .parameter "n"
    .parameter "parent"

    .prologue
    .line 635
    iput-object p2, p1, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 636
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Lorg/eclipse/jgit/blame/Candidate;)V

    .line 637
    const/4 v0, 0x0

    return v0
.end method

.method private done()Z
    .locals 1

    .prologue
    .line 517
    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->release()V

    .line 518
    const/4 v0, 0x0

    return v0
.end method

.method private find(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Z
    .locals 3
    .parameter "commit"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 949
    iget-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 950
    iget-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 951
    iget-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;->next()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getRawMode(I)I

    move-result v1

    invoke-static {v1}, Lorg/eclipse/jgit/blame/BlameGenerator;->isFile(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 952
    iget-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v1, v2, v0}, Lorg/eclipse/jgit/treewalk/TreeWalk;->getObjectId(Lorg/eclipse/jgit/lib/MutableObjectId;I)V

    .line 953
    const/4 v0, 0x1

    .line 955
    :cond_0
    return v0
.end method

.method private findRename(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/diff/DiffEntry;
    .locals 7
    .parameter "parent"
    .parameter "commit"
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 964
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    if-nez v3, :cond_0

    move-object v0, v2

    .line 975
    :goto_0
    return-object v0

    .line 967
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    sget-object v4, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ANY_DIFF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 968
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    const/4 v4, 0x2

    new-array v4, v4, [Lorg/eclipse/jgit/lib/AnyObjectId;

    const/4 v5, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-virtual {p2}, Lorg/eclipse/jgit/revwalk/RevCommit;->getTree()Lorg/eclipse/jgit/revwalk/RevTree;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/treewalk/TreeWalk;->reset([Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 969
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/RenameDetector;->reset()V

    .line 970
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-static {v4}, Lorg/eclipse/jgit/diff/DiffEntry;->scan(Lorg/eclipse/jgit/treewalk/TreeWalk;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/diff/RenameDetector;->addAll(Ljava/util/Collection;)V

    .line 971
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/RenameDetector;->compute()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 972
    .local v0, ent:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-static {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->isRename(Lorg/eclipse/jgit/diff/DiffEntry;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .end local v0           #ent:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_2
    move-object v0, v2

    .line 975
    goto :goto_0
.end method

.method private initRevPool(Z)V
    .locals 3
    .parameter "reverse"

    .prologue
    const/4 v2, 0x1

    .line 171
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->queue:Lorg/eclipse/jgit/blame/Candidate;

    if-eqz v0, :cond_0

    .line 172
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 174
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    if-eqz v0, :cond_1

    .line 175
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 177
    :cond_1
    if-eqz p1, :cond_2

    .line 178
    new-instance v0, Lorg/eclipse/jgit/blame/ReverseWalk;

    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/blame/ReverseWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 182
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRetainBody(Z)V

    .line 183
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    const-string v1, "SEEN"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 184
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->getObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 185
    new-instance v0, Lorg/eclipse/jgit/treewalk/TreeWalk;

    iget-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/treewalk/TreeWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    .line 186
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->treeWalk:Lorg/eclipse/jgit/treewalk/TreeWalk;

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/treewalk/TreeWalk;->setRecursive(Z)V

    .line 187
    return-void

    .line 180
    :cond_2
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    goto :goto_0
.end method

.method private static final isFile(I)Z
    .locals 2
    .parameter "rawMode"

    .prologue
    .line 959
    const v0, 0xf000

    and-int/2addr v0, p0

    const v1, 0x8000

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static isRename(Lorg/eclipse/jgit/diff/DiffEntry;)Z
    .locals 2
    .parameter "ent"

    .prologue
    .line 979
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private pop()Lorg/eclipse/jgit/blame/Candidate;
    .locals 2

    .prologue
    .line 539
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->queue:Lorg/eclipse/jgit/blame/Candidate;

    .line 540
    .local v0, n:Lorg/eclipse/jgit/blame/Candidate;
    if-eqz v0, :cond_0

    .line 541
    iget-object v1, v0, Lorg/eclipse/jgit/blame/Candidate;->queueNext:Lorg/eclipse/jgit/blame/Candidate;

    iput-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->queue:Lorg/eclipse/jgit/blame/Candidate;

    .line 542
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/eclipse/jgit/blame/Candidate;->queueNext:Lorg/eclipse/jgit/blame/Candidate;

    .line 544
    :cond_0
    return-object v0
.end method

.method private processMerge(Lorg/eclipse/jgit/blame/Candidate;)Z
    .locals 17
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 673
    invoke-virtual/range {p1 .. p1}, Lorg/eclipse/jgit/blame/Candidate;->getParentCount()I

    move-result v5

    .line 677
    .local v5, pCnt:I
    const/4 v3, 0x0

    .line 678
    .local v3, ids:[Lorg/eclipse/jgit/lib/ObjectId;
    const/4 v6, 0x0

    .local v6, pIdx:I
    :goto_0
    if-ge v6, v5, :cond_3

    .line 679
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/blame/Candidate;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v7

    .line 680
    .local v7, parent:Lorg/eclipse/jgit/revwalk/RevCommit;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v13, v7}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 681
    move-object/from16 v0, p1

    iget-object v13, v0, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v13}, Lorg/eclipse/jgit/blame/BlameGenerator;->find(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 678
    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 683
    :cond_0
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;

    if-nez v13, :cond_1

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/blame/BlameGenerator;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v13, v14}, Lorg/eclipse/jgit/lib/MutableObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 684
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/blame/BlameGenerator;->blameEntireRegionOnParent(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v13

    .line 827
    .end local v7           #parent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :goto_2
    return v13

    .line 685
    .restart local v7       #parent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_1
    if-nez v3, :cond_2

    .line 686
    new-array v3, v5, [Lorg/eclipse/jgit/lib/ObjectId;

    .line 687
    :cond_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/blame/BlameGenerator;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v13}, Lorg/eclipse/jgit/lib/MutableObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v13

    aput-object v13, v3, v6

    goto :goto_1

    .line 691
    .end local v7           #parent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_3
    const/4 v10, 0x0

    .line 692
    .local v10, renames:[Lorg/eclipse/jgit/diff/DiffEntry;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/blame/BlameGenerator;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    if-eqz v13, :cond_9

    .line 693
    new-array v10, v5, [Lorg/eclipse/jgit/diff/DiffEntry;

    .line 694
    const/4 v6, 0x0

    :goto_3
    if-ge v6, v5, :cond_9

    .line 695
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/blame/Candidate;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v7

    .line 696
    .restart local v7       #parent:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v3, :cond_5

    aget-object v13, v3, v6

    if-eqz v13, :cond_5

    .line 694
    :cond_4
    :goto_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 699
    :cond_5
    move-object/from16 v0, p1

    iget-object v13, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-object/from16 v0, p0

    invoke-direct {v0, v7, v13, v14}, Lorg/eclipse/jgit/blame/BlameGenerator;->findRename(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v9

    .line 700
    .local v9, r:Lorg/eclipse/jgit/diff/DiffEntry;
    if-eqz v9, :cond_4

    .line 703
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;

    if-eqz v13, :cond_8

    .line 704
    if-nez v3, :cond_6

    .line 705
    new-array v3, v5, [Lorg/eclipse/jgit/lib/ObjectId;

    .line 706
    :cond_6
    invoke-virtual {v9}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v13

    invoke-virtual {v13}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v13

    aput-object v13, v3, v5

    .line 718
    :cond_7
    aput-object v9, v10, v6

    goto :goto_4

    .line 707
    :cond_8
    invoke-virtual {v9}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v13

    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v13, v14}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->prefixCompare(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v13

    if-nez v13, :cond_7

    .line 714
    invoke-virtual {v9}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldPath()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v13

    move-object/from16 v0, p1

    iput-object v13, v0, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    .line 715
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v7}, Lorg/eclipse/jgit/blame/BlameGenerator;->blameEntireRegionOnParent(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v13

    goto :goto_2

    .line 723
    .end local v7           #parent:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v9           #r:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_9
    new-array v8, v5, [Lorg/eclipse/jgit/blame/Candidate;

    .line 724
    .local v8, parents:[Lorg/eclipse/jgit/blame/Candidate;
    const/4 v6, 0x0

    :goto_5
    if-ge v6, v5, :cond_e

    .line 725
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/blame/Candidate;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v7

    .line 728
    .restart local v7       #parent:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v10, :cond_b

    aget-object v13, v10, v6

    if-eqz v13, :cond_b

    .line 729
    aget-object v13, v10, v6

    invoke-virtual {v13}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldPath()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v13}, Lorg/eclipse/jgit/blame/Candidate;->create(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/blame/Candidate;

    move-result-object v4

    .line 731
    .local v4, p:Lorg/eclipse/jgit/blame/Candidate;
    aget-object v13, v10, v6

    invoke-virtual {v13}, Lorg/eclipse/jgit/diff/DiffEntry;->getScore()I

    move-result v13

    iput v13, v4, Lorg/eclipse/jgit/blame/Candidate;->renameScore:I

    .line 732
    aget-object v13, v10, v6

    invoke-virtual {v13}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v13

    invoke-virtual {v13}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v13

    iput-object v13, v4, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    .line 741
    :goto_6
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;

    if-eqz v13, :cond_c

    iget-object v13, v4, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    move-object/from16 v0, p1

    iget-object v14, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v13, v14}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v13

    if-eqz v13, :cond_c

    .line 744
    move-object/from16 v0, p1

    iget-object v13, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    iput-object v13, v4, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    .line 745
    new-instance v2, Lorg/eclipse/jgit/diff/EditList;

    const/4 v13, 0x0

    invoke-direct {v2, v13}, Lorg/eclipse/jgit/diff/EditList;-><init>(I)V

    .line 752
    .local v2, editList:Lorg/eclipse/jgit/diff/EditList;
    :goto_7
    invoke-virtual {v2}, Lorg/eclipse/jgit/diff/EditList;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_10

    .line 756
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;

    if-eqz v13, :cond_d

    .line 757
    aput-object v4, v8, v6

    .line 724
    .end local v2           #editList:Lorg/eclipse/jgit/diff/EditList;
    .end local v4           #p:Lorg/eclipse/jgit/blame/Candidate;
    :cond_a
    :goto_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 733
    :cond_b
    if-eqz v3, :cond_a

    aget-object v13, v3, v6

    if-eqz v13, :cond_a

    .line 734
    move-object/from16 v0, p1

    iget-object v13, v0, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-object/from16 v0, p1

    invoke-virtual {v0, v7, v13}, Lorg/eclipse/jgit/blame/Candidate;->create(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/blame/Candidate;

    move-result-object v4

    .line 735
    .restart local v4       #p:Lorg/eclipse/jgit/blame/Candidate;
    aget-object v13, v3, v6

    iput-object v13, v4, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    goto :goto_6

    .line 747
    :cond_c
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/blame/BlameGenerator;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v4, v13}, Lorg/eclipse/jgit/blame/Candidate;->loadText(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 748
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/blame/BlameGenerator;->diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/blame/BlameGenerator;->textComparator:Lorg/eclipse/jgit/diff/RawTextComparator;

    iget-object v15, v4, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    move-object/from16 v0, p1

    iget-object v0, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    move-object/from16 v16, v0

    invoke-virtual/range {v13 .. v16}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->diff(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v2

    .restart local v2       #editList:Lorg/eclipse/jgit/diff/EditList;
    goto :goto_7

    .line 761
    :cond_d
    move-object/from16 v0, p1

    iget-object v13, v0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    iput-object v13, v4, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 762
    const/4 v13, 0x0

    move-object/from16 v0, p1

    iput-object v13, v0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 763
    aput-object v4, v8, v6

    .line 786
    .end local v2           #editList:Lorg/eclipse/jgit/diff/EditList;
    .end local v4           #p:Lorg/eclipse/jgit/blame/Candidate;
    .end local v7           #parent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_e
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;

    if-eqz v13, :cond_17

    .line 789
    const/4 v11, 0x0

    .line 790
    .local v11, resultHead:Lorg/eclipse/jgit/blame/Candidate;
    const/4 v12, 0x0

    .line 792
    .local v12, resultTail:Lorg/eclipse/jgit/blame/Candidate;
    const/4 v6, 0x0

    :goto_9
    if-ge v6, v5, :cond_15

    .line 793
    aget-object v4, v8, v6

    .line 794
    .restart local v4       #p:Lorg/eclipse/jgit/blame/Candidate;
    if-nez v4, :cond_12

    .line 792
    :cond_f
    :goto_a
    add-int/lit8 v6, v6, 0x1

    goto :goto_9

    .line 767
    .end local v11           #resultHead:Lorg/eclipse/jgit/blame/Candidate;
    .end local v12           #resultTail:Lorg/eclipse/jgit/blame/Candidate;
    .restart local v2       #editList:Lorg/eclipse/jgit/diff/EditList;
    .restart local v7       #parent:Lorg/eclipse/jgit/revwalk/RevCommit;
    :cond_10
    move-object/from16 v0, p1

    invoke-virtual {v4, v2, v0}, Lorg/eclipse/jgit/blame/Candidate;->takeBlame(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/blame/Candidate;)V

    .line 771
    iget-object v13, v4, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    if-eqz v13, :cond_a

    .line 776
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;

    if-eqz v13, :cond_11

    .line 777
    iget-object v9, v4, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 778
    .local v9, r:Lorg/eclipse/jgit/blame/Region;
    move-object/from16 v0, p1

    iget-object v13, v0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    iput-object v13, v4, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 779
    move-object/from16 v0, p1

    iput-object v9, v0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 782
    .end local v9           #r:Lorg/eclipse/jgit/blame/Region;
    :cond_11
    aput-object v4, v8, v6

    goto :goto_8

    .line 797
    .end local v2           #editList:Lorg/eclipse/jgit/diff/EditList;
    .end local v7           #parent:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v11       #resultHead:Lorg/eclipse/jgit/blame/Candidate;
    .restart local v12       #resultTail:Lorg/eclipse/jgit/blame/Candidate;
    :cond_12
    iget-object v13, v4, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    if-eqz v13, :cond_13

    .line 798
    iget-object v13, v4, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v4, v13}, Lorg/eclipse/jgit/blame/Candidate;->copy(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/blame/Candidate;

    move-result-object v9

    .line 799
    .local v9, r:Lorg/eclipse/jgit/blame/Candidate;
    if-eqz v12, :cond_14

    .line 800
    iput-object v9, v12, Lorg/eclipse/jgit/blame/Candidate;->queueNext:Lorg/eclipse/jgit/blame/Candidate;

    .line 801
    move-object v12, v9

    .line 808
    .end local v9           #r:Lorg/eclipse/jgit/blame/Candidate;
    :cond_13
    :goto_b
    move-object/from16 v0, p1

    iget-object v13, v0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    if-eqz v13, :cond_f

    .line 809
    move-object/from16 v0, p1

    iget-object v13, v0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    invoke-virtual {v13}, Lorg/eclipse/jgit/blame/Region;->deepCopy()Lorg/eclipse/jgit/blame/Region;

    move-result-object v13

    iput-object v13, v4, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 810
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Lorg/eclipse/jgit/blame/Candidate;)V

    goto :goto_a

    .line 803
    .restart local v9       #r:Lorg/eclipse/jgit/blame/Candidate;
    :cond_14
    move-object v11, v9

    .line 804
    move-object v12, v9

    goto :goto_b

    .line 814
    .end local v4           #p:Lorg/eclipse/jgit/blame/Candidate;
    .end local v9           #r:Lorg/eclipse/jgit/blame/Candidate;
    :cond_15
    if-eqz v11, :cond_16

    .line 815
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/eclipse/jgit/blame/BlameGenerator;->result(Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v13

    goto/16 :goto_2

    .line 816
    :cond_16
    const/4 v13, 0x0

    goto/16 :goto_2

    .line 820
    .end local v11           #resultHead:Lorg/eclipse/jgit/blame/Candidate;
    .end local v12           #resultTail:Lorg/eclipse/jgit/blame/Candidate;
    :cond_17
    const/4 v6, 0x0

    :goto_c
    if-ge v6, v5, :cond_19

    .line 821
    aget-object v13, v8, v6

    if-eqz v13, :cond_18

    .line 822
    aget-object v13, v8, v6

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Lorg/eclipse/jgit/blame/Candidate;)V

    .line 820
    :cond_18
    add-int/lit8 v6, v6, 0x1

    goto :goto_c

    .line 825
    :cond_19
    move-object/from16 v0, p1

    iget-object v13, v0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    if-eqz v13, :cond_1a

    .line 826
    invoke-direct/range {p0 .. p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->result(Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v13

    goto/16 :goto_2

    .line 827
    :cond_1a
    const/4 v13, 0x0

    goto/16 :goto_2
.end method

.method private processOne(Lorg/eclipse/jgit/blame/Candidate;)Z
    .locals 6
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 599
    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/blame/Candidate;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 600
    .local v1, parent:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-nez v1, :cond_0

    .line 601
    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/blame/Candidate;->getNextCandidate(I)Lorg/eclipse/jgit/blame/Candidate;

    move-result-object v3

    invoke-direct {p0, v3, p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->split(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v3

    .line 630
    :goto_0
    return v3

    .line 602
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 604
    iget-object v4, p1, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-direct {p0, v1, v4}, Lorg/eclipse/jgit/blame/BlameGenerator;->find(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 605
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    iget-object v4, p1, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v3, v4}, Lorg/eclipse/jgit/lib/MutableObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 606
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jgit/blame/BlameGenerator;->blameEntireRegionOnParent(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v3

    goto :goto_0

    .line 607
    :cond_1
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jgit/blame/BlameGenerator;->splitBlameWithParent(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v3

    goto :goto_0

    .line 610
    :cond_2
    iget-object v4, p1, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-nez v4, :cond_3

    .line 611
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->result(Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v3

    goto :goto_0

    .line 613
    :cond_3
    iget-object v4, p1, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    iget-object v5, p1, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-direct {p0, v1, v4, v5}, Lorg/eclipse/jgit/blame/BlameGenerator;->findRename(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v2

    .line 614
    .local v2, r:Lorg/eclipse/jgit/diff/DiffEntry;
    if-nez v2, :cond_4

    .line 615
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->result(Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v3

    goto :goto_0

    .line 617
    :cond_4
    invoke-virtual {v2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v4

    iget-object v5, p1, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->prefixCompare(Lorg/eclipse/jgit/lib/AnyObjectId;)I

    move-result v4

    if-nez v4, :cond_5

    .line 620
    iput-object v1, p1, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 621
    invoke-virtual {v2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v4

    iput-object v4, p1, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    .line 622
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Lorg/eclipse/jgit/blame/Candidate;)V

    goto :goto_0

    .line 626
    :cond_5
    invoke-virtual {v2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Lorg/eclipse/jgit/blame/Candidate;->create(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/blame/Candidate;

    move-result-object v0

    .line 627
    .local v0, next:Lorg/eclipse/jgit/blame/Candidate;
    invoke-virtual {v2}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    iput-object v3, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    .line 628
    invoke-virtual {v2}, Lorg/eclipse/jgit/diff/DiffEntry;->getScore()I

    move-result v3

    iput v3, v0, Lorg/eclipse/jgit/blame/Candidate;->renameScore:I

    .line 629
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/blame/Candidate;->loadText(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 630
    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->split(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v3

    goto :goto_0
.end method

.method private push(Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;)V
    .locals 2
    .parameter "toInsert"

    .prologue
    .line 548
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->queue:Lorg/eclipse/jgit/blame/Candidate;

    .line 549
    .local v0, c:Lorg/eclipse/jgit/blame/Candidate;
    if-eqz v0, :cond_0

    .line 550
    iget-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/blame/Candidate;->remove(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 551
    const/4 v1, 0x0

    iput-object v1, v0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 552
    iput-object v0, p1, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->parent:Lorg/eclipse/jgit/blame/Candidate;

    .line 554
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->queue:Lorg/eclipse/jgit/blame/Candidate;

    .line 555
    return-void
.end method

.method private push(Lorg/eclipse/jgit/blame/Candidate;)V
    .locals 4
    .parameter "toInsert"

    .prologue
    .line 558
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/blame/Candidate;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 569
    iget-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->queue:Lorg/eclipse/jgit/blame/Candidate;

    .local v1, p:Lorg/eclipse/jgit/blame/Candidate;
    :goto_0
    if-eqz v1, :cond_1

    .line 570
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/blame/Candidate;->canMergeRegions(Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 571
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/blame/Candidate;->mergeRegions(Lorg/eclipse/jgit/blame/Candidate;)V

    .line 593
    .end local v1           #p:Lorg/eclipse/jgit/blame/Candidate;
    :goto_1
    return-void

    .line 569
    .restart local v1       #p:Lorg/eclipse/jgit/blame/Candidate;
    :cond_0
    iget-object v1, v1, Lorg/eclipse/jgit/blame/Candidate;->queueNext:Lorg/eclipse/jgit/blame/Candidate;

    goto :goto_0

    .line 576
    .end local v1           #p:Lorg/eclipse/jgit/blame/Candidate;
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->SEEN:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v3}, Lorg/eclipse/jgit/blame/Candidate;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 580
    invoke-virtual {p1}, Lorg/eclipse/jgit/blame/Candidate;->getTime()I

    move-result v2

    .line 581
    .local v2, time:I
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->queue:Lorg/eclipse/jgit/blame/Candidate;

    .line 582
    .local v0, n:Lorg/eclipse/jgit/blame/Candidate;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/Candidate;->getTime()I

    move-result v3

    if-lt v2, v3, :cond_3

    .line 583
    :cond_2
    iput-object v0, p1, Lorg/eclipse/jgit/blame/Candidate;->queueNext:Lorg/eclipse/jgit/blame/Candidate;

    .line 584
    iput-object p1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->queue:Lorg/eclipse/jgit/blame/Candidate;

    goto :goto_1

    .line 588
    :cond_3
    move-object v1, v0

    .line 589
    .restart local v1       #p:Lorg/eclipse/jgit/blame/Candidate;
    :goto_2
    iget-object v0, v1, Lorg/eclipse/jgit/blame/Candidate;->queueNext:Lorg/eclipse/jgit/blame/Candidate;

    .line 590
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/Candidate;->getTime()I

    move-result v3

    if-lt v2, v3, :cond_5

    .line 591
    :cond_4
    iput-object v0, p1, Lorg/eclipse/jgit/blame/Candidate;->queueNext:Lorg/eclipse/jgit/blame/Candidate;

    .line 592
    iput-object p1, v1, Lorg/eclipse/jgit/blame/Candidate;->queueNext:Lorg/eclipse/jgit/blame/Candidate;

    goto :goto_1

    .line 588
    :cond_5
    move-object v1, v0

    goto :goto_2
.end method

.method private result(Lorg/eclipse/jgit/blame/Candidate;)Z
    .locals 1
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 522
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/blame/Candidate;->beginResult(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 523
    iput-object p1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outCandidate:Lorg/eclipse/jgit/blame/Candidate;

    .line 524
    iget-object v0, p1, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outRegion:Lorg/eclipse/jgit/blame/Region;

    .line 525
    const/4 v0, 0x1

    return v0
.end method

.method private reverseResult(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Candidate;)Z
    .locals 2
    .parameter "parent"
    .parameter "source"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 533
    iget-object v1, p1, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {p1, v1}, Lorg/eclipse/jgit/blame/Candidate;->copy(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/blame/Candidate;

    move-result-object v0

    .line 534
    .local v0, res:Lorg/eclipse/jgit/blame/Candidate;
    iget-object v1, p2, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    iput-object v1, v0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 535
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->result(Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v1

    return v1
.end method

.method private split(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Candidate;)Z
    .locals 6
    .parameter "parent"
    .parameter "source"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 650
    iget-object v2, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->textComparator:Lorg/eclipse/jgit/diff/RawTextComparator;

    iget-object v4, p1, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    iget-object v5, p2, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {v2, v3, v4, v5}, Lorg/eclipse/jgit/diff/DiffAlgorithm;->diff(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;

    move-result-object v0

    .line 652
    .local v0, editList:Lorg/eclipse/jgit/diff/EditList;
    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/EditList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 656
    iget-object v2, p2, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    iput-object v2, p1, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 657
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Lorg/eclipse/jgit/blame/Candidate;)V

    .line 669
    :cond_0
    :goto_0
    return v1

    .line 661
    :cond_1
    invoke-virtual {p1, v0, p2}, Lorg/eclipse/jgit/blame/Candidate;->takeBlame(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/blame/Candidate;)V

    .line 662
    iget-object v2, p1, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    if-eqz v2, :cond_2

    .line 663
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Lorg/eclipse/jgit/blame/Candidate;)V

    .line 664
    :cond_2
    iget-object v2, p2, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    if-eqz v2, :cond_0

    .line 665
    instance-of v1, p2, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;

    if-eqz v1, :cond_3

    .line 666
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/blame/BlameGenerator;->reverseResult(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v1

    goto :goto_0

    .line 667
    :cond_3
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/blame/BlameGenerator;->result(Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v1

    goto :goto_0
.end method

.method private splitBlameWithParent(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 2
    .parameter "n"
    .parameter "parent"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 642
    iget-object v1, p1, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {p1, p2, v1}, Lorg/eclipse/jgit/blame/Candidate;->create(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/blame/Candidate;

    move-result-object v0

    .line 643
    .local v0, next:Lorg/eclipse/jgit/blame/Candidate;
    iget-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/MutableObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    iput-object v1, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    .line 644
    iget-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/blame/Candidate;->loadText(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 645
    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->split(Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v1

    return v1
.end method


# virtual methods
.method public computeBlameResult()Lorg/eclipse/jgit/blame/BlameResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 449
    :try_start_0
    invoke-static {p0}, Lorg/eclipse/jgit/blame/BlameResult;->create(Lorg/eclipse/jgit/blame/BlameGenerator;)Lorg/eclipse/jgit/blame/BlameResult;

    move-result-object v0

    .line 450
    .local v0, r:Lorg/eclipse/jgit/blame/BlameResult;
    if-eqz v0, :cond_0

    .line 451
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameResult;->computeAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 454
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->release()V

    return-object v0

    .end local v0           #r:Lorg/eclipse/jgit/blame/BlameResult;
    :catchall_0
    move-exception v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->release()V

    throw v1
.end method

.method public getRegionLength()I
    .locals 1

    .prologue
    .line 912
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outRegion:Lorg/eclipse/jgit/blame/Region;

    iget v0, v0, Lorg/eclipse/jgit/blame/Region;->length:I

    return v0
.end method

.method public getRenameDetector()Lorg/eclipse/jgit/diff/RenameDetector;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    return-object v0
.end method

.method public getRenameScore()I
    .locals 1

    .prologue
    .line 861
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outCandidate:Lorg/eclipse/jgit/blame/Candidate;

    iget v0, v0, Lorg/eclipse/jgit/blame/Candidate;->renameScore:I

    return v0
.end method

.method public getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 191
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->repository:Lorg/eclipse/jgit/lib/Repository;

    return-object v0
.end method

.method public getResultContents()Lorg/eclipse/jgit/diff/RawText;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 937
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->queue:Lorg/eclipse/jgit/blame/Candidate;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->queue:Lorg/eclipse/jgit/blame/Candidate;

    iget-object v0, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getResultEnd()I
    .locals 3

    .prologue
    .line 901
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outRegion:Lorg/eclipse/jgit/blame/Region;

    .line 902
    .local v0, r:Lorg/eclipse/jgit/blame/Region;
    iget v1, v0, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    iget v2, v0, Lorg/eclipse/jgit/blame/Region;->length:I

    add-int/2addr v1, v2

    return v1
.end method

.method public getResultPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->resultPath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResultStart()I
    .locals 1

    .prologue
    .line 890
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outRegion:Lorg/eclipse/jgit/blame/Region;

    iget v0, v0, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    return v0
.end method

.method public getSourceAuthor()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 845
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outCandidate:Lorg/eclipse/jgit/blame/Candidate;

    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/Candidate;->getAuthor()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v0

    return-object v0
.end method

.method public getSourceCommit()Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1

    .prologue
    .line 840
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outCandidate:Lorg/eclipse/jgit/blame/Candidate;

    iget-object v0, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    return-object v0
.end method

.method public getSourceCommitter()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 2

    .prologue
    .line 850
    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->getSourceCommit()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    .line 851
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevCommit;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitterIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getSourceContents()Lorg/eclipse/jgit/diff/RawText;
    .locals 1

    .prologue
    .line 923
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outCandidate:Lorg/eclipse/jgit/blame/Candidate;

    iget-object v0, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    return-object v0
.end method

.method public getSourceEnd()I
    .locals 3

    .prologue
    .line 881
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outRegion:Lorg/eclipse/jgit/blame/Region;

    .line 882
    .local v0, r:Lorg/eclipse/jgit/blame/Region;
    iget v1, v0, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    iget v2, v0, Lorg/eclipse/jgit/blame/Region;->length:I

    add-int/2addr v1, v2

    return v1
.end method

.method public getSourcePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 856
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outCandidate:Lorg/eclipse/jgit/blame/Candidate;

    iget-object v0, v0, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->getPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSourceStart()I
    .locals 1

    .prologue
    .line 871
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outRegion:Lorg/eclipse/jgit/blame/Region;

    iget v0, v0, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    return v0
.end method

.method public newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;
    .locals 1
    .parameter "name"

    .prologue
    .line 437
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    return-object v0
.end method

.method public next()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x1

    .line 470
    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outRegion:Lorg/eclipse/jgit/blame/Region;

    if-eqz v4, :cond_2

    .line 471
    iget-object v2, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outRegion:Lorg/eclipse/jgit/blame/Region;

    .line 472
    .local v2, r:Lorg/eclipse/jgit/blame/Region;
    iget v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->remaining:I

    iget v5, v2, Lorg/eclipse/jgit/blame/Region;->length:I

    sub-int/2addr v4, v5

    iput v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->remaining:I

    .line 473
    iget-object v4, v2, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    if-eqz v4, :cond_0

    .line 474
    iget-object v4, v2, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    iput-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outRegion:Lorg/eclipse/jgit/blame/Region;

    .line 511
    .end local v2           #r:Lorg/eclipse/jgit/blame/Region;
    :goto_0
    return v3

    .line 478
    .restart local v2       #r:Lorg/eclipse/jgit/blame/Region;
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outCandidate:Lorg/eclipse/jgit/blame/Candidate;

    iget-object v4, v4, Lorg/eclipse/jgit/blame/Candidate;->queueNext:Lorg/eclipse/jgit/blame/Candidate;

    if-eqz v4, :cond_1

    .line 479
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outCandidate:Lorg/eclipse/jgit/blame/Candidate;

    iget-object v3, v3, Lorg/eclipse/jgit/blame/Candidate;->queueNext:Lorg/eclipse/jgit/blame/Candidate;

    invoke-direct {p0, v3}, Lorg/eclipse/jgit/blame/BlameGenerator;->result(Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v3

    goto :goto_0

    .line 481
    :cond_1
    iput-object v6, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outCandidate:Lorg/eclipse/jgit/blame/Candidate;

    .line 482
    iput-object v6, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outRegion:Lorg/eclipse/jgit/blame/Region;

    .line 487
    .end local v2           #r:Lorg/eclipse/jgit/blame/Region;
    :cond_2
    iget v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->remaining:I

    if-nez v4, :cond_4

    .line 488
    invoke-direct {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->done()Z

    move-result v3

    goto :goto_0

    .line 504
    .local v0, n:Lorg/eclipse/jgit/blame/Candidate;
    .local v1, pCnt:I
    :cond_3
    instance-of v4, v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;

    if-eqz v4, :cond_7

    .line 491
    .end local v0           #n:Lorg/eclipse/jgit/blame/Candidate;
    .end local v1           #pCnt:I
    :cond_4
    invoke-direct {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->pop()Lorg/eclipse/jgit/blame/Candidate;

    move-result-object v0

    .line 492
    .restart local v0       #n:Lorg/eclipse/jgit/blame/Candidate;
    if-nez v0, :cond_5

    .line 493
    invoke-direct {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->done()Z

    move-result v3

    goto :goto_0

    .line 495
    :cond_5
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/Candidate;->getParentCount()I

    move-result v1

    .line 496
    .restart local v1       #pCnt:I
    if-ne v1, v3, :cond_6

    .line 497
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->processOne(Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v4

    if-eqz v4, :cond_4

    goto :goto_0

    .line 500
    :cond_6
    if-ge v3, v1, :cond_3

    .line 501
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->processMerge(Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v4

    if-eqz v4, :cond_4

    goto :goto_0

    .line 511
    :cond_7
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->result(Lorg/eclipse/jgit/blame/Candidate;)Z

    move-result v3

    goto :goto_0
.end method

.method public push(Ljava/lang/String;Lorg/eclipse/jgit/diff/RawText;)Lorg/eclipse/jgit/blame/BlameGenerator;
    .locals 4
    .parameter "description"
    .parameter "contents"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 290
    if-nez p1, :cond_0

    .line 291
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object p1, v1, Lorg/eclipse/jgit/internal/JGitText;->blameNotCommittedYet:Ljava/lang/String;

    .line 292
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;

    iget-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->resultPath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-direct {v0, p1, v1}, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V

    .line 293
    .local v0, c:Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;
    iput-object p2, v0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    .line 294
    new-instance v1, Lorg/eclipse/jgit/blame/Region;

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v2

    invoke-direct {v1, v3, v3, v2}, Lorg/eclipse/jgit/blame/Region;-><init>(III)V

    iput-object v1, v0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 295
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->remaining:I

    .line 296
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;)V

    .line 297
    return-object p0
.end method

.method public push(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/blame/BlameGenerator;
    .locals 6
    .parameter "description"
    .parameter "id"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 318
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v3, p2}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v2

    .line 319
    .local v2, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectLoader;->getType()I

    move-result v3

    const/4 v4, 0x3

    if-ne v3, v4, :cond_2

    .line 320
    if-nez p1, :cond_0

    .line 321
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object p1, v3, Lorg/eclipse/jgit/internal/JGitText;->blameNotCommittedYet:Ljava/lang/String;

    .line 322
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;

    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->resultPath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-direct {v0, p1, v3}, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;-><init>(Ljava/lang/String;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V

    .line 323
    .local v0, c:Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    iput-object v3, v0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    .line 324
    new-instance v3, Lorg/eclipse/jgit/diff/RawText;

    const v4, 0x7fffffff

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes(I)[B

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    iput-object v3, v0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    .line 325
    new-instance v3, Lorg/eclipse/jgit/blame/Region;

    iget-object v4, v0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v4

    invoke-direct {v3, v5, v5, v4}, Lorg/eclipse/jgit/blame/Region;-><init>(III)V

    iput-object v3, v0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 326
    iget-object v3, v0, Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v3

    iput v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->remaining:I

    .line 327
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;)V

    .line 341
    .end local v0           #c:Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;
    :cond_1
    :goto_0
    return-object p0

    .line 331
    :cond_2
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v3, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v1

    .line 332
    .local v1, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->resultPath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-direct {p0, v1, v3}, Lorg/eclipse/jgit/blame/BlameGenerator;->find(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 335
    new-instance v0, Lorg/eclipse/jgit/blame/Candidate;

    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->resultPath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-direct {v0, v1, v3}, Lorg/eclipse/jgit/blame/Candidate;-><init>(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V

    .line 336
    .local v0, c:Lorg/eclipse/jgit/blame/Candidate;
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/MutableObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    iput-object v3, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    .line 337
    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/blame/Candidate;->loadText(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 338
    new-instance v3, Lorg/eclipse/jgit/blame/Region;

    iget-object v4, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v4

    invoke-direct {v3, v5, v5, v4}, Lorg/eclipse/jgit/blame/Region;-><init>(III)V

    iput-object v3, v0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 339
    iget-object v3, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v3

    iput v3, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->remaining:I

    .line 340
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Lorg/eclipse/jgit/blame/Candidate;)V

    goto :goto_0
.end method

.method public push(Ljava/lang/String;[B)Lorg/eclipse/jgit/blame/BlameGenerator;
    .locals 1
    .parameter "description"
    .parameter "contents"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 269
    new-instance v0, Lorg/eclipse/jgit/diff/RawText;

    invoke-direct {v0, p2}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Ljava/lang/String;Lorg/eclipse/jgit/diff/RawText;)Lorg/eclipse/jgit/blame/BlameGenerator;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 942
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->release()V

    .line 943
    iput-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->queue:Lorg/eclipse/jgit/blame/Candidate;

    .line 944
    iput-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outCandidate:Lorg/eclipse/jgit/blame/Candidate;

    .line 945
    iput-object v1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->outRegion:Lorg/eclipse/jgit/blame/Region;

    .line 946
    return-void
.end method

.method public reverse(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/util/Collection;)Lorg/eclipse/jgit/blame/BlameGenerator;
    .locals 7
    .parameter "start"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/AnyObjectId;",
            "Ljava/util/Collection",
            "<+",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)",
            "Lorg/eclipse/jgit/blame/BlameGenerator;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p2, end:Ljava/util/Collection;,"Ljava/util/Collection<+Lorg/eclipse/jgit/lib/ObjectId;>;"
    const/4 v6, 0x0

    .line 405
    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lorg/eclipse/jgit/blame/BlameGenerator;->initRevPool(Z)V

    .line 407
    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;

    .line 408
    .local v3, result:Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;
    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->resultPath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-direct {p0, v3, v4}, Lorg/eclipse/jgit/blame/BlameGenerator;->find(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 425
    :goto_0
    return-object p0

    .line 411
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 412
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/lib/ObjectId;

    .line 413
    .local v2, id:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v5, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v5, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    goto :goto_1

    .line 415
    .end local v2           #id:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->revPool:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v4}, Lorg/eclipse/jgit/revwalk/RevWalk;->next()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v4

    if-nez v4, :cond_1

    .line 419
    new-instance v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;

    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->resultPath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-direct {v0, v3, v4}, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;-><init>(Lorg/eclipse/jgit/blame/ReverseWalk$ReverseCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V

    .line 420
    .local v0, c:Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;
    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->idBuf:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/MutableObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    iput-object v4, v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    .line 421
    iget-object v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->reader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v0, v4}, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;->loadText(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 422
    new-instance v4, Lorg/eclipse/jgit/blame/Region;

    iget-object v5, v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {v5}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v5

    invoke-direct {v4, v6, v6, v5}, Lorg/eclipse/jgit/blame/Region;-><init>(III)V

    iput-object v4, v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 423
    iget-object v4, v0, Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v4

    iput v4, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->remaining:I

    .line 424
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Lorg/eclipse/jgit/blame/Candidate;)V

    goto :goto_0
.end method

.method public reverse(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/blame/BlameGenerator;
    .locals 1
    .parameter "start"
    .parameter "end"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 373
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->reverse(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/util/Collection;)Lorg/eclipse/jgit/blame/BlameGenerator;

    move-result-object v0

    return-object v0
.end method

.method public setDiffAlgorithm(Lorg/eclipse/jgit/diff/DiffAlgorithm;)Lorg/eclipse/jgit/blame/BlameGenerator;
    .locals 0
    .parameter "algorithm"

    .prologue
    .line 206
    iput-object p1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    .line 207
    return-object p0
.end method

.method public setFollowFileRenames(Z)Lorg/eclipse/jgit/blame/BlameGenerator;
    .locals 2
    .parameter "follow"

    .prologue
    .line 234
    if-eqz p1, :cond_0

    .line 235
    new-instance v0, Lorg/eclipse/jgit/diff/RenameDetector;

    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/diff/RenameDetector;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    .line 238
    :goto_0
    return-object p0

    .line 237
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->renameDetector:Lorg/eclipse/jgit/diff/RenameDetector;

    goto :goto_0
.end method

.method public setTextComparator(Lorg/eclipse/jgit/diff/RawTextComparator;)Lorg/eclipse/jgit/blame/BlameGenerator;
    .locals 0
    .parameter "comparator"

    .prologue
    .line 217
    iput-object p1, p0, Lorg/eclipse/jgit/blame/BlameGenerator;->textComparator:Lorg/eclipse/jgit/diff/RawTextComparator;

    .line 218
    return-object p0
.end method
