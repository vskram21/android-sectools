.class public abstract Lorg/eclipse/jgit/diff/LowLevelDiffAlgorithm;
.super Lorg/eclipse/jgit/diff/DiffAlgorithm;
.source "LowLevelDiffAlgorithm.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/DiffAlgorithm;-><init>()V

    return-void
.end method


# virtual methods
.method public diffNonCommon(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/EditList;
    .locals 9
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">(",
            "Lorg/eclipse/jgit/diff/SequenceComparator",
            "<-TS;>;TS;TS;)",
            "Lorg/eclipse/jgit/diff/EditList;"
        }
    .end annotation

    .prologue
    .local p1, cmp:Lorg/eclipse/jgit/diff/SequenceComparator;,"Lorg/eclipse/jgit/diff/SequenceComparator<-TS;>;"
    .local p2, a:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    .local p3, b:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    const/4 v8, 0x0

    .line 51
    new-instance v6, Lorg/eclipse/jgit/diff/HashedSequencePair;

    invoke-direct {v6, p1, p2, p3}, Lorg/eclipse/jgit/diff/HashedSequencePair;-><init>(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)V

    .line 52
    .local v6, p:Lorg/eclipse/jgit/diff/HashedSequencePair;,"Lorg/eclipse/jgit/diff/HashedSequencePair<TS;>;"
    invoke-virtual {v6}, Lorg/eclipse/jgit/diff/HashedSequencePair;->getComparator()Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    move-result-object v2

    .line 53
    .local v2, hc:Lorg/eclipse/jgit/diff/HashedSequenceComparator;,"Lorg/eclipse/jgit/diff/HashedSequenceComparator<TS;>;"
    invoke-virtual {v6}, Lorg/eclipse/jgit/diff/HashedSequencePair;->getA()Lorg/eclipse/jgit/diff/HashedSequence;

    move-result-object v3

    .line 54
    .local v3, ha:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    invoke-virtual {v6}, Lorg/eclipse/jgit/diff/HashedSequencePair;->getB()Lorg/eclipse/jgit/diff/HashedSequence;

    move-result-object v4

    .line 55
    .local v4, hb:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    const/4 v6, 0x0

    .line 57
    new-instance v1, Lorg/eclipse/jgit/diff/EditList;

    invoke-direct {v1}, Lorg/eclipse/jgit/diff/EditList;-><init>()V

    .line 58
    .local v1, res:Lorg/eclipse/jgit/diff/EditList;
    new-instance v5, Lorg/eclipse/jgit/diff/Edit;

    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v0

    invoke-virtual {p3}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v7

    invoke-direct {v5, v8, v0, v8, v7}, Lorg/eclipse/jgit/diff/Edit;-><init>(IIII)V

    .local v5, region:Lorg/eclipse/jgit/diff/Edit;
    move-object v0, p0

    .line 59
    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/diff/LowLevelDiffAlgorithm;->diffNonCommon(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/Edit;)V

    .line 60
    return-object v1
.end method

.method public abstract diffNonCommon(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/Edit;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Lorg/eclipse/jgit/diff/Sequence;",
            ">(",
            "Lorg/eclipse/jgit/diff/EditList;",
            "Lorg/eclipse/jgit/diff/HashedSequenceComparator",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;",
            "Lorg/eclipse/jgit/diff/Edit;",
            ")V"
        }
    .end annotation
.end method
