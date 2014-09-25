.class final Lorg/eclipse/jgit/diff/MyersDiff$1;
.super Lorg/eclipse/jgit/diff/LowLevelDiffAlgorithm;
.source "MyersDiff.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/diff/MyersDiff;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 114
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/LowLevelDiffAlgorithm;-><init>()V

    return-void
.end method


# virtual methods
.method public diffNonCommon(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/Edit;)V
    .locals 7
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
    .line 119
    .local p2, cmp:Lorg/eclipse/jgit/diff/HashedSequenceComparator;,"Lorg/eclipse/jgit/diff/HashedSequenceComparator<TS;>;"
    .local p3, a:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    .local p4, b:Lorg/eclipse/jgit/diff/HashedSequence;,"Lorg/eclipse/jgit/diff/HashedSequence<TS;>;"
    new-instance v0, Lorg/eclipse/jgit/diff/MyersDiff;

    const/4 v6, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jgit/diff/MyersDiff;-><init>(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/diff/HashedSequenceComparator;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/HashedSequence;Lorg/eclipse/jgit/diff/Edit;Lorg/eclipse/jgit/diff/MyersDiff$1;)V

    .line 120
    return-void
.end method
