.class public Lorg/eclipse/jgit/diff/HistogramDiff;
.super Lorg/eclipse/jgit/diff/LowLevelDiffAlgorithm;
.source "HistogramDiff.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/diff/HistogramDiff$1;,
        Lorg/eclipse/jgit/diff/HistogramDiff$State;
    }
.end annotation


# instance fields
.field private fallback:Lorg/eclipse/jgit/diff/DiffAlgorithm;

.field private maxChainLength:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/LowLevelDiffAlgorithm;-><init>()V

    .line 94
    sget-object v0, Lorg/eclipse/jgit/diff/MyersDiff;->INSTANCE:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    iput-object v0, p0, Lorg/eclipse/jgit/diff/HistogramDiff;->fallback:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    .line 103
    const/16 v0, 0x40

    iput v0, p0, Lorg/eclipse/jgit/diff/HistogramDiff;->maxChainLength:I

    .line 136
    return-void
.end method

.method static synthetic access$000(Lorg/eclipse/jgit/diff/HistogramDiff;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget v0, p0, Lorg/eclipse/jgit/diff/HistogramDiff;->maxChainLength:I

    return v0
.end method

.method static synthetic access$100(Lorg/eclipse/jgit/diff/HistogramDiff;)Lorg/eclipse/jgit/diff/DiffAlgorithm;
    .locals 1
    .parameter "x0"

    .prologue
    .line 92
    iget-object v0, p0, Lorg/eclipse/jgit/diff/HistogramDiff;->fallback:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    return-object v0
.end method


# virtual methods
.method public diffNonCommon(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/Edit;)V
    .locals 6
    .parameter "edits"
    .parameter
    .parameter
    .parameter
    .parameter "region"
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

    .prologue
    .line 133
    .local p2, cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;,"Lorg/eclipse/jgit/diff/HashedSequenceComparator<TS;>;"
    .local p3, a:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    .local p4, b:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    new-instance v0, Lorg/eclipse/jgit/diff/HistogramDiff$State;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/eclipse/jgit/diff/HistogramDiff$State;-><init>(Lorg/eclipse/jgit/diff/HistogramDiff;Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;)V

    invoke-virtual {v0, p5}, Lorg/eclipse/jgit/diff/HistogramDiff$State;->diffReplace(Lorg/eclipse/jgit/diff/Edit;)V

    .line 134
    return-void
.end method

.method public setFallbackAlgorithm(Lorg/eclipse/jgit/diff/DiffAlgorithm;)V
    .locals 0
    .parameter "alg"

    .prologue
    .line 113
    iput-object p1, p0, Lorg/eclipse/jgit/diff/HistogramDiff;->fallback:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    .line 114
    return-void
.end method

.method public setMaxChainLength(I)V
    .locals 0
    .parameter "maxLen"

    .prologue
    .line 127
    iput p1, p0, Lorg/eclipse/jgit/diff/HistogramDiff;->maxChainLength:I

    .line 128
    return-void
.end method
