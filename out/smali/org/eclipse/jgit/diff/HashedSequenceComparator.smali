.class public final Lorg/eclipse/jgit/diff/HashedSequenceComparator;
.super Lorg/eclipse/jgit/diff/SequenceComparator;
.source "HashedSequenceComparator.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Lorg/eclipse/jgit/diff/Sequence;",
        ">",
        "Lorg/eclipse/jgit/diff/SequenceComparator",
        "<",
        "Lorg/eclipse/jgit/diff/HashedSequence",
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
.method constructor <init>(Lorg/eclipse/jgit/diff/SequenceComparator;)V
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
    .line 62
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequenceComparator;,"Lorg/eclipse/jgit/diff/HashedSequenceComparator<TS;>;"
    .local p1, cmp:Lorg/eclipse/jgit/diff/SequenceComparator;,"Lorg/eclipse/jgit/diff/SequenceComparator<-TS;>;"
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/SequenceComparator;-><init>()V

    .line 63
    iput-object p1, p0, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->cmp:Lorg/eclipse/jgit/diff/SequenceComparator;

    .line 64
    return-void
.end method


# virtual methods
.method public equals(Lorg/eclipse/jgit/diff/HashedSequence;ILorg/eclipse/jgit/diff/HashedSequence;I)Z
    .locals 3
    .parameter
    .parameter "ai"
    .parameter
    .parameter "bi"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;I",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;I)Z"
        }
    .end annotation

    .prologue
    .line 69
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequenceComparator;,"Lorg/eclipse/jgit/diff/HashedSequenceComparator<TS;>;"
    .local p1, a:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    .local p3, b:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    iget-object v0, p1, Lorg/eclipse/jgit/diff/HashedSequence;->hashes:[I

    aget v0, v0, p2

    iget-object v1, p3, Lorg/eclipse/jgit/diff/HashedSequence;->hashes:[I

    aget v1, v1, p4

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->cmp:Lorg/eclipse/jgit/diff/SequenceComparator;

    iget-object v1, p1, Lorg/eclipse/jgit/diff/HashedSequence;->base:Lorg/eclipse/jgit/diff/Sequence;

    iget-object v2, p3, Lorg/eclipse/jgit/diff/HashedSequence;->base:Lorg/eclipse/jgit/diff/Sequence;

    invoke-virtual {v0, v1, p2, v2, p4}, Lorg/eclipse/jgit/diff/SequenceComparator;->equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic equals(Lorg/eclipse/jgit/diff/Sequence;ILorg/eclipse/jgit/diff/Sequence;I)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 58
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequenceComparator;,"Lorg/eclipse/jgit/diff/HashedSequenceComparator<TS;>;"
    check-cast p1, Lorg/eclipse/jgit/diff/HashedSequence;

    .end local p1
    check-cast p3, Lorg/eclipse/jgit/diff/HashedSequence;

    .end local p3
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->equals(Lorg/eclipse/jgit/diff/HashedSequence;ILorg/eclipse/jgit/diff/HashedSequence;I)Z

    move-result v0

    return v0
.end method

.method public hash(Lorg/eclipse/jgit/diff/HashedSequence;I)I
    .locals 1
    .parameter
    .parameter "ptr"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/diff/HashedSequence",
            "<TS;>;I)I"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequenceComparator;,"Lorg/eclipse/jgit/diff/HashedSequenceComparator<TS;>;"
    .local p1, seq:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    iget-object v0, p1, Lorg/eclipse/jgit/diff/HashedSequence;->hashes:[I

    aget v0, v0, p2

    return v0
.end method

.method public bridge synthetic hash(Lorg/eclipse/jgit/diff/Sequence;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 58
    .local p0, this:Lorg/eclipse/jgit/diff/HashedSequenceComparator;,"Lorg/eclipse/jgit/diff/HashedSequenceComparator<TS;>;"
    check-cast p1, Lorg/eclipse/jgit/diff/HashedSequence;

    .end local p1
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/diff/HashedSequenceComparator;->hash(Lorg/eclipse/jgit/diff/HashedSequence;I)I

    move-result v0

    return v0
.end method
