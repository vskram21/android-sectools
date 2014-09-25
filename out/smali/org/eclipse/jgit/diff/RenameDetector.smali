.class public Lorg/eclipse/jgit/diff/RenameDetector;
.super Ljava/lang/Object;
.source "RenameDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/diff/RenameDetector$2;
    }
.end annotation


# static fields
.field private static final DIFF_COMPARATOR:Ljava/util/Comparator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation
.end field

.field private static final EXACT_RENAME_SCORE:I = 0x64


# instance fields
.field private added:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation
.end field

.field private breakScore:I

.field private deleted:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation
.end field

.field private done:Z

.field private entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final objectReader:Lorg/eclipse/jgit/lib/ObjectReader;

.field private overRenameLimit:Z

.field private renameLimit:I

.field private renameScore:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 72
    new-instance v0, Lorg/eclipse/jgit/diff/RenameDetector$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/RenameDetector$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/diff/RenameDetector;->DIFF_COMPARATOR:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/diff/DiffConfig;)V
    .locals 1
    .parameter "reader"
    .parameter "cfg"

    .prologue
    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    const/16 v0, 0x3c

    iput v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->renameScore:I

    .line 124
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->breakScore:I

    .line 152
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectReader;->newReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->objectReader:Lorg/eclipse/jgit/lib/ObjectReader;

    .line 153
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/DiffConfig;->getRenameLimit()I

    move-result v0

    iput v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->renameLimit:I

    .line 154
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/RenameDetector;->reset()V

    .line 155
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 3
    .parameter "repo"

    .prologue
    .line 139
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->newObjectReader()Lorg/eclipse/jgit/lib/ObjectReader;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    sget-object v2, Lorg/eclipse/jgit/diff/DiffConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffConfig;

    invoke-direct {p0, v1, v0}, Lorg/eclipse/jgit/diff/RenameDetector;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/diff/DiffConfig;)V

    .line 140
    return-void
.end method

.method private static bestPathMatch(Lorg/eclipse/jgit/diff/DiffEntry;Ljava/util/List;)Lorg/eclipse/jgit/diff/DiffEntry;
    .locals 7
    .parameter "src"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;)",
            "Lorg/eclipse/jgit/diff/DiffEntry;"
        }
    .end annotation

    .prologue
    .line 659
    .local p1, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    const/4 v0, 0x0

    .line 660
    .local v0, best:Lorg/eclipse/jgit/diff/DiffEntry;
    const/4 v3, -0x1

    .line 662
    .local v3, score:I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 663
    .local v1, d:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-static {v1}, Lorg/eclipse/jgit/diff/RenameDetector;->mode(Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v5

    invoke-static {p0}, Lorg/eclipse/jgit/diff/RenameDetector;->mode(Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/eclipse/jgit/diff/RenameDetector;->sameType(Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 664
    invoke-static {v1}, Lorg/eclipse/jgit/diff/RenameDetector;->path(Lorg/eclipse/jgit/diff/DiffEntry;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0}, Lorg/eclipse/jgit/diff/RenameDetector;->path(Lorg/eclipse/jgit/diff/DiffEntry;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->nameScore(Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 666
    .local v4, tmp:I
    if-le v4, v3, :cond_0

    .line 667
    move-object v0, v1

    .line 668
    move v3, v4

    goto :goto_0

    .line 673
    .end local v1           #d:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v4           #tmp:I
    :cond_1
    return-object v0
.end method

.method private breakModifies(Lorg/eclipse/jgit/diff/ContentSource$Pair;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 9
    .parameter "reader"
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 403
    new-instance v3, Ljava/util/ArrayList;

    iget-object v6, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 405
    .local v3, newEntries:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->renamesBreakingModifies:Ljava/lang/String;

    iget-object v7, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    invoke-interface {p2, v6, v7}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 407
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v6, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v2, v6, :cond_2

    .line 408
    iget-object v6, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 409
    .local v1, e:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v6

    sget-object v7, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v6, v7, :cond_1

    .line 410
    invoke-direct {p0, p1, v1}, Lorg/eclipse/jgit/diff/RenameDetector;->calculateModifyScore(Lorg/eclipse/jgit/diff/ContentSource$Pair;Lorg/eclipse/jgit/diff/DiffEntry;)I

    move-result v4

    .line 411
    .local v4, score:I
    iget v6, p0, Lorg/eclipse/jgit/diff/RenameDetector;->breakScore:I

    if-ge v4, v6, :cond_0

    .line 412
    invoke-static {v1}, Lorg/eclipse/jgit/diff/DiffEntry;->breakModify(Lorg/eclipse/jgit/diff/DiffEntry;)Ljava/util/List;

    move-result-object v5

    .line 413
    .local v5, tmp:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    const/4 v6, 0x0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 414
    .local v0, del:Lorg/eclipse/jgit/diff/DiffEntry;
    iput v4, v0, Lorg/eclipse/jgit/diff/DiffEntry;->score:I

    .line 415
    iget-object v6, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 416
    iget-object v6, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 423
    .end local v0           #del:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v4           #score:I
    .end local v5           #tmp:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    :goto_1
    invoke-interface {p2, v8}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 407
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 418
    .restart local v4       #score:I
    :cond_0
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 421
    .end local v4           #score:I
    :cond_1
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 426
    .end local v1           #e:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_2
    iput-object v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    .line 427
    return-void
.end method

.method private calculateModifyScore(Lorg/eclipse/jgit/diff/ContentSource$Pair;Lorg/eclipse/jgit/diff/DiffEntry;)I
    .locals 4
    .parameter "reader"
    .parameter "d"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 464
    :try_start_0
    new-instance v1, Lorg/eclipse/jgit/diff/SimilarityIndex;

    invoke-direct {v1}, Lorg/eclipse/jgit/diff/SimilarityIndex;-><init>()V

    .line 465
    .local v1, src:Lorg/eclipse/jgit/diff/SimilarityIndex;
    sget-object v3, Lorg/eclipse/jgit/diff/DiffEntry$Side;->OLD:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    invoke-virtual {p1, v3, p2}, Lorg/eclipse/jgit/diff/ContentSource$Pair;->open(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/eclipse/jgit/diff/SimilarityIndex;->hash(Lorg/eclipse/jgit/lib/ObjectLoader;)V

    .line 466
    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/SimilarityIndex;->sort()V

    .line 468
    new-instance v0, Lorg/eclipse/jgit/diff/SimilarityIndex;

    invoke-direct {v0}, Lorg/eclipse/jgit/diff/SimilarityIndex;-><init>()V

    .line 469
    .local v0, dst:Lorg/eclipse/jgit/diff/SimilarityIndex;
    sget-object v3, Lorg/eclipse/jgit/diff/DiffEntry$Side;->NEW:Lorg/eclipse/jgit/diff/DiffEntry$Side;

    invoke-virtual {p1, v3, p2}, Lorg/eclipse/jgit/diff/ContentSource$Pair;->open(Lorg/eclipse/jgit/diff/DiffEntry$Side;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/eclipse/jgit/diff/SimilarityIndex;->hash(Lorg/eclipse/jgit/lib/ObjectLoader;)V

    .line 470
    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/SimilarityIndex;->sort()V

    .line 471
    const/16 v3, 0x64

    invoke-virtual {v1, v0, v3}, Lorg/eclipse/jgit/diff/SimilarityIndex;->score(Lorg/eclipse/jgit/diff/SimilarityIndex;I)I
    :try_end_0
    .catch Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 478
    .end local v0           #dst:Lorg/eclipse/jgit/diff/SimilarityIndex;
    .end local v1           #src:Lorg/eclipse/jgit/diff/SimilarityIndex;
    :goto_0
    return v3

    .line 472
    :catch_0
    move-exception v2

    .line 477
    .local v2, tableFull:Lorg/eclipse/jgit/diff/SimilarityIndex$TableFullException;
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->overRenameLimit:Z

    .line 478
    iget v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->breakScore:I

    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private static exactCopy(Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/DiffEntry;
    .locals 2
    .parameter "src"
    .parameter "dst"

    .prologue
    .line 724
    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    const/16 v1, 0x64

    invoke-static {v0, p0, p1, v1}, Lorg/eclipse/jgit/diff/DiffEntry;->pair(Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;I)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v0

    return-object v0
.end method

.method private static exactRename(Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/DiffEntry;
    .locals 2
    .parameter "src"
    .parameter "dst"

    .prologue
    .line 720
    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    const/16 v1, 0x64

    invoke-static {v0, p0, p1, v1}, Lorg/eclipse/jgit/diff/DiffEntry;->pair(Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;I)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v0

    return-object v0
.end method

.method private findContentRenames(Lorg/eclipse/jgit/diff/ContentSource$Pair;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 4
    .parameter "reader"
    .parameter "pm"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 485
    iget-object v2, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget-object v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 486
    .local v0, cnt:I
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/RenameDetector;->getRenameLimit()I

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/RenameDetector;->getRenameLimit()I

    move-result v2

    if-gt v0, v2, :cond_1

    .line 489
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;

    iget-object v2, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    iget-object v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-direct {v1, p1, v2, v3}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;-><init>(Lorg/eclipse/jgit/diff/ContentSource$Pair;Ljava/util/List;Ljava/util/List;)V

    .line 490
    .local v1, d:Lorg/eclipse/jgit/diff/SimilarityRenameDetector;
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/RenameDetector;->getRenameScore()I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->setRenameScore(I)V

    .line 491
    invoke-virtual {v1, p2}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->compute(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 492
    iget-boolean v2, p0, Lorg/eclipse/jgit/diff/RenameDetector;->overRenameLimit:Z

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->isTableOverflow()Z

    move-result v3

    or-int/2addr v2, v3

    iput-boolean v2, p0, Lorg/eclipse/jgit/diff/RenameDetector;->overRenameLimit:Z

    .line 493
    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->getLeftOverSources()Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    .line 494
    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->getLeftOverDestinations()Ljava/util/List;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    .line 495
    iget-object v2, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->getMatches()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 499
    .end local v1           #d:Lorg/eclipse/jgit/diff/SimilarityRenameDetector;
    :goto_0
    return-void

    .line 497
    :cond_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/eclipse/jgit/diff/RenameDetector;->overRenameLimit:Z

    goto :goto_0
.end method

.method private findExactRenames(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 33
    .parameter "pm"

    .prologue
    .line 503
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v29

    move-object/from16 v0, v29

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->renamesFindingExact:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    move-object/from16 v30, v0

    invoke-interface/range {v30 .. v30}, Ljava/util/List;->size()I

    move-result v30

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Ljava/util/List;->size()I

    move-result v31

    add-int v30, v30, v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Ljava/util/List;->size()I

    move-result v31

    add-int v30, v30, v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    move-object/from16 v31, v0

    invoke-interface/range {v31 .. v31}, Ljava/util/List;->size()I

    move-result v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    move-object/from16 v32, v0

    invoke-interface/range {v32 .. v32}, Ljava/util/List;->size()I

    move-result v32

    mul-int v31, v31, v32

    add-int v30, v30, v31

    move-object/from16 v0, p1

    move-object/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 507
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/diff/RenameDetector;->populateMap(Ljava/util/List;Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/HashMap;

    move-result-object v12

    .line 508
    .local v12, deletedMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Ljava/lang/Object;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lorg/eclipse/jgit/diff/RenameDetector;->populateMap(Ljava/util/List;Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/HashMap;

    move-result-object v5

    .line 510
    .local v5, addedMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Ljava/lang/Object;>;"
    new-instance v28, Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Ljava/util/List;->size()I

    move-result v29

    invoke-direct/range {v28 .. v29}, Ljava/util/ArrayList;-><init>(I)V

    .line 511
    .local v28, uniqueAdds:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    .line 513
    .local v24, nonUniqueAdds:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;>;"
    invoke-virtual {v5}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v29

    invoke-interface/range {v29 .. v29}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .local v18, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_1

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    .line 514
    .local v25, o:Ljava/lang/Object;
    move-object/from16 v0, v25

    instance-of v0, v0, Lorg/eclipse/jgit/diff/DiffEntry;

    move/from16 v29, v0

    if-eqz v29, :cond_0

    .line 515
    check-cast v25, Lorg/eclipse/jgit/diff/DiffEntry;

    .end local v25           #o:Ljava/lang/Object;
    move-object/from16 v0, v28

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 517
    .restart local v25       #o:Ljava/lang/Object;
    :cond_0
    check-cast v25, Ljava/util/List;

    .end local v25           #o:Ljava/lang/Object;
    invoke-virtual/range {v24 .. v25}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 520
    :cond_1
    new-instance v20, Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    move-object/from16 v29, v0

    invoke-interface/range {v29 .. v29}, Ljava/util/List;->size()I

    move-result v29

    move-object/from16 v0, v20

    move/from16 v1, v29

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 522
    .local v20, left:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_1
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_6

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 523
    .local v3, a:Lorg/eclipse/jgit/diff/DiffEntry;
    iget-object v0, v3, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 524
    .local v10, del:Ljava/lang/Object;
    instance-of v0, v10, Lorg/eclipse/jgit/diff/DiffEntry;

    move/from16 v29, v0

    if-eqz v29, :cond_3

    move-object v15, v10

    .line 527
    check-cast v15, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 528
    .local v15, e:Lorg/eclipse/jgit/diff/DiffEntry;
    iget-object v0, v15, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v29, v0

    iget-object v0, v3, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v30, v0

    invoke-static/range {v29 .. v30}, Lorg/eclipse/jgit/diff/RenameDetector;->sameType(Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v29

    if-eqz v29, :cond_2

    .line 529
    sget-object v29, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-object/from16 v0, v29

    iput-object v0, v15, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 530
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    move-object/from16 v29, v0

    invoke-static {v15, v3}, Lorg/eclipse/jgit/diff/RenameDetector;->exactRename(Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v30

    invoke-interface/range {v29 .. v30}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 548
    .end local v15           #e:Lorg/eclipse/jgit/diff/DiffEntry;
    :goto_2
    const/16 v29, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_1

    .line 532
    .restart local v15       #e:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_2
    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 534
    .end local v15           #e:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_3
    if-eqz v10, :cond_5

    move-object/from16 v21, v10

    .line 537
    check-cast v21, Ljava/util/List;

    .line 538
    .local v21, list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    move-object/from16 v0, v21

    invoke-static {v3, v0}, Lorg/eclipse/jgit/diff/RenameDetector;->bestPathMatch(Lorg/eclipse/jgit/diff/DiffEntry;Ljava/util/List;)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v8

    .line 539
    .local v8, best:Lorg/eclipse/jgit/diff/DiffEntry;
    if-eqz v8, :cond_4

    .line 540
    sget-object v29, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-object/from16 v0, v29

    iput-object v0, v8, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 541
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    move-object/from16 v29, v0

    invoke-static {v8, v3}, Lorg/eclipse/jgit/diff/RenameDetector;->exactRename(Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v30

    invoke-interface/range {v29 .. v30}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 543
    :cond_4
    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 546
    .end local v8           #best:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v21           #list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    :cond_5
    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 551
    .end local v3           #a:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v10           #del:Ljava/lang/Object;
    :cond_6
    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    .end local v18           #i$:Ljava/util/Iterator;
    :cond_7
    :goto_3
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_11

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 552
    .local v7, adds:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    const/16 v29, 0x0

    move/from16 v0, v29

    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lorg/eclipse/jgit/diff/DiffEntry;

    move-object/from16 v0, v29

    iget-object v0, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    .line 553
    .restart local v25       #o:Ljava/lang/Object;
    move-object/from16 v0, v25

    instance-of v0, v0, Lorg/eclipse/jgit/diff/DiffEntry;

    move/from16 v29, v0

    if-eqz v29, :cond_b

    move-object/from16 v9, v25

    .line 557
    check-cast v9, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 558
    .local v9, d:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-static {v9, v7}, Lorg/eclipse/jgit/diff/RenameDetector;->bestPathMatch(Lorg/eclipse/jgit/diff/DiffEntry;Ljava/util/List;)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v8

    .line 559
    .restart local v8       #best:Lorg/eclipse/jgit/diff/DiffEntry;
    if-eqz v8, :cond_a

    .line 560
    sget-object v29, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-object/from16 v0, v29

    iput-object v0, v9, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 561
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    move-object/from16 v29, v0

    invoke-static {v9, v8}, Lorg/eclipse/jgit/diff/RenameDetector;->exactRename(Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v30

    invoke-interface/range {v29 .. v30}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 562
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    .local v19, i$:Ljava/util/Iterator;
    :cond_8
    :goto_4
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_7

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 563
    .restart local v3       #a:Lorg/eclipse/jgit/diff/DiffEntry;
    if-eq v3, v8, :cond_8

    .line 564
    iget-object v0, v9, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v29, v0

    iget-object v0, v3, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    move-object/from16 v30, v0

    invoke-static/range {v29 .. v30}, Lorg/eclipse/jgit/diff/RenameDetector;->sameType(Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v29

    if-eqz v29, :cond_9

    .line 565
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    move-object/from16 v29, v0

    invoke-static {v9, v3}, Lorg/eclipse/jgit/diff/RenameDetector;->exactCopy(Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v30

    invoke-interface/range {v29 .. v30}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 567
    :cond_9
    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 572
    .end local v3           #a:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v19           #i$:Ljava/util/Iterator;
    :cond_a
    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_3

    .line 574
    .end local v8           #best:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v9           #d:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_b
    if-eqz v25, :cond_10

    move-object/from16 v14, v25

    .line 578
    check-cast v14, Ljava/util/List;

    .line 579
    .local v14, dels:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v29

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v30

    mul-int v29, v29, v30

    move/from16 v0, v29

    new-array v0, v0, [J

    move-object/from16 v23, v0

    .line 580
    .local v23, matrix:[J
    const/16 v22, 0x0

    .line 581
    .local v22, mNext:I
    const/4 v11, 0x0

    .local v11, delIdx:I
    :goto_5
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v29

    move/from16 v0, v29

    if-ge v11, v0, :cond_d

    .line 582
    invoke-interface {v14, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lorg/eclipse/jgit/diff/DiffEntry;

    move-object/from16 v0, v29

    iget-object v13, v0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    .line 584
    .local v13, deletedName:Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, addIdx:I
    :goto_6
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v29

    move/from16 v0, v29

    if-ge v4, v0, :cond_c

    .line 585
    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lorg/eclipse/jgit/diff/DiffEntry;

    move-object/from16 v0, v29

    iget-object v6, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    .line 587
    .local v6, addedName:Ljava/lang/String;
    invoke-static {v6, v13}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->nameScore(Ljava/lang/String;Ljava/lang/String;)I

    move-result v26

    .line 588
    .local v26, score:I
    move/from16 v0, v26

    invoke-static {v0, v11, v4}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->encode(III)J

    move-result-wide v29

    aput-wide v29, v23, v22

    .line 589
    add-int/lit8 v22, v22, 0x1

    .line 584
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 581
    .end local v6           #addedName:Ljava/lang/String;
    .end local v26           #score:I
    :cond_c
    add-int/lit8 v11, v11, 0x1

    goto :goto_5

    .line 593
    .end local v4           #addIdx:I
    .end local v13           #deletedName:Ljava/lang/String;
    :cond_d
    invoke-static/range {v23 .. v23}, Ljava/util/Arrays;->sort([J)V

    .line 595
    add-int/lit8 v22, v22, -0x1

    :goto_7
    if-ltz v22, :cond_7

    .line 596
    aget-wide v16, v23, v22

    .line 597
    .local v16, ent:J
    invoke-static/range {v16 .. v17}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->srcFile(J)I

    move-result v11

    .line 598
    invoke-static/range {v16 .. v17}, Lorg/eclipse/jgit/diff/SimilarityRenameDetector;->dstFile(J)I

    move-result v4

    .line 599
    .restart local v4       #addIdx:I
    invoke-interface {v14, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 600
    .restart local v9       #d:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 602
    .restart local v3       #a:Lorg/eclipse/jgit/diff/DiffEntry;
    if-nez v3, :cond_e

    .line 603
    const/16 v29, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 595
    :goto_8
    add-int/lit8 v22, v22, -0x1

    goto :goto_7

    .line 608
    :cond_e
    iget-object v0, v9, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-object/from16 v29, v0

    sget-object v30, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    if-ne v0, v1, :cond_f

    .line 613
    sget-object v29, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-object/from16 v0, v29

    iput-object v0, v9, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 614
    sget-object v27, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 619
    .local v27, type:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    :goto_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    move-object/from16 v29, v0

    const/16 v30, 0x64

    move-object/from16 v0, v27

    move/from16 v1, v30

    invoke-static {v0, v9, v3, v1}, Lorg/eclipse/jgit/diff/DiffEntry;->pair(Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;I)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v30

    invoke-interface/range {v29 .. v30}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 620
    const/16 v29, 0x0

    move-object/from16 v0, v29

    invoke-interface {v7, v4, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 621
    const/16 v29, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_8

    .line 616
    .end local v27           #type:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    :cond_f
    sget-object v27, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .restart local v27       #type:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    goto :goto_9

    .line 624
    .end local v3           #a:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v4           #addIdx:I
    .end local v9           #d:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v11           #delIdx:I
    .end local v14           #dels:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    .end local v16           #ent:J
    .end local v22           #mNext:I
    .end local v23           #matrix:[J
    .end local v27           #type:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    :cond_10
    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_3

    .line 627
    .end local v7           #adds:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    .end local v25           #o:Ljava/lang/Object;
    :cond_11
    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    .line 629
    new-instance v29, Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/HashMap;->size()I

    move-result v30

    invoke-direct/range {v29 .. v30}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    .line 630
    invoke-virtual {v12}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v29

    invoke-interface/range {v29 .. v29}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :cond_12
    :goto_a
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_15

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v25

    .line 631
    .restart local v25       #o:Ljava/lang/Object;
    move-object/from16 v0, v25

    instance-of v0, v0, Lorg/eclipse/jgit/diff/DiffEntry;

    move/from16 v29, v0

    if-eqz v29, :cond_13

    move-object/from16 v15, v25

    .line 632
    check-cast v15, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 633
    .restart local v15       #e:Lorg/eclipse/jgit/diff/DiffEntry;
    iget-object v0, v15, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-object/from16 v29, v0

    sget-object v30, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    if-ne v0, v1, :cond_12

    .line 634
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-interface {v0, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .end local v15           #e:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_13
    move-object/from16 v21, v25

    .line 636
    check-cast v21, Ljava/util/List;

    .line 637
    .restart local v21       #list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    invoke-interface/range {v21 .. v21}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v19

    .restart local v19       #i$:Ljava/util/Iterator;
    :cond_14
    :goto_b
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_12

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 638
    .restart local v15       #e:Lorg/eclipse/jgit/diff/DiffEntry;
    iget-object v0, v15, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-object/from16 v29, v0

    sget-object v30, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    if-ne v0, v1, :cond_14

    .line 639
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-interface {v0, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_b

    .line 643
    .end local v15           #e:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v19           #i$:Ljava/util/Iterator;
    .end local v21           #list:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    .end local v25           #o:Ljava/lang/Object;
    :cond_15
    invoke-interface/range {p1 .. p1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 644
    return-void
.end method

.method private static id(Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 2
    .parameter "de"

    .prologue
    .line 706
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    goto :goto_0
.end method

.method private static mode(Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/FileMode;
    .locals 2
    .parameter "de"

    .prologue
    .line 702
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_0
.end method

.method private static path(Lorg/eclipse/jgit/diff/DiffEntry;)Ljava/lang/String;
    .locals 2
    .parameter "de"

    .prologue
    .line 698
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    goto :goto_0
.end method

.method private populateMap(Ljava/util/List;Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/HashMap;
    .locals 6
    .parameter
    .parameter "pm"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Lorg/eclipse/jgit/lib/AbbreviatedObjectId;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 679
    .local p1, diffEntries:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 680
    .local v3, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Lorg/eclipse/jgit/lib/AbbreviatedObjectId;Ljava/lang/Object;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 681
    .local v0, de:Lorg/eclipse/jgit/diff/DiffEntry;
    invoke-static {v0}, Lorg/eclipse/jgit/diff/RenameDetector;->id(Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v5

    invoke-virtual {v3, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 682
    .local v4, old:Ljava/lang/Object;
    instance-of v5, v4, Lorg/eclipse/jgit/diff/DiffEntry;

    if-eqz v5, :cond_1

    .line 683
    new-instance v2, Ljava/util/ArrayList;

    const/4 v5, 0x2

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 684
    .local v2, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    check-cast v4, Lorg/eclipse/jgit/diff/DiffEntry;

    .end local v4           #old:Ljava/lang/Object;
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 685
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 686
    invoke-static {v0}, Lorg/eclipse/jgit/diff/RenameDetector;->id(Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v5

    invoke-virtual {v3, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 692
    .end local v2           #list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    :cond_0
    :goto_1
    const/4 v5, 0x1

    invoke-interface {p2, v5}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_0

    .line 687
    .restart local v4       #old:Ljava/lang/Object;
    :cond_1
    if-eqz v4, :cond_0

    move-object v5, v4

    .line 689
    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 690
    invoke-static {v0}, Lorg/eclipse/jgit/diff/RenameDetector;->id(Lorg/eclipse/jgit/diff/DiffEntry;)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v5

    invoke-virtual {v3, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 694
    .end local v0           #de:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v4           #old:Ljava/lang/Object;
    :cond_2
    return-object v3
.end method

.method private rejoinModifies(Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 9
    .parameter "pm"

    .prologue
    const/4 v8, 0x1

    .line 430
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 431
    .local v2, nameMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lorg/eclipse/jgit/diff/DiffEntry;>;"
    new-instance v3, Ljava/util/ArrayList;

    iget-object v5, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 433
    .local v3, newAdded:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->renamesRejoiningModifies:Ljava/lang/String;

    iget-object v6, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    iget-object v7, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    add-int/2addr v6, v7

    invoke-interface {p1, v5, v6}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 436
    iget-object v5, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 437
    .local v4, src:Lorg/eclipse/jgit/diff/DiffEntry;
    iget-object v5, v4, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    invoke-virtual {v2, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    invoke-interface {p1, v8}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_0

    .line 441
    .end local v4           #src:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 442
    .local v0, dst:Lorg/eclipse/jgit/diff/DiffEntry;
    iget-object v5, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newPath:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 443
    .restart local v4       #src:Lorg/eclipse/jgit/diff/DiffEntry;
    if-eqz v4, :cond_2

    .line 444
    iget-object v5, v4, Lorg/eclipse/jgit/diff/DiffEntry;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    iget-object v6, v0, Lorg/eclipse/jgit/diff/DiffEntry;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    invoke-static {v5, v6}, Lorg/eclipse/jgit/diff/RenameDetector;->sameType(Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 445
    iget-object v5, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    sget-object v6, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iget v7, v4, Lorg/eclipse/jgit/diff/DiffEntry;->score:I

    invoke-static {v6, v4, v0, v7}, Lorg/eclipse/jgit/diff/DiffEntry;->pair(Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;Lorg/eclipse/jgit/diff/DiffEntry;Lorg/eclipse/jgit/diff/DiffEntry;I)Lorg/eclipse/jgit/diff/DiffEntry;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 454
    :goto_2
    invoke-interface {p1, v8}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_1

    .line 448
    :cond_1
    iget-object v5, v4, Lorg/eclipse/jgit/diff/DiffEntry;->oldPath:Ljava/lang/String;

    invoke-virtual {v2, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 449
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 452
    :cond_2
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 457
    .end local v0           #dst:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v4           #src:Lorg/eclipse/jgit/diff/DiffEntry;
    :cond_3
    iput-object v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    .line 458
    new-instance v5, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v5, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    .line 459
    return-void
.end method

.method static sameType(Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/FileMode;)Z
    .locals 4
    .parameter "a"
    .parameter "b"

    .prologue
    const v3, 0xf000

    .line 714
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v2

    and-int v0, v2, v3

    .line 715
    .local v0, aType:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/FileMode;->getBits()I

    move-result v2

    and-int v1, v2, v3

    .line 716
    .local v1, bType:I
    if-ne v0, v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/diff/DiffEntry;)V
    .locals 1
    .parameter "entry"

    .prologue
    .line 294
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/diff/RenameDetector;->addAll(Ljava/util/Collection;)V

    .line 295
    return-void
.end method

.method public addAll(Ljava/util/Collection;)V
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 254
    .local p1, entriesToAdd:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    iget-boolean v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->done:Z

    if-eqz v3, :cond_0

    .line 255
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->renamesAlreadyFound:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 257
    :cond_0
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/DiffEntry;

    .line 258
    .local v0, entry:Lorg/eclipse/jgit/diff/DiffEntry;
    sget-object v3, Lorg/eclipse/jgit/diff/RenameDetector$2;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffEntry;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 280
    iget-object v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 260
    :pswitch_0
    iget-object v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 264
    :pswitch_1
    iget-object v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 268
    :pswitch_2
    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffEntry;->getOldMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v3

    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/DiffEntry;->getNewMode()Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/eclipse/jgit/diff/RenameDetector;->sameType(Lorg/eclipse/jgit/lib/FileMode;Lorg/eclipse/jgit/lib/FileMode;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 269
    iget-object v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 271
    :cond_1
    invoke-static {v0}, Lorg/eclipse/jgit/diff/DiffEntry;->breakModify(Lorg/eclipse/jgit/diff/DiffEntry;)Ljava/util/List;

    move-result-object v2

    .line 272
    .local v2, tmp:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    iget-object v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 273
    iget-object v3, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    const/4 v4, 0x1

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 283
    .end local v0           #entry:Lorg/eclipse/jgit/diff/DiffEntry;
    .end local v2           #tmp:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/diff/DiffEntry;>;"
    :cond_2
    return-void

    .line 258
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public compute()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    sget-object v0, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/diff/RenameDetector;->compute(Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public compute(Lorg/eclipse/jgit/diff/ContentSource$Pair;Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/List;
    .locals 3
    .parameter "reader"
    .parameter "pm"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/ContentSource$Pair;",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 364
    iget-boolean v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->done:Z

    if-nez v0, :cond_5

    .line 365
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->done:Z

    .line 367
    if-nez p2, :cond_0

    .line 368
    sget-object p2, Lorg/eclipse/jgit/lib/NullProgressMonitor;->INSTANCE:Lorg/eclipse/jgit/lib/NullProgressMonitor;

    .line 370
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->breakScore:I

    if-lez v0, :cond_1

    .line 371
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/diff/RenameDetector;->breakModifies(Lorg/eclipse/jgit/diff/ContentSource$Pair;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 373
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 374
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/diff/RenameDetector;->findExactRenames(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 376
    :cond_2
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 377
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/diff/RenameDetector;->findContentRenames(Lorg/eclipse/jgit/diff/ContentSource$Pair;Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 379
    :cond_3
    iget v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->breakScore:I

    if-lez v0, :cond_4

    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 380
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/diff/RenameDetector;->rejoinModifies(Lorg/eclipse/jgit/lib/ProgressMonitor;)V

    .line 382
    :cond_4
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 383
    iput-object v2, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    .line 385
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 386
    iput-object v2, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    .line 388
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    sget-object v1, Lorg/eclipse/jgit/diff/RenameDetector;->DIFF_COMPARATOR:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 390
    :cond_5
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public compute(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/List;
    .locals 2
    .parameter "reader"
    .parameter "pm"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ObjectReader;",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 346
    invoke-static {p1}, Lorg/eclipse/jgit/diff/ContentSource;->create(Lorg/eclipse/jgit/lib/ObjectReader;)Lorg/eclipse/jgit/diff/ContentSource;

    move-result-object v0

    .line 347
    .local v0, cs:Lorg/eclipse/jgit/diff/ContentSource;
    new-instance v1, Lorg/eclipse/jgit/diff/ContentSource$Pair;

    invoke-direct {v1, v0, v0}, Lorg/eclipse/jgit/diff/ContentSource$Pair;-><init>(Lorg/eclipse/jgit/diff/ContentSource;Lorg/eclipse/jgit/diff/ContentSource;)V

    invoke-virtual {p0, v1, p2}, Lorg/eclipse/jgit/diff/RenameDetector;->compute(Lorg/eclipse/jgit/diff/ContentSource$Pair;Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public compute(Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/List;
    .locals 2
    .parameter "pm"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/ProgressMonitor;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/diff/DiffEntry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 322
    iget-boolean v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->done:Z

    if-nez v0, :cond_0

    .line 324
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->objectReader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {p0, v0, p1}, Lorg/eclipse/jgit/diff/RenameDetector;->compute(Lorg/eclipse/jgit/lib/ObjectReader;Lorg/eclipse/jgit/lib/ProgressMonitor;)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 326
    iget-object v1, p0, Lorg/eclipse/jgit/diff/RenameDetector;->objectReader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    .line 329
    :goto_0
    return-object v0

    .line 326
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/eclipse/jgit/diff/RenameDetector;->objectReader:Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectReader;->release()V

    throw v0

    .line 329
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getBreakScore()I
    .locals 1

    .prologue
    .line 193
    iget v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->breakScore:I

    return v0
.end method

.method public getRenameLimit()I
    .locals 1

    .prologue
    .line 210
    iget v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->renameLimit:I

    return v0
.end method

.method public getRenameScore()I
    .locals 1

    .prologue
    .line 162
    iget v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->renameScore:I

    return v0
.end method

.method public isOverRenameLimit()Z
    .locals 3

    .prologue
    .line 239
    iget-boolean v1, p0, Lorg/eclipse/jgit/diff/RenameDetector;->done:Z

    if-eqz v1, :cond_0

    .line 240
    iget-boolean v1, p0, Lorg/eclipse/jgit/diff/RenameDetector;->overRenameLimit:Z

    .line 242
    :goto_0
    return v1

    .line 241
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 242
    .local v0, cnt:I
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/RenameDetector;->getRenameLimit()I

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/RenameDetector;->getRenameLimit()I

    move-result v1

    if-ge v1, v0, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 395
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->entries:Ljava/util/List;

    .line 396
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->deleted:Ljava/util/List;

    .line 397
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->added:Ljava/util/List;

    .line 398
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/diff/RenameDetector;->done:Z

    .line 399
    return-void
.end method

.method public setBreakScore(I)V
    .locals 0
    .parameter "breakScore"

    .prologue
    .line 205
    iput p1, p0, Lorg/eclipse/jgit/diff/RenameDetector;->breakScore:I

    .line 206
    return-void
.end method

.method public setRenameLimit(I)V
    .locals 0
    .parameter "limit"

    .prologue
    .line 225
    iput p1, p0, Lorg/eclipse/jgit/diff/RenameDetector;->renameLimit:I

    .line 226
    return-void
.end method

.method public setRenameScore(I)V
    .locals 2
    .parameter "score"

    .prologue
    .line 179
    if-ltz p1, :cond_0

    const/16 v0, 0x64

    if-le p1, v0, :cond_1

    .line 180
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->similarityScoreMustBeWithinBounds:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 182
    :cond_1
    iput p1, p0, Lorg/eclipse/jgit/diff/RenameDetector;->renameScore:I

    .line 183
    return-void
.end method
