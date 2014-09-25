.class public final Lorg/eclipse/jgit/diff/SubsequenceComparator;
.super Lorg/eclipse/jgit/diff/SequenceComparator;
.source "SubsequenceComparator.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/eclipse/jgit/diff/Sequence;",
        ">",
        "Lorg/eclipse/jgit/diff/SequenceComparator",
        "<",
        "Lorg/eclipse/jgit/diff/Subsequence",
        "<TS;>;>;"
    }
.end annotation


# instance fields
.field private final cmp:Lorg/eclipse/jgit/diff/SequenceComparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/diff/SequenceComparator",
            "<-TS;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/diff/SequenceComparator;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/SequenceComparator",
            "<-TS;>;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, this:Lorg/eclipse/jgit/diff/SubsequenceComparator;,"Lorg/eclipse/jgit/diff/SubsequenceComparator<TS;>;"
    .local p1, cmp:Lorg/eclipse/jgit/diff/SequenceComparator;,"Lorg/eclipse/jgit/diff/SequenceComparator<-TS;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/SequenceComparator;-><init>()V

    .line 67
    iput-object p1, p0, Lorg/eclipse/jgit/diff/SubsequenceComparator;->cmp:Lorg/eclipse/jgit/diff/SequenceComparator;

    .line 68
    return-void
.end method


# virtual methods
.method public bridge synthetic equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 56
    .local p0, this:Lorg/eclipse/jgit/diff/SubsequenceComparator;,"Lorg/eclipse/jgit/diff/SubsequenceComparator<TS;>;"
    check-cast p1, Lorg/eclipse/jgit/diff/Subsequence;

    .end local p1
    check-cast p3, Lorg/eclipse/jgit/diff/Subsequence;

    .end local p3
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/diff/SubsequenceComparator;->equals(Lorg/eclipse/jgit/diff/Subsequence;ILorg/eclipse/jgit/diff/Subsequence;I)Z

    move-result v0

    return v0
.end method

.method public equals(Lorg/eclipse/jgit/diff/Subsequence;ILorg/eclipse/jgit/diff/Subsequence;I)Z
    .locals 5
    .parameter
    .parameter "ai"
    .parameter
    .parameter "bi"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/Subsequence",
            "<TS;>;I",
            "Lorg/eclipse/jgit/diff/Subsequence",
            "<TS;>;I)Z"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, this:Lorg/eclipse/jgit/diff/SubsequenceComparator;,"Lorg/eclipse/jgit/diff/SubsequenceComparator<TS;>;"
    .local p1, a:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    .local p3, b:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/diff/SubsequenceComparator;->cmp:Lorg/eclipse/jgit/diff/SequenceComparator;

    iget-object v1, p1, Lorg/eclipse/jgit/diff/Subsequence;->base:Lorg/eclipse/jgit/diff/Sequence;

    iget v2, p1, Lorg/eclipse/jgit/diff/Subsequence;->begin:I

    add-int/2addr v2, p2

    iget-object v3, p3, Lorg/eclipse/jgit/diff/Subsequence;->base:Lorg/eclipse/jgit/diff/Sequence;

    iget v4, p3, Lorg/eclipse/jgit/diff/Subsequence;->begin:I

    add-int/2addr v4, p4

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/diff/SequenceComparator;->equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic hash(Lorg/eclipse/jgit/diff/Sequence;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 56
    .local p0, this:Lorg/eclipse/jgit/diff/SubsequenceComparator;,"Lorg/eclipse/jgit/diff/SubsequenceComparator<TS;>;"
    check-cast p1, Lorg/eclipse/jgit/diff/Subsequence;

    .end local p1
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/SubsequenceComparator;->hash(Lorg/eclipse/jgit/diff/Subsequence;I)I

    move-result v0

    return v0
.end method

.method public hash(Lorg/eclipse/jgit/diff/Subsequence;I)I
    .locals 3
    .parameter
    .parameter "ptr"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/Subsequence",
            "<TS;>;I)I"
        }
    .end annotation

    .prologue
    .line 77
    .local p0, this:Lorg/eclipse/jgit/diff/SubsequenceComparator;,"Lorg/eclipse/jgit/diff/SubsequenceComparator<TS;>;"
    .local p1, seq:Lorg/eclipse/jgit/diff/Subsequence;,"Lorg/eclipse/jgit/diff/Subsequence<TS;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/diff/SubsequenceComparator;->cmp:Lorg/eclipse/jgit/diff/SequenceComparator;

    iget-object v1, p1, Lorg/eclipse/jgit/diff/Subsequence;->base:Lorg/eclipse/jgit/diff/Sequence;

    iget v2, p1, Lorg/eclipse/jgit/diff/Subsequence;->begin:I

    add-int/2addr v2, p2

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/diff/SequenceComparator;->hash(Lorg/eclipse/jgit/diff/Sequence;I)I

    move-result v0

    return v0
.end method
