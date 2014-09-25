.class public Lorg/eclipse/jgit/diff/HashedSequencePair;
.super Ljava/lang/Object;
.source "HashedSequencePair.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/eclipse/jgit/diff/Sequence;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final baseA:Lorg/eclipse/jgit/diff/Sequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field private final baseB:Lorg/eclipse/jgit/diff/Sequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field private cachedA:Lorg/eclipse/jgit/diff/HashedSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;"
        }
    .end annotation
.end field

.field private cachedB:Lorg/eclipse/jgit/diff/HashedSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;"
        }
    .end annotation
.end field

.field private final cmp:Lorg/eclipse/jgit/diff/SequenceComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/SequenceComparator",
            "<-TS;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/diff/SequenceComparator;Lorg/eclipse/jgit/diff/Sequence;Lorg/eclipse/jgit/diff/Sequence;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/SequenceComparator",
            "<-TS;>;TS;TS;)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequencePair;,"Lorg/eclipse/jgit/diff/HashedSequencePair<TS;>;"
    .local p1, cmp:Lorg/eclipse/jgit/diff/SequenceComparator;,"Lorg/eclipse/jgit/diff/SequenceComparator<-TS;>;"
    .local p2, a:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    .local p3, b:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->cmp:Lorg/eclipse/jgit/diff/SequenceComparator;

    .line 78
    iput-object p2, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->baseA:Lorg/eclipse/jgit/diff/Sequence;

    .line 79
    iput-object p3, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->baseB:Lorg/eclipse/jgit/diff/Sequence;

    .line 80
    return-void
.end method

.method private wrap(Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/HashedSequence;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 102
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequencePair;,"Lorg/eclipse/jgit/diff/HashedSequencePair<TS;>;"
    .local p1, base:Lorg/eclipse/jgit/diff/Sequence;,"TS;"
    invoke-virtual {p1}, Lorg/eclipse/jgit/diff/Sequence;->size()I

    move-result v0

    .line 103
    .local v0, end:I
    new-array v1, v0, [I

    .line 104
    .local v1, hashes:[I
    const/4 v2, 0x0

    .local v2, ptr:I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 105
    iget-object v3, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->cmp:Lorg/eclipse/jgit/diff/SequenceComparator;

    invoke-virtual {v3, p1, v2}, Lorg/eclipse/jgit/diff/SequenceComparator;->hash(Lorg/eclipse/jgit/diff/Sequence;I)I

    move-result v3

    aput v3, v1, v2

    .line 104
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 106
    :cond_0
    new-instance v3, Lorg/eclipse/jgit/diff/HashedSequence;

    invoke-direct {v3, p1, v1}, Lorg/eclipse/jgit/diff/HashedSequence;-><init>(Lorg/eclipse/jgit/diff/Sequence;[I)V

    return-object v3
.end method


# virtual methods
.method public getA()Lorg/eclipse/jgit/diff/HashedSequence;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 89
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequencePair;,"Lorg/eclipse/jgit/diff/HashedSequencePair<TS;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->cachedA:Lorg/eclipse/jgit/diff/HashedSequence;

    if-nez v0, :cond_0

    .line 90
    iget-object v0, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->baseA:Lorg/eclipse/jgit/diff/Sequence;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/diff/HashedSequencePair;->wrap(Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/HashedSequence;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->cachedA:Lorg/eclipse/jgit/diff/HashedSequence;

    .line 91
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->cachedA:Lorg/eclipse/jgit/diff/HashedSequence;

    return-object v0
.end method

.method public getB()Lorg/eclipse/jgit/diff/HashedSequence;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 96
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequencePair;,"Lorg/eclipse/jgit/diff/HashedSequencePair<TS;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->cachedB:Lorg/eclipse/jgit/diff/HashedSequence;

    if-nez v0, :cond_0

    .line 97
    iget-object v0, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->baseB:Lorg/eclipse/jgit/diff/Sequence;

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/diff/HashedSequencePair;->wrap(Lorg/eclipse/jgit/diff/Sequence;)Lorg/eclipse/jgit/diff/HashedSequence;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->cachedB:Lorg/eclipse/jgit/diff/HashedSequence;

    .line 98
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->cachedB:Lorg/eclipse/jgit/diff/HashedSequence;

    return-object v0
.end method

.method public getComparator()Lorg/eclipse/jgit/diff/HashedSequenceComparator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/eclipse/jgit/diff/HashedSequenceComparator",
            "<TS;>;"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequencePair;,"Lorg/eclipse/jgit/diff/HashedSequencePair<TS;>;"
    new-instance v0, Lorg/eclipse/jgit/diff/HashedSequenceComparator;

    iget-object v1, p0, Lorg/eclipse/jgit/diff/HashedSequencePair;->cmp:Lorg/eclipse/jgit/diff/SequenceComparator;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/diff/HashedSequenceComparator;-><init>(Lorg/eclipse/jgit/diff/SequenceComparator;)V

    return-object v0
.end method
